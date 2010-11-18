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
    public partial class ListaPedidoDeCompra : System.Web.UI.Page
    {
        Usuario usuario = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = (Usuario)Session["User"];

            #region Criação de Menu
            if (usuario.TipoUsuario == 1)
            {
                Menu menu = (Menu)Page.Master.FindControl("Menu1");
                SiteMapDataSource siteAdmin = (SiteMapDataSource)Page.Master.FindControl("adm");
                menu.DataSource = siteAdmin;
                menu.DataBind();
            }
            if (usuario.TipoUsuario == 3)
            {
                Menu menu = (Menu)Page.Master.FindControl("Menu1");
                SiteMapDataSource siteAdmin = (SiteMapDataSource)Page.Master.FindControl("vend");
                menu.DataSource = siteAdmin;
                menu.DataBind();
            }
            else 
            {
                Response.Redirect("Login.aspx");
            }
            #endregion

            PreencherTabela();
        }

        private DataTable MontarTabela()
        {
            DataTable _tabela = new DataTable();

            DataColumn _coluna0 = new DataColumn("id_pedido");
            DataColumn _coluna1 = new DataColumn("dt_cad");
            DataColumn _coluna2 = new DataColumn("valor");
            DataColumn _coluna3 = new DataColumn("status");
            DataColumn _coluna4 = new DataColumn("dt_receb");

            _tabela.Columns.Add(_coluna0);
            _tabela.Columns.Add(_coluna1);
            _tabela.Columns.Add(_coluna2);
            _tabela.Columns.Add(_coluna3);
            _tabela.Columns.Add(_coluna4);

            return _tabela;        
        }

        private void PreencherTabela()
        {
            DataTable tabela = new DataTable();
            DataTable tabelaPreenchida = new DataTable();
            NotaFiscalBuss notaBuss = new NotaFiscalBuss();

            tabela = MontarTabela();
            tabelaPreenchida = notaBuss.ListarPedidosDeCompras(tabela);

            if (tabelaPreenchida.Rows.Count > 0)
            {
                grPedidos.DataSource = tabelaPreenchida;
                grPedidos.DataBind();
            }
            else 
            {
                lblRegistros.Visible = true;
                divPedidos.Attributes["class"] = "escondido";
            }
        }

        protected void grPedidos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Session["tipoUser"] = usuario.TipoUsuario;
            if (e.CommandName == "selecionar")
                Response.Redirect("RecebimentoPedidoDeCompra.aspx?pedido=" + e.CommandArgument);
        }
    }
}
