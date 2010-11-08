using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidade;
using Negocios;
using System.Data;

namespace WebUI
{
    public partial class ConsultarEstatisticas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            #region Criação de Menu
            Menu menu = (Menu)Page.Master.FindControl("Menu1");
            SiteMapDataSource siteAdmin = (SiteMapDataSource)Page.Master.FindControl("adm");
            menu.DataSource = siteAdmin;
            menu.DataBind();
            #endregion

            if (!IsPostBack)
            {
                
            }
        }

        protected void ddlPetOpcoes_SelectedIndexChanged(object sender, EventArgs e)
        {
            PnDataPet.Visible = true;
        }

        protected void ddlVetOpcoes_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlVetOpcoes.SelectedValue == "1")
            {
                PnDataVet.Visible = true;
            }
        }

        protected void btnOkPet_Click(object sender, EventArgs e)
        {

        }

        protected void btnOkVet_Click(object sender, EventArgs e)
        {
            if (txtDataInicioVet.Text != "" && txtDataFimVet.Text != "")
            {
                CarregaSexoClientes(Convert.ToDateTime(txtDataInicioVet.Text), Convert.ToDateTime(txtDataFimVet.Text));
            }

        }

        public void CarregaSexoClientes(DateTime DataInicio, DateTime DataFim)
        {
           int[] qtdCli = new int[3];

           ClienteBuss clienteBus = new ClienteBuss();

           qtdCli = clienteBus.EstBuscaSexoCliente(DataInicio, DataFim);

           if (qtdCli.Count() > 0)
           {
               for (int i = 0; i < qtdCli.Length - 1; )
               {
                   Label6.Text = qtdCli[i].ToString();
                   i++;
                   Label8.Text = qtdCli[i].ToString();
                   i++;
                   Label10.Text = qtdCli[i].ToString();
               }

               PnVetSexo.Visible = true;
           }
           else 
           {
               lblMsg.Text = "Erro na busca. Tente novamente.";
           }
        }





    }
}
