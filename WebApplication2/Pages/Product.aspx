<%@ Page Title="" Language="C#" MasterPageFile="~/FishStore.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="WebApplication2.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td rowspan="4">
                <asp:Image ID="imgProduct" runat="server" CssClass="detailsImage"/></td>
            <td><h2>
                <asp:Label ID="lblTitle" runat="server"></asp:Label>
                <hr/>
                </h2></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblDescription" runat="server" CssClass="detailsDescription"></asp:Label></td>
            <td>
                <asp:Label ID="lblPrice" runat="server" CssClass="detailsPrice"></asp:Label></td><br />
                Quantity :
            <asp:DropDownList ID="ddlAmount" runat="server"></asp:DropDownList><br />
            <asp:Label ID="lblResult" runat="server"></asp:Label>
        </tr>
        <tr>
            <td>Product NO: <asp:Label ID="lblItemNr" runat="server"></asp:Label>
                <asp:Button ID="btnAdd" runat="server" OnClick="Button2_Click" Text="Add Product" CssClass="button" />
            </td>

        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Available" CssClass="productPrice"></asp:Label></td>

        </tr>
    </table>
</asp:Content>
