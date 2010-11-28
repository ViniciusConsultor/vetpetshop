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
    public partial class ListarAgendamentos : System.Web.UI.Page
    {
        public DateTime datConsulta, datVacinacao;
        Usuario usuario = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = (Usuario)Session["User"];
            UsuarioBuss usuarioBuss = new UsuarioBuss();
            
            if (usuario == null)
                Response.Redirect("Login.aspx");
            else
                usuario.Id = usuarioBuss.ObterIdUsuarioPorNomeUsuario(usuario.Nome);

            #region Criação de Menu
            if (usuario.TipoUsuario == 2)
            {
                Menu menu = (Menu)Page.Master.FindControl("Menu1");
                SiteMapDataSource siteVet = (SiteMapDataSource)Page.Master.FindControl("vet");
                menu.DataSource = siteVet;
                menu.DataBind();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            #endregion

            if (!IsPostBack)
            {
                CarregarConsultas();
                CarregarVacinacoes();
            }
            lblMsg.Text = "";
            
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
                lblMsg.Text = string.Empty;
                ViewState["id_consulta"] = e.CommandArgument.ToString();
                pnlConsultas.Visible = true;
                pnlVacinacao.Visible = false;

                HtmlTextWriterTag html = new HtmlTextWriterTag();
                WebControl wc = new WebControl(html);
                wc = ((WebControl)e.CommandSource);

                GridViewRow row = ((GridViewRow)wc.NamingContainer);

                lblProprietario.Text = row.Cells[3].Text;
                lblAnimal.Text = row.Cells[4].Text;
                txtDataConsulta.Text = string.Format("{0:d}", row.Cells[5].Text);

                CarregaListaHoraConsulta();
                if (row.Cells[6].Text != "")
                {
                    ddlHoraConsulta.SelectedIndex = ddlHoraConsulta.Items.IndexOf(ddlHoraConsulta.Items.FindByText(row.Cells[6].Text));
                }

                txtValor.Text = row.Cells[7].Text;

                if (row.Cells[8].Text == "Agendada")
                {
                    rblStatus.SelectedIndex = 0;
                }
                else if (row.Cells[8].Text == "Desmarcada")
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
                lblMsg.Text = string.Empty;
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
            DataColumn coluna4 = new DataColumn("horaconsulta");
            DataColumn coluna5 = new DataColumn("valor");
            DataColumn coluna6 = new DataColumn("status");

            _tabela.Columns.Add(coluna0);
            _tabela.Columns.Add(coluna1);
            _tabela.Columns.Add(coluna2);
            _tabela.Columns.Add(coluna3);
            _tabela.Columns.Add(coluna4);
            _tabela.Columns.Add(coluna5);
            _tabela.Columns.Add(coluna6);

            return _tabela;
        }

        private DataTable MontarTabelaVacinacoes()
        {
            DataTable _tabela = new DataTable();

            DataColumn coluna0 = new DataColumn("id_consulta");
            DataColumn coluna1 = new DataColumn("nm_cliente");
            DataColumn coluna2 = new DataColumn("nm_animal");            
            DataColumn coluna3 = new DataColumn("datavacinacao");
            DataColumn coluna4 = new DataColumn("horavacinacao");
            DataColumn coluna5 = new DataColumn("valor");
            DataColumn coluna6 = new DataColumn("status");
      
            _tabela.Columns.Add(coluna0);
            _tabela.Columns.Add(coluna1);
            _tabela.Columns.Add(coluna2);
            _tabela.Columns.Add(coluna3);
            _tabela.Columns.Add(coluna4);
            _tabela.Columns.Add(coluna5);
            _tabela.Columns.Add(coluna6);

            return _tabela;
        }

        protected void btnAlterar_Click(object sender, EventArgs e)
        {
            if (ddlHoraConsulta.SelectedItem.Value == "")
            {
                erro3.Attributes["class"] = "mostrar";
                return;
            }

            if (txtDataConsulta.Text != "")
            {
                datConsulta = System.DateTime.ParseExact(txtDataConsulta.Text, "dd/MM/yyyy", null);
            }
            else
            {
                lblMsg.Text = "Preencha a data da próxima consulta";
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
            if (ddlHoraVacina.SelectedItem.Value == "")
            {
                erro4.Attributes["class"] = "mostrar";
                return;
            }
            if (txtDataVacinacao.Text != "")
            {
                datVacinacao = System.DateTime.ParseExact(txtDataVacinacao.Text, "dd/MM/yyyy", null);
            }
            else
            {
                lblMsg.Text = "Preencha o campo data de vacinação";
            }

            if (ViewState["id_consulta"] != null)
            {
                AlterarAgendamentoVacinacao();
            }
            else
            {
                lblMsg.Text = "Selecione um animal para o agendamento da vacinação";
            }
        }

        protected void AlterarAgendamentoVacinacao()
        {
            decimal valor = 0;
            string horario;

            horario = ddlHoraVacina.SelectedItem.Value;

            AnimalBuss animalBuss = new AnimalBuss();

            bool achou = animalBuss.VerificarHoraDataConsulta(txtDataVacinacao.Text, ddlHoraVacina.SelectedItem.Value);

            if (achou)
            {
                lblMsg.Text = "Já existe uma consulta nesta data com o horário selecionado. Selecione outro horário";
                return;
            }
            else
            {
                lblMsg.Text = "";
            }
                 

            bool executou;

            if (!string.IsNullOrEmpty(txtValorVacina.Text))
            {
                valor = Convert.ToDecimal(txtValorVacina.Text);
            }

            executou = animalBuss.AlterarAgendamentoConsulta(Convert.ToInt32(ViewState["id_consulta"]), usuario.Id, datVacinacao, valor, rbStatusVacina.SelectedIndex, horario);

            //executou = animalBuss.AgendamentoVacinacao(Convert.ToInt32(ViewState["id_animal"]), datVacinacao);

            if (executou)
            {
                CarregarVacinacoes();
                pnlVacinacao.Visible = false;
                lblMsg.Text = "Alteração realizada com sucesso";
            }
            else
            {
                lblMsg.Text = "A alteração não foi efetuada. Falha de conexão com o banco de dados";
            }
        }

        protected void AlterarAgendamentoConsulta()
        {
            decimal valor = 0;
            string horario;

            horario = ddlHoraConsulta.SelectedItem.Value;

            AnimalBuss animalBuss = new AnimalBuss();

            bool achou = animalBuss.VerificarHoraDataConsulta(txtDataConsulta.Text, ddlHoraConsulta.SelectedItem.Value);

            if (achou)
            {
                lblMsg.Text = "Já existe uma consulta nesta data com o horário selecionado. Selecione outro horário";
                return;
            }
            else
            {
                lblMsg.Text = "";
            }

            bool executou;

            if (! string.IsNullOrEmpty(txtValor.Text))
            { 
            valor = Convert.ToDecimal(txtValor.Text);
            }

            executou = animalBuss.AlterarAgendamentoConsulta(Convert.ToInt32(ViewState["id_consulta"]), usuario.Id, datConsulta, valor, rblStatus.SelectedIndex, horario);

            if (executou)
            {
                CarregarConsultas();
                pnlConsultas.Visible = false;
                lblMsg.Text = "Alteração realizada com sucesso";
            }
            else
            {
                lblMsg.Text = "A alteração não foi efetuada. Falha de conexão com o banco de dados";
            }
        }

        protected void gdvVacinacoes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "alterar")
            {
                ViewState["id_consulta"] = e.CommandArgument.ToString();
                pnlConsultas.Visible = false;
                pnlVacinacao.Visible = true;

                HtmlTextWriterTag html = new HtmlTextWriterTag();
                WebControl wc = new WebControl(html);
                wc = ((WebControl)e.CommandSource);

                GridViewRow row = ((GridViewRow)wc.NamingContainer);

                lblClienteVac.Text = row.Cells[3].Text;
                lblAnimalVac.Text = row.Cells[4].Text;
                txtDataVacinacao.Text = string.Format("{0:d}", row.Cells[5].Text);

                CarregaListaHoraVacina();
                if (row.Cells[6].Text != "") 
                {
                    ddlHoraVacina.SelectedIndex = ddlHoraVacina.Items.IndexOf(ddlHoraVacina.Items.FindByText(row.Cells[6].Text));                    
                }

                txtValorVacina.Text = row.Cells[7].Text;

                if (row.Cells[8].Text == "Agendada")
                {
                    rbStatusVacina.SelectedIndex = 0;
                }
                else if (row.Cells[8].Text == "Desmarcada")
                {
                    rbStatusVacina.SelectedIndex = 1;
                }
                else
                {
                    rbStatusVacina.SelectedIndex = 2;
                }
            }

            if (e.CommandName == "excluir")
            {
                ViewState["id_consulta"] = e.CommandArgument.ToString();
                datVacinacao = DateTime.MinValue;
                ExcluirConsulta(Convert.ToInt32(ViewState["id_consulta"]));
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
        
        protected void tabAgendamentos_OnActiveTabChanged(object sender, EventArgs e)
        {
            if (pnlConsultas.Visible == true)
            { 
                pnlConsultas.Visible = (tabAgendamentos.ActiveTabIndex == 0);
                pnlVacinacao.Visible = false;
            }
            else if (pnlVacinacao.Visible == true)
            {
                pnlConsultas.Visible = false;
                pnlVacinacao.Visible = (tabAgendamentos.ActiveTabIndex == 1);
            }
        }

        protected void CarregaListaHoraConsulta()
        {
            ListItem itemSelecione = new ListItem("----", "");
            ListItem item1 = new ListItem("08:00", "08:00");
            ListItem item2 = new ListItem("08:30", "08:30");
            ListItem item3 = new ListItem("09:00", "09:00");
            ListItem item4 = new ListItem("09:30", "09:30");
            ListItem item5 = new ListItem("10:00", "10:00");
            ListItem item6 = new ListItem("10:30", "10:30");
            ListItem item7 = new ListItem("11:00", "11:00");
            ListItem item8 = new ListItem("11:30", "11:30");
            ListItem item9 = new ListItem("12:00", "12:00");
            ListItem item10 = new ListItem("13:00", "13:00");
            ListItem item11 = new ListItem("13:30", "13:30");
            ListItem item12 = new ListItem("14:00", "14:00");
            ListItem item13 = new ListItem("14:30", "14:30");
            ListItem item14 = new ListItem("15:00", "15:00");
            ListItem item15 = new ListItem("15:30", "15:30");
            ListItem item16 = new ListItem("16:00", "16:00");
            ListItem item17 = new ListItem("16:30", "16:30");
            ListItem item18 = new ListItem("17:00", "17:00");
            ListItem item19 = new ListItem("17:30", "17:30");
            ListItem item20 = new ListItem("18:00", "18:00");
            ListItem item21 = new ListItem("18:30", "18:30");
            ListItem item22 = new ListItem("19:00", "19:00");
            ListItem item23 = new ListItem("19:30", "19:30");

            ddlHoraConsulta.Items.Add(itemSelecione);
            ddlHoraConsulta.Items.Add(item1);
            ddlHoraConsulta.Items.Add(item2);
            ddlHoraConsulta.Items.Add(item3);
            ddlHoraConsulta.Items.Add(item4);
            ddlHoraConsulta.Items.Add(item5);
            ddlHoraConsulta.Items.Add(item6);
            ddlHoraConsulta.Items.Add(item7);
            ddlHoraConsulta.Items.Add(item8);
            ddlHoraConsulta.Items.Add(item9);
            ddlHoraConsulta.Items.Add(item10);
            ddlHoraConsulta.Items.Add(item11);
            ddlHoraConsulta.Items.Add(item12);
            ddlHoraConsulta.Items.Add(item13);
            ddlHoraConsulta.Items.Add(item14);
            ddlHoraConsulta.Items.Add(item15);
            ddlHoraConsulta.Items.Add(item16);
            ddlHoraConsulta.Items.Add(item17);
            ddlHoraConsulta.Items.Add(item18);
            ddlHoraConsulta.Items.Add(item19);
            ddlHoraConsulta.Items.Add(item20);
            ddlHoraConsulta.Items.Add(item21);
            ddlHoraConsulta.Items.Add(item22);
            ddlHoraConsulta.Items.Add(item23);
        }

        protected void CarregaListaHoraVacina()
        {
            ListItem itemSelecione = new ListItem("----", "");
            ListItem item1 = new ListItem("08:00", "08:00");
            ListItem item2 = new ListItem("08:30", "08:30");
            ListItem item3 = new ListItem("09:00", "09:00");
            ListItem item4 = new ListItem("09:30", "09:30");
            ListItem item5 = new ListItem("10:00", "10:00");
            ListItem item6 = new ListItem("10:30", "10:30");
            ListItem item7 = new ListItem("11:00", "11:00");
            ListItem item8 = new ListItem("11:30", "11:30");
            ListItem item9 = new ListItem("12:00", "12:00");
            ListItem item10 = new ListItem("13:00", "13:00");
            ListItem item11 = new ListItem("13:30", "13:30");
            ListItem item12 = new ListItem("14:00", "14:00");
            ListItem item13 = new ListItem("14:30", "14:30");
            ListItem item14 = new ListItem("15:00", "15:00");
            ListItem item15 = new ListItem("15:30", "15:30");
            ListItem item16 = new ListItem("16:00", "16:00");
            ListItem item17 = new ListItem("16:30", "16:30");
            ListItem item18 = new ListItem("17:00", "17:00");
            ListItem item19 = new ListItem("17:30", "17:30");
            ListItem item20 = new ListItem("18:00", "18:00");
            ListItem item21 = new ListItem("18:30", "18:30");
            ListItem item22 = new ListItem("19:00", "19:00");
            ListItem item23 = new ListItem("19:30", "19:30");

            ddlHoraVacina.Items.Add(itemSelecione);
            ddlHoraVacina.Items.Add(item1);
            ddlHoraVacina.Items.Add(item2);
            ddlHoraVacina.Items.Add(item3);
            ddlHoraVacina.Items.Add(item4);
            ddlHoraVacina.Items.Add(item5);
            ddlHoraVacina.Items.Add(item6);
            ddlHoraVacina.Items.Add(item7);
            ddlHoraVacina.Items.Add(item8);
            ddlHoraVacina.Items.Add(item9);
            ddlHoraVacina.Items.Add(item10);
            ddlHoraVacina.Items.Add(item11);
            ddlHoraVacina.Items.Add(item12);
            ddlHoraVacina.Items.Add(item13);
            ddlHoraVacina.Items.Add(item14);
            ddlHoraVacina.Items.Add(item15);
            ddlHoraVacina.Items.Add(item16);
            ddlHoraVacina.Items.Add(item17);
            ddlHoraVacina.Items.Add(item18);
            ddlHoraVacina.Items.Add(item19);
            ddlHoraVacina.Items.Add(item20);
            ddlHoraVacina.Items.Add(item21);
            ddlHoraVacina.Items.Add(item22);
            ddlHoraVacina.Items.Add(item23);
        }

        protected void ddlHoraConsulta_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlHoraConsulta.SelectedItem.Value != "")
                erro3.Attributes["class"] = "escondido";
        }

        protected void ddlHoraVacina_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlHoraVacina.SelectedItem.Value != "")
                erro4.Attributes["class"] = "escondido";
        }

    }
}
