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

            string CodCliente = Request.Params["CodCliente"];

            if (CodCliente != null){
                PreencheUsuario(Convert.ToInt32(CodCliente));
            }

            if (!IsPostBack)
            {
                CarregaListaTipoAnimal();
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

        protected void btnNovoPet_Click(object sender, EventArgs e)
        {
            pnlPet.Visible = true;
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            RealizaCadastroCliente();
        }

        protected void RealizaCadastroCliente()
        {

            bool executou = false;
           
            ClienteBuss clienteBus = new ClienteBuss();
            Cliente cliente = new Cliente();

            #region Validações

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
            

            #endregion

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
            executou = clienteBus.InserirCliente(cliente);

            if (executou)
            {
                lblMsg.Text = "Cadastro de cliente efetuado com sucesso";
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


        protected void RealizaCadastroAnimal()
        {
                    bool executou = false;
                    string CodCliente = ViewState["hdnCodCliente"].ToString();
                    AnimalBuss animalBus = new AnimalBuss();
                    Animal animal = new Animal();

                    #region Validações

                    if (txtNascimento.Text != string.Empty)
                    {
                        try
                        {
                            datNascimento = System.DateTime.ParseExact(txtNascimento.Text, "dd/MM/yyyy", null);
                        }
                        catch
                        {
                            lblMsg.Text = "Data de nascimento inválida";
                            return;
                        }
                    }

                    #endregion
            
                    animal.Nome = txtNomeAnimal.Text;
                    animal.Peso = Convert.ToDecimal(txtPeso.Text);
                    animal.Raca = txtRaca.Text;
                    animal.DataNascimento = Convert.ToDateTime(txtNascimento.Text);
                    animal.DataProxVacinacao = Convert.ToDateTime(txtFimVacinacao.Text);
                    animal.DataFimVacinacao = Convert.ToDateTime(txtFimVacinacao.Text);
                    animal.IdTipoAnimal = Convert.ToInt32(ddlTipoAnimal.SelectedValue);
                    animal.IdCliente = Convert.ToInt32(CodCliente);
                    executou = animalBus.InserirAnimal(animal);

                    if (executou)
                    {
                        lblMsg.Text = "Cadastro de animal efetuado com sucesso";
                        txtNomeAnimal.Text = "";
                        txtPeso.Text = "";
                        txtRaca.Text = "";
                        txtNascimento.Text = "";
                        txtInicioVacinacao.Text = "";
                        txtFimVacinacao.Text = "";
                    }
                    else
                    {
                        lblMsg.Text = "O cadastro não foi efetuado. Falha de conexão com o banco de dados";
                    }
        }     

        protected void PreencheUsuario(Int32 CodCliente)
        {
            ClienteBuss clienteBus = new ClienteBuss();
            List<Cliente> _listaCliente = new List<Cliente>();

            _listaCliente = clienteBus.PreencheUsuario(CodCliente);

            foreach (Cliente cliente in _listaCliente) {
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
            btnSalvar.Visible = false;
            btnSalvar2.Visible = true;
            txtNomeCli.Enabled = false;
            txtCPF.Enabled = false;
            txtRG.Enabled = false;
            txtTel.Enabled = false;
            txtEmail.Enabled = false;
            txtCep.Enabled = false;
            txtCel.Enabled = false;
            txtEndereco.Enabled = false;
            txtBairro.Enabled = false;
            txtCidade.Enabled = false;
            txtEstado.Enabled = false;
            pnlPet.Visible = true;
            btnNovoPet.Visible = false;

        }

        protected void BtnBuscar_Click(object sender, EventArgs e)
        {
            txtCPF.Text = "";
            txtRG.Text = "";
            txtTel.Text = "";
            txtEmail.Text = "";
            txtCep.Text = "";
            txtCel.Text = "";
            txtEndereco.Text = "";
            txtBairro.Text = "";
            txtCidade.Text = "";
            txtEstado.Text = "";
            ModalPopupExtender1.Show();
        }

        protected void grClientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "selecionar")

                Response.Redirect("ManterCadastroCliente.aspx?CodCliente=" + e.CommandArgument.ToString());
        }

        protected void btnSalvar2_Click(object sender, EventArgs e)
        {
            RealizaCadastroAnimal();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("DefaultVendedor.aspx");
        }

    }
}
