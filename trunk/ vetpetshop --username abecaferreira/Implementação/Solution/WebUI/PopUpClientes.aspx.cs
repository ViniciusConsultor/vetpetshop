using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebUI
{
    public partial class PopUpClientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grClientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "selecionar") { 
                Server.Transfer("ManterCadastroCliente.aspx?Codigo="+grClientes.DataKeyNames+"");
            
            
            }
        }
    }
}
