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
    public partial class RegistrarPagamentoConsulta : System.Web.UI.Page
    {
        //public DateTime datConsulta, datVacinacao;
        //Usuario usuario = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            #region Criação de Menu
            Menu menu = (Menu)Page.Master.FindControl("Menu1");
            SiteMapDataSource siteVet = (SiteMapDataSource)Page.Master.FindControl("vet");
            menu.DataSource = siteVet;
            menu.DataBind();
            #endregion

            //usuario = (Usuario)Session["User"];
            //UsuarioBuss usuarioBuss = new UsuarioBuss();
            //usuario.Id = usuarioBuss.ObterIdUsuarioPorNomeUsuario(usuario.Nome);

            if (!IsPostBack)
            {
                CarregarConsultas();
                //CarregarVacinacoes();
            }
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

        private DataTable PreencherConsultas()
        {
            Animal animal = new Animal();

            DataTable tabela = new DataTable();
            DataTable tabelaPreenchida = new DataTable();
            tabela = MontarTabelaConsultas();

            AnimalBuss animalBuss = new AnimalBuss();
            tabelaPreenchida = animalBuss.ListarConsultasAnimais(tabela);
            return tabelaPreenchida;
        }

        private DataTable MontarTabelaConsultas()
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

        protected void gdvConsultas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "registrar") 
            {
                PreenchePagamentoConsulta(e.CommandArgument.ToString());
            }

        }

        public void PreenchePagamentoConsulta(string idConsulta)
        {
            AnimalBuss animalBuss = new AnimalBuss();
            List<Animal> lstAnimal = new List<Animal>();

            //lstAnimal = animalBuss.ListaConsultaByPK(Convert.ToInt32(idConsulta));

        
        }

        public bool RegistrarPagamento(string idConsulta)
        {
            bool executou = false;

            AnimalBuss animalBuss = new AnimalBuss();

            executou = animalBuss.RegistrarPagamento(Convert.ToInt32(idConsulta));

            if (executou)
            {
                //CarregarVacinacoes();
            }



            return executou;
        
        }


    }
}
