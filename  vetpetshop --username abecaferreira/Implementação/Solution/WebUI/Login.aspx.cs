using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocios;
using Entidade;
using System.Web.Security;
using System.Data;
using System.Net.Mail;
using System.Net.Configuration;

namespace WebUI
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Usuario usuario = new Usuario();
                usuario = (Usuario)Session["User"];
                if(usuario != null)
                    Session.Remove("User");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            UsuarioBuss usuarioBus = new UsuarioBuss();
            Usuario usuario = new Usuario();

            //if (txtUsu.Text == "")
            //{
            //    lblAviso.Text = "Preencha o campo login";
            //    return;
            //}

            //if (txtSenha.Text == "")
            //{
            //    lblAviso.Text = "Preencha o campo senha";
            //    return;
            //}

            if (txtUsu.Text != "" && txtSenhaUsu.Text != "")
            {
                usuario = usuarioBus.EfetuarLogin(txtUsu.Text, txtSenhaUsu.Text);

                if (usuario != null)
                {
                    FormsAuthentication.RedirectFromLoginPage(txtUsu.Text, false);
                    Session["Usuario"] = usuario;

                    if (usuario.TipoUsuario == 1)
                        Response.Redirect("DefaultAdmin.aspx");

                    if (usuario.TipoUsuario == 2)
                        Response.Redirect("DefaultVeterinario.aspx");

                    if (usuario.TipoUsuario == 3)
                        Response.Redirect("DefaultVendedor.aspx");
                }

                else
                {
                    lblAviso.Text = "Login e/ou senha inválidos";
                    return;
                }
            }
        }

        protected void lkLembrarSenha_Click(object sender, EventArgs e)
        {
            pnLembraSenha.Visible = true;
        }

        protected void btnEnviarLembrete_Click(object sender, EventArgs e)
        {
            if (txtEmailLembraSenha.Text != "")
            {
                UsuarioBuss usuarioBus = new UsuarioBuss();
                List<Usuario> lstUsuario = new List<Usuario>();

                lstUsuario = usuarioBus.ObterUsuarioPorEmail(Convert.ToString(txtEmailLembraSenha.Text));

                if (lstUsuario.Count != 0)
                {
                    EnviarEmail(lstUsuario);
                    pnLembraSenha.Visible = false;
                    txtEmailLembraSenha.Text = "";
                    lblAviso.Text = "Lembrete de senha enviado com sucesso";
                }
                else
                {
                    lblAvisoEmail.Text = "Não foi possível enviar seus dados para o e-mail informado. Tente novamente";
                    return;
                }

            }
            else
            {
                lblAvisoEmail.Text = "Preencha o campo E-mail";
                return;
            }
        }

        private void EnviarEmail(List<Usuario> lstUsuario)
        {
                string remetenteEmail = "vetpetshopsystem@gmail.com";
                System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
                mail.To.Add(Convert.ToString(txtEmailLembraSenha.Text));
                mail.From = new MailAddress(remetenteEmail, "Vetpetshop", System.Text.Encoding.UTF8);
                mail.Subject = "Lembrete de senha Vetpetshop";
                mail.SubjectEncoding = System.Text.Encoding.UTF8;
                mail.Body += "Seus dados de acesso ao sistema Vetpetshop:<BR><BR>";

                foreach (Usuario usuario in lstUsuario)
                {
                    mail.Body += "Login: " + usuario.Nome + "<BR>";
                    mail.Body += "Senha: " + usuario.Senha + "<BR><BR>";
                }
                mail.Body += "Para alterar sua senha de acesso, acesse a funcionalidade 'Alterar Senha'.";

                mail.IsBodyHtml = true;

                SmtpClient client = new SmtpClient();
                client.Credentials = new System.Net.NetworkCredential(remetenteEmail, "petvet1234");
                client.Port = 25;
                client.Host = "smtp.gmail.com";
                client.EnableSsl = true;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;

                client.Send(mail);
        }

        

    }
}
