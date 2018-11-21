<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FishMap.aspx.cs" Inherits="WebApplication2.FishMap" %>

<%@ Register Assembly="GMaps" Namespace="Subgurim.Controles" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fish Map</title>
    
</head>
<body>
    
    <form id="form1" runat="server">
        <div style="height: 42px">
             <asp:LinkButton ID="StoreButton" runat="server" Text="Store" OnClick="StoreButton_Click">
            </asp:LinkButton>
            &nbsp
            <asp:LinkButton ID="LinkButton1" runat="server" Text="Plan A Trip" OnClick="PlanTrip_Click">
            </asp:LinkButton>
        </div>
        <div>
            <cc1:GMap ID="GMap1" runat="server" Width="1280px" Height="920px" />
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBSNo1MsVaHd9BSILjCPQBLs9XtXzQDGmA&callback=initMap"
            async defer></script>
        </div>
    </form>
</body>
</html>
