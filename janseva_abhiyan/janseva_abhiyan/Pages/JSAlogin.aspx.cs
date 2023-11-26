using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace janseva_abhiyan
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["JSADB"].ConnectionString; ;
            string loginId = txtloginID.Text;
            string password = txtPassword.Text;
            bool isValidUser = false;

            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("LoginUser", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Username", loginId);
                    cmd.Parameters.AddWithValue("@Password", password);

                    SqlParameter isValidUserParam = new SqlParameter("@IsValidUser", SqlDbType.Bit);
                    isValidUserParam.Direction = ParameterDirection.Output;
                    cmd.Parameters.Add(isValidUserParam);

                    con.Open();

                    cmd.ExecuteReader();

                    // Retrieve the value of the output parameter
                    isValidUser = (bool)isValidUserParam.Value;

                    // Close the database connection
                    con.Close();
                }
                if (!isValidUser)
                {
                    // The login ID and password are valid
                   
                    Response.Redirect("JSA_Patrak_bhare.aspx");

                }
                else
                {
                    // The login ID and password are invalid
                    // Show an error message or take appropriate action
                    // Example usage
                    string errorMessage = "Invalid login credentials.";
                    ShowMessageBox(errorMessage);

                }
            }


        }

        protected void ShowMessageBox(string message)
        {
            string script = $@"<script type='text/javascript'>alert('{message}');</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "MessageBox", script);
        }
    }
}