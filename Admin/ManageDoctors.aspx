<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageDoctors.aspx.cs" Inherits="SHRAS_WebForms.Admin.ManageDoctors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/ManageDoctors.css" rel="stylesheet" />

    <h2 class="page-title">Manage Doctors</h2>
    <p class="subtitle">View, add, or remove doctors from the system.</p>

    <div class="grid-container">
        <asp:GridView ID="GridViewDoctors" runat="server" CssClass="gridview" AutoGenerateColumns="False" DataKeyNames="DoctorID" OnRowDeleting="GridViewDoctors_RowDeleting">
            <Columns>
                <asp:BoundField DataField="DoctorID" HeaderText="ID" />
                <asp:BoundField DataField="FullName" HeaderText="Name" />
                <asp:BoundField DataField="Specialization" HeaderText="Specialty" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" CssClass="delete-button" OnClientClick="return confirm('Are you sure you want to delete this doctor?');" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <div class="doctor-form">
        <h3 style="text-align:center; color:#2980b9;">Add New Doctor</h3>
        <asp:TextBox ID="txtName" runat="server" placeholder="Full Name"></asp:TextBox>
        <asp:TextBox ID="txtSpecialty" runat="server" placeholder="Specialization"></asp:TextBox>
        <asp:TextBox ID="txtEmail" runat="server" placeholder="Email"></asp:TextBox>
        <asp:TextBox ID="txtPhone" runat="server" placeholder="Phone"></asp:TextBox>
        <asp:Button ID="btnAddDoctor" runat="server" Text="Add Doctor" CssClass="btn" OnClick="btnAddDoctor_Click" />

        <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
    </div>

</asp:Content>
