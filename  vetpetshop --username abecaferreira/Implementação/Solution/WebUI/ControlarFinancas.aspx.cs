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
    public partial class ControlarFinancas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CarregarAno();
                CarregarMes();
            }

        }


        private void CarregarAno()
        {
            ListItem liSelecione = new ListItem("Selecione", "0");

            int anoAnterior = DateTime.Now.Year - 1;
            ListItem liAnterior = new ListItem(anoAnterior.ToString(), anoAnterior.ToString());
            ListItem liAnoAtual = new ListItem(DateTime.Now.Year.ToString(), DateTime.Now.Year.ToString());

            ddlAno.Items.Add(liSelecione);
            ddlAno.Items.Add(liAnoAtual);
            ddlAno.Items.Add(liAnterior);
        }

        private void CarregarMes()
        {
            ListItem liSelecione = new ListItem("Selecione", "0");
            ddlMes.Items.Add(liSelecione);
          
            ListItem liJan = new ListItem("Janeiro", "01");
            ddlMes.Items.Add(liJan);
            ListItem liFev = new ListItem("Fevereiro", "02");
            ddlMes.Items.Add(liFev);
            ListItem liMar = new ListItem("Março", "03");
            ddlMes.Items.Add(liMar);
            ListItem liAbr = new ListItem("Abril", "04");
            ddlMes.Items.Add(liAbr);
            ListItem liMai = new ListItem("Maio", "05");
            ddlMes.Items.Add(liMai);
            ListItem liJun = new ListItem("Junho", "06");
            ddlMes.Items.Add(liJun);
            ListItem liJul = new ListItem("Julho", "07");
            ddlMes.Items.Add(liJul);
            ListItem liAgo = new ListItem("Agosto", "08");
            ddlMes.Items.Add(liAgo);
            ListItem liSet = new ListItem("Setembro", "09");
            ddlMes.Items.Add(liSet);
            ListItem liOut = new ListItem("Outubro", "10");
            ddlMes.Items.Add(liOut);
            ListItem liNov = new ListItem("Novembro", "11");
            ddlMes.Items.Add(liNov);
            ListItem liDez = new ListItem("Dezembro", "12");
            ddlMes.Items.Add(liDez);
            }

        private void ListarFinancasPetShop()
        {
            FinanceiroBuss financeiroBuss = new FinanceiroBuss();
            List<Financas> listaFinancasInvestimento = new List<Financas>();

            listaFinancasInvestimento = financeiroBuss.ListarFinancasPetShop(Convert.ToInt32(ddlAno.SelectedItem.Value));

            foreach (Financas finan in listaFinancasInvestimento)
            {
                #region Investimento
                if (finan.Mes == 1)
                {
                    lblInvestimentoJan.Text = finan.Valor.ToString();                   
                }

                if (finan.Mes == 2)
                {
                    lblInvestimentoFev.Text = finan.Valor.ToString();                    
                }

                if (finan.Mes == 3)
                {
                    lblInvestimentoMar.Text = finan.Valor.ToString();                    
                }

                if (finan.Mes == 4)
                {
                    lblInvestimentoAbr.Text = finan.Valor.ToString();                    
                }

                if (finan.Mes == 5)
                {
                    lblInvestimentoMai.Text = finan.Valor.ToString();                   
                }

                if (finan.Mes == 6)
                {
                    lblInvestimentoJun.Text = finan.Valor.ToString();                   
                }

                if (finan.Mes == 7)
                {
                    lblInvestimentoJul.Text = finan.Valor.ToString();                   
                }

                if (finan.Mes == 8)
                {
                    lblInvestimentoAgo.Text = finan.Valor.ToString();                    
                }

                if (finan.Mes == 9)
                {
                    lblInvestimentoSet.Text = finan.Valor.ToString();                   
                }

                if (finan.Mes == 10)
                {
                    lblInvestimentoOut.Text = finan.Valor.ToString();                   
                }

                if (finan.Mes == 11)
                {
                    lblInvestimentoNov.Text = finan.Valor.ToString();                    
                }

                if (finan.Mes == 12)
                {
                    lblInvestimentoDez.Text = finan.Valor.ToString();                    
                }

                decimal total = Convert.ToDecimal(lblInvestimentoJan.Text) +
                    Convert.ToDecimal(lblInvestimentoFev.Text) + Convert.ToDecimal(lblInvestimentoMar.Text) +
                    Convert.ToDecimal(lblInvestimentoAbr.Text) + Convert.ToDecimal(lblInvestimentoMai.Text) +
                    Convert.ToDecimal(lblInvestimentoJun.Text) + Convert.ToDecimal(lblInvestimentoJul.Text) +
                    Convert.ToDecimal(lblInvestimentoAgo.Text) + Convert.ToDecimal(lblInvestimentoSet.Text) +
                    Convert.ToDecimal(lblInvestimentoOut.Text) + Convert.ToDecimal(lblInvestimentoNov.Text) + Convert.ToDecimal(lblInvestimentoDez.Text);

                lblTotaInvest.Text = total.ToString();
                #endregion

            }

        }

        protected void BtnBuscar_Click(object sender, EventArgs e)
        {
            ListarFinancasPetShop();
        }
    }
}
