using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidade;
using System.Data.SqlClient;
using System.Data;

namespace DAO
{
    public class GrupoProdutoDAO
    {
        private DatabaseHelper databaseHelper;

        public GrupoProdutoDAO()
        {
            databaseHelper = new DatabaseHelper();
        }

        public bool InserirGrupo(Grupo grupo)
        {
            bool salvou = false;
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spiInserirGrupoProduto";

                SqlParameter pnomeNome = new SqlParameter("@Nome", SqlDbType.VarChar, 30);

                pnomeNome.Value = grupo.Nome;
                cmd.Parameters.Add(pnomeNome);              

                conn.Open();
                int registro = cmd.ExecuteNonQuery();
                salvou = true;
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

            return salvou;        
        }

        public DataTable ListarGrupos(DataTable tabela)
        {
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spsListaGruposProdutos";

            conn.Open();

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (dr.Read())
            {
                DataRow _linhaTabela = tabela.NewRow();
                _linhaTabela["id_grupo"] = dr.GetInt32(0);
                _linhaTabela["nm_grupo"] = dr.GetString(1);

                tabela.Rows.Add(_linhaTabela);
            }

            return tabela;
        }

        public bool ExcluirGrupo(int id)
        {
                bool executou = false;
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spdExcluirGrupoProduto";

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
