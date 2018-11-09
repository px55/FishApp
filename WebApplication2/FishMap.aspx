<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FishMap.aspx.cs" Inherits="WebApplication2.FishMap" %>

<%@ Register Assembly="GMaps" Namespace="Subgurim.Controles" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fish Map</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <cc1:GMap ID="GMap1" runat="server" Width="800px" Height="500px" />
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBSNo1MsVaHd9BSILjCPQBLs9XtXzQDGmA&callback=initMap"
                async defer></script>
        </div>
    </form>
</body>
</html>
