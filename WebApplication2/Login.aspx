<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication2.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> FishApp </title>
    <link href="CSS/Loginx.css" rel="Stylesheet" type="text/css" />

    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            width: 47px;
        }
        .auto-style4 {
            width: 47px;
            text-align: left;
        }
        .auto-style5 {
            width: 190px;
        }
        .auto-style6 {
            font-size: large;
        }
        .auto-style7 {
            width: 47px;
            text-align: left;
            font-size: large;
        }
        .auto-style8 {
            font-size: larger;
        }
    </style>

    <p class="invis" id="demo"></p>
    <script>
        var x = document.getElementById("demo");

        function getLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition);
            } else { 
                x.innerHTML = "Geolocation is not supported by this browser.";
            }
        }

        function showPosition(position) {
            x.innerHTML = "Latitude: " + position.coords.latitude + 
                "<br>Longitude: " + position.coords.longitude;

            var lat = position.coords.latitude;
            var long = position.coords.longitude;

            document.getElementById("lat").value = lat;
            document.getElementById("longs").value = long;
        }

        getLocation();

    </script>

</head>
<body>

    <form id="form1" runat="server">
        <input type="hidden" id="lat" value="" runat="server"/>
        <input type="hidden" id="longs"  value="" runat="server" />
        <div class="auto-style8">

            <strong>LOGIN</strong></div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style7">Username:</td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBoxUsername" runat="server" Width="180px" Height="24px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxUsername" ErrorMessage="Requires Username" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4"><span class="auto-style6">Password</span>:</td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" Width="180px" Height="25px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="Requires Password" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">
                    <asp:Button ID="Button_Login" runat="server" OnClick="Button_Login_Click" Text="Login" Width="81px" Height="38px" />
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" OnClick="Button1_Click" Text="Guest" Width="67px" Height="38px" PostBackUrl="~/Index.aspx" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Registration.aspx" CssClass="auto-style6">New User Register</asp:HyperLink>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
