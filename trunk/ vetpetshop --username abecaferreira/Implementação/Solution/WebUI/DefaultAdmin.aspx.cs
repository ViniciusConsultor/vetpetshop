using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidade;

namespace WebUI
{
    public partial class DefaultAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = (Usuario)Session["Usuario"];
            Session["User"] = usuario;
            if (usuario.TipoUsuario != 1)
                Response.Redirect("Login.aspx");
        }
    }
}
