<%@ Page Title="Book Appointment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookAppointment.aspx.cs" Inherits="SHRAS_WebForms.Patient.BookAppointment" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .form-container {
            max-width: 500px;
            margin: 40px auto;
            padding: 30px;
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .btn {
            width: 100%;
        }
    </style>

    <div class="form-container">
        <h2>Book an Appointment</h2>

        <div class="form-group">
            <label for="ddlDoctors">Select Doctor</label>
            <asp:DropDownList ID="ddlDoctors" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <label for="txtAppointmentDate">Appointment Date</label>
            <asp:TextBox ID="txtAppointmentDate" runat="server" CssClass="form-control" TextMode="Date" />
        </div>

        <div class="form-group">
            <label for="txtAppointmentTime">Appointment Time</label>
            <asp:TextBox ID="txtAppointmentTime" runat="server" CssClass="form-control" TextMode="Time" />
        </div>

        <div class="form-group">
            <asp:Button ID="btnBook" runat="server" Text="Book Appointment" CssClass="btn btn-primary" OnClick="btnBook_Click" />
        </div>

        <asp:Label ID="lblMessage" runat="server" CssClass="text-success" />
    </div>
</asp:Content>
