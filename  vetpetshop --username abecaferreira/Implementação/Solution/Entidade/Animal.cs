using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlTypes;

namespace Entidade
{
    class Animal
    {
        public string Nome { get; set; }
        public int TipoAnimal { get; set; }
        public decimal Peso { get; set; }
        public string Raca { get; set; }
    }
}
