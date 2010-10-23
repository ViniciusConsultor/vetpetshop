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
    public partial class AgendarConsulta : System.Web.UI.Page
    {
        decimal Valor;
        int tipoCons;
        public DateTime datProxVacinacao; 
        public DateTime datConsulta;
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
                CarregarClientes();
            }
        }

        protected void CarregarClientes()
        {

            ClienteBuss clienteBus = new ClienteBuss();
            List<Cliente> _listaClientes = new List<Cliente>();
            _listaClientes = clienteBus.ListarDDLClientes();

            ListItem _item = new ListItem("Selecione", "0");
            ddlClientes.Items.Insert(0, _item);

            foreach (Cliente cliente in _listaClientes)
            {
                ListItem item = new ListItem(cliente.Nome.ToString(), cliente.IdCliente.ToString());
                ddlClientes.Items.Add(item);
            }

        }

        protected void ddlClientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblMsg.Text = "";
            Int32 idCliente;
            idCliente = Int32.Parse(ddlClientes.SelectedValue);
            ddlAnimal.Enabled = true;
            if (idCliente != 0)
            {
                CarregarAnimaisCliente(idCliente);
            }
            else
            {
                ddlAnimal.Items.Clear();
                ddlAnimal.Enabled = false;
                //txtData.Text = "";
                pnlAnimal.Visible = false;
            }

        }

        protected void CarregarAnimaisCliente(Int32 idCliente)
        {
            AnimalBuss animalBus = new AnimalBuss();
            List<Animal> _listaAnimais = new List<Animal>();
            _listaAnimais = animalBus.ListarDDLAnimais(idCliente);

            ListItem _item = new ListItem("Selecione", "0");
            ddlAnimal.Items.Insert(0, _item);

            foreach (Animal Animal in _listaAnimais)
            {
                ListItem item = new ListItem(Animal.Nome.ToString(), Animal.IdAnimal.ToString());
                ddlAnimal.Items.Add(item);
            }

        }

        protected void ddlAnimal_SelectedIndexChanged(object sender, EventArgs e)
        {
            Int32 idAnimal;
            idAnimal = Int32.Parse(ddlAnimal.SelectedValue);
            if (idAnimal != 0)
            {
                pnlAnimal.Visible = true;
               // CarregarGrid(idAnimal);
                txtData.Enabled = true;               

            }
            else
            {
                pnlAnimal.Visible = false;
                txtData.Text = "";
                txtData.Enabled = false;
            }

        }

        protected void CarregarGrid(Int32 idAnimal)
        {
            DataTable tabelaPreenchida = Preencher(idAnimal);

            if (tabelaPreenchida.Rows.Count != 0)
            {
                gdvAnimal.DataSource = tabelaPreenchida;
                gdvAnimal.DataBind();
            }
        }

        private DataTable Preencher(Int32 idAnimal)
        {
            Animal animal = new Animal();

            DataTable tabela = new DataTable();
            DataTable tabelaPreenchida = new DataTable();
            tabela = MontarTabela();

            AnimalBuss animalBuss = new AnimalBuss();
            tabelaPreenchida = animalBuss.ObterConsultasAnimal(tabela, idAnimal);
            return tabelaPreenchida;
        }

        private DataTable MontarTabela()
        {
            DataTable _tabela = new DataTable();

            DataColumn coluna0 = new DataColumn("id_consulta");
            DataColumn coluna1 = new DataColumn("dataconsulta");
            DataColumn coluna2 = new DataColumn("status");
            DataColumn coluna3 = new DataColumn("valor");

            _tabela.Columns.Add(coluna0);
            _tabela.Columns.Add(coluna1);
            _tabela.Columns.Add(coluna2);
            _tabela.Columns.Add(coluna3);
       
            return _tabela;
        }

        protected void btnAgendar_Click(object sender, EventArgs e)
        {
            Int32 idAnimal;
            idAnimal = Int32.Parse(ddlAnimal.SelectedItem.Value);

            if (Panel1.Visible == true)
            {
                if (txtData.Text == "")
                {
                    lblMsg.Text = "Digite a data consulta";
                    return;
                }

                datConsulta = System.DateTime.ParseExact(txtData.Text, "dd/MM/yyyy", null); 
            }

            if (PanelVacina.Visible == true)
            {
                if (txtDataVacinacao.Text == "")
                {
                    lblMsg.Text = "Digite a data da próxima vacinação";
                    return;
                }

                datProxVacinacao = System.DateTime.ParseExact(txtDataVacinacao.Text, "dd/MM/yyyy", null);
            }           

            if (idAnimal != 0)
            {
                pnlAnimal.Visible = true;
                AgendamentoConsulta(idAnimal);
            }
            else
            {
                lblMsg.Text = "Selecione um animal para o agendamento da consulta";
            }
        }

        protected void AgendamentoConsulta(Int32 idAnimal)
        {
            Int32 Status;
            
            AnimalBuss animalBuss = new AnimalBuss();

            if (!string.IsNullOrEmpty(txtValor.Text))
            {
                Valor = Convert.ToDecimal(txtValor.Text);
            }

            //if (!string.IsNullOrEmpty(txtDataVacinacao.Text))
            //{
            //    datProxVacinacao = System.DateTime.ParseExact(txtDataVacinacao.Text, "dd/MM/yyyy", null);
            //}

            Status = Convert.ToInt32(rblStatus.SelectedItem.Value);

            if (rbTipo.SelectedItem.Value == "1")
                tipoCons = 1;
            else
                tipoCons = 2;

            bool executou;
            
            executou = animalBuss.AgendamentoConsulta(usuario.Id , idAnimal, Valor, datConsulta, Status, tipoCons, datProxVacinacao);

            if (executou)
            {
                //CarregarGrid(idAnimal);
                txtDataVacinacao.Text = "";
                txtData.Text = "";
                lblMsg.Text = "Agendamento realizado com sucesso";
                txtValor.Text = "";
                //ddlAnimal.SelectedIndex = ddlAnimal.Items.IndexOf(ddlAnimal.Items.FindByText(""));
                ddlClientes.SelectedIndex = ddlClientes.Items.IndexOf(ddlClientes.Items.FindByText("Selecione"));
                ddlAnimal.Items.Clear();
                ddlAnimal.Enabled = false;
                rbTipo.SelectedIndex = rbTipo.Items.IndexOf(rbTipo.Items.FindByValue("1"));
                PanelVacina.Visible = false;
                Panel1.Visible = true;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("DefaultVeterinario.aspx");
        }

        protected void rbTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbTipo.SelectedItem.Value == "2")
            {
                PanelVacina.Visible = true;
                Panel1.Visible = false;
            }
            else
            {
                PanelVacina.Visible = false;
                Panel1.Visible = true; 
            }
        }
    }
}
