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

        public List<Financas> ListarInvestimentos(int ano)
        {
            List<Financas> lista = new List<Financas>();
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spsFinancasInvestimentoPorAno";

                SqlParameter pAno = new SqlParameter("@Ano", SqlDbType.Int, 4);
                pAno.Value = ano;

                cmd.Parameters.Add(pAno);

                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);


                //if(!dr.Read())
                //    return null;

                while (dr.Read())
                {
                    Financas financas = new Financas();
                    financas.Mes = dr.GetInt32(0);
                    financas.Valor = dr.GetDecimal(1);

                    lista.Add(financas);
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

            return lista;
        }

        public List<Financas> ListarVendas(int ano)
        {
            List<Financas> lista = new List<Financas>();
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spsFinancasVendasPorAno";

                SqlParameter pAno = new SqlParameter("@Ano", SqlDbType.Int, 4);
                pAno.Value = ano;

                cmd.Parameters.Add(pAno);

                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);


                //if(!dr.Read())
                //    return null;

                while (dr.Read())
                {
                    Financas financas = new Financas();
                    financas.Mes = dr.GetInt32(0);
                    financas.Valor = dr.GetDecimal(1);

                    lista.Add(financas);
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

            return lista;
        }

        //public List<FinancasEstoque> ListarFinancasEstoque(int ano)
        //{
        //    List<FinancasEstoque> lista = new List<FinancasEstoque>();
        //    string stringConexao = databaseHelper.GetConnectionString("conexao");
        //    SqlConnection conn = new SqlConnection(stringConexao);

        //    try
        //    {
        //        SqlCommand cmd = new SqlCommand();
        //        cmd.Connection = conn;
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.CommandText = "spsFinancasEstoquePorAno";

        //        SqlParameter pAno = new SqlParameter("@Ano", SqlDbType.Int, 4);
        //        pAno.Value = ano;

        //        cmd.Parameters.Add(pAno);

        //        conn.Open();
        //        SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);


        //        //if(!dr.Read())
        //        //    return null;

        //        while (dr.Read())
        //        {
        //            FinancasEstoque financas = new FinancasEstoque();
        //            financas.Mes = dr.GetInt32(0);
        //            financas.Valor = dr.GetDecimal(1);

        //            lista.Add(financas);
        //        }

        //        dr.Close();
        //    }

        //    catch (SqlException ex)
        //    {
        //        //throw new Exception("Servidor SQL Erro: " + ex.Number);
        //        throw new Exception(ex.Message);
        //    }

        //    catch (Exception ex)
        //    {
        //        throw new Exception(ex.Message);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }

        //    return lista;
        //}

        public List<FinancasLucro> ListarFinancasLucro(int ano)
        {
            List<FinancasLucro> lista = new List<FinancasLucro>();
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spsFinancasLucroPorAno";

                SqlParameter pAno = new SqlParameter("@Ano", SqlDbType.Int, 4);
                pAno.Value = ano;

                cmd.Parameters.Add(pAno);

                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);


                //if(!dr.Read())
                //    return null;

                while (dr.Read())
                {
                    FinancasLucro financas = new FinancasLucro();
                    financas.Mes = dr.GetInt32(0);
                    financas.Valor = dr.GetDecimal(1);

                    lista.Add(financas);
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

            return lista;
        }

        public List<FinancasValorAReceber> ListarValorReceber(int ano)
        {
            List<FinancasValorAReceber> lista = new List<FinancasValorAReceber>();
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spsFinancasValorAReceberPorAno";

                SqlParameter pAno = new SqlParameter("@Ano", SqlDbType.Int, 4);
                pAno.Value = ano;

                cmd.Parameters.Add(pAno);

                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);


                //if(!dr.Read())
                //    return null;

                while (dr.Read())
                {
                    FinancasValorAReceber financas = new FinancasValorAReceber();
                    financas.Mes = dr.GetInt32(0);
                    financas.Valor = dr.GetDecimal(1);

                    lista.Add(financas);
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

            return lista;
        }

        public Int32 ObterUltimoRegistroFinanceiroConsulta()
        {
            Int32 idInserido = 0;
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spsObterUltimoRegistroFinanceiroConsulta";

                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);


                //if(!dr.Read())
                //    return null;

                while (dr.Read())
                {
                    idInserido = dr.GetInt32(0);
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

            return idInserido;
        }

        public List<FinancasConsultas> ListarFinancasConsultas(int ano)
        {
            List<FinancasConsultas> lista = new List<FinancasConsultas>();
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spsFinancasConsultasPorAno";

                SqlParameter pAno = new SqlParameter("@Ano", SqlDbType.Int, 4);
                pAno.Value = ano;

                cmd.Parameters.Add(pAno);

                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);


                //if(!dr.Read())
                //    return null;

                while (dr.Read())
                {
                    FinancasConsultas financas = new FinancasConsultas();
                    financas.Mes = dr.GetInt32(0);
                    financas.Valor = dr.GetDecimal(1);

                    lista.Add(financas);
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

            return lista;
            
        }

        public List<FinancasVacinas> ListarFinancasVacinas(int ano)
        {
            List<FinancasVacinas> lista = new List<FinancasVacinas>();
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spsFinancasVacinasPorAno";

                SqlParameter pAno = new SqlParameter("@Ano", SqlDbType.Int, 4);
                pAno.Value = ano;

                cmd.Parameters.Add(pAno);

                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);


                //if(!dr.Read())
                //    return null;

                while (dr.Read())
                {
                    FinancasVacinas financas = new FinancasVacinas();
                    financas.Mes = dr.GetInt32(0);
                    financas.Valor = dr.GetDecimal(1);

                    lista.Add(financas);
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

            return lista;  
        }

        public List<FinancasFaturamento> ListarFinancasFaturamento(int ano)
        {
            List<FinancasFaturamento> lista = new List<FinancasFaturamento>();
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spsFinancasFaturamentoPorAno";

                SqlParameter pAno = new SqlParameter("@Ano", SqlDbType.Int, 4);
                pAno.Value = ano;

                cmd.Parameters.Add(pAno);

                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);


                //if(!dr.Read())
                //    return null;

                while (dr.Read())
                {
                    FinancasFaturamento financas = new FinancasFaturamento();
                    financas.Mes = dr.GetInt32(0);
                    financas.Valor = dr.GetDecimal(1);

                    lista.Add(financas);
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

            return lista;  
        }

        public DataTable ListarClientesEspeciais(DataTable tabela, int ano)
        {
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spsListarFinanceiroClientesEspeciaisPorAno";

            SqlParameter pAno = new SqlParameter("@Ano", SqlDbType.Int, 4);

            pAno.Value = ano;

            cmd.Parameters.Add(pAno);

            conn.Open();

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (dr.Read())
            {
                DataRow _linhaTabela = tabela.NewRow();
                _linhaTabela["cliente"] = dr.GetString(0);
                _linhaTabela["dt_transacao"] = dr.GetDateTime(1).ToString("dd/MM/yyyy");

                if (dr.GetInt32(2).Equals(1))
                    _linhaTabela["tipo_transacao"] = "Venda de produtos";

                else if (dr.GetInt32(2).Equals(2))
                {
                    if (!dr.IsDBNull(3))
                    { 
                        if (dr.GetInt32(3).Equals(1))
                           _linhaTabela["tipo_transacao"] = "Consulta";
                        else
                            _linhaTabela["tipo_transacao"] = "Vacina";
                    }

                    else
                        _linhaTabela["tipo_transacao"] = "";
                }

                _linhaTabela["valor"] = dr.GetDecimal(4).ToString();

                tabela.Rows.Add(_linhaTabela);
            }


            dr.Close();
            conn.Close();

            return tabela;
        }

        public DataTable ListarProdutosVendidosPorData(DataTable tabela, Nullable<DateTime> DataInicio, Nullable<DateTime> DataFim)
        {
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spsListarProdutosVendidosPorData";

            SqlParameter pDataInicio = new SqlParameter("@DataInicio", SqlDbType.DateTime);
            SqlParameter pDataFim = new SqlParameter("@DataFim", SqlDbType.DateTime);

            if ((DataInicio.HasValue) && (DataFim.HasValue))
            {
                pDataInicio.Value = DataInicio;
                pDataFim.Value = DataFim;
            }
            else
            {
                pDataInicio.Value = Convert.ToDateTime("1/1/1753");
                pDataFim.Value = Convert.ToDateTime("31/12/9999");
            }

            cmd.Parameters.Add(pDataInicio);
            cmd.Parameters.Add(pDataFim);

            conn.Open();

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (dr.Read())
            {
                DataRow _linhaTabela = tabela.NewRow();
                _linhaTabela["nm_produto"] = dr.GetString(0);
                _linhaTabela["qtd_vendida"] = dr.GetInt32(1).ToString();
                _linhaTabela["nm_grupo"] = dr.GetString(2);

                tabela.Rows.Add(_linhaTabela);
            }

            dr.Close();
            conn.Close();

            return tabela;
        }

    }
}
