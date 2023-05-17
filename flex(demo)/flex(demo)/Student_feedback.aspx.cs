using System;
using System.Data.SqlClient;

public partial class Student_feedback : System.Web.UI.Page
{
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int enrollmentId = int.Parse(txtEnrollmentId.Value);
        int teacherId = int.Parse(txtTeacherId.Value);
        DateTime date = DateTime.Parse(txtDate.Value);
        string subject = txtSubject.Value;
        string nameOfTeacher = txtNameOfTeacher.Value;
        string comments = txtcomments.Value;
        int q1Rating = int.Parse(RadioButtonList1.SelectedValue);
        int q2Rating = int.Parse(RadioButtonList2.SelectedValue);
        int q3Rating = int.Parse(RadioButtonList3.SelectedValue);
        int q4Rating = int.Parse(RadioButtonList4.SelectedValue);
        int q5Rating = int.Parse(RadioButtonList5.SelectedValue);
        int q6Rating = int.Parse(RadioButtonList6.SelectedValue);
        int q7Rating = int.Parse(RadioButtonList7.SelectedValue);
        int q8Rating = int.Parse(RadioButtonList8.SelectedValue);
        int q9Rating = int.Parse(RadioButtonList9.SelectedValue);
        int q10Rating = int.Parse(RadioButtonList10.SelectedValue);
        int q11Rating = int.Parse(RadioButtonList11.SelectedValue);
        int q12Rating = int.Parse(RadioButtonList12.SelectedValue);
        int q13Rating = int.Parse(RadioButtonList13.SelectedValue);
        int q14Rating = int.Parse(RadioButtonList14.SelectedValue);
        int q15Rating = int.Parse(RadioButtonList15.SelectedValue);
        int q16Rating = int.Parse(RadioButtonList16.SelectedValue);
        int q17Rating = int.Parse(RadioButtonList17.SelectedValue);
        int q18Rating = int.Parse(RadioButtonList18.SelectedValue);
        int q19Rating = int.Parse(RadioButtonList19.SelectedValue);
        int q20Rating = int.Parse(RadioButtonList20.SelectedValue);



        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            int feedbackId = GetNextFeedbackId(connection);

            string query = @"INSERT INTO FEEDBACK (FeedbackId, EnrollmentId, TeacherId, Date, Subject, NameOfTeacher,
                            Q1Rating, Q2Rating, Q3Rating, Q4Rating, Q5Rating, Q6Rating, Q7Rating, Q8Rating,
                            Q9Rating, Q10Rating, Q11Rating, Q12Rating, Q13Rating, Q14Rating, Q15Rating,
                            Q16Rating, Q17Rating, Q18Rating, Q19Rating, Q20Rating, Comments)
                         VALUES (@FeedbackId, @EnrollmentId, @TeacherId, @Date, @Subject, @NameOfTeacher,
                            @Q1Rating, @Q2Rating, @Q3Rating, @Q4Rating, @Q5Rating, @Q6Rating, @Q7Rating,
                            @Q8Rating, @Q9Rating, @Q10Rating, @Q11Rating, @Q12Rating, @Q13Rating, @Q14Rating,
                            @Q15Rating, @Q16Rating, @Q17Rating, @Q18Rating, @Q19Rating, @Q20Rating, @comments)";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@FeedbackId", feedbackId);
                command.Parameters.AddWithValue("@EnrollmentId", enrollmentId);
                command.Parameters.AddWithValue("@TeacherId", teacherId);
                command.Parameters.AddWithValue("@Date", date);
                command.Parameters.AddWithValue("@Subject", subject);
                command.Parameters.AddWithValue("@NameOfTeacher", nameOfTeacher);
                command.Parameters.AddWithValue("@Q1Rating", q1Rating);
                command.Parameters.AddWithValue("@Q2Rating", q2Rating);
                command.Parameters.AddWithValue("@Q3Rating", q3Rating);
                command.Parameters.AddWithValue("@Q4Rating", q4Rating);
                command.Parameters.AddWithValue("@Q5Rating", q5Rating);
                command.Parameters.AddWithValue("@Q6Rating", q6Rating);
                command.Parameters.AddWithValue("@Q7Rating", q7Rating);
                command.Parameters.AddWithValue("@Q8Rating", q8Rating);
                command.Parameters.AddWithValue("@Q9Rating", q9Rating);
                command.Parameters.AddWithValue("@Q10Rating", q10Rating);
                command.Parameters.AddWithValue("@Q11Rating", q11Rating);
                command.Parameters.AddWithValue("@Q12Rating", q12Rating);
                command.Parameters.AddWithValue("@Q13Rating", q13Rating);
                command.Parameters.AddWithValue("@Q14Rating", q14Rating);
                command.Parameters.AddWithValue("@Q15Rating", q15Rating);
                command.Parameters.AddWithValue("@Q16Rating", q16Rating);
                command.Parameters.AddWithValue("@Q17Rating", q17Rating);
                command.Parameters.AddWithValue("@Q18Rating", q18Rating);
                command.Parameters.AddWithValue("@Q19Rating", q19Rating);
                command.Parameters.AddWithValue("@Q20Rating", q20Rating);


                command.ExecuteNonQuery();
            }

            connection.Close();
        }

    }

    private int GetNextFeedbackId(SqlConnection connection)
    {
        string query = "SELECT MAX(FeedbackId) FROM FEEDBACK";
        using (SqlCommand command = new SqlCommand(query, connection))
        {
            object result = command.ExecuteScalar();
            if (result != null && result != DBNull.Value)
            {
                int maxFeedbackId = (int)result;
                return maxFeedbackId + 1;
            }
            else
            {
                return 1;
            }
        }
    }
}
