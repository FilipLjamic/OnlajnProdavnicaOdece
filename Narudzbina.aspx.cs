using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlajnProdavnicaOdece
{
    public partial class Narudzbina : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int NarId = Convert.ToInt32(Request.QueryString["ID"]);
            Response.Write(NarId);
        }
    }
}