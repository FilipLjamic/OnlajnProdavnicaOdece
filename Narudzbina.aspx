<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Narudzbina.aspx.cs" Inherits="OnlajnProdavnicaOdece.Narudzbina" %>
<%@ Import Namespace="OnlajnProdavnicaOdece" %>
<%@ Import Namespace="System.Data" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Narudzbina</title>
    <link href="Global.css" rel="stylesheet" type="text/css" />
    <link href="Narudzbina.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%
                Klasa A = new Klasa();
                DataSet set = new DataSet();
                int NarId = Convert.ToInt32(Request.QueryString["ID"]) - 1;
            %>
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
            
            <div class="main">
                <div class="proizvod">
                    <% set = A.ProizvodSvi();

                        Response.Write("<div class='proizvodStavka'>");

                        Response.Write("<a class='proizvodNaziv'>" + set.Tables[0].Rows[NarId]["Naziv"] + "</a>");

                        Response.Write("<div class='proizvodSlika'>");
                        Response.Write("<img src='" + set.Tables[0].Rows[NarId]["SlikaRef"] + "' />");
                        Response.Write("</div>");

                        Response.Write("<a class='proizvodCena'>" + set.Tables[0].Rows[NarId]["Cena"] + "RSD</a>");

                        Response.Write("</div>");

                        Response.Write("<div class='Opis'>");
                        Response.Write("<a class='proizvodOpis'>" + set.Tables[0].Rows[NarId]["Opis"] + "</a>");
                        Response.Write("</div>");
                    %>
                </div>
                <div class="info">
                    <asp:TextBox ID="adresa" runat="server" placeholder="Ulica i broj" CssClass="item"></asp:TextBox>
                    <asp:TextBox ID="grad" runat="server" placeholder="Grad" CssClass="item"></asp:TextBox>
                    <asp:TextBox ID="drzava" runat="server" placeholder="Drzava" CssClass="item"></asp:TextBox>
                    <textarea id="komentar" name="komentar" cols="20" rows="4" class="item" placeholder="Komentar"></textarea>
                    <asp:Button ID="kupi" runat="server" Text="Kupi" CssClass="item" OnClick="kupi_Click"/>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
