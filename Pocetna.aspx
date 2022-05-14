﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pocetna.aspx.cs" Inherits="OnlajnProdavnicaOdece.Pocetna" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="OnlajnProdavnicaOdece" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pocetna</title>
    <link href="Global.css" rel="stylesheet" type="text/css" />
    <link href="Pocetna.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <% Klasa A = new Klasa(); %>
            <header>
                <div class="header">
                    <div class="user">
                        <h1>
                            <% 
                                if (Session["korisnik"].ToString() != "")
                                    Response.Write(A.getKorisnikName(Session["korisnik"].ToString()));
                            %>
                        </h1>
                    </div>
                    <div class="headerControl">
                        <a href="Pocetna.aspx" class="controlItem">Pocetna</a>
                        <%
                            if (Session["korisnik"].ToString() != "")
                            {
                                Response.Write("<a href='Login.aspx' class='controlItem'>Logout</a>");
                                Response.Write("<a href='Nalog.aspx' class='controlItem'>Nalog</a>");
                                if (A.jeAdmin(Session["korisnik"].ToString()) == true)
                                    Response.Write("<a href='Admin.aspx' class='controlItem'><p>Upravljanje</p></a>");
                            }
                            else
                                Response.Write("<a href='Login.aspx' class='controlItem'>Login</a>");
                        %>
                    </div>
                </div>
            </header>

            <div id="main">

                <div class="proizvodContainer">
                    <!--<%
                        
                        string naredba = "SELECT * FROM Proizvod";
                        SqlConnection veza = Konekcija.Connect();
                        SqlDataAdapter adapter = new SqlDataAdapter(naredba, veza);
                        DataTable dt_Proizvod = new DataTable();
                        adapter.Fill(dt_Proizvod);

                        for (int i = 0; i < dt_Proizvod.Rows.Count; i++)
                        {
                            Response.Write("<div class='proizvodStavka'>");

                            Response.Write(dt_Proizvod.Rows[i]["Naziv"].ToString());

                            Response.Write("<div class='proizvodSlika'>");
                            Response.Write("<img src='");
                            Response.Write(dt_Proizvod.Rows[i]["SlikaRef"].ToString());
                            Response.Write("' width='90%' align='center' />");
                            Response.Write("</div>");

                            Response.Write("</div>");
                        }

                        
                    %>-->

                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Naziv" DataValueField="Naziv"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:veza %>" SelectCommand="SELECT * FROM [Tag]"></asp:SqlDataSource>
                    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
                    <%
                

                DataSet set = new DataSet();
                set = A.ProizvodSvi();
                for (int i = 0; i < set.Tables[0].Rows.Count; i++)
                {
                    Response.Write(set.Tables[0].Rows[i]["Naziv"]);
                    Response.Write("<a href=Narudzbina.aspx?ID=" + set.Tables[0].Rows[i]["Id"] + ">");
                    Response.Write("Naruci");
                    Response.Write("</a>");
                    Response.Write(set.Tables[0].Rows[i]["Opis"]);
                    Response.Write("<img src='" + set.Tables[0].Rows[i]["SlikaRef"] + "' width=100px />");

                    Response.Write("<br>");

                }
                %>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
