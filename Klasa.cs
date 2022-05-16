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

        public void TagInsert(string naziv, string opis)
        {
            konekcija.ConnectionString = webConfig;

            komanda.Connection = konekcija;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "TagInsert";

            komanda.Parameters.Clear();
            komanda.Parameters.Add(new SqlParameter("@Naziv", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, naziv));
            komanda.Parameters.Add(new SqlParameter("@Opis", SqlDbType.NVarChar, 100, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, opis));
            komanda.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));

            konekcija.Open();
            komanda.ExecuteNonQuery();
            konekcija.Close();
        }

        public void ProizvodInsert(string naziv, string opis, double cena, int kolicina, string slika)
        {
            konekcija.ConnectionString = webConfig;

            komanda.Connection = konekcija;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "ProizvodInsert";

            komanda.Parameters.Clear();
            komanda.Parameters.Add(new SqlParameter("@Naziv", SqlDbType.NVarChar, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, naziv));
            komanda.Parameters.Add(new SqlParameter("@Opis", SqlDbType.NVarChar, 1000, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, opis));
            komanda.Parameters.Add(new SqlParameter("@Cena", SqlDbType.Float, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, cena));
            komanda.Parameters.Add(new SqlParameter("@Kolicina", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, kolicina));
            komanda.Parameters.Add(new SqlParameter("@SlikaRef", SqlDbType.NVarChar, 1000, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, slika));
            komanda.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));

            konekcija.Open();
            komanda.ExecuteNonQuery();
            konekcija.Close();
        }

        public void SlikaInsert(string Ref)
        {
            konekcija.ConnectionString = webConfig;

            komanda.Connection = konekcija;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "SlikaInsert";

            komanda.Parameters.Clear();
            komanda.Parameters.Add(new SqlParameter("@Ref", SqlDbType.NVarChar, 1000, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, Ref));
            komanda.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));

            konekcija.Open();
            komanda.ExecuteNonQuery();
            konekcija.Close();
        }

        public void ProizvodTagInsert(int proizvodId, int tagId)
        {
            konekcija.ConnectionString = webConfig;

            komanda.Connection = konekcija;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "ProizvodTagInsert";

            komanda.Parameters.Clear();
            komanda.Parameters.Add(new SqlParameter("@ProizvodId", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, proizvodId));
            komanda.Parameters.Add(new SqlParameter("@TagId", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, tagId));
            komanda.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));

            konekcija.Open();
            komanda.ExecuteNonQuery();
            konekcija.Close();
        }

        public void ProizvodSlikaUpdate(string Ref, int Id)
        {
            konekcija.ConnectionString = webConfig;

            komanda.Connection = konekcija;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "ProizvodSlikaUpdate";

            komanda.Parameters.Clear();
            komanda.Parameters.Add(new SqlParameter("@Id", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, Id));
            komanda.Parameters.Add(new SqlParameter("@SlikaRef", SqlDbType.NVarChar, 1000, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, Ref));
            komanda.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));

            konekcija.Open();
            komanda.ExecuteNonQuery();
            konekcija.Close();
        }

        public DataSet ProizvodSvi()
        {
            konekcija.ConnectionString = webConfig;

            komanda.Connection = konekcija;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "ProizvodSvi";

            komanda.Parameters.Clear();

            konekcija.Open();
            komanda.ExecuteNonQuery();
            konekcija.Close();
            adapter.SelectCommand = komanda;
            adapter.Fill(set);
            return set;
        }

        public DataSet PTFilter(int Id)
        {
            konekcija.ConnectionString = webConfig;

            komanda.Connection = konekcija;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "ProizvodSviFilter";

            komanda.Parameters.Clear();
            komanda.Parameters.Add(new SqlParameter("@TagId", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, Id));

            konekcija.Open();
            komanda.ExecuteNonQuery();
            konekcija.Close();
            adapter.SelectCommand = komanda;
            adapter.Fill(set);
            return set;
        }

        public void SlikaDelete(string Ref)
        {
            konekcija.ConnectionString = webConfig;

            komanda.Connection = konekcija;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "SlikaDelete";

            komanda.Parameters.Clear();
            komanda.Parameters.Add(new SqlParameter("@Ref", SqlDbType.NVarChar, 1000, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, Ref));

            konekcija.Open();
            komanda.ExecuteNonQuery();
            konekcija.Close();
        }

        public void ProizvodSlikaDefault(string Ref)
        {
            konekcija.ConnectionString = webConfig;

            komanda.Connection = konekcija;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "ProizvodSlikaDefault";

            komanda.Parameters.Clear();
            komanda.Parameters.Add(new SqlParameter("@SlikaRef", SqlDbType.NVarChar, 1000, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, Ref));

            konekcija.Open();
            komanda.ExecuteNonQuery();
            konekcija.Close();
        }

        public int getKorisnikId(string Mejl)
        {
            konekcija.ConnectionString = webConfig;

            komanda.Connection = konekcija;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "GetKorisnikId";

            komanda.Parameters.Clear();
            komanda.Parameters.Add(new SqlParameter("@Mejl", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, Mejl));

            konekcija.Open();
            komanda.ExecuteNonQuery();
            konekcija.Close();
            adapter.SelectCommand = komanda;
            adapter.Fill(set);
            return Convert.ToInt32(set.Tables[0].Rows[0]["Id"].ToString());
        }

        public void NarudzbinaInsert(int id, string adresa, string grad, string drzava, string komentar, int proizvod)
        {
            konekcija.ConnectionString = webConfig;

            komanda.Connection = konekcija;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "NarudzbinaInsert";

            komanda.Parameters.Clear();
            komanda.Parameters.Add(new SqlParameter("@KorisnikId", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id));
            komanda.Parameters.Add(new SqlParameter("@Adresa", SqlDbType.NVarChar, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, adresa));
            komanda.Parameters.Add(new SqlParameter("@Grad", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, grad));
            komanda.Parameters.Add(new SqlParameter("@Drzava", SqlDbType.NVarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, drzava));
            komanda.Parameters.Add(new SqlParameter("@Komentar", SqlDbType.NVarChar, 1000, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, komentar));
            komanda.Parameters.Add(new SqlParameter("@ProizvodId", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, proizvod));
            komanda.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));

            konekcija.Open();
            komanda.ExecuteNonQuery();
            konekcija.Close();
        }

        public void KolMinus(int id)
        {
            konekcija.ConnectionString = webConfig;

            komanda.Connection = konekcija;
            komanda.CommandType = CommandType.StoredProcedure;
            komanda.CommandText = "KolMinus";

            komanda.Parameters.Clear();
            komanda.Parameters.Add(new SqlParameter("@Id", SqlDbType.Int, 4, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id));
            komanda.Parameters.Add(new SqlParameter("@RETURN_VALUE", SqlDbType.Int, 4, ParameterDirection.ReturnValue, true, 0, 0, "", DataRowVersion.Current, null));

            konekcija.Open();
            komanda.ExecuteNonQuery();
            konekcija.Close();
        }
    }
}