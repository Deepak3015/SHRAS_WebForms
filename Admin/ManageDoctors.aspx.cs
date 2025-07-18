using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

namespace SHRAS_WebForms.Admin
{
    public partial class ManageDoctors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDoctorGrid();
            }
        }

        private void BindDoctorGrid()
        {
            string conStr = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            string query = "SELECT DoctorID, FullName, Specialization, Email, Phone, Username FROM Doctors";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            GridViewDoctors.DataSource = cmd.ExecuteReader();
            GridViewDoctors.DataBind();
            con.Close();
        }

        protected void btnAddDoctor_Click(object sender, EventArgs e)
        {
            string fullName = txtName.Text.Trim();
            string specialty = txtSpecialty.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phone = txtPhone.Text.Trim();

            
            string firstName = fullName.Split(' ')[0];
            Random rnd = new Random();
            string username = "dr." + firstName.ToLower() + rnd.Next(100, 999);
            string tempPassword = Guid.NewGuid().ToString().Substring(0, 8);

#pragma warning disable CS0618
            string hashedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(tempPassword, "SHA1");
#pragma warning restore CS0618

            string conStr = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();
                SqlTransaction transaction = con.BeginTransaction();

                try
                {
                    
                    string doctorQuery = "INSERT INTO Doctors (FullName, Specialization, Email, Phone, Username, Password) " +
                                         "VALUES (@FullName, @Specialization, @Email, @Phone, @Username, @Password)";

                    SqlCommand cmdDoctor = new SqlCommand(doctorQuery, con, transaction);
                    cmdDoctor.Parameters.AddWithValue("@FullName", fullName);
                    cmdDoctor.Parameters.AddWithValue("@Specialization", specialty);
                    cmdDoctor.Parameters.AddWithValue("@Email", email);
                    cmdDoctor.Parameters.AddWithValue("@Phone", phone);
                    cmdDoctor.Parameters.AddWithValue("@Username", username);
                    cmdDoctor.Parameters.AddWithValue("@Password", hashedPassword);

                    cmdDoctor.ExecuteNonQuery();

                    
                    string userQuery = "INSERT INTO Users (Username, Password, Role) VALUES (@Username, @Password, @Role)";
                    SqlCommand cmdUser = new SqlCommand(userQuery, con, transaction);
                    cmdUser.Parameters.AddWithValue("@Username", username);
                    cmdUser.Parameters.AddWithValue("@Password", tempPassword); 
                    cmdUser.Parameters.AddWithValue("@Role", "Doctor");

                    cmdUser.ExecuteNonQuery();

                    transaction.Commit();

                    lblCredentials.Text = "Doctor Created! <br/> Username: <b>" + username + "</b> <br/> Password: <b>" + tempPassword + "</b>";
                    lblMessage.Text = "";


                    BindDoctorGrid();

                    
                    txtName.Text = "";
                    txtSpecialty.Text = "";
                    txtEmail.Text = "";
                    txtPhone.Text = "";
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }
        }


        protected void GridViewDoctors_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int doctorId = Convert.ToInt32(GridViewDoctors.DataKeys[e.RowIndex].Value);

            string conStr = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = "DELETE FROM Doctors WHERE DoctorID=@DoctorID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@DoctorID", doctorId);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            BindDoctorGrid();
        }
    }
}
