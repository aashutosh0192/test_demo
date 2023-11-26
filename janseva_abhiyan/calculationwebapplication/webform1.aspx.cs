using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace calculationwebapplication
{
    public partial class webform1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            Calculat.CalculatorSoapClient client = new Calculat.CalculatorSoapClient();
            int  result =  client.Add(Convert.ToInt32(txtNumber1.Text), Convert.ToInt32(txtNumber2.Text));
            lblResult.Text = result.ToString();

            GridView1.DataSource =  client.GetCalculstions();
            GridView1.DataBind();
            GridView1.HeaderRow.Cells[0].Text = "recent calculations";
        }
    }
}