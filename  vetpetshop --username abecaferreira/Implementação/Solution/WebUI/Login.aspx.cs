using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocios;
using Entidade;

namespace WebUI
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            UsuarioBuss usuarioBus = new UsuarioBuss();
            Usuario usuario = new Usuario();


            if (txtUsu.Text == "")
            {
                lblAviso.Text = "Preencha o campo usuário";
                return;
            }

            if (txtSenha.Text == "")
            {
                lblAviso.Text = "Preencha o campo senha";
                return;
            }

            if (txtUsu.Text != "" && txtSenha.Text != "")
            {
                usuario = usuarioBus.EfetuarLogin(txtUsu.Text, txtSenha.Text);

                if (usuario != null)
                {
                    if (usuario.TipoUsuario == 1)
                        Response.Redirect("DefaultAdmin.aspx");

                    if (usuario.TipoUsuario == 2)
                        Response.Redirect("DefaultVeterinario.aspx");

                    if (usuario.TipoUsuario == 3)
                        Response.Redirect("DefaultVendedor.aspx");
                }

                else
                {
                    lblAviso.Text = "Usuário e/ou senha inválidos";
                }
            }

            txtSenha.Text = "";
            txtUsu.Text = "";
        }
    }
}
