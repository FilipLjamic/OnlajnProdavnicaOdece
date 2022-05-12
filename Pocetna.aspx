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
                        <h1><% Response.Write(A.getKorisnikName(Session["korisnik"].ToString())); %></h1>
                    </div>
                    
                    <div class="headerControl">
                        <a href="Login.aspx" class="controlItem">
                            <p>Logout</p>
                        </a>
                        <a href="#" class="controlItem">
                            <p>Nalog</p>
                        </a>
                        <%
                            if (A.jeAdmin(Session["korisnik"].ToString()) == true)
                            {
                                Response.Write("<a href='Admin.aspx' class='controlItem'><p>Upravljanje</p></a>");
                            }
                        %>

                        
                    </div>
                </div>

            </header>

            <div id="main">

                <div class="proizvodContainer">
                    <%
                        
                        StringBuilder naredba = new StringBuilder("SELECT * FROM Proizvod");
                        SqlConnection veza = Konekcija.Connect();
                        SqlDataAdapter adapter = new SqlDataAdapter(naredba.ToString(), veza);
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

                        
                    %>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
