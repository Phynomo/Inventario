using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventario
{
    public partial class Login : System.Web.UI.Page
    {
        Clases.Utilitarios util = new Clases.Utilitarios();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIniciarSesion_ServerClick(object sender, EventArgs e)
        {
            if (txtUsuario.Value != "" && txtpassword.Value != "")
            {
                string sql = $"EXEC UDP_Login '{txtUsuario.Value}', '{txtpassword.Value}'";
                DataSet ds = new DataSet();
                ds = util.ObtenerDS(sql, "T");

                if (ds.Tables["T"].Rows.Count == 1)
                {
                    Session["Nombre"] = ds.Tables["T"].Rows[0]["emp_Nombre"].ToString();
                    Session["IdUsuario"] = ds.Tables["T"].Rows[0]["usu_Id"].ToString();
                    Session["IdEmpleado"] = ds.Tables["T"].Rows[0]["emp_Id"].ToString();

                    Response.Redirect("Inicio.aspx");
                }

            }
            else
            {

            }
        }
    }
}