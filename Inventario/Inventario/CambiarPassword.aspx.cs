using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventario
{
    public partial class CambiarPassword : System.Web.UI.Page
    {
        Clases.Usuarios usu = new Clases.Usuarios();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblUsuarioAste.Visible = false;
            lblPasswordAste.Visible = false;
        }

        protected void btnCambiarPassword_ServerClick(object sender, EventArgs e)
        {
            if (txtUsuario.Value != "" && txtPassword.Value != "")
            {
                usu.CambiarContrasenia(txtUsuario.Value,txtPassword.Value);
                Response.Redirect("Login.aspx");
            }
            else
            {
                if (txtUsuario.Value == "")
                {
                    lblUsuarioAste.Visible = true;
                }
                if (txtPassword.Value == "")
                {
                    lblPasswordAste.Visible = true;
                }
            }
        }
    }
}