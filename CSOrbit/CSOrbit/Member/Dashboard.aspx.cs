using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace CSOrbit.Member
{
    public partial class Dashboard : System.Web.UI.Page
    {
        string cs = WebConfigurationManager.ConnectionStrings["CSOrbitDBConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("~/Account/Login.aspx");
                return;
            }

            if (!IsPostBack)
                LoadSuggestedResources();
        }

        private void LoadSuggestedResources()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT TOP 6 Title, Description, Category, FilePath 
                                 FROM Resources ORDER BY NEWID()"; // random suggestions
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }
        }
    }
}