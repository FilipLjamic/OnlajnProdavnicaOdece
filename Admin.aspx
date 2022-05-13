<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="OnlajnProdavnicaOdece.Admin" %>
<%@ Import Namespace="OnlajnProdavnicaOdece" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Upravljanje</title>
    <link href="Global.css" rel="stylesheet" type="text/css" />
    <link href="Admin.css" rel="stylesheet" type="text/css" />
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

        </div>
    </form>
</body>
</html>
