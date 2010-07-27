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

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            UsuarioBuss usuarioBus = new UsuarioBuss();
            Usuario usuario = new Usuario();


            if (txtUsu.Text == "")
            {
                lblAviso.Text = "Preencha o campo Usuário";
                return;
            }

            if (txtUsu.Text == "")
            {
                lblAviso.Text = "Preencha o campo Senha";
                return;
            }


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
                lblAviso.Text = "Usuário não cadastrado. Contacte o administrador do sistema";
            }           
        }
    }
}
