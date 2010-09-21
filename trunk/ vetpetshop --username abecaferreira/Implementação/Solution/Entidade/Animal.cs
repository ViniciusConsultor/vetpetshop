using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlTypes;

namespace Entidade
{
    public class Animal
    {
        public int IdAnimal { get; set; }
        public string Nome { get; set; }
        public int IdTipoAnimal { get; set; }
        public string Sexo { get; set; } 
        public int IdCliente { get; set; }
        public decimal Peso { get; set; }
        public string Raca { get; set; }
        public DateTime DataFimVacinacao { get; set; }
        public DateTime DataNascimento { get; set; }
        public DateTime DataProxVacinacao { get; set; }

    }
}
