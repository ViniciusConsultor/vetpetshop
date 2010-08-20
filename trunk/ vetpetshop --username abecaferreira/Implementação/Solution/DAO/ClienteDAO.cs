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
    public class ClienteDAO
    {
        private DatabaseHelper databaseHelper;

        public ClienteDAO()
        {
            databaseHelper = new DatabaseHelper();
        }

        /// <summary>
        /// //PERSITE TABELA CLIENTE
        /// </summary>
        /// <param name="cliente"></param>
        /// <returns></returns>
        public bool InserirCliente(Cliente cliente)
        {
            bool executou = false;
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spiInserirCliente";

                SqlParameter pnomeCliente = new SqlParameter("@Nome_Cliente", SqlDbType.VarChar, 100);
                SqlParameter pCpf = new SqlParameter("@Num_Cpf", SqlDbType.VarChar, 20);
                SqlParameter pTelefone = new SqlParameter("@Num_Tel", SqlDbType.VarChar, 20);
                SqlParameter pCelular = new SqlParameter("@Email", SqlDbType.VarChar, 30);
                SqlParameter pEmail = new SqlParameter("@Email", SqlDbType.VarChar, 30);
                SqlParameter pEmail = new SqlParameter("@Email", SqlDbType.VarChar, 30);
                SqlParameter pEmail = new SqlParameter("@Email", SqlDbType.VarChar, 30);
                SqlParameter pEmail = new SqlParameter("@Email", SqlDbType.VarChar, 30);
                SqlParameter pEmail = new SqlParameter("@Email", SqlDbType.VarChar, 30);
                SqlParameter pEmail = new SqlParameter("@Email", SqlDbType.VarChar, 30);
                SqlParameter pEmail = new SqlParameter("@Email", SqlDbType.VarChar, 30);


                pnomeCliente.Value = cliente.Nome;
                pCpf.Value = cliente.CPF;
                pTelefone.Value = cliente.Telefone1;
                pCelular.Value = cliente.Telefone2;

                pEmail.Value = cliente.Email;
                cmd.Parameters.Add(pnomeCliente);
                cmd.Parameters.Add(pCpf);
                cmd.Parameters.Add(pTelefone);
                cmd.Parameters.Add(pEmail);

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

        public DataTable ListarClientes(DataTable tabela)
        {
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spsListaClientes";

            conn.Open();

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (dr.Read())
            {
                DataRow _linhaTabela = tabela.NewRow();
                _linhaTabela["id_cliente"] = dr.GetInt32(0);
                _linhaTabela["nm_cliente"] = dr.GetString(1);
                _linhaTabela["nm_cpf"] = dr.GetString(2);
                _linhaTabela["nm_tel"] = dr.GetString(3);
                _linhaTabela["nm_email"] = dr.GetString(4);

                tabela.Rows.Add(_linhaTabela);
            }

            conn.Close();
            return tabela;
        }


        public bool ExcluirCliente(int id)
        {
            bool executou = false;
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);


            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spdExcluirCliente";

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
