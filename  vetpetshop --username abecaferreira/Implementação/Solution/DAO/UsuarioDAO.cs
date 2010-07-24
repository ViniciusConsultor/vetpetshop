using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidade;
using System.Data.SqlClient;
using System.Data;

namespace DAO
{
    public class UsuarioDAO
    {
        private DatabaseHelper databaseHelper;

        public UsuarioDAO()
        {
            databaseHelper = new DatabaseHelper();    
        }

        public bool InserirUsuarioAdmin(Administrador administrador, Usuario usuario)
        {
             bool executou = false;
            string stringConexao = databaseHelper.GetConnectionString("conexao");
             SqlConnection conn = new SqlConnection(stringConexao);
           
            //PERSITE TABELA ADMINISTRADOR E USUARIO
                try               
                {                    
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "spiInserirAdministrador";

                    SqlParameter pnomePessoa = new SqlParameter("@Nome_Pessoa", SqlDbType.VarChar, 50);
                    SqlParameter pnomeAdmin = new SqlParameter("@Nome", SqlDbType.VarChar, 20);
                    SqlParameter ptipo = new SqlParameter("@Tipo", SqlDbType.Int, 4);
                    SqlParameter psenha = new SqlParameter("@Senha", SqlDbType.VarChar, 50);

                    pnomePessoa.Value = administrador.Nome;
                    pnomeAdmin.Value = usuario.Nome;
                    ptipo.Value = usuario.TipoUsuario;
                    psenha.Value = usuario.Senha;
                    cmd.Parameters.Add(pnomePessoa);
                    cmd.Parameters.Add(pnomeAdmin);
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
           
     }

}
