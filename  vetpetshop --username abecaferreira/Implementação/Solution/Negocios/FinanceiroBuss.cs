using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAO;
using Entidade;
using System.Data;

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

        //public List<FinancasEstoque> ListarFinancasEstoque(int ano)
        //{
        //    List<FinancasEstoque> lista = new List<FinancasEstoque>();

        //    lista = this.financeiroDAO.ListarFinancasEstoque(ano);
        //    return lista;
        //}

        public List<FinancasLucro> ListarFinancasLucro(int ano)
        {
            List<FinancasLucro> lista = new List<FinancasLucro>();

            lista = this.financeiroDAO.ListarFinancasLucro(ano);
            return lista;
        }

        public List<FinancasValorAReceber> ListarValorReceber(int ano)
        {
            List<FinancasValorAReceber> lista = new List<FinancasValorAReceber>();

            lista = this.financeiroDAO.ListarValorReceber(ano);

            return lista;
        }

        public Int32 ObterUltimoRegistroFinanceiroConsulta()
        {
            Int32 idInserido; 
            idInserido = this.financeiroDAO.ObterUltimoRegistroFinanceiroConsulta();
            return idInserido;
        }

        public List<FinancasConsultas> ListarFinancasConsultas(int ano)
        {
            List<FinancasConsultas> lista = new List<FinancasConsultas>();

            lista = this.financeiroDAO.ListarFinancasConsultas(ano);

            return lista;
        }

        public List<FinancasVacinas> ListaFinancasVacinas(int ano)
        {
            List<FinancasVacinas> lista = new List<FinancasVacinas>();

            lista = this.financeiroDAO.ListarFinancasVacinas(ano);

            return lista;
        }

        public List<FinancasFaturamento> ListarFinancasFaturamento(int ano)
        {
            List<FinancasFaturamento> lista = new List<FinancasFaturamento>();

            lista = this.financeiroDAO.ListarFinancasFaturamento(ano);

            return lista;
        }

        public DataTable ListarClientesEspeciais(DataTable tabela, int ano)
        {
            DataTable _table = new DataTable();

            _table = this.financeiroDAO.ListarClientesEspeciais(tabela, ano);

            return _table;
        }
    }
}
