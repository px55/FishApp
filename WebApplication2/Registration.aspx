<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="WebApplication2.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 269px;
        }
        .auto-style3 {
            width: 269px;
            height: 23px;
            text-align: right;
        }
        .auto-style4 {
            height: 23px;
        }
        .auto-style5 {
            width: 269px;
            text-align: right;
        }
        .auto-style6 {
            width: 269px;
            height: 23px;
        }
        .auto-style7 {
            width: 154px;
        }
        .auto-style8 {
            height: 23px;
            width: 154px;
        }
        .auto-style9 {
            height: 23px;
            text-align: left;
        }
        .auto-style10 {
            text-align: left;
        }
        .auto-style11 {
            color: #FF0000;
        }
        .auto-style12 {
            width: 57px;
        }
        .auto-style13 {
            height: 23px;
            width: 154px;
            text-align: center;
        }
        .auto-style14 {
            width: 154px;
            text-align: left;
        }
    </style>
</head>
<body>
    <h1> Registration Page</h1>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style5" id="UserName">Username:</td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBoxUN" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style10">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxUN" CssClass="auto-style11" ErrorMessage="User Name is required"></asp:RequiredFieldValidator>
                </td>
            </tr>
             <%--<tr>
                <td class="auto-style5" id="FirstName">First Name:</td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBoxFirst" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style10">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBoxFirst" CssClass="auto-style11" ErrorMessage="First Name is required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5" id="LastName">Last Name:</td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBoxLast" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style10">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBoxLast" CssClass="auto-style11" ErrorMessage="Last Name is required"></asp:RequiredFieldValidator>
                </td>
            </tr>--%>
            <tr>
                <td class="auto-style3" id="Email">E-mail:</td>
                <td class="auto-style8">
                    <asp:TextBox ID="TextBoxEmail" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style9">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxEmail" CssClass="auto-style11" ErrorMessage="E-mail is required"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Must be a valid email form" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5" id="Password">Password:</td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBoxPass" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style10">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxPass" CssClass="auto-style11" ErrorMessage="Password is required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Confirm Password:</td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBoxRPass" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style10">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxRPass" CssClass="auto-style11" ErrorMessage="Confirm Password is required"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxPass" ControlToValidate="TextBoxRPass" ErrorMessage="Both password must be the same" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
           
            <tr>
                <td class="auto-style3" id="Country">Country</td>
                <td class="auto-style8">
                    <asp:DropDownList ID="DropDownListCountry" runat="server" Width="190px">
                        <asp:ListItem>Select Country</asp:ListItem>
                        <asp:ListItem>USA</asp:ListItem>
                        <asp:ListItem>UK</asp:ListItem>
                        <asp:ListItem>Germany</asp:ListItem>
                        <asp:ListItem>China</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style9">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownListCountry" CssClass="auto-style11" ErrorMessage="Select a country name" InitialValue="Select Country"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style14">
                    &nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
                    <input id="Reset1" class="auto-style12" type="reset" value="reset" /></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6"></td>
                <td class="auto-style13">
                    <asp:Button ID="Button_Cancel" runat="server" CausesValidation="False" OnClick="Button_Cancel_Click" Text="Cancel" Width="59px" />
                </td>
                <td class="auto-style4"></td>
            </tr>
        </table>
    </form>
</body>
</html>
