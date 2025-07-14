<%@ Page Title="Doctor Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DoctorDashboard.aspx.cs" Inherits="SHRAS_WebForms.Doctor.DoctorDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/DoctorDashboard.css" rel="stylesheet" />

    <h2 class="dashboard-title">Doctor Dashboard</h2>
    <p class="subtitle">View your upcoming appointments below.</p>

    <div class="welcome-message">
        <asp:Label ID="lblWelcome" runat="server" CssClass="welcome-label" />
    </div>

    <asp:GridView ID="gvAppointments" runat="server" AutoGenerateColumns="False" CssClass="gridview">
        <Columns>
            <asp:BoundField DataField="AppointmentID" HeaderText="ID" />
            <asp:BoundField DataField="PatientName" HeaderText="Patient" />
            <asp:BoundField DataField="AppointmentDate" HeaderText="Date" DataFormatString="{0:dd-MM-yyyy}" />
            <asp:BoundField DataField="AppointmentTime" HeaderText="Time" />
            <asp:BoundField DataField="Status" HeaderText="Status" />
        </Columns>
    </asp:GridView>

</asp:Content>
