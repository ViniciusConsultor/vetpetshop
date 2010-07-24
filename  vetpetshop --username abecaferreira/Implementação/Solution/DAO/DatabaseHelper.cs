using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace DAO
{
    class DatabaseHelper
    {
        public string GetConnectionString(string str)
        {
            string conn = string.Empty;

            if (!string.IsNullOrEmpty(str))
            {
                conn = ConfigurationManager.ConnectionStrings[str].ConnectionString;
            }
            else 
            {
                conn = ConfigurationManager.ConnectionStrings["conexao"].ConnectionString;
            }

            return conn;        
        }
    }
}
