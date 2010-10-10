using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlTypes;

namespace Entidade
{
    public class Financeiro
    {
        public decimal ValorTotal { get; set; }
        public int TipoPagamento { get; set; }
        public int TipoTransacao { get; set; }
        public DateTime DataVenda { get; set; }
        public SqlInt32 Parcelas { get; set; }
        public int Usuario { get; set; }
        public int TipoResponsavel { get; set; }
        public SqlString NomeCliente { get; set; }
    }
}
