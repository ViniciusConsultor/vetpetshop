using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidade;
using DAO;
using System.Data;

namespace Negocios
{
    public class ClienteBuss
    {
        private ClienteDAO clienteDAO;

        public ClienteBuss()
        {
            this.clienteDAO = new ClienteDAO();
        }

        public bool InserirCliente(Cliente cliente)
        {
            bool executou = this.clienteDAO.InserirCliente(cliente);
            return executou;
        }

        public DataTable ListarClientes(DataTable tabela)
        {
            DataTable _tabelapreenchida = new DataTable();
            _tabelapreenchida = this.clienteDAO.ListarClientes(tabela);

            return _tabelapreenchida;
        }

        public bool ExcluirCliente(int id)
        {
            bool executou = this.clienteDAO.ExcluirCliente(id);
            return executou;
        }
   
    }
}
