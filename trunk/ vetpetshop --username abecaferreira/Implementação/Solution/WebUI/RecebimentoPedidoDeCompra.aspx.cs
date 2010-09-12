using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Negocios;
using Entidade;

namespace WebUI
{
    public partial class RecebimentoPedidoDeCompra : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            int tipoUser = (int)Session["tipoUser"];

            #region Criação de Menu Admin
            if (tipoUser == 1)
            {
                Menu menu = (Menu)Page.Master.FindControl("Menu1");
                SiteMapDataSource siteAdmin = (SiteMapDataSource)Page.Master.FindControl("adm");
                menu.DataSource = siteAdmin;
                menu.DataBind();
            }
            #endregion

            #region Criação de Menu Vend
            if (tipoUser == 3)
            {
                Menu menu = (Menu)Page.Master.FindControl("Menu1");
                SiteMapDataSource siteAdmin = (SiteMapDataSource)Page.Master.FindControl("vend");
                menu.DataSource = siteAdmin;
                menu.DataBind();
            }
            #endregion

            string idPedido = Request.Params["pedido"];

            Session["idPed"] = Convert.ToInt32(idPedido);
            NotaFiscalBuss notaBuss = new NotaFiscalBuss();
            UsuarioBuss usuarioBuss = new UsuarioBuss();
            List<RelProdutoNotaFiscal> rel = new List<RelProdutoNotaFiscal>();

            NotaFiscal nota = new NotaFiscal();
            Usuario usuario = new Usuario();

            nota = notaBuss.ObterPedidoById(Convert.ToInt32(idPedido));
            //usuario = usuarioBuss.ObterUsuarioPorId(nota.idUsuario);
            rel = notaBuss.ListarRelProdutoNotaFiscalByIdPedido(Convert.ToInt32(idPedido));

            if (!IsPostBack)
            {
                ListarStatusPedido();
                //ddlStatus.SelectedIndex = ddlStatus.Items.IndexOf(ddlStatus.Items.FindByValue(nota.Status.ToString()));
                //ddlStatus.Items.FindByValue(nota.Status.ToString()).Selected = true;

                //if (ddlStatus.SelectedItem.Value == "2")
                //    btnOk.Text = "Alterar Status de Pedido";
                //else
                //    btnOk.Text = "Registrar Recebimento de Pedido";
            }

            lblCodigo.Text = idPedido;
            lblData.Text = nota.DataCadastro.ToString("dd/MM/yyyy");
            lblTotal.Text = nota.Valor.ToString();

            if (nota.Status == 1)
                lblStatus.Text = "À Receber";
            else
                lblStatus.Text = "Recebida";
            

