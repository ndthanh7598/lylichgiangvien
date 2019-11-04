<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/App.Master" AutoEventWireup="true" CodeBehind="Thongkebaocao.aspx.cs" Inherits="LyLichGiangVien.View.Thongkebaocao" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form id="formbaocao" runat="server">
    <div>  <asp:Button ID="Button1" runat="server" Text="Bao Cao" /></div>
    <div> <CR:CrystalReportViewer ID="crvr1" runat="server" AutoDataBind="true" /></div>
   
    <asp:CheckBox ID="CheckBox1" runat="server" />
    </form>
 
</asp:Content>
