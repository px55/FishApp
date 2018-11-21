<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanTrip.aspx.cs" Inherits="WebApplication2.PlanTrip" %>
<%@ Register Assembly="GMaps" Namespace="Subgurim.Controles" TagPrefix="cc1" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form2" runat="server">
        <div>
            <cc1:GMap ID="GMap2" runat="server" Width="1280px" Height="920px" />
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBSNo1MsVaHd9BSILjCPQBLs9XtXzQDGmA&callback=initMap"
            async defer></script>
        </div>
    </form>
</body>
</html>
