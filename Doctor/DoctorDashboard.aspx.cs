using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace SHRAS_WebForms.Doctor
{
    public partial class DoctorDashboard : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAppointments();
            }
        }

        private void LoadAppointments()
        {
            string doctorEmail = Session["Username"]?.ToString(); // doctor email from login

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"
                    SELECT 
                        A.AppointmentID,
                        P.FullName AS PatientName,
                        A.AppointmentDate,
                        A.AppointmentTime,
                        A.Status
                    FROM Appointments A
                    INNER JOIN Patients P ON A.PatientID = P.PatientID
                    INNER JOIN Doctors D ON A.DoctorID = D.DoctorID
                    WHERE D.Email = @DoctorEmail";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@DoctorEmail", doctorEmail);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvAppointments.DataSource = dt;
                gvAppointments.DataBind();
            }
        }
    }
}
