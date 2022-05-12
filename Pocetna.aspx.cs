using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlajnProdavnicaOdece
{
    public partial class Pocetna : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["korisnik"] == null)
            {
                Session["korisnik"] = "";
            }
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session["korisnik"] = "";
            Response.Redirect("Pocetna.aspx");
        }
    }
}
