<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="WebApplication2.Users" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/user.css" rel="Stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            height: 72px;
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

    <input type="hidden" id="lat" value="" runat="server"/>
    <input type="hidden" id="longs"  value="" runat="server" />

    <form id="form1" runat="server">
        <div class="auto-style1">
            <asp:Label ID="Label_Welcome" runat="server" Text="Welcome :"></asp:Label>
&nbsp;<br />
            <asp:Button ID="B_logout" runat="server" OnClick="B_logout_Click" Text="Logout" />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Show Map" />
        </div>
    </form>
</body>
</html>
