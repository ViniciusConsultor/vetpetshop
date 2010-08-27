using System;
using System.Web.Mail;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidade;
using Negocios;
using System.Data;
using System.Web;

namespace WebUI
{
    public partial class AgendarConsulta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            #region Criação de Menu
            Menu menu = (Menu)Page.Master.FindControl("Menu1");
            SiteMapDataSource siteVet = (SiteMapDataSource)Page.Master.FindControl("vet");
            menu.DataSource = siteVet;
            menu.DataBind();
            #endregion
            if (!IsPostBack)
            {
                CarregarClientes();
            }
           
        }

        protected void CarregarClientes()
        {

            ClienteBuss clienteBus = new ClienteBuss();
            List<Cliente> _listaClientes = new List<Cliente>();
            _listaClientes = clienteBus.ListarDDLClientes();

            ListItem _item = new ListItem("Selecione", "0");
            ddlClientes.Items.Insert(0, _item);

            foreach (Cliente cliente in _listaClientes)
            {
                ListItem item = new ListItem(cliente.Nome.ToString(), cliente.IdCliente.ToString());
                ddlClientes.Items.Add(item);
            }
                           
        }

        protected void ddlClientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            Int32 idCliente;
            idCliente = Int32.Parse(ddlClientes.SelectedValue);
            ddlAnimal.Enabled = true;
            if (idCliente != 0)
            {
                CarregarAnimaisCliente(idCliente);
            }
            else
            {
                ddlAnimal.Items.Clear();
                ddlAnimal.Enabled = false;
            }
                       
        }
           
        protected void CarregarAnimaisCliente(Int32 idCliente)
        {
            AnimalBuss animalBus = new AnimalBuss();
            List<Animal> _listaAnimais = new List<Animal>();
            _listaAnimais = animalBus.ListarDDLAnimais(idCliente);

            ListItem _item = new ListItem("Selecione", "0");
            ddlAnimal.Items.Insert(0, _item);

            foreach (Animal Animal in _listaAnimais)
            {
                ListItem item = new ListItem(Animal.Nome.ToString(), Animal.IdAnimal.ToString());
                ddlAnimal.Items.Add(item);
            }
                           
        }   
    }
}
