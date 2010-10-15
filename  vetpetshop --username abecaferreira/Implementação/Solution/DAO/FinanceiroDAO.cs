using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidade;
using System.Data.SqlClient;
using System.Data;

namespace DAO
{
    public class FinanceiroDAO
    {
        private DatabaseHelper databaseHelper;

        public FinanceiroDAO()
        {
            databaseHelper = new DatabaseHelper();
        }

        public bool InserirRegistroFinanceiro(Financeiro financeiro)
        {
            bool executou = false;
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spiInserirRegistroFinanceiro";

                SqlParameter pUsuario = new SqlParameter("@IdUsuario", SqlDbType.Int, 4);
                SqlParameter pTotal = new SqlParameter("@ValorTotal", SqlDbType.Decimal);
                SqlParameter pTipoPagamento = new SqlParameter("@TipoPagamento", SqlDbType.Int, 4);
                SqlParameter pParcelas = new SqlParameter("@Parcelas", SqlDbType.Int, 4);
                SqlParameter pTipoTransacao = new SqlParameter("@TipoTransacao", SqlDbType.Int, 4);
                SqlParameter pTipoResponsavel = new SqlParameter("@TipoResponsavel", SqlDbType.Int, 4);
                SqlParameter pNomeCliente = new SqlParameter("@NomeCliente", SqlDbType.VarChar, 100);

                pUsuario.Value = financeiro.Usuario;
                pTotal.Value = financeiro.ValorTotal;
                pTipoPagamento.Value = financeiro.TipoPagamento;
                pParcelas.Value = financeiro.Parcelas;
                pTipoTransacao.Value = financeiro.TipoTransacao;
                pTipoResponsavel.Value = financeiro.TipoResponsavel;
                pNomeCliente.Value = financeiro.NomeCliente;

                cmd.Parameters.Add(pUsuario);
                cmd.Parameters.Add(pTotal);
                cmd.Parameters.Add(pTipoPagamento);
                cmd.Parameters.Add(pParcelas);
                cmd.Parameters.Add(pTipoTransacao);
                cmd.Parameters.Add(pTipoResponsavel);
                cmd.Parameters.Add(pNomeCliente); 

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


        public Financeiro ObterFinanceiroVendaRegistrado()
        {
            Financeiro financeiro = new Financeiro();
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spsObterUltimoRegistroVendaProdutos";              

                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);


                //if(!dr.Read())
                //    return null;

                while (dr.Read())
                {
                    financeiro.Id = dr.GetInt32(0);
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

            return financeiro;
        }

        public void InserirRelFinanceiroProduto(RelFinanceiroProduto relFinanceiroProduto)
        {
            //bool executou = false;
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spiInserirRelFinanceiroProduto";

                SqlParameter pIdFinanceiro = new SqlParameter("@IdFinanceiro", SqlDbType.Int, 4);
                SqlParameter pIdProduto = new SqlParameter("@IdProduto", SqlDbType.Int, 4);
                SqlParameter pQuantidade = new SqlParameter("@QuantidadeVendida", SqlDbType.Int, 4);

                pIdFinanceiro.Value = relFinanceiroProduto.IdFinanceiro;
                pIdProduto.Value = relFinanceiroProduto.IdProduto;
                pQuantidade.Value = relFinanceiroProduto.QuantidadeVendida;

                cmd.Parameters.Add(pIdFinanceiro);
                cmd.Parameters.Add(pIdProduto);
                cmd.Parameters.Add(pQuantidade);
                
                conn.Open();
                int registro = cmd.ExecuteNonQuery();
               // executou = true;
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

           // return executou;
        }
    }
}
