<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Student_feedback.aspx.cs" Inherits="Student_feedback" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Feedback Form</title>
    <link rel="stylesheet" href="StyleSheet.css" />
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .feedback{
            margin: 20px;
        }
        h2 {
            color: #333;
        }
        label {
            font-weight: bold;
        }
        input[type="text"] {
            width: 300px;
            padding: 5px;
            margin-bottom: 10px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 10px;
        }
        table td {
            padding: 5px;
            border: 1px solid #ccc;
        }
        input[type="text"]:focus {
            outline: none;
            border-color: #0066cc;
        }
        .btn-submit {
            background-color: #0066cc;
            color: #fff;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }
        .btn-submit:hover {
            background-color: #0052a3;
        }
    </style>

</head>
<body>
    <form id="formFeedback" runat="server">
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
        <div class="feedback">
            <h2>Feedback Form</h2>
            <label for="txtEnrollmentId">Enrollment ID:</label>
            <input type="text" id="txtEnrollmentId" runat="server" />
            <br />
            <label for="txtTeacherId">Teacher ID:</label>
            <input type="text" id="txtTeacherId" runat="server" />
            <br />
            <label for="txtDate">Date:</label>
            <input type="text" id="txtDate" runat="server" />
            <br />
            <label for="txtSubject">Subject:</label>
            <input type="text" id="txtSubject" runat="server" />
            <br />
            <label for="txtNameOfTeacher">Name of Teacher:</label>
            <input type="text" id="txtNameOfTeacher" runat="server" />
            <br />
            <br />
            <h3>Feedback Questions</h3>
            <table>
                <tr>
                    <td>Question 1:</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                            <asp:ListItem Text="Worst" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Bad" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Better" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Good" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Best" Value="5"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>Question 2:</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList2" runat="server">
                            <asp:ListItem Text="Worst" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Bad" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Better" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Good" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Best" Value="5"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>Question 3:</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList3" runat="server">
                            <asp:ListItem Text="Worst" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Bad" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Better" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Good" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Best" Value="5"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>Question 4:</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList4" runat="server">
                            <asp:ListItem Text="Worst" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Bad" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Better" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Good" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Best" Value="5"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>Question 5:</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList5" runat="server">
                            <asp:ListItem Text="Worst" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Bad" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Better" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Good" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Best" Value="5"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
             
                <tr>
                    <td>Question 6:</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList6" runat="server">
                            <asp:ListItem Text="Worst" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Bad" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Better" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Good" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Best" Value="5"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>Question 7:</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList7" runat="server">
                            <asp:ListItem Text="Worst" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Bad" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Better" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Good" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Best" Value="5"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>Question 8:</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList8" runat="server">
                            <asp:ListItem Text="Worst" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Bad" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Better" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Good" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Best" Value="5"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>Question 9:</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList9" runat="server">
                            <asp:ListItem Text="Worst" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Bad" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Better" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Good" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Best" Value="5"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>Question 10:</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList10" runat="server">
                            <asp:ListItem Text="Worst" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Bad" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Better" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Good" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Best" Value="5"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>Question 11:</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList11" runat="server">
                            <asp:ListItem Text="Worst" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Bad" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Better" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Good" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Best" Value="5"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>Question 12:</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList12" runat="server">
                            <asp:ListItem Text="Worst" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Bad" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Better" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Good" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Best" Value="5"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>Question 13:</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList13" runat="server">
                            <asp:ListItem Text="Worst" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Bad" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Better" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Good" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Best" Value="5"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>Question 14:</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList14" runat="server">
                            <asp:ListItem Text="Worst" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Bad" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Better" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Good" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Best" Value="5"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>Question 15:</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList15" runat="server">
                            <asp:ListItem Text="Worst" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Bad" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Better" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Good" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Best" Value="5"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>Question 16:</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList16" runat="server">
                            <asp:ListItem Text="Worst" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Bad" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Better" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Good" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Best" Value="5"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>Question 17:</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList17" runat="server">
                            <asp:ListItem Text="Worst" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Bad" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Better" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Good" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Best" Value="5"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>Question 18:</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList18" runat="server">
                            <asp:ListItem Text="Worst" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Bad" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Better" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Good" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Best" Value="5"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>Question 19:</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList19" runat="server">
                            <asp:ListItem Text="Worst" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Bad" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Better" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Good" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Best" Value="5"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <!-- Repeat the above code for remaining questions -->
                <tr>
                    <td>Question 20:</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList20" runat="server">
                            <asp:ListItem Text="Worst" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Bad" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Better" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Good" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Best" Value="5"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
            <br />
            <label for="txtcomments">Comments:</label>
            <input type="text" id="txtcomments" runat="server" />
            <br />
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
        </div>
    </form>
</body>
</html>
