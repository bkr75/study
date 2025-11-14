using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSOrbit
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] != null)
            {
                phGuestLinks.Visible = false;
                phUserLinks.Visible = true;


                string role = Session["UserRole"] != null ? Session["UserRole"].ToString() : "Member";

                if (role == "Admin")
                    lnkDashboard.NavigateUrl = "~/Admin/Dashboard.aspx";
                else
                    lnkDashboard.NavigateUrl = "~/Member/Dashboard.aspx";
            }
            else
            {
                phGuestLinks.Visible = true;
                phUserLinks.Visible = false;
            }
        }

    }
}