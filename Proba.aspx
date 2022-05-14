<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Proba.aspx.cs" Inherits="OnlajnProdavnicaOdece.Proba" %>
<%@ Import Namespace="System.Data" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%
                OnlajnProdavnicaOdece.Klasa A = new OnlajnProdavnicaOdece.Klasa();
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
    </form>
</body>
</html>
