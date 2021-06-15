<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_EditTemp.aspx.cs" Inherits="Supplier_Record_Management.FormEdit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        .roundedcorner
        {
            font-size:11pt;
            margin-left:auto;
            margin-right:auto;
            margin-top:1px;
           margin-bottom:1px;
           padding:3px;
           border-top:1px solid;
            border-left:1px solid;
             border-right:1px solid;
              border-bottom:1px solid;
              -moz-border-radius:8px;
              -webkit-border-radius:8px;
        }
        .background {
            background-color:black;
            filter: alpha(opacity=90);
            opacity:0.8;
        }
        .popup {
            background-color:rebeccapurple;
            border-width:3px;
            border-style:solid;
             border-color:black;
             padding-top:10px;
             padding-left:10px;
             width:400px;
             height:300px;
        }
    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            <br />
            <asp:Button ID="Button1" runat="server" CssClass="roundedcorner" Font-Size="Larger"  Text="click here to open form" />
            <br />
            <br />
            <asp:Panel ID="Panel1" CssClass="popup roundedcorner" runat="server">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Font-Size="Larger" Text="First Name:"></asp:Label>
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TextBox1" Font-Size="Larger" TextMode="SingleLine" runat ="server"></asp:TextBox>
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Font-Size="Larger" Text="Address:"></asp:Label>
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TextBox2" Font-Size="Larger" TextMode="SingleLine" runat ="server"></asp:TextBox>
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Font-Size="Larger" Text="phone number:"></asp:Label>
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TextBox3" Font-Size="Larger" TextMode="SingleLine" runat ="server"></asp:TextBox>
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Font-Size="Larger" Text="email:"></asp:Label>
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TextBox4" Font-Size="Larger" TextMode="SingleLine" runat ="server"></asp:TextBox>
                            <br />
                            <br />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <cc1:ModalPopupExtender ID="ModalPopupExtender1" TargetControlID="Button1" PopupControlID="Panel1" BackgroundCssClass="background" runat="server"></cc1:ModalPopupExtender>
        </div>
    </form>
</body>
</html>