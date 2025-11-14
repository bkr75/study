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
    public partial class Register : System.Web.UI.Page
    {
        protected async void btnRegister_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string cs = WebConfigurationManager.ConnectionStrings["CSOrbitDBConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                try
                {
                    con.Open();


                    string checkQuery = "SELECT COUNT(*) FROM Users WHERE Email=@Email";
                    SqlCommand checkCmd = new SqlCommand(checkQuery, con);
                    checkCmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    int exists = (int)checkCmd.ExecuteScalar();

                    if (exists > 0)
                    {
                        lblMsg.Text = "⚠️ Email already registered!";
                        lblMsg.CssClass = "text-danger";
                        return;
                    }


                    string insertQuery = "INSERT INTO Users (FullName, Email, PasswordHash, Role) VALUES (@FullName, @Email, @Password, 'Member')";
                    SqlCommand cmd = new SqlCommand(insertQuery, con);
                    cmd.Parameters.AddWithValue("@FullName", txtName.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    string hashed = HashPassword(txtPassword.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", hashed);

                    cmd.ExecuteNonQuery();


                    
                    lblMsg.Text = "✅ Registration successful! Redirecting to login...";
                    lblMsg.CssClass = "text-success";

                   
                    string script = "setTimeout(function(){ window.location='Login.aspx'; }, 1500);";
                    ClientScript.RegisterStartupScript(this.GetType(), "redirect", script, true);

                }
                catch (Exception ex)
                {
                    lblMsg.Text = "❌ Error: " + ex.Message;
                    lblMsg.CssClass = "text-danger";
                }
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