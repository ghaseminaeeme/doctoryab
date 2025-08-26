<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="DoctorYab.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>update panel</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            <p>go down </p>
            <p>go down </p>
            <p>go down </p>
            <p>go down </p>
            <p>go down </p>
            <p>go down </p>
            <p>go down </p>
            <p>go down </p>
            <p>go down </p>
            <p>go down </p>
            <p>go down </p>
            <p>go down </p>
            <p>go down </p>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <div style="width: 100%; margin: 20px;">
                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("username") %>'></asp:Label>
                                <asp:LinkButton runat="server" ID="btn" CommandName="SelectDay" CommandArgument="2">LinkButton</asp:LinkButton>
                            </div>
                        </ItemTemplate>

                    </asp:Repeater>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>" SelectCommand="SELECT * FROM [TblUser]"></asp:SqlDataSource>

                </ContentTemplate>

                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Repeater1" EventName="ItemCommand" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
