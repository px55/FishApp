<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FishMap.aspx.cs" Inherits="WebApplication2.FishMap" %>

<%@ Register Assembly="GMaps" Namespace="Subgurim.Controles" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fish Map</title>
    
    <style type="text/css">
        .auto-style1 {
            height: 93px;
            width: 433px;
        }
        .auto-style2 {
            height: 93px;
            width: 434px;
        }
        td { 
            padding: 10px;
        }
        
    </style>
    
</head>
<body>
    
    <form id="form1" runat="server">
        <table>
            <tr>
                <td><a href="Index.aspx">[ Store ]</a></td>
                <td><a href="default.aspx">[ Forum ]</a></td>
            </tr>
        </table>
        <%--<div class="auto-style2">
             <asp:LinkButton ID="StoreButton" runat="server" Text="Store" OnClick="StoreButton_Click">
            </asp:LinkButton>
        </div>
        <div class="auto-style1">
             <asp:LinkButton ID="ForumButton" runat="server" Text="Forum" OnClick="Forum_Click">
            </asp:LinkButton>
        </div>--%>
        
        <div>
            <cc1:GMap ID="GMap1" runat="server" Width="1280px" Height="920px" />
            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBSNo1MsVaHd9BSILjCPQBLs9XtXzQDGmA&callback=initMap"
            async defer></script>
        </div>
    </form>
</body>
</html>
