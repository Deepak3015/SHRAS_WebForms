using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHRAS_WebForms.Patient
{
    public partial class Patient : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["PatientEmail"] == null)
                {
                    Response.Redirect("LoginPatient.aspx");
                }
                else
                {
                    string email = Session["PatientEmail"].ToString();
                    LoadPatientName(email);
                    LoadAppointments(email);
                }
            }
        }

        void LoadPatientName(string email)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT FullName FROM Patients WHERE Email = @Email";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", email);
                con.Open();
                object result = cmd.ExecuteScalar();
                if (result != null)
                {
                    lblPatientName.Text = result.ToString();
                }
            }
        }

        void LoadAppointments(string email)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"SELECT D.FullName AS DoctorName, D.Specialization, 
                                 A.AppointmentDate, A.AppointmentTime, A.Status
                                 FROM Appointments A
                                 INNER JOIN Doctors D ON A.DoctorID = D.DoctorID
                                 INNER JOIN Patients P ON A.PatientID = P.PatientID
                                 WHERE P.Email = @Email";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", email);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvAppointments.DataSource = dt;
                gvAppointments.DataBind();
            }
        }
    }
}