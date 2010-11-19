using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using Entidade;
using System.Data.SqlTypes;

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

        public NotaFiscal ObterUltimoRegistroNota()
        {
            NotaFiscal nota = new NotaFiscal();   
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spsObterUltimoRegistroNotaFiscal";
               
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
               

                //if(!dr.Read())
                //    return null;

                while(dr.Read())
                {
                    nota.Id = dr.GetInt32(0);
                    nota.idUsuario = dr.GetInt32(1);
                    nota.DataCadastro = dr.GetDateTime(2);
                    if (!dr.IsDBNull(3))
                        nota.Valor = dr.GetDecimal(3);
                    nota.Status = dr.GetInt32(4);
                    if (!dr.IsDBNull(5))
                        nota.DataRecebimento = dr.GetDateTime(5);

                }

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

            return nota;
        
        }

        public void InserirRelProdNota(RelProdutoNotaFiscal relProdNota)
        {
            //bool executou = false;
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spiInserirRelNotaFiscal";

                SqlParameter pidNota = new SqlParameter("@IdNota", SqlDbType.Int, 4);
                SqlParameter pidProd = new SqlParameter("@IdProd", SqlDbType.Int, 4);
                SqlParameter pquant = new SqlParameter("@Quantidade", SqlDbType.Int, 4);
                SqlParameter pValor = new SqlParameter("@ValorNota", SqlDbType.Decimal);

                pidNota.Value = relProdNota.IdNotaFiscal;
                pidProd.Value = relProdNota.IdProduto;
                pquant.Value = relProdNota.Quantidade;
                pValor.Value = relProdNota.ValorNotal;

                //cmd.Parameters.Add(new SqlParameter("@IdNota", SqlDbType.Int)).Value = pidNota;
                cmd.Parameters.Add(pidNota);
                cmd.Parameters.Add(pidProd);
                cmd.Parameters.Add(pquant);
                cmd.Parameters.Add(pValor);

                conn.Open();
                int registro = cmd.ExecuteNonQuery();
                //executou = true;
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

            //return executou;
        }

        public DataTable ListaPedidosDeCompras(DataTable _tabela)
        {
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spsListaPedidosDeCompras";
               
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
               

                while(dr.Read())
                {
                    DataRow _linha = _tabela.NewRow();
                    _linha["id_pedido"] = dr.GetInt32(0).ToString();

                    if (!dr.IsDBNull(4))
                        _linha["dt_cad"] = dr.GetDateTime(4).ToString("dd/MM/yyyy");
                    else
                        _linha["dt_cad"] = "";

                    _linha["valor"] = dr.GetDecimal(5).ToString();

                    if (dr.GetInt32(6).Equals(1))
                        _linha["status"] = "À Receber";
                    else
                        _linha["status"] = "Recebida";

                    if (dr.IsDBNull(7))
                        _linha["dt_receb"] = "";                        
                    else
                        _linha["dt_receb"] = dr.GetDateTime(7).ToString("dd/MM/yyyy");
                        

                    _tabela.Rows.Add(_linha);
                 }

                dr.Close();
                conn.Close();

                return _tabela;
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

        public List<RelProdutoNotaFiscal> ListarRelProdutoNotaFiscalByIdPedido(int codNota)
        {
            List<RelProdutoNotaFiscal> rel = new List<RelProdutoNotaFiscal>();            

            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spsListaRelProdutoNotaFiscal";
                
                SqlParameter pId = new SqlParameter("@IdNota", SqlDbType.Int, 4);

                pId.Value = codNota;

                cmd.Parameters.Add(pId);

                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);


                while (dr.Read())
                {
                    RelProdutoNotaFiscal produtoNota = new RelProdutoNotaFiscal();

                    produtoNota.IdProduto = dr.GetInt32(2);
                    produtoNota.Quantidade = dr.GetInt32(3);
                    produtoNota.NomeProduto = dr.GetString(4);
                    produtoNota.PrecoUnitarioProduto = dr.GetDecimal(5);
                    produtoNota.ValorTotalProduto = (dr.GetDecimal(5) * produtoNota.Quantidade);

                    rel.Add(produtoNota);
                }

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

        public NotaFiscal ObterPedidoById(int idPedido)
        {
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            NotaFiscal nota = new NotaFiscal();

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spsObterPedidoDeCompraByPK";

                SqlParameter pId = new SqlParameter("@IdNota", SqlDbType.Int, 4);
                pId.Value = idPedido;

                cmd.Parameters.Add(pId);
                
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);


                while (dr.Read())
                {
                    nota.idUsuario = dr.GetInt32(0);
                    nota.DataCadastro = dr.GetDateTime(1);
                    nota.Valor = dr.GetDecimal(2);
                    nota.Status = dr.GetInt32(3);                    
                }

                dr.Close();
                conn.Close();

                return nota;
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

        public bool AtualizarPedidoCompra(int idPed, int status)
        {
            bool salvou = false;
            string stringConexao = databaseHelper.GetConnectionString("conexao");

            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spuAtualizarPedidoDeCompra";

                SqlParameter pStatus = new SqlParameter("@Status", SqlDbType.Int, 4);
                pStatus.Value = status;
                
                cmd.Parameters.Add(new SqlParameter("@IdNota", SqlDbType.Int)).Value = idPed;
                cmd.Parameters.Add(pStatus);
                
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

        public void ExcluirNotasComValorNull()
        {
            string stringConexao = databaseHelper.GetConnectionString("conexao");

            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spsExcluirPedidosComValorNull";

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
    }
}
