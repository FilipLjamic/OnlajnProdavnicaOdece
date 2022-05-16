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
            <div class="main">
                <div class="panel">
                    <asp:Label ID="Label1" runat="server" Text="Mejl" CssClass="item"></asp:Label>
                    <asp:TextBox ID="mejl" runat="server" placeholder="Mejl" CssClass="item" TextMode="Email"></asp:TextBox>

                    <asp:Label ID="Label2" runat="server" Text="Lozinka" CssClass="item"></asp:Label>
                    <asp:TextBox ID="lozinka" runat="server" placeholder="Lozinka" TextMode="Password" ValidateRequestMode="Disabled" CssClass="item"></asp:TextBox>

                    <asp:Label ID="Label3" runat="server" Text="Potvrda lozinke" CssClass="item"></asp:Label>
                    <asp:TextBox ID="lozinkaPotvrda" runat="server" placeholder="Stara lozinka" TextMode="Password" ValidateRequestMode="Disabled" CssClass="item"></asp:TextBox>
                </div>
                <div class="panel">
                     <asp:Label ID="Label4" runat="server" Text="Ime" CssClass="item"></asp:Label>
                    <asp:TextBox ID="ime" runat="server" placeholder="Ime" CssClass="item"></asp:TextBox>

                    <asp:Label ID="Label5" runat="server" Text="Prezime" CssClass="item"></asp:Label>
                    <asp:TextBox ID="prezime" runat="server" placeholder="Prezime" CssClass="item"></asp:TextBox>

                    <asp:Label ID="Label6" runat="server" Text="Telefon" CssClass="item"></asp:Label>
                    <asp:TextBox ID="telefon" runat="server" placeholder="Broj telefona" CssClass="item" TextMode="Phone"></asp:TextBox>
                </div>
                <div class="panel">
                    <asp:Button ID="update" runat="server" Text="Azurirajte nalog"  CssClass="item" OnClick="update_Click"  />

                    <asp:Button ID="delete" runat="server" Text="Obrisite nalog"  CssClass="item" OnClick="delete_Click"  />
                </div>

                <div class="tabela">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:veza %>" DeleteCommand="DELETE FROM [Narudzbina] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Narudzbina] ([KorisnikId], [StatusNarudzbine], [Adresa], [Grad], [Drzava], [Datum], [Komentar], [ProizvodId]) VALUES (@KorisnikId, @StatusNarudzbine, @Adresa, @Grad, @Drzava, @Datum, @Komentar, @ProizvodId)" SelectCommand="SELECT [Narudzbina].*, [Proizvod].[Naziv] FROM [Narudzbina] JOIN [Proizvod] ON [Narudzbina].[ProizvodId] = [Proizvod].[Id]" UpdateCommand="UPDATE [Narudzbina] SET [KorisnikId] = @KorisnikId, [StatusNarudzbine] = @StatusNarudzbine, [Adresa] = @Adresa, [Grad] = @Grad, [Drzava] = @Drzava, [Datum] = @Datum, [Komentar] = @Komentar, [ProizvodId] = @ProizvodId WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="KorisnikId" Type="Int32" />
                            <asp:Parameter Name="StatusNarudzbine" Type="String" />
                            <asp:Parameter Name="Adresa" Type="String" />
                            <asp:Parameter Name="Grad" Type="String" />
                            <asp:Parameter Name="Drzava" Type="String" />
                            <asp:Parameter DbType="Date" Name="Datum" />
                            <asp:Parameter Name="Komentar" Type="String" />
                            <asp:Parameter Name="ProizvodId" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="KorisnikId" Type="Int32" />
                            <asp:Parameter Name="StatusNarudzbine" Type="String" />
                            <asp:Parameter Name="Adresa" Type="String" />
                            <asp:Parameter Name="Grad" Type="String" />
                            <asp:Parameter Name="Drzava" Type="String" />
                            <asp:Parameter DbType="Date" Name="Datum" />
                            <asp:Parameter Name="Komentar" Type="String" />
                            <asp:Parameter Name="ProizvodId" Type="Int32" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="KorisnikId" HeaderText="KorisnikId" SortExpression="KorisnikId" Visible="False" />
                            <asp:BoundField DataField="StatusNarudzbine" HeaderText="StatusNarudzbine" SortExpression="StatusNarudzbine" />
                            <asp:BoundField DataField="Adresa" HeaderText="Adresa" SortExpression="Adresa" />
                            <asp:BoundField DataField="Grad" HeaderText="Grad" SortExpression="Grad" />
                            <asp:BoundField DataField="Drzava" HeaderText="Drzava" SortExpression="Drzava" />
                            <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" />
                            <asp:BoundField DataField="Komentar" HeaderText="Komentar" SortExpression="Komentar" />
                            <asp:BoundField DataField="ProizvodId" HeaderText="ProizvodId" SortExpression="ProizvodId" />
                            <asp:BoundField DataField="Naziv" HeaderText="Naziv" SortExpression="Naziv" />
                            <asp:CommandField ShowDeleteButton="True" />
                        </Columns>

                        <FooterStyle BackColor="White" ForeColor="Black" />
                        <HeaderStyle BackColor="#E63232" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle ForeColor="Black" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#E65050" />
                        <SortedDescendingCellStyle BackColor="#D0D0D0" />
                        <SortedDescendingHeaderStyle BackColor="#CA2B2B" />
                    </asp:GridView>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
