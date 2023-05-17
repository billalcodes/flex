<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Faculty_Home.aspx.cs" Inherits="Faculty_Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Faculty Home Page</title>
    <link rel="stylesheet" href="StyleSheet.css" />
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
        }
        
        nav ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        
        nav ul li {
            display: inline;
            margin-right: 10px;
        }
        
        nav ul li a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }
        
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;

        }
        
        .page-header {
            margin-bottom: 20px;
        }
        
        .page-header h2 {
            font-size: 24px;
            margin: 0;
        }
        
        .faculty-info {
            margin-bottom: 20px;
        }
        
        .faculty-info label {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="formFacultyHome" runat="server">
        <nav>
        <ul>
            <li><a href="Faculty_Home.aspx">Home</a></li>
            <li><a href="MarkAttendance.aspx">Attendance</a></li>
            <li><a href="Evaluate.aspx">Evaluate</a></li>         
            <li><a href="Faculty_report.aspx">Reports</a></li>

        </ul>
        <ul>
        <li><a href="login.aspx">Sign In</a></li>
            <li><a href="signup.aspx">Sign Up</a></li>
        </ul>
    </nav>
        <div class="container">
            <div class="page-header">
                <h2>Welcome, Faculty!</h2>
            </div>
            <div class="faculty-info">
                <label>Faculty ID:</label>
                <asp:Label ID="lblFacultyId" runat="server" CssClass="info-value" />
            </div>
            <div class="faculty-info">
                <label>Full Name:</label>
                <asp:Label ID="lblFullName" runat="server" CssClass="info-value" />
            </div>
            <div class="faculty-info">
                <label>Courses Alloted:</label>
                <asp:Label ID="lblCoursesAlloted" runat="server" CssClass="info-value" />
            </div>
        </div>
    </form>
</body>
</html>
