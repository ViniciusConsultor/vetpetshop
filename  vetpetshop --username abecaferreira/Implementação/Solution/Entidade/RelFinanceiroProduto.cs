using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidade
{
    public class RelFinanceiroProduto
    {
        public int Id { get; set; }
        public int IdProduto { get; set; }
        public int IdFinanceiro { get; set; }
        public DateTime DataTransacao { get; set; }
    }
}
