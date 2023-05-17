using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class MakeSections : System.Web.UI.Page
{
    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        string sectionName = SectionNameTextBox.Text;
        int courseId = Convert.ToInt32(CourseIDTextBox.Text);
        int facultyId = Convert.ToInt32(FacultyIDTextBox.Text);

        int numberOfStudents = GetNumberOfStudents(courseId);

        if (numberOfStudents <= 0)
        {
            DisplayErrorMessage("Invalid course ID or no students enrolled.");
            return;
        }

        if (numberOfStudents > 50)
        {
            int remainingStudents = numberOfStudents;
            int sectionCounter = 1;

            while (remainingStudents > 0)
            {
                CreateSection(sectionName + sectionCounter, courseId, 50, facultyId);
                remainingStudents -= 50;
                sectionCounter++;
            }

            DisplaySuccessMessage($"Sections created successfully. Additional sections needed for {remainingStudents} students.");
        }
        else
        {
            CreateSection(sectionName, courseId, numberOfStudents, facultyId);
            DisplaySuccessMessage("Section created successfully.");
        }
    }


    private int GetAllottedCoursesCount(int facultyId)
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string query = "SELECT COUNT(*) FROM Faculty WHERE FacultyId = @facultyId";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@facultyId", facultyId);

            int allottedCoursesCount = (int)command.ExecuteScalar();
            return allottedCoursesCount;
        }
    }

    private int GetNumberOfStudents(int courseId)
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string query = "SELECT NumberOfStudents FROM Courses WHERE CourseId = @courseId";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@courseId", courseId);

            object result = command.ExecuteScalar();
            if (result != null && result != DBNull.Value)
            {
                return Convert.ToInt32(result);
            }

            return 0;
        }
    }

    private void CreateSection(string sectionName, int courseId, int numberOfStudents, int facultyId)
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string getMaxSectionIdQuery = "SELECT MAX(SectionId) FROM Sections";
            SqlCommand getMaxSectionIdCommand = new SqlCommand(getMaxSectionIdQuery, connection);
            object maxSectionIdObj = getMaxSectionIdCommand.ExecuteScalar();
            int maxSectionId = (maxSectionIdObj != DBNull.Value) ? Convert.ToInt32(maxSectionIdObj) : 0;

            int newSectionId = maxSectionId + 1;

            string insertSectionQuery = "INSERT INTO Sections (SectionId, Sec_name, CourseId, FacultyID, StudentCount) VALUES (@sectionId, @sectionName, @courseId, @FacultyID, @numberOfStudents)";
            SqlCommand insertSectionCommand = new SqlCommand(insertSectionQuery, connection);
            insertSectionCommand.Parameters.AddWithValue("@sectionId", newSectionId);
            insertSectionCommand.Parameters.AddWithValue("@sectionName", sectionName);
            insertSectionCommand.Parameters.AddWithValue("@courseId", courseId);
            insertSectionCommand.Parameters.AddWithValue("@FacultyId", facultyId);
            insertSectionCommand.Parameters.AddWithValue("@numberOfStudents", numberOfStudents);

            insertSectionCommand.ExecuteNonQuery();

            string updateFacultyCoursesCountQuery = "UPDATE Faculty SET Courses_Alloted = Courses_Alloted + 1 WHERE FacultyId = @facultyId AND Courses_Alloted < 3";
            SqlCommand updateFacultyCoursesCountCommand = new SqlCommand(updateFacultyCoursesCountQuery, connection);
            updateFacultyCoursesCountCommand.Parameters.AddWithValue("@facultyId", facultyId);
            int rowsAffected = updateFacultyCoursesCountCommand.ExecuteNonQuery();

            if (rowsAffected > 0)
            {
                DisplaySuccessMessage("Section created successfully. Courses allotted to the faculty incremented.");
            }
            else
            {
                DisplaySuccessMessage("Section created successfully.");
            }
        }
    }


    private void DisplayErrorMessage(string message)
    {
        ErrorMessageLabel.InnerText = message;
        ErrorMessageLabel.Visible = true;
        SuccessMessageLabel.Visible = false;
    }

    private void DisplaySuccessMessage(string message)
    { 
        SuccessMessageLabel.InnerText = message;
        SuccessMessageLabel.Visible = true;
        ErrorMessageLabel.Visible = false;
    }
}