            PreencherTabela(rel);
        }

        private void ListarStatusPedido()
        {
            NotaFiscal nota = new NotaFiscal();
            NotaFiscalBuss notaBuss = new NotaFiscalBuss();
            int idPedido = (int)Session["idPed"];

            ListItem li0 = new ListItem("À Receber", "1");
            ListItem li1 = new ListItem("Recebida", "2");

            nota = notaBuss.ObterPedidoById(Convert.ToInt32(idPedido));

            if (nota.Status == 1)
            {
                ddlStatus.Items.Add(li1);
                btnOk.Text = "Registrar Recebimento de Pedido";
            }
            else
            {
                ddlStatus.Items.Add(li0);
                btnOk.Text = "Alterar Status de Pedido"; 
            }

            //ddlStatus.Items.Add(li0);
            //ddlStatus.Items.Add(li1);
        }

        private DataTable TabelaProdutos()
        {
            DataTable _tabela = new DataTable();

            DataColumn coluna0 = new DataColumn("id_produto");
            DataColumn coluna1 = new DataColumn("nm_produto");
            DataColumn coluna3 = new DataColumn("valunit");
            DataColumn coluna2 = new DataColumn("quant");
            DataColumn coluna4 = new DataColumn("valor");

            _tabela.Columns.Add(coluna0);
            _tabela.Columns.Add(coluna1);
            _tabela.Columns.Add(coluna2);
            _tabela.Columns.Add(coluna3);
            _tabela.Columns.Add(coluna4);

            return _tabela;
        }

        private void PreencherTabela(List<RelProdutoNotaFiscal> lista)
        {
            DataTable tabelaProdutos = TabelaProdutos();
            
            foreach (RelProdutoNotaFiscal rel in lista)
            {
                DataRow linha = tabelaProdutos.NewRow();

                linha["id_produto"] = rel.IdProduto.ToString();
                linha["nm_produto"] = rel.NomeProduto;
                linha["valunit"] = rel.PrecoUnitarioProduto.ToString();
                linha["quant"] = rel.Quantidade.ToString();
                linha["valor"] = rel.ValorTotalProduto.ToString();

                tabelaProdutos.Rows.Add(linha);
            }

            grProds.Visible = true;
            grProds.DataSource = tabelaProdutos;
            grProds.DataBind();
        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            NotaFiscalBuss notaBuss = new NotaFiscalBuss();
            int idPed = (int)Session["idPed"];

            bool executou = notaBuss.AtualizarPedidoDeCompra(idPed, Convert.ToInt32(ddlStatus.SelectedItem.Value));

            if (executou)
            {
                foreach (GridViewRow linha in grProds.Rows)
                {
                    Estoque estoque = new Estoque();
                    RelEstoqueProduto relEstoqueProd = new RelEstoqueProduto();
                    EstoqueBuss estoqueBuss = new EstoqueBuss();
                    
                    Produto prod = new Produto();
                    ProdutoBuss produtoBuss = new ProdutoBuss();

                    prod = produtoBuss.ObterProdutoPorId(Convert.ToInt32(linha.Cells[0].Text));
                    int estoqueMedio = (prod.EstoqueMax + prod.EstoqueMin)/2;

                    relEstoqueProd = estoqueBuss.ObterEstoqueProdutoPorIdProd(prod.IdProduto);
                    
                    if (relEstoqueProd != null)
                    {
                        estoque = estoqueBuss.ObterEstoquePorId(relEstoqueProd.IdEstoque);

                        if (ddlStatus.SelectedItem.Value == "1")
                        {
                            estoque.Quantidade = estoque.Quantidade - Convert.ToInt32(linha.Cells[3].Text);

                            if (estoque.Quantidade >= prod.EstoqueMax)
                                estoque.Status = 3;

                            else if (estoque.Quantidade == estoqueMedio)
                                estoque.Status = 2;

                            else
                                estoque.Status = 1;                            
                        }

                        else
                        {

                            if (Convert.ToInt32(linha.Cells[3].Text) >= prod.EstoqueMax)
                                estoque.Status = 3;

                            else if (Convert.ToInt32(linha.Cells[3].Text) == estoqueMedio)
                                estoque.Status = 2;

                            else
                                estoque.Status = 1;

                            estoque.Quantidade = estoque.Quantidade + Convert.ToInt32(linha.Cells[3].Text);
                        }

                        estoqueBuss.AtualizarEstoque(relEstoqueProd.IdEstoque, estoque.Quantidade, estoque.Status);
                    }

                    else
                    {
                        if (Convert.ToInt32(linha.Cells[3].Text) >= prod.EstoqueMax)
                            estoque.Status = 3;

                        else if (Convert.ToInt32(linha.Cells[3].Text) == estoqueMedio)
                            estoque.Status = 2;

                        else
                            estoque.Status = 1;

                        estoque.Quantidade = estoque.Quantidade + Convert.ToInt32(linha.Cells[3].Text);

                        estoqueBuss.InserirEstoque(estoque, prod.IdProduto);
                    }

                }


                Response.Redirect("ListaPedidoDeCompra.aspx");
            }
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }
}
