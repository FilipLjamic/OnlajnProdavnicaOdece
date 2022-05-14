﻿using System;
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
        }

        protected void GridTag_Load(object sender, EventArgs e)
        {
            GridTagFooterWhenEmpty();
        }

        private void GridTagFooterWhenEmpty()
        {
            if (GridTag.Rows.Count == 0)
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("Id");
                dt.Columns.Add("Naziv");
                dt.Columns.Add("Opis");
                DataRow red = dt.NewRow();
                red["Id"] = 0;
                red["Naziv"] = "";
                red["Opis"] = "";
                dt.Rows.Add(red);
                ViewState["GridTag"] = dt;
                
                //GridTag.Rows[0].Visible = false;
            }
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
                    FileUpload1.SaveAs(Server.MapPath("./uploads/" + FileUpload1.FileName));
                    A.SlikaInsert("./uploads/" + FileUpload1.FileName);
                }

            }
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            Image1.ImageUrl = DropDownList3.SelectedValue;
        }

        protected void ProizvdTagLBInsert_Click(object sender, EventArgs e)
        {
            int pId = Convert.ToInt32(((DropDownList)GridProizvod.FooterRow.FindControl("DropDownList4")).SelectedValue);
            int tId = Convert.ToInt32(((DropDownList)GridProizvod.FooterRow.FindControl("DropDownList5")).SelectedValue);
            A.ProizvodTagInsert(pId, tId);
        }
    }
}