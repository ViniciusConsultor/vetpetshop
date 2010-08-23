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
    public class TipoAnimalDAO
    {
        private DatabaseHelper databaseHelper;

        public TipoAnimalDAO()
        {
            databaseHelper = new DatabaseHelper();
        }

        public List<TipoAnimal> ListaTiposAnimal()
        {
            string stringConexao = databaseHelper.GetConnectionString("conexao");
            SqlConnection conn = new SqlConnection(stringConexao);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spsListaTipoAnimal";

            conn.Open();

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            List<TipoAnimal> _lista = new List<TipoAnimal>();

            while (dr.Read())
            {
                TipoAnimal tipoanimal = new TipoAnimal();
                tipoanimal.Id = dr.GetInt32(0);
                tipoanimal.Nome = dr.GetString(1);

                _lista.Add(tipoanimal);
            }

            return _lista;
        }
    }
}
