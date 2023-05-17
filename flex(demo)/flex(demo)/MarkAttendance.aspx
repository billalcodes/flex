<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MarkAttendance.aspx.cs" Inherits="MarkAttendance" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Faculty Attendance</title>
    <link rel="stylesheet" href="StyleSheet.css" />
    <style>
        .attendance-container {
            width: 90%;
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff; 
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        .attendance-container h3 {
            text-align: center;
            margin-bottom: 20px;
            color: #4CAF50;
        }

        .attendance-container label {
            display: inline-block;
            width: 150px;
            font-weight: bold;
            color: #444;
            margin-bottom: 5px;
        }

        .attendance-container input[type=text] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
            color: #444;
            margin-top: 5px;
        }

        .attendance-container button {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }

        .attendance-container button:hover {
            background-color: #45a049;
        }

        .attendance-container select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
            color: #444;
            margin-top: 5px;
        }

        .attendance-container .grid-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
            margin-top: 20px;
        }

        .attendance-container .grid-container .grid-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .attendance-container .grid-container .grid-item .student-id {
            font-weight: bold;
        }

        .attendance-container .grid-container .grid-item .attendance-input {
            width: 80px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            text-align: center;
        }
    </style>
</head>
<body>
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
    <form id="form1" runat="server">
        <div class="attendance-container">
            <h3>Mark Attendance</h3>
            <label for="ddlFacultyId">Faculty ID:</label>
            <asp:TextBox ID="txtFacultyId" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnGetSections" runat="server" Text="Get Sections" OnClick="btnGetSections_Click" />
            <br />
            <asp:DropDownList ID="ddlSections" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSections_SelectedIndexChanged">
                <asp:ListItem Text="Select Section" Value=""></asp:ListItem>
            </asp:DropDownList>
            <br />
            <div class="grid-container">
                <asp:GridView ID="gvStudents" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="StudentId" HeaderText="Student ID" />
                        <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                        <asp:TemplateField HeaderText="Attendance">
                            <ItemTemplate>
                                <div class="grid-item">
                                    <span class="student-id"><%# Eval("StudentId") %></span>
                                    <asp:TextBox ID="txtAttendance" runat="server" CssClass="attendance-input"></asp:TextBox>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <br />
            <asp:Button ID="btnSubmit" runat="server" Text="Submit Attendance" OnClick="btnSubmit_Click" />
        </div>
    </form>
</body>
</html>

