using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
   

public partial class OfferCourses : System.Web.UI.Page
{
   

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        string courseCode = courseCodeTextBox.Text;
        string prerequisites = prerequisitesTextBox.Text;
        string courseTitle = courseTitleTextBox.Text;
        int creditHours = Convert.ToInt32(creditHoursTextBox.Text);

        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string getLastCourseIdQuery = "SELECT MAX(CourseId) FROM COURSES";
            SqlCommand getLastCourseIdCommand = new SqlCommand(getLastCourseIdQuery, connection);
            int lastCourseId = (int)getLastCourseIdCommand.ExecuteScalar();

            int newCourseId = lastCourseId + 1;

            string courseQuery = "INSERT INTO COURSES (CourseId, CourseCode, CourseTitle, CreditHours, NumberOfStudents) VALUES (@courseId, @courseCode, @courseTitle, @creditHours, 0)";
            SqlCommand courseCommand = new SqlCommand(courseQuery, connection);
            courseCommand.Parameters.AddWithValue("@courseId", newCourseId);
            courseCommand.Parameters.AddWithValue("@courseCode", courseCode);
            courseCommand.Parameters.AddWithValue("@courseTitle", courseTitle);
            courseCommand.Parameters.AddWithValue("@creditHours", creditHours);
            courseCommand.ExecuteNonQuery();


            string[] prerequisiteCourses = prerequisites.Split(',');

            foreach (string prerequisiteCourse in prerequisiteCourses)
            {
                int prerequisiteCourseId = Convert.ToInt32(prerequisiteCourse.Trim());

                string prerequisiteQuery = "INSERT INTO PREREQUISITES (CourseId, PrerequisiteCourseId) VALUES (@courseId, @prerequisiteCourseId)";
                SqlCommand prerequisiteCommand = new SqlCommand(prerequisiteQuery, connection);
                prerequisiteCommand.Parameters.AddWithValue("@courseId", newCourseId);
                prerequisiteCommand.Parameters.AddWithValue("@prerequisiteCourseId", prerequisiteCourseId);
                prerequisiteCommand.ExecuteNonQuery();
            }

            connection.Close();
        }

        courseCodeTextBox.Text = string.Empty;
        prerequisitesTextBox.Text = string.Empty;
        courseTitleTextBox.Text = string.Empty;
        creditHoursTextBox.Text = string.Empty;

        
    }


}