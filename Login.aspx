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
        <div>
            <p>Uloguj se</p>
            <asp:TextBox ID="mejl" runat="server" type="email" placeholder="Mejl"></asp:TextBox>
            <asp:TextBox ID="lozinka" runat="server" type="password" placeholder="Lozinka" TextMode="Password" ValidateRequestMode="Disabled"></asp:TextBox>
            <asp:Button ID="login" runat="server" Text="Login" OnClick="Login_Click" />
        </div>
    </form>
</body>
</html>
