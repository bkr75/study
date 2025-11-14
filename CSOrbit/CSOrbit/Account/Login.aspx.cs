using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;



namespace CSOrbit.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string cs = WebConfigurationManager.ConnectionStrings["CSOrbitDBConnection"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "SELECT FullName, Role FROM Users WHERE Email=@Email AND PasswordHash=@Password";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    string hashed = HashPassword(txtPassword.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", hashed);



                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        string fullName = reader["FullName"].ToString();
                        string role = reader["Role"].ToString();
                        reader.Close();

                        Session["UserEmail"] = txtEmail.Text;
                        Session["UserRole"] = role;
                        Session["FirstName"] = fullName.Split(' ')[0];

                        lblMsg.Text = "✅ Login successful! Redirecting...";
                        lblMsg.CssClass = "text-success";


                        string script = "setTimeout(function(){ window.location='../Default.aspx'; }, 1500);";
                        ClientScript.RegisterStartupScript(this.GetType(), "redirect", script, true);

                    }
                    else
                    {
                        lblMsg.Text = "❌ Invalid email or password!";
                        lblMsg.CssClass = "text-danger";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "❌ Error: " + ex.Message;
                lblMsg.CssClass = "text-danger";
            }
        }
        private string HashPassword(string password)
        {
            using (SHA256 sha = SHA256.Create())
            {
                byte[] bytes = sha.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder sb = new StringBuilder();
                foreach (byte b in bytes)
                {
                    sb.Append(b.ToString("x2"));
                }
                return sb.ToString();
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] != null)
            {
                Response.Redirect("~/Default.aspx");
            }
        }
    }
}