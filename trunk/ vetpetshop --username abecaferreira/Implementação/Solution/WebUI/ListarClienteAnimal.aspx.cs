using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidade;
using Negocios;

namespace WebUI
{
    public partial class ListarClienteAnimal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            #region Criação de Menu
            Menu menu = (Menu)Page.Master.FindControl("Menu1");
            SiteMapDataSource siteVendedor = (SiteMapDataSource)Page.Master.FindControl("vend");
            menu.DataSource = siteVendedor;
            menu.DataBind();
            #endregion

            if (Convert.ToString(ViewState["hdnMSG"]) != string.Empty) 
            {
                lblMsg.Text = Convert.ToString(ViewState["hdnMSG"]); 
            }
        }

        protected void grClientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "alterar")

                Response.Redirect("ManterCadastroCliente.aspx?CodClienteAlt=" + e.CommandArgument.ToString());

            if (e.CommandName == "excluir")

                ExcluirCliente(Convert.ToInt32(e.CommandArgument));
        }

        protected void grAnimais_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "alterar")

                Response.Redirect("ManterCadastroCliente.aspx?CodAnimalAlt=" + e.CommandArgument.ToString());

            if (e.CommandName == "excluir")

                ExcluirAnimal(Convert.ToInt32(e.CommandArgument));
        }

        protected void ExcluirCliente(int id) 
        {
            bool executou = false;

            ClienteBuss clienteBus = new ClienteBuss();

            executou = clienteBus.ExcluirCliente(id);

            if (executou)
            {
                ViewState["hdnMSG"] = "Cliente excluído com sucesso!";
                Response.Redirect("ListarClienteAnimal.aspx");
            }
            else
            {
                lblMsg.Text = "A exclusão não foi efetuada. Falha de conexão com o banco de dados";
            }
            
        }

        protected void ExcluirAnimal(int id)
        {
            bool executou = false;

            AnimalBuss animalBus = new AnimalBuss();

            executou = animalBus.ExcluirAnimal(id);

            if (executou)
            {
                ViewState["hdnMSG"] = "Animal excluído com sucesso!";
                Response.Redirect("ListarClienteAnimal.aspx");

            }
            else
            {
                lblMsg.Text = "A exclusão não foi efetuada. Falha de conexão com o banco de dados";
            }

        }

        protected void grAnimais_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType ==  DataControlRowType.DataRow)
            {
                if (e.Row.Cells[3].Text == Convert.ToString(DateTime.MinValue))
                {
                    e.Row.Cells[3].Text = "";
                }
                if (e.Row.Cells[4].Text == Convert.ToString(DateTime.MinValue))
                {
                    e.Row.Cells[4].Text = "";
                }
                if (e.Row.Cells[5].Text == Convert.ToString(DateTime.MinValue))
                {
                    e.Row.Cells[5].Text = "";
                }
                
            }
        }  


    }
}
