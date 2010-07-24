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
    public partial class ManterUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           //Cria o menu novamente
            Menu menu = (Menu)Page.Master.FindControl("Menu1");
            SiteMapDataSource siteAdmin = (SiteMapDataSource)Page.Master.FindControl("adm");
            menu.DataSource = siteAdmin;
            menu.DataBind();

            if(!IsPostBack)
            { 
                txtNomeUsu.Text = "";
                txtNomePro.Text = "";
                txtSenha.Text = "";
                CarregarTipoUsuario();
            }         
        }

        private void CarregarTipoUsuario()
        {
        
            ListItem liSelecione = new ListItem("Selecione", "");
            ListItem _li = new ListItem("Administrador", "Admin");
            ListItem _li1 = new ListItem("Vendedor", "Vend");
            ListItem _li2 = new ListItem("Veterinário", "Vet");

            ddlTipoUsu.Items.Add(liSelecione);
            ddlTipoUsu.Items.Add(_li);
            ddlTipoUsu.Items.Add(_li1);
            ddlTipoUsu.Items.Add(_li2);
        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            Administrador admin = new Administrador();
            Veterinario vet = new Veterinario();
            Vendedor vend = new Vendedor();

            if (ddlTipoUsu.SelectedItem.Value == "Admin")
            {
                usuario.Nome = txtNomeUsu.Text;
                usuario.TipoUsuario = 1;
                usuario.Senha = txtSenha.Text;               
                admin.Nome = txtNomePro.Text;
            }

            else if (ddlTipoUsu.SelectedItem.Value == "Vet")
            {
                usuario.Nome = txtNomeUsu.Text;
                usuario.TipoUsuario = 2;
                usuario.Senha = txtSenha.Text;                
                vet.Nome = txtNomePro.Text;
            }

            else
            {
                usuario.Nome = txtNomeUsu.Text;
                usuario.TipoUsuario = 3;
                usuario.Senha = txtSenha.Text;                
                vend.Nome = txtNomePro.Text;
            }

            UsuarioBuss usuarioBus = new UsuarioBuss();
            bool executou = usuarioBus.InserirUsuarioAdmin(admin, usuario);
            if (executou)
            {
                lblMsg.Text = "Cadastro efetuado com sucesso";
                txtSenha.Text = "";
                txtNomeUsu.Text = "";
                txtNomePro.Text = "";
                ddlTipoUsu.SelectedItem.Value = "";
            }            
        }        
    }
}
