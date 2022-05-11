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
            <header id="header">
                <h1>Naslov</h1>
            </header>

            <div id="main">
                <img src="https://drive.google.com/uc?id=1Li5JXl8vw0wmos72YA_1s_egWnIyRsi6"  width="20%"/>

                <div class="proizvodCointainer">
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
                            Response.Write("</div>");
                        }

                        
                    %>
                </div>

                <p>
                    <%
                        for (int i = 1; i <= 5; i++)
                        {
                            Response.Write("<div class='a" + i + "'>");
                            Response.Write("Broj" + i + ".\n");
                            Response.Write("</div>");
                        }
                        
                    %>
                </p>
            </div>
        </div>
    </form>
</body>
</html>
