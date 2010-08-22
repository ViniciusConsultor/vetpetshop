using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidade;
using Negocios;
using System.Data;

namespace WebUI
{
    public partial class CadastroNotaFiscal : System.Web.UI.Page
    {
        Usuario usuario = new Usuario();
        int idProd;

        protected void Page_Load(object sender, EventArgs e)
        {
            #region Criação de Menu
            Menu menu = (Menu)Page.Master.FindControl("Menu1");
            SiteMapDataSource siteAdmin = (SiteMapDataSource)Page.Master.FindControl("adm");
            menu.DataSource = siteAdmin;
            menu.DataBind();
            #endregion

            usuario = (Usuario)Session["User"];
            UsuarioBuss usuarioBuss = new UsuarioBuss();
            usuario.Id = usuarioBuss.ObterIdUsuarioPorNomeUsuario(usuario.Nome);

            string quantidade = Request.Params["quant"];

            if (!IsPostBack)
                CarregaListaTipoProduto();

        }

        private void CarregaListaTipoProduto()
        {
            GrupoProdutoBuss grupoBuss = new GrupoProdutoBuss();

            List<Grupo> _listaGrupo = new List<Grupo>();
            _listaGrupo = grupoBuss.ListarTiposGrupo();

            ListItem _item = new ListItem("Selecione", "");
            ddlTipo.Items.Add(_item);

            foreach (Grupo grupo in _listaGrupo)
            {
                ListItem item = new ListItem(grupo.Nome.ToString(), grupo.Id.ToString());
                ddlTipo.Items.Add(item);
            }
        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            NotaFiscalBuss notaBuss = new NotaFiscalBuss();
            bool executou;

            executou = notaBuss.InserirNotaFiscal(usuario.Id);


            if (executou)
            {
                addProd.Visible = true;
                lblData.Text = DateTime.Now.ToString("dd/MM/yyyy");
            }
        }

        protected void addProd_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
        }

        protected void Buscar_Click(object sender, EventArgs e)
        {
            lblRegistros.Text = "";
            DataTable tabelaPreenchida = Preencher();

            if (tabelaPreenchida.Rows.Count != 0)
            {
                grUsuarios.Visible = true;
                grUsuarios.DataSource = tabelaPreenchida;
                grUsuarios.DataBind();
            }
            else 
            {
                grUsuarios.Visible = false;
                lblRegistros.Visible = true;
                lblRegistros.Text = "Nenhum registro encontrado";
            }
        }

        private DataTable Preencher()
        {
            string nome = string.Empty;
            int IdGrupo = 0;
            Produto produto = new Produto();
            if (txtNome.Text != "" || ddlTipo.SelectedItem.Value != "")
            {
                if (txtNome.Text == "")
                    nome = txtNome.Text;
                else
                    nome = txtNome.Text;

                if (ddlTipo.SelectedItem.Value == "")
                    IdGrupo = 0;
                else
                    IdGrupo = Convert.ToInt32(ddlTipo.SelectedItem.Value);
            }

            DataTable tabela = new DataTable();
            DataTable tabelaPreenchida = new DataTable();
            tabela = MontarTabela();

            ProdutoBuss produtoBuss = new ProdutoBuss();
            tabelaPreenchida = produtoBuss.ListarProdutos(tabela, nome, IdGrupo);
            return tabelaPreenchida;
        }

        private DataTable MontarTabela()
        {
            DataTable _tabela = new DataTable();

            DataColumn coluna0 = new DataColumn("id_produto");
            DataColumn coluna1 = new DataColumn("nm_produto");
            DataColumn coluna2 = new DataColumn("tipo");
            DataColumn coluna3 = new DataColumn("min");
            DataColumn coluna4 = new DataColumn("max");
            DataColumn coluna5 = new DataColumn("descricao");
            DataColumn coluna6 = new DataColumn("preco_custo");
            DataColumn coluna7 = new DataColumn("preco_venda");
            DataColumn coluna8 = new DataColumn("validade");

            _tabela.Columns.Add(coluna0);
            _tabela.Columns.Add(coluna1);
            _tabela.Columns.Add(coluna2);
            _tabela.Columns.Add(coluna3);
            _tabela.Columns.Add(coluna4);
            _tabela.Columns.Add(coluna5);
            _tabela.Columns.Add(coluna6);
            _tabela.Columns.Add(coluna7);
            _tabela.Columns.Add(coluna8);

            return _tabela;
        }

