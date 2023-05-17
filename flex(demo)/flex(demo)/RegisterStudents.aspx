<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegisterStudents.aspx.cs" Inherits="RegisterStudents" %>



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
            <h1>Enroll Student</h1>
            <form method="post" runat="server"  action="RegisterStudents.aspx">
                <div class="form-group">
                    <label for="StudentID">Student ID:</label>
                    <asp:TextBox ID="StudentIdTextBox" runat="server" required />
                </div>
                <div class="form-group">
                    <label for="CourseID">Course ID:</label>
                    <asp:TextBox ID="CourseIDTextBox" runat="server" required />
                </div>
                <div class="form-group">
                    <label for="Semester">Semester:</label>
                    <asp:TextBox ID="SemesterTextBox" runat="server" required />
                </div>
                <div class="form-group">
                    <input type="submit" value="Submit" runat="server" onserverclick="SubmitButton_Click" />
                </div>
                <div class="form-group">
                    <label id="ErrorMessageLabel" runat="server" visible="false" style="color: red;"></label>
                </div>
                <div class="form-group">
                    <label id="SuccessMessageLabel" runat="server" visible="false" style="color: green;"></label>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
