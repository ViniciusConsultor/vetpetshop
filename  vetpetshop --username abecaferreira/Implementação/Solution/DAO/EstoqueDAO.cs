using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using Entidade;

namespace DAO
{
    public class EstoqueDAO
    {
        private DatabaseHelper databaseHelper;

         public EstoqueDAO()
        {
            databaseHelper = new DatabaseHelper();    
        }

        public void InserirEstoque(Entidade.Estoque estoque, int idProd)
        {
            bool executou = false;
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spiInserirEstoque";

                SqlParameter pstatus = new SqlParameter("@Status", SqlDbType.Int, 4);
                SqlParameter pquant = new SqlParameter("@Quantidade", SqlDbType.Int, 4);
                SqlParameter pidProd = new SqlParameter("@IdProd", SqlDbType.Int, 4);

                pstatus.Value = estoque.Status;
                pquant.Value = estoque.Quantidade;
                pidProd.Value = idProd;

                cmd.Parameters.Add(pstatus);
                cmd.Parameters.Add(pquant);
                cmd.Parameters.Add(pidProd);

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
        }

        public RelEstoqueProduto ObterEstoqueProdutoPorId(int idProd)
        {
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            RelEstoqueProduto rel = new RelEstoqueProduto();

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spsObterEstoqueProdutoPorIdProduto";

                SqlParameter pId = new SqlParameter("@IdProd", SqlDbType.Int, 4);
                pId.Value = idProd;

                cmd.Parameters.Add(pId);
                
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (dr.Read())
                {
                    rel.IdEstoque = dr.GetInt32(1);
                    rel.IdProduto = dr.GetInt32(2);
                }

                else
                    rel = null;

                dr.Close();
                conn.Close();

                return rel;
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
        }

        public void AtualizatEstoque(int idEstoque, int quant, int status)
        {
            string stringConexao = databaseHelper.GetConnectionString("conexao");

            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spuAtualizarEstoque";

                SqlParameter pQuant = new SqlParameter("@Quantidade", SqlDbType.Int, 4);
                SqlParameter pStatus = new SqlParameter("@Status", SqlDbType.Int, 4);

                pQuant.Value = quant;
                pStatus.Value = status;

                cmd.Parameters.Add(new SqlParameter("@IdEstoque", SqlDbType.Int)).Value = idEstoque;
                cmd.Parameters.Add(pStatus);
                cmd.Parameters.Add(pQuant);

                conn.Open();
                int registro = cmd.ExecuteNonQuery();
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
        }


        public Estoque ObterEstoquePorId(int idEstoque)
        {
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            Estoque estoque = new Estoque();

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spsObterEstoquePorId";

                SqlParameter pId = new SqlParameter("@IdEstoque", SqlDbType.Int, 4);
                pId.Value = idEstoque;

                cmd.Parameters.Add(pId);
                
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);


                while (dr.Read())
                {
                    estoque.Status = dr.GetInt16(1);
                    estoque.Quantidade = dr.GetInt32(2);                   
                }

                dr.Close();
                conn.Close();

                return estoque;
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
        }


        public DataTable ListarEstoque(DataTable tabela)
        {
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spsListarEstoque";

            conn.Open();

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (dr.Read())
            {
                DataRow _linhaTabela = tabela.NewRow();
                _linhaTabela["id_estoque"] = dr.GetInt32(0).ToString();
                _linhaTabela["tipo"] = dr.GetString(1);
                _linhaTabela["nm_produto"] = dr.GetString(2);
                _linhaTabela["min"] = dr.GetInt32(3).ToString();
                _linhaTabela["max"] = dr.GetInt32(4).ToString();
                _linhaTabela["quantidade"] = dr.GetInt32(5).ToString();

                tabela.Rows.Add(_linhaTabela);
            }


            dr.Close();
            conn.Close();

            return tabela;
        }
    }
}
