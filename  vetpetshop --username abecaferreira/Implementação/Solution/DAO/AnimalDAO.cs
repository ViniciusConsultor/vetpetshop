using System;
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
                SqlParameter pSexo = new SqlParameter("@Sexo", SqlDbType.VarChar, 10);

                
                pIdCliente.Value = animal.IdCliente;
                pIdTipoAnimal.Value = animal.IdTipoAnimal;
                pPeso.Value = animal.Peso;
                pRaca.Value = animal.Raca;
                pNome.Value = animal.Nome;
                pDatNascimento.Value = animal.DataNascimento;
                pSexo.Value = animal.Sexo;

                cmd.Parameters.Add(pIdCliente);
                cmd.Parameters.Add(pIdTipoAnimal);
                cmd.Parameters.Add(pPeso);
                cmd.Parameters.Add(pRaca);
                cmd.Parameters.Add(pNome);
                cmd.Parameters.Add(pDatNascimento);
                cmd.Parameters.Add(pSexo);
                
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
                    animal.Sexo = dr.GetString(9);

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

        public bool ExcluirConsulta(int id)
        {
            bool executou = false;
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);


            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spdExcluirConsulta";

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

        public DataTable ListarConsultasAnimais2(DataTable tabela, string proprietario, DateTime dataconsulta)
        {

            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spsListarConsultasAnimais2";

            SqlParameter pNome = new SqlParameter("@Nome", SqlDbType.VarChar, 50);
                    
            SqlParameter pDatConsulta = new SqlParameter("@Data", SqlDbType.SmallDateTime);

            pNome.Value = proprietario;

            if (dataconsulta == DateTime.MinValue)
            {
                pDatConsulta.Value = SqlDateTime.Null;
            }
            else
            {
                pDatConsulta.Value = dataconsulta;
            }

            cmd.Parameters.Add(pNome);
            cmd.Parameters.Add(pDatConsulta);
            
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
                if (dr.GetInt32(4) == 0)
                {
                    _linhaTabela["status"] = "Agendada";                                      
                }
                if (dr.GetInt32(4) == 1)
                {
                    _linhaTabela["status"] = "Desmarcada"; 
                }
                if (dr.GetInt32(4) == 2)
                {
                    _linhaTabela["status"] = "Finalizada"; 
                }
                
                tabela.Rows.Add(_linhaTabela);
            }

            dr.Close();
            conn.Close();

            return tabela;
        }

        public DataTable ListarDadosReceitaMedica(Int32 IdConsulta)
        {
            DataSet dsRegistros = new DataSet();
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);
            SqlCommand cmd = new SqlCommand();

            try
            { 
            
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spsListarDadosReceitaMedica";
              
            SqlParameter pIdConsulta = new SqlParameter("@IdConsultaAnimal", SqlDbType.Int, 4);
            pIdConsulta.Value = IdConsulta;
            cmd.Parameters.Add(pIdConsulta);
             
            SqlDataAdapter da;
            da = new SqlDataAdapter(cmd);

            conn.Open();

            da.Fill(dsRegistros);

            }
            catch (Exception ex)
            {

                throw ex;

            }

            finally
            {

                conn.Close();

            }
                        
            return dsRegistros.Tables[0];
        }


        public DataTable ListarVacinacoesAnimais(DataTable tabela)
        {

            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spsListarVacinacoesAnimais";

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
                    _linhaTabela["datavacinacao"] = "";
                }
                else
                {
                    _linhaTabela["datavacinacao"] = dr.GetDateTime(3).ToString("dd/MM/yyyy");
                }

                _linhaTabela["valor"] = dr.GetDecimal(4);

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

                pValor.Value = valor;

                cmd.Parameters.Add(pValor);

                cmd.Parameters.Add(new SqlParameter("@id_consulta", SqlDbType.Int)).Value = id_consulta;
                cmd.Parameters.Add(new SqlParameter("@id_usuario", SqlDbType.Int)).Value = id_usuario;
                cmd.Parameters.Add(pDatConsulta);
                //cmd.Parameters.Add(new SqlParameter("@Valor", SqlDbType.Decimal)).Value = valor;
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
                animal.Sexo = dr.GetString(7);

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
                SqlParameter pSexo = new SqlParameter("@Sexo", SqlDbType.VarChar, 10);

                pIdAnimal.Value = animal.IdAnimal;
                pnomeAnimal.Value = animal.Nome;
                pPeso.Value = animal.Peso;
                pRaca.Value = animal.Raca;
                pNascimento.Value = animal.DataNascimento;
                pTipoAnimal.Value = animal.IdTipoAnimal;
                pSexo.Value = animal.Sexo;

                cmd.Parameters.Add(pIdAnimal);
                cmd.Parameters.Add(pnomeAnimal);
                cmd.Parameters.Add(pPeso);
                cmd.Parameters.Add(pRaca);
                cmd.Parameters.Add(pNascimento);
                cmd.Parameters.Add(pTipoAnimal);
                cmd.Parameters.Add(pSexo);

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

        public bool AgendamentoConsulta(Int32 idUsuario, Int32 idAnimal, Decimal Valor, DateTime datConsulta, Int32 status, int tipo, DateTime dataVacinacao)
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
                pValor.Precision = 7;
                pValor.Scale = 2; 
                SqlParameter pDatConsulta = new SqlParameter("@Data", SqlDbType.SmallDateTime);
                SqlParameter pStatus = new SqlParameter("@Status", SqlDbType.Int);
                SqlParameter pTipo = new SqlParameter("@Tipo", SqlDbType.Int);
                SqlParameter pDataVacinacao = new SqlParameter("@DataVacinacao", SqlDbType.SmallDateTime);

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

                if (dataVacinacao == DateTime.MinValue)
                {
                    pDataVacinacao.Value = SqlDateTime.Null;
                }
                else
                {
                    pDataVacinacao.Value = dataVacinacao;
                }

                pStatus.Value = status;

                cmd.Parameters.Add(new SqlParameter("@idUsuario", SqlDbType.Int)).Value = idUsuario;
                cmd.Parameters.Add(new SqlParameter("@idAnimal", SqlDbType.Int)).Value = idAnimal;
                //cmd.Parameters.Add(new SqlParameter("@Valor", SqlDbType.Decimal)).Value = Valor;
                cmd.Parameters.Add(pDatConsulta);
                cmd.Parameters.Add(new SqlParameter("@Status", SqlDbType.Int)).Value = status;
                cmd.Parameters.Add(new SqlParameter("@Tipo", SqlDbType.Int)).Value = tipo;
                cmd.Parameters.Add(pValor);
                cmd.Parameters.Add(pDataVacinacao);
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

        public DataTable ListarConsultasAPagar(DataTable tabela, string nomeAnimal)
        {

            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spsListarConsultasAPagar";

            SqlParameter pNomeAnimal = new SqlParameter("@NomeAnimal", SqlDbType.VarChar, 50);

            pNomeAnimal.Value = nomeAnimal;

            cmd.Parameters.Add(pNomeAnimal);

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

        public Consulta ListarConsultaAnimalAPagar(Int32 idConsulta)
        {
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spsListarConsultaAnimalAPagar";

            SqlParameter pIdConsulta = new SqlParameter("@IdConsulta", SqlDbType.Int);

            pIdConsulta.Value = idConsulta;

            cmd.Parameters.Add(pIdConsulta);

            conn.Open();

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            Consulta consulta = new Consulta();

            while (dr.Read())
            {
                consulta.idUsuario = dr.GetInt32(0);
                consulta.Valor = dr.GetDecimal(1);
            }    

            return consulta;
        }

        public bool AlteraStatusConsultaPaga(Int32 idConsulta, Int32 idFinanceiro)
        {
            bool executou = false;
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spuAlteraStatusConsultaPaga";

                SqlParameter pIdConsulta = new SqlParameter("@IdConsulta", SqlDbType.Int);
                SqlParameter pIdFinanceiro = new SqlParameter("@IdFinanceiro", SqlDbType.Int);
                SqlParameter pStatus = new SqlParameter("@Status", SqlDbType.Int);

                pIdConsulta.Value = idConsulta;
                pIdFinanceiro.Value = idFinanceiro;
                pStatus.Value = 2;

                cmd.Parameters.Add(pIdConsulta);
                cmd.Parameters.Add(pIdFinanceiro);
                cmd.Parameters.Add(pStatus);
                
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

        public int[] EstBuscaSexoAnimal(Nullable<DateTime> DataInicio, Nullable<DateTime> DataFim)
        {
            int[] qtdAni = new int[3];
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spsEstBuscaSexoAnimais";

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
                    for (int i = 0; i <= qtdAni.Length - 1; i++)
                    {
                        qtdAni[i] = dr.GetInt32(i);
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

            return qtdAni;

        }

        public int[] EstBuscaConsultaAnimal(Nullable<DateTime> DataInicio, Nullable<DateTime> DataFim)
        {
            int[] qtdAni = new int[7];
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spsEstBuscaConsultaAnimais";

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
                    for (int i = 0; i <= qtdAni.Length - 1; i++)
                    {
                        qtdAni[i] = dr.GetInt32(i);
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

            return qtdAni;

        }

        public int[] EstBuscaVacinaAnimal(Nullable<DateTime> DataInicio, Nullable<DateTime> DataFim)
        {
            int[] qtdAni = new int[7];
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spsEstBuscaVacinaAnimais";

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
                    for (int i = 0; i <= qtdAni.Length - 1; i++)
                    {
                        qtdAni[i] = dr.GetInt32(i);
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

            return qtdAni;

        }

    }
}
