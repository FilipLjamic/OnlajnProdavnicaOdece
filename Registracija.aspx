<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registracija.aspx.cs" Inherits="OnlajnProdavnicaOdece.Registracija" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registracija</title>
    <link href="Global.css" rel="stylesheet" type="text/css" />
    <link href="Registracija.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="main">
            <div class="panel">
                <asp:Label ID="Label1" runat="server" Text="Registrujte se" CssClass="item"></asp:Label>
                <asp:TextBox ID="mejl" runat="server" placeholder="Mejl" CssClass="item" TextMode="Email"></asp:TextBox>
                <asp:TextBox ID="lozinka" runat="server" placeholder="Lozinka" TextMode="Password" ValidateRequestMode="Disabled" CssClass="item"></asp:TextBox>
                <asp:TextBox ID="ime" runat="server" placeholder="Ime" CssClass="item"></asp:TextBox>
                <asp:TextBox ID="prezime" runat="server" placeholder="Prezime" CssClass="item"></asp:TextBox>
                <asp:TextBox ID="telefon" runat="server" placeholder="Broj telefona" CssClass="item" TextMode="Phone"></asp:TextBox>
                <asp:Button ID="register" runat="server" Text="Napravite nalog"  CssClass="item" OnClick="register_Click" />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Login.aspx" CssClass="item">Nazad</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
