using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Entidade;
using Negocios;
using System.Data.SqlTypes;

namespace WebUI
{
    public partial class RegistrarPagamentoProdutos : System.Web.UI.Page
    {
        Usuario usuario = new Usuario();
        int idProd;
        decimal valorTotal = 0;
        decimal valorReal = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            #region Criação de Menu
            Menu menu = (Menu)Page.Master.FindControl("Menu1");
            SiteMapDataSource siteAdmin = (SiteMapDataSource)Page.Master.FindControl("vend");
            menu.DataSource = siteAdmin;
            menu.DataBind();
            #endregion

            usuario = (Usuario)Session["User"];
            UsuarioBuss usuarioBuss = new UsuarioBuss();
            usuario.Id = usuarioBuss.ObterIdUsuarioPorNomeUsuario(usuario.Nome);

            if (!IsPostBack)
            {
                CarregaListaTipoProduto();
                CarregaClientes();
            }
        }

        private void CarregaClientes()
        {
            ClienteBuss clienteBuss = new ClienteBuss();
            List<Cliente> lista = new List<Cliente>();

            ListItem _item = new ListItem("Selecione", "");
            ddlClienteEspecial.Items.Add(_item);

            lista = clienteBuss.ListarDDLClientes();
            foreach (Cliente cli in lista)
            {
                ListItem item = new ListItem(cli.Nome, cli.IdCliente.ToString());
                ddlClienteEspecial.Items.Add(item);
            }
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
            lblMsg.Text = "";

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
            _lista = produtoBuss.ListarProdutoEmEstoque(nome, IdGrupo);

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
            Panel4.Visible = true;
        }

        protected void btnQuant_Click(object sender, EventArgs e)
        {
            DataTable tabela = TabelaItems();
            NotaFiscalBuss notabuss = new NotaFiscalBuss();
            NotaFiscal nota = new NotaFiscal();
            ProdutoBuss produtoBuss = new ProdutoBuss();
            Produto produto = new Produto();

            //nota = notabuss.ObterUltimoRegistroNota();

            int idProd = (int)Session["idProd"];
            produto = produtoBuss.ObterProdutoPorId(idProd);
            produto.Quantidade = Convert.ToInt32(txtQuant.Text);


            if (grProds.Rows.Count == 0)
            {
                DataRow _linha = tabela.NewRow();
                _linha["id_produto"] = produto.IdProduto;
                _linha["nm_produto"] = produto.Nome;
                _linha["quant"] = txtQuant.Text;
                _linha["valunit"] = produto.PrecoVenda.ToString();

                decimal _valorTotalProduto = (produto.Quantidade * produto.PrecoVenda);
                _linha["valor"] = _valorTotalProduto.ToString();

                tabela.Rows.Add(_linha);
            }

            else
            {
                foreach (GridViewRow linha in grProds.Rows)
                {
                    int id = Convert.ToInt32(linha.Cells[1].Text);

                    produto = produtoBuss.ObterProdutoPorId(id);
                    produto.Quantidade = Convert.ToInt32(linha.Cells[4].Text);

                    DataRow _linha = tabela.NewRow();
                    _linha["id_produto"] = produto.IdProduto;
                    _linha["nm_produto"] = produto.Nome;
                    _linha["quant"] = produto.Quantidade.ToString();
                    _linha["valunit"] = produto.PrecoVenda.ToString();
                    decimal _valorTotalProduto = (produto.Quantidade * produto.PrecoVenda);
                    _linha["valor"] = _valorTotalProduto.ToString();

                    tabela.Rows.Add(_linha);
                }

                produto = produtoBuss.ObterProdutoPorId(idProd);
                produto.Quantidade = Convert.ToInt32(txtQuant.Text);
                DataRow _linha2 = tabela.NewRow();
                _linha2["id_produto"] = produto.IdProduto;
                _linha2["nm_produto"] = produto.Nome;
                _linha2["quant"] = txtQuant.Text;
                _linha2["valunit"] = produto.PrecoVenda.ToString();
                decimal _valorTotalProduto2 = (produto.Quantidade * produto.PrecoVenda);
                _linha2["valor"] = _valorTotalProduto2.ToString();

                tabela.Rows.Add(_linha2);
            }


            grProdutos.Visible = false;
            grProds.Visible = true;
            grProds.DataSource = tabela;
            grProds.DataBind();

            panel3.Visible = false;


            foreach (GridViewRow linha in grProds.Rows)
            {
                valorTotal += Convert.ToDecimal(linha.Cells[5].Text);
            }


            if (grProds.Rows.Count != 0)
            {
                lblTotal.Visible = true;
                lblValor.Visible = true;                
                btnSalvar.Visible = true;
            }
            
            lblTotal.Text = valorTotal.ToString();

            Session["valor"] = valorTotal;   
        }

        private DataTable TabelaItems()
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

