﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace janseva_abhiyan
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("JSAjankaribharen.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("JAS_jankaripatrak.aspx");
        }
    }
}