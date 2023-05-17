<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Student_Home.aspx.cs" Inherits="Student_Home" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Home Page</title>
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
            align-content: center;
        }
        
        .page-header h2 {
            font-size: 24px;
            margin: 0;
        }
        
        .student-info {
            margin-bottom: 20px;
        }
        
        .student-info label {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="formStudentHome" runat="server">
        <nav>
            <ul>
                <li><a href="Student_Home.aspx">Home</a></li>
                <li><a href="Student_feedback.aspx">Feedback</a></li>
                <li><a href="Student_report.aspx">Reports</a></li>
            </ul>
            <ul>
                <li><a href="login.aspx">Sign In</a></li>
                <li><a href="signup.aspx">Sign Up</a></li>
            </ul>
        </nav>
        <div class="container">
            <div class="page-header">
                <h1>Welcome, Student!</h1>
            </div>
            <div class="student-info">
                <label>Student ID:</label>
                <asp:Label ID="lblStudentId" runat="server" CssClass="info-value" />
            </div>
            <div class="student-info">
                <label>Full Name:</label>
                <asp:Label ID="lblFullName" runat="server" CssClass="info-value" />
            </div>
            <div class="student-info">
                <label>CGPA:</label>
                <asp:Label ID="lblCGPA" runat="server" CssClass="info-value" />
            </div>
           
        </div>
    </form>
</body>
</html>

