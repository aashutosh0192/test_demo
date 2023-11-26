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
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //dropdistrict();
            if (!IsPostBack)
            {
                ddldistrict.DataSource = GetData("spGetDistrict", null);
                ddldistrict.DataBind();

                ListItem lidistrict = new ListItem("Select District", "-1");
                ddldistrict.Items.Insert(0, lidistrict);

                ddlpanchayat.DataSource = GetData("spGetpanchayat", null);
                ddlpanchayat.DataBind();

                ListItem lipanchayat = new ListItem("Select Panchayat", "-1");
                ddlpanchayat.Items.Insert(0, lipanchayat);

                ddldays1.DataSource = GetData("spGetDays", null);
                ddldays1.DataBind();

                ListItem liday = new ListItem("Select Day", "-1");
                ddldays1.Items.Insert(0, liday);
                //ddlpanchayat.Enabled = false;
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
            string cs = ConfigurationManager.ConnectionStrings["JSADB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("spInsertJankari", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@district", ddldistrict.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@panchayat", ddlpanchayat.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@tour_date", txtbhramandate.Text);
                    cmd.Parameters.AddWithValue("@days", ddldays1.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@condition_shivir", shivir_radiobutton.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@total_emp", txttotalemp.Text);
                    cmd.Parameters.AddWithValue("@present_emp",  txtpresentemp.Text);
                    cmd.Parameters.AddWithValue("@absent_emp",  txtabsentemp.Text);
                    cmd.Parameters.AddWithValue("@absent_emp_name", txtempname.Text);
                    cmd.Parameters.AddWithValue("@absent_emp_post", txtemppost.Text);
                    cmd.Parameters.AddWithValue("@application_solved", txtsolvedapplication.Text);
                    cmd.Parameters.AddWithValue("@application_pending",txtpendingapplication.Text);

                    SqlParameter para = new SqlParameter();
                    para.ParameterName = "@id";
                    para.DbType = DbType.Int32;
                    para.Direction = ParameterDirection.Output;
                    cmd.Parameters.Add(para);

                    con.Open();
                    cmd.ExecuteNonQuery();

                    string insertID = para.Value.ToString();
                    lbtoutput.Text = insertID;

                    string str = "alert('Data Submited sucessfully');";
                    ScriptManager.RegisterStartupScript(this, GetType(), " ServerControlScript", str, true);

                }

            }
        }


        //protected void ddldistrict_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (ddldistrict.SelectedIndex == 0)
        //    {
        //        ddlpanchayat.SelectedIndex = 0;
        //        ddlpanchayat.Enabled = false;
        //    }
        //    else
        //    {
        //        ddlpanchayat.Enabled = true;
        //        SqlParameter param = new SqlParameter("@district_id", ddldistrict.SelectedValue);
        //        DataSet ds = GetData("spGetpanchayatbydistrict", param);

        //        ddlpanchayat.DataSource = ds;
        //        ddlpanchayat.DataBind();

        //        ListItem lipanchayat = new ListItem("Select Panchayat", "-1");
        //        ddlpanchayat.Items.Insert(0, lipanchayat);
        //    }
        //}

        //private void dropdistrict()
        //{

        //        string cs = ConfigurationManager.ConnectionStrings["JSADB"].ConnectionString;
        //        using (SqlConnection con = new SqlConnection(cs))
        //        {
        //            using (SqlCommand cmd = new SqlCommand("select id, district from tbldistrict", con))
        //            {
        //                cmd.CommandType = CommandType.Text;
        //                con.Open();
        //                ddldistrict.DataSource = cmd.ExecuteReader();
        //                ddldistrict.DataTextField = "district";
        //                ddldistrict.DataValueField = "id";
        //                ddldistrict.DataBind();
        //            }
        //        }

        //}




    }
}