using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidade
{
    public class Financas
    {
        public int Mes { get; set; }
        public Decimal Valor { get; set; }
    }

    public class FinancasEstoque
    {
        public int Mes { get; set; }
        public Decimal Valor { get; set; }
    }

    public class FinancasLucro
    {
        public int Mes { get; set; }
        public Decimal Valor { get; set; }
    }

    public class FinancasValorAReceber
    {
        public int Mes { get; set; }
        public Decimal Valor { get; set; }
    }

    public class FinancasConsultas
    {
        public int Mes { get; set; }
        public Decimal Valor { get; set; }
    }

    public class FinancasVacinas
    {
        public int Mes { get; set; }
        public Decimal Valor { get; set; }
    }

    public class FinancasFaturamento
    {
        public int Mes { get; set; }
        public Decimal Valor { get; set; }
    }
}
