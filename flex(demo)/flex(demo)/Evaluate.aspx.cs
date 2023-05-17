using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class Evaluate : System.Web.UI.Page
{
    
    private List<Student> students = new List<Student>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            PopulateStudents();
        }
    }

    protected void ddlEvaluationType_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvStudents.Rows)
        {
            string studentId = row.Cells[0].Text;
            TextBox txtMarks = (TextBox)row.FindControl("txtMarks");
            string marks = txtMarks.Text;

            Student student = students.Find(s => s.StudentId == studentId);
            if (student != null)
            {
                student.Marks = marks;
            }
        }

        SaveStudentMarks();

        ClearMarks();

    }

    private void PopulateStudents()
    {
       
      
        students = GetStudents();

        gvStudents.DataSource = students;
        gvStudents.DataBind();
    }

    private void ClearMarks()
    {
        foreach (GridViewRow row in gvStudents.Rows)
        {
            TextBox txtMarks = (TextBox)row.FindControl("txtMarks");
            txtMarks.Text = string.Empty;
        }
    }

    private List<Student> GetStudents()
    {
     
        List<Student> students = new List<Student>()
        {
            new Student() { StudentId = "1", FullName = "John Doe" },
            new Student() { StudentId = "2", FullName = "Jane Smith" },
            new Student() { StudentId = "3", FullName = "Michael Johnson" }
            
        };

        return students;
    }



    private void SaveStudentMarks()
    {
       
        foreach (Student student in students)
        {
            
            string studentId = student.StudentId;
            string marks = student.Marks;

          
            using (SqlConnection connection = new SqlConnection("MyConnection"))
            {
                connection.Open();

                string query = "UPDATE Students SET Marks = @Marks WHERE StudentId = @StudentId";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Marks", marks);
                    command.Parameters.AddWithValue("@StudentId", studentId);

                    command.ExecuteNonQuery();
                }
            }
        }
    }

   

}

public class Student
{
    public string StudentId { get; set; }
    public string FullName { get; set; }
    public string Marks { get; set; }
}