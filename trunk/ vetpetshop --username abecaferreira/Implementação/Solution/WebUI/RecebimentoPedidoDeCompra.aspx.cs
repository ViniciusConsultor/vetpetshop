using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Negocios;
using Entidade;

namespace WebUI
{
    public partial class RecebimentoPedidoDeCompra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string idPedido = Request.Params["pedido"];

            ListarStatusPedido();

            NotaFiscalBuss notaBuss = new NotaFiscalBuss();
            UsuarioBuss usuarioBuss = new UsuarioBuss();
            List<RelProdutoNotaFiscal> rel = new List<RelProdutoNotaFiscal>();

            NotaFiscal nota = new NotaFiscal();
            Usuario usuario = new Usuario();

            nota = notaBuss.ObterPedidoById(Convert.ToInt32(idPedido));
            //usuario = usuarioBuss.ObterUsuarioPorId(nota.idUsuario);
            rel = notaBuss.ListarRelProdutoNotaFiscalByIdPedido(Convert.ToInt32(idPedido));

            lblCodigo.Text = idPedido;
            lblData.Text = nota.DataCadastro.ToString("dd/MM/yyyy");
            lblTotal.Text = nota.Valor.ToString();


            ListItem li = ddlStatus.Items.FindByValue(nota.Status.ToString());
            if(li != null)
                ddlStatus.Items.FindByValue(nota.Status.ToString()).Selected = true;

            PreencherTabela(rel);
        }

        private void ListarStatusPedido()
        {
            ListItem li0 = new ListItem("À Receber", "1");
            ListItem li1 = new ListItem("Recebida", "2");

            ddlStatus.Items.Add(li0);
            ddlStatus.Items.Add(li1);
        }

        private DataTable TabelaProdutos()
        {
            DataTable _tabela = new DataTable();

            DataColumn coluna0 = new DataColumn("id_produto");
            DataColumn coluna1 = new DataColumn("nm_produto");
            DataColumn coluna3 = new DataColumn("valunit");
            DataColumn coluna2 = new DataColumn("quant");
            DataColumn coluna4 = new DataColumn("valor");

            _tabela.Columns.Add(coluna0);
            _tabela.Columns.Add(coluna1);
            _tabela.Columns.Add(coluna2);
            _tabela.Columns.Add(coluna3);
            _tabela.Columns.Add(coluna4);

            return _tabela;
        }

        private void PreencherTabela(List<RelProdutoNotaFiscal> lista)
        {
            DataTable tabelaProdutos = TabelaProdutos();
            
            foreach (RelProdutoNotaFiscal rel in lista)
            {
                DataRow linha = tabelaProdutos.NewRow();

                linha["id_produto"] = rel.IdProduto.ToString();
                linha["nm_produto"] = rel.NomeProduto;
                linha["valunit"] = rel.PrecoUnitarioProduto.ToString();
                linha["quant"] = rel.Quantidade.ToString();
                linha["valor"] = rel.ValorTotalProduto.ToString();

                tabelaProdutos.Rows.Add(linha);
            }

            grProds.Visible = true;
            grProds.DataSource = tabelaProdutos;
            grProds.DataBind();
        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
           
        }
    }
}
