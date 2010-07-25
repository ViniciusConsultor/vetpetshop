using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidade;
using DAO;

namespace Negocios
{
    public class UsuarioBuss
    {
        private UsuarioDAO usuarioDAO;

        public UsuarioBuss()
        {
            this.usuarioDAO = new UsuarioDAO();
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

        //public List<Usuario> ListarUsuarios()
        //{
        //    this.usuarioDAO.ListarUsuarios();                     
        //}
    }
}
