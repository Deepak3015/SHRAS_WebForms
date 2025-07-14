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
            if (Session["Role"] == null || Session["Role"].ToString() != "Doctor")
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            int doctorId = Convert.ToInt32(Session["DoctorID"]);

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
                    WHERE A.DoctorID = @DoctorID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@DoctorID", doctorId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvAppointments.DataSource = dt;
                gvAppointments.DataBind();
            }
        }
    }
}
