using System;
using System.Web.Mail;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidade;
using Negocios;
using System.Data;

namespace WebUI
{
    public partial class RegistrarPagamentoConsulta : System.Web.UI.Page
    {
        //public DateTime datConsulta, datVacinacao;
        //Usuario usuario = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            #region Criação de Menu
            Menu menu = (Menu)Page.Master.FindControl("Menu1");
            SiteMapDataSource siteVet = (SiteMapDataSource)Page.Master.FindControl("vet");
            menu.DataSource = siteVet;
            menu.DataBind();
            #endregion

            //usuario = (Usuario)Session["User"];
            //UsuarioBuss usuarioBuss = new UsuarioBuss();
            //usuario.Id = usuarioBuss.ObterIdUsuarioPorNomeUsuario(usuario.Nome);

            if (!IsPostBack)
            {
                CarregarConsultas();
            }
        }

        protected void CarregarConsultas()
        {
            DataTable tabelaPreenchida = PreencherConsultasAPagar();

            if (tabelaPreenchida.Rows.Count != 0)
            {
                gdvConsultas.DataSource = tabelaPreenchida;
                gdvConsultas.DataBind();
            }
        }

        private DataTable PreencherConsultasAPagar()
        {
            Animal animal = new Animal();

            DataTable tabela = new DataTable();
            DataTable tabelaPreenchida = new DataTable();
            tabela = MontarTabelaConsultas();

            AnimalBuss animalBuss = new AnimalBuss();
            tabelaPreenchida = animalBuss.ListarConsultasAPagar(tabela);
            return tabelaPreenchida;
        }

        private DataTable MontarTabelaConsultas()
        {
            DataTable _tabela = new DataTable();

            DataColumn coluna0 = new DataColumn("id_consulta");
            DataColumn coluna1 = new DataColumn("nm_cliente");
            DataColumn coluna2 = new DataColumn("nm_animal");
            DataColumn coluna3 = new DataColumn("dataconsulta");
            DataColumn coluna4 = new DataColumn("valor");
            DataColumn coluna5 = new DataColumn("status");

            _tabela.Columns.Add(coluna0);
            _tabela.Columns.Add(coluna1);
            _tabela.Columns.Add(coluna2);
            _tabela.Columns.Add(coluna3);
            _tabela.Columns.Add(coluna4);
            _tabela.Columns.Add(coluna5);

            return _tabela;
        }

        protected void gdvConsultas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "registrar") 
            {
                lblMsg.Text = "";
                pnPgConsulta.Visible = true;
                ViewState["hdnCodConsulta"] = e.CommandArgument.ToString();
            }
        }

        public bool RegistraPagamento(Int32 idConsulta)
        {
            bool executou = false;
            bool executou2 = false;

            Financeiro financeiro = new Financeiro();
            FinanceiroBuss financeiroBus = new FinanceiroBuss();

            Animal animal = new Animal();
            AnimalBuss animalBus = new AnimalBuss();

            Consulta consulta = new Consulta();
            
            consulta = animalBus.ListarConsultaAnimalAPagar(idConsulta);

            financeiro.ValorTotal = consulta.Valor;
            financeiro.Usuario = consulta.idUsuario;
            financeiro.TipoPagamento = Convert.ToInt32(rbTipoPagamento.SelectedItem.Value);
            financeiro.TipoResponsavel = 2;
            financeiro.TipoTransacao = 2;

            if (txtNomeCli.Text != "")
            {
                financeiro.NomeCliente = txtNomeCli.Text;
            }
            else
            {
                financeiro.NomeCliente = "";
            }
            if (txtParcelas.Text != "")
            {
                financeiro.Parcelas = Convert.ToInt32(txtParcelas.Text);
            }
            else 
            {
                financeiro.Parcelas = 0;
            }

            executou = financeiroBus.InserirRegistroFinanceiro(financeiro);

            if (executou)
            {
                executou2 = animalBus.AlteraStatusConsultaPaga(idConsulta);
                
                if (executou2) 
                {
                    lblMsg.Text = "Pagamento registrado com sucesso";
                    pnPgConsulta.Visible = false;
                    espaco.Visible = false;
                    lblCli.Visible = false;
                    lblParcela.Visible = false;
                    txtNomeCli.Text = string.Empty;
                    txtParcelas.Text = string.Empty;
                    txtNomeCli.Visible = false;
                    txtParcelas.Visible = false;
                    btnConfirmar.Visible = false;
                    btnEnviar.Visible = true;
                    rbCliente.SelectedIndex = 1;
                    rbTipoPagamento.SelectedIndex = 2;
                    
                    CarregarConsultas();
                }
            }

            return executou;
        
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            if (rbCliente.SelectedItem.Value == "0")
            {
                lblCli.Visible = true;
                txtNomeCli.Visible = true;
            }
            if (rbTipoPagamento.SelectedItem.Value == "1" || rbTipoPagamento.SelectedItem.Value == "2")
            {
                lblParcela.Visible = true;
                txtParcelas.Visible = true;
            }

            if (txtParcelas.Visible == true && txtNomeCli.Visible == true)
            {
                espaco.Visible = true;
            }

            if (rbCliente.SelectedItem.Value == "1" && rbTipoPagamento.SelectedItem.Value == "0")
            {
                Int32 idConsulta;
                idConsulta = Convert.ToInt32(ViewState["hdnCodConsulta"]);
                RegistraPagamento(idConsulta);
            }
            else 
            {
                btnEnviar.Visible = false;
                btnConfirmar.Visible = true;
            }
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            Int32 idConsulta;
            idConsulta = Convert.ToInt32(ViewState["hdnCodConsulta"]);
            RegistraPagamento(idConsulta);
        }

    }
}
