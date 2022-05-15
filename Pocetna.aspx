<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pocetna.aspx.cs" Inherits="OnlajnProdavnicaOdece.Pocetna" %>
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

                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Naziv" DataValueField="Id"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:veza %>" SelectCommand="SELECT * FROM [Tag]"></asp:SqlDataSource>
                <asp:Button ID="Button1" runat="server" Text="Primeni filter" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="Ocisti filter" OnClick="Button2_Click" />

                <div class="proizvodContainer">
                    <%
                        DataSet set = new DataSet();
                        set = A.ProizvodSvi();

                        for (int i = 0; i < set.Tables[0].Rows.Count; i++)
                        {
                            Response.Write("<div class='proizvodStavka'>");

                            Response.Write(set.Tables[0].Rows[i]["Naziv"]);

                            Response.Write("<div class='proizvodSlika'>");
                            Response.Write("<img src='" + set.Tables[0].Rows[i]["SlikaRef"] + "' width='90%' align='center' />");
                            Response.Write("</div>");

                            Response.Write("<a href=Narudzbina.aspx?ID=" + set.Tables[0].Rows[i]["Id"] + ">Naruci</a>");

                            Response.Write("</div>");

                            //Response.Write(set.Tables[0].Rows[i]["Opis"]);

                        }
                    %>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
