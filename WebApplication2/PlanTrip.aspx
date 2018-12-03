<%@ Page Title="" Language="C#" MasterPageFile="~/FishStore.Master" AutoEventWireup="true" CodeBehind="PlanTrip.aspx.cs" Inherits="WebApplication2.WebForm8" %>
<%@ Register assembly="GMaps" namespace="Subgurim.Controles" tagprefix="cc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>  Plan A Trip </title>

     <style>
        .roundedcorner
        {
            font-size: 11pt;
            margin-left:auto;
            margin-right:auto;
            margin-top:1px;
            margin-bottom:1px;
            padding:3px;
            border-top: 1px solid; 
            border-left: 1px solid;  
            border-right:1px solid; 
            border-bottom:1px solid;
            -moz-border-radius: 8px;
            -webkit-border-radius: 8px;
        }

        .background
        {
            background-color: black; 
            filter: alpha(opacity = 90);
            opacity: 0.8; 

        }

        .popup
        {
            background-color: white;
            border-width: 3px;
            border-style:solid; 
            border-color: black; 
            padding-top: 10px; 
            padding-left: 10px;
            width: 400px; 
            height:150px;   
        }

        .auto-style1 {
            height: 79px;
            width: 363px;
        }

        .auto-style2 {
            width: 363px;
        }

        

    </style>




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:125px;margin-left:auto;margin-right:auto;margin-top:50px;">
        <p>Pick A Location:</p>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Loc_Name" DataValueField="Loc_ID" Height="41px" Width="111px">
</asp:DropDownList>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PlanConnectionString %>" SelectCommand="SELECT * FROM [LocData]"></asp:SqlDataSource>
        
    </div>

      <div style="width:100px;margin-left:auto;margin-right:auto;margin-top:50px;margin-bottom:20px;">
           <p>Select A Date:</p>
          </div>



<asp:SqlDataSource ID="PlanLoc" runat="server" ConnectionString="<%$ ConnectionStrings:PlanConnectionString %>" SelectCommand="SELECT * FROM [LocData]"></asp:SqlDataSource>
    <div style="width:200px;margin-left:auto;margin-right:auto;margin-top:50px;"><asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
        <NextPrevStyle VerticalAlign="Bottom" />
        <OtherMonthDayStyle ForeColor="#808080" />
        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
        <SelectorStyle BackColor="#CCCCCC" />
        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
        <WeekendDayStyle BackColor="#FFFFCC" />
    </asp:Calendar></div>
    <div style="width:40px;margin-left:auto;margin-right:auto;margin-top:50px;">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
    <br /> 
   <asp:Button ID="Button1" runat="server" CssClass="roundedcorner" Font-Size="Larger" Text="Submit!" />
    <br />
   <br /> 
   <asp:Panel ID="Panel1" CssClass="popup roundedcorner" runat="server">
         <table>
              <tr>
               <td class="auto-style2">
                    <p>
                        An Email Reminder has been sent!
                    </p>

                 </tr>
                 
                 <tr>
                     <td class="auto-style2">
                          <div style="width:50px;margin-left:auto;margin-right:auto;margin-top:50px;">
                          <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" Width="60px" />
                              </div>
                     </td>

                 </tr>

             </table>
         </asp:Panel>
         <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" TargetControlId="Button1" PopupControlID="Panel1" BackgroundCssClass="background" runat="server"></ajaxToolkit:ModalPopupExtender>
     </div>
    
    </div>
</asp:Content>