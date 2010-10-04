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
                SqlParameter pdescricao = new SqlParameter("@Descricao", SqlDbType.VarChar, 100);
                SqlParameter pprecoCusto = new SqlParameter("@PrecoCusto", SqlDbType.Decimal);
                pprecoCusto.Precision = 7;
                pprecoCusto.Scale = 2;                    
                SqlParameter pprecoVenda = new SqlParameter("@PrecoVenda", SqlDbType.Decimal);
                pprecoVenda.Precision = 7;
                pprecoCusto.Scale = 2;
                SqlParameter pdataVal = new SqlParameter("@DataValidade", SqlDbType.DateTime);

                pnomeProd.Value = produto.Nome;
                pidGrupo.Value = produto.IdGrupo;
                pestoqueMin.Value = produto.EstoqueMin;
                pestoqueMax.Value = produto.EstoqueMax;
                pdescricao.Value = produto.Descricao;
                pprecoCusto.Value = produto.PrecoCusto;
                pprecoVenda.Value = produto.PrecoVenda;

                if (produto.DataValidade == DateTime.MinValue)
                {
                    pdataVal.Value = SqlDateTime.Null;
                }
                else
                {
                    pdataVal.Value = produto.DataValidade;
                }

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

        public DataTable ListarProduto(DataTable tabela, string nome, int id)
        {

            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spsListarProdutos";

            SqlParameter pTipo = new SqlParameter("@Tipo", SqlDbType.Int, 4);
            SqlParameter pnomeNome = new SqlParameter("@Nome", SqlDbType.VarChar, 100);

            pnomeNome.Value = nome;
            pTipo.Value = id;

            cmd.Parameters.Add(pnomeNome);
            cmd.Parameters.Add(pTipo);

            conn.Open();

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (dr.Read())
            {
                DataRow _linhaTabela = tabela.NewRow();
                _linhaTabela["id_produto"] = dr.GetInt32(0);
                _linhaTabela["tipo"] = dr.GetString(10);
                _linhaTabela["nm_produto"] = dr.GetString(3);
                _linhaTabela["min"] = dr.GetInt32(4);
                _linhaTabela["max"] = dr.GetInt32(5);
                _linhaTabela["descricao"] = dr.GetString(6);
                _linhaTabela["preco_custo"] = dr.GetDecimal(7);

                if(dr.IsDBNull(8))
                {
                    _linhaTabela["validade"] = "";
                }
                else
                {
                    _linhaTabela["validade"] = dr.GetDateTime(8).ToString("dd/MM/yyyy");
                }

                _linhaTabela["preco_venda"] = dr.GetDecimal(9);

                tabela.Rows.Add(_linhaTabela);
            }
            

            dr.Close();
            conn.Close();

            return tabela;

        }

        public bool ExisteProdutoPorGrupo(int id)
        {
             string stringConexao = databaseHelper.GetConnectionString("conexao");

            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spsProdutoPorGrupo";

                SqlParameter pidGrupo = new SqlParameter("@Id_Grupo", SqlDbType.Int, 4);

                pidGrupo.Value = id;               

                cmd.Parameters.Add(pidGrupo);

                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                if (dr.HasRows)
                    return true;
                else
                    return false;                 
            
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

        public Produto ObterProdutoPorId(int idProd)
        {
            Produto produto = new Produto();   
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spsObterProduto";

                SqlParameter pidProd = new SqlParameter("@IdProduto", SqlDbType.Int, 4);

                pidProd.Value = idProd;
                cmd.Parameters.Add(pidProd);
                
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
               

                //if(!dr.Read())
                //    return null;

                while(dr.Read())
                {
                    produto.IdProduto = dr.GetInt32(0);
                    produto.IdGrupo = dr.GetInt32(1);
                    produto.Nome = dr.GetString(3);
                    produto.EstoqueMin = dr.GetInt32(4);
                    produto.EstoqueMax = dr.GetInt32(5);
                    produto.Descricao = dr.GetString(6);
                    produto.PrecoCusto = dr.GetDecimal(7);
                    if (!dr.IsDBNull(8))
                    {
                        produto.DataValidade = Convert.ToDateTime(dr.GetDateTime(8));
                    }
                    produto.PrecoVenda = dr.GetDecimal(9);

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

            return produto;
        }

        public bool ExcluirProduto(int idProd)
        {
            bool executou = false;
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spdExcluirProduto";

                SqlParameter pId = new SqlParameter("@Id_Produto", SqlDbType.Int, 4);

                pId.Value = idProd;                
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

        public bool AtualizarProduto(Produto produto, int id)
        {
            bool salvou = false;
            string stringConexao = databaseHelper.GetConnectionString("conexao");

            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spuAtualizarProduto";

                SqlParameter pidGrupo = new SqlParameter("@IdGrupo", SqlDbType.Int, 4);
                SqlParameter pnomeProd = new SqlParameter("@Nome", SqlDbType.VarChar, 50);
                SqlParameter pestoqueMin = new SqlParameter("@EstoqueMin", SqlDbType.Int, 4);
                SqlParameter pestoqueMax = new SqlParameter("@EstoqueMax", SqlDbType.Int, 4);
                SqlParameter pdescricao = new SqlParameter("@Descricao", SqlDbType.VarChar, 100);
                SqlParameter pprecoCusto = new SqlParameter("@PrecoCusto", SqlDbType.Decimal);
                pprecoCusto.Precision = 7;
                pprecoCusto.Scale = 2;
                SqlParameter pprecoVenda = new SqlParameter("@PrecoVenda", SqlDbType.Decimal);
                pprecoVenda.Precision = 7;
                pprecoCusto.Scale = 2;
                SqlParameter pdataVal = new SqlParameter("@DataValidade", SqlDbType.DateTime);

                //pId.Value = id;
                pnomeProd.Value = produto.Nome;
                pidGrupo.Value = produto.IdGrupo;
                pestoqueMin.Value = produto.EstoqueMin;
                pestoqueMax.Value = produto.EstoqueMax;
                pdescricao.Value = produto.Descricao;
                pprecoCusto.Value = produto.PrecoCusto;
                pprecoVenda.Value = produto.PrecoVenda;
                pdataVal.Value = produto.DataValidade;

                cmd.Parameters.Add(new SqlParameter("@IdProduto", SqlDbType.Int)).Value = id;
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

        public List<Produto> ListarProduto(string nome, int id)
        {

            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spsListarProdutos";

            SqlParameter pTipo = new SqlParameter("@Tipo", SqlDbType.Int, 4);
            SqlParameter pnomeNome = new SqlParameter("@Nome", SqlDbType.VarChar, 100);

            pnomeNome.Value = nome;
            pTipo.Value = id;

            cmd.Parameters.Add(pnomeNome);
            cmd.Parameters.Add(pTipo);

            List<Produto> lista = new List<Produto>();
            conn.Open();

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (dr.Read())
            {
                Produto produto = new Produto();
                produto.IdProduto = dr.GetInt32(0);
                produto.NomeGrupo = dr.GetString(10);
                produto.Nome = dr.GetString(3);
                produto.EstoqueMin = dr.GetInt32(4);
                produto.EstoqueMax = dr.GetInt32(5);
                produto.Descricao = dr.GetString(6);
                produto.PrecoCusto = dr.GetDecimal(7);
                
                if (dr.IsDBNull(8))
                {
                    produto.DataValidade = null;
                }
                else
                {
                    produto.DataValidade = dr.GetDateTime(8);
                }

                produto.PrecoVenda = dr.GetDecimal(9);

                lista.Add(produto);
            }


            dr.Close();
            conn.Close();

            return lista;

        }

    }
}
