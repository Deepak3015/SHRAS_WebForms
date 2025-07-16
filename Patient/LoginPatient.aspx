<%@ Page Title="Patient Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginPatient.aspx.cs" Inherits="SHRAS_WebForms.Patient.LoginPatient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/LoginPatient.css" rel="stylesheet" />

    <div class="login-container">
        <h2>Patient Login</h2>

        <div class="form-group">
            <label>Email</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="input-box" />
        </div>

        <div class="form-group">
            <label>Password</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input-box" />
        </div>

        <asp:Label ID="lblMessage" runat="server" CssClass="error-message" />

        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
    </div>
</asp:Content>
