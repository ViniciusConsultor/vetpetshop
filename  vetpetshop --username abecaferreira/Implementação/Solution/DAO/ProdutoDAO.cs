using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace DAO
{
    public class ProdutoDAO
    {

        private DatabaseHelper databaseHelper;

        public ProdutoDAO()
        {
            databaseHelper = new DatabaseHelper();
        }

        public bool InserirProduto(Entidade.Produto produto)
        {
            bool salvou = false;
            string stringConexao = databaseHelper.GetConnectionString("conexao");

            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spiInserirProduto";

                SqlParameter pidGrupo = new SqlParameter("@IdGrupo", SqlDbType.Int, 4);
                SqlParameter pnomeProd = new SqlParameter("@Nome", SqlDbType.VarChar, 50);               
                SqlParameter pestoqueMin = new SqlParameter("@EstoqueMin", SqlDbType.Int, 4);
                SqlParameter pestoqueMax = new SqlParameter("@EstoqueMax", SqlDbType.Int, 4);
                SqlParameter pdescricao = new SqlParameter("@Descricao", SqlDbType.VarChar, 100 );
                SqlParameter pprecoCusto = new SqlParameter("@PrecoCusto", SqlDbType.Decimal);
                SqlParameter pprecoVenda = new SqlParameter("@PrecoVenda", SqlDbType.Decimal);
                SqlParameter pdataVal = new SqlParameter("@DataValidade", SqlDbType.DateTime);

                pnomeProd.Value = produto.Nome;
                pidGrupo.Value = produto.IdGrupo;
                pestoqueMin.Value = produto.EstoqueMin;
                pestoqueMax.Value = produto.EstoqueMax;
                pdescricao.Value = produto.Descricao;
                pprecoCusto.Value = produto.PrecoCusto;
                pprecoVenda.Value = produto.PrecoVenda;
                pdataVal.Value = produto.DataValidade;

                cmd.Parameters.Add(pnomeProd);
                cmd.Parameters.Add(pidGrupo);
                cmd.Parameters.Add(pestoqueMin);
                cmd.Parameters.Add(pestoqueMax);
                cmd.Parameters.Add(pdescricao);
                cmd.Parameters.Add(pprecoCusto);
                cmd.Parameters.Add(pprecoVenda);
                cmd.Parameters.Add(pdataVal);

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
    }
}
