using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlajnProdavnicaOdece
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["korisnik"] = "";
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            Klasa A = new Klasa();
            int rezultat;
            rezultat = A.KorisnikProvera(mejl.Text, lozinka.Text);

            if (rezultat == 0)
            {
                Session["korisnik"] = mejl.Text;
                Response.Redirect("Pocetna.aspx");
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}