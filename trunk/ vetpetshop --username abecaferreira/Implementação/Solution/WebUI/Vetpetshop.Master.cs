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
    public partial class Vetpetshop : System.Web.UI.MasterPage
    {
        Usuario usuario = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = (Usuario)Session["User"];

            if (usuario == null)
                Response.Redirect("Login.aspx");
            else
                lblWelcome.Text = "Usuário: " + usuario.Nome;

            string url = Request.Url.ToString().ToLower();
            if (url.EndsWith("defaultadmin.aspx"))
            {
                Menu1.DataSource = adm;
                Menu1.DataBind();
            }
            if(url.EndsWith("defaultvendedor.aspx"))
            {
                Menu1.DataSource = vend;
                Menu1.DataBind();
            }
            if (url.EndsWith("defaultveterinario.aspx"))
            {
                Menu1.DataSource = vet;
                Menu1.DataBind();
            }

        }
    }
}
