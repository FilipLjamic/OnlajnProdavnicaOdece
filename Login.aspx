<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlajnProdavnicaOdece.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="Global.css" rel="stylesheet" type="text/css" />
    <link href="Login.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="main">
            <div class="panel">
                <asp:Label ID="Label1" runat="server" Text="Ulogujte se" CssClass="item"></asp:Label>
                <asp:TextBox ID="mejl" runat="server" type="email" placeholder="Mejl" CssClass="item"></asp:TextBox>
                <asp:TextBox ID="lozinka" runat="server" type="password" placeholder="Lozinka" TextMode="Password" ValidateRequestMode="Disabled" CssClass="item"></asp:TextBox>
                <asp:Button ID="login" runat="server" Text="Login" OnClick="Login_Click" CssClass="item" />
                <asp:Label ID="Label2" runat="server" Text="Nemate nalog?" CssClass="item"></asp:Label>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Registracija.aspx" CssClass="item">Registracija</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
