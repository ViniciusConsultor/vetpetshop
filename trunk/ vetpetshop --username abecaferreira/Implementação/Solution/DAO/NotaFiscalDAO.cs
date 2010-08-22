using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace DAO
{
    public class NotaFiscalDAO
    {

        private DatabaseHelper databaseHelper;

        public NotaFiscalDAO()
        {
            databaseHelper = new DatabaseHelper();    
        }

        public bool InserirNotaFiscal(int id)
        {
            bool executou = false;
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spiInserirNotaFiscal";

                SqlParameter pid = new SqlParameter("@IdUsuario", SqlDbType.Int, 4);

                pid.Value = id;
                cmd.Parameters.Add(pid);               

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
