using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

namespace SHRAS_WebForms
{
    public partial class Login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM Users WHERE Username = @User AND Password = @Pass";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@User", txtUsername.Text);
                cmd.Parameters.AddWithValue("@Pass", txtPassword.Text);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();

                    string role = reader["Role"].ToString();
                    string username = reader["Username"].ToString();

                    Session["Role"] = role;
                    Session["Username"] = username;

                    if (role == "Doctor")
                    {
                        int doctorId = GetDoctorIdByUsername(username);

                        if (doctorId == 0)
                        {
                            lblMessage.Text = "Doctor record not found.";
                            return;
                        }

                        Session["DoctorID"] = doctorId;
                        Response.Redirect("~/Doctor/DoctorDashboard.aspx");
                    }
                    else if (role == "Admin")
                    {
                        Response.Redirect("~/Admin/AdminDashboard.aspx");
                    }
                    else if (role == "Patient")
                    {
                        Response.Redirect("~/Patient/PatientDashboard.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Invalid role.";
                    }

                    reader.Close();
                }
                else
                {
                    lblMessage.Text = "Invalid username or password.";
                }

                con.Close();
            }
        }


        private int GetDoctorIdByUsername(string username)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT DoctorID FROM Doctors WHERE Username = @Username";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Username", username);
                con.Open();

                object result = cmd.ExecuteScalar();
                return result != null ? Convert.ToInt32(result) : 0;
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Patient/RegisterPatient.aspx");
        }
    }
}
