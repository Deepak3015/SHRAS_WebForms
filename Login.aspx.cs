using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHRAS_WebForms
{
    public partial class Login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs)) {
                string query = "Select * From Users Where Username = @User AND Password = @Pass";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@User", txtUsername.Text);
                cmd.Parameters.AddWithValue("@Pass", txtPassword.Text);
                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();

                    string role = reader["Role"].ToString();
                    string name = reader["Username"].ToString();
                    Session["Role"] = role;
                    Session["Username"] = name;

                    if (role == "Admin")
                    {
                        Response.Redirect("~/Admin/AdminDashboard.aspx");
                    }
                    else if (role == "Doctor")
                    {
                        Response.Redirect("~/Doctor/DoctorDashboard.aspx");
                    }
                    else if (role == "Patient")
                    {
                        Response.Redirect("~/Patient/PatientDashboard.aspx");
                    }
                    else
                    {
                        lblMessage.Text = " Invalid username or password.";
                    }
                    reader.Close();
                    con.Close();
                }


            }

        }
    }
}