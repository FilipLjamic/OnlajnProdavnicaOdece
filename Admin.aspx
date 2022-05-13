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
            <div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:veza %>" DeleteCommand="DELETE FROM [Tag] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Tag] ([Naziv], [Opis]) VALUES (@Naziv, @Opis)" SelectCommand="SELECT * FROM [Tag]" UpdateCommand="UPDATE [Tag] SET [Naziv] = @Naziv, [Opis] = @Opis WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Naziv" Type="String" />
                        <asp:Parameter Name="Opis" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Naziv" Type="String" />
                        <asp:Parameter Name="Opis" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                <asp:GridView ID="GridTag" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="Id" DataSourceID="SqlDataSource1" AllowSorting="True" ShowFooter="True" Width="333px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>

                        <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="TagLinkButtonInsert" runat="server" OnClick="TagLinkButtonInsert_Click">Insert</asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Naziv" SortExpression="Naziv">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Naziv") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Naziv") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TagNazivInsert" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Opis" SortExpression="Opis">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Opis") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Opis") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TagOpisInsert" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />

                    </Columns>

                    <FooterStyle BackColor="#e63232" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#e63232" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#cccccc" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
