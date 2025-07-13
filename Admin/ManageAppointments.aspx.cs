using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHRAS_WebForms.Admin
{
    public partial class ManageAppointments : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        void BindGrid()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT A.AppointmentID, D.FullName AS DoctorName, P.FullName AS PatientName, 
                                A.AppointmentDate, A.AppointmentTime, A.Status
                                FROM Appointments A
                                INNER JOIN Doctors D ON A.DoctorID = D.DoctorID
                                INNER JOIN Patients P ON A.PatientID = P.PatientID";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewAppointments.DataSource = dt;
                GridViewAppointments.DataBind();
            }
        }

        protected void GridViewAppointments_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridViewAppointments.DataKeys[e.RowIndex].Value);
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "DELETE FROM Appointments WHERE AppointmentID = @id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            BindGrid();
        }
    }
}