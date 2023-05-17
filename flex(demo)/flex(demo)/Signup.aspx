<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signup.aspx.cs" Inherits="signup" %>

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
        <h1 style="text-align: center;">Signup Form</h1>

        <div style="max-width: 400px; margin: 0 auto; background-color: #fff; border-radius: 5px; padding: 20px; box-shadow: 0 0 10px #ccc;">
            <label for="txtUsername" style="display: block; margin-bottom: 10px;">Username:</label>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" style="width: 100%; margin-bottom: 20px;"></asp:TextBox>

            <label for="txtPassword" style="display: block; margin-bottom: 10px;">Password:</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" style="width: 100%; margin-bottom: 20px;"></asp:TextBox>

            <label for="txtConfirmPassword" style="display: block; margin-bottom: 10px;">Confirm Password:</label>
            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" style="width: 100%; margin-bottom: 20px;"></asp:TextBox>

            <label for="ddlUserType" style="display: block; margin-bottom: 10px;">User Type:</label>
            <asp:DropDownList ID="ddlUserType" runat="server" CssClass="form-control" style="width: 100%; margin-bottom: 20px;">
                <asp:ListItem Text="Student" Value="Student"></asp:ListItem>
                <asp:ListItem Text="Academic_Officer" Value="Academix_Officer"></asp:ListItem>
                <asp:ListItem Text="Faculty" Value="Faculty"></asp:ListItem>
            </asp:DropDownList>

            <asp:Button ID="btnSubmit" runat="server" Text="Signup" OnClick="btnSubmit_Click" CssClass="login-button" />

            <br />

            <asp:Label ID="lblMessage" runat="server" Text="" Style="color: Red;"></asp:Label>
        </div>
    </form>
</body>
</html>
