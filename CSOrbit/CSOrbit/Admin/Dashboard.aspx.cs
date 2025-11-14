using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSOrbit.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        string cs = WebConfigurationManager.ConnectionStrings["CSOrbitDBConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null || Session["UserRole"].ToString() != "Admin")
            {
                Response.Redirect("~/Account/Login.aspx");
                return;
            }

            if (!IsPostBack)
                BindResources();
        }

        private void BindResources()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Resources ORDER BY CreatedAt DESC", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtTitle.Text) ||
                string.IsNullOrWhiteSpace(txtDesc.Text) ||
                string.IsNullOrWhiteSpace(txtCat.Text) ||
                string.IsNullOrWhiteSpace(txtLink.Text))
            {
                lblMsg.Text = "⚠️ Please fill all fields including the link.";
                lblMsg.CssClass = "text-danger";
                return;
            }

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"INSERT INTO Resources 
                         (Title, Description, Category, FilePath, CreatedAt)
                         VALUES (@t, @d, @c, @f, GETDATE())";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@t", txtTitle.Text.Trim());
                cmd.Parameters.AddWithValue("@d", txtDesc.Text.Trim());
                cmd.Parameters.AddWithValue("@c", txtCat.Text.Trim());
                cmd.Parameters.AddWithValue("@f", txtLink.Text.Trim());
                con.Open();
                cmd.ExecuteNonQuery();
            }

            lblMsg.Text = "✅ Resource added successfully!";
            lblMsg.CssClass = "text-success";
            txtTitle.Text = txtDesc.Text = txtCat.Text = txtLink.Text = "";
            BindResources();
        }



        protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindResources();
        }

        protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindResources();
        }

        protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            string title = ((System.Web.UI.WebControls.TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string desc = ((System.Web.UI.WebControls.TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
            string cat = ((System.Web.UI.WebControls.TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "UPDATE Resources SET Title=@t, Description=@d, Category=@c WHERE ResourceID=@id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@t", title);
                cmd.Parameters.AddWithValue("@d", desc);
                cmd.Parameters.AddWithValue("@c", cat);
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                cmd.ExecuteNonQuery();
                GridView1.EditIndex = -1;
                BindResources();
                lblMsg.Text = "✅ Resource updated successfully.";
                lblMsg.CssClass = "text-success";
            }
        }

        protected void GridView1_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "DELETE FROM Resources WHERE ResourceID=@id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                cmd.ExecuteNonQuery();
                BindResources();
                lblMsg.Text = "🗑️ Resource deleted.";
                lblMsg.CssClass = "text-danger";
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string search = txtSearch.Text.Trim();

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT * FROM Resources 
                         WHERE Title LIKE @search OR Category LIKE @search
                         ORDER BY CreatedAt DESC";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@search", "%" + search + "%");

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            BindResources();
        }

    }
}