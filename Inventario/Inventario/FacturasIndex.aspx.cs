using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventario
{
    public partial class FacturasIndex : System.Web.UI.Page
    {

        Clases.Utilitarios util = new Clases.Utilitarios();

        public void cargarTabla()
        {
            DataSet ds = util.ObtenerDS("EXEC UDP_IndexFacturas", "T");

            StringBuilder html = new StringBuilder();
            Literal cadena = new Literal();

            foreach (DataRow fila in ds.Tables["T"].Rows)
            {
                html.Append("<tr><td>" +
                    fila["fac_Id"] + "</td><td>" +
                    fila["nombreCliente"] + "</td><td>" +
                    fila["nombreEmpleado"] + "</td><td>" +
                    fila["metpago_Descripcion"] + "</td><td>" +
                    fila["fac_Fecha"] + "</td><td>" +
                    "<a class='fa fa-align-left btn btn-block btn-success' style='color: black' onclick='Detalles(" + fila["fac_Id"] + ")' ></a>" + "</td><td>" +
                    "<a class='fa fa-pencil btn btn-block btn-warning' style='color: black' onclick='Editar(" + fila["fac_Id"] + ")' ></a>" + "</td><td>" +
                    "<a class='fa fa-trash btn btn-block btn-danger' style='color: black' onclick='Eliminar(" + fila["fac_Id"] + ")' ></a>" + "</td></tr>"


                );
            }

            cadena.Text = html.ToString();

            Datos_Facturas.Controls.Add(cadena);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            cargarTabla();

            if (!IsPostBack)
            {
                
            }
            else
            {
                string eventtarget = Request["__EVENTTARGET"];
                string eventargument = Request["__EVENTARGUMENT"];

                if (eventtarget == "Editar" || Session["IdUsuarios"] != null)
                {

                    Editar(eventargument);
                    Response.Write("<script src='Content/js/jquery-3.1.1.min.js'></script>");
                    Response.Write("<script src = 'Content/js/bootstrap.js' ></script>");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "myFuncionAlerta", "ModalEditar();", true);
                }

                if (eventtarget == "Eliminar")
                {
                    Eliminar(eventargument);
                }

                if (eventtarget == "Detalles")
                {
                    Session["FacDetalles"] = eventargument;
                    Response.Redirect("FacturasDetalles.aspx");
                }
            }

        }



        public void Editar(string id)
        {
            if (Session["IdUsuarios"] == null)
            {
                //Session["IdUsuarios"] = id;
                //CargarDatos(id);
            }

        }


        public void Eliminar(string id)
        {
            //usu.EliminarUsuario(id);
            //Response.Redirect("UsuariosIndex.aspx");
        }

        protected void btnNuevo_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("FacturasAdmin.aspx");
        }
    }
}