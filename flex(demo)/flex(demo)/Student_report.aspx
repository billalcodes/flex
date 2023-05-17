<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Student_report.aspx.cs" Inherits="Student_report" %>
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
                <li><a href="Student_Home.aspx">Home</a></li>
                <li><a href="Student_feedback.aspx">Feedback</a></li>
                <li><a href="Student_report.aspx">Reports</a></li>
            </ul>
            <ul>
                <li><a href="login.aspx">Sign In</a></li>
                <li><a href="signup.aspx">Sign Up</a></li>
            </ul>
        </nav>

        <h1>Reporting</h1>

        
        
        <div class="button-container"id="reportSelection" >
            <asp:Button ID="OfferedCoursesButton" runat="server" Text="Attendace Report" OnClick="OfferedCoursesButton_Click" />
            <asp:Button ID="StudentSectionsButton" runat="server" Text="Marks Report" OnClick="StudentSectionsButton_Click" />
           
        </div>
        <div class="report-content" id="reportSection"  >
            <asp:Literal ID="ReportContentLiteral" runat="server"></asp:Literal>
        </div>
    </form>
</body>
</html>
