using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace janseva_abhiyan
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string password = txtpassword.Text;
            string encryptedPassword = EncryptPassword(password);

            // Save the encrypted password to the database
            // ...

            // Clear the password field for security purposes
            txtpassword.Text = string.Empty;
            try
            {
                string CS = ConfigurationManager.ConnectionStrings["JSADB"].ConnectionString;
                string SP = "InsertRegistration";

                using (SqlConnection con = new SqlConnection(CS))
                {
                    using (SqlCommand cmd = new SqlCommand(SP, con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@Name", txtname.Text);
                        cmd.Parameters.AddWithValue("@EmailID", txtemail.Text);
                        cmd.Parameters.AddWithValue("@Password", txtpassword.Text);

                        // Open the database connection
                        con.Open();

                        // Execute the stored procedure (assuming no result is returned)
                        cmd.ExecuteNonQuery();

                        // Close the database connection
                        con.Close();
                    }
                }
                string str = "alert('You are registered Successfully');";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", str, true);
            }
            catch (Exception ex)
            {
                string str = "alert('Unfortunatly You are not registered Successfully');";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", str, true);
            }
        }

        private string EncryptPassword(string Password)
        {
            using (SHA256 sha = SHA256.Create())
            {
                byte[] bytes = Encoding.UTF8.GetBytes(Password);
                byte[] hash = sha.ComputeHash(bytes);

                StringBuilder sb = new StringBuilder();
                foreach (byte b in hash)
                {
                    sb.Append(b.ToString("x2")); // Convert each byte to its hexadecimal representation
                }

                return sb.ToString();
            }
        }
    }
}