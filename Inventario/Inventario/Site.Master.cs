using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventario
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Nombre"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnOut_Click(object sender, EventArgs e)
        {
            Session["Nombre"] = null;
            Session["IdUsuario"] = null;
            Session["IdEmpleado"] = null;

            Response.Redirect("Login.aspx");
        }
    }
}