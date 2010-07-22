using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebUI
{
    public partial class Vetpetshop : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
