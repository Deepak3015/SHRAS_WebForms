<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SHRAS_WebForms.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login | SHRAS</title>
    <link href="Content/login.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <div class="background">
            <div class="circle blue"></div>
            <div class="circle pink"></div>
        </div>

        <div class="login-box">
            <h2>Welcome to SHRAS</h2>

            <asp:Label ID="lblMessage" runat="server" CssClass="error-message" />

            <asp:TextBox ID="txtUsername" runat="server" CssClass="input" placeholder="Username"></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="input" TextMode="Password" placeholder="Password"></asp:TextBox>

            <div class="btn-group">
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn login" OnClick="btnLogin_Click" />
                <asp:Button ID="btnRegister" runat="server" Text="Register as Patient" CssClass="btn register" OnClick="btnRegister_Click" />
            </div>
        </div>

    </form>
</body>
</html>
