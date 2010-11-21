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
    public partial class MudaSenha : System.Web.UI.Page
    {
        Usuario usuario = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            lblMsg.Text = "";

            usuario = (Usuario)Session["User"];
            UsuarioBuss usuarioBuss = new UsuarioBuss();

            if (usuario == null)
                Response.Redirect("Login.aspx");
            else
                usuario.Id = usuarioBuss.ObterIdUsuarioPorNomeUsuario(usuario.Nome);

            #region Criação de Menu
            if (usuario.TipoUsuario == 1)
            {
                Menu menu = (Menu)Page.Master.FindControl("Menu1");
                SiteMapDataSource siteAdmin = (SiteMapDataSource)Page.Master.FindControl("adm");
                menu.DataSource = siteAdmin;
                menu.DataBind();
            }
            else if (usuario.TipoUsuario == 2)
            {
                Menu menu = (Menu)Page.Master.FindControl("Menu1");
                SiteMapDataSource siteVeterinario = (SiteMapDataSource)Page.Master.FindControl("vet");
                menu.DataSource = siteVeterinario;
                menu.DataBind();
            }
            else if (usuario.TipoUsuario == 3)
            {
                Menu menu = (Menu)Page.Master.FindControl("Menu1");
                SiteMapDataSource siteVendedor = (SiteMapDataSource)Page.Master.FindControl("vend");
                menu.DataSource = siteVendedor;
                menu.DataBind();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

            #endregion
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            if (usuario.TipoUsuario == 1)
                Response.Redirect("DefaultAdmin.aspx");
            else if (usuario.TipoUsuario == 2)
                Response.Redirect("DefaultVeterinario.aspx");
            else if (usuario.TipoUsuario == 3)
                Response.Redirect("DefaultVendedor.aspx");
            else
                Response.Redirect("Login.aspx");
        }

        protected void btnAtualiza_Click(object sender, EventArgs e)
        {
            if (txtSenha.Text == txtConfSenha.Text)
            {
                bool executou = false;
                UsuarioBuss usuarioBus = new UsuarioBuss();

                executou = usuarioBus.AlterarSenha(usuario.Id, Convert.ToString(txtSenha.Text));

                if (executou)
                {
                    lblMsg.Text = "Alteração de senha realizada com sucesso";
                    txtSenha.Text = "";
                    txtConfSenha.Text = "";
                }
                else 
                {
                    lblMsg.Text = "Alteração não foi efetuado. Falha de conexão com o banco de dados";
                }

            }
            else
            {
                lblMsg.Text = "Confirmação de senha está diferente da nova senha";
                return;
            }
        }
    }
}
