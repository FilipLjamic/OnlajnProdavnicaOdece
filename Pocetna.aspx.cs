using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace OnlajnProdavnicaOdece
{
    public partial class Pocetna : System.Web.UI.Page
    {
        Klasa A = new Klasa();
        DataSet set = new DataSet();
        DataSet set1 = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["korisnik"] == null)
            {
                Session["korisnik"] = "";
            }
            set1.Clear();
            set1 = A.ProizvodSvi();
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session["korisnik"] = "";
            Response.Redirect("Pocetna.aspx");
        }

        public DataSet vratiSet()
        {
            return set1;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            set1.Clear();
            set1 = A.PTFilter(Convert.ToInt32(DropDownList1.SelectedValue));
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            set1.Clear();
            set1 = A.ProizvodSvi();
        }

        public void divNapravi(DataSet ds)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                Response.Write("<div class='proizvodStavka'>");

                Response.Write("<a class='proizvodNaziv'>" + ds.Tables[0].Rows[i]["Naziv"] + "</a>");

                Response.Write("<div class='proizvodSlika'>");
                Response.Write("<img src='" + ds.Tables[0].Rows[i]["SlikaRef"] + "' />");
                Response.Write("</div>");

                Response.Write("<a class='proizvodCena'>" + ds.Tables[0].Rows[i]["Cena"] + "RSD</a>");

                if (Convert.ToInt32(ds.Tables[0].Rows[i]["Kolicina"]) > 0)
                    Response.Write("<a class='proizvodNaruci' href=Narudzbina.aspx?ID=" + ds.Tables[0].Rows[i]["Id"] + ">Naruci</a>");
                else
                    Response.Write("<a class='proizvodNedostupan'" + ds.Tables[0].Rows[i]["Id"] + ">Nije na stanju</a>");

                Response.Write("</div>");
            }
        }
    }
}
