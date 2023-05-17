using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class login : System.Web.UI.Page
{
    

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;

        string username = txtUsername.Value;
        string password = txtPassword.Value;

        SqlConnection connection1 = new SqlConnection(connectionString);
        connection1.Open();
        SqlCommand command1 = new SqlCommand("SELECT UserId FROM USERS WHERE UserName = @Username AND Password = @Password", connection1);
        command1.Parameters.AddWithValue("@Username", username);
        command1.Parameters.AddWithValue("@Password", password);
        int userId = (int?)command1.ExecuteScalar() ?? 0;
  

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string query = "SELECT UserType FROM USERS WHERE UserName = @UserName AND Password = @Password";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@UserName", username);
            command.Parameters.AddWithValue("@Password", password);

            string userType = (string)command.ExecuteScalar();

            connection.Close();

            if (userType == "Academic_Officer")
            {
             
                Response.Redirect("Home.aspx?userId=" + userId);

            }
            else if (userType == "Faculty")
            {
                
                Response.Redirect("Faculty_Home.aspx?userId=" + userId);

            }
            else if (userType == "Student")
            {
                Response.Redirect("Student_Home.aspx?userId=" + userId);
            }
            else
            {
            }
        }
    }
}
