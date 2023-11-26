using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace janseva_abhiyan
{
    /// <summary>
    /// Summary description for calculateage
    /// </summary>
    [WebService(Namespace = "http://JSAhome.aspx/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class calculateage : System.Web.Services.WebService
    {

        [WebMethod]
        public int CalculateAge(string selectedDate)
        {
            DateTime birthDate = DateTime.Parse(selectedDate);
            DateTime currentDate = DateTime.Today;
            int age = currentDate.Year - birthDate.Year;

            // Check if the birth date hasn't occurred yet in the current year
            if (birthDate > currentDate.AddYears(-age))
            {
                age--;
            }

            return age;
        }
    }
}
