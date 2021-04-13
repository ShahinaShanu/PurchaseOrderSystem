<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="PurchaseOrderSystem.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
<div class="container">
    <div class="center">
     <asp:Button ID="BtnPurchase" runat="server" Text="Purchase order" OnClick="BtnPurchase_Click" BackColor="#009999" BorderStyle="Solid" ForeColor="White" Height="50px" Width="230px" Font-Bold="True" />
        </div>
    </div>
</asp:Content>
