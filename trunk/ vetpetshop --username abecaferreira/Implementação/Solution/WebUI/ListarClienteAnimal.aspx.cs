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
    public partial class ListarClienteAnimal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grClientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "alterar")

                Response.Redirect("ManterCadastroCliente.aspx?CodClienteAlt=" + e.CommandArgument.ToString());

            if (e.CommandName == "excluir")

                ExcluirCliente(Convert.ToInt32(e.CommandArgument));
        }

        protected void ExcluirCliente(int id) 
        {
            bool executou = false;

            ClienteBuss clienteBus = new ClienteBuss();

            executou = clienteBus.ExcluirCliente(id);

            if (executou)
            {
                lblMsg.Text = "Cliente e animais vinculados foram excluídos com sucesso!";
            
            }
            else
            {
                lblMsg.Text = "A exclusão não foi efetuada. Falha de conexão com o banco de dados";
            }
            
        }
    }
}
