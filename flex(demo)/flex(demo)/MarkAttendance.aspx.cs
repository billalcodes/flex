using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MarkAttendance : Page
{
    protected void btnGetSections_Click(object sender, EventArgs e)
    {
        string facultyId = txtFacultyId.Text;

        if (!string.IsNullOrEmpty(facultyId))
        {
            DataTable sectionsTable = GetSectionsForFaculty(facultyId);

            ddlSections.Items.Clear();
            ddlSections.Items.Add(new ListItem("Select Section", ""));

            foreach (DataRow row in sectionsTable.Rows)
            {
                string sectionId = row["SectionId"].ToString();
                string sectionName = row["Sec_name"].ToString();
                ddlSections.Items.Add(new ListItem(sectionName, sectionId));
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "facultyIdError", "alert('Please enter a valid Faculty ID.');", true);
        }
    }



    protected void ddlSections_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sectionId = ddlSections.SelectedValue;

        if (!string.IsNullOrEmpty(sectionId))
        {
            DataTable studentsTable = GetStudentsInSection(sectionId);

            gvStudents.DataSource = studentsTable;
            gvStudents.DataBind();
        }
        else
        {
            gvStudents.DataSource = null;
            gvStudents.DataBind();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string sectionId = ddlSections.SelectedValue;

        if (!string.IsNullOrEmpty(sectionId))
        {
            foreach (GridViewRow row in gvStudents.Rows)
            {
                string studentId = row.Cells[0].Text;
                TextBox txtAttendance = (TextBox)row.FindControl("txtAttendance");
                string attendance = txtAttendance.Text;

                SaveAttendance(sectionId, studentId, attendance);
            }

            ClientScript.RegisterStartupScript(this.GetType(), "attendanceSuccess", "alert('Attendance submitted successfully.');", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "sectionIdError", "alert('Please select a section.');", true);
        }
    }

    private DataTable GetSectionsForFaculty(string facultyId)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        string query = @"SELECT SectionId, Sec_name
                     FROM SECTIONS
                     WHERE FacultyId = @FacultyId";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@FacultyId", facultyId);

                using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                {
                    DataTable sectionsTable = new DataTable();
                    adapter.Fill(sectionsTable);
                    return sectionsTable;
                }
            }
        }
    }


    private DataTable GetStudentsInSection(string sectionId)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        string query = @"
        SELECT DISTINCT ST.StudentId, ST.FullName
        FROM STUDENTS ST
        INNER JOIN ENROLLMENTS EN ON ST.StudentId = EN.StudentId
        INNER JOIN COURSE_HISTORY CH ON EN.CourseId = CH.CourseId AND EN.StudentId = CH.StudentId
        INNER JOIN SECTIONS S ON CH.Section = S.Sec_name
        WHERE S.SectionId = @SectionId";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@SectionId", sectionId);

                using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                {
                    DataTable studentsTable = new DataTable();
                    adapter.Fill(studentsTable);
                    return studentsTable;
                }
            }
        }
    }


    private void SaveAttendance(string sectionId, string studentId, string attendance)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        string query = "INSERT INTO Attendances (SectionId, StudentId, AttendanceStatus) VALUES (@SectionId, @StudentId, @Attendance)";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@SectionId", sectionId);
                command.Parameters.AddWithValue("@StudentId", studentId);
                command.Parameters.AddWithValue("@Attendance", attendance);

                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
}

