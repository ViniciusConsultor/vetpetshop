using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidade
{
    public class Produto
    {
        private int _estoqueMedio;

        public int IdGrupo { get; set; }
        public string Nome { get; set; }
        public int EstoqueMin { get; set; }
        public int EstoqueMax { get; set; }
        public string Descricao { get; set; }
        public int PrecoCusto { get; set; }
        public DateTime DataValidade { get; set; }
        public int PrecoVenda { get; set; }

        public int EstoqueMedio
        {
            get
            {
                return this._estoqueMedio;
            }

            set
            {
                _estoqueMedio = (this.EstoqueMax + this.EstoqueMin) / 2;
            }
        }
            

    }
}
