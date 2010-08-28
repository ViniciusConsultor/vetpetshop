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

        public List<Animal> ListarDDLAnimais(Int32 idCliente)
        {
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spsListaAnimaisByFK";

            SqlParameter pCodCliente = new SqlParameter("@IdCliente", SqlDbType.Int);

            pCodCliente.Value = idCliente;

            cmd.Parameters.Add(pCodCliente);

            conn.Open();

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            List<Animal> _lista = new List<Animal>();

            while (dr.Read())
            {
                Animal animal = new Animal();
                animal.IdAnimal = dr.GetInt32(0);
                animal.Nome = dr.GetString(1);

                _lista.Add(animal);
            }

            return _lista;
        }

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

        public DataTable ConsultarAnimal(DataTable tabela, Int32 idAnimal)
        {

            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spsObterAnimal";

            SqlParameter pIdAnimal = new SqlParameter("@IdAnimal", SqlDbType.Int, 4);

            pIdAnimal.Value = idAnimal;

            cmd.Parameters.Add(pIdAnimal);

            conn.Open();

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (dr.Read())
            {
                DataRow _linhaTabela = tabela.NewRow();
                _linhaTabela["id_animal"] = dr.GetInt32(0);
                _linhaTabela["nm_animal"] = dr.GetString(1);
                _linhaTabela["peso"] = dr.GetDecimal(2);
              

                if (dr.IsDBNull(3))
                {
                    _linhaTabela["raca"] = "";
                }
                else
                {
                    _linhaTabela["raca"] = dr.GetString(3);
                }    

                if (dr.IsDBNull(4))
                {
                    _linhaTabela["datavacinacao"] = "";
                }
                else
                {
                   _linhaTabela["datavacinacao"] = dr.GetDateTime(4).ToString("dd/MM/yyyy");
                }       
                
                if (dr.IsDBNull(5))
                {
                     _linhaTabela["dataproxvacinacao"]  = "";
                }
                else
                {
                    _linhaTabela["dataproxvacinacao"] = dr.GetDateTime(5).ToString("dd/MM/yyyy");
                }        

                if (dr.IsDBNull(6))
                {
                    _linhaTabela["nascimento"] = "";
                }
                else
                {
                    _linhaTabela["nascimento"] = dr.GetDateTime(6).ToString("dd/MM/yyyy");
                }                             

                tabela.Rows.Add(_linhaTabela);
            }
            
            dr.Close();
            conn.Close();

            return tabela;
        }

        public bool AgendamentoVacinacao(Int32 idAnimal, DateTime datavac, DateTime dataproxvac)
        {
            bool executou = false;
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spuAtualizarAgendamento";

                SqlParameter pIdAnimal = new SqlParameter("@IdAnimal", SqlDbType.Int);
                SqlParameter pDatFimVacinacao = new SqlParameter("@DataFimVacinacao", SqlDbType.SmallDateTime);
                SqlParameter pDatProxVacinacao = new SqlParameter("@DataProxVacinacao", SqlDbType.SmallDateTime);

                pIdAnimal.Value = idAnimal;
                pDatFimVacinacao.Value = datavac;
                pDatProxVacinacao.Value = dataproxvac;

                cmd.Parameters.Add(new SqlParameter("@idAnimal", SqlDbType.Int)).Value = idAnimal;
                cmd.Parameters.Add(pDatFimVacinacao);
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

    }
}
