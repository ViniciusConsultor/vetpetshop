using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAO;
using Entidade;

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
    }
}
