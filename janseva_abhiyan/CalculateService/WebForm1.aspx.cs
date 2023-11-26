using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CalculateService
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CalculatorService.CalculatorSoapClient client =
                new CalculatorService.CalculatorSoapClient();
          int result =  client.Calculate(Convert.ToInt16(txtFN.Text), Convert.ToInt16(txtSecond.Text));
            tblResult.Text = result.ToString();
        }
    }
}