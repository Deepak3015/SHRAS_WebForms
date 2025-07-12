<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookAppointment.aspx.cs" Inherits="SHRAS_WebForms.Patient.BookAppointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Book an Appointment</h2>

    <asp:Label ID="lblDoctor" runat="server" Text="Select Doctor: " />
    <asp:DropDownList ID="ddlDoctors" runat="server" AutoPostBack="false"></asp:DropDownList>
    <br /><br />

    <asp:Label ID="lblDate" runat="server" Text="Select Date: " />
    <asp:TextBox ID="txtDate" runat="server" TextMode="Date" />
    <br /><br />

    <asp:Label ID="lblTime" runat="server" Text="Select Time: " />
    <asp:TextBox ID="txtTime" runat="server" TextMode="Time" />
    <br /><br />

    <asp:Button ID="btnBook" runat="server" Text="Book Appointment" OnClick="btnBook_Click" />
    <br /><br />

    <asp:Label ID="lblMessage" runat="server" ForeColor="Green" />
</asp:Content>
