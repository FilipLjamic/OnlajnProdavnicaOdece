using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;

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

        protected void TagLinkButtonInsert_Click(object sender, EventArgs e)
        {
            A.TagInsert(((TextBox)GridTag.FooterRow.FindControl("TagNazivInsert")).Text, ((TextBox)GridTag.FooterRow.FindControl("TagOpisInsert")).Text);
            GridTag.DataBind();
            ((DropDownList)GridPT.FooterRow.FindControl("DropDownList5")).DataBind();
        }

        protected void ProizvodLinkButtonInsert_Click(object sender, EventArgs e)
        {
            string Naziv = ((TextBox)GridProizvod.FooterRow.FindControl("ProizvodNazivInsert")).Text;
            string Opis = ((TextBox)GridProizvod.FooterRow.FindControl("ProizvodOpisInsert")).Text;
            double Cena = Convert.ToDouble(((TextBox)GridProizvod.FooterRow.FindControl("ProizvodCenaInsert")).Text);
            Cena = Math.Round(Cena, 2);
            int Kolicina = Convert.ToInt32(((TextBox)GridProizvod.FooterRow.FindControl("ProizvodKolicinaInsert")).Text);
            string Ref = ((DropDownList)GridProizvod.FooterRow.FindControl("DropDownList2")).SelectedValue;       
            
            A.ProizvodInsert(Naziv, Opis, Cena, Kolicina, Ref);
            GridProizvod.DataBind();
            ((DropDownList)GridPT.FooterRow.FindControl("DropDownList4")).DataBind();
        }

        protected void ButtonUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                int filesize = FileUpload1.PostedFile.ContentLength;
                if (filesize > 4000000)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Preveliki fajl!')", true);
                }
                else
                {
                    FileUpload1.SaveAs(Server.MapPath("/uploads/" + FileUpload1.FileName));
                    A.SlikaInsert("/uploads/" + FileUpload1.FileName);
                    DropDownList3.DataBind();
                    ((DropDownList)GridProizvod.FooterRow.FindControl("DropDownList2")).DataBind();
                    Image1.ImageUrl = "/uploads/" + FileUpload1.FileName;
                    DropDownList3.SelectedValue = "/uploads/" + FileUpload1.FileName;
                }
            }
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            Image1.ImageUrl = DropDownList3.SelectedValue;
        }

        protected void ProizvdTagLBInsert_Click(object sender, EventArgs e)
        {
            int pId = Convert.ToInt32(((DropDownList)GridPT.FooterRow.FindControl("DropDownList4")).SelectedValue);
            int tId = Convert.ToInt32(((DropDownList)GridPT.FooterRow.FindControl("DropDownList5")).SelectedValue);
            A.ProizvodTagInsert(pId, tId);
            GridPT.DataBind();
        }

        protected void GridProizvod_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            A.ProizvodSlikaUpdate(((DropDownList)GridProizvod.Rows[GridProizvod.EditIndex].FindControl("DropDownList1")).SelectedValue, Convert.ToInt32(((Label)GridProizvod.Rows[GridProizvod.EditIndex].FindControl("Label1")).Text));
            GridProizvod.DataBind();
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            string Ref = DropDownList3.SelectedValue;
            A.SlikaDelete(Ref);
            A.ProizvodSlikaDefault(Ref);
            DropDownList3.DataBind();
            GridProizvod.DataBind();
            ((DropDownList)GridProizvod.FooterRow.FindControl("DropDownList2")).DataBind();
            Image1.ImageUrl = "/uploads/default.png";
            string path = Server.MapPath("~" + Ref);
            System.IO.File.Delete(path);
        }
    }
}