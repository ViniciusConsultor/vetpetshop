using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocios;
using System.Data;
using Entidade;

namespace WebUI
{
    public partial class CadastroProduto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            #region Criação de Menu
            Menu menu = (Menu)Page.Master.FindControl("Menu1");
            SiteMapDataSource siteAdmin = (SiteMapDataSource)Page.Master.FindControl("adm");
            menu.DataSource = siteAdmin;
            menu.DataBind();
            #endregion

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

        protected void edicao_CheckedChanged(object sender, EventArgs e)
        {
            Panel1.Visible = true;            
        }

        protected void novo_CheckedChanged(object sender, EventArgs e)
        {
            Response.Redirect("FormularioProduto.aspx");
        }
        protected void Buscar_Click(object sender, EventArgs e)
        {
            DataTable tabelaPreenchida = Preencher();

            grUsuarios.Visible = true;
            grUsuarios.DataSource = tabelaPreenchida;
            grUsuarios.DataBind();
            
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

        protected void grUsuarios_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='Yellow'");
                // This will be the back ground color of the GridView Control
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='White'");
            }

        }

        protected void grUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DataTable tabelaPreenchida = Preencher();
            grUsuarios.PageIndex = e.NewPageIndex;

            grUsuarios.Visible = true;
            grUsuarios.DataSource = tabelaPreenchida;
            grUsuarios.DataBind();
            

        }

        protected void grUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "editar")
                Response.Redirect("FormularioProduto.aspx?idProduto=" + e.CommandArgument);

            else
            {
                int idProd = Convert.ToInt32(e.CommandArgument);
                ProdutoBuss produtoBuss = new ProdutoBuss();
                bool executou = produtoBuss.ExcluirProduto(idProd);

                if (executou)
                {
                    lblMsg.Text = "Produto excluído com sucesso";
                    DataTable tabelaPreenchida = Preencher();
                    grUsuarios.Visible = true;
                    grUsuarios.DataSource = tabelaPreenchida;
                    grUsuarios.DataBind();
                }
                else
                {
                    lblMsg.Text = "Não foi possível excluir o usuário selecionado. Falha de conexão com banco de dados";
                } 
            }
        }      

    }
}
