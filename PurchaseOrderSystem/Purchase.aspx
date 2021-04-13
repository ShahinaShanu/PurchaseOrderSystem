<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Purchase.aspx.cs" Inherits="PurchaseOrderSystem.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-right: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <div class="formContent">
        <h2>Order Details</h2>
        <table style="width: 100%;">
            <tr>
                <td>PO NO.</td>
                
                <td>
                    <asp:TextBox ID="txtPONO" runat="server"></asp:TextBox> </td>
                <td>&nbsp;</td>
                <td>PO Date</td>
                <td>
                    <asp:TextBox ID="txtDT" runat="server" TextMode="Date"></asp:TextBox></td>
                
            </tr>
            <tr>
                <td>Party name</td>
                <td>
                  <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList></td>
                <td>&nbsp;</td>
                <td>Remarks</td>
                <td>
                    <asp:TextBox ID="TxtRemark" runat="server"></asp:TextBox>

                </td></tr>
             
        </table>
        <hr />
         <h2>Order Items</h2>
        <table style="width: 100%;">
            <tr>
                <td>Item Name</td>
                <td>Details</td>
                <td>Qty</td>
                <td>Rate</td>
                <td>Amount</td>
                <td>Disc %</td>
                <td>Discount</td>
                <td>Total</td>
                <td></td>
               </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server" Width="95px" Height="48px"></asp:DropDownList></td>
                <td>
                    <asp:TextBox ID="txtDetails" runat="server" Width="109px"></asp:TextBox></td>
                <td>
                    <asp:TextBox ID="TxtQty" runat="server" Width="63px" OnTextChanged="TxtQty_TextChanged"></asp:TextBox></td>
                <td>
                    <asp:TextBox ID="txtRate" runat="server" Width="52px" OnTextChanged="txtRate_TextChanged" AutoPostBack="true"></asp:TextBox></td>
                <td>
                    <asp:TextBox ID="txtAmount" runat="server" Width="48px" OnTextChanged="txtAmount_TextChanged" ReadOnly="True" AutoPostBack="true"></asp:TextBox>  </td>
                <td>
                    <asp:TextBox ID="txtDiscPer" runat="server" Width="47px" OnTextChanged="txtDiscPer_TextChanged" AutoPostBack="true"></asp:TextBox></td>
                <td>
                    <asp:TextBox ID="txtDiscount" runat="server" Width="55px"  OnTextChanged="txtDiscount_TextChanged" AutoPostBack="true"></asp:TextBox></td>
                <td>
                    <asp:TextBox ID="txtTotal" runat="server" Width="53px" AutoPostBack="true" ReadOnly="True"></asp:TextBox></td>
                <td>
                    <asp:Button ID="BtnAdd" runat="server" Text="ADD" Height="31px" Width="58px" BackColor="#009933" Font-Bold="True" OnClick="BtnAdd_Click" /></td>

            </tr><tr><td colspan="9">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Qty upto 2 decimal places only" ControlToValidate="TxtQty" ForeColor="Red" ValidationExpression="^(-)?(([1-9]{1}\d*)|([0]{1}))(\.(\d){1,2})?$"></asp:RegularExpressionValidator>
                 </td></tr>
             
        </table>
        <hr />
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="auto-style1"  Width="432px">
                <Columns>
                    <asp:BoundField DataField="ItemID" HeaderText="Item Name" />
                    <asp:BoundField DataField="Qty" HeaderText="Quantity" />
                    <asp:BoundField DataField="Rate" HeaderText="Rate" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" />
                    <asp:BoundField DataField="DiscPer" HeaderText="Disc%" />
                    <asp:BoundField DataField="Discount" HeaderText="Discount" />
                    <asp:BoundField DataField="TotalAmt" HeaderText="Total Amount" />
                </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>

        </div>
        </div>
    </div>
</asp:Content>
