<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageAppointments.aspx.cs" Inherits="SHRAS_WebForms.Admin.ManageAppointments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <h2>Manage Appointments</h2>
    <asp:GridView ID="GridViewAppointments" runat="server" AutoGenerateColumns="False" DataKeyNames="AppointmentID" OnRowDeleting="GridViewAppointments_RowDeleting">
        <Columns>
            <asp:BoundField DataField="AppointmentID" HeaderText="ID" />
            <asp:BoundField DataField="DoctorName" HeaderText="Doctor" />
            <asp:BoundField DataField="PatientName" HeaderText="Patient" />
            <asp:BoundField DataField="AppointmentDate" HeaderText="Date" />
            <asp:BoundField DataField="AppointmentTime" HeaderText="Time" />
            <asp:BoundField DataField="Status" HeaderText="Status" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>
