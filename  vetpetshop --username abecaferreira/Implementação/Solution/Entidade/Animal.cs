﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlTypes;

namespace Entidade
{
    public class Animal
    {
        public string Nome { get; set; }
        public int TipoAnimal { get; set; }
        public int Cliente { get; set; }
        public decimal Peso { get; set; }
        public string Raca { get; set; }
        public string  DataFimVacinacao { get; set; }
        public string DataNascimento { get; set; }
        public string DataProxVacinacao { get; set; }

    }
}
