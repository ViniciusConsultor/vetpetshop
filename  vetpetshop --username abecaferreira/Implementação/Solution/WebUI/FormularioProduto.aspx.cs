﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocios;
using Entidade;
using System.Data.SqlTypes;

namespace WebUI
{
    public partial class FormularioCadastroProduto : System.Web.UI.Page
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

            string idProd = Request.Params["idProduto"];

            if (!IsPostBack)
            {
                CarregaListaTipoProduto();

                if (idProd != null)
                {
                    Edicao(idProd);
                    btnOk.Visible = false;
                    btnAtualizar.Visible = true;
                }
            }
        }

        private void Edicao(string idProd)
        {
            Produto produto = new Produto();
            ProdutoBuss produtoBuss = new ProdutoBuss();

            produto = produtoBuss.ObterProdutoPorId(Convert.ToInt32(idProd));

            if (produto != null)
            {
                txtNome.Text = produto.Nome;
                ddlTipoGrupo.SelectedIndex = ddlTipoGrupo.Items.IndexOf(ddlTipoGrupo.Items.FindByValue(produto.IdGrupo.ToString()));
                txtPrecoCusto.Text = produto.PrecoCusto.ToString();
                txtPrecoVenda.Text = produto.PrecoVenda.ToString();
                txtEstoqueMin.Text = produto.EstoqueMin.ToString();
                txtEstoqueMax.Text = produto.EstoqueMax.ToString();
                txtDesc.Text = produto.Descricao;
                txtDataVal.Text = produto.DataValidade.Value.ToString("dd/MM/yyyy");
            }
        }

        private void CarregaListaTipoProduto()
        {
            GrupoProdutoBuss grupoBuss = new GrupoProdutoBuss();

            List<Grupo> _listaGrupo = new List<Grupo>();
            _listaGrupo = grupoBuss.ListarTiposGrupo();

            ListItem _item = new ListItem("Selecione", "");
            ddlTipoGrupo.Items.Add(_item);

            foreach (Grupo grupo in _listaGrupo)
            {
                ListItem item = new ListItem(grupo.Nome.ToString(), grupo.Id.ToString());
                ddlTipoGrupo.Items.Add(item);
            }
        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            System.Globalization.CultureInfo culture = new System.Globalization.CultureInfo("pt-BR");
            ProdutoBuss produtoBuss = new ProdutoBuss();
            Produto produto = new Produto();
            bool executou;

            #region
            //if (txtNome.Text == "")
            //{
            //    lblMsg.Text = "Preencha o campo Nome do Produto";
            //    return;
            //}
            if (ddlTipoGrupo.SelectedItem.Value == "")
            {
                erroTipo.Attributes["class"] = "mostrar";
                //lblMsg.Text = "Selecione o tipo do produto";
                return;
            }
            //if (txtPrecoCusto.Text == "")
            //{
            //    lblMsg.Text = "Preencha o campo Preço de Custo";
            //    return;
            //}
            //if (txtPrecoVenda.Text == "")
            //{
            //    lblMsg.Text = "Preencha o campo Preço de Venda";
            //    return;
            //}
            //if (txtEstoqueMin.Text == "")
            //{
            //    lblMsg.Text = "Preencha o campo Estoque Mínimo";
            //    return;
            //}
            //if (txtEstoqueMax.Text == "")
            //{
            //    lblMsg.Text = "Preencha o campo Estoque Máximo";
            //    return;
            //} 
            #endregion

            produto.Nome = txtNome.Text;
            produto.IdGrupo = Convert.ToInt32(ddlTipoGrupo.SelectedItem.Value);
            produto.PrecoCusto = decimal.Parse(txtPrecoCusto.Text);
            produto.PrecoVenda = decimal.Parse(txtPrecoVenda.Text);
            produto.EstoqueMin = Convert.ToInt32(txtEstoqueMin.Text);
            produto.EstoqueMax = Convert.ToInt32(txtEstoqueMax.Text);
            produto.Descricao = txtDesc.Text;

            if (txtDataVal.Text != "")
            {
                produto.DataValidade = Convert.ToDateTime(txtDataVal.Text);
            }
            else
            {
                produto.DataValidade = DateTime.MinValue;
            }

            executou = produtoBuss.InserirProduto(produto);

            if (executou)
            {
                txtNome.Text = "";
                txtPrecoCusto.Text = "";
                txtPrecoVenda.Text = "";
                txtEstoqueMin.Text = "";
                txtEstoqueMax.Text = "";
                txtDataVal.Text = "";
                txtDesc.Text = "";
                lblMsg.Text = "Cadastro efetuado com sucesso";
                ddlTipoGrupo.SelectedIndex = 0;
            }

            else
            {
                lblMsg.Text = "Cadastro não efetuado. Falha de conexão com o banco de dados";
            }
        }

        protected void btnAtualizar_Click(object sender, EventArgs e)
        {
            ProdutoBuss produtoBuss = new ProdutoBuss();
            Produto produto = new Produto();

            produto.Nome = txtNome.Text;
            produto.IdGrupo = Convert.ToInt32(ddlTipoGrupo.SelectedItem.Value);
            produto.PrecoCusto = decimal.Parse(txtPrecoCusto.Text);
            produto.PrecoVenda = decimal.Parse(txtPrecoVenda.Text);
            produto.EstoqueMin = Convert.ToInt32(txtEstoqueMin.Text);
            produto.EstoqueMax = Convert.ToInt32(txtEstoqueMax.Text);
            produto.Descricao = txtDesc.Text;

            if (txtDataVal.Text != "")
            {
                produto.DataValidade = Convert.ToDateTime(txtDataVal.Text);
            }
            else
            {
                produto.DataValidade = DateTime.MinValue;
            }

            bool executou;
            string idProd = Request.Params["idProduto"];
            executou = produtoBuss.AtualizarProduto(produto, Convert.ToInt32(idProd));

            if (executou)
            {
                Response.Redirect("CadastroProduto.aspx");
            }
            else
                lblMsg.Text = "Falha de conexão com o banco de dados";

        }

        protected void ddlTipoGrupo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTipoGrupo.SelectedItem.Value != "")
                erroTipo.Attributes["class"] = "escondido";
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("DefaultAdmin.aspx");
        }

    }
}
