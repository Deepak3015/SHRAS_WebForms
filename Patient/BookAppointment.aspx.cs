using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHRAS_WebForms.Patient
{
    public partial class BookAppointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDoctors();
            }
        }

        private void BindDoctors()
        {
            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SELECT DoctorID, FullName FROM Doctors", con);
                con.Open();
                ddlDoctors.DataSource = cmd.ExecuteReader();
                ddlDoctors.DataTextField = "FullName";
                ddlDoctors.DataValueField = "DoctorID";
                ddlDoctors.DataBind();
                ddlDoctors.Items.Insert(0, new ListItem("Select Doctor", "0"));
            }
        }
        protected void btnBook_Click(object sender, EventArgs e)
        {
            if (ddlDoctors.SelectedIndex == 0)
            {
                lblMessage.Text = "Please select a doctor.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, AppointmentTime) VALUES (@PatientID, @DoctorID, @Date, @Time)", con);
                cmd.Parameters.AddWithValue("@PatientID", Session["PatientID"]);
                cmd.Parameters.AddWithValue("@DoctorID", ddlDoctors.SelectedValue);
                cmd.Parameters.AddWithValue("@Date", txtDate.Text);
                cmd.Parameters.AddWithValue("@Time", txtTime.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                lblMessage.Text = "Appointment booked successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
        }


    }
}