using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHRAS_WebForms.Admin
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void btnViewDoctors_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageDoctors.aspx");
        }

        protected void btnViewPatients_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManagePatients.aspx");
        }

        protected void btnViewAppointments_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageAppointments.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }
    }
}