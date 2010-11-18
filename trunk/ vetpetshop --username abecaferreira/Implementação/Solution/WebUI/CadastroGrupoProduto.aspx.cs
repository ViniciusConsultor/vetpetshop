using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocios;
using Entidade;
using System.Data;

namespace WebUI
{
    public partial class CadastroGrupoProduto : System.Web.UI.Page
    {
        Usuario usuario = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = (Usuario)Session["User"];

            if (usuario == null)
                Response.Redirect("Login.aspx");

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

            if (!IsPostBack)
                ExibeGrid();
        }

        private DataTable MontarTabela()
        {
            DataTable _tabela = new DataTable("grupos");
            DataColumn _coluna0;
            DataColumn _coluna1;

            _coluna0 = new DataColumn("id_grupo");
            _coluna1 = new DataColumn("nm_grupo");

            _tabela.Columns.Add(_coluna0);
            _tabela.Columns.Add(_coluna1);

            return _tabela;        
        }

        private void ExibeGrid()
        {
            GrupoProdutoBuss grupoBuss = new GrupoProdutoBuss();
            DataTable tabela = MontarTabela();
            DataTable _tabelaPreenchida = grupoBuss.ListarGrupos(tabela);

            if (_tabelaPreenchida.Rows.Count > 0)
            {
                grGrupos.Visible = true;
                grGrupos.DataSource = _tabelaPreenchida;
                grGrupos.DataBind();
                divGrupos.Attributes["class"] = "scroll";
                lblLista.Visible = true;
            }

            else
            {
                grGrupos.Visible = false;
                divGrupos.Attributes["class"] = "escondido";
                lblLista.Visible = false;
            }
                
        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            lblMsg.Text = "";

            if (txtNomeGrupo.Text == "")
            {
                lblMsg.Text = "Preencha o nome do grupo";
                return;
            }

            else
            {
               Grupo grupo = new Grupo();
               grupo.Nome = txtNomeGrupo.Text;

               GrupoProdutoBuss grupoProdutoBus = new GrupoProdutoBuss();
               bool salvou = grupoProdutoBus.InserirGrupo(grupo);

               if (salvou)
               {
                   lblMsg.Text = "Cadastro efetuado com sucesso";
                   txtNomeGrupo.Text = "";
                   ExibeGrid();
               }

               else
                   lblMsg.Text = "O cadastro não foi efetuado. Falha de conexão com o banco de dados";
               
            }
        }

        protected void grGrupos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            bool existe;         

            if (e.CommandName == "excluir")
            {
                int id = Convert.ToInt32(e.CommandArgument);

                ProdutoBuss produtoBuss = new ProdutoBuss();
                existe = produtoBuss.ExisteProdutoPorGrupo(id);
                if (existe)
                {
                    Page.RegisterStartupScript("javascript", "<script>alert('Existem produtos vinculados a este grupo!');</script>");
                    return;
                }
                
                GrupoProdutoBuss grupoBuss = new GrupoProdutoBuss();
                bool executou = grupoBuss.ExcluirGrupo(Convert.ToInt32(id));

                if (executou)
                {
                    lblMsg.Text = "Grupo excluído com sucesso";
                    ExibeGrid();
                }

                else
                {
                    lblMsg.Text = "Não foi possível excluir o grupo selecionado. Falha de conexão com banco de dados";
                }                
            }
        }

        protected void grGrupos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='Yellow'");
            //    // This will be the back ground color of the GridView Control
            //    e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='White'");                
            //}
        }
    }
}
