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
    public partial class EmitirReceitaMedica : System.Web.UI.Page
    {
        public DateTime datConsulta;
        public string proprietario;
        public DataTable dtRegistro;
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
                       
        }

        protected void CarregarConsultas()
        {
            DataTable tabelaPreenchida = PreencherConsultas();

            if (tabelaPreenchida.Rows.Count != 0)
            {
                gdvConsultas.DataSource = tabelaPreenchida;
                gdvConsultas.DataBind();
            }
        }

        protected DataTable CarregarDadosReceitaMedica(Int32 idConsulta)
        {
            AnimalBuss animalBuss = new AnimalBuss();
            DataTable tabelaPreenchida = new DataTable();

            tabelaPreenchida = animalBuss.ListarDadosReceitaMedica(idConsulta);
            return tabelaPreenchida;            
        }

        private DataTable PreencherConsultas()
        {
            Animal animal = new Animal();

            DataTable tabela = new DataTable();
            DataTable tabelaPreenchida = new DataTable();
            tabela = MontarTabelaConsultas();

            AnimalBuss animalBuss = new AnimalBuss();
            tabelaPreenchida = animalBuss.ListarConsultasAnimais2(tabela, proprietario, datConsulta);
            return tabelaPreenchida;
        }

        protected void gdvConsultas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "selecionar")
            {
                ViewState["id_consulta"] = e.CommandArgument.ToString();
                          
                HtmlTextWriterTag html = new HtmlTextWriterTag();
                WebControl wc = new WebControl(html);
                wc = ((WebControl)e.CommandSource);

                GridViewRow row = ((GridViewRow)wc.NamingContainer);

                dtRegistro = CarregarDadosReceitaMedica(Convert.ToInt32(ViewState["id_consulta"]));
            }
                       
        }         
       
        private DataTable MontarTabelaConsultas()
        {
            DataTable _tabela = new DataTable();

            DataColumn coluna0 = new DataColumn("id_consulta");
            DataColumn coluna1 = new DataColumn("nm_cliente");
            DataColumn coluna2 = new DataColumn("nm_animal");
            DataColumn coluna3 = new DataColumn("dataconsulta");            
            DataColumn coluna4 = new DataColumn("status");

            _tabela.Columns.Add(coluna0);
            _tabela.Columns.Add(coluna1);
            _tabela.Columns.Add(coluna2);
            _tabela.Columns.Add(coluna3);
            _tabela.Columns.Add(coluna4);

            return _tabela;
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            //Limpa e recarrega o grid
            gdvConsultas.DataSource = null;
            gdvConsultas.DataBind();

            if (txtDataConsulta.Text != "")
            {
                datConsulta = System.DateTime.ParseExact(txtDataConsulta.Text, "dd/MM/yyyy", null);
            }
            else
            {
                datConsulta = DateTime.MinValue;
            }

            if (txtProprietario.Text != "")
            {
                proprietario = txtProprietario.Text;
            }
            else
            {
                proprietario = "";
            }

            CarregarConsultas();

            if (!(gdvConsultas.Rows.Count > 0)) 
            {
                lblMsg.Text = "Não foram encontrados registros com os critérios informados";
            }
            else
            {
                lblMsg.Text = "";
            }
        }        

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("DefaultVeterinario.aspx");
        }
             
    }
}