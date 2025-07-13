<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManagePatients.aspx.cs" Inherits="SHRAS_WebForms.Admin.ManagePatients_aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Manage Patients</h2>
    <asp:GridView ID="GridViewPatients" runat="server" AutoGenerateColumns="False" DataKeyNames="PatientID" OnRowDeleting="GridViewPatients_RowDeleting">
        <Columns>
            <asp:BoundField DataField="PatientID" HeaderText="ID" />
            <asp:BoundField DataField="FullName" HeaderText="Name" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>
