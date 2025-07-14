<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegisterPatient.aspx.cs" Inherits="SHRAS_WebForms.Patient.RegisterPatient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/PatientPages.css" rel="stylesheet" />

    <h2>Patient Registration</h2>

<asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

<table>
    <tr>
        <td>Full Name:</td>
        <td>
            <asp:TextBox ID="txtName" runat="server" />
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />
        </td>
    </tr>
    <tr>
        <td>Gender:</td>
        <td>
            <asp:DropDownList ID="ddlGender" runat="server">
                <asp:ListItem Text="Select Gender" Value="" />
                <asp:ListItem Text="Male" Value="Male" />
                <asp:ListItem Text="Female" Value="Female" />
                <asp:ListItem Text="Other" Value="Other" />
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="ddlGender"
                InitialValue="" ErrorMessage="* Select gender" ForeColor="Red" Display="Dynamic" />
        </td>
    </tr>
    <tr>
        <td>Email:</td>
        <td>
            <asp:TextBox ID="txtEmail" runat="server" />
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                ErrorMessage="* Invalid email" ForeColor="Red" Display="Dynamic"
                ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" />
        </td>
    </tr>
    <tr>
        <td>Password:</td>
        <td>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                ErrorMessage="* Required" ForeColor="Red" Display="Dynamic" />
        </td>
    </tr>
    <tr>
        <td colspan="2" style="text-align:right">
            <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
        </td>
    </tr>
</table>

</asp:Content>
