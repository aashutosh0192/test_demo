using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using Microsoft.Reporting.WebForms;
namespace janseva_abhiyan
{
    public partial class JSA_rdlc : System.Web.UI.Page
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            string ddldist = ddldistrict.SelectedItem.Text;
            string cs = ConfigurationManager.ConnectionStrings["JSADB"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter da = new SqlDataAdapter("select * from tblJanAbhiyanFill where district ='" + ddldist + "'", con);

            DataTable dt = new DataTable("tbljanabhiyanfill");
            da.Fill(dt);
            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("jsareport.rdlc");
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("DataSet1.xsd", dt));
            ReportViewer1.LocalReport.Refresh();
        }
    }
}