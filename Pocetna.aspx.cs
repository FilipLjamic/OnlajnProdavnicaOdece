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

        protected void Button1_Click(object sender, EventArgs e)
        {
            set = A.PTFilter(Convert.ToInt32(DropDownList1.SelectedValue));
            for (int i = 0; i < set.Tables[0].Rows.Count; i++)
            {
                Response.Write(set.Tables[0].Rows[i]["Naziv"]);

                Response.Write(set.Tables[0].Rows[i]["Cena"]);
                Response.Write(set.Tables[0].Rows[i]["Naziv"]);

                Response.Write("<br>");

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }
    }
}
