using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace CalculatorWebService
{
    /// <summary>
    /// Summary description for Calculator
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Calculator : System.Web.Services.WebService
    {

        [WebMethod(EnableSession = true)]
        public int Add(int FN, int SN)
        {
            List<string> calculation;
            if (Session["CALCULATION"] == null)
            {
                calculation = new List<string>();
            }
            else
            {
                calculation = (List<string>)Session["CALCULATION"];
            }
            string str = FN.ToString() + " + " + SN.ToString() + " = " + (FN + SN).ToString();
            calculation.Add(str);
            Session["CALCULATION"] = calculation;
            return FN + SN;
        }

        [WebMethod(EnableSession = true)]
        public List<string> GetCalculstions()
        {

            if (Session["CALCULATION"] == null)
            {
                List<string> calculations = new List<string>();
                calculations.Add("You have not performed any calculation");
                return calculations;
            }
            else
            {
                return (List<string>)Session["CALCULATION"];
            }
        }
    }
}
