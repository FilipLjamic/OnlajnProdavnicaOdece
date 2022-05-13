using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlajnProdavnicaOdece
{
    public partial class Admin : System.Web.UI.Page
    {
        Klasa A = new Klasa();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["korisnik"] == null || Session["korisnik"] == "")
                Response.Redirect("Pocetna.aspx");
            else
                if (A.jeAdmin(Session["korisnik"].ToString()) != true)
                    Response.Redirect("Pocetna.aspx");
        }
    }
}