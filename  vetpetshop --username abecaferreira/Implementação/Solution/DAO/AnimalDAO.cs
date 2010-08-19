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

        public DataTable ListarTipoAnimal(DataTable tabela)
        {
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spsListaTipoAnimal";

            conn.Open();

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (dr.Read())
            {
                DataRow _linhaTabela = tabela.NewRow();
                _linhaTabela["id_animal"] = dr.GetInt32(0);
                _linhaTabela["id_tipoanimal"] = dr.GetInt32(1);
                _linhaTabela["nm_animal"] = dr.GetString(2);
                _linhaTabela["nm_raca"] = dr.GetString(3);
                _linhaTabela["dc_peso"] = dr.GetDecimal(4);                
                
                tabela.Rows.Add(_linhaTabela);
            }

            conn.Close();
            return tabela;
        }
    }
}
