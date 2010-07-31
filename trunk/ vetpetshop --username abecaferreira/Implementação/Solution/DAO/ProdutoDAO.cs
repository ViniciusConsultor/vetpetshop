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

        public DataTable ListarProduto(DataTable tabela)
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

            return tabela;
        
        }
    }
}
