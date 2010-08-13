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
                ExibeGrid();
            }
        }

        private void ExibeGrid()
        {
            ClienteBuss clienteBus = new ClienteBuss();
            DataTable tabela = MontarTabela();
            DataTable _tabelaPreenchida = clienteBus.ListarClientes(tabela);
            if (_tabelaPreenchida.Rows.Count != 0)
            {
                grClientes.Visible = true;
                grClientes.DataSource = _tabelaPreenchida;
                grClientes.DataBind();
            }
            else
                grClientes.Visible = false;
        }

        protected void btnOk_Click(object sender, EventArgs e)
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
            cliente.Telefone = txtTel.Text;                
            cliente.Email = txtEmail.Text;                
            executou = clienteBus.InserirCliente(cliente);

            if (executou)
            {
                lblMsg.Text = "Cadastro efetuado com sucesso";
                txtNomeCli.Text = "";
                txtCPF.Text = "";
                txtTel.Text = "";
                txtEmail.Text = "";
                ExibeGrid();
            }

            else
            {
                lblMsg.Text = "O cadastro não foi efetuado. Falha de conexão com o banco de dados";
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

        protected void grClientes_RowCommand(object sender, GridViewCommandEventArgs e)
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
        }

        protected void grClientes_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='Yellow'");
                // This will be the back ground color of the GridView Control
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='White'");
            }
        }     
    }
}
