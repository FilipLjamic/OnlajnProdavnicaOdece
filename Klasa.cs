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

            komanda.Parameters.Clear();
            komanda.Parameters.Add(new SqlParameter("@Mejl", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, mejl.ToString()));
            komanda.Parameters.Add(new SqlParameter("@Lozinka", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, lozinka.ToString()));
            komanda.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));
            konekcija.Open();
            komanda.ExecuteNonQuery();
            konekcija.Close();

            int Ret;
            Ret = (int)komanda.Parameters["@RETURN_VALUE"].Value;
            if (Ret == 0)
                rezultat = 0;
            else
                rezultat = 1;
            return rezultat;
        }

        public void KorisnikUpdate(int ID, string MEJL, string LOZINKA, string IME, string PREZIME, string TELEFON)
        {
            konekcija.ConnectionString = webConfig;

            komanda.Connection = konekcija;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "KorisnikUpdate";

            komanda.Parameters.Clear();
            komanda.Parameters.Add(new SqlParameter("@Id", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ID));
            komanda.Parameters.Add(new SqlParameter("@Mejl", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, MEJL));
            komanda.Parameters.Add(new SqlParameter("@Lozinka", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, LOZINKA));
            komanda.Parameters.Add(new SqlParameter("@Ime", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, IME));
            komanda.Parameters.Add(new SqlParameter("@Prezime", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, PREZIME));
            komanda.Parameters.Add(new SqlParameter("@Telefon", SqlDbType.NVarChar, 15, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, TELEFON));
            komanda.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));

            konekcija.Open();
            komanda.ExecuteNonQuery();
            konekcija.Close();
        }

        public int KorisnikPostoji(string mejl)
        {
            konekcija.ConnectionString = webConfig;
            int rezultat;

            komanda.Connection = konekcija;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "KorisnikPostoji";

            komanda.Parameters.Clear();
            komanda.Parameters.Add(new SqlParameter("@Mejl", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, mejl.ToString()));
            komanda.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));
            konekcija.Open();
            komanda.ExecuteNonQuery();
            konekcija.Close();

            int Ret;
            Ret = (int)komanda.Parameters["@RETURN_VALUE"].Value;
            if (Ret == 0)
                rezultat = 0;
            else
                rezultat = 1;
            return rezultat;
        }

        public void KorisnikInsert(string mejl, string lozinka, string ime, string prezime, string telefon)
        {
            konekcija.ConnectionString = webConfig;

            komanda.Connection = konekcija;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "KorisnikInsert";

            komanda.Parameters.Clear();
            komanda.Parameters.Add(new SqlParameter("@Mejl", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, mejl));
            komanda.Parameters.Add(new SqlParameter("@Lozinka", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, lozinka));
            komanda.Parameters.Add(new SqlParameter("@Ime", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ime));
            komanda.Parameters.Add(new SqlParameter("@Prezime", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, prezime));
            komanda.Parameters.Add(new SqlParameter("@Telefon", SqlDbType.NVarChar, 15, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, telefon));
            komanda.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));
            
            konekcija.Open();
            komanda.ExecuteNonQuery();
            konekcija.Close();
        }

        public void KorisnikDelete(string mejl)
        {
            konekcija.ConnectionString = webConfig;

            komanda.Connection = konekcija;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "KorisnikDelete";

            komanda.Parameters.Clear();
            komanda.Parameters.Add(new SqlParameter("@Mejl", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, mejl));
            komanda.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));

            konekcija.Open();
            komanda.ExecuteNonQuery();
            konekcija.Close();
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
            konekcija.ConnectionString = webConfig;
            bool rezultat;

            komanda.Connection = konekcija;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "isAdmin";

            komanda.Parameters.Clear();
            komanda.Parameters.Add(new SqlParameter("@Mejl", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, mejl));
            komanda.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));

            konekcija.Open();
            komanda.ExecuteNonQuery();
            konekcija.Close();

            int Ret;
            Ret = (int)komanda.Parameters["@RETURN_VALUE"].Value;
            if (Ret == 0)
                rezultat = false;
            else
                rezultat = true;
            return rezultat;
        }
    }
}