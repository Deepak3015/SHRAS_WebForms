<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageDoctors.aspx.cs" Inherits="SHRAS_WebForms.Admin.ManageDoctors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h2>Manage Doctors</h2>

    <asp:GridView ID="GridViewDoctors" runat="server" AutoGenerateColumns="False" DataKeyNames="DoctorID" OnRowDeleting="GridViewDoctors_RowDeleting">
        <Columns>
            <asp:BoundField DataField="DoctorID" HeaderText="ID" />
            <asp:BoundField DataField="FullName" HeaderText="Name" />
            <asp:BoundField DataField="Specialization" HeaderText="Specialty" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>

    <h3>Add New Doctor</h3>
    <asp:TextBox ID="txtName" runat="server" placeholder="FullName"></asp:TextBox><br />
    <asp:TextBox ID="txtSpecialty" runat="server" placeholder="Specialization"></asp:TextBox><br />
    <asp:TextBox ID="txtEmail" runat="server" placeholder="Email"></asp:TextBox><br />
    <asp:TextBox ID="txtPhone" runat="server" placeholder="Phone"></asp:TextBox><br />
    <asp:Button ID="btnAddDoctor" runat="server" Text="Add Doctor" OnClick="btnAddDoctor_Click" /><br />

    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
</asp:Content>
