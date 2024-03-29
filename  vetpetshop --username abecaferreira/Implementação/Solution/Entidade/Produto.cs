﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidade
{
    public class Produto
    {
        private int _estoqueMedio;

        public int IdProduto { get; set; }
        public int IdGrupo { get; set; }
        public string Nome { get; set; }
        public int EstoqueMin { get; set; }
        public int EstoqueMax { get; set; }
        public string Descricao { get; set; }
        public decimal PrecoCusto { get; set; }
        public Nullable<DateTime> DataValidade { get; set; }
        public decimal PrecoVenda { get; set; }
        public int Quantidade { get; set; }
        public string NomeGrupo { get; set; }

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
