<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Create_Forum_Project.Home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/dashboard.css" rel="stylesheet" type="text/css" />
    <link href="CSS/divlogo.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function readarticles() {
            PageMethods.ReadArticles();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="divlogo">Forum</div>
    <div class="div_header">
     Welcome : <label id="welcome" runat="server"/>     
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
    <!--
      <div class="div_post_display">
       <h2><div id="div_h1" runat="server"></div></h2>
        <p></p><div id="post_msg" runat="server"></div></p>
      </div>
      -->
      &nbsp;&nbsp; 
        <label id="lblwelcom0" runat="server"/>     
      <asp:Panel ID="div_post_display_panel" style="margin-top:-35px;" runat="server"/>
      <asp:ScriptManager runat="server" EnablePageMethods="true" ID="scrptmgr">
          </asp:ScriptManager>
    </div>
    </form>
</body>
</html>
