﻿using System;
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

        public int ObterIdUsuarioPorNomeUsuario(string nome)
        {
            int id = this.usuarioDAO.ObterIdUsuarioPorNomeUsuario(nome);
            return id;
        }

        public Usuario ObterUsuarioPorId(int Id)
        {
            Usuario usuario = this.usuarioDAO.ObterUsuarioPorId(Id);
            return usuario;
        }

        public bool AlterarSenha(int id, string senha)
        {
            bool executou = this.usuarioDAO.AlterarSenha(id, senha);
            return executou;
        }

        public List<Usuario> ObterUsuarioPorEmail(string email)
        {
            List<Usuario> lstUsuario = this.usuarioDAO.ObterUsuarioPorEmail(email);
            return lstUsuario;
        }

        public bool ExisteNota(int id)
        {
            bool existe = this.usuarioDAO.ExisteNota(id);
            return existe;
        }

        public bool ExisteFinanceiro(int id)
        {
            bool existe = this.usuarioDAO.ExisteFinanceiro(id);
            return existe;
        }

        public bool ExisteConsulta(int id)
        {
            bool existe = this.usuarioDAO.ExisteConsulta(id);
            return existe;
        }
    }
}
