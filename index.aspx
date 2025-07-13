<%@ Page Title="Smart Health Record & Appointment System" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="SHRAS_WebForms.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="Content/home.css" rel="stylesheet" />

    <div class="hero-section">
        <h1>Smart Health Record & Appointment System</h1>
        <p>Manage Appointments, Health Records, and Access Healthcare Seamlessly.</p>

        <div class="home-buttons">
            <asp:Button ID="btnDoctor" runat="server" Text="Doctor Login" CssClass="home-btn" OnClick="btnDoctor_Click" />
            <asp:Button ID="btnPatient" runat="server" Text="Patient Login" CssClass="home-btn" OnClick="btnPatient_Click" />
        </div>
    </div>

    <div class="info-section">
        <h2>Why SHRAS?</h2>
        <p>Our system helps bridge the gap between patients, doctors, and administrators.</p>

        <ul>
            <li><strong>Secure Health Records:</strong> Manage medical history securely.</li>
            <li><strong>Online Appointments:</strong> Book, manage, and track appointments easily.</li>
            <li><strong>Doctor-Patient Communication:</strong> Stay connected and informed.</li>
            <li><strong>Admin Control:</strong> Manage doctors, patients, and system settings from a single panel.</li>
        </ul>
    </div>

    <div class="facts-section">
        <h2>Health Facts & Insights</h2>
        <p>🩺 <strong>Did you know?</strong> Digital health records reduce medical errors by up to 50%.</p>
        <p>🌐 Telemedicine is expected to be a $460 billion industry by 2030.</p>
        <p>💊 Early diagnosis through digital systems increases treatment success by 30%.</p>
    </div>

</asp:Content>
