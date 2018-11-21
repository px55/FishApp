<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StoreMain.aspx.cs" Inherits="WebApplication2.StoreMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 52px;
            width: 1148px;
        }
        .checkout {
            float: right;
            padding: 25px;
        }
        .home {
            float:right;
            padding: 25px;
        }
        #Text1 {
            height: 22px;
            width: 275px;
        }
    </style>
    </head>
    <body style="height: 708px">
    <form id="form1" runat="server">
        <div>
            <div class="home">
                <asp:LinkButton ID="HomeButton" runat="server" 
                Text="Home" OnClick="HomeButton_Click"></asp:LinkButton> 
            </div>
            <div class="checkout"><asp:LinkButton ID="CheckOutButton" runat="server" 
                Text="CheckOut" OnClick="CheckOutButton_Click"></asp:LinkButton>
                </div>
            <h1 style="width: 315px"> Fish HookUp Store</h1>
       </div>

        
     

        
        <div>
        </div>
    
        <div style="height: 35px">

            <input id="Text1" type="text" /></div>
            <asp:Button ID="Search" runat="server" OnClick="SearchButton_Click" Text="search" Width="75px" Height="25px" />

    </form>
    </body>
</html>
