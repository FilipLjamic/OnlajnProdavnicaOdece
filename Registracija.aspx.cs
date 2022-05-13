using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlajnProdavnicaOdece
{
    public partial class Registracija : System.Web.UI.Page
    {
        Klasa A = new Klasa();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void register_Click(object sender, EventArgs e)
        {
            if (A.KorisnikPostoji(mejl.Text) != 0)
            {
                A.KorisnikInsert(mejl.Text, lozinka.Text, ime.Text, prezime.Text, telefon.Text);
                Session["korisnik"] = mejl.Text;
                Response.Redirect("Pocetna.aspx");
            }
            else
                Response.Redirect("Login.aspx");
        }
    }
}