using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidade
{
    public class RelEstoqueProduto
    {
        public int Id { get; set; }
        public int IdProduto { get; set; }
        public int IdEstoque { get; set; }
    }
}
