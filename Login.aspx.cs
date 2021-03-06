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
        Klasa A = new Klasa();
        protected void Page_Load(object sender, EventArgs e)
        {         
            if (Session["korisnik"].ToString() != "")
            {
                Session["korisnik"] = "";
                Response.Redirect("Pocetna.aspx");
            }
            Session["korisnik"] = "";
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            if (A.KorisnikProvera(mejl.Text, lozinka.Text) == 0)
            {
                Session["korisnik"] = mejl.Text;
                Response.Redirect("Pocetna.aspx");
            }
            else
                Response.Redirect("Login.aspx");
        }
    }
}