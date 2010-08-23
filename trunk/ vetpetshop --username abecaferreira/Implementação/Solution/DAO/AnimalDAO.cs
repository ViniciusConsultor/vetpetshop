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
    public class AnimalDAO
    {
        private DatabaseHelper databaseHelper;

        public AnimalDAO()
        {
            databaseHelper = new DatabaseHelper();
        }

        /// <summary>
        /// //PERSITE TABELA ANIMAL
        /// </summary>
        /// <param name="animal"></param>
        /// <returns></returns>
        public bool InserirAnimal(Animal animal)
        {
            bool executou = false;
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spiInserirAnimal";

                SqlParameter pIdCliente = new SqlParameter("@IdCliente", SqlDbType.Int);    
                SqlParameter pIdTipoAnimal = new SqlParameter("@IdTipoAnimal", SqlDbType.Int);
                SqlParameter pPeso = new SqlParameter("@Peso", SqlDbType.Decimal);
                SqlParameter pRaca = new SqlParameter("@Raca", SqlDbType.VarChar, 50);
                SqlParameter pNome = new SqlParameter("@Nome", SqlDbType.VarChar, 50);
                SqlParameter pDatFimVacinacao = new SqlParameter("@DataFimVacinacao", SqlDbType.SmallDateTime);
                SqlParameter pDatNascimento = new SqlParameter("@DataNascimento", SqlDbType.SmallDateTime);
                SqlParameter pDatProxVacinacao = new SqlParameter("@DataProxVacinacao", SqlDbType.SmallDateTime);

                pIdCliente.Value = animal.IdCliente;
                pIdTipoAnimal.Value = animal.IdTipoAnimal;
                pPeso.Value = animal.Peso;
                pRaca.Value = animal.Raca;
                pNome.Value = animal.Nome;
                pDatFimVacinacao.Value = animal.DataFimVacinacao;
                pDatNascimento.Value = animal.DataNascimento;
                pDatProxVacinacao.Value = animal.DataProxVacinacao;

                cmd.Parameters.Add(pIdCliente);
                cmd.Parameters.Add(pIdTipoAnimal);
                cmd.Parameters.Add(pPeso);
                cmd.Parameters.Add(pRaca);
                cmd.Parameters.Add(pNome);
                cmd.Parameters.Add(pDatFimVacinacao);
                cmd.Parameters.Add(pDatNascimento);
                cmd.Parameters.Add(pDatProxVacinacao);
                
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

        /// <summary>
        /// //PERSITE TABELA ANIMAL
        /// </summary>
        /// <param name="animal"></param>
        /// <returns></returns>
        //public bool InserirAnimal(Animal animal)
        //{
        //    bool executou = false;
        //    string stringConexao = databaseHelper.GetConnectionString("conexao");
        //    SqlConnection conn = new SqlConnection(stringConexao);

        //    try
        //    {
        //        SqlCommand cmd = new SqlCommand();
        //        cmd.Connection = conn;
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.CommandText = "spiInserirAnimal";

        //        SqlParameter pnomeCliente = new SqlParameter("@Nome_Cliente", SqlDbType.VarChar, 100);
        //        SqlParameter pCpf = new SqlParameter("@Num_Cpf", SqlDbType.VarChar, 20);
        //        SqlParameter pTelefone = new SqlParameter("@Num_Tel", SqlDbType.VarChar, 20);
        //        SqlParameter pCelular = new SqlParameter("@Celular", SqlDbType.VarChar, 20);
        //        SqlParameter pRG = new SqlParameter("@RG", SqlDbType.VarChar, 20);
        //        SqlParameter pEndereco = new SqlParameter("@Endereco", SqlDbType.VarChar, 50);
        //        SqlParameter pBairro = new SqlParameter("@Bairro", SqlDbType.VarChar, 20);
        //        SqlParameter pCidade = new SqlParameter("@Cidade", SqlDbType.VarChar, 20);
        //        SqlParameter pEstado = new SqlParameter("@Estado", SqlDbType.VarChar, 20);
        //        SqlParameter pCEP = new SqlParameter("@CEP", SqlDbType.VarChar, 20);
        //        SqlParameter pEmail = new SqlParameter("@Email", SqlDbType.VarChar, 30);

        //        pnomeCliente.Value = cliente.Nome;
        //        pCpf.Value = cliente.CPF;
        //        pTelefone.Value = cliente.Telefone1;
        //        pCelular.Value = cliente.Telefone2;
        //        pRG.Value = cliente.RG;
        //        pEndereco = cliente.Endereco;
        //        pBairro = cliente.Bairro;
        //        pCidade = cliente.Cidade;
        //        pEstado = cliente.Estado;
        //        pCEP = cliente.CEP;
        //        pEmail.Value = cliente.Email;

        //        cmd.Parameters.Add(pnomeCliente);
        //        cmd.Parameters.Add(pCpf);
        //        cmd.Parameters.Add(pTelefone);
        //        cmd.Parameters.Add(pCelular);
        //        cmd.Parameters.Add(pRG);
        //        cmd.Parameters.Add(pEndereco);
        //        cmd.Parameters.Add(pBairro);
        //        cmd.Parameters.Add(pCidade);
        //        cmd.Parameters.Add(pEstado);
        //        cmd.Parameters.Add(pCEP);
        //        cmd.Parameters.Add(pEmail);

        //        conn.Open();
        //        int registro = cmd.ExecuteNonQuery();
        //        executou = true;
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

        //    return executou;
        //}

        public DataTable ListarAnimais(DataTable tabela)
        {
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spsListaAnimais";

            conn.Open();

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (dr.Read())
            {
                DataRow _linhaTabela = tabela.NewRow();
                _linhaTabela["id_animal"] = dr.GetInt32(0);
                _linhaTabela["nm_animal"] = dr.GetString(1);
                _linhaTabela["nm_peso"] = dr.GetString(2);
                _linhaTabela["nm_raca"] = dr.GetString(3);
                _linhaTabela["nm_email"] = dr.GetString(4);

                tabela.Rows.Add(_linhaTabela);
            }

            conn.Close();
            return tabela;
        }


        public bool ExcluirAnimal(int id)
        {
            bool executou = false;
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);


            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spdExcluirAnimal";

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
