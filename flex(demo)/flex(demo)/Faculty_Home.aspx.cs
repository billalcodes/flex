using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class Faculty_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //    if (Session["UserId"] == null)
        //    {
        //        Response.Redirect("login.aspx");
        //    }
        //    else
        //    {
        //        int userId = Convert.ToInt32(Session["UserId"]);

                
        //        string query = "SELECT FacultyId, FullName, Courses_Alloted FROM FACULTY WHERE UserId = @UserId";
        //        string connectionString = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;

        //        using (SqlConnection connection = new SqlConnection(connectionString))
        //        {
        //            SqlCommand command = new SqlCommand(query, connection);
        //            command.Parameters.AddWithValue("@UserId", userId);

        //            connection.Open();
        //            SqlDataReader reader = command.ExecuteReader();

        //            if (reader.Read())
        //            {
        //                lblFacultyId.Text = reader["FacultyId"].ToString();
        //                lblFullName.Text = reader["FullName"].ToString();
        //                lblCoursesAlloted.Text = reader["Courses_Alloted"].ToString();
        //            }
        //            else
        //            {
        //                Response.Redirect("ErrorPage.aspx");
        //            }

        //            reader.Close();
        //        }
        //    }
        //}
    }
}
