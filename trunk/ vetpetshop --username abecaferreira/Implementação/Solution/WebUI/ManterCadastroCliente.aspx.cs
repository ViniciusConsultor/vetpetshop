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
using System.Web.Caching;


namespace WebUI
{
    public partial class ManterCadastroCliente : System.Web.UI.Page
    {
        public DateTime datNascimento, datIniVacinacao, datFimVacinacao;

        protected void Page_Load(object sender, EventArgs e)
        {
            #region Criação de Menu
            Menu menu = (Menu)Page.Master.FindControl("Menu1");
            SiteMapDataSource siteVendedor = (SiteMapDataSource)Page.Master.FindControl("vend");
            menu.DataSource = siteVendedor;
            menu.DataBind();
            #endregion
            
            lblMsg.Text = "";

            if (!IsPostBack)
            {
                CarregaListaTipoAnimal();

                string CodCliente = Request.Params["CodCliente"];

                if (CodCliente != null)
                {
                    PreencheUsuario(Convert.ToInt32(CodCliente));
                }

                string CodClienteAlt = Request.Params["CodClienteAlt"];

                if (CodClienteAlt != null)
                {
                    RemoveCache();
                    PreencheAlterarCliente(Convert.ToInt32(CodClienteAlt));
                }
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

            if (pnlPet.Visible != false) {
                PegaUltimoIdCliente();
                RealizaCadastroAnimal();
            }
        }

        protected void PegaUltimoIdCliente()
        {
            ClienteBuss clienteBus = new ClienteBuss();
            
            ViewState["hdnCodCliente"] = Convert.ToString(clienteBus.PegaUltimoIdCliente());
        
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
                lblMsg.Text = "Cadastro efetuado com sucesso";
                txtNomeCli.Text = "";
                txtCPF.Text = "";
                txtRG.Text = "";
                txtTel.Text = "";
                txtCel.Text = "";
                txtEmail.Text = "";
                txtEndereco.Text = "";
                txtBairro.Text = "";
                txtCidade.Text = "";
                txtEstado.Text = "";
                txtCep.Text = "";
            }
            else
            {
                lblMsg.Text = "O cadastro não foi efetuado. Falha de conexão com o banco de dados";
            }
     }

        protected void AlterarCadastroCliente()
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

            cliente.IdCliente = Convert.ToInt32(ViewState["hdnCodCliente"]);
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
            executou = clienteBus.AlterarCliente(cliente);

            if (executou)
            {
                lblMsg.Text = "Alteração efetuada com sucesso";
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
                Response.Redirect("ManterCadastroCliente.aspx");
            }
            else
            {
                lblMsg.Text = "A alteração não foi efetuada. Falha de conexão com o banco de dados";
            }
     }
        
        protected void RemoveCache() 
        {
            Cache.Remove("txtNomeCli");
            Cache.Remove("txtCPF");
            Cache.Remove("txtRG");
            Cache.Remove("txtTel");
            Cache.Remove("txtCel");
            Cache.Remove("txtEmail");
            Cache.Remove("txtEndereco");
            Cache.Remove("txtBairro");
            Cache.Remove("txtEstado");
            Cache.Remove("txtCep");
            
            Cache.Remove("txtNomeAnimal");
            Cache.Remove("txtPeso");
            Cache.Remove("txtRaca");
            Cache.Remove("txtNascimento");
            
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
                            txtNascimento.Text = Convert.ToString(System.DateTime.ParseExact(txtNascimento.Text, "dd/MM/yyyy", null));
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
                    animal.IdTipoAnimal = Convert.ToInt32(ddlTipoAnimal.SelectedValue);
                    animal.IdCliente = Convert.ToInt32(CodCliente);
                    executou = animalBus.InserirAnimal(animal);

                    if (executou)
                    {
                        lblMsg.Text = "Cadastro efetuado com sucesso";
                        txtNomeAnimal.Text = "";
                        txtPeso.Text = "";
                        txtRaca.Text = "";
                        txtNascimento.Text = "";
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

        protected void PreencheAlterarCliente(Int32 CodCliente) {

            ClienteBuss clienteBus = new ClienteBuss();
            List<Cliente> _listaCliente = new List<Cliente>();

            _listaCliente = clienteBus.PreencheUsuario(CodCliente);

            foreach (Cliente cliente in _listaCliente)
            {
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
            pnlPet.Visible = false;
            btnNovoPet.Visible = false;
            btnSalvar.Visible = false;
            btnSalvar2.Visible = false;
            BtnUpdateCli.Visible = true;

        }

        protected void BtnUpdateCli_Click(object sender, EventArgs e)
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

            cliente.IdCliente = Convert.ToInt32(ViewState["hdnCodCliente"]);
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
            executou = clienteBus.AlterarCliente(cliente);

            if (executou)
            {
                lblMsg.Text = "Alteração de cliente efetuada com sucesso";
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
                lblMsg.Text = "A alteração não foi efetuada. Falha de conexão com o banco de dados";
            }
            //AlterarCadastroCliente();
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
