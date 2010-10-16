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


        public Financeiro ObterFinanceiroVendaRegistrado()
        {
            Financeiro financeiro = new Financeiro();
            financeiro = this.financeiroDAO.ObterFinanceiroVendaRegistrado();
            return financeiro;
        }

        public void InserirRelFinanceiroProduto(RelFinanceiroProduto relFinanceiroProduto)
        {
            this.financeiroDAO.InserirRelFinanceiroProduto(relFinanceiroProduto);
        }

        public List<Financas> ListarInvestimentos(int ano)
        {
            List<Financas> lista = new List<Financas>();

            lista = this.financeiroDAO.ListarInvestimentos(ano);
            return lista;
        }

        public List<Financas> ListarVendas(int ano)
        {
            List<Financas> lista = new List<Financas>();

            lista = this.financeiroDAO.ListarVendas(ano);
            return lista;
        }

        public List<FinancasEstoque> ListarFinancasEstoque(int ano)
        {
            List<FinancasEstoque> lista = new List<FinancasEstoque>();

            lista = this.financeiroDAO.ListarFinancasEstoque(ano);
            return lista;
        }
    }
}
