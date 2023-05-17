using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Student_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["userId"] != null)
            {
                int userId = int.Parse(Request.QueryString["userId"]);
                DisplayUserInfo(userId);
            }
        }
    }

    private void DisplayUserInfo(int userId)
    {
       
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            SqlCommand command = new SqlCommand("SELECT StudentId, FullName, CGPA FROM Students WHERE UserId = @UserId", connection);
            command.Parameters.AddWithValue("@UserId", userId);
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                
                lblStudentId.Text = reader["StudentId"].ToString();
                lblFullName.Text = reader["FullName"].ToString();
                lblCGPA.Text = reader["CGPA"].ToString();
            }
            reader.Close();
        }
    }
}

