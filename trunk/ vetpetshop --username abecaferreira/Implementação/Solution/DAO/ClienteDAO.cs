using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidade;
using System.Data.SqlClient;
using System.Data;
using System.Data.Common;

namespace DAO
{
    public class ClienteDAO
    {
        private DatabaseHelper databaseHelper;

        public ClienteDAO()
        {
            databaseHelper = new DatabaseHelper();
        }

        /// <summary>
        /// //PERSITE TABELA CLIENTE
        /// </summary>
        /// <param name="cliente"></param>
        /// <returns></returns>
        public bool InserirCliente(Cliente cliente)
        {
            bool executou = false;
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spiInserirCliente";

                SqlParameter pnomeCliente = new SqlParameter("@Nome_Cliente", SqlDbType.VarChar, 50);
                SqlParameter pCpf = new SqlParameter("@Num_Cpf", SqlDbType.VarChar, 20);
                SqlParameter pSexo = new SqlParameter("@Sexo", SqlDbType.VarChar, 10);
                SqlParameter pTelefone = new SqlParameter("@Num_Tel", SqlDbType.VarChar, 20);
                SqlParameter pCelular = new SqlParameter("@Num_Cel", SqlDbType.VarChar, 20);
                SqlParameter pRG = new SqlParameter("@Num_RG", SqlDbType.VarChar, 20);
                SqlParameter pEndereco = new SqlParameter("@Endereco", SqlDbType.VarChar, 50);
                SqlParameter pBairro = new SqlParameter("@Bairro", SqlDbType.VarChar, 20);
                SqlParameter pCidade = new SqlParameter("@Cidade", SqlDbType.VarChar, 20);
                SqlParameter pEstado = new SqlParameter("@Estado", SqlDbType.VarChar, 20);
                SqlParameter pCEP = new SqlParameter("@CEP", SqlDbType.VarChar, 20);
                SqlParameter pEmail = new SqlParameter("@Email", SqlDbType.VarChar, 30);

                pnomeCliente.Value = cliente.Nome;
                pCpf.Value = cliente.CPF;
                pSexo.Value = cliente.Sexo;
                pTelefone.Value = cliente.Telefone1;
                pCelular.Value = cliente.Telefone2;
                pRG.Value = cliente.RG;
                pEndereco.Value = cliente.Endereco;
                pBairro.Value = cliente.Bairro;
                pCidade.Value = cliente.Cidade;
                pEstado.Value = cliente.Estado;
                pCEP.Value = cliente.CEP;
                pEmail.Value = cliente.Email;

                cmd.Parameters.Add(pnomeCliente);
                cmd.Parameters.Add(pCpf);
                cmd.Parameters.Add(pSexo);
                cmd.Parameters.Add(pTelefone);
                cmd.Parameters.Add(pCelular);
                cmd.Parameters.Add(pRG);
                cmd.Parameters.Add(pEndereco);
                cmd.Parameters.Add(pBairro);
                cmd.Parameters.Add(pCidade);
                cmd.Parameters.Add(pEstado);
                cmd.Parameters.Add(pCEP);
                cmd.Parameters.Add(pEmail);

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

        public bool AlterarCliente(Cliente cliente)
        {
            bool executou = false;
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spuAlterarCliente";

                SqlParameter pIdCliente = new SqlParameter("@IdCliente", SqlDbType.Int);
                SqlParameter pnomeCliente = new SqlParameter("@Nome_Cliente", SqlDbType.VarChar, 50);
                SqlParameter pCpf = new SqlParameter("@Num_Cpf", SqlDbType.VarChar, 20);
                SqlParameter pSexo = new SqlParameter("@Sexo", SqlDbType.VarChar, 10);
                SqlParameter pTelefone = new SqlParameter("@Num_Tel", SqlDbType.VarChar, 20);
                SqlParameter pCelular = new SqlParameter("@Num_Cel", SqlDbType.VarChar, 20);
                SqlParameter pRG = new SqlParameter("@Num_RG", SqlDbType.VarChar, 20);
                SqlParameter pEndereco = new SqlParameter("@Endereco", SqlDbType.VarChar, 50);
                SqlParameter pBairro = new SqlParameter("@Bairro", SqlDbType.VarChar, 20);
                SqlParameter pCidade = new SqlParameter("@Cidade", SqlDbType.VarChar, 20);
                SqlParameter pEstado = new SqlParameter("@Estado", SqlDbType.VarChar, 20);
                SqlParameter pCEP = new SqlParameter("@CEP", SqlDbType.VarChar, 20);
                SqlParameter pEmail = new SqlParameter("@Email", SqlDbType.VarChar, 30);

                pIdCliente.Value = cliente.IdCliente;
                pnomeCliente.Value = cliente.Nome;
                pCpf.Value = cliente.CPF;
                pSexo.Value = cliente.Sexo;
                pTelefone.Value = cliente.Telefone1;
                pCelular.Value = cliente.Telefone2;
                pRG.Value = cliente.RG;
                pEndereco.Value = cliente.Endereco;
                pBairro.Value = cliente.Bairro;
                pCidade.Value = cliente.Cidade;
                pEstado.Value = cliente.Estado;
                pCEP.Value = cliente.CEP;
                pEmail.Value = cliente.Email;

                cmd.Parameters.Add(pIdCliente);
                cmd.Parameters.Add(pnomeCliente);
                cmd.Parameters.Add(pCpf);
                cmd.Parameters.Add(pSexo);
                cmd.Parameters.Add(pTelefone);
                cmd.Parameters.Add(pCelular);
                cmd.Parameters.Add(pRG);
                cmd.Parameters.Add(pEndereco);
                cmd.Parameters.Add(pBairro);
                cmd.Parameters.Add(pCidade);
                cmd.Parameters.Add(pEstado);
                cmd.Parameters.Add(pCEP);
                cmd.Parameters.Add(pEmail);

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

        public DataTable ListarClientes(DataTable tabela)
        {
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spsListaClientes";

            conn.Open();

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (dr.Read())
            {
                DataRow _linhaTabela = tabela.NewRow();
                _linhaTabela["id_cliente"] = dr.GetInt32(0);
                _linhaTabela["nm_cliente"] = dr.GetString(1);
                _linhaTabela["nm_cpf"] = dr.GetString(2);
                _linhaTabela["nm_tel"] = dr.GetString(3);
                _linhaTabela["nm_email"] = dr.GetString(4);

                tabela.Rows.Add(_linhaTabela);
            }

            conn.Close();
            return tabela;
        }


        public List<Cliente> ListarClientesCadastrados(string Nome)
        {
            List<Cliente> lstCliente = new List<Cliente>();
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spsListaClientesByNome";

                SqlParameter pNome = new SqlParameter("@Nome", SqlDbType.VarChar, 50);

                pNome.Value = Nome;

                cmd.Parameters.Add(pNome);

                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                while (dr.Read())
                {
                    Cliente cliente = new Cliente();
                    cliente.IdCliente = dr.GetInt32(0);
                    cliente.CPF = dr.GetString(1);
                    cliente.Nome = dr.IsDBNull(2) ? "" : dr.GetString(2);
                    cliente.RG = dr.IsDBNull(3) ? "" : dr.GetString(3);
                    cliente.Telefone1 = dr.IsDBNull(4) ? "" : dr.GetString(4);
                    cliente.Telefone2 = dr.IsDBNull(5) ? "" : dr.GetString(5);
                    cliente.Email = dr.IsDBNull(6) ? "" : dr.GetString(6);
                    cliente.Endereco = dr.IsDBNull(7) ? "" : dr.GetString(7);
                    cliente.Bairro = dr.IsDBNull(8) ? "" : dr.GetString(8);
                    cliente.Cidade = dr.IsDBNull(9) ? "" : dr.GetString(9);
                    cliente.Estado = dr.IsDBNull(10) ? "" : dr.GetString(10);
                    cliente.CEP = dr.IsDBNull(11) ? "" : dr.GetString(11);
                    cliente.Sexo = dr.IsDBNull(12) ? "" : dr.GetString(12);

                    lstCliente.Add(cliente);
                }
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

            return lstCliente;
        }

        public List<Cliente> ListarDDLClientes()
        {
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spsListaClientes";

            conn.Open();

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            List<Cliente> _lista = new List<Cliente>();

            while (dr.Read())
            {
                Cliente cliente = new Cliente();
                cliente.IdCliente = dr.GetInt32(0);
                cliente.Nome = dr.GetString(2);

                _lista.Add(cliente);
            }

            return _lista;
        }

        public List<Cliente> PreencheUsuario(Int32 CodCliente)
        {
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spsListaClienteByPK";


            SqlParameter pCodCliente = new SqlParameter("@IdCliente", SqlDbType.Int);

            pCodCliente.Value = CodCliente;

            cmd.Parameters.Add(pCodCliente);

            conn.Open();

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            List<Cliente> _lista = new List<Cliente>();

            while (dr.Read())
            {
                Cliente cliente = new Cliente();
                cliente.IdCliente = dr.GetInt32(0);
                cliente.Nome = dr.GetString(1);
                cliente.CPF = dr.GetString(2);
                cliente.RG = dr.GetString(3);
                cliente.Telefone1 = dr.GetString(4);
                cliente.Telefone2 = dr.GetString(5);
                cliente.Email = dr.GetString(6);
                cliente.Endereco = dr.GetString(7);
                cliente.Bairro = dr.GetString(8);
                cliente.Cidade = dr.GetString(9);
                cliente.Estado = dr.GetString(10);
                cliente.CEP = dr.GetString(11);
                cliente.Sexo = dr.GetString(12);

                _lista.Add(cliente);
            }

            return _lista;
            
        }

        public int PegaUltimoIdCliente()
        {
            int idCliente = new int();
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spsPegaUltimoIdCliente";

                conn.Open();
                
                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                while (dr.Read())
                {
                    idCliente = dr.GetInt32(0);
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

            return idCliente;
        
        }

        public bool ExcluirCliente(int id)
        {
            bool executou = false;
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);


            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spdExcluirCliente";

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

        public int[] EstBuscaSexoCliente(DateTime DataInicio, DateTime DataFim) 
        {
            int[] qtdCli = new int[3];
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spsEstBuscaSexoClientes";

                SqlParameter pDataInicio = new SqlParameter("@DataInicio", SqlDbType.DateTime);
                SqlParameter pDataFim = new SqlParameter("@DataFim", SqlDbType.DateTime);

                pDataInicio.Value = DataInicio;
                pDataFim.Value = DataFim;

                cmd.Parameters.Add(pDataInicio);
                cmd.Parameters.Add(pDataFim);

                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                while (dr.Read())
                {
                    for (int i = 0; i <= qtdCli.Length - 1; i++)
                    {
                        qtdCli[i] = dr.GetInt32(i);
                    }
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

            return qtdCli;

        }
        
    }

}
