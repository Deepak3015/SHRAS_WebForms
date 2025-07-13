<%@ Page Title="Smart Health Record & Appointment System" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="SHRAS_WebForms.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="Content/home.css" rel="stylesheet" />

    <div class="hero-section">
        <div class="hero-content">
            <h1>Smart Health Record & Appointment System</h1>
            <p>Streamline Your Healthcare Experience Effortlessly</p>
            <div class="hero-buttons">
                <asp:Button ID="btnDoctor" runat="server" Text="Doctor Login" CssClass="hero-btn doctor" OnClick="btnDoctor_Click" />
                <asp:Button ID="btnPatient" runat="server" Text="Patient Login" CssClass="hero-btn patient" OnClick="btnPatient_Click" />
            </div>
        </div>
    </div>

    <div class="features-section">
        <h2>Why SHRAS?</h2>
        <div class="features-container">
            <div class="feature-card">
                <h3>Secure Health Records</h3>
                <p>Protect and manage your medical history with advanced security.</p>
            </div>
            <div class="feature-card">
                <h3>Online Appointments</h3>
                <p>Book, track, and manage appointments with ease.</p>
            </div>
            <div class="feature-card">
                <h3>Doctor Communication</h3>
                <p>Stay connected with your healthcare providers.</p>
            </div>
            <div class="feature-card">
                <h3>Admin Management</h3>
                <p>Centralized control for users and settings.</p>
            </div>
        </div>
    </div>

    <div class="insights-section">
        <h2>Health Insights</h2>
        <div class="insights-container">
            <div class="insight-card">
                <p>🩺 Digital records cut errors by 50%.</p>
            </div>
            <div class="insight-card">
                <p>🌐 Telemedicine to reach $460B by 2030.</p>
            </div>
            <div class="insight-card">
                <p>💊 Early diagnosis boosts success by 30%.</p>
            </div>
        </div>
    </div>

    <footer class="footer">
        <p>&copy; 2025 - SHRAS | All Rights Reserved</p>
    </footer>

</asp:Content>