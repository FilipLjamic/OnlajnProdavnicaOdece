using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Diagnostics;

namespace OnlajnProdavnicaOdece
{
    public partial class Nalog : System.Web.UI.Page
    {
        Klasa A = new Klasa();
        DataTable dt_Korisnik = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["korisnik"] == null || Session["korisnik"] == "")
                Response.Redirect("Pocetna.aspx");

            string naredba = "SELECT Id, Mejl, Lozinka, Ime, Prezime, Telefon FROM Korisnik WHERE Mejl = '" + Session["korisnik"].ToString() + "'";
            SqlConnection veza = Konekcija.Connect();
            SqlDataAdapter adapter = new SqlDataAdapter(naredba.ToString(), veza);
            adapter.Fill(dt_Korisnik);

            if (!Page.IsPostBack)
            {
                mejl.Text = dt_Korisnik.Rows[0]["Mejl"].ToString();
                ime.Text = dt_Korisnik.Rows[0]["Ime"].ToString();
                prezime.Text = dt_Korisnik.Rows[0]["Prezime"].ToString();
                telefon.Text = dt_Korisnik.Rows[0]["Telefon"].ToString();
            }
        }

        protected void delete_Click(object sender, EventArgs e)
        {
            A.KorisnikDelete(Session["korisnik"].ToString());
            Session["korisnik"] = "";
            Response.Redirect("Pocetna.aspx");
        }

        protected void update_Click(object sender, EventArgs e)
        {
            string pass;
            if (lozinka.Text == "")
                pass = dt_Korisnik.Rows[0]["Lozinka"].ToString();
            else
                pass = lozinka.Text;

            string fname = ime.Text;
            string lname = prezime.Text;
            string phone = telefon.Text;
            string mail = mejl.Text;
            int id = Convert.ToInt32(dt_Korisnik.Rows[0]["Id"]);

            Debug.WriteLine(pass + fname + lname + phone + mail + id);
            if (lozinka.Text != "")
            {
                if (lozinkaPotvrda.Text == dt_Korisnik.Rows[0]["Lozinka"].ToString())
                {
                    A.KorisnikUpdate(id, mail, pass, fname, lname, phone);
                    Session["korisnik"] = mejl.Text;
                    Response.Redirect("Pocetna.aspx");
                }
                else
                {
                    //potvrda lozinke nije dobra
                }
            }
            else
            {
                A.KorisnikUpdate(id, mail, pass, fname, lname, phone);
                Session["korisnik"] = mejl.Text;
                Response.Redirect("Pocetna.aspx");
            }
        }
    }
}