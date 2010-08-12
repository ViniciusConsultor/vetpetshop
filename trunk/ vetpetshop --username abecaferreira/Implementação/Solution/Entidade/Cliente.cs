using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlTypes;


namespace Entidade
{
    public class Cliente
    {
        public string Nome { get; set; }
        public string CPF  { get; set; }
        public string Telefone { get; set; }
        public string Email { get; set; }
    }
}
