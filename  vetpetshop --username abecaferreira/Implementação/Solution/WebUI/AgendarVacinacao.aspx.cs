﻿using System;
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
    public partial class AgendarVacinacao : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            #region Criação de Menu
            Menu menu = (Menu)Page.Master.FindControl("Menu1");
            SiteMapDataSource siteVet = (SiteMapDataSource)Page.Master.FindControl("vet");
            menu.DataSource = siteVet;
            menu.DataBind();
            #endregion
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
                CarregarGrid(idAnimal);
                txtData.Enabled = true;
                txtDataProx.Enabled = true;
                foreach (GridViewRow row in gdvAnimal.Rows)
                {
                    txtData.Text = row.Cells[5].Text;
                    txtDataProx.Text = row.Cells[6].Text;
                }                
                
            }
            else
            {
                pnlAnimal.Visible = false;
                txtData.Text = "";
                txtDataProx.Text = "";
                txtData.Enabled = false;
                txtDataProx.Enabled = false;
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
            tabelaPreenchida = animalBuss.ConsultarAnimal(tabela, idAnimal);
            return tabelaPreenchida;
        }

        private DataTable MontarTabela()
        {
            DataTable _tabela = new DataTable();

            DataColumn coluna0 = new DataColumn("id_animal");
            DataColumn coluna1 = new DataColumn("nm_animal");
            DataColumn coluna2 = new DataColumn("raca");
            DataColumn coluna3 = new DataColumn("peso");
            DataColumn coluna4 = new DataColumn("nascimento");
            DataColumn coluna5 = new DataColumn("datavacinacao");
            DataColumn coluna6 = new DataColumn("dataproxvacinacao");
         
            _tabela.Columns.Add(coluna0);
            _tabela.Columns.Add(coluna1);
            _tabela.Columns.Add(coluna2);
            _tabela.Columns.Add(coluna3);
            _tabela.Columns.Add(coluna4);
            _tabela.Columns.Add(coluna5);
            _tabela.Columns.Add(coluna6);
    
            return _tabela;
        }

        protected void btnAgendar_Click(object sender, EventArgs e)
        {
            Int32 idAnimal;
            idAnimal = Int32.Parse(ddlAnimal.SelectedValue);
            if (idAnimal != 0)
            {
                pnlAnimal.Visible = true;
                AgendamentoVacinacao(idAnimal);                             
            }
            else
            {
                lblMsg.Text = "Selecione um animal para o agendamento da vacinação";
            }
        }

        protected void AgendamentoVacinacao(Int32 idAnimal)
        {
            DateTime datVacinacao = new DateTime();
            DateTime datProxVacinacao = new DateTime(); 
            AnimalBuss animalBuss = new AnimalBuss();

            bool executou;

            try
            {
               datVacinacao = System.DateTime.ParseExact(txtData.Text, "dd/MM/yyyy", null);
            }
            catch
            {
                lblMsg.Text = "Data de vacinacao inválida";
                return;
            }
            try
            {
                datProxVacinacao = System.DateTime.ParseExact(txtDataProx.Text, "dd/MM/yyyy", null);
            }
            catch
            {
                lblMsg.Text = "Data da próxima vacinacao inválida";
                return;
            }

            executou = animalBuss.AgendamentoVacinacao(idAnimal, datVacinacao, datProxVacinacao);

            if (executou)
            {
                
            }
        }
         
    }
}
