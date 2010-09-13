﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidade;
using System.Data.SqlClient;
using System.Data;
using System.Data.Common;
using System.Data.SqlTypes;

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
                SqlParameter pDatNascimento = new SqlParameter("@DataNascimento", SqlDbType.SmallDateTime);

                
                pIdCliente.Value = animal.IdCliente;
                pIdTipoAnimal.Value = animal.IdTipoAnimal;
                pPeso.Value = animal.Peso;
                pRaca.Value = animal.Raca;
                pNome.Value = animal.Nome;
                pDatNascimento.Value = animal.DataNascimento;

                cmd.Parameters.Add(pIdCliente);
                cmd.Parameters.Add(pIdTipoAnimal);
                cmd.Parameters.Add(pPeso);
                cmd.Parameters.Add(pRaca);
                cmd.Parameters.Add(pNome);
                cmd.Parameters.Add(pDatNascimento);
                
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

        public List<Animal> ListarAnimaisCadastrados(string Nome)
        {
            List<Animal> lstAnimal = new List<Animal>();
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spsListaAnimaisByNome";

                SqlParameter pNome = new SqlParameter("@Nome", SqlDbType.VarChar, 50);

                pNome.Value = Nome;

                cmd.Parameters.Add(pNome);

                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                while (dr.Read())
                {
                    Animal animal = new Animal();
                    animal.IdAnimal = dr.GetInt32(0);
                    animal.Nome = dr.IsDBNull(1) ? "" : dr.GetString(1);
                    animal.Peso = dr.IsDBNull(2) ? Convert.ToDecimal("") : dr.GetDecimal(2);
                    animal.Raca = dr.IsDBNull(3) ? "" : dr.GetString(3);
                    animal.DataNascimento = dr.IsDBNull(4) ? DateTime.MinValue : dr.GetDateTime(4);
                    animal.DataProxVacinacao = dr.IsDBNull(5) ? DateTime.MinValue : dr.GetDateTime(5);
                    animal.DataFimVacinacao = dr.IsDBNull(6) ? DateTime.MinValue : dr.GetDateTime(6);
                    animal.IdTipoAnimal = dr.GetInt32(7);
                    animal.IdCliente = dr.GetInt32(8);

                    lstAnimal.Add(animal);
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

            return lstAnimal;
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
                    _linhaTabela["nascimento"] = "";
                }
                else
                {
                    _linhaTabela["nascimento"] = dr.GetDateTime(4).ToString("dd/MM/yyyy");
                }        

                if (dr.IsDBNull(5))
                {
                     _linhaTabela["dataproxvacinacao"]  = "";
                }
                else
                {
                    _linhaTabela["dataproxvacinacao"] = dr.GetDateTime(5).ToString("dd/MM/yyyy");
                }      
                                                  
                tabela.Rows.Add(_linhaTabela);
            }
            
            dr.Close();
            conn.Close();

            return tabela;
        }

        public DataTable ObterConsultasAnimal(DataTable tabela, Int32 idAnimal)
        {

            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spsObterConsultasAnimal";

            SqlParameter pIdAnimal = new SqlParameter("@IdAnimal", SqlDbType.Int, 4);

            pIdAnimal.Value = idAnimal;

            cmd.Parameters.Add(pIdAnimal);

            conn.Open();

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (dr.Read())
            {
                DataRow _linhaTabela = tabela.NewRow();
                _linhaTabela["id_consulta"] = dr.GetInt32(0);
                if (dr.IsDBNull(1))
                {
                    _linhaTabela["dataconsulta"] = "";
                }
                else
                {
                    _linhaTabela["dataconsulta"] = dr.GetDateTime(1).ToString("dd/MM/yyyy");
                }
                if (dr.GetInt32(2) == 0)
                {
                    _linhaTabela["status"] = "Agendada";                                      
                }
                if (dr.GetInt32(2) == 1)
                {
                    _linhaTabela["status"] = "Desmarcada"; 
                }
                if (dr.GetInt32(2) == 2)
                {
                    _linhaTabela["status"] = "Finalizada"; 
                }
                if (dr.IsDBNull(3))
                {
                    _linhaTabela["valor"] = "";
                }
                else
                {
                    _linhaTabela["valor"] = dr.GetDecimal(3);
                }

                tabela.Rows.Add(_linhaTabela);
            }

            dr.Close();
            conn.Close();

            return tabela;
        }

        public DataTable ListarConsultasAnimais(DataTable tabela)
        {

            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spsListarConsultasAnimais";

            conn.Open();

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (dr.Read())
            {
                DataRow _linhaTabela = tabela.NewRow();
                _linhaTabela["id_consulta"] = dr.GetInt32(0);
                _linhaTabela["nm_cliente"] = dr.GetString(1);
                _linhaTabela["nm_animal"] = dr.GetString(2);
                if (dr.IsDBNull(3))
                {
                    _linhaTabela["dataconsulta"] = "";
                }
                else
                {
                    _linhaTabela["dataconsulta"] = dr.GetDateTime(3).ToString("dd/MM/yyyy");
                }
                if (dr.IsDBNull(4))
                {
                    _linhaTabela["valor"] = "";
                }
                else
                {
                    _linhaTabela["valor"] = dr.GetDecimal(4);
                }
                if (dr.GetInt32(5) == 0)
                {
                    _linhaTabela["status"] = "Agendada";                                      
                }
                if (dr.GetInt32(5) == 1)
                {
                    _linhaTabela["status"] = "Desmarcada"; 
                }
                if (dr.GetInt32(5) == 2)
                {
                    _linhaTabela["status"] = "Finalizada"; 
                }
                
                tabela.Rows.Add(_linhaTabela);
            }

            dr.Close();
            conn.Close();

            return tabela;
        }

        public bool AgendamentoVacinacao(Int32 idAnimal, DateTime dataproxvac)
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
                SqlParameter pDatProxVacinacao = new SqlParameter("@DataProxVacinacao", SqlDbType.SmallDateTime);

                pIdAnimal.Value = idAnimal;

                if (dataproxvac == DateTime.MinValue)
                {
                    pDatProxVacinacao.Value = SqlDateTime.Null;
                }
                else
                {
                    pDatProxVacinacao.Value = dataproxvac;
                }
                
                

                cmd.Parameters.Add(new SqlParameter("@idAnimal", SqlDbType.Int)).Value = idAnimal;
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

        public bool AlterarAgendamentoConsulta(Int32 id_consulta, Int32 id_usuario, DateTime dataconsulta, decimal valor, Int32 status)
        {
            bool executou = false;
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spuAtualizarAgendamentoConsulta";

                SqlParameter pIdConsulta = new SqlParameter("@id_consulta", SqlDbType.Int);
                SqlParameter pIdUsuario = new SqlParameter("@id_usuario", SqlDbType.Int);
                SqlParameter pDatConsulta = new SqlParameter("@Data", SqlDbType.SmallDateTime);
                SqlParameter pValor = new SqlParameter("@Valor", SqlDbType.Decimal);
                SqlParameter pStatus = new SqlParameter("@Status", SqlDbType.Int);

                if (dataconsulta == DateTime.MinValue)
                {
                    pDatConsulta.Value = SqlDateTime.Null;
                }
                else
                {
                    pDatConsulta.Value = dataconsulta;
                }
               

                cmd.Parameters.Add(new SqlParameter("@id_consulta", SqlDbType.Int)).Value = id_consulta;
                cmd.Parameters.Add(new SqlParameter("@id_usuario", SqlDbType.Int)).Value = id_usuario;
                cmd.Parameters.Add(pDatConsulta);
                cmd.Parameters.Add(new SqlParameter("@Valor", SqlDbType.Decimal)).Value = valor;
                cmd.Parameters.Add(new SqlParameter("@Status", SqlDbType.Int)).Value = status;

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

        public List<Animal> ListarAnimaisTodos()
        {
            List<Animal> lstAnimal = new List<Animal>();
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spsListarAnimaisTodos";

               conn.Open();

                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

                while (dr.Read())
                {
                    Animal animal = new Animal();
                    animal.IdAnimal = dr.GetInt32(0);
                    animal.Nome = dr.GetString(1);
                    animal.Raca = dr.GetString(2);
                    animal.Peso = dr.GetDecimal(3);
                    animal.DataNascimento = dr.GetDateTime(4);
                    animal.DataProxVacinacao = dr.GetDateTime(5);

                    lstAnimal.Add(animal);
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

            return lstAnimal;
        }


        public List<Animal> PreencheAnimal(Int32 CodAnimal)
        {
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spsListaAnimalByPK";


            SqlParameter pCodAnimal = new SqlParameter("@IdAnimal", SqlDbType.Int);

            pCodAnimal.Value = CodAnimal;

            cmd.Parameters.Add(pCodAnimal);

            conn.Open();

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            List<Animal> _lista = new List<Animal>();

            while (dr.Read())
            {
                Animal animal = new Animal();
                animal.IdAnimal = dr.GetInt32(0);
                animal.Nome = dr.GetString(1);
                animal.Peso = dr.GetDecimal(2);
                animal.Raca = dr.GetString(3);
                animal.DataNascimento = dr.IsDBNull(4) ? DateTime.MinValue : dr.GetDateTime(4);
                animal.IdTipoAnimal = dr.GetInt32(5);
                animal.IdCliente = dr.GetInt32(6);

                _lista.Add(animal);
            }

            return _lista;

        }

        public bool AlterarAnimal(Animal animal)
        {
            bool executou = false;
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spuAlterarAnimal";

                SqlParameter pIdAnimal = new SqlParameter("@IdAnimal", SqlDbType.Int);
                SqlParameter pnomeAnimal = new SqlParameter("@Nome_Animal", SqlDbType.VarChar, 50);
                SqlParameter pPeso = new SqlParameter("@Peso", SqlDbType.Decimal);
                SqlParameter pRaca = new SqlParameter("@Raca", SqlDbType.VarChar, 20);
                SqlParameter pNascimento = new SqlParameter("@Nascimento", SqlDbType.DateTime);
                SqlParameter pTipoAnimal = new SqlParameter("@TipoAnimal", SqlDbType.Int);

                pIdAnimal.Value = animal.IdAnimal;
                pnomeAnimal.Value = animal.Nome;
                pPeso.Value = animal.Peso;
                pRaca.Value = animal.Raca;
                pNascimento.Value = animal.DataNascimento;
                pTipoAnimal.Value = animal.IdTipoAnimal;

                cmd.Parameters.Add(pIdAnimal);
                cmd.Parameters.Add(pnomeAnimal);
                cmd.Parameters.Add(pPeso);
                cmd.Parameters.Add(pRaca);
                cmd.Parameters.Add(pNascimento);
                cmd.Parameters.Add(pTipoAnimal);

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

        public bool AgendamentoConsulta(Int32 idUsuario, Int32 idAnimal, Decimal Valor, DateTime datConsulta, Int32 status)
        {
            bool executou = false;
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spiInserirConsultaVeterinaria";

                SqlParameter pidUsuario = new SqlParameter("@IdUsuario", SqlDbType.Int);
                SqlParameter pIdAnimal = new SqlParameter("@IdAnimal", SqlDbType.Int);
                SqlParameter pValor = new SqlParameter("@Valor", SqlDbType.Decimal);
                SqlParameter pDatConsulta = new SqlParameter("@Data", SqlDbType.SmallDateTime);
                SqlParameter pStatus = new SqlParameter("@Status", SqlDbType.Int);

                pidUsuario.Value = idUsuario;
                pIdAnimal.Value = idAnimal;
                pValor.Value = Valor;
                if (datConsulta == DateTime.MinValue)
                {
                    pDatConsulta.Value = SqlDateTime.Null;
                }
                else
                {
                    pDatConsulta.Value = datConsulta;
                }
                pStatus.Value = status;

                cmd.Parameters.Add(new SqlParameter("@idUsuario", SqlDbType.Int)).Value = idUsuario;
                cmd.Parameters.Add(new SqlParameter("@idAnimal", SqlDbType.Int)).Value = idAnimal;
                cmd.Parameters.Add(new SqlParameter("@Valor", SqlDbType.Decimal)).Value = Valor;
                cmd.Parameters.Add(pDatConsulta);
                cmd.Parameters.Add(new SqlParameter("@Status", SqlDbType.Int)).Value = status;

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
