using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlTypes;

namespace Entidade
{
    public class Usuario
    {
        public string Nome { get; set; }
        public int TipoUsuario { get; set; }
        public string Senha { get; set; }
        public string Email { get; set; }
    }

}
