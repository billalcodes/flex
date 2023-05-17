using System;
using System.Web.UI;
using System.Data.SqlClient;

public partial class Faculty_report : Page
{
    protected void OfferedCoursesButton_Click(object sender, EventArgs e)
    {
        int facultyId = Convert.ToInt32(txtFacultyId.Text);
        string feedbackReportContent = GenerateFeedbackReport(facultyId);
        ReportContentLiteral.Text = feedbackReportContent;
    }

    protected void StudentSectionsButton_Click(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
    protected void Button3_Click(object sender, EventArgs e)
    {

    }
    private string GenerateFeedbackReport(int facultyId)
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        string query = "SELECT FeedbackId, EnrollmentId, Date, Subject, NameOfTeacher, Q1Rating, Q2Rating, Q3Rating, Q4Rating, Q5Rating, Q6Rating, Q7Rating, Q8Rating, Q9Rating, Q10Rating, Q11Rating, Q12Rating, Q13Rating, Q14Rating, Q15Rating, Q16Rating, Q17Rating, Q18Rating, Q19Rating, Q20Rating, Comments FROM Feedback WHERE TeacherId = @TeacherId";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@TeacherId", facultyId);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    string reportContent = "<h2>Feedback Report</h2>";
                    reportContent += "<table>";
                    reportContent += "<tr><th>Feedback ID</th><th>Enrollment ID</th><th>Date</th><th>Subject</th><th>Name of Teacher</th><th>Q1 Rating</th><th>Q2 Rating</th><th>Q3 Rating</th><th>Q4 Rating</th><th>Q5 Rating</th><th>Q6 Rating</th><th>Q7 Rating</th><th>Q8 Rating</th><th>Q9 Rating</th><th>Q10 Rating</th><th>Q11 Rating</th><th>Q12 Rating</th><th>Q13 Rating</th><th>Q14 Rating</th><th>Q15 Rating</th><th>Q16 Rating</th><th>Q17 Rating</th><th>Q18 Rating</th><th>Q19 Rating</th><th>Q20 Rating</th><th>Comments</th></tr>";

                    while (reader.Read())
                    {
                        int feedbackId = reader.GetInt32(0);
                        int enrollmentId = reader.GetInt32(1);
                        DateTime date = reader.GetDateTime(2);
                        string subject = reader.GetString(3);
                        string teacherName = reader.GetString(4);
                        int q1Rating = reader.GetInt32(5);
                        int q2Rating = reader.GetInt32(6);
                        int q3Rating = reader.GetInt32(7);
                        int q4Rating = reader.GetInt32(8);
                        int q5Rating = reader.GetInt32(9);
                        int q6Rating = reader.GetInt32(10);
                        int q7Rating = reader.GetInt32(11);
                        int q8Rating = reader.GetInt32(12);
                        int q9Rating = reader.GetInt32(13);
                        int q10Rating = reader.GetInt32(14);
                        int q11Rating = reader.GetInt32(15);
                        int q12Rating = reader.GetInt32(16);
                        int q13Rating = reader.GetInt32(17);
                        int q14Rating = reader.GetInt32(18);
                        int q15Rating = reader.GetInt32(19);
                        int q16Rating = reader.GetInt32(20);
                        int q17Rating = reader.GetInt32(21);
                        int q18Rating = reader.GetInt32(22);
                        int q19Rating = reader.GetInt32(23);
                        int q20Rating = reader.GetInt32(24);
                        string comments = reader.GetString(25);

                        reportContent += $"<tr><td>{feedbackId}</td><td>{enrollmentId}</td><td>{date}</td><td>{subject}</td><td>{teacherName}</td><td>{q1Rating}</td><td>{q2Rating}</td><td>{q3Rating}</td><td>{q4Rating}</td><td>{q5Rating}</td><td>{q6Rating}</td><td>{q7Rating}</td><td>{q8Rating}</td><td>{q9Rating}</td><td>{q10Rating}</td><td>{q11Rating}</td><td>{q12Rating}</td><td>{q13Rating}</td><td>{q14Rating}</td><td>{q15Rating}</td><td>{q16Rating}</td><td>{q17Rating}</td><td>{q18Rating}</td><td>{q19Rating}</td><td>{q20Rating}</td><td>{comments}</td></tr>";
                    }

                    reportContent += "</table>";
                    return reportContent;
                }
            }
        }
    }
}
