using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAO;
using Entidade;
using System.Data;

namespace Negocios
{
    public class NotaFiscalBuss
    {
        private NotaFiscalDAO notaDAO;

        public NotaFiscalBuss()
        {
            this.notaDAO = new NotaFiscalDAO();
        }

        public bool InserirNotaFiscal(int id)
        {
            bool executou;
            executou = this.notaDAO.InserirNotaFiscal(id);
            return executou;
        }

        public NotaFiscal ObterUltimoRegistroNota()
        {
            NotaFiscal nota = this.notaDAO.ObterUltimoRegistroNota();
            return nota;
        }

        public void InserirRelProdNota(RelProdutoNotaFiscal relProdNota)
        {
           this.notaDAO.InserirRelProdNota(relProdNota);
        }

        public System.Data.DataTable ListarPedidosDeCompras(DataTable _tabela)
        {
            DataTable tabela = new DataTable();
            tabela = this.notaDAO.ListaPedidosDeCompras(_tabela);
            return tabela;
        }

        public List<RelProdutoNotaFiscal> ListarRelProdutoNotaFiscalByIdPedido(int codNota)
        {
            List<RelProdutoNotaFiscal> rel = new List<RelProdutoNotaFiscal>();
            rel = this.notaDAO.ListarRelProdutoNotaFiscalByIdPedido(codNota);
            return rel;
        }

        public NotaFiscal ObterPedidoById(int idPedido)
        {
            NotaFiscal nota = this.notaDAO.ObterPedidoById(idPedido);
            return nota;
        }
    }
}
