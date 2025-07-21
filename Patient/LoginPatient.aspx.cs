using System;
using System.Configuration;
using System.Data.SqlClient;

namespace SHRAS_WebForms.Patient
{
    public partial class LoginPatient : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Patients WHERE Email = @Email AND Password = @Password";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    reader.Read();

                    Session["PatientEmail"] = reader["Email"].ToString();
                    Session["PatientName"] = reader["FullName"].ToString();
                    Session["PatientID"] = reader["PatientID"].ToString();

                    Response.Redirect("PatientDashboard.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid email or password.";
                }

                reader.Close();
            }
        }
    }
}
