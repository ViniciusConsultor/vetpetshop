using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAO;
using Entidade;

namespace Negocios
{
    public class FinanceiroBuss
    {
        private FinanceiroDAO financeiroDAO;

        public FinanceiroBuss()
        {
            this.financeiroDAO = new FinanceiroDAO();
        }

        public bool InserirRegistroFinanceiro(Financeiro financeiro)
        {
            bool executou = this.financeiroDAO.InserirRegistroFinanceiro(financeiro);
            return executou;
        }
            
    }
}
