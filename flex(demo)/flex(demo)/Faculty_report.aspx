<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Faculty_report.aspx.cs" Inherits="Faculty_report" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Website</title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css">
</head>
<body>
    <form id="form1" runat="server">
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
        <h1>Reporting</h1>

        <label for="ddlFacultyId">Faculty ID:</label>
            <asp:TextBox ID="txtFacultyId" runat="server"></asp:TextBox>
            <br />
        
        
        <div class="button-container"id="reportSelection" >
            <asp:Button ID="OfferedCoursesButton" runat="server" Text="Feedback Report" OnClick="OfferedCoursesButton_Click" />
            <asp:Button ID="StudentSectionsButton" runat="server" Text="Attendance sheet Report" OnClick="StudentSectionsButton_Click" />
            <asp:Button ID="Button1" runat="server" Text="Evaluation Report" OnClick="StudentSectionsButton_Click" />
            <asp:Button ID="Button2" runat="server" Text="Grade Report" OnClick="StudentSectionsButton_Click" />
            <asp:Button ID="Button3" runat="server" Text="Student Grade Report" OnClick="StudentSectionsButton_Click" />
            
        </div>
        <div class="report-content" id="reportSection"  >
            <asp:Literal ID="ReportContentLiteral" runat="server"></asp:Literal>
        </div>
    </form>
</body>
</html>

