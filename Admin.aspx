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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:veza %>" DeleteCommand="DELETE FROM [Tag] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Tag] ([Naziv], [Opis]) VALUES (@Naziv, @Opis)" SelectCommand="SELECT * FROM [Tag]" UpdateCommand="UPDATE [Tag] SET [Naziv] = @Naziv, [Opis] = @Opis WHERE [Id] = @Id" >
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

                <asp:GridView ID="GridTag" runat="server" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="Id" DataSourceID="SqlDataSource1" AllowSorting="True" ShowFooter="True" Width="333px" ShowHeaderWhenEmpty="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" AllowPaging="True">
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
                    <EmptyDataTemplate>
                        Nema tagova
                    </EmptyDataTemplate>

                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
            </div>

            <div>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:veza %>" DeleteCommand="DELETE FROM [Proizvod] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Proizvod] ([Naziv], [Opis], [Cena], [Kolicina], [DatumNastanka], [SlikaRef]) VALUES (@Naziv, @Opis, @Cena, @Kolicina, @DatumNastanka, @SlikaRef)" SelectCommand="SELECT * FROM [Proizvod]" UpdateCommand="UPDATE [Proizvod] SET [Naziv] = @Naziv, [Opis] = @Opis, [Cena] = @Cena, [Kolicina] = @Kolicina, [DatumNastanka] = @DatumNastanka, [SlikaRef] = @SlikaRef WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Naziv" Type="String" />
                        <asp:Parameter Name="Opis" Type="String" />
                        <asp:Parameter Name="Cena" Type="Double" />
                        <asp:Parameter Name="Kolicina" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="DatumNastanka" />
                        <asp:Parameter Name="SlikaRef" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Naziv" Type="String" />
                        <asp:Parameter Name="Opis" Type="String" />
                        <asp:Parameter Name="Cena" Type="Double" />
                        <asp:Parameter Name="Kolicina" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="DatumNastanka" />
                        <asp:Parameter Name="SlikaRef" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                <asp:GridView ID="GridProizvod" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" ShowFooter="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowUpdated="GridProizvod_RowUpdated" AllowPaging="True" AllowSorting="True">
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle Height="4em" ForeColor="#000066"/>
                    <EditRowStyle Height="4em" />
                    <Columns>
                        <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="ProizvodLinkButtonInsert" runat="server" OnClick="ProizvodLinkButtonInsert_Click">Insert</asp:LinkButton>
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
                                <asp:TextBox ID="ProizvodNazivInsert" runat="server"></asp:TextBox>
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
                                <asp:TextBox ID="ProizvodOpisInsert" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cena" SortExpression="Cena">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Cena") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Cena") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="ProizvodCenaInsert" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Kolicina" SortExpression="Kolicina">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Kolicina") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Kolicina") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="ProizvodKolicinaInsert" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DatumNastanka" SortExpression="DatumNastanka">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("DatumNastanka") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("DatumNastanka") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SlikaRef">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="Ref" DataValueField="Ref" Height="4em"></asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image2" runat="server" ImageUrl='<%# Bind("SlikaRef") %>' Height="4em"/>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="Ref" DataValueField="Ref" Height="4em"></asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
            </div>

            <div>

            </div>

            <div>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:veza %>" DeleteCommand="DELETE FROM [Slika] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Slika] ([Ref]) VALUES (@Ref)" SelectCommand="SELECT * FROM [Slika]" UpdateCommand="UPDATE [Slika] SET [Ref] = @Ref WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Ref" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Ref" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Button ID="ButtonUpload" runat="server" Text="Dodaj sliku" OnClick="ButtonUpload_Click" />
                <asp:Image ID="Image1" runat="server" ImageUrl="" Height="300px" Width="300px"/>
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="Ref" DataValueField="Ref" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                <asp:Button ID="ButtonDelete" runat="server" Text="Obrisi sliku" OnClick="ButtonDelete_Click" />
            </div>

            <div>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:veza %>" DeleteCommand="DELETE FROM [ProizvodTag] WHERE [ProizvodId] = @ProizvodId AND [TagId] = @TagId" InsertCommand="INSERT INTO [ProizvodTag] ([ProizvodId], [TagId]) VALUES (@ProizvodId, @TagId)" SelectCommand="SELECT [ProizvodTag].[ProizvodId], [Proizvod].[Naziv] AS ProizvodNaziv, [ProizvodTag].[TagId], [Tag].[Naziv] AS TagNaziv FROM [ProizvodTag]
                    JOIN [Tag] ON [ProizvodTag].[TagId] = [Tag].[Id]
                    JOIN [Proizvod] ON [ProizvodTag].[ProizvodId] = [Proizvod].[Id]">
                    <DeleteParameters>
                        <asp:Parameter Name="ProizvodId" Type="Int32" />
                        <asp:Parameter Name="TagId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ProizvodId" Type="Int32" />
                        <asp:Parameter Name="TagId" Type="Int32" />
                    </InsertParameters>
                </asp:SqlDataSource>

                <asp:GridView ID="GridPT" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ProizvodId,TagId" DataSourceID="SqlDataSource4" ShowFooter="True" ShowHeaderWhenEmpty="True" AllowPaging="True" AllowSorting="True">
                    <Columns>
                        <asp:TemplateField>
                            <EditItemTemplate></EditItemTemplate>
                            <ItemTemplate></ItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="ProizvdTagLBInsert" runat="server" OnClick="ProizvdTagLBInsert_Click">Insert</asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ProizvodId" SortExpression="ProizvodId" Visible="False">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProizvodId") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ProizvodId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ProizvodNaziv" SortExpression="ProizvodNaziv">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ProizvodNaziv") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("ProizvodNaziv") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource2" DataTextField="Naziv" DataValueField="Id"></asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="TagId" SortExpression="TagId" Visible="False">
                            <EditItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("TagId") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("TagId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="TagNaziv" SortExpression="TagNaziv">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TagNaziv") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("TagNaziv") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource1" DataTextField="Naziv" DataValueField="Id"></asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
            </div>

        </div>
    </form>
</body>
</html>
