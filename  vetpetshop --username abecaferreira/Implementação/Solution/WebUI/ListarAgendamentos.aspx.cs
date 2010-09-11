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
using System.Web;

namespace WebUI
{
    public partial class ListarAgendamentos : System.Web.UI.Page
    {
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
                CarregarConsultas();
            }
        }

        protected void CarregarConsultas()
        {
            DataTable tabelaPreenchida = Preencher();

            if (tabelaPreenchida.Rows.Count != 0)
            {
                gdvConsultas.DataSource = tabelaPreenchida;
                gdvConsultas.DataBind();
            }
        }

        private DataTable Preencher()
        {
            Animal animal = new Animal();

            DataTable tabela = new DataTable();
            DataTable tabelaPreenchida = new DataTable();
            tabela = MontarTabela();

            AnimalBuss animalBuss = new AnimalBuss();
            tabelaPreenchida = animalBuss.ListarConsultasAnimais(tabela);
            return tabelaPreenchida;
        }

        protected void gdvConsultas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "alterar")
            {
                ViewState["id_consulta"] = e.CommandArgument.ToString();
                pnlConsultas.Visible = true;
                CarregarConsultaAlteracao();
            }

            if (e.CommandName == "excluir") { }

                //ExcluirCliente(Convert.ToInt32(e.CommandArgument));
        }

       /* protected void ExcluirCliente(int id)
        {
            bool executou = false;

            ClienteBuss clienteBus = new ClienteBuss();

            executou = clienteBus.ExcluirCliente(id);

            if (executou)
            {
                ViewState["hdnMSG"] = "Cliente excluído com sucesso!";
                Response.Redirect("ListarClienteAnimal.aspx");
            }
            else
            {
                lblMsg.Text = "A exclusão não foi efetuada. Falha de conexão com o banco de dados";
            }

        }*/
        protected void CarregarConsultaAlteracao()
        {
            try
            { 
                foreach (GridViewRow row in gdvConsultas.Rows)
                {
                    if ( Convert.ToInt32(row.Cells[2].Text) == Convert.ToInt32(ViewState["id_consulta"]))
                    {
                        lblProprietario.Text = row.Cells[3].Text;
                        lblAnimal.Text = row.Cells[4].Text;
                        txtDataConsulta.Text = string.Format("{0:d}", row.Cells[5].Text);
                        txtValor.Text = row.Cells[6].Text;
                        rblStatus.Text = row.Cells[7].Text;
                    }
                }     
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        
        private DataTable MontarTabela()
        {
            DataTable _tabela = new DataTable();

            DataColumn coluna0 = new DataColumn("id_consulta");
            DataColumn coluna1 = new DataColumn("nm_cliente");
            DataColumn coluna2 = new DataColumn("nm_animal");
            DataColumn coluna3 = new DataColumn("dataconsulta");
            DataColumn coluna4 = new DataColumn("valor");
            DataColumn coluna5 = new DataColumn("status");

            _tabela.Columns.Add(coluna0);
            _tabela.Columns.Add(coluna1);
            _tabela.Columns.Add(coluna2);
            _tabela.Columns.Add(coluna3);
            _tabela.Columns.Add(coluna4);
            _tabela.Columns.Add(coluna5);

            return _tabela;
        }
                
    }
}
