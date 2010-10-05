using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Entidade;
using Negocios;

namespace WebUI
{
    public partial class RegistrarPagamentoProdutos : System.Web.UI.Page
    {
        Usuario usuario = new Usuario();
        int idProd;
        decimal valorTotal = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            #region Criação de Menu
            Menu menu = (Menu)Page.Master.FindControl("Menu1");
            SiteMapDataSource siteAdmin = (SiteMapDataSource)Page.Master.FindControl("vend");
            menu.DataSource = siteAdmin;
            menu.DataBind();
            #endregion

            usuario = (Usuario)Session["User"];
            UsuarioBuss usuarioBuss = new UsuarioBuss();
            usuario.Id = usuarioBuss.ObterIdUsuarioPorNomeUsuario(usuario.Nome);

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

        protected void Buscar_Click(object sender, EventArgs e)
        {
            DataTable tabelaPreenchida = new DataTable();
            lblRegistros.Text = "";

            tabelaPreenchida = Preencher();

            if (tabelaPreenchida.Rows.Count != 0)
            {
                grProdutos.Visible = true;
                grProdutos.DataSource = tabelaPreenchida;
                grProdutos.DataBind();
            }
            else
            {
                grProdutos.Visible = false;
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
            tabela = MontarTabela();

            List<Produto> _lista = new List<Produto>();
            ProdutoBuss produtoBuss = new ProdutoBuss();
            _lista = produtoBuss.ListarProdutos(nome, IdGrupo);

            foreach (Produto prod in _lista)
            {
                DataRow _linha = tabela.NewRow();
                _linha["id_produto"] = prod.IdProduto.ToString();
                _linha["nm_produto"] = prod.Nome;
                _linha["tipo"] = prod.NomeGrupo;
                _linha["Descricao"] = prod.Descricao;
                _linha["preco_venda"] = prod.PrecoVenda;

                tabela.Rows.Add(_linha);
            }
            return tabela;
        }

        private DataTable MontarTabela()
        {
            DataTable _tabela = new DataTable();

            DataColumn coluna0 = new DataColumn("id_produto");
            DataColumn coluna1 = new DataColumn("nm_produto");
            DataColumn coluna2 = new DataColumn("tipo");
            DataColumn coluna3 = new DataColumn("descricao");
            DataColumn coluna4 = new DataColumn("preco_venda");         

            _tabela.Columns.Add(coluna0);
            _tabela.Columns.Add(coluna1);
            _tabela.Columns.Add(coluna2);
            _tabela.Columns.Add(coluna3);
            _tabela.Columns.Add(coluna4);

            return _tabela;
        }

        protected void addProd_Click(object sender, EventArgs e)
        {

        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {

        }

        protected void btnQuant_Click(object sender, EventArgs e)
        {
            DataTable tabela = TabelaItems();
            NotaFiscalBuss notabuss = new NotaFiscalBuss();
            NotaFiscal nota = new NotaFiscal();
            ProdutoBuss produtoBuss = new ProdutoBuss();
            Produto produto = new Produto();

            nota = notabuss.ObterUltimoRegistroNota();

            int idProd = (int)Session["idProd"];
            produto = produtoBuss.ObterProdutoPorId(idProd);
            produto.Quantidade = Convert.ToInt32(txtQuant.Text);


            if (grProds.Rows.Count == 0)
            {
                DataRow _linha = tabela.NewRow();
                _linha["id_produto"] = produto.IdProduto;
                _linha["nm_produto"] = produto.Nome;
                _linha["quant"] = txtQuant.Text;
                _linha["valunit"] = produto.PrecoVenda.ToString();

                decimal _valorTotalProduto = (produto.Quantidade * produto.PrecoVenda);
                _linha["valor"] = _valorTotalProduto.ToString();

                tabela.Rows.Add(_linha);
            }

            else
            {
                foreach (GridViewRow linha in grProds.Rows)
                {
                    int id = Convert.ToInt32(linha.Cells[1].Text);

                    produto = produtoBuss.ObterProdutoPorId(id);
                    produto.Quantidade = Convert.ToInt32(linha.Cells[4].Text);

                    DataRow _linha = tabela.NewRow();
                    _linha["id_produto"] = produto.IdProduto;
                    _linha["nm_produto"] = produto.Nome;
                    _linha["quant"] = produto.Quantidade.ToString();
                    _linha["valunit"] = produto.PrecoVenda.ToString();
                    decimal _valorTotalProduto = (produto.Quantidade * produto.PrecoVenda);
                    _linha["valor"] = _valorTotalProduto.ToString();

                    tabela.Rows.Add(_linha);
                }

                produto = produtoBuss.ObterProdutoPorId(idProd);
                produto.Quantidade = Convert.ToInt32(txtQuant.Text);
                DataRow _linha2 = tabela.NewRow();
                _linha2["id_produto"] = produto.IdProduto;
                _linha2["nm_produto"] = produto.Nome;
                _linha2["quant"] = txtQuant.Text;
                _linha2["valunit"] = produto.PrecoVenda.ToString();
                decimal _valorTotalProduto2 = (produto.Quantidade * produto.PrecoVenda);
                _linha2["valor"] = _valorTotalProduto2.ToString();

                tabela.Rows.Add(_linha2);
            }


            grProdutos.Visible = false;
            grProds.Visible = true;
            grProds.DataSource = tabela;
            grProds.DataBind();

            panel3.Visible = false;


            foreach (GridViewRow linha in grProds.Rows)
            {
                valorTotal += Convert.ToDecimal(linha.Cells[5].Text);
            }


            if (grProds.Rows.Count != 0)
            {
                lblTotal.Visible = true;
                lblValor.Visible = true;                
                btnSalvar.Visible = true;
            }
            
            lblTotal.Text = valorTotal.ToString();

   
        }

        private DataTable TabelaItems()
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

        protected void grProdutos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "selecionar")
            {
                txtQuant.Text = "";
                idProd = Convert.ToInt32(e.CommandArgument);
                Session["idProd"] = idProd;

                HtmlTextWriterTag html = new HtmlTextWriterTag();
                WebControl wc = new WebControl(html);
                wc = ((WebControl)e.CommandSource);
                GridViewRow row = ((GridViewRow)wc.NamingContainer);
                row.Font.Bold = true;
                row.ForeColor = System.Drawing.Color.Red;

                panel3.Visible = true;
            }
        }
    }
}
