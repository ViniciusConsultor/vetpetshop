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
    public partial class ListarEstoqueProdutos : System.Web.UI.Page
    {
        Usuario usuario = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = (Usuario)Session["User"];

            if (usuario == null)
                Response.Redirect("Login.aspx");

            #region Criação de Menu
            if (usuario.TipoUsuario == 1)
            {
                Menu menu = (Menu)Page.Master.FindControl("Menu1");
                SiteMapDataSource siteAdmin = (SiteMapDataSource)Page.Master.FindControl("adm");
                menu.DataSource = siteAdmin;
                menu.DataBind();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            #endregion

            if (!IsPostBack)
            {
                CarregarTipoProduto();
                PreencherTabela();
            }
        }

        private void CarregarTipoProduto()
        {
            ListItem liSelecione = new ListItem("Selecione", "0");
            ddlTipo.Items.Add(liSelecione);

            GrupoProdutoBuss grupoBuss = new GrupoProdutoBuss();
            List<Grupo> lista = grupoBuss.ListarTiposGrupo();

            foreach (Grupo grupo in lista)
            {
                ListItem li = new ListItem(grupo.Nome, grupo.Id.ToString());
                ddlTipo.Items.Add(li);
            }
        }

        private DataTable MontarTabela()
        {
            DataTable tabela = new DataTable();

            DataColumn coluna0 = new DataColumn("id_estoque");
            DataColumn coluna1 = new DataColumn("tipo");
            DataColumn coluna2 = new DataColumn("nm_produto");
            DataColumn coluna3 = new DataColumn("min");
            DataColumn coluna4 = new DataColumn("max");
            DataColumn coluna5 = new DataColumn("quantidade");

            tabela.Columns.Add(coluna0);
            tabela.Columns.Add(coluna1);
            tabela.Columns.Add(coluna2);
            tabela.Columns.Add(coluna3);
            tabela.Columns.Add(coluna4);
            tabela.Columns.Add(coluna5);

            return tabela;
        }

        private void PreencherTabela()
        {
            DataTable tabela = MontarTabela();
            DataTable tabelaPreenchida = new DataTable();

            EstoqueBuss estoqueBuss = new EstoqueBuss();

            tabelaPreenchida = estoqueBuss.ListarEstoque(tabela);


            grEstoque.DataSource = tabelaPreenchida;
            grEstoque.DataBind();

            foreach (GridViewRow linha in grEstoque.Rows)
            {
                Estoque estoque = new Estoque();
                estoque = estoqueBuss.ObterEstoquePorId(Convert.ToInt32(linha.Cells[0].Text));

                if (estoque.Status == 3)
                {
                    linha.BackColor = System.Drawing.ColorTranslator.FromHtml("#33CC66");

                    //linha.Font.Bold = true;
                }

                else if (estoque.Status == 2)
                {
                    linha.BackColor = System.Drawing.ColorTranslator.FromHtml("#6495ED");
                    //#ffd700
                    //linha.Font.Bold = true;
                }

                else if (estoque.Status == 1)
                {
                    linha.BackColor = System.Drawing.ColorTranslator.FromHtml("#ffd700");
                }
            }
        }

        protected void grEstoque_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTipo.SelectedItem.Value != "0")
            {
                GrupoProdutoBuss grupoBuss = new GrupoProdutoBuss();


                DataTable tabela = MontarTabela();
                DataTable tabelaPreenchida = new DataTable();

                EstoqueBuss estoqueBuss = new EstoqueBuss();

                tabelaPreenchida = estoqueBuss.ListarEstoque(tabela, Convert.ToInt32(ddlTipo.SelectedItem.Value));


                grEstoque.DataSource = tabelaPreenchida;
                grEstoque.DataBind();

                foreach (GridViewRow linha in grEstoque.Rows)
                {
                    Estoque estoque = new Estoque();
                    estoque = estoqueBuss.ObterEstoquePorId(Convert.ToInt32(linha.Cells[0].Text));

                    if (estoque.Status == 3)
                    {
                        linha.BackColor = System.Drawing.ColorTranslator.FromHtml("#33CC66");

                        //linha.Font.Bold = true;
                    }

                    else if (estoque.Status == 2)
                    {
                        linha.BackColor = System.Drawing.ColorTranslator.FromHtml("#6495ED");
                        //#ffd700
                        //linha.Font.Bold = true;
                    }

                    else if (estoque.Status == 1)
                    {
                        linha.BackColor = System.Drawing.ColorTranslator.FromHtml("#ffd700");
                    }
                }
            }

            else
                PreencherTabela();
        }
    }
}
