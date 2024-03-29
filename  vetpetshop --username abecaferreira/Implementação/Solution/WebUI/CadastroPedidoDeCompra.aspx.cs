﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidade;
using Negocios;
using System.Data;
using System.Drawing;

namespace WebUI
{
    public partial class CadastroPedidoDeCompra : System.Web.UI.Page
    {
        Usuario usuario = new Usuario();
        NotaFiscal nota = new NotaFiscal();
        int idProd;
        decimal valorTotal = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = (Usuario)Session["User"];
            UsuarioBuss usuarioBuss = new UsuarioBuss();

            if (usuario == null)
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

            string quantidade = Request.Params["quant"];

            if (!IsPostBack)
            {
                CarregaListaTipoProduto();
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

        protected void btnOk_Click(object sender, EventArgs e)
        {
            lblDescVal.Visible = false;
            
            grProds.DataSource = null;
            grProds.DataBind();

            lblTotal.Text = "";
            lblMsg.Text = "";
            NotaFiscalBuss notaBuss = new NotaFiscalBuss();
            bool executou;

            executou = notaBuss.InserirNotaFiscal(usuario.Id);

            if (executou)
            {
                nota = notaBuss.ObterUltimoRegistroNota();
                Session["idNota"] = nota.Id;

                addProd.Visible = true;

                Panel2.Visible = true;
                lblCod.Text = nota.Id.ToString();
                lblData.Text = DateTime.Now.ToString("dd/MM/yyyy");
                btnOk.Enabled = false;
            }
        }

        protected void addProd_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;

            if (grUsuarios.Rows.Count > 0)
            {
               divUsuarios.Attributes["class"] = "scrollmini";
               grUsuarios.Visible = true;
            }
        }

        protected void Buscar_Click(object sender, EventArgs e)
        {
            lblRegistros.Text = "";
            DataTable tabelaPreenchida = Preencher();

            if (tabelaPreenchida.Rows.Count != 0)
            {
                grUsuarios.Visible = true;
                grUsuarios.DataSource = tabelaPreenchida;
                grUsuarios.DataBind();
                divUsuarios.Attributes["class"] = "scrollmini";
            }
            else
            {
                grUsuarios.Visible = false;
                lblRegistros.Visible = true;
                lblRegistros.Text = "Nenhum registro encontrado";
                divUsuarios.Attributes["class"] = "escondido";
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
            DataTable tabelaPreenchida = new DataTable();
            tabela = MontarTabela();

            ProdutoBuss produtoBuss = new ProdutoBuss();
            tabelaPreenchida = produtoBuss.ListarProdutos(tabela, nome, IdGrupo);
            return tabelaPreenchida;
        }

        private DataTable MontarTabela()
        {
            DataTable _tabela = new DataTable();

            DataColumn coluna0 = new DataColumn("id_produto");
            DataColumn coluna1 = new DataColumn("nm_produto");
            DataColumn coluna2 = new DataColumn("tipo");
            DataColumn coluna3 = new DataColumn("min");
            DataColumn coluna4 = new DataColumn("max");
            DataColumn coluna5 = new DataColumn("descricao");
            DataColumn coluna6 = new DataColumn("preco_custo");
            DataColumn coluna7 = new DataColumn("preco_venda");
            DataColumn coluna8 = new DataColumn("validade");

            _tabela.Columns.Add(coluna0);
            _tabela.Columns.Add(coluna1);
            _tabela.Columns.Add(coluna2);
            _tabela.Columns.Add(coluna3);
            _tabela.Columns.Add(coluna4);
            _tabela.Columns.Add(coluna5);
            _tabela.Columns.Add(coluna6);
            _tabela.Columns.Add(coluna7);
            _tabela.Columns.Add(coluna8);

            return _tabela;
        }

        protected void grUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
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

                Panel1.Visible = false;
                // grUsuarios.Visible = false;
                panel3.Visible = true;
            }
        }

