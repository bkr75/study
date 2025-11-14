using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSOrbit
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["FirstName"] != null)
                {
                    lblWelcome.Text = "Welcome back, " + Session["FirstName"].ToString();
                }
                else
                {
                    lblWelcome.Text = "Welcome to";
                }
            }
        }

    }
}