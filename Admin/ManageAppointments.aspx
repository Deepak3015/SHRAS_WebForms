<%@ Page Title="Manage Appointments" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageAppointments.aspx.cs" Inherits="SHRAS_WebForms.Admin.ManageAppointments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/AdminAppointments.css" rel="stylesheet" />

    <div class="appointments-container">
        <h2>Manage Appointments</h2>
        <p class="subtext">View and manage all scheduled appointments.</p>

        <asp:GridView ID="GridViewAppointments" runat="server" AutoGenerateColumns="False" DataKeyNames="AppointmentID" CssClass="appointment-grid" OnRowDeleting="GridViewAppointments_RowDeleting">
            <Columns>
                <asp:BoundField DataField="AppointmentID" HeaderText="ID" />
                <asp:BoundField DataField="DoctorName" HeaderText="Doctor" />
                <asp:BoundField DataField="PatientName" HeaderText="Patient" />
                <asp:BoundField DataField="AppointmentDate" HeaderText="Date" DataFormatString="{0:dd-MM-yyyy}" />
                <asp:BoundField DataField="AppointmentTime" HeaderText="Time" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                <asp:CommandField ShowDeleteButton="True" DeleteText="Cancel" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
