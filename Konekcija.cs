using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlajnProdavnicaOdece
{
    public class Konekcija
    {
        static public SqlConnection Connect()
        {
            string CS = ConfigurationManager.ConnectionStrings["veza"].ConnectionString;
            SqlConnection veza = new SqlConnection(CS);
            return veza;
        }
    }
}