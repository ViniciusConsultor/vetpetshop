using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAO;
using Entidade;
using System.Data;

namespace Negocios
{
   public class ProdutoBuss
    {
       private ProdutoDAO produtoDAO;

       public ProdutoBuss()
       {
           this.produtoDAO = new ProdutoDAO();
       }

       public bool InserirProduto(Produto produto)
       {
           bool salvou;
           salvou = this.produtoDAO.InserirProduto(produto);
           return salvou;
       }

       public DataTable ListarProdutos(DataTable tabela, string nome, int id)
       {
           DataTable tabelaPreenchida = new DataTable();

           tabelaPreenchida = this.produtoDAO.ListarProduto(tabela, nome, id);
           return tabelaPreenchida;
       }

       public bool ExisteProdutoPorGrupo(int id)
       {
           bool existe;
           existe = this.produtoDAO.ExisteProdutoPorGrupo(id);
           return existe;
       }


       public Produto ObterProdutoPorId(int idProd)
       {
           Produto produto = new Produto();
           produto = this.produtoDAO.ObterProdutoPorId(idProd);

           return produto;
       }

       public bool ExcluirProduto(int idProd)
       {
           bool executou;
           executou = this.produtoDAO.ExcluirProduto(idProd);
           return executou;
       }

       public bool AtualizarProduto(Produto produto, int id)
       {
           bool executou;

           executou = this.produtoDAO.AtualizarProduto(produto, id);
           return executou;
       }

       public List<Produto> ListarProdutos(string nome, int id)
       {
           List<Produto> _lista = new List<Produto>();

           _lista = this.produtoDAO.ListarProduto(nome, id);
           return _lista;
       }
    }
}
