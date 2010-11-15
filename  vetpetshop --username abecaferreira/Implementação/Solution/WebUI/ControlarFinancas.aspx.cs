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
    public partial class ControlarFinancas : System.Web.UI.Page
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
                CarregarAno();
            }

        }


        private void CarregarAno()
        {
            ListItem liSelecione = new ListItem("Selecione", "0");

            int anoAnterior = DateTime.Now.Year - 1;
            int anoPosterior = DateTime.Now.Year + 1;
            ListItem liAnterior = new ListItem(anoAnterior.ToString(), anoAnterior.ToString());
            ListItem liAnoAtual = new ListItem(DateTime.Now.Year.ToString(), DateTime.Now.Year.ToString());
            ListItem liPosterior = new ListItem(anoPosterior.ToString(), anoPosterior.ToString());

            ddlAno.Items.Add(liSelecione);
            ddlAno.Items.Add(liPosterior);
            ddlAno.Items.Add(liAnoAtual);
            ddlAno.Items.Add(liAnterior);            
        }

        private void ListarFinancasPetShop()
        {
            FinanceiroBuss financeiroBuss = new FinanceiroBuss();
            List<Financas> listaFinancasInvestimento = new List<Financas>();
            List<Financas> listaFinancasVenda = new List<Financas>();
           // List<FinancasEstoque> listaFinancasEstoque = new List<FinancasEstoque>();
            List<FinancasLucro> listaFinancasLucro = new List<FinancasLucro>();
           // List<FinancasValorAReceber> listaValorReceber = new List<FinancasValorAReceber>();

            listaFinancasInvestimento = financeiroBuss.ListarInvestimentos(Convert.ToInt32(ddlAno.SelectedItem.Value));
            listaFinancasVenda = financeiroBuss.ListarVendas(Convert.ToInt32(ddlAno.SelectedItem.Value));
            //listaFinancasEstoque = financeiroBuss.ListarFinancasEstoque(Convert.ToInt32(ddlAno.SelectedItem.Value));
            listaFinancasLucro = financeiroBuss.ListarFinancasLucro(Convert.ToInt32(ddlAno.SelectedItem.Value));
            //listaValorReceber = financeiroBuss.ListarValorReceber(Convert.ToInt32(ddlAno.SelectedItem.Value));

            #region Ano selecionado não possui registros
            if (listaFinancasInvestimento.Count == 0 && listaFinancasVenda.Count == 0 && listaFinancasLucro.Count == 0)
            {
                lblInvestimentoJan.Text = "0.00";
                lblInvestimentoFev.Text = "0.00";
                lblInvestimentoMar.Text = "0.00";
                lblInvestimentoAbr.Text = "0.00";
                lblInvestimentoMai.Text = "0.00";
                lblInvestimentoJun.Text = "0.00";
                lblInvestimentoJul.Text = "0.00";
                lblInvestimentoAgo.Text = "0.00";
                lblInvestimentoSet.Text = "0.00";
                lblInvestimentoOut.Text = "0.00";
                lblInvestimentoNov.Text = "0.00";
                lblInvestimentoDez.Text = "0.00";
                lblVendasJan.Text = "0.00";
                lblVendasFev.Text = "0.00";
                lblVendasMar.Text = "0.00";
                lblVendasAbr.Text = "0.00";
                lblVendasMai.Text = "0.00";
                lblVendasJun.Text = "0.00";
                lblVendasJul.Text = "0.00";
                lblVendasAgo.Text = "0.00";
                lblVendasSet.Text = "0.00";
                lblVendasOut.Text = "0.00";
                lblVendasNov.Text = "0.00";
                lblVendasDez.Text = "0.00";
                lblEstoqueJan.Text = "0.00";
                lblEstoqueFev.Text = "0.00";
                lblEstoqueMar.Text = "0.00";
                lblEstoqueAbr.Text = "0.00";
                lblEstoqueMai.Text = "0.00";
                lblEstoqueJun.Text = "0.00";
                lblEstoqueJul.Text = "0.00";
                lblEstoqueAgo.Text = "0.00";
                lblEstoqueSet.Text = "0.00";
                lblEstoqueOut.Text = "0.00";
                lblEstoqueNov.Text = "0.00";
                lblEstoqueDez.Text = "0.00";
                lblLucroJan.Text = "0.00";
                lblLucroFev.Text = "0.00";
                lblLucroMar.Text = "0.00";
                lblLucroAbr.Text = "0.00";
                lblLucroMai.Text = "0.00";
                lblLucroJun.Text = "0.00";
                lblLucroJul.Text = "0.00";
                lblLucroAgo.Text = "0.00";
                lblLucroSet.Text = "0.00";
                lblLucroOut.Text = "0.00";
                lblLucroNov.Text = "0.00";
                lblLucroDez.Text = "0.00";
                lblValorJan.Text = "0.00";
                lblValorFev.Text = "0.00";
                lblValorMar.Text = "0.00";
                lblValorAbr.Text = "0.00";
                lblValorMai.Text = "0.00";
                lblValorJun.Text = "0.00";
                lblValorJul.Text = "0.00";
                lblValorAgo.Text = "0.00";
                lblValorSet.Text = "0.00";
                lblValotOut.Text = "0.00";
                lblValorNov.Text = "0.00";
                lblValorDez.Text = "0.00";
                lblTotaInvest.Text = "0.00";
                lblTotalEstoque.Text = "0.00";
                lblTotalLucro.Text = "0.00";
                lblTotalValor.Text = "0.00";
                lblTotalVendas.Text = "0.00";
            }
            #endregion

            #region Investimento
            foreach (Financas finan in listaFinancasInvestimento)
            {

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

            }
            #endregion

            #region Vendas
            foreach (Financas venda in listaFinancasVenda)
            {


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


            }
            #endregion

            //#region Estoque
            //foreach (FinancasEstoque finEstoq in listaFinancasEstoque)
            //{

            //    if (finEstoq.Mes == 1)
            //    {
            //        lblEstoqueJan.Text = finEstoq.Valor.ToString();
            //    }
            //    if (lblEstoqueJan.Text == "")
            //        lblEstoqueJan.Text = "0.00";

            //    if (finEstoq.Mes == 2)
            //    {
            //        lblEstoqueFev.Text = finEstoq.Valor.ToString();
            //    }
            //    if (lblEstoqueFev.Text == "")
            //        lblEstoqueFev.Text = "0.00";

            //    if (finEstoq.Mes == 3)
            //    {
            //        lblEstoqueMar.Text = finEstoq.Valor.ToString();
            //    }
            //    if (lblEstoqueMar.Text == "")
            //        lblEstoqueMar.Text = "0.00";

            //    if (finEstoq.Mes == 4)
            //    {
            //        lblEstoqueAbr.Text = finEstoq.Valor.ToString();
            //    }
            //    if (lblEstoqueAbr.Text == "")
            //        lblEstoqueAbr.Text = "0.00";

            //    if (finEstoq.Mes == 5)
            //    {
            //        lblEstoqueMai.Text = finEstoq.Valor.ToString();
            //    }
            //    if (lblEstoqueMai.Text == "")
            //        lblEstoqueMai.Text = "0.00";

            //    if (finEstoq.Mes == 6)
            //    {
            //        lblEstoqueJun.Text = finEstoq.Valor.ToString();
            //    }
            //    if (lblEstoqueJun.Text == "")
            //        lblEstoqueJun.Text = "0.00";

            //    if (finEstoq.Mes == 7)
            //    {
            //        lblEstoqueJul.Text = finEstoq.Valor.ToString();
            //    }
            //    if (lblEstoqueJul.Text == "")
            //        lblEstoqueJul.Text = "0.00";

            //    if (finEstoq.Mes == 8)
            //    {
            //        lblEstoqueAgo.Text = finEstoq.Valor.ToString();
            //    }
            //    if (lblEstoqueAgo.Text == "")
            //        lblEstoqueAgo.Text = "0.00";

            //    if (finEstoq.Mes == 9)
            //    {
            //        lblEstoqueSet.Text = finEstoq.Valor.ToString();
            //    }
            //    if (lblEstoqueSet.Text == "")
            //        lblEstoqueSet.Text = "0.00";

            //    if (finEstoq.Mes == 10)
            //    {
            //        lblEstoqueOut.Text = finEstoq.Valor.ToString();
            //    }
            //    if (lblEstoqueOut.Text == "")
            //        lblEstoqueOut.Text = "0.00";

            //    if (finEstoq.Mes == 11)
            //    {
            //        lblEstoqueNov.Text = finEstoq.Valor.ToString();
            //    }
            //    if (lblEstoqueNov.Text == "")
            //        lblEstoqueNov.Text = "0.00";

            //    if (finEstoq.Mes == 12)
            //    {
            //        lblEstoqueDez.Text = finEstoq.Valor.ToString();
            //    }
            //    if (lblEstoqueDez.Text == "")
            //        lblEstoqueDez.Text = "0.00";


            //    decimal totalEstoque = Convert.ToDecimal(lblEstoqueJan.Text) +
            //        Convert.ToDecimal(lblEstoqueFev.Text) + Convert.ToDecimal(lblEstoqueMar.Text) +
            //        Convert.ToDecimal(lblEstoqueAbr.Text) + Convert.ToDecimal(lblEstoqueMai.Text) +
            //        Convert.ToDecimal(lblEstoqueJun.Text) + Convert.ToDecimal(lblEstoqueJul.Text) +
            //        Convert.ToDecimal(lblEstoqueAgo.Text) + Convert.ToDecimal(lblEstoqueSet.Text) +
            //        Convert.ToDecimal(lblEstoqueOut.Text) + Convert.ToDecimal(lblEstoqueNov.Text) + Convert.ToDecimal(lblEstoqueDez.Text);

            //    lblTotalEstoque.Text = totalEstoque.ToString();

            //}
            //#endregion

            #region Lucro
            foreach (FinancasLucro finLucro in listaFinancasLucro)
            {

                if (finLucro.Mes == 1)
                {
                    lblLucroJan.Text = finLucro.Valor.ToString();
                }
                if (lblLucroJan.Text == "")
                    lblLucroJan.Text = "0.00";

                if (finLucro.Mes == 2)
                {
                    lblLucroFev.Text = finLucro.Valor.ToString();
                }
                if (lblLucroFev.Text == "")
                    lblLucroFev.Text = "0.00";

                if (finLucro.Mes == 3)
                {
                    lblLucroMar.Text = finLucro.Valor.ToString();
                }
                if (lblLucroMar.Text == "")
                    lblLucroMar.Text = "0.00";

                if (finLucro.Mes == 4)
                {
                    lblLucroAbr.Text = finLucro.Valor.ToString();
                }
                if (lblLucroAbr.Text == "")
                    lblLucroAbr.Text = "0.00";

                if (finLucro.Mes == 5)
                {
                    lblLucroMai.Text = finLucro.Valor.ToString();
                }
                if (lblLucroMai.Text == "")
                    lblLucroMai.Text = "0.00";

                if (finLucro.Mes == 6)
                {
                    lblLucroJun.Text = finLucro.Valor.ToString();
                }
                if (lblLucroJun.Text == "")
                    lblLucroJun.Text = "0.00";

                if (finLucro.Mes == 7)
                {
                    lblLucroJul.Text = finLucro.Valor.ToString();
                }
                if (lblLucroJul.Text == "")
                    lblLucroJul.Text = "0.00";

                if (finLucro.Mes == 8)
                {
                    lblLucroAgo.Text = finLucro.Valor.ToString();
                }
                if (lblLucroAgo.Text == "")
                    lblLucroAgo.Text = "0.00";

                if (finLucro.Mes == 9)
                {
                    lblLucroSet.Text = finLucro.Valor.ToString();
                }
                if (lblLucroSet.Text == "")
                    lblLucroSet.Text = "0.00";

                if (finLucro.Mes == 10)
                {
                    lblLucroOut.Text = finLucro.Valor.ToString();
                }
                if (lblLucroOut.Text == "")
                    lblLucroOut.Text = "0.00";

                if (finLucro.Mes == 11)
                {
                    lblLucroNov.Text = finLucro.Valor.ToString();
                }
                if (lblLucroNov.Text == "")
                    lblLucroNov.Text = "0.00";

                if (finLucro.Mes == 12)
                {
                    lblLucroDez.Text = finLucro.Valor.ToString();
                }
                if (lblLucroDez.Text == "")
                    lblLucroDez.Text = "0.00";


                decimal totalLucro = Convert.ToDecimal(lblLucroJan.Text) +
                    Convert.ToDecimal(lblLucroFev.Text) + Convert.ToDecimal(lblLucroMar.Text) +
                    Convert.ToDecimal(lblLucroAbr.Text) + Convert.ToDecimal(lblLucroMai.Text) +
                    Convert.ToDecimal(lblLucroJun.Text) + Convert.ToDecimal(lblLucroJul.Text) +
                    Convert.ToDecimal(lblLucroAgo.Text) + Convert.ToDecimal(lblLucroSet.Text) +
                    Convert.ToDecimal(lblLucroOut.Text) + Convert.ToDecimal(lblLucroNov.Text) + Convert.ToDecimal(lblLucroDez.Text);

                lblTotalLucro.Text = totalLucro.ToString();

            }
            #endregion

            //#region Valor a Receber
            //foreach (FinancasValorAReceber finValor in listaValorReceber)
            //{

            //    if (finValor.Mes == 1)
            //    {
            //        lblValorJan.Text = finValor.Valor.ToString();
            //    }
            //    if (lblValorJan.Text == "")
            //        lblValorJan.Text = "0.00";

            //    if (finValor.Mes == 2)
            //    {
            //        lblValorFev.Text = finValor.Valor.ToString();
            //    }
            //    if (lblValorFev.Text == "")
            //        lblValorFev.Text = "0.00";

            //    if (finValor.Mes == 3)
            //    {
            //        lblValorMar.Text = finValor.Valor.ToString();
            //    }
            //    if (lblValorMar.Text == "")
            //        lblValorMar.Text = "0.00";

            //    if (finValor.Mes == 4)
            //    {
            //        lblValorAbr.Text = finValor.Valor.ToString();
            //    }
            //    if (lblValorAbr.Text == "")
            //        lblValorAbr.Text = "0.00";

            //    if (finValor.Mes == 5)
            //    {
            //        lblValorMai.Text = finValor.Valor.ToString();
            //    }
            //    if (lblValorMai.Text == "")
            //        lblValorMai.Text = "0.00";

            //    if (finValor.Mes == 6)
            //    {
            //        lblValorJun.Text = finValor.Valor.ToString();
            //    }
            //    if (lblValorJun.Text == "")
            //        lblValorJun.Text = "0.00";

            //    if (finValor.Mes == 7)
            //    {
            //        lblValorJul.Text = finValor.Valor.ToString();
            //    }
            //    if (lblValorJul.Text == "")
            //        lblValorJul.Text = "0.00";

            //    if (finValor.Mes == 8)
            //    {
            //        lblValorAgo.Text = finValor.Valor.ToString();
            //    }
            //    if (lblValorAgo.Text == "")
            //        lblValorAgo.Text = "0.00";

            //    if (finValor.Mes == 9)
            //    {
            //        lblValorSet.Text = finValor.Valor.ToString();
            //    }
            //    if (lblValorSet.Text == "")
            //        lblValorSet.Text = "0.00";

            //    if (finValor.Mes == 10)
            //    {
            //        lblValotOut.Text = finValor.Valor.ToString();
            //    }
            //    if (lblValotOut.Text == "")
            //        lblValotOut.Text = "0.00";

            //    if (finValor.Mes == 11)
            //    {
            //        lblValorNov.Text = finValor.Valor.ToString();
            //    }
            //    if (lblValorNov.Text == "")
            //        lblValorNov.Text = "0.00";

            //    if (finValor.Mes == 12)
            //    {
            //        lblValorDez.Text = finValor.Valor.ToString();
            //    }
            //    if (lblValorDez.Text == "")
            //        lblValorDez.Text = "0.00";


            //    decimal totalValorReceber = Convert.ToDecimal(lblValorJan.Text) +
            //        Convert.ToDecimal(lblValorFev.Text) + Convert.ToDecimal(lblValorMar.Text) +
            //        Convert.ToDecimal(lblValorAbr.Text) + Convert.ToDecimal(lblValorMai.Text) +
            //        Convert.ToDecimal(lblValorJun.Text) + Convert.ToDecimal(lblValorJul.Text) +
            //        Convert.ToDecimal(lblValorAgo.Text) + Convert.ToDecimal(lblValorSet.Text) +
            //        Convert.ToDecimal(lblValotOut.Text) + Convert.ToDecimal(lblValorNov.Text) + Convert.ToDecimal(lblValorDez.Text);

            //    lblTotalValor.Text = totalValorReceber.ToString();

            //}
            //#endregion
        }

        private void ListarFinancasConsultorio()
        {
            FinanceiroBuss finanBuss = new FinanceiroBuss();

            List<FinancasConsultas> listaFinancasConsultas = new List<FinancasConsultas>();
            List<FinancasVacinas> listaFinancasVacinas = new List<FinancasVacinas>();
            List<FinancasFaturamento> listaFinancasFaturamento = new List<FinancasFaturamento>();
            listaFinancasConsultas = finanBuss.ListarFinancasConsultas(Convert.ToInt32(ddlAno.SelectedItem.Value));
            listaFinancasVacinas = finanBuss.ListaFinancasVacinas(Convert.ToInt32(ddlAno.SelectedItem.Value));
            listaFinancasFaturamento = finanBuss.ListarFinancasFaturamento(Convert.ToInt32(ddlAno.SelectedItem.Value));

            #region Ano selecionado não possui registros
            if (listaFinancasConsultas.Count == 0 && listaFinancasVacinas.Count == 0 && listaFinancasFaturamento.Count == 0)
            {

                lblConsJan.Text = "0.00";
                lblConsFev.Text = "0.00";
                lblConsMar.Text = "0.00";
                lblConsAbr.Text = "0.00";
                lblConsMai.Text = "0.00";
                lblConsJun.Text = "0.00";
                lblConsJul.Text = "0.00";
                lblConsAgo.Text = "0.00";
                lblConsSet.Text = "0.00";
                lblConsOut.Text = "0.00";
                lblConsNov.Text = "0.00";
                lblConsDez.Text = "0.00";
                lblTotalCons.Text = "0.00";
                lblVacJan.Text = "0.00";
                lblVacFev.Text = "0.00";
                lblVacMar.Text = "0.00";
                lblVacAbr.Text = "0.00";
                lblVacMai.Text = "0.00";
                lblVacJun.Text = "0.00";
                lblVacJul.Text = "0.00";
                lblVacAgo.Text = "0.00";
                lblVacSet.Text = "0.00";
                lblVacOut.Text = "0.00";
                lblVacNov.Text = "0.00";
                lblVacDez.Text = "0.00";
                lblTotalVac.Text = "0.00";
                lblFatJan.Text = "0.00";
                lblFatFev.Text = "0.00";
                lblFatMar.Text = "0.00";
                lblFatAbr.Text = "0.00";
                lblFatMai.Text = "0.00";
                lblFatJun.Text = "0.00";
                lblFatJul.Text = "0.00";
                lblFatAgo.Text = "0.00";
                lblFatSet.Text = "0.00";
                lblFatOut.Text = "0.00";
                lblFatNov.Text = "0.00";
                lblFatDez.Text = "0.00";
                lblTotalFat.Text = "0.00";
            }
            #endregion


            #region Consultas

            foreach (FinancasConsultas finCons in listaFinancasConsultas)
            {
                if (finCons.Mes == 1)
                {
                    lblConsJan.Text = finCons.Valor.ToString();
                }
                if (lblConsJan.Text == "")
                    lblConsJan.Text = "0.00";

                if (finCons.Mes == 2)
                {
                    lblConsFev.Text = finCons.Valor.ToString();
                }
                if (lblConsFev.Text == "")
                    lblConsFev.Text = "0.00";

                if (finCons.Mes == 3)
                {
                    lblConsMar.Text = finCons.Valor.ToString();
                }
                if (lblConsMar.Text == "")
                    lblConsMar.Text = "0.00";

                if (finCons.Mes == 4)
                {
                    lblConsAbr.Text = finCons.Valor.ToString();
                }
                if (lblConsAbr.Text == "")
                    lblConsAbr.Text = "0.00";

                if (finCons.Mes == 5)
                {
                    lblConsMai.Text = finCons.Valor.ToString();
                }
                if (lblConsMai.Text == "")
                    lblConsMai.Text = "0.00";

                if (finCons.Mes == 6)
                {
                    lblConsJun.Text = finCons.Valor.ToString();
                }
                if (lblConsJun.Text == "")
                    lblConsJun.Text = "0.00";

                if (finCons.Mes == 7)
                {
                    lblConsJul.Text = finCons.Valor.ToString();
                }
                if (lblConsJul.Text == "")
                    lblConsJul.Text = "0.00";

                if (finCons.Mes == 8)
                {
                    lblConsAgo.Text = finCons.Valor.ToString();
                }
                if (lblConsAgo.Text == "")
                    lblConsAgo.Text = "0.00";

                if (finCons.Mes == 9)
                {
                    lblConsSet.Text = finCons.Valor.ToString();
                }
                if (lblConsSet.Text == "")
                    lblConsSet.Text = "0.00";

                if (finCons.Mes == 10)
                {
                    lblConsOut.Text = finCons.Valor.ToString();
                }
                if (lblConsOut.Text == "")
                    lblConsOut.Text = "0.00";

                if (finCons.Mes == 11)
                {
                    lblConsNov.Text = finCons.Valor.ToString();
                }
                if (lblConsNov.Text == "")
                    lblConsNov.Text = "0.00";

                if (finCons.Mes == 12)
                {
                    lblConsDez.Text = finCons.Valor.ToString();
                }
                if (lblConsDez.Text == "")
                    lblConsDez.Text = "0.00";


                decimal totalConsultas = Convert.ToDecimal(lblConsJan.Text) +
                    Convert.ToDecimal(lblConsFev.Text) + Convert.ToDecimal(lblConsMar.Text) +
                    Convert.ToDecimal(lblConsAbr.Text) + Convert.ToDecimal(lblConsMai.Text) +
                    Convert.ToDecimal(lblConsJun.Text) + Convert.ToDecimal(lblConsJul.Text) +
                    Convert.ToDecimal(lblConsAgo.Text) + Convert.ToDecimal(lblConsSet.Text) +
                    Convert.ToDecimal(lblConsOut.Text) + Convert.ToDecimal(lblConsNov.Text) + Convert.ToDecimal(lblConsDez.Text);

                lblTotalCons.Text = totalConsultas.ToString();

            }

            #endregion

            #region Vacinas
            foreach (FinancasVacinas finanVac in listaFinancasVacinas)
            {

                if (finanVac.Mes == 1)
                {
                    lblVacJan.Text = finanVac.Valor.ToString();
                }
                if (lblVacJan.Text == "")
                    lblVacJan.Text = "0.00";

                if (finanVac.Mes == 2)
                {
                    lblVacFev.Text = finanVac.Valor.ToString();
                }
                if (lblVacFev.Text == "")
                    lblVacFev.Text = "0.00";

                if (finanVac.Mes == 3)
                {
                    lblVacMar.Text = finanVac.Valor.ToString();
                }
                if (lblVacMar.Text == "")
                    lblVacMar.Text = "0.00";

                if (finanVac.Mes == 4)
                {
                    lblVacAbr.Text = finanVac.Valor.ToString();
                }
                if (lblVacAbr.Text == "")
                    lblVacAbr.Text = "0.00";

                if (finanVac.Mes == 5)
                {
                    lblVacMai.Text = finanVac.Valor.ToString();
                }
                if (lblVacMai.Text == "")
                    lblVacMai.Text = "0.00";

                if (finanVac.Mes == 6)
                {
                    lblVacJun.Text = finanVac.Valor.ToString();
                }
                if (lblVacJun.Text == "")
                    lblVacJun.Text = "0.00";

                if (finanVac.Mes == 7)
                {
                    lblVacJul.Text = finanVac.Valor.ToString();
                }
                if (lblVacJul.Text == "")
                    lblVacJul.Text = "0.00";

                if (finanVac.Mes == 8)
                {
                    lblVacAgo.Text = finanVac.Valor.ToString();
                }
                if (lblVacAgo.Text == "")
                    lblVacAgo.Text = "0.00";

                if (finanVac.Mes == 9)
                {
                    lblVacSet.Text = finanVac.Valor.ToString();
                }
                if (lblVacSet.Text == "")
                    lblVacSet.Text = "0.00";

                if (finanVac.Mes == 10)
                {
                    lblVacOut.Text = finanVac.Valor.ToString();
                }
                if (lblVacOut.Text == "")
                    lblVacOut.Text = "0.00";

                if (finanVac.Mes == 11)
                {
                    lblVacNov.Text = finanVac.Valor.ToString();
                }
                if (lblVacNov.Text == "")
                    lblVacNov.Text = "0.00";

                if (finanVac.Mes == 12)
                {
                    lblVacDez.Text = finanVac.Valor.ToString();
                }
                if (lblVacDez.Text == "")
                    lblVacDez.Text = "0.00";


                decimal totalVacinas = Convert.ToDecimal(lblVacJan.Text) +
                    Convert.ToDecimal(lblVacFev.Text) + Convert.ToDecimal(lblVacMar.Text) +
                    Convert.ToDecimal(lblVacAbr.Text) + Convert.ToDecimal(lblVacMai.Text) +
                    Convert.ToDecimal(lblVacJun.Text) + Convert.ToDecimal(lblVacJul.Text) +
                    Convert.ToDecimal(lblVacAgo.Text) + Convert.ToDecimal(lblVacSet.Text) +
                    Convert.ToDecimal(lblVacOut.Text) + Convert.ToDecimal(lblVacNov.Text) + Convert.ToDecimal(lblVacDez.Text);

                lblTotalVac.Text = totalVacinas.ToString();

            }

            #endregion

            #region Faturamento

            foreach (FinancasFaturamento finanFat in listaFinancasFaturamento)
            {
                if (finanFat.Mes == 1)
                {
                    lblFatJan.Text = finanFat.Valor.ToString();
                }
                if (lblFatJan.Text == "")
                    lblFatJan.Text = "0.00";

                if (finanFat.Mes == 2)
                {
                    lblFatFev.Text = finanFat.Valor.ToString();
                }
                if (lblFatFev.Text == "")
                    lblFatFev.Text = "0.00";

                if (finanFat.Mes == 3)
                {
                    lblFatMar.Text = finanFat.Valor.ToString();
                }
                if (lblFatMar.Text == "")
                    lblFatMar.Text = "0.00";

                if (finanFat.Mes == 4)
                {
                    lblFatAbr.Text = finanFat.Valor.ToString();
                }
                if (lblFatAbr.Text == "")
                    lblFatAbr.Text = "0.00";

                if (finanFat.Mes == 5)
                {
                    lblFatMai.Text = finanFat.Valor.ToString();
                }
                if (lblFatMai.Text == "")
                    lblFatMai.Text = "0.00";

                if (finanFat.Mes == 6)
                {
                    lblFatJun.Text = finanFat.Valor.ToString();
                }
                if (lblFatJun.Text == "")
                    lblFatJun.Text = "0.00";

                if (finanFat.Mes == 7)
                {
                    lblFatJul.Text = finanFat.Valor.ToString();
                }
                if (lblFatJul.Text == "")
                    lblFatJul.Text = "0.00";

                if (finanFat.Mes == 8)
                {
                    lblFatAgo.Text = finanFat.Valor.ToString();
                }
                if (lblFatAgo.Text == "")
                    lblFatAgo.Text = "0.00";

                if (finanFat.Mes == 9)
                {
                    lblFatSet.Text = finanFat.Valor.ToString();
                }
                if (lblFatSet.Text == "")
                    lblFatSet.Text = "0.00";

                if (finanFat.Mes == 10)
                {
                    lblFatOut.Text = finanFat.Valor.ToString();
                }
                if (lblFatOut.Text == "")
                    lblFatOut.Text = "0.00";

                if (finanFat.Mes == 11)
                {
                    lblFatNov.Text = finanFat.Valor.ToString();
                }
                if (lblFatNov.Text == "")
                    lblFatNov.Text = "0.00";

                if (finanFat.Mes == 12)
                {
                    lblFatDez.Text = finanFat.Valor.ToString();
                }
                if (lblFatDez.Text == "")
                    lblFatDez.Text = "0.00";


                decimal totalFaturamento = Convert.ToDecimal(lblFatJan.Text) +
                    Convert.ToDecimal(lblFatFev.Text) + Convert.ToDecimal(lblFatMar.Text) +
                    Convert.ToDecimal(lblFatAbr.Text) + Convert.ToDecimal(lblFatJun.Text) +
                    Convert.ToDecimal(lblFatJul.Text) + Convert.ToDecimal(lblFatAgo.Text) +
                    Convert.ToDecimal(lblFatSet.Text) + Convert.ToDecimal(lblFatOut.Text) +
                    Convert.ToDecimal(lblFatNov.Text) + Convert.ToDecimal(lblFatMai.Text) + Convert.ToDecimal(lblFatDez.Text);

                lblTotalFat.Text = totalFaturamento.ToString();
            }

            #endregion
        }

        protected void BtnBuscar_Click(object sender, EventArgs e)
        {
            lblRegistros.Text = "";
            lblMsg.Text = "";

            if (ddlAno.SelectedItem.Value == "0")
            {
                lblMsg.Text = "Selecione o ano de referência";
                PanelFinancas.Visible = false;
                return;
            }

            ListarFinancasPetShop();
            ListarFinancasConsultorio();
            PreencherTabela();

            PanelFinancas.Visible = true;
        }

        private DataTable MontarTabela()
        {
            DataTable _tabela = new DataTable();

            DataColumn _coluna0 = new DataColumn("cliente");
            DataColumn _coluna1 = new DataColumn("dt_transacao");
            DataColumn _coluna2 = new DataColumn("tipo_transacao");
            DataColumn _coluna3 = new DataColumn("valor");
            
            _tabela.Columns.Add(_coluna0);
            _tabela.Columns.Add(_coluna1);
            _tabela.Columns.Add(_coluna2);
            _tabela.Columns.Add(_coluna3);

            return _tabela;        
            
        }

        private void PreencherTabela()
        {
            DataTable tabela = new DataTable();
            DataTable tabelaPreenchida = new DataTable();
            FinanceiroBuss finanBuss = new FinanceiroBuss();

            tabela = MontarTabela();
            tabelaPreenchida = finanBuss.ListarClientesEspeciais(tabela, Convert.ToInt32(ddlAno.SelectedItem.Value));

            if (tabelaPreenchida.Rows.Count != 0)
            {
                grClientes.Visible = true;
                grClientes.DataSource = tabelaPreenchida;
                grClientes.DataBind();
            }
            else
            {
                grClientes.DataSource = null;
                grClientes.DataBind();
                lblRegistros.Visible = true;
                lblRegistros.Text = "Não há registros de transações com desconto para o ano selecionado";
            }

        }
    }
}
