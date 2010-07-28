using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidade;
using DAO;
using System.Data;

namespace Negocios
{
    public class UsuarioBuss
    {
        private UsuarioDAO usuarioDAO;

        public UsuarioBuss()
        {
            this.usuarioDAO = new UsuarioDAO();
        }

        public Usuario EfetuarLogin(string usuario, string senha)
        {
            Usuario usuarioEncontrado = new Usuario();
            usuarioEncontrado = this.usuarioDAO.EfetuarLogin(usuario, senha);
            return usuarioEncontrado;

        }

        public bool InserirUsuarioAdmin(Administrador administrador, Usuario usuario)
        {
            bool executou = this.usuarioDAO.InserirUsuarioAdmin(administrador, usuario);
            return executou;
        }

        public bool InserirUsuarioVendedor(Vendedor vendedor, Usuario usuario)
        {
            bool executou = this.usuarioDAO.InserirUsuarioVendedor(vendedor, usuario);
            return executou;
        }

        public bool InserirUsuarioVeterinario(Veterinario veterinario, Usuario usuario)
        {
            bool executou = this.usuarioDAO.InserirUsuarioVeterinario(veterinario, usuario);
            return executou;
        }

        public DataTable ListarUsuarios(DataTable tabela)
        {
            DataTable _tabelapreenchida = new DataTable();
            _tabelapreenchida = this.usuarioDAO.ListarUsuarios(tabela);

            return _tabelapreenchida;              
        }

        public bool ExcluirUsuario(int id)
        {
            bool executou = this.usuarioDAO.ExcluirUsuario(id);
            return executou;
        }
    }
}