        protected void grProdutos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "selecionar")
            {
                txtQuant.Text = "";
                idProd = Convert.ToInt32(e.CommandArgument);
                Session["idProd"] = idProd;

                HtmlTextWriterTag html = new HtmlTextWriterTag();
                WebControl wc = new WebControl(html);
                wc = ((WebControl)e.CommandSource);
                GridViewRow row = ((GridViewRow)wc.NamingContainer);
                row.Font.Bold = true;
                row.ForeColor = System.Drawing.Color.Red;

                panel3.Visible = true;
            }
        }

        protected void rbCliente_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnEnviar_Click1(object sender, EventArgs e)
        {
            lblMsg.Text = "";

            if (rbCliente.SelectedItem.Value == "0")
            {
                PanelCliEspecial.Visible = true;
                Cliente.Visible = true;
                ddlClienteEspecial.Visible = true;
                if (rbTipoPagamento.SelectedItem.Value == "0")
                {
                    txtParcelas.Visible = false;
                    lblParcelas.Visible = false;
                }
                else
                {
                    txtParcelas.Visible = true;
                    lblParcelas.Visible = true;
                }

                decimal desconto = Convert.ToDecimal(lblTotal.Text) * Convert.ToDecimal(0.93);
                decimal valorReal = (decimal)Session["valor"];
                //lblValor.Text = "Valor Total da Compra:";
                lblTotal.Text = valorReal.ToString();
                Label1.Visible = true;
                Label2.Visible = true;
                Label1.Text = "Valor Total com desconto:";
                Label2.Text = desconto.ToString("0.##"); ;
                //lblTotal.Text = desconto.ToString("0.##");

                Panel4.Visible = false;
                btnFim.Visible = true;
            }
            else
            {
                Panel4.Visible = false;
                PanelCliEspecial.Visible = true;
                Cliente.Visible = false;
                ddlClienteEspecial.Visible = false;
                if (rbTipoPagamento.SelectedItem.Value == "0")
                {
                    txtParcelas.Visible = false;
                    lblParcelas.Visible = false;
                }
                else
                {
                    txtParcelas.Visible = true;
                    lblParcelas.Visible = true;
                }

                Label1.Text = "";
                Label2.Text = "";
                decimal valorReal = (decimal)Session["valor"];
                lblTotal.Text = valorReal.ToString();
                btnFim.Visible = true;
            }
        }

        protected void btnFim_Click(object sender, EventArgs e)
        {

            Financeiro financeiro = new Financeiro();
            FinanceiroBuss financeiroBuss = new FinanceiroBuss();

            //TODO:VERIFICAR COMO VINCULAR UMA LISTA DE PRODUTOS A UM ID DE FINANCEIRO


            bool executou = false;

            if ((rbTipoPagamento.SelectedItem.Value == "1" || rbTipoPagamento.SelectedItem.Value == "2") && txtParcelas.Text == "" && rbCliente.SelectedItem.Value == "0")
            {
                lblMsg.Text = "Selecione o cliente especial<BR>";
                lblMsg.Text += "Preencha o campo N° de parcelas";
                return;
            }

            if ((rbTipoPagamento.SelectedItem.Value == "1" || rbTipoPagamento.SelectedItem.Value == "2") && txtParcelas.Text == "")
            {
                //lblMsg.Text = "Preencha o campo Nome do cliente especial<BR>";
                lblMsg.Text = "Preencha o campo N° de parcelas";
                return;
            }

            //if (ddlClienteEspecial.SelectedItem.Value == "")
            //{ 
            //    lblMsg.Text = "Selecione o cliente especial";
            //    return;
            //}

            if (rbCliente.SelectedItem.Value == "0" && ddlClienteEspecial.SelectedItem.Value == "")
            {
                lblMsg.Text = "Selecione o cliente especial";
                return;
            }

            //if (rbTipoPagamento.SelectedItem.Value == "1" || rbTipoPagamento.SelectedItem.Value == "2")
            //{
            //    lblMsg.Text = "Preencha o campo N° de parcelas";
            //    return;
            //}

            foreach (GridViewRow linha in grProds.Rows)
            {
               
                if (linha.Visible == true)
                {
                    //ATUALIZA O ESTOQUE DO PRODUTO
                    Estoque estoque = new Estoque();
                    Produto produto = new Produto();
                    RelEstoqueProduto relEstoque = new RelEstoqueProduto();

                    ProdutoBuss prodBuss = new ProdutoBuss();
                    produto = prodBuss.ObterProdutoPorId(Convert.ToInt32(linha.Cells[1].Text));

                    EstoqueBuss estoqBuss = new EstoqueBuss();
                    relEstoque = estoqBuss.ObterEstoqueProdutoPorIdProd(produto.IdProduto);
                    estoque = estoqBuss.ObterEstoquePorId(relEstoque.IdEstoque);

                    //diminuir estoque do produto
                    estoque.Quantidade = estoque.Quantidade - Convert.ToInt32(linha.Cells[4].Text);
                    int statusEstoque = VerificarStatusEstoque(relEstoque, estoque);

                    estoqBuss.AtualizarEstoque(estoque.Id, estoque.Quantidade, statusEstoque);
                }
            }

            if (rbCliente.SelectedItem.Value == "0")
            {
                financeiro.ValorTotal = Convert.ToDecimal(Label2.Text);
            }
            else
            {
                financeiro.ValorTotal = Convert.ToDecimal(lblTotal.Text);
            }

            financeiro.TipoPagamento = Convert.ToInt32(rbTipoPagamento.SelectedItem.Value); //0=dinheiro 1=cartão de credito 2=cheque

            

            if (txtParcelas.Text != "")
            {
                financeiro.Parcelas = Convert.ToInt32(txtParcelas.Text);
            }
            else
            {
                financeiro.Parcelas = SqlInt32.Null;
            }

            if (ddlClienteEspecial.SelectedItem.Value != "")
            {
                financeiro.NomeCliente = ddlClienteEspecial.SelectedItem.Text;
            }
            else
            {
                financeiro.NomeCliente = SqlString.Null;
            }

            financeiro.TipoTransacao = 1; //Tipo Transação 1=Venda de Produtos 2=Consultas
            financeiro.Usuario = usuario.Id;
            financeiro.TipoResponsavel = 1; //Vendedor=1 Veterinaria=2

            executou = financeiroBuss.InserirRegistroFinanceiro(financeiro);

            Financeiro financeiroRegistrado = new Financeiro();
            financeiroRegistrado = financeiroBuss.ObterFinanceiroVendaRegistrado();

            foreach (GridViewRow linha in grProds.Rows)
            {

                if (linha.Visible == true)
                {
                    RelFinanceiroProduto relFinanceiroProduto = new RelFinanceiroProduto();
                    relFinanceiroProduto.IdFinanceiro = financeiroRegistrado.Id;
                    relFinanceiroProduto.IdProduto = Convert.ToInt32(linha.Cells[1].Text);
                    relFinanceiroProduto.QuantidadeVendida = Convert.ToInt32(linha.Cells[4].Text);

                    financeiroBuss.InserirRelFinanceiroProduto(relFinanceiroProduto);                    
                }
            }

            
            if (executou)
            {
                grProds.DataSource = null;
                grProds.DataBind();
                //btnEnviar.Visible = false;
                Panel4.Visible = false;
                btnFim.Visible = false;
                ddlClienteEspecial.SelectedIndex = ddlClienteEspecial.Items.IndexOf(ddlClienteEspecial.Items.FindByValue("")); 
                txtParcelas.Text = "";
                lblMsg.Text = "Registro de compra efetuado com sucesso";
                lblTotal.Text = "";
                btnSalvar.Visible = false;
                PanelCliEspecial.Visible = false;
                lblValor.Visible = false;
                Label1.Text = "";
                Label2.Text = "";
            }
        }

        private int VerificarStatusEstoque(RelEstoqueProduto relEstoque, Estoque estoque)
        {
            Produto produto = new Produto();
            ProdutoBuss prodBuss = new ProdutoBuss();

            produto = prodBuss.ObterProdutoPorId(relEstoque.IdProduto);
            int estoqueMedio = (produto.EstoqueMax + produto.EstoqueMin)/2;

            //if (estoque.Quantidade >= produto.EstoqueMax)
            //    estoque.Status = 3;

            //else if (estoque.Quantidade == estoqueMedio)
            //    estoque.Status = 2;

            //else
            //    estoque.Status = 1;

            if (estoque.Quantidade >= produto.EstoqueMax)
                estoque.Status = 3;

            if (estoque.Quantidade == estoqueMedio) 
                estoque.Status = 2;

            if (estoque.Quantidade > estoqueMedio && estoque.Quantidade < produto.EstoqueMax)
                estoque.Status = 2;

            if (estoque.Quantidade < estoqueMedio && estoque.Quantidade > produto.EstoqueMin)
                estoque.Status = 2;

            if (estoque.Quantidade == produto.EstoqueMin || estoque.Quantidade < produto.EstoqueMin)
                estoque.Status = 1;

            return estoque.Status;
            
        }

        protected void grProds_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "excluir")
            {
                HtmlTextWriterTag html = new HtmlTextWriterTag();
                WebControl wc = new WebControl(html);
                wc = ((WebControl)e.CommandSource);
                GridViewRow row = ((GridViewRow)wc.NamingContainer);

                row.Visible = false;

                //grProds.DeleteRow(row.RowIndex);

                foreach (GridViewRow linha in grProds.Rows)
                {
                    if (linha.Visible != false)
                    {
                        valorTotal += Convert.ToDecimal(linha.Cells[5].Text);
                        lblTotal.Text = valorTotal.ToString();
                    }
                }
            }
        }
    }
}
