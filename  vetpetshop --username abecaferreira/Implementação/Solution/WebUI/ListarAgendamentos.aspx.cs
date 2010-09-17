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
using System.Web;

namespace WebUI
{
    public partial class ListarAgendamentos : System.Web.UI.Page
    {
        public DateTime datConsulta, datVacinacao;
        Usuario usuario = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            #region Criação de Menu
            Menu menu = (Menu)Page.Master.FindControl("Menu1");
            SiteMapDataSource siteVet = (SiteMapDataSource)Page.Master.FindControl("vet");
            menu.DataSource = siteVet;
            menu.DataBind();
            #endregion

            usuario = (Usuario)Session["User"];
            UsuarioBuss usuarioBuss = new UsuarioBuss();
            usuario.Id = usuarioBuss.ObterIdUsuarioPorNomeUsuario(usuario.Nome);

            if (!IsPostBack)
            {
                CarregarConsultas();
                CarregarVacinacoes();
            }
        }

        protected void CarregarConsultas()
        {
            DataTable tabelaPreenchida = PreencherConsultas();

            if (tabelaPreenchida.Rows.Count != 0)
            {
                gdvConsultas.DataSource = tabelaPreenchida;
                gdvConsultas.DataBind();
            }
        }

        protected void CarregarVacinacoes()
        {
            DataTable tabelaPreenchida = PreencherVacinacoes();

            if (tabelaPreenchida.Rows.Count != 0)
            {
                gdvVacinacoes.DataSource = tabelaPreenchida;
                gdvVacinacoes.DataBind();
            }
        }

        private DataTable PreencherConsultas()
        {
            Animal animal = new Animal();

            DataTable tabela = new DataTable();
            DataTable tabelaPreenchida = new DataTable();
            tabela = MontarTabelaConsultas();

            AnimalBuss animalBuss = new AnimalBuss();
            tabelaPreenchida = animalBuss.ListarConsultasAnimais(tabela);
            return tabelaPreenchida;
        }

        private DataTable PreencherVacinacoes()
        {
            Animal animal = new Animal();

            DataTable tabela = new DataTable();
            DataTable tabelaPreenchida = new DataTable();
            tabela = MontarTabelaVacinacoes();

            AnimalBuss animalBuss = new AnimalBuss();
            tabelaPreenchida = animalBuss.ListarVacinacoesAnimais(tabela);
            return tabelaPreenchida;
        }

        protected void gdvConsultas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "alterar")
            {
                ViewState["id_consulta"] = e.CommandArgument.ToString();
                pnlConsultas.Visible = true;

                HtmlTextWriterTag html = new HtmlTextWriterTag();
                WebControl wc = new WebControl(html);
                wc = ((WebControl)e.CommandSource);

                GridViewRow row = ((GridViewRow)wc.NamingContainer);

                lblProprietario.Text = row.Cells[3].Text;
                lblAnimal.Text = row.Cells[4].Text;
                txtDataConsulta.Text = string.Format("{0:d}", row.Cells[5].Text);
                txtValor.Text = row.Cells[6].Text;

                if (row.Cells[7].Text == "Agendada")
                {
                    rblStatus.SelectedIndex = 0;
                }
                else if (row.Cells[7].Text == "Desmarcada")
                {
                    rblStatus.SelectedIndex = 1;
                }
                else
                {
                    rblStatus.SelectedIndex = 2;
                }
            }

            if (e.CommandName == "excluir") 
            { 
                ViewState["id_consulta"] = e.CommandArgument.ToString();
                ExcluirConsulta(Convert.ToInt32(ViewState["id_consulta"]));              
            }
           
        }

         protected void ExcluirConsulta(int id)
         {
             bool executou = false;

             AnimalBuss animalBus = new AnimalBuss();

             executou = animalBus.ExcluirConsulta(id);

             if (executou)
             {
                 lblMsg.Text = "Consulta excluída com sucesso!";
                 CarregarConsultas();
             }
             else
             {
                 lblMsg.Text = "A exclusão não foi efetuada. Falha de conexão com o banco de dados";
             }

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

        private DataTable MontarTabelaVacinacoes()
        {
            DataTable _tabela = new DataTable();

            DataColumn coluna0 = new DataColumn("id_animal");
            DataColumn coluna1 = new DataColumn("nm_cliente");
            DataColumn coluna2 = new DataColumn("nm_animal");
            DataColumn coluna3 = new DataColumn("datavacinacao");
      
            _tabela.Columns.Add(coluna0);
            _tabela.Columns.Add(coluna1);
            _tabela.Columns.Add(coluna2);
            _tabela.Columns.Add(coluna3);

            return _tabela;
        }

        protected void btnAlterar_Click(object sender, EventArgs e)
        {


            if (txtDataConsulta.Text != "")
            {
                datConsulta = System.DateTime.ParseExact(txtDataConsulta.Text, "dd/MM/yyyy", null);
            }
            else
            {
                lblMsg.Text = "Digite a data da próxima consulta";
            }

            if (ViewState["id_consulta"] != null)
            {
                AlterarAgendamentoConsulta();
            }
            else
            {
                lblMsg.Text = "Selecione um animal para o agendamento da consulta";
            }
        }

        protected void btnAlterarVac_Click(object sender, EventArgs e)
        {


            if (txtDataVacinacao.Text != "")
            {
                datVacinacao = System.DateTime.ParseExact(txtDataVacinacao.Text, "dd/MM/yyyy", null);
            }
            else
            {
                lblMsg.Text = "Digite a data da vacinação";
            }

            if (ViewState["id_animal"] != null)
            {
                //AlterarAgendamentoVacinacao();
            }
            else
            {
                lblMsg.Text = "Selecione um animal para o agendamento da vacinação";
            }
        }

        protected void AlterarAgendamentoConsulta()
        {
            decimal valor = 0;
            AnimalBuss animalBuss = new AnimalBuss();

            bool executou;

            if (! string.IsNullOrEmpty(txtValor.Text))
            { 
            valor = Convert.ToDecimal(txtValor.Text);
            }

            executou = animalBuss.AlterarAgendamentoConsulta(Convert.ToInt32(ViewState["id_consulta"]), usuario.Id, datConsulta, valor, rblStatus.SelectedIndex);

            if (executou)
            {
                CarregarConsultas();
            }

            pnlConsultas.Visible = false;
            lblMsg.Text = "Alteração realizada com sucesso";
        }

        protected void gdvVacinacoes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "alterar")
            {
                ViewState["id_animal"] = e.CommandArgument.ToString();
                pnlConsultas.Visible = false;

                HtmlTextWriterTag html = new HtmlTextWriterTag();
                WebControl wc = new WebControl(html);
                wc = ((WebControl)e.CommandSource);

                GridViewRow row = ((GridViewRow)wc.NamingContainer);

                lblProprietario.Text = row.Cells[3].Text;
                lblAnimal.Text = row.Cells[4].Text;
                txtDataVacinacao.Text = string.Format("{0:d}", row.Cells[5].Text);
               
            }

            if (e.CommandName == "excluir")
            {
                ViewState["id_animal"] = e.CommandArgument.ToString();
                ExcluirConsulta(Convert.ToInt32(ViewState["id_animal"]));
            }

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("DefaultVeterinario.aspx");
        }

        protected void btnCancelarVac_Click(object sender, EventArgs e)
        {
            Response.Redirect("DefaultVeterinario.aspx");
        }

    }
}
