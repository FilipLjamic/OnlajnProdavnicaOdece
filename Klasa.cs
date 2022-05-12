using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Diagnostics;

namespace OnlajnProdavnicaOdece
{
    public class Klasa
    {
        SqlConnection konekcija = new SqlConnection();
        string webConfig = ConfigurationManager.ConnectionStrings["veza"].ConnectionString;
        SqlCommand komanda = new SqlCommand();
        SqlDataAdapter adapter = new SqlDataAdapter();
        DataSet set = new DataSet();

        public int KorisnikProvera(string mejl, string lozinka)
        {
            konekcija.ConnectionString = webConfig;
            int rezultat;

            komanda.Connection = konekcija;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "KorisnikEmailProvera";

            komanda.Parameters.Add(new SqlParameter("@Mejl", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, mejl));
            komanda.Parameters.Add(new SqlParameter("@Lozinka", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, lozinka));
            komanda.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));
            konekcija.Open();
            komanda.ExecuteNonQuery();
            konekcija.Close();

            int Ret;
            Ret = (int)komanda.Parameters["@RETURN_VALUE"].Value;
            if (Ret == 0)
            {
                rezultat = 0;
            }

            else
            {
                rezultat = 1;
            }
            return rezultat;
        }

        public string getKorisnikName(string mejl)
        {
            string naredba = "SELECT Ime + ' ' + Prezime AS Naziv FROM Korisnik WHERE Mejl = '" + mejl + "'";
            SqlConnection veza = Konekcija.Connect();
            SqlDataAdapter adapter = new SqlDataAdapter(naredba.ToString(), veza);
            DataTable dt_Name = new DataTable();
            adapter.Fill(dt_Name);
            return dt_Name.Rows[0]["Naziv"].ToString();
        }

        public bool jeAdmin(string mejl)
        {
            string naredba = "SELECT jeAdmin FROM Korisnik WHERE Mejl = '" + mejl + "'";
            SqlConnection veza = Konekcija.Connect();
            SqlDataAdapter adapter = new SqlDataAdapter(naredba.ToString(), veza);
            DataTable dt_Admin = new DataTable();
            adapter.Fill(dt_Admin);
            if ((bool)dt_Admin.Rows[0]["jeAdmin"] == true)
            {
                return true;
            }
            else
                return false;
        }
    }
}