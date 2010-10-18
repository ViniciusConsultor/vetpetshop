using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidade;
using Negocios;
using System.Globalization;
using System.IO;

namespace WebUI
{
    public partial class ListarClienteAnimal : System.Web.UI.Page
    {
        Usuario usuario = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                usuario = (Usuario)Session["User"];
                UsuarioBuss usuarioBuss = new UsuarioBuss();
                usuario.Id = usuarioBuss.ObterIdUsuarioPorNomeUsuario(usuario.Nome);
            }

            #region Criação de Menu
            if (usuario.TipoUsuario == 2)
            {
                Menu menu = (Menu)Page.Master.FindControl("Menu1");
                SiteMapDataSource siteVeterinario = (SiteMapDataSource)Page.Master.FindControl("vet");
                menu.DataSource = siteVeterinario;
                menu.DataBind();
            }
            if (usuario.TipoUsuario == 3)
            {
                Menu menu = (Menu)Page.Master.FindControl("Menu1");
                SiteMapDataSource siteVendedor = (SiteMapDataSource)Page.Master.FindControl("vend");
                menu.DataSource = siteVendedor;
                menu.DataBind();
            
            }
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
                if (e.Row.Cells[6].Text == "01/01/0001")
                {
                    e.Row.Cells[6].Text = "";
                }
                if (e.Row.Cells[7].Text == "01/01/0001")
                {
                    e.Row.Cells[7].Text = "";
                }
                if (e.Row.Cells[8].Text == "01/01/0001")
                {
                    e.Row.Cells[8].Text = "";
                }
                
                e.Row.Cells[2].Text = BuscarProprietarioAnimal(Convert.ToInt32(e.Row.Cells[2].Text)); 
                
            }
        }
    

        protected string BuscarProprietarioAnimal(int IdCliente)
        {
            string nomeCliente = string.Empty;

            List<Cliente> lstCliente = new List<Cliente>();
            ClienteBuss clienteBus = new ClienteBuss();

            lstCliente = clienteBus.PreencheUsuario(IdCliente);

            foreach (Cliente cliente in lstCliente)
            {
                nomeCliente = cliente.Nome;
            }
            return nomeCliente;
        }
        
    }
}
