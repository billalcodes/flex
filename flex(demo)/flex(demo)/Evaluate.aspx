<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Evaluate.aspx.cs" Inherits="Evaluate" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mark Evaluation</title>
    <link rel="stylesheet" href="StyleSheet.css" />
</head>
<body>
    <nav>
        <ul>
            <li><a href="Faculty_Home.aspx">Home</a></li>
            <li><a href="MarkAttendance.aspx">Attendance</a></li>
            <li><a href="Evaluate.aspx">Evaluation</a></li>
             <li><a href="Faculty_report.aspx">Reports</a></li>

        </ul>
        <ul>
            <li><a href="login.aspx">Sign In</a></li>
            <li><a href="signup.aspx">Sign Up</a></li>
        </ul>
    </nav>
    <form id="form1" runat="server">
        <div>
            <h1>Mark Evaluation</h1>
            <label for="ddlEvaluationType">Evaluation Type:</label>
            <asp:DropDownList ID="ddlEvaluationType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlEvaluationType_SelectedIndexChanged">
                <asp:ListItem Text="Select Evaluation Type" Value=""></asp:ListItem>
                <asp:ListItem Text="Assignment" Value="Assignment"></asp:ListItem>
                <asp:ListItem Text="Exam" Value="Exam"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:GridView ID="gvStudents" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="StudentId" HeaderText="Student ID" />
                    <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                    <asp:TemplateField HeaderText="Marks">
                        <ItemTemplate>
                            <asp:TextBox ID="txtMarks" runat="server"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <asp:Button ID="btnSubmit" runat="server" Text="Submit Marks" OnClick="btnSubmit_Click" />
        </div>
    </form>
</body>
</html>