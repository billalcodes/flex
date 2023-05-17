<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OfferCourses.aspx.cs" Inherits="OfferCourses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Offer a New Course</title>
    <link rel="stylesheet" href="StyleSheet.css" />
</head>
<body>
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
    <div class="container">
        <div class="form-container">
            <h1>Offer New Course</h1>
            <form method="post" runat="server"  action="OfferCourses.aspx">
                <div class="form-group">
                    <label for="courseCode">Course Code:</label>
                    <asp:TextBox ID="courseCodeTextBox" runat="server" required />
                </div>
                <div class="form-group">
                    <label for="prerequisites">Prerequisites:</label>
                    <asp:TextBox ID="prerequisitesTextBox" runat="server" required />
                </div>
                <div class="form-group">
                    <label for="CourseTitle">Course Title:</label>
                    <asp:TextBox ID="courseTitleTextBox" runat="server" required />
                </div>
                <div class="form-group">
                    <label for="creditHours">Number of Credit Hours:</label>
                    <asp:TextBox ID="creditHoursTextBox" runat="server" type="number" min="1" max="5" required />
                </div>
                <div class="form-group">
                    <input type="submit" value="Submit" runat="server" onserverclick="SubmitButton_Click" />
                </div>
            </form>
        </div>
    </div>
</body>
</html>
