<%@ Page Title="" Language="C#" MasterPageFile="~/FishStore.Master" AutoEventWireup="true" CodeBehind="FishM.aspx.cs" Inherits="WebApplication2.WebForm7" %>
<%@ Register assembly="GMaps" namespace="Subgurim.Controles" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <cc1:GMap ID="GMap1" runat="server" Width="1050px" Height="500px" />
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBSNo1MsVaHd9BSILjCPQBLs9XtXzQDGmA&callback=initMap"
            async defer></script>
</asp:Content>
