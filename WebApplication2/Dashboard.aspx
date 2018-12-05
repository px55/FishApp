<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Create_Forum_Project.Dashboard" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/dashboard.css" rel="stylesheet" type="text/css" />
    <link href="CSS/divlogo.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="divlogo">Fish HookUp Forum</div>
    <div class="div_header">
     Welcome : <label id="lblwelcom" runat="server"/>     
    </div>
    
      <div id="div_dashboard_box" class="div_dashboard" runat="server" visible="false">
     <table>
      <tr>
       <th>Dashboard</th>
      </tr>
      <tr>
       <td><a href="Default.aspx">Home Page</a></td>
      </tr>
      <tr>
       <td><a href="Dashboard.aspx">Post Articles</a></td>
      </tr>
      <tr>
       <td><a href="Home.aspx">Your Articles</a></td>
      </tr>
      <tr>
       <td><a href="FishM.aspx">Back to Map</a></td>
      </tr>
         <tr>
       <td><asp:LinkButton ID="LogOut_Button" runat="server" Text="Log Out" PostBackUrl="~/Login.aspx" OnClick="LogOut_Click">
            </asp:LinkButton></td>
      </tr>
     </table>
    </div>
    <div id="div_table">
     <table>
      <tr>
       <td>Title : </td>
       <td>
           <asp:TextBox ID="txtposttitle" CssClass="txt" runat="server" Width="500px"></asp:TextBox></td>
      </tr>
      <tr>
       <td colspan="2"></td>
      </tr>
      <tr>
       <td colspan="2">
           <textarea id="txtpostmessage" cols="68" rows="15" runat="server"></textarea>
       </td>
      </tr>
      <tr>
       <td>
           <asp:Button ID="BtnPost" runat="server" Text="Post" onclick="BtnPost_Click" /></td>
      </tr>
     </table>
    </div>
    </form>
</body>
</html>
