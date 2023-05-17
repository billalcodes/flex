<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Academic Officer Home Page</title>
    <link rel="stylesheet" href="StyleSheet.css" />

    <style>
        .officer-info {
            margin-bottom: 20px;
        }
        .officer-info label {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="formAcademicOfficerHome" runat="server">
        <nav>  
        <ul>
                <li><a href="Home.aspx">Home</a></li>
                <li><a href="OfferCourses.aspx">Offer Courses</a></li>
                <li><a href="RegisterStudents.aspx">Register Students</a></li>
                <li><a href="MakeSections.aspx">Make Sections</a></li>
                <li><a href="Reports.aspx">Reports</a></li>
            </ul>
            <ul>
                <li><a href="login.aspx">Sign In</a></li>
            <li><a href="signup.aspx">Sign Up</a></li>
            </ul>
        </nav>
        <div>
            <h2>Welcome, Academic Officer!</h2>
            <div class="officer-info">
                <label>Officer ID:</label>
                <asp:Label ID="lblOfficerId" runat="server" />
            </div>
            <div class="officer-info">
                <label>Full Name:</label>
                <asp:Label ID="lblFullName" runat="server" />
            </div>
        </div>
    </form>
</body>
</html>
