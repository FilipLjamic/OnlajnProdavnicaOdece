using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlajnProdavnicaOdece
{
    public partial class Narudzbina : System.Web.UI.Page
    {
        Klasa A = new Klasa();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["korisnik"].ToString() == "")
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void kupi_Click(object sender, EventArgs e)
        {
            string adr = adresa.Text.ToString();
            string grd = grad.Text.ToString();
            string drz = drzava.Text.ToString();
            string kom = Request.Form["komentar"].ToString();
            int id = A.getKorisnikId(Session["korisnik"].ToString());
            int NarId = Convert.ToInt32(Request.QueryString["ID"]);

            if (adr != "" && grd != "" && drz != "")
            {
                A.NarudzbinaInsert(id, adr, grd, drz, kom, NarId);
                A.KolMinus(NarId);
                Response.Redirect("Nalog.aspx");
            }
        }
    }
}