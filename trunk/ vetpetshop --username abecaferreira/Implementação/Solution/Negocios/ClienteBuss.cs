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

        public bool AlterarCliente(Cliente cliente)
        {
            bool executou = this.clienteDAO.AlterarCliente(cliente);
            return executou;
        }

        public DataTable ListarClientes(DataTable tabela)
        {
            DataTable _tabelapreenchida = new DataTable();
            _tabelapreenchida = this.clienteDAO.ListarClientes(tabela);

            return _tabelapreenchida;
        }

        public List<Cliente> ListarClientesCadastrados(string Nome)
        {
            List<Cliente> lstCliente = new List<Cliente>();
            lstCliente = this.clienteDAO.ListarClientesCadastrados(Nome);

            return lstCliente;
        }

        public List<Cliente> ListarDDLClientes()
        {
            List<Cliente> _lista = new List<Cliente>();
            _lista = this.clienteDAO.ListarDDLClientes();
            return _lista;
        }

        public List<Cliente> PreencheUsuario(Int32 CodCliente)
        {
            List<Cliente> _lista = new List<Cliente>();
            _lista = this.clienteDAO.PreencheUsuario(CodCliente);
            return _lista;
        }

        public bool ExcluirCliente(int id)
        {
            bool executou = this.clienteDAO.ExcluirCliente(id);
            return executou;
        }
   
    }

}
