<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManagePatients.aspx.cs" Inherits="SHRAS_WebForms.Admin.ManagePatients_aspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/ManagePatients.css" rel="stylesheet" />

    <h2 class="page-title">Manage Patients</h2>
    <p class="subtitle">View or remove patient records from the system.</p>

    <div class="patient-container">
        <asp:GridView ID="GridViewPatients" runat="server" AutoGenerateColumns="False" DataKeyNames="PatientID" CssClass="gridview" OnRowDeleting="GridViewPatients_RowDeleting">
            <Columns>
                <asp:BoundField DataField="PatientID" HeaderText="ID" />
                <asp:BoundField DataField="FullName" HeaderText="Name" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" CssClass="delete-button" OnClientClick="return confirm('Are you sure you want to delete this patient?');" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>
