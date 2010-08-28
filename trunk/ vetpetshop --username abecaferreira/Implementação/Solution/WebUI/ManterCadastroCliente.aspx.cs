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
    public partial class ManterCadastroCliente : System.Web.UI.Page
    {
        public DateTime datNascimento, datIniVacinacao, datFimVacinacao;

        protected void Page_Load(object sender, EventArgs e)
        {
            #region Criação de Menu
            Menu menu = (Menu)Page.Master.FindControl("Menu1");
            SiteMapDataSource siteAdmin = (SiteMapDataSource)Page.Master.FindControl("vend");
            menu.DataSource = siteAdmin;
            menu.DataBind();
            #endregion
            
            lblMsg.Text = "";

            if (!IsPostBack)
            {
                CarregaListaTipoAnimal();
                //ExibeGrid();
            }

        }

        private void CarregaListaTipoAnimal()
        {
            TipoAnimalBuss tipoAnimalBuss = new TipoAnimalBuss();

            List<TipoAnimal> _listaTipoAnimal = new List<TipoAnimal>();
            _listaTipoAnimal = tipoAnimalBuss.ListarTiposAnimal();

            ListItem _item = new ListItem("Selecione", "");
            ddlTipoAnimal.Items.Add(_item);

            foreach (TipoAnimal tipoanimal in _listaTipoAnimal)
            {
                ListItem item = new ListItem(tipoanimal.Nome.ToString(), tipoanimal.Id.ToString());
                ddlTipoAnimal.Items.Add(item);
            }
        }

        private DataTable MontarTabela()
        {
            DataTable _tabela = new DataTable("Clientes");
            DataColumn _coluna0;
            DataColumn _coluna1;
            DataColumn _coluna2;
            DataColumn _coluna3;
            DataColumn _coluna4;

            _coluna0 = new DataColumn("id_cliente");
            _coluna1 = new DataColumn("nm_cliente");
            _coluna2 = new DataColumn("nm_cpf");
            _coluna3 = new DataColumn("nm_tel");
            _coluna4 = new DataColumn("nm_email");

            _tabela.Columns.Add(_coluna0);
            _tabela.Columns.Add(_coluna1);
            _tabela.Columns.Add(_coluna2);
            _tabela.Columns.Add(_coluna3);
            _tabela.Columns.Add(_coluna4);

            return _tabela;
        }

        protected void btnNovoPet_Click(object sender, EventArgs e)
        {
            pnlPet.Visible = true;
        }

        //protected void btnOk_Click(object sender, EventArgs e)
        //{
        //    bool executou = false;
        //    ClienteBuss clienteBus = new ClienteBuss();
        //    Cliente cliente = new Cliente();

        //    #region Validações
        //    if (txtNomeCli.Text == "")
        //    {
        //        lblMsg.Text = "Preencha o nome do cliente";
        //        return;
        //    }

        //    if (txtCPF.Text == "")
        //    {
        //        lblMsg.Text = "Preencha o cpf do cliente";
        //        return;
        //    }

        //    if (txtTel.Text == "")
        //    {
        //        lblMsg.Text = "Preencha o telefone do cliente";
        //        return;
        //    }
        //    if (txtEmail.Text == "") 
        //    {
        //        lblMsg.Text = "Preencha o email do cliente";
        //    }
        //    #endregion

        //    cliente.Nome = txtNomeCli.Text;
        //    cliente.CPF = txtCPF.Text;
        //    cliente.Telefone1 = txtTel.Text;                
        //    cliente.Telefone2 = txtCel.Text;
        //    cliente.RG = txtRG.Text;
        //    cliente.Endereco = txtEndereco.Text;
        //    cliente.Bairro = txtBairro.Text;
        //    cliente.Cidade = txtCidade.Text;
        //    cliente.Estado = txtEstado.Text;
        //    cliente.CEP = txtCep.Text;
        //    cliente.Email = txtEmail.Text;                
        //    executou = clienteBus.InserirCliente(cliente);

        //    if (executou)
        //    {
        //        lblMsg.Text = "Cadastro efetuado com sucesso";
        //        txtNomeCli.Text = "";
        //        txtCPF.Text = "";
        //        txtRG.Text = "";
        //        txtTel.Text = "";
        //        txtCel.Text = "";
        //        txtEmail.Text = "";
        //        txtEndereco.Text = "";
        //        txtBairro.Text = "";
        //        txtEstado.Text = "";
        //        txtCel.Text = "";

        //        //ExibeGrid();
        //    }

        //    else
        //    {
        //        lblMsg.Text = "O cadastro não foi efetuado. Falha de conexão com o banco de dados";
        //    }  
        //}

        protected void btnSalvar_Click(object sender, EventArgs e)
        {

            bool executouCli = false;
            bool executouAni = false;

            string CodCliente = ViewState["hdnCodCliente"].ToString();
            ClienteBuss clienteBus = new ClienteBuss();
            Cliente cliente = new Cliente();

            AnimalBuss animalBus = new AnimalBuss();
            Animal animal = new Animal();

            #region Validações
          
            if (txtNascimento.Text != string.Empty) 
            {
	                try 
                    {
			            datNascimento = System.DateTime.ParseExact(txtNascimento.Text, "dd/MM/yyyy", null);
		            } catch 
                    {
			            lblMsg.Text = "Data de nascimento inválida";
			            return;
		            }

                    if (txtNomeCli.Text == "")
                    {
                        lblMsg.Text = "Preencha o nome do cliente";
                        return;
                    }

                    if (txtCPF.Text == "")
                    {
                        lblMsg.Text = "Preencha o cpf do cliente";
                        return;
                    }

                    if (txtTel.Text == "")
                    {
                        lblMsg.Text = "Preencha o telefone do cliente";
                        return;
                    }
                    if (txtEmail.Text == "")
                    {
                        lblMsg.Text = "Preencha o email do cliente";
                    }
	        }              
            
            #endregion

            //Cliente
            cliente.Nome = txtNomeCli.Text;
            cliente.CPF = txtCPF.Text;
            cliente.Telefone1 = txtTel.Text;
            cliente.Telefone2 = txtCel.Text;
            cliente.RG = txtRG.Text;
            cliente.Endereco = txtEndereco.Text;
            cliente.Bairro = txtBairro.Text;
            cliente.Cidade = txtCidade.Text;
            cliente.Estado = txtEstado.Text;
            cliente.CEP = txtCep.Text;
            cliente.Email = txtEmail.Text;
            executouCli = clienteBus.InserirCliente(cliente);

            //Animal
            animal.Nome = txtNomeAnimal.Text;
            animal.Peso = Decimal.Parse(txtPeso.Text);
            animal.Raca = txtRaca.Text;
            animal.DataNascimento = txtNascimento.Text;
            animal.DataProxVacinacao = txtFimVacinacao.Text;
            animal.DataFimVacinacao = txtFimVacinacao.Text;
            animal.IdTipoAnimal = Int32.Parse(ddlTipoAnimal.SelectedValue);
            animal.IdCliente = Int32.Parse(CodCliente);
            executouAni = animalBus.InserirAnimal(animal);

            if (executouCli)
            {
                lblMsg.Text = "Cadastro efetuado com sucesso";
                txtNomeCli.Text = "";
                txtCPF.Text = "";
                txtRG.Text = "";
                txtTel.Text = "";
                txtCel.Text = "";
                txtEmail.Text = "";
                txtEndereco.Text = "";
                txtBairro.Text = "";
                txtEstado.Text = "";
                txtCep.Text = "";

            }

            else
            {
                lblMsg.Text = "O cadastro não foi efetuado. Falha de conexão com o banco de dados";
            }
        }

        //protected void BtnBuscar_Click(object sender, EventArgs e)
        //{
        //    ModalPopupExtender1.Show();
        //    ddlTdsClientes.Items.Clear();
        //    txtNomeCli.Text = "";
        //    txtCPF.Text = "";
        //    txtRG.Text = "";
        //    txtTel.Text = "";
        //    txtEmail.Text = "";
        //    txtCep.Text = "";
        //    txtCel.Text = "";
        //    txtEndereco.Text = "";
        //    txtBairro.Text = "";
        //    txtCidade.Text = "";
        //    txtEstado.Text = "";
        //    BuscarClientes();
        //}

        protected void BuscarClientes()
        {

            //bool executou = false;
            ClienteBuss clienteBus = new ClienteBuss();
            List<Cliente> _listaClientes = new List<Cliente>();
            _listaClientes = clienteBus.ListarDDLClientes();
                
            ListItem _item = new ListItem("Selecione", "");
            ddlTdsClientes.Items.Add(_item);

            foreach (Cliente cliente in _listaClientes)
                {
                    ListItem item = new ListItem(cliente.Nome.ToString(), cliente.IdCliente.ToString());
                    ddlTdsClientes.Items.Add(item);
                }

            txtNomeCli.Visible = false;
            ddlTdsClientes.Visible = true;
            lblMsg.Text = "Carregamento concluído";
        }

        protected void ddlTdsClientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            //DropDownList d = (DropDownList)sender;

            Int32 CodUsuario;
            CodUsuario = Int32.Parse(ddlTdsClientes.SelectedValue);
            PreencheUsuario(CodUsuario);
        }

        protected void PreencheUsuario(Int32 CodUsuario)
        {
            ClienteBuss clienteBus = new ClienteBuss();
            List<Cliente> _listaClientes = new List<Cliente>();

            _listaClientes = clienteBus.PreencheUsuario(CodUsuario);

            foreach (Cliente cliente in _listaClientes) {
                txtNomeCli.Text = cliente.Nome;
                txtCPF.Text = cliente.CPF;
                txtTel.Text = cliente.Telefone1;
                txtCel.Text = cliente.Telefone2;
                txtRG.Text = cliente.RG;
                txtEndereco.Text = cliente.Endereco;
                txtBairro.Text = cliente.Bairro;
                txtCidade.Text = cliente.Cidade;
                txtEstado.Text = cliente.Estado;
                txtCep.Text = cliente.CEP;
                txtEmail.Text = cliente.Email;
                ViewState["hdnCodCliente"] = cliente.IdCliente; 
            }
            lblMsg.Text = "Dados Carregados";
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("DefaultVendedor.aspx");
        }

        protected void BtnBuscar_Click(object sender, EventArgs e)
        {
            ModalPopupExtender1.Show();
        }

        /*protected void grClientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "excluir")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ClienteBuss clienteBus = new ClienteBuss();
                bool executou = clienteBus.ExcluirCliente(Convert.ToInt32(id));

                if (executou)
                {
                    lblMsg.Text = "Cliente excluído com sucesso";
                    ExibeGrid();
                }

                else
                {
                    lblMsg.Text = "Não foi possível excluir o cliente selecionado. Falha de conexão com banco de dados";
                }
            }
        }*/

        /*protected void grClientes_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='Yellow'");
                // This will be the back ground color of the GridView Control
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='White'");
            }
        }*/    
    }
}
