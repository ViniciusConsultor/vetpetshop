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
        string datacompleta;
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
                CarregarClientes();
                CarregaListaHora();
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

        protected void CarregaListaHora()
        {
            ListItem itemSelecione = new ListItem("----", "");
            ListItem item1  = new ListItem("08:00", "08:00");
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

            ddlHora.Items.Add(itemSelecione);
            ddlHora.Items.Add(item1);
            ddlHora.Items.Add(item2);
            ddlHora.Items.Add(item3);
            ddlHora.Items.Add(item4);
            ddlHora.Items.Add(item5);
            ddlHora.Items.Add(item6);
            ddlHora.Items.Add(item7);
            ddlHora.Items.Add(item8);
            ddlHora.Items.Add(item9);
            ddlHora.Items.Add(item10);
            ddlHora.Items.Add(item11);
            ddlHora.Items.Add(item12);
            ddlHora.Items.Add(item13);
            ddlHora.Items.Add(item14);
            ddlHora.Items.Add(item15);
            ddlHora.Items.Add(item16);
            ddlHora.Items.Add(item17);
            ddlHora.Items.Add(item18);
            ddlHora.Items.Add(item19);
            ddlHora.Items.Add(item20);
            ddlHora.Items.Add(item21);
            ddlHora.Items.Add(item22);
            ddlHora.Items.Add(item23);
        }

        protected void ddlClientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblMsg.Text = "";
            Int32 idCliente;
            idCliente = Int32.Parse(ddlClientes.SelectedValue);
            ddlAnimal.Enabled = true;
            pnlAnimal.Visible = false;
            if (idCliente != 0)
            {
                erro2.Attributes["class"] = "escondido";
                ddlAnimal.Items.Clear();
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

            if (_listaAnimais.Count() > 0)
            {
                ddlAnimal.Items.Insert(0, _item);

                foreach (Animal Animal in _listaAnimais)
                {
                    ListItem item = new ListItem(Animal.Nome.ToString(), Animal.IdAnimal.ToString());
                    ddlAnimal.Items.Add(item);
                }
            }
            else 
            {
                ListItem _itemVazio = new ListItem("Cliente não possui animais cadastrados", "0");
                ddlAnimal.Items.Insert(0, _itemVazio);
                ddlAnimal.Enabled = false;
            }
            

        }

        protected void ddlAnimal_SelectedIndexChanged(object sender, EventArgs e)
        {
            Int32 idAnimal;
            idAnimal = Int32.Parse(ddlAnimal.SelectedValue);
            if (idAnimal != 0)
            {
                erro1.Attributes["class"] = "escondido";
                pnlAnimal.Visible = true;
                CarregarGrid(idAnimal);
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

            if (tabelaPreenchida.Rows.Count > 0)
            {
                gdvAnimal.DataSource = tabelaPreenchida;
                gdvAnimal.DataBind();
            }
            else 
            {
                pnlAnimal.Visible = false;
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
            DataColumn coluna1 = new DataColumn("tipoconsulta");
            DataColumn coluna2 = new DataColumn("dataconsulta");
            DataColumn coluna3 = new DataColumn("status");
            DataColumn coluna4 = new DataColumn("valor");

            _tabela.Columns.Add(coluna0);
            _tabela.Columns.Add(coluna1);
            _tabela.Columns.Add(coluna2);
            _tabela.Columns.Add(coluna3);
            _tabela.Columns.Add(coluna4);
       
            return _tabela;
        }

        protected void btnAgendar_Click(object sender, EventArgs e)
        {

            Int32 idAnimal;
            AnimalBuss animalBuss = new AnimalBuss();

            if (ddlHora.SelectedItem.Value == "")
            {
                erro3.Attributes["class"] = "mostrar";
                return;
            }

            if (Panel1.Visible == true)
            {
                if (txtData.Text != "")
                {
                    string dia = txtData.Text.Substring(0, 2);
                    string mes = txtData.Text.Substring(3, 2);
                    string ano = txtData.Text.Substring(6, 4);

                    string datacompleta = ano + "-" + mes + "-" + dia + " " + "00:00:00.000";

                    bool achou = animalBuss.VerificarHoraDataConsulta(datacompleta, ddlHora.SelectedItem.Value);
                    if (achou)
                    {
                        lblMsg.Text = "Já existe uma consulta nesta data com o horário selecionado. Selecione outro horário";
                        return;
                    }
                }
            }

            if (PanelVacina.Visible == true)
            {
                if (txtDataVacinacao.Text != "")
                {
                    string dia = txtDataVacinacao.Text.Substring(0, 2);
                    string mes = txtDataVacinacao.Text.Substring(3, 2);
                    string ano = txtDataVacinacao.Text.Substring(6, 4);

                    datacompleta = ano + "-" + mes + "-" + dia + " " + "00:00:00.000";

                    bool achou = animalBuss.VerificarHoraDataConsulta(datacompleta, ddlHora.SelectedItem.Value);
                    if (achou)
                    {
                        lblMsg.Text = "Já existe uma consulta nesta data com o horário selecionado. Selecione outro horário";
                        return;
                    }
                }
            }




            if (Panel1.Visible == true)
            {
                //if (txtData.Text == "")
                //{
                //    lblMsg.Text = "Digite a data consulta";
                //    return;
                //}

                datConsulta = System.DateTime.ParseExact(txtData.Text, "dd/MM/yyyy", null); 
            }

            if (PanelVacina.Visible == true)
            {
                //if (txtDataVacinacao.Text == "")
                //{
                //    lblMsg.Text = "Digite a data da próxima vacinação";
                //    return;
                //}

                datProxVacinacao = System.DateTime.ParseExact(txtDataVacinacao.Text, "dd/MM/yyyy", null);
            }

            if (ddlClientes.SelectedItem.Value != "0")
            {
                if (ddlAnimal.SelectedItem.Value != "0")
                {
                    idAnimal = Int32.Parse(ddlAnimal.SelectedItem.Value);
                    pnlAnimal.Visible = true;
                    AgendamentoConsulta(idAnimal);
                }
                else
                {
                    erro1.Attributes["class"] = "mostrar";
                    return;
                }
            }
            else 
            {
                erro2.Attributes["class"] = "mostrar";
                return;
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
            
            executou = animalBuss.AgendamentoConsulta(usuario.Id , idAnimal, Valor, datConsulta, Status, tipoCons, datProxVacinacao,ddlHora.SelectedItem.Value);

            if (executou)
            {
                CarregarGrid(Int32.Parse(ddlAnimal.SelectedValue));
                txtDataVacinacao.Text = "";
                txtData.Text = "";
                lblMsg.Text = "Agendamento realizado com sucesso";
                txtValor.Text = "";
                ddlHora.SelectedIndex = 0;
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

        protected void ddlHora_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlHora.SelectedItem.Value != "")
                erro3.Attributes["class"] = "escondido";
        }
    }
}
