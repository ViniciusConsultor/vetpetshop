using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Entidade;
using Negocios;

namespace WebUI
{
    public partial class RegistrarPagamentoProdutos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                CarregaListaTipoProduto();
        }

        private void CarregaListaTipoProduto()
        {
            GrupoProdutoBuss grupoBuss = new GrupoProdutoBuss();

            List<Grupo> _listaGrupo = new List<Grupo>();
            _listaGrupo = grupoBuss.ListarTiposGrupo();

            ListItem _item = new ListItem("Selecione", "");
            ddlTipo.Items.Add(_item);

            foreach (Grupo grupo in _listaGrupo)
            {
                ListItem item = new ListItem(grupo.Nome.ToString(), grupo.Id.ToString());
                ddlTipo.Items.Add(item);
            }
        }

        protected void Buscar_Click(object sender, EventArgs e)
        {
            DataTable tabelaPreenchida = new DataTable();
            lblRegistros.Text = "";

            tabelaPreenchida = Preencher();

            if (tabelaPreenchida.Rows.Count != 0)
            {
                grProdutos.Visible = true;
                grProdutos.DataSource = tabelaPreenchida;
                grProdutos.DataBind();
            }
            else
            {
                grProdutos.Visible = false;
                lblRegistros.Visible = true;
                lblRegistros.Text = "Nenhum registro encontrado";
            }
        }

        private DataTable Preencher()
        {
            string nome = string.Empty;
            int IdGrupo = 0;
            Produto produto = new Produto();
            if (txtNome.Text != "" || ddlTipo.SelectedItem.Value != "")
            {
                if (txtNome.Text == "")
                    nome = txtNome.Text;
                else
                    nome = txtNome.Text;

                if (ddlTipo.SelectedItem.Value == "")
                    IdGrupo = 0;
                else
                    IdGrupo = Convert.ToInt32(ddlTipo.SelectedItem.Value);
            }

            DataTable tabela = new DataTable();            
            tabela = MontarTabela();

            List<Produto> _lista = new List<Produto>();
            ProdutoBuss produtoBuss = new ProdutoBuss();
            _lista = produtoBuss.ListarProdutos(nome, IdGrupo);

            foreach (Produto prod in _lista)
            {
                DataRow _linha = tabela.NewRow();
                _linha["id_produto"] = prod.IdProduto.ToString();
                _linha["nm_produto"] = prod.Nome;
                _linha["tipo"] = prod.NomeGrupo;
                _linha["Descricao"] = prod.Descricao;
                _linha["preco_venda"] = prod.PrecoVenda;

                tabela.Rows.Add(_linha);
            }
            return tabela;
        }

        private DataTable MontarTabela()
        {
            DataTable _tabela = new DataTable();

            DataColumn coluna0 = new DataColumn("id_produto");
            DataColumn coluna1 = new DataColumn("nm_produto");
            DataColumn coluna2 = new DataColumn("tipo");
            DataColumn coluna3 = new DataColumn("descricao");
            DataColumn coluna4 = new DataColumn("preco_venda");         

            _tabela.Columns.Add(coluna0);
            _tabela.Columns.Add(coluna1);
            _tabela.Columns.Add(coluna2);
            _tabela.Columns.Add(coluna3);
            _tabela.Columns.Add(coluna4);

            return _tabela;
        }

        protected void addProd_Click(object sender, EventArgs e)
        {

        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {

        }

        protected void btnQuant_Click(object sender, EventArgs e)
        {

        }
    }
}
