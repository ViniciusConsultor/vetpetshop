using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidade;
using System.Data.SqlClient;
using System.Data;
using System.Data.Common;

namespace DAO
{
    public class UsuarioDAO
    {
        private DatabaseHelper databaseHelper;

        public UsuarioDAO()
        {
            databaseHelper = new DatabaseHelper();    
        }

        public Usuario EfetuarLogin(string usuario, string senha)
        {
            Usuario usuarioEncontrado = new Usuario();
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spsLogin";

                SqlParameter pnomeUsu = new SqlParameter("@Usuario", SqlDbType.VarChar, 15);
                SqlParameter pSenha = new SqlParameter("@Senha", SqlDbType.VarChar, 30);

                pnomeUsu.Value = usuario;
                pSenha.Value = senha;
                cmd.Parameters.Add(pnomeUsu);
                cmd.Parameters.Add(pSenha);
             
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (dr.Read())
                  usuarioEncontrado.TipoUsuario = dr.GetInt32(0);
                
                else
                  usuarioEncontrado = null;
                

                dr.Close();
            }

            catch (SqlException ex)
            {
                //throw new Exception("Servidor SQL Erro: " + ex.Number);
                throw new Exception(ex.Message);
            }

            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                conn.Close();
            }

            return usuarioEncontrado;
        
        }

        /// <summary>
        /// //PERSITE TABELA ADMINISTRADOR E USUARIO
        /// </summary>
        /// <param name="administrador"></param>
        /// <param name="usuario"></param>
        /// <returns></returns>
        public bool InserirUsuarioAdmin(Administrador administrador, Usuario usuario)
        {
             bool executou = false;
            string stringConexao = databaseHelper.GetConnectionString("conexao");
             SqlConnection conn = new SqlConnection(stringConexao);
           
                try               
                {                    
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "spiInserirAdministrador";

                    SqlParameter pnomeAdmin = new SqlParameter("@Nome_Prof", SqlDbType.VarChar, 50);
                    SqlParameter pnomeUsuario = new SqlParameter("@Nome_Usuario", SqlDbType.VarChar, 20);
                    SqlParameter ptipo = new SqlParameter("@Tipo", SqlDbType.Int, 4);
                    SqlParameter psenha = new SqlParameter("@Senha", SqlDbType.VarChar, 50);

                    pnomeAdmin.Value = administrador.Nome;
                    pnomeUsuario.Value = usuario.Nome;
                    ptipo.Value = usuario.TipoUsuario;
                    psenha.Value = usuario.Senha;
                    cmd.Parameters.Add(pnomeAdmin);
                    cmd.Parameters.Add(pnomeUsuario);
                    cmd.Parameters.Add(ptipo);
                    cmd.Parameters.Add(psenha);

                    conn.Open();
                    int registro = cmd.ExecuteNonQuery();
                    executou = true;
                }

                catch (SqlException ex)
                {
                    //throw new Exception("Servidor SQL Erro: " + ex.Number);
                    throw new Exception(ex.Message);
                }

                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
                finally
                {
                    conn.Close();
                }

                return executou;
           }


        /// <summary>
        /// PERSISTE TABELA VETERINARIO E USUARIO
        /// </summary>
        /// <param name="veterinario"></param>
        /// <param name="usuario"></param>
        /// <returns></returns>
        public bool InserirUsuarioVeterinario(Veterinario veterinario, Usuario usuario)
        {

            bool executou = false;
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spiInserirVeterinario";

                SqlParameter pnomeVet = new SqlParameter("@Nome_Prof", SqlDbType.VarChar, 50);
                SqlParameter pnomeUsuario = new SqlParameter("@Nome_Usuario", SqlDbType.VarChar, 20);
                SqlParameter ptipo = new SqlParameter("@Tipo", SqlDbType.Int, 4);
                SqlParameter psenha = new SqlParameter("@Senha", SqlDbType.VarChar, 50);

                pnomeVet.Value = veterinario.Nome;
                pnomeUsuario.Value = usuario.Nome;
                ptipo.Value = usuario.TipoUsuario;
                psenha.Value = usuario.Senha;
                cmd.Parameters.Add(pnomeVet);
                cmd.Parameters.Add(pnomeUsuario);
                cmd.Parameters.Add(ptipo);
                cmd.Parameters.Add(psenha);

                conn.Open();
                int registro = cmd.ExecuteNonQuery();
                executou = true;
            }

            catch (SqlException ex)
            {
                //throw new Exception("Servidor SQL Erro: " + ex.Number);
                throw new Exception(ex.Message);
            }

            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                conn.Close();
            }

            return executou;
        }


        /// <summary>
        /// PERSISTE TABELA VENDEDOR E USUARIO
        /// </summary>
        /// <param name="vendedor"></param>
        /// <param name="usuario"></param>
        /// <returns></returns>
        public bool InserirUsuarioVendedor(Vendedor vendedor, Usuario usuario)
        {
            bool executou = false;
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spiInserirVendedor";

                SqlParameter pnomeVet = new SqlParameter("@Nome_Prof", SqlDbType.VarChar, 50);
                SqlParameter pnomeUsuario = new SqlParameter("@Nome_Usuario", SqlDbType.VarChar, 20);
                SqlParameter ptipo = new SqlParameter("@Tipo", SqlDbType.Int, 4);
                SqlParameter psenha = new SqlParameter("@Senha", SqlDbType.VarChar, 50);

                pnomeVet.Value = vendedor.Nome;
                pnomeUsuario.Value = usuario.Nome;
                ptipo.Value = usuario.TipoUsuario;
                psenha.Value = usuario.Senha;
                cmd.Parameters.Add(pnomeVet);
                cmd.Parameters.Add(pnomeUsuario);
                cmd.Parameters.Add(ptipo);
                cmd.Parameters.Add(psenha);

                conn.Open();
                int registro = cmd.ExecuteNonQuery();
                executou = true;
            }

            catch (SqlException ex)
            {
                //throw new Exception("Servidor SQL Erro: " + ex.Number);
                throw new Exception(ex.Message);
            }

            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                conn.Close();
            }

            return executou;
        }


        public DataTable ListarUsuarios(DataTable tabela)
        {
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spsListaUsuariosProfissionais";

            conn.Open();

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (dr.Read())
            {
                DataRow _linhaTabela = tabela.NewRow();
                _linhaTabela["id_usuario"] = dr.GetInt32(0);


                if (dr.GetInt32(1).Equals(1))
                {
                    _linhaTabela["tipo_prof"] = "Administrador";
                    _linhaTabela["nm_prof"] = dr.GetString(4);
                }

                if (dr.GetInt32(1).Equals(2))
                {
                    _linhaTabela["tipo_prof"] = "Veterinário";
                    _linhaTabela["nm_prof"] = dr.GetString(8);
                }

                if (dr.GetInt32(1).Equals(3))
                {
                    _linhaTabela["tipo_prof"] = "Vendedor";
                    _linhaTabela["nm_prof"] = dr.GetString(11);
                }
                
                _linhaTabela["nm_usuario"] = dr.GetString(5);
                
                tabela.Rows.Add(_linhaTabela);
            }

            conn.Close();
            return tabela;
        }


        public bool ExcluirUsuario(int id)
        {
            bool executou = false;
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spdExcluirUsuario";

                SqlParameter pId = new SqlParameter("@Id", SqlDbType.Int, 4);

                pId.Value = id;                
                cmd.Parameters.Add(pId);
               
                conn.Open();
                int registro = cmd.ExecuteNonQuery();
                executou = true;
            }

            catch (SqlException ex)
            {
                //throw new Exception("Servidor SQL Erro: " + ex.Number);
                throw new Exception(ex.Message);
            }

            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                conn.Close();
            }


            return executou;
        }           
     }

}
