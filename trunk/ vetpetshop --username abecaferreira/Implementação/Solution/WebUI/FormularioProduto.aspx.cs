﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocios;
using Entidade;

namespace WebUI
{
    public partial class FormularioCadastroProduto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            #region Criação de Menu
            Menu menu = (Menu)Page.Master.FindControl("Menu1");
            SiteMapDataSource siteAdmin = (SiteMapDataSource)Page.Master.FindControl("adm");
            menu.DataSource = siteAdmin;
            menu.DataBind();
            #endregion

            if(!IsPostBack)
                CarregaListaTipoProduto();
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
                ListItem  item = new ListItem(grupo.Nome.ToString(), grupo.Id.ToString());
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
            if (txtNome.Text == "")
            {
                lblMsg.Text = "Preencha o campo Nome do Produto";
                return;
            }
            if (ddlTipoGrupo.SelectedItem.Value == "")
            {
                lblMsg.Text = "Selecione o tipo do produto";
                return;
            }
            if (txtPrecoCusto.Text == "")
            {
                lblMsg.Text = "Preencha o campo Preço de Custo";
                return;
            }
            if (txtPrecoVenda.Text == "")
            {
                lblMsg.Text = "Preencha o campo Preço de Venda";
                return;
            }
            if (txtEstoqueMin.Text == "")
            {
                lblMsg.Text = "Preencha o campo Estoque Mínimo";
                return;
            }
            if (txtEstoqueMax.Text == "")
            {
                lblMsg.Text = "Preencha o campo Estoque Máximo";
                return;
            } 
            #endregion

            produto.Nome = txtNome.Text;
            produto.IdGrupo = Convert.ToInt32(ddlTipoGrupo.SelectedItem.Value);
            produto.PrecoCusto = Convert.ToDecimal(txtPrecoCusto.Text);
            produto.PrecoVenda = Convert.ToDecimal(txtPrecoVenda.Text);
            produto.EstoqueMin = Convert.ToInt32(txtEstoqueMin.Text);
            produto.EstoqueMax = Convert.ToInt32(txtEstoqueMax.Text);
            produto.Descricao = txtDesc.Text;

            DateTime dataVal = new DateTime((Convert.ToInt32(txtAno.Text)),(Convert.ToInt32(txtMes.Text)),Convert.ToInt32(txtDia.Text));

            produto.DataValidade = dataVal;

            executou = produtoBuss.InserirProduto(produto);

            if (executou)
            {
                txtNome.Text = "";
                txtPrecoCusto.Text = "";
                txtPrecoVenda.Text = "";
                txtEstoqueMin.Text = "";
                txtEstoqueMax.Text = "";
                txtDesc.Text = "";
                lblMsg.Text = "Cadastro efetuado com sucesso";
            }

            else
            {
                lblMsg.Text = "Cadastro não efetuado. Falha de conexão com o banco de dados";
            }
        }
      
    }
}