        protected void grUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "selecionar")
            {
                txtQuant.Text = "";
                idProd = Convert.ToInt32(e.CommandArgument);
                Session["idProd"] = idProd;
                Panel1.Visible = false;
                grUsuarios.Visible = false;
                panel3.Visible = true;
            }
        }

        protected void btnQuant_Click(object sender, EventArgs e)
        {
            decimal valorTotal = 0;
            DataTable tabela = TabelaProdutos();
            ProdutoBuss produtoBuss = new ProdutoBuss();
            Produto produto = new Produto();

            int idProd = (int)Session["idProd"];
            produto = produtoBuss.ObterProdutoPorId(idProd);
            produto.Quantidade = Convert.ToInt32(txtQuant.Text);

            if (grProds.Rows.Count == 0)
            {
                DataRow _linha = tabela.NewRow();
                _linha["id_produto"] = produto.IdProduto;
                _linha["nm_produto"] = produto.Nome;
                _linha["quant"] = txtQuant.Text;
                decimal _valorTotalProduto = (produto.Quantidade * produto.PrecoCusto);
                _linha["valor"] = _valorTotalProduto.ToString();

                tabela.Rows.Add(_linha);
            }

            else
            {
                foreach (GridViewRow linha in grProds.Rows)
                {
                    int id = Convert.ToInt32(linha.Cells[1].Text);

                    produto = produtoBuss.ObterProdutoPorId(id);
                    produto.Quantidade = Convert.ToInt32(linha.Cells[3].Text);

                    DataRow _linha = tabela.NewRow();
                    _linha["id_produto"] = produto.IdProduto;
                    _linha["nm_produto"] = produto.Nome;
                    _linha["quant"] = produto.Quantidade.ToString();

                    decimal _valorTotalProduto = (produto.Quantidade * produto.PrecoCusto);
                    _linha["valor"] = _valorTotalProduto.ToString();

                    tabela.Rows.Add(_linha);
                }

                produto = produtoBuss.ObterProdutoPorId(idProd);
                produto.Quantidade = Convert.ToInt32(txtQuant.Text);
                DataRow _linha2 = tabela.NewRow();
                _linha2["id_produto"] = produto.IdProduto;
                _linha2["nm_produto"] = produto.Nome;
                _linha2["quant"] = txtQuant.Text;

                decimal _valorTotalProduto2 = (produto.Quantidade * produto.PrecoCusto);
                _linha2["valor"] = _valorTotalProduto2.ToString();

                tabela.Rows.Add(_linha2);
            }


                grProds.Visible = true;
                grProds.DataSource = tabela;
                grProds.DataBind();

                panel3.Visible = false;

            foreach (GridViewRow linha in grProds.Rows)
            {
                valorTotal += Convert.ToDecimal(linha.Cells[4].Text);
            }

            lblTotalNota.Visible = true;
            lblTotal.Text = valorTotal.ToString();
        }


        private DataTable TabelaProdutos()
        {
            DataTable _tabela = new DataTable();

            DataColumn coluna0 = new DataColumn("id_produto");
            DataColumn coluna1 = new DataColumn("nm_produto");
            DataColumn coluna2 = new DataColumn("quant");
            DataColumn coluna3 = new DataColumn("valor");

            _tabela.Columns.Add(coluna0);
            _tabela.Columns.Add(coluna1);
            _tabela.Columns.Add(coluna2);
            _tabela.Columns.Add(coluna3);

            return _tabela;
        }
    }
}
