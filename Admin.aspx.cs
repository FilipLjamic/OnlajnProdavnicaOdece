using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

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

        private void GridTagPopulate()
        {
            string naredba = "SELECT Id, Naziv, Opis FROM Tag";
            SqlConnection veza = Konekcija.Connect();
            SqlDataAdapter adapter = new SqlDataAdapter(naredba, veza);
            DataSet ds_Tag = new DataSet();
            adapter.Fill(ds_Tag);
            GridTag.DataSource = ds_Tag;
            GridTag.DataBind();
            
        }

        protected void TagLinkButtonInsert_Click(object sender, EventArgs e)
        {
            A.TagInsert(((TextBox)GridTag.FooterRow.FindControl("TagNazivInsert")).Text, ((TextBox)GridTag.FooterRow.FindControl("TagOpisInsert")).Text);
            GridTag.DataBind();
        }
    }
}