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

        public void InserirUsuarioVendedor(Vendedor vendedor, Usuario usuario)
        { 
            
        }

        public void InserirUsuarioVeterinario(Veterinario veterinario, Usuario usuario)
        { 
            
        }
    }
}
