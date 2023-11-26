using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace janseva_abhiyan
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddldistrict.DataSource = GetData("spGetDistrict", null);
                ddldistrict.DataBind();

                ListItem lidistrict = new ListItem("Select District", "-1");
                ddldistrict.Items.Insert(0, lidistrict);
            }
        }


        private DataSet GetData(string SPName, SqlParameter spParameter)
        {
            string cs = ConfigurationManager.ConnectionStrings["JSADB"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter da = new SqlDataAdapter(SPName, con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (spParameter != null)
            {
                da.SelectCommand.Parameters.Add(spParameter);
            }
            DataSet ds = new DataSet();
            da.Fill(ds);

            return ds;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try { 
            string ddldist = ddldistrict.SelectedItem.Text;
            string cs = ConfigurationManager.ConnectionStrings["JSADB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from tblJanAbhiyanFill where district ='"+ddldist+"'", con);
                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
            }
            }
            catch(Exception ex)
            {

                string str = "alert('Record Not Found');";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", str, true);
            }
        }
    }
}