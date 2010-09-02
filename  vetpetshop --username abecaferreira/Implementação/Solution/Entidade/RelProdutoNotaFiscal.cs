using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidade
{
    public class RelProdutoNotaFiscal
    {
        public int IdProduto { get; set; }
        public string NomeProduto { get; set; }
        public int IdNotaFiscal { get; set; }
        public int Quantidade { get; set; }
        public decimal PrecoUnitarioProduto { get; set; }
        public decimal ValorNotal { get; set; }
        public decimal ValorTotalProduto { get; set; }
    }
}
