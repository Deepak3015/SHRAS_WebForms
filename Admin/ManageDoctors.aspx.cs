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
    public partial class ManageDoctors : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Doctors", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewDoctors.DataSource = dt;
                GridViewDoctors.DataBind();
            }
        }

        protected void btnAddDoctor_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "INSERT INTO Doctors (FullName, Specialization, Email, Phone) VALUES (@Name, @Specialty, @Email, @Phone)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Specialty", txtSpecialty.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.Trim());

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                lblMessage.Text = "Doctor Added Successfully!";
                BindGrid();
            }
        }

        protected void GridViewDoctors_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridViewDoctors.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Doctors WHERE DoctorID = @id", con);
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                lblMessage.Text = "Doctor Deleted Successfully!";
                BindGrid();
            }
        }
    }
}