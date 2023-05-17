using System;
using System.Web.UI;
using System.Data.SqlClient;
public partial class Reports : Page
{
    protected void OfferedCoursesButton_Click(object sender, EventArgs e)
    {
        string offeredCoursesReportContent = GenerateOfferedCoursesReport();
        ReportContentLiteral.Text = offeredCoursesReportContent;
    }

    protected void StudentSectionsButton_Click(object sender, EventArgs e)
    {
        string studentSectionsReportContent = GenerateStudentSectionsReport();
        ReportContentLiteral.Text = studentSectionsReportContent;
    }

    protected void CourseAllocationButton_Click(object sender, EventArgs e)
    {
        string courseAllocationReportContent = GenerateCourseAllocationReport();
        ReportContentLiteral.Text = courseAllocationReportContent;
    }

    private string GenerateOfferedCoursesReport()
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        string query = "SELECT CourseId, CourseCode, CourseTitle, CreditHours, NumberOfStudents FROM COURSES";
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    string reportContent = "<h2>Offered Courses Report</h2>";
                    reportContent += "<table>";
                    reportContent += "<tr><th>Course ID</th><th>Course Code</th><th>Course Title</th><th>Credit Hours</th><th>Number of Students</th></tr>";

                    while (reader.Read())
                    {
                        int courseId = reader.GetInt32(0);
                        string courseCode = reader.GetString(1);
                        string courseTitle = reader.GetString(2);
                        int creditHours = reader.GetInt32(3);
                        int numberOfStudents = reader.GetInt32(4); 

                        reportContent += $"<tr><td>{courseId}</td><td>{courseCode}</td><td>{courseTitle}</td><td>{creditHours}</td><td>{numberOfStudents}</td></tr>";
                    }   

                    reportContent += "</table>";
                    return reportContent;
                }
            }
        }
    }

    private string GenerateStudentSectionsReport()
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        string query = "SELECT C.CourseId, S.Sec_name, CH.StudentId, ST.FullName " +
                       "FROM COURSES C " +
                       "INNER JOIN SECTIONS S ON C.CourseId = S.CourseId " +
                       "INNER JOIN COURSE_HISTORY CH ON S.Sec_name = CH.Section " +
                       "INNER JOIN STUDENTS ST ON CH.StudentId = ST.StudentId " +
                       "ORDER BY C.CourseId, S.Sec_name, CH.StudentId";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    string reportContent = "<h2>Student Sections Report</h2>";
                    reportContent += "<table>";
                    reportContent += "<tr><th>Course ID</th><th>Section Name</th><th>Student ID</th><th>Student Name</th></tr>";

                    int previousCourseId = -1;
                    string previousSectionName = string.Empty;

                    while (reader.Read())
                    {
                        int courseId = reader.GetInt32(0);
                        string secName = reader.GetString(1);
                        int studentId = reader.GetInt32(2);
                        string studentName = reader.GetString(3);

                        if (courseId != previousCourseId)
                        {
                            reportContent += $"<tr><td rowspan='0'>{courseId}</td><td>{secName}</td><td>{studentId}</td><td>{studentName}</td></tr>";
                            previousCourseId = courseId;
                            previousSectionName = secName;
                        }
                        else if (secName != previousSectionName)
                        {
                            reportContent += $"<tr><td>{secName}</td><td>{studentId}</td><td>{studentName}</td></tr>";
                            previousSectionName = secName;
                        }
                        else
                        {
                            reportContent += $"<tr><td>{studentId}</td><td>{studentName}</td></tr>";
                        }
                    }

                    reportContent += "</table>";
                    return reportContent;
                }
            }
        }
    }






    private string GenerateCourseAllocationReport()
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        string query = "SELECT C.CourseId, C.CourseCode, C.CourseTitle, C.CreditHours, S.SectionId, S.Sec_name, F.FullName " +
               "FROM COURSES C " +
               "LEFT JOIN SECTIONS S ON C.CourseId = S.CourseId " +
               "LEFT JOIN FACULTY F ON S.FacultyId = F.FacultyId " +
               "ORDER BY C.CourseId, S.SectionId";



        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    string reportContent = "<h2>Course Allocation Report</h2>";
                    reportContent += "<table>";
                    reportContent += "<tr><th>Course ID</th><th>Course Code</th><th>Course Title</th><th>Credit Hours</th><th>Section ID</th><th>Section Name</th><th>Instructor Name</th></tr>";

                    while (reader.Read())
                    {
                        int courseId = reader.IsDBNull(0) ? 0 : reader.GetInt32(0);
                        string courseCode = reader.IsDBNull(1) ? "" : reader.GetString(1);
                        string courseTitle = reader.IsDBNull(2) ? "" : reader.GetString(2);
                        int creditHours = reader.IsDBNull(3) ? 0 : reader.GetInt32(3);
                        int sectionId = reader.IsDBNull(4) ? 0 : reader.GetInt32(4);
                        string secName = reader.IsDBNull(5) ? "" : reader.GetString(5);
                        string instructorName = reader.IsDBNull(6) ? "" : reader.GetString(6);

                        reportContent += $"<tr><td>{courseId}</td><td>{courseCode}</td><td>{courseTitle}</td><td>{creditHours}</td><td>{sectionId}</td><td>{secName}</td><td>{instructorName}</td></tr>";
                    }

                    reportContent += "</table>";
                    return reportContent;
                }
            }
        }
    }


}
