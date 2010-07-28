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
    public partial class ManterUsuario : System.Web.UI.Page
    {
          
        protected void Page_Load(object sender, EventArgs e)
        {
            #region Criação de Menu
            Menu menu = (Menu)Page.Master.FindControl("Menu1");
            SiteMapDataSource siteAdmin = (SiteMapDataSource)Page.Master.FindControl("adm");
            menu.DataSource = siteAdmin;
            menu.DataBind();
            #endregion

            lblMsg.Text = "";

            if (!IsPostBack)
            {
                CarregarTipoUsuario();
                ExibeGrid();
            }
        }

        private void ExibeGrid()
        {
            UsuarioBuss usuarioBus = new UsuarioBuss();            
            DataTable tabela = MontarTabela();
            DataTable _tabelaPreenchida = usuarioBus.ListarUsuarios(tabela);
            if (_tabelaPreenchida.Rows.Count != 0)
            {
                grUsuarios.Visible = true;
                grUsuarios.DataSource = _tabelaPreenchida;
                grUsuarios.DataBind();
            }
            else
                grUsuarios.Visible = false;
        }

        private void CarregarTipoUsuario()
        {        
            ListItem liSelecione = new ListItem("Selecione", "");
            ListItem _li = new ListItem("Administrador", "Admin");
            ListItem _li1 = new ListItem("Vendedor", "Vend");
            ListItem _li2 = new ListItem("Veterinário", "Vet");

            ddlTipoUsu.Items.Add(liSelecione);
            ddlTipoUsu.Items.Add(_li);
            ddlTipoUsu.Items.Add(_li1);
            ddlTipoUsu.Items.Add(_li2);
        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            bool executou = false;
            UsuarioBuss usuarioBus = new UsuarioBuss();
            Usuario usuario = new Usuario();
            Administrador admin = new Administrador();
            Veterinario vet = new Veterinario();
            Vendedor vend = new Vendedor();

            #region Validações
            if (ddlTipoUsu.SelectedItem.Text == "Selecione")
            {
                lblMsg.Text = "Selecione um tipo de usuário";
                return;
            }

            if (txtNomeUsu.Text == "")
            {
                lblMsg.Text = "Preencha o nome de usuário";
                return;
            }

            if (txtNomePro.Text == "")
            {
                lblMsg.Text = "Preencha o nome do profissional";
                return;
            }            

            if (txtSenha.Text == "")
            {
                lblMsg.Text = "O campo senha deve estar preenchido";
                return;
            }
            #endregion

            if (ddlTipoUsu.SelectedItem.Value == "Admin")
            {
                usuario.Nome = txtNomeUsu.Text;
                usuario.TipoUsuario = 1;
                usuario.Senha = txtSenha.Text;               
                admin.Nome = txtNomePro.Text;
                executou = usuarioBus.InserirUsuarioAdmin(admin, usuario);
            }

            else if (ddlTipoUsu.SelectedItem.Value == "Vet")
            {
                usuario.Nome = txtNomeUsu.Text;
                usuario.TipoUsuario = 2;
                usuario.Senha = txtSenha.Text;                
                vet.Nome = txtNomePro.Text;
                executou = usuarioBus.InserirUsuarioVeterinario(vet, usuario);
            }

            else
            {
                usuario.Nome = txtNomeUsu.Text;
                usuario.TipoUsuario = 3;
                usuario.Senha = txtSenha.Text;                
                vend.Nome = txtNomePro.Text;
                executou = usuarioBus.InserirUsuarioVendedor(vend, usuario);
            }

            if (executou)
            {
                lblMsg.Text = "Cadastro efetuado com sucesso";
                txtSenha.Text = "";
                txtNomeUsu.Text = "";
                txtNomePro.Text = "";
                ddlTipoUsu.SelectedItem.Value = "";
                ExibeGrid();
            }

            else
            {
                lblMsg.Text = "O cadastro não foi efetuado. Falha de conexão com o banco de dados";
            }    
        }

        private DataTable MontarTabela()
        {
            DataTable _tabela = new DataTable("Usuarios");
            DataColumn _coluna0;
            DataColumn _coluna1;
            DataColumn _coluna2;
            DataColumn _coluna3;            

            _coluna0 = new DataColumn("id_usuario");
            _coluna1 = new DataColumn("nm_usuario");
            _coluna2 = new DataColumn("nm_prof");
            _coluna3 = new DataColumn("tipo_prof");

            _tabela.Columns.Add(_coluna0);
            _tabela.Columns.Add(_coluna1);
            _tabela.Columns.Add(_coluna2);
            _tabela.Columns.Add(_coluna3);

            return _tabela;            
        }

       
        protected void lkGera_Click(object sender, EventArgs e)
        {
            //Exemplo de utilização da classe
            Random random = new Random();
            int i = random.Next(0, 100);

            int Tamanho = 15; // Numero de digitos da senha
            string senha = string.Empty;
            for (i = 0; i < Tamanho; i++)
            {
                random = new Random();
                int codigo = Convert.ToInt32(random.Next(48, 122).ToString());

                if ((codigo >= 48 && codigo <= 57) || (codigo >= 97 && codigo <= 122))
                {
                    string _char = ((char)codigo).ToString();
                    if (!senha.Contains(_char))
                    {
                        senha += _char;
                    }
                    else
                    {
                        i--;
                    }
                }
                else
                {
                    i--;
                }
            }

            txtSenha.Text = senha;            
        }

        protected void grUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "excluir")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                UsuarioBuss usuarioBus = new UsuarioBuss();
                bool executou = usuarioBus.ExcluirUsuario(Convert.ToInt32(id));

                if (executou)
                {
                    lblMsg.Text = "Usuário excluído com sucesso";
                    ExibeGrid();
                }

                else
                {
                    lblMsg.Text = "Não foi possível excluir o usuário selecionado. Falha de conexão com banco de dados";
                }                
            }
        }      
    }
}
