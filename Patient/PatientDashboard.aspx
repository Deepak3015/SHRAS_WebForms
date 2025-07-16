<%@ Page Title="Patient Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PatientDashboard.aspx.cs" Inherits="SHRAS_WebForms.Patient.Patient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/PatientDashboard.css" rel="stylesheet" />

    <div class="dashboard-container">
        <h2>Welcome, <asp:Label ID="lblPatientName" runat="server" /></h2>
        
        <hr />

        <p>
            <asp:HyperLink ID="lnkBookAppointment" runat="server" NavigateUrl="BookAppointment.aspx" CssClass="btn btn-primary">
                Book a New Appointment
            </asp:HyperLink>
        </p>

        <h4>Your Appointments</h4>
        <asp:GridView ID="gvAppointments" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField HeaderText="Doctor" DataField="DoctorName" />
                <asp:BoundField HeaderText="Specialization" DataField="Specialization" />
                <asp:BoundField HeaderText="Date" DataField="AppointmentDate" />
                <asp:BoundField HeaderText="Time" DataField="AppointmentTime" />
                <asp:BoundField HeaderText="Status" DataField="Status" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
