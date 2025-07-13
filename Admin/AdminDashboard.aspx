<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="SHRAS_WebForms.Admin.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/AdminDashboard.css" rel="stylesheet" />

    <div class="dashboard-container">
        <h2>Welcome, Admin!</h2>
        <p class="subtext">Manage hospital operations smoothly and efficiently.</p>

        <div class="card-grid">
            <div class="card">
                <h4>Doctors</h4>
                <p>Manage and update doctor profiles.</p>
                <asp:Button ID="btnViewDoctors" runat="server" Text="Manage Doctors" CssClass="btn-primary" OnClick="btnViewDoctors_Click" />
            </div>

            <div class="card">
                <h4>Patients</h4>
                <p>View and update patient information.</p>
                <asp:Button ID="btnViewPatients" runat="server" Text="Manage Patients" CssClass="btn-primary" OnClick="btnViewPatients_Click" />
            </div>

            <div class="card">
                <h4>Appointments</h4>
                <p>Monitor and control appointments.</p>
                <asp:Button ID="btnViewAppointments" runat="server" Text="View Appointments" CssClass="btn-primary" OnClick="btnViewAppointments_Click" />
            </div>
        </div>

        <div class="logout-section">
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn-logout" OnClick="btnLogout_Click" />
        </div>
    </div>

</asp:Content>