        protected void btnQuant_Click(object sender, EventArgs e)
        {
            DataTable tabela = TabelaProdutos();
            NotaFiscalBuss notabuss = new NotaFiscalBuss();
            NotaFiscal nota = new NotaFiscal();
            ProdutoBuss produtoBuss = new ProdutoBuss();
            Produto produto = new Produto();

            int idNota = (int)Session["idNota"];
            
            nota = notabuss.ObterUltimoRegistroNota();

            int idProd = (int)Session["idProd"];
            produto = produtoBuss.ObterProdutoPorId(idProd);
            produto.Quantidade = Convert.ToInt32(txtQuant.Text);

            
            if (grProds.Rows.Count == 0)
            {
                DataRow _linha = tabela.NewRow();
                _linha["id_produto"] = produto.IdProduto;
                _linha["nm_produto"] = produto.Nome;
                _linha["quant"] = txtQuant.Text;
                _linha["valunit"] = produto.PrecoCusto.ToString();

                decimal _valorTotalProduto = (produto.Quantidade * produto.PrecoCusto);
                _linha["valor"] = _valorTotalProduto.ToString();

                tabela.Rows.Add(_linha);

                divProds.Attributes["class"] = "scrollmini";
            }

            else
            {
                foreach (GridViewRow linha in grProds.Rows)
                {

                    if (linha.Visible != false)
                    {

                        int id = Convert.ToInt32(linha.Cells[1].Text);

                        produto = produtoBuss.ObterProdutoPorId(id);
                        produto.Quantidade = Convert.ToInt32(linha.Cells[4].Text);

                        DataRow _linha = tabela.NewRow();
                        _linha["id_produto"] = produto.IdProduto;
                        _linha["nm_produto"] = produto.Nome;
                        _linha["quant"] = produto.Quantidade.ToString();
                        _linha["valunit"] = produto.PrecoCusto.ToString();
                        decimal _valorTotalProduto = (produto.Quantidade * produto.PrecoCusto);
                        _linha["valor"] = _valorTotalProduto.ToString();

                        tabela.Rows.Add(_linha);
                    }
                }

                produto = produtoBuss.ObterProdutoPorId(idProd);
                produto.Quantidade = Convert.ToInt32(txtQuant.Text);
                DataRow _linha2 = tabela.NewRow();
                _linha2["id_produto"] = produto.IdProduto;
                _linha2["nm_produto"] = produto.Nome;
                _linha2["quant"] = txtQuant.Text;
                _linha2["valunit"] = produto.PrecoCusto.ToString();
                decimal _valorTotalProduto2 = (produto.Quantidade * produto.PrecoCusto);
                _linha2["valor"] = _valorTotalProduto2.ToString();

                tabela.Rows.Add(_linha2);
            }


            grUsuarios.Visible = false;
            divUsuarios.Attributes["class"] = "escondido";
            grProds.Visible = true;
            grProds.DataSource = tabela;
            grProds.DataBind();
            divProds.Attributes["class"] = "scrollmini";

            panel3.Visible = false;

            foreach (GridViewRow linha in grProds.Rows)
            {
                valorTotal += Convert.ToDecimal(linha.Cells[5].Text);
            }

            if (valorTotal != 0)
            {
                btnSalvar.Visible = true;
            }
                lblTotal.Text = valorTotal.ToString();
                lblDescVal.Visible = true;
                Session["valorTotal"] = valorTotal;
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

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
           
            foreach (GridViewRow linha in grProds.Rows)
            {
                if (linha.Visible == true)
                {
                    RelProdutoNotaFiscal relProdNota = new RelProdutoNotaFiscal();
                    int idNota = (int)Session["idNota"];
                    relProdNota.IdNotaFiscal = idNota;
                    relProdNota.ValorNotal = Convert.ToDecimal(lblTotal.Text);
                    relProdNota.IdProduto = Convert.ToInt32(linha.Cells[1].Text);
                    relProdNota.Quantidade = Convert.ToInt32(linha.Cells[4].Text);

                    NotaFiscalBuss notaBuss = new NotaFiscalBuss();
                    notaBuss.InserirRelProdNota(relProdNota);
                }
            }

            Panel1.Visible = false;
            Panel2.Visible = false;
            panel3.Visible = false;
            grProds.Visible = false;
            addProd.Visible = false;
            btnSalvar.Visible = false;            

            lblMsg.Text = "Pedido de compra cadastrado com sucesso";
            btnOk.Enabled = true;
            divProds.Attributes["class"] = "escondido";
        }

        protected void grUsuarios_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void grUsuarios_RowCreated(object sender, GridViewRowEventArgs e)
        {

        }

        protected void grProds_RowCommand(object sender, GridViewCommandEventArgs e)
        {
             decimal valorTotal = (decimal)Session["valorTotal"];
             decimal valorTrue = 0;
             decimal valorFalse = 0;

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
                        valorTrue += Convert.ToDecimal(linha.Cells[5].Text);
                        //lblTotal.Text = valorTotal.ToString();
                    }

                    else
                    {
                        valorFalse = valorFalse + Convert.ToDecimal(linha.Cells[5].Text);      
                        //lblTotal.Text = valorTotal.ToString();
                        GridViewRow rw = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                        grProds.DeleteRow(rw.RowIndex);
                    }
                }

                valorTotal = valorTotal - valorFalse;
                lblTotal.Text = valorTotal.ToString();

                if (valorTotal == 0) 
                {
                    divProds.Attributes["class"] = "escondido";    
                    btnSalvar.Visible = false;
                }
            }
        }

        protected void grUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DataTable tabelaPreenchida = Preencher();
            grUsuarios.PageIndex = e.NewPageIndex;

            if (tabelaPreenchida.Rows.Count != 0)
            {
                grUsuarios.Visible = true;
                grUsuarios.DataSource = tabelaPreenchida;
                grUsuarios.DataBind();
            }    
        }

        protected void grProds_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }

        protected void grProds_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }
    }
}
