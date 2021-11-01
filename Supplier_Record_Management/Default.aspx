
<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Supplier_Record_Management._Default" EnableEventValidation = "false"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;</p>
    <h2>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Supplier Records </h2>
    <p>
        &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="XmlDataSource1" AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="478px" Width="812px" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellSpacing="3">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <RowStyle HorizontalAlign="Center" ></RowStyle>
            <Columns>
                <asp:TemplateField HeaderText="No." HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"/>
                <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company"/>
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"  />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/Supplier_Record.xml" TransformFile="~/transform.xslt"></asp:XmlDataSource>
      
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:supplier_recordsConnectionString %>" DeleteCommand="DeleteSupplier" DeleteCommandType="StoredProcedure" InsertCommand="InsertSupplier" InsertCommandType="StoredProcedure" SelectCommand="SelectSupplier" SelectCommandType="StoredProcedure" UpdateCommand="UpdateSupplier" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="Name" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Company" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Mobile" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Company" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Mobile" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
      
    </p>
      
    
        <div>
             

         
             

            <br />
           
            <br />
            <br />
           

             

                </div>

    <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>


            <asp:Panel ID="Panel1" CssClass="popup" runat="server" Height="431px" BackColor="White" BorderStyle="Solid" Font-Bold="True" Font-Italic="False" ForeColor="Black" Width="553px">

        <div class="container">

            <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fill Supplier Details</h2>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="ajxtb_name" runat="server" Height="27px" Width="151px" BackColor="#CCFF66"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ajxtb_name" Display="Dynamic" ErrorMessage="Name is Required" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Company"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="ajxtb_company" runat="server" Height="27px" Width="151px" BackColor="#CCFF66"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ajxtb_company" Display="Dynamic" ErrorMessage="Company is Required" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="ajxtb_email" runat="server" Height="27px" Width="151px" BackColor="#CCFF66"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="ajxtb_email" Display="Dynamic" ErrorMessage="Invalid Email Id" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Address"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="ajxtb_address" runat="server" Height="27px" Width="151px" BackColor="#CCFF66"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ajxtb_address" Display="Dynamic" ErrorMessage="Address is Required" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Mobile"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="ajxtb_mobile" runat="server" Height="27px" Width="151px" BackColor="#CCFF66"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="ajxtb_mobile" ErrorMessage="Invalid Mobile Number" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
            <br />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_save" runat="server" BackColor="#00FF99" Text="Save" Width="86px" OnClick="btn_save_Click" />
&nbsp;&nbsp;
            <asp:Button ID="btn_cancel" runat="server" BackColor="#00FF99" Text="Cancel" Width="86px" OnClick="btn_cancel_Click" />
            <br />
            <br />

        </div>
              
                 <cc1:ModalPopupExtender ID="ModalPopupExtender1" TargetControlID="lnkDummy" PopupControlID="Panel1" BackgroundCssClass="background" runat="server"></cc1:ModalPopupExtender>
     
                </asp:Panel>
  













    <p>
        &nbsp;</p>
    
    
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
        
    </p>
    <p>
    </p>
    <p>
    </p>

</asp:Content>
