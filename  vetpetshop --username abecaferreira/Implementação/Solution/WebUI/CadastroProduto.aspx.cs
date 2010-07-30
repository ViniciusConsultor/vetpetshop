using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebUI
{
    public partial class CadastroProduto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void edicao_CheckedChanged(object sender, EventArgs e)
        {
            Panel1.Visible = true;
        }

        protected void novo_CheckedChanged(object sender, EventArgs e)
        {
            Response.Redirect("FormularioProduto.aspx");
        }
    }
}
