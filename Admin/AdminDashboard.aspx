<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="SHRAS_WebForms.Admin.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <h2>Welcome, Admin!</h2>

    <asp:Button ID="btnViewDoctors" runat="server" Text="Manage Doctors" OnClick="btnViewDoctors_Click" />
    <asp:Button ID="btnViewPatients" runat="server" Text="Manage Patients" OnClick="btnViewPatients_Click" />
    <asp:Button ID="btnViewAppointments" runat="server" Text="View Appointments" OnClick="btnViewAppointments_Click" />
    <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />

</asp:Content>
