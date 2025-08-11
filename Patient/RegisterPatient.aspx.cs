using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

namespace SHRAS_WebForms.Patient
{
    public partial class RegisterPatient : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {


                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Patients (FullName, Gender, Email, Password) VALUES (@FullName, @Gender, @Email, @Password)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@FullName", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());

                    con.Open();
                    int rows = cmd.ExecuteNonQuery();

                    if (rows > 0)
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        lblMessage.Text = "Registration successful!";
                        txtName.Text = txtEmail.Text = txtPassword.Text = "";
                        ddlGender.SelectedIndex = 0;
                        Response.Redirect("~/Patient/LoginPatient.aspx");
                    }
                    else
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Text = "Registration failed.";
                    }
                }
            }
        }


    }
}