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

        private void ListarFinancasPetShop()
        {
            FinanceiroBuss financeiroBuss = new FinanceiroBuss();
            List<Financas> listaFinancasInvestimento = new List<Financas>();
            List<Financas> listaFinancasVenda = new List<Financas>();
            List<FinancasEstoque> listaFinancasEstoque = new List<FinancasEstoque>();

            listaFinancasInvestimento = financeiroBuss.ListarInvestimentos(Convert.ToInt32(ddlAno.SelectedItem.Value));
            listaFinancasVenda = financeiroBuss.ListarVendas(Convert.ToInt32(ddlAno.SelectedItem.Value));
            listaFinancasEstoque = financeiroBuss.ListarFinancasEstoque(Convert.ToInt32(ddlAno.SelectedItem.Value));

            foreach (Financas finan in listaFinancasInvestimento)
            {
                #region Investimento
                if (finan.Mes == 1)
                {
                    lblInvestimentoJan.Text = finan.Valor.ToString();                   
                }
                if (lblInvestimentoJan.Text == "")
                    lblInvestimentoJan.Text = "0.00";

                if (finan.Mes == 2)
                {
                    lblInvestimentoFev.Text = finan.Valor.ToString();                    
                }
                if (lblInvestimentoFev.Text == "")
                    lblInvestimentoFev.Text = "0.00";

                if (finan.Mes == 3)
                {
                    lblInvestimentoMar.Text = finan.Valor.ToString();                    
                }
                if (lblInvestimentoMar.Text == "")
                    lblInvestimentoMar.Text = "0.00";

                if (finan.Mes == 4)
                {
                    lblInvestimentoAbr.Text = finan.Valor.ToString();                    
                }
                if (lblInvestimentoAbr.Text == "")
                    lblInvestimentoAbr.Text = "0.00";

                if (finan.Mes == 5)
                {
                    lblInvestimentoMai.Text = finan.Valor.ToString();                   
                }
                if (lblInvestimentoMai.Text == "")
                    lblInvestimentoMai.Text = "0.00";

                if (finan.Mes == 6)
                {
                    lblInvestimentoJun.Text = finan.Valor.ToString();                   
                }
                if (lblInvestimentoJun.Text == "")
                    lblInvestimentoJun.Text = "0.00";

                if (finan.Mes == 7)
                {
                    lblInvestimentoJul.Text = finan.Valor.ToString();                   
                }
                if (lblInvestimentoJul.Text == "")
                    lblInvestimentoJul.Text = "0.00";

                if (finan.Mes == 8)
                {
                    lblInvestimentoAgo.Text = finan.Valor.ToString();                    
                }
                if (lblInvestimentoAgo.Text == "")
                    lblInvestimentoAgo.Text = "0.00";

                if (finan.Mes == 9)
                {
                    lblInvestimentoSet.Text = finan.Valor.ToString();                   
                }
                if (lblInvestimentoSet.Text == "")
                    lblInvestimentoSet.Text = "0.00";

                if (finan.Mes == 10)
                {
                    lblInvestimentoOut.Text = finan.Valor.ToString();                   
                }
                if (lblInvestimentoOut.Text == "")
                    lblInvestimentoOut.Text = "0.00";

                if (finan.Mes == 11)
                {
                    lblInvestimentoNov.Text = finan.Valor.ToString();                    
                }
                if (lblInvestimentoNov.Text == "")
                    lblInvestimentoNov.Text = "0.00";

                if (finan.Mes == 12)
                {
                    lblInvestimentoDez.Text = finan.Valor.ToString();                    
                }
                if (lblInvestimentoDez.Text == "")
                    lblInvestimentoDez.Text = "0.00";


                decimal total = Convert.ToDecimal(lblInvestimentoJan.Text) +
                    Convert.ToDecimal(lblInvestimentoFev.Text) + Convert.ToDecimal(lblInvestimentoMar.Text) +
                    Convert.ToDecimal(lblInvestimentoAbr.Text) + Convert.ToDecimal(lblInvestimentoMai.Text) +
                    Convert.ToDecimal(lblInvestimentoJun.Text) + Convert.ToDecimal(lblInvestimentoJul.Text) +
                    Convert.ToDecimal(lblInvestimentoAgo.Text) + Convert.ToDecimal(lblInvestimentoSet.Text) +
                    Convert.ToDecimal(lblInvestimentoOut.Text) + Convert.ToDecimal(lblInvestimentoNov.Text) + Convert.ToDecimal(lblInvestimentoDez.Text);

                lblTotaInvest.Text = total.ToString();
                #endregion                
            }

            foreach (Financas venda in listaFinancasVenda)
            {
                #region Vendas

                if (venda.Mes == 1)
                {
                    lblVendasJan.Text = venda.Valor.ToString();
                }
                if (lblVendasJan.Text == "")
                    lblVendasJan.Text = "0.00";

                if (venda.Mes == 2)
                {
                    lblVendasFev.Text = venda.Valor.ToString();
                }
                if (lblVendasFev.Text == "")
                    lblVendasFev.Text = "0.00";

                if (venda.Mes == 3)
                {
                    lblVendasMar.Text = venda.Valor.ToString();
                }
                if (lblVendasMar.Text == "")
                    lblVendasMar.Text = "0.00";

                if (venda.Mes == 4)
                {
                    lblVendasAbr.Text = venda.Valor.ToString();
                }
                if (lblVendasAbr.Text == "")
                    lblVendasAbr.Text = "0.00";

                if (venda.Mes == 5)
                {
                    lblVendasMai.Text = venda.Valor.ToString();
                }
                if (lblVendasMai.Text == "")
                    lblVendasMai.Text = "0.00";

                if (venda.Mes == 6)
                {
                    lblVendasJun.Text = venda.Valor.ToString();
                }
                if (lblVendasJun.Text == "")
                    lblVendasJun.Text = "0.00";

                if (venda.Mes == 7)
                {
                    lblVendasJul.Text = venda.Valor.ToString();
                }
                if (lblVendasJul.Text == "")
                    lblVendasJul.Text = "0.00";

                if (venda.Mes == 8)
                {
                    lblVendasAgo.Text = venda.Valor.ToString();
                }
                if (lblVendasAgo.Text == "")
                    lblVendasAgo.Text = "0.00";

                if (venda.Mes == 9)
                {
                    lblVendasSet.Text = venda.Valor.ToString();
                }
                if (lblVendasSet.Text == "")
                    lblVendasSet.Text = "0.00";

                if (venda.Mes == 10)
                {
                    lblVendasOut.Text = venda.Valor.ToString();
                }
                if (lblVendasOut.Text == "")
                    lblVendasOut.Text = "0.00";

                if (venda.Mes == 11)
                {
                    lblVendasNov.Text = venda.Valor.ToString();
                }
                if (lblVendasNov.Text == "")
                    lblVendasNov.Text = "0.00";

                if (venda.Mes == 12)
                {
                    lblVendasDez.Text = venda.Valor.ToString();
                }
                if (lblVendasDez.Text == "")
                    lblVendasDez.Text = "0.00";            


            decimal totalVendas = Convert.ToDecimal(lblVendasJan.Text) +
                Convert.ToDecimal(lblVendasFev.Text) + Convert.ToDecimal(lblVendasMar.Text) +
                Convert.ToDecimal(lblVendasAbr.Text) + Convert.ToDecimal(lblVendasMai.Text) +
                Convert.ToDecimal(lblVendasJun.Text) + Convert.ToDecimal(lblVendasJul.Text) +
                Convert.ToDecimal(lblVendasAgo.Text) + Convert.ToDecimal(lblVendasSet.Text) +
                Convert.ToDecimal(lblVendasOut.Text) + Convert.ToDecimal(lblVendasNov.Text) + Convert.ToDecimal(lblVendasDez.Text);

            lblTotalVendas.Text = totalVendas.ToString();

                #endregion
            }

            foreach (FinancasEstoque finEstoq in listaFinancasEstoque)
            {
                #region Estoque
                if (finEstoq.Mes == 1)
                {
                    lblEstoqueJan.Text = finEstoq.Valor.ToString();
                }
                if (lblEstoqueJan.Text == "")
                    lblEstoqueJan.Text = "0.00";

                if (finEstoq.Mes == 2)
                {
                    lblEstoqueFev.Text = finEstoq.Valor.ToString();
                }
                if (lblEstoqueFev.Text == "")
                    lblEstoqueFev.Text = "0.00";

                if (finEstoq.Mes == 3)
                {
                    lblEstoqueMar.Text = finEstoq.Valor.ToString();
                }
                if (lblEstoqueMar.Text == "")
                    lblEstoqueMar.Text = "0.00";

                if (finEstoq.Mes == 4)
                {
                    lblEstoqueAbr.Text = finEstoq.Valor.ToString();
                }
                if (lblEstoqueAbr.Text == "")
                    lblEstoqueAbr.Text = "0.00";

                if (finEstoq.Mes == 5)
                {
                    lblEstoqueMai.Text = finEstoq.Valor.ToString();
                }
                if (lblEstoqueMai.Text == "")
                    lblEstoqueMai.Text = "0.00";

                if (finEstoq.Mes == 6)
                {
                    lblEstoqueJun.Text = finEstoq.Valor.ToString();
                }
                if (lblEstoqueJun.Text == "")
                    lblEstoqueJun.Text = "0.00";

                if (finEstoq.Mes == 7)
                {
                    lblEstoqueJul.Text = finEstoq.Valor.ToString();
                }
                if (lblEstoqueJul.Text == "")
                    lblEstoqueJul.Text = "0.00";

                if (finEstoq.Mes == 8)
                {
                    lblEstoqueAgo.Text = finEstoq.Valor.ToString();
                }
                if (lblEstoqueAgo.Text == "")
                    lblEstoqueAgo.Text = "0.00";

                if (finEstoq.Mes == 9)
                {
                    lblEstoqueSet.Text = finEstoq.Valor.ToString();
                }
                if (lblEstoqueSet.Text == "")
                    lblEstoqueSet.Text = "0.00";

                if (finEstoq.Mes == 10)
                {
                    lblEstoqueOut.Text = finEstoq.Valor.ToString();
                }
                if (lblEstoqueOut.Text == "")
                    lblEstoqueOut.Text = "0.00";

                if (finEstoq.Mes == 11)
                {
                    lblEstoqueNov.Text = finEstoq.Valor.ToString();
                }
                if (lblEstoqueNov.Text == "")
                    lblEstoqueNov.Text = "0.00";

                if (finEstoq.Mes == 12)
                {
                    lblEstoqueDez.Text = finEstoq.Valor.ToString();
                }
                if (lblEstoqueDez.Text == "")
                    lblEstoqueDez.Text = "0.00";


                decimal totalEstoque = Convert.ToDecimal(lblEstoqueJan.Text) +
                    Convert.ToDecimal(lblEstoqueFev.Text) + Convert.ToDecimal(lblEstoqueMar.Text) +
                    Convert.ToDecimal(lblEstoqueAbr.Text) + Convert.ToDecimal(lblEstoqueMai.Text) +
                    Convert.ToDecimal(lblEstoqueJun.Text) + Convert.ToDecimal(lblEstoqueJul.Text) +
                    Convert.ToDecimal(lblEstoqueAgo.Text) + Convert.ToDecimal(lblEstoqueSet.Text) +
                    Convert.ToDecimal(lblEstoqueOut.Text) + Convert.ToDecimal(lblEstoqueNov.Text) + Convert.ToDecimal(lblEstoqueDez.Text);

                lblTotalEstoque.Text = totalEstoque.ToString();
                #endregion
                
            }

            


        }

        protected void BtnBuscar_Click(object sender, EventArgs e)
        {
            ListarFinancasPetShop();
        }
    }
}
