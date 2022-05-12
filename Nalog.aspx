<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nalog.aspx.cs" Inherits="OnlajnProdavnicaOdece.Nalog" %>
<%@ Import Namespace="OnlajnProdavnicaOdece" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Nalog</title>
    <link href="Global.css" rel="stylesheet" type="text/css" />
    <link href="Nalog.css" rel="stylesheet" type="text/css" />
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

            <asp:Label ID="Label1" runat="server" Text="Registrujte se" CssClass="item"></asp:Label>
            <asp:TextBox ID="mejl" runat="server" placeholder="Mejl" CssClass="item" TextMode="Email"></asp:TextBox>
            <asp:TextBox ID="lozinka" runat="server" placeholder="Lozinka" TextMode="Password" ValidateRequestMode="Disabled" CssClass="item"></asp:TextBox>
            <asp:TextBox ID="ime" runat="server" placeholder="Ime" CssClass="item"></asp:TextBox>
            <asp:TextBox ID="prezime" runat="server" placeholder="Prezime" CssClass="item"></asp:TextBox>
            <asp:TextBox ID="telefon" runat="server" placeholder="Broj telefona" CssClass="item" TextMode="Phone"></asp:TextBox>
            <asp:Button ID="update" runat="server" Text="Azurirajte nalog"  CssClass="item"  />
            <asp:Button ID="delete" runat="server" Text="Obrisite nalog"  CssClass="item"  />
        </div>
    </form>
</body>
</html>
