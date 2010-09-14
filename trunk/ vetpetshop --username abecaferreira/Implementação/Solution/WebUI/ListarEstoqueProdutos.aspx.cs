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
        protected void Page_Load(object sender, EventArgs e)
        {
            #region Criação de Menu Admin

            Menu menu = (Menu)Page.Master.FindControl("Menu1");
            SiteMapDataSource siteAdmin = (SiteMapDataSource)Page.Master.FindControl("adm");
            menu.DataSource = siteAdmin;
            menu.DataBind();
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
                     linha.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFF99");
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
    }
}
