using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAO;
using Entidade;
using System.Data;

namespace Negocios
{
    public class EstoqueBuss
    {

        private EstoqueDAO estoqueDAO;

        public EstoqueBuss()
        {
            this.estoqueDAO = new EstoqueDAO();
        }

        public void InserirEstoque(Estoque estoque, int idProd)
        {
            this.estoqueDAO.InserirEstoque(estoque, idProd);
        }

        public RelEstoqueProduto ObterEstoqueProdutoPorIdProd(int idProd)
        {
            RelEstoqueProduto rel = new RelEstoqueProduto();
            rel = this.estoqueDAO.ObterEstoqueProdutoPorId(idProd);
            return rel;
        }

        public void AtualizarEstoque(int idEstoque, int quant, int status)
        {
            this.estoqueDAO.AtualizatEstoque(idEstoque, quant, status);
        }

        public Estoque ObterEstoquePorId(int idEstoque)
        {
            Estoque estoque = this.estoqueDAO.ObterEstoquePorId(idEstoque);
            return estoque;
        }

        public DataTable ListarEstoque(System.Data.DataTable tabela)
        {
            DataTable tabelaPreenchida = this.estoqueDAO.ListarEstoque(tabela);

            return tabelaPreenchida;
        }
    }
}
