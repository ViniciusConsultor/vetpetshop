using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidade
{
    public class Financeiro
    {
        public decimal ValorTotal { get; set; }
        public int TipoPagamento { get; set; }
        public int TipoTransacao { get; set; }
        public DateTime DataVenda { get; set; }
    }
}
