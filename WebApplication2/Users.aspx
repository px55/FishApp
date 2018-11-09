<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="WebApplication2.Users" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 72px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <asp:Label ID="Label_Welcome" runat="server" Text="Welcome"></asp:Label>
&nbsp;<br />
            <asp:Button ID="B_logout" runat="server" OnClick="B_logout_Click" Text="Logout" />
        </div>
    </form>
</body>
</html>
