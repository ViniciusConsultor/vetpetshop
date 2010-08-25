using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidade
{
    public class NotaFiscal
    {
        public int Id { get; set; }
        public int idUsuario { get; set; }
        public DateTime DataCadastro { get; set; }
        public decimal Valor { get; set; }
        public int Status { get; set; }
        public DateTime DataRecebimento { get; set; }
    }
}
