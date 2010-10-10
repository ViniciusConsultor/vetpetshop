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

    }
}
