using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class RegisterStudents : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        int studentId = Convert.ToInt32(StudentIdTextBox.Text);
        int courseId = Convert.ToInt32(CourseIDTextBox.Text);
        string semester = SemesterTextBox.Text;

        if (!IsPrerequisiteCleared(studentId, courseId))
        {
            DisplayErrorMessage("Prerequisite not cleared.");
            return;
        }

        if (IsCourseLimitExceeded(studentId, semester))
        {
            DisplayErrorMessage("Course limit exceeded for this semester.");
            return;
        }

        if (IsStudentEnrolled(studentId, courseId))
        {
            DisplayErrorMessage("Student already enrolled in the course.");
            return;
        }

        if (EnrollStudent(studentId, courseId, semester))
        {
            DisplaySuccessMessage("Student enrolled successfully.");
        }
        else
        {
            DisplayErrorMessage("Failed to enroll student.");
        }
    }

    private bool IsCourseLimitExceeded(int studentId, string semester)
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string countCoursesQuery = "SELECT COUNT(*) FROM COURSE_HISTORY WHERE StudentId = @studentId AND Semester = @semester";
            SqlCommand countCoursesCommand = new SqlCommand(countCoursesQuery, connection);
            countCoursesCommand.Parameters.AddWithValue("@studentId", studentId);
            countCoursesCommand.Parameters.AddWithValue("@semester", semester);

            int courseCount = (int)countCoursesCommand.ExecuteScalar();

            if (courseCount >= 6)
            {
                return true;
            }
        }

        return false;
    }

    private bool IsPrerequisiteCleared(int studentId, int courseId)
    { 
        string prerequisiteQuery = "SELECT PrerequisiteCourseId FROM PREREQUISITES WHERE CourseId = @courseId";
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            SqlCommand prerequisiteCommand = new SqlCommand(prerequisiteQuery, connection);
            prerequisiteCommand.Parameters.AddWithValue("@courseId", courseId);

            int prerequisiteCourseId = (int)(prerequisiteCommand.ExecuteScalar() ?? 0);

            if (prerequisiteCourseId == 0)
            {
                return true;
            }

            string gradeQuery = @"SELECT CH.Grade
                              FROM COURSE_HISTORY CH
                              WHERE CH.StudentId = @studentId AND CH.CourseId = @prerequisiteCourseId
                              AND CH.Grade NOT IN ('F', 'W')";

            SqlCommand gradeCommand = new SqlCommand(gradeQuery, connection);
            gradeCommand.Parameters.AddWithValue("@studentId", studentId);
            gradeCommand.Parameters.AddWithValue("@prerequisiteCourseId", prerequisiteCourseId);

            using (SqlDataReader reader = gradeCommand.ExecuteReader())
            {
                return reader.HasRows;
            }
        }
    }



    private bool IsStudentEnrolled(int studentId, int courseId)
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string query = "SELECT EnrollmentId FROM ENROLLMENTS WHERE StudentId = @studentId AND CourseId = @courseId";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@studentId", studentId);
            command.Parameters.AddWithValue("@courseId", courseId);

            using (SqlDataReader reader = command.ExecuteReader())
            {
                return reader.HasRows;
            }
        }
    }


    private bool EnrollStudent(int studentId, int courseId, string semester)
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string sectionQuery = "SELECT Sec_name FROM SECTIONS WHERE CourseId = @courseId";
            SqlCommand sectionCommand = new SqlCommand(sectionQuery, connection);
            sectionCommand.Parameters.AddWithValue("@courseId", courseId);

            string sectionName = (string)sectionCommand.ExecuteScalar();

            if (sectionName == null)
            {
                return false;
            }

            string getLastEnrollmentIdQuery = "SELECT MAX(EnrollmentId) FROM ENROLLMENTS";
            SqlCommand getLastEnrollmentIdCommand = new SqlCommand(getLastEnrollmentIdQuery, connection);
            object lastEnrollmentIdObj = getLastEnrollmentIdCommand.ExecuteScalar();
            int lastEnrollmentId = (lastEnrollmentIdObj != DBNull.Value) ? Convert.ToInt32(lastEnrollmentIdObj) : 0;

            int newEnrollmentId = lastEnrollmentId + 1;

            string insertEnrollmentQuery = "INSERT INTO ENROLLMENTS (EnrollmentId, StudentId, CourseId, Semester, Section) VALUES (@enrollmentId, @studentId, @courseId, @semester, @sectionName)";
            SqlCommand insertEnrollmentCommand = new SqlCommand(insertEnrollmentQuery, connection);
            insertEnrollmentCommand.Parameters.AddWithValue("@enrollmentId", newEnrollmentId);
            insertEnrollmentCommand.Parameters.AddWithValue("@studentId", studentId);
            insertEnrollmentCommand.Parameters.AddWithValue("@courseId", courseId);
            insertEnrollmentCommand.Parameters.AddWithValue("@semester", semester);
            insertEnrollmentCommand.Parameters.AddWithValue("@sectionName", sectionName);

            int rowsAffected = insertEnrollmentCommand.ExecuteNonQuery();

            if (rowsAffected > 0)
            {
                string getLastHistoryIdQuery = "SELECT MAX(HistoryId) FROM COURSE_HISTORY";
                SqlCommand getLastHistoryIdCommand = new SqlCommand(getLastHistoryIdQuery, connection);
                object lastHistoryIdObj = getLastHistoryIdCommand.ExecuteScalar();
                int lastHistoryId = (lastHistoryIdObj != DBNull.Value) ? Convert.ToInt32(lastHistoryIdObj) : 0;

                int newHistoryId = lastHistoryId + 1;

                string insertCourseHistoryQuery = "INSERT INTO COURSE_HISTORY (HistoryId, StudentId, CourseId, Semester, section    , Grade) VALUES (@historyId, @studentId, @courseId, @semester, @sectionName, NULL)";
                SqlCommand insertCourseHistoryCommand = new SqlCommand(insertCourseHistoryQuery, connection);
                insertCourseHistoryCommand.Parameters.AddWithValue("@historyId", newHistoryId);
                insertCourseHistoryCommand.Parameters.AddWithValue("@studentId", studentId);
                insertCourseHistoryCommand.Parameters.AddWithValue("@courseId", courseId);
                insertCourseHistoryCommand.Parameters.AddWithValue("@semester", semester);
                insertCourseHistoryCommand.Parameters.AddWithValue("@sectionName", sectionName);

                insertCourseHistoryCommand.ExecuteNonQuery();

                
                string updateCourseStudentCountQuery = "UPDATE COURSES SET NumberOfStudents = NumberOfStudents + 1 WHERE CourseId = @courseId";
                SqlCommand updateCourseStudentCountCommand = new SqlCommand(updateCourseStudentCountQuery, connection);
                updateCourseStudentCountCommand.Parameters.AddWithValue("@courseId", courseId);
                updateCourseStudentCountCommand.ExecuteNonQuery();

                string updateSectionStudentCountQuery = "UPDATE SECTIONS SET StudentCount = StudentCount + 1 WHERE CourseId = @courseId AND Sec_name = @sectionName";
                SqlCommand updateSectionStudentCountCommand = new SqlCommand(updateSectionStudentCountQuery, connection);
                updateSectionStudentCountCommand.Parameters.AddWithValue("@courseId", courseId);
                updateSectionStudentCountCommand.Parameters.AddWithValue("@sectionName", sectionName);
                updateSectionStudentCountCommand.ExecuteNonQuery();

                return true;
            }
        }

        return false;
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

