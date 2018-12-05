<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Create_Forum_Project.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="CSS/dashboard.css" rel="stylesheet" type="text/css" />
    <link href="CSS/divlogo.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="divlogo">Forum</div>
     <div id="divwelcome" runat="server" class="div_header" visible="false">
     Welcome : <label id="lblwelcom" runat="server"/>     
    </div>
    
    <div class="div_log_reg_ribbon" id="div_log_reg_ribbon" runat="server">
    <table>
      
     </table>
    </div>
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
    <div>
    <asp:Panel ID="div_post_display_panel" style="margin-top:-15px;" runat="server"/>
    </div>
    </form>
</body>
</html>
