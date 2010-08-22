using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAO;

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
    }
}
