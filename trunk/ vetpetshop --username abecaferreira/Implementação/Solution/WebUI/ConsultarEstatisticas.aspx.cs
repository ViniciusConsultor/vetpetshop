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
        }

        protected void ddlPetOpcoes_SelectedIndexChanged(object sender, EventArgs e)
        {
            PnDataPet.Visible = true;
        }

        protected void ddlVetOpcoes_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((ddlVetOpcoes.SelectedValue == "1") || (ddlVetOpcoes.SelectedValue == "2"))
            {
                PnDataVet.Visible = true;
                txtDataFimVet.Text = "";
                txtDataInicioVet.Text = "";
                PnVetSexoAnimal.Visible = false;
                PnVetSexoCliente.Visible = false;
            }
            else 
            {
                PnDataVet.Visible = false;
                PnVetSexoCliente.Visible = false;
                PnVetSexoAnimal.Visible = false;
            }
        }

        protected void btnOkPet_Click(object sender, EventArgs e)
        {

        }

        protected void btnOkVet_Click(object sender, EventArgs e)
        {
            if (ddlVetOpcoes.SelectedValue == "1")
            {
                if (txtDataInicioVet.Text != "" && txtDataFimVet.Text != "")
                {
                    CarregaSexoClientes(Convert.ToDateTime(txtDataInicioVet.Text), Convert.ToDateTime(txtDataFimVet.Text));
                }
                else
                {
                    CarregaSexoClientes(null, null);
                }
            }

            if (ddlVetOpcoes.SelectedValue == "2")
            {
                if (txtDataInicioVet.Text != "" && txtDataFimVet.Text != "")
                {
                    CarregaSexoAnimais(Convert.ToDateTime(txtDataInicioVet.Text), Convert.ToDateTime(txtDataFimVet.Text));
                }
                else
                {
                    CarregaSexoAnimais(null, null);
                }
            }

            
        }

        public void CarregaSexoClientes(Nullable<DateTime> DataInicio,Nullable<DateTime> DataFim)
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

               PnVetSexoCliente.Visible = true;
           }
           else 
           {
               lblMsg.Text = "Erro na busca. Tente novamente.";
           }
        }

        public void CarregaSexoAnimais(Nullable<DateTime> DataInicio, Nullable<DateTime> DataFim)
        {
            int[] qtdAni = new int[3];

            AnimalBuss animalBus = new AnimalBuss();

            qtdAni = animalBus.EstBuscaSexoAnimal(DataInicio, DataFim);

            if (qtdAni.Count() > 0)
            {
                for (int i = 0; i < qtdAni.Length - 1; )
                {
                    Label14.Text = qtdAni[i].ToString();
                    i++;
                    Label16.Text = qtdAni[i].ToString();
                    i++;
                    Label12.Text = qtdAni[i].ToString();
                }

                PnVetSexoAnimal.Visible = true;
            }
            else
            {
                lblMsg.Text = "Erro na busca. Tente novamente.";
            }
        }





    }
}
