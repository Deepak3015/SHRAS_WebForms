<%@ Page Title="Doctor Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DoctorDashboard.aspx.cs" Inherits="SHRAS_WebForms.Doctor.DoctorDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<asp:Label ID="lblWelcome" runat="server" Text="Welcome, Doctor" Font-Size="X-Large" />
<hr />
<asp:GridView ID="gvAppointments" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered">
    <Columns>
        <asp:BoundField DataField="AppointmentID" HeaderText="ID" />
        <asp:BoundField DataField="PatientName" HeaderText="Patient" />
        <asp:BoundField DataField="AppointmentDate" HeaderText="Date" DataFormatString="{0:dd-MM-yyyy}" />
        <asp:BoundField DataField="AppointmentTime" HeaderText="Time" />
        <asp:BoundField DataField="Status" HeaderText="Status" />
    </Columns>
</asp:GridView>
</asp:Content>
