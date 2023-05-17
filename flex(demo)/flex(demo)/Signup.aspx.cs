using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class signup : System.Web.UI.Page
{
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string username = txtUsername.Text;
        string password = txtPassword.Text;
        string confirmPassword = txtConfirmPassword.Text;
        string userType = ddlUserType.SelectedValue;

        if (IsUsernameExists(username))
        {
            lblMessage.Text = "Username already exists. Please choose a different username.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            return;
        }

        if (password != confirmPassword)
        {
            lblMessage.Text = "Passwords do not match.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            return;
        }

        int userId = GenerateNewUserId();

        InsertUser(userId, username, password, userType);
        Response.Redirect("login.aspx");

        lblMessage.Text = "User registration successful.";
        lblMessage.ForeColor = System.Drawing.Color.Green;
    }

    private bool IsUsernameExists(string username)
    {
       
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            string query = "SELECT COUNT(*) FROM USERS WHERE UserName = @Username";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@Username", username);
            int count = (int)command.ExecuteScalar();
            return count > 0;
        }
    }

    private int GenerateNewUserId()
    {
        
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            string query = "SELECT MAX(UserId) FROM USERS";
            SqlCommand command = new SqlCommand(query, connection);
            int lastUserId = (int)command.ExecuteScalar();
            return lastUserId + 1;
        }
    }

    private void InsertUser(int userId, string username, string password, string userType)
    {
        // Generate a new user ID by fetching the last user ID from the table and incrementing it
        // Implement your database query to fetch the last user ID and increment it
        // Example:
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            string query = "INSERT INTO USERS (UserId, UserName, Password, UserType) VALUES (@UserId, @Username, @Password, @UserType)";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@UserId", userId);
            command.Parameters.AddWithValue("@Username", username);
            command.Parameters.AddWithValue("@Password", password);
            command.Parameters.AddWithValue("@UserType", userType);
            command.ExecuteNonQuery();
        }
    }

}
