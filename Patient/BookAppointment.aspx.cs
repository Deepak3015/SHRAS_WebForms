using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace SHRAS_WebForms.Patient
{
    public partial class BookAppointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["PatientEmail"] == null)
                {
                    Response.Redirect("LoginPatient.aspx");
                    return;
                }
                BindDoctorDropdown();
            }
        }

        private void BindDoctorDropdown()
        {
            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SELECT DoctorID, FullName FROM Doctors", con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                ddlDoctors.DataSource = rdr;
                ddlDoctors.DataTextField = "FullName";
                ddlDoctors.DataValueField = "DoctorID";
                ddlDoctors.DataBind();

                ddlDoctors.Items.Insert(0, new ListItem("Select Doctor", "0"));
            }
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            if (ddlDoctors.SelectedValue == "0")
            {
                lblMessage.Text = "Please select a doctor.";
                return;
            }

            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            string email = Session["PatientEmail"].ToString();
            int patientId = GetPatientIdByEmail(email);

            if (patientId == 0)
            {
                lblMessage.Text = "Patient not found!";
                return;
            }

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, AppointmentTime, Status) VALUES (@PatientID, @DoctorID, @Date, @Time, @Status)", con);

                cmd.Parameters.AddWithValue("@PatientID", patientId);
                cmd.Parameters.AddWithValue("@DoctorID", ddlDoctors.SelectedValue);
                cmd.Parameters.AddWithValue("@Date", txtAppointmentDate.Text);
                cmd.Parameters.AddWithValue("@Time", txtAppointmentTime.Text);
                cmd.Parameters.AddWithValue("@Status", "Pending");

                con.Open();
                cmd.ExecuteNonQuery();

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Appointment booked successfully!";
                ClearFields();
            }
        }

        private int GetPatientIdByEmail(string email)
        {
            int patientId = 0;
            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT PatientID FROM Patients WHERE Email = @Email";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", email);

                con.Open();
                object result = cmd.ExecuteScalar();
                if (result != null)
                {
                    patientId = Convert.ToInt32(result);
                }
            }

            return patientId;
        }

        private void ClearFields()
        {
            ddlDoctors.SelectedIndex = 0;
            txtAppointmentDate.Text = "";
            txtAppointmentTime.Text = "";
        }
    }
}
