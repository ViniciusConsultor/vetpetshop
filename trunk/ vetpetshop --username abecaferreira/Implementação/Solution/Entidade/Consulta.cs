using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlTypes;

namespace Entidade
{
    public class Consulta
    {
        public int idConsulta { get; set; }
        public int idUsuario { get; set; }
        public int idFinanceiro { get; set; }
        public decimal Valor { get; set; }
        public DateTime Data { get; set; }
        public int Status { get; set; }
    }
}
