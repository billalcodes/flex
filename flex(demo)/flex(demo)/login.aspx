<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
        .login-button {
            background-color: #4CAF50;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body style="font-family: Arial, sans-serif; background-color: #f2f2f2;">
    <form id="formLogin" runat="server">
        <h1 style="text-align: center;">Login Form</h1>

        <div style="max-width: 400px; margin: 0 auto; background-color: #fff; border-radius: 5px; padding: 20px; box-shadow: 0 0 10px #ccc;">
            <label for="txtUsername" style="display: block; margin-bottom: 10px;">Username:</label>
            <input type="text" id="txtUsername" name="txtUsername" runat="server" style="width: 100%; padding: 10px; padding-left: 2px; border: 1px solid #ccc; border-radius: 5px; margin-bottom: 20px;" />

            <label for="txtPassword" style="display: block; margin-bottom: 10px;">Password:</label>
            <input type="password" id="txtPassword" name="txtPassword" runat="server" style="width: 100%; padding: 10px; padding-left: 2px; border: 1px solid #ccc; border-radius: 5px; margin-bottom: 20px;" />

            <asp:Button ID="btnSubmit" runat="server" Text="Login" OnClick="btnSubmit_Click" CssClass="login-button" />
        </div>
    </form>
</body>
</html>
