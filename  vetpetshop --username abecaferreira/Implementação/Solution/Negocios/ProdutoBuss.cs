using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAO;
using Entidade;

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

    }
}
