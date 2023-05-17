<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Reports" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Website</title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css">
</head>
<body>
    <form id="form1" runat="server">
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

        <h1>Reporting</h1>

        
        
        <div class="button-container"id="reportSelection" >
            <asp:Button ID="OfferedCoursesButton" runat="server" Text="Offered Courses Report" OnClick="OfferedCoursesButton_Click" />
            <asp:Button ID="StudentSectionsButton" runat="server" Text="Student Section Report" OnClick="StudentSectionsButton_Click" />
            <asp:Button ID="CourseAllocationButton" runat="server" Text="Course Allocation Report" OnClick="CourseAllocationButton_Click" />
        </div>
        <div class="report-content" id="reportSection"  >
            <asp:Literal ID="ReportContentLiteral" runat="server"></asp:Literal>
        </div>
    </form>
</body>
</html>
