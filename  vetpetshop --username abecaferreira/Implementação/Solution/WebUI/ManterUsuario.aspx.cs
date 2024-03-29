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
using System.Net.Mail;
using System.Net.Configuration;

namespace WebUI
{
    public partial class ManterUsuario : System.Web.UI.Page
    {
        Usuario usuario = new Usuario();    
          
        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = (Usuario)Session["User"];
            UsuarioBuss usuarioBuss = new UsuarioBuss();
            
            if(usuario == null)
                Response.Redirect("Login.aspx");
            else
                usuario.Id = usuarioBuss.ObterIdUsuarioPorNomeUsuario(usuario.Nome);

            #region Criação de Menu
            if (usuario.TipoUsuario == 1)
            {
                Menu menu = (Menu)Page.Master.FindControl("Menu1");
                SiteMapDataSource siteAdmin = (SiteMapDataSource)Page.Master.FindControl("adm");
                menu.DataSource = siteAdmin;
                menu.DataBind();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
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
                erro1.Attributes["class"] = "mostrar";
                //lblMsg.Text = "Selecione um tipo de usuário";
                return;
            }

            //if (txtNomeUsu.Text == "")
            //{
            //    lblMsg.Text = "Preencha o nome de usuário";
            //    return;
            //}

            //if (txtNomePro.Text == "")
            //{
            //    lblMsg.Text = "Preencha o nome do profissional";
            //    return;
            //}            

            //if (txtSenha.Text == "")
            //{
            //    lblMsg.Text = "O campo senha deve estar preenchido";
            //    return;
            //}
            #endregion

            if (ddlTipoUsu.SelectedItem.Value == "Admin")
            {
                usuario.Nome = txtNomeUsu.Text;
                usuario.TipoUsuario = 1;
                usuario.Senha = txtSenha.Text;
                usuario.Email = txtEmail.Text;
                admin.Nome = txtNomePro.Text;
                executou = usuarioBus.InserirUsuarioAdmin(admin, usuario);
            }

            else if (ddlTipoUsu.SelectedItem.Value == "Vet")
            {
                usuario.Nome = txtNomeUsu.Text;
                usuario.TipoUsuario = 2;
                usuario.Senha = txtSenha.Text;
                usuario.Email = txtEmail.Text;
                vet.Nome = txtNomePro.Text;
                executou = usuarioBus.InserirUsuarioVeterinario(vet, usuario);
            }

            else
            {
                usuario.Nome = txtNomeUsu.Text;
                usuario.TipoUsuario = 3;
                usuario.Senha = txtSenha.Text;
                usuario.Email = txtEmail.Text;
                vend.Nome = txtNomePro.Text;
                executou = usuarioBus.InserirUsuarioVendedor(vend, usuario);
            }

            if (executou)
            {
                EnviarEmail();
                lblMsg.Text = "Cadastro efetuado com sucesso";
                txtSenha.Text = "";
                txtNomeUsu.Text = "";
                txtNomePro.Text = "";
                txtEmail.Text = "";
                ddlTipoUsu.SelectedIndex = 0;
                ExibeGrid();
            }

            else
            {
                lblMsg.Text = "O cadastro não foi efetuado. Falha de conexão com o banco de dados";
            }    
        }

        private void EnviarEmail()
        {
            string remetenteEmail = "vetpetshopsystem@gmail.com";
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            mail.To.Add(txtEmail.Text);
            mail.From = new MailAddress(remetenteEmail, "Vetpetshop", System.Text.Encoding.UTF8);
            mail.Subject = "Bem-vindo ao Vetpetshop!";
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = "Olá, "  +txtNomePro.Text+ "!<BR><BR>";
            mail.Body += "Seus dados de acesso ao sistema Vetpetshop:<BR><BR>";
            mail.Body += "Login: " + txtNomeUsu.Text + "<BR>";
            mail.Body += "Senha: " + txtSenha.Text + "<BR><BR>";
            mail.Body += "Para alterar sua senha de acesso, acesse a funcionalidade 'Alterar Senha'.";

            mail.IsBodyHtml = true;

            SmtpClient client = new SmtpClient();
            client.Credentials = new System.Net.NetworkCredential(remetenteEmail, "petvet1234");
            client.Port = 25;
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;

            client.Send(mail);
            
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

                bool temNotafiscalUsuario = usuarioBus.ExisteNota(Convert.ToInt32(id));
                bool temFinanceiroUsuario = usuarioBus.ExisteFinanceiro(Convert.ToInt32(id));
                bool temcConsultaUsuario = usuarioBus.ExisteConsulta(Convert.ToInt32(id));

                if (temNotafiscalUsuario)
                {
                    Page.RegisterStartupScript("javascript", "<script>alert('Existem transações vinculadas a este usuário. Contacte o suporte!');</script>");
                    return;
                }

                if (temFinanceiroUsuario || temcConsultaUsuario)
                {
                    Page.RegisterStartupScript("javascript", "<script>alert('Existem transações vinculadas a este usuário. Contacte o suporte!');</script>");
                    return;
                }

                //if (temcConsultaUsuario)
                //{
                //    Page.RegisterStartupScript("javascript", "<script>alert('Existem transações vinculadas a este usuário. Contacte o suporte!');</script>");
                //    return;
                //}



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

        protected void grUsuarios_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='Yellow'");
            //    // This will be the back ground color of the GridView Control
            //    e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='White'");
            //}
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("DefaultAdmin.aspx");
        }

        protected void ddlTipoUsu_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTipoUsu.SelectedItem.Value != "")
                erro1.Attributes["class"] = "escondido";
        }      
    }
}
