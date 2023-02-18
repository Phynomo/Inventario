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
    public partial class EmpleadosIndex : System.Web.UI.Page
    {
        Clases.Utilitarios util = new Clases.Utilitarios();
        Clases.Empleados emp = new Clases.Empleados();
        public void cargarTabla()
        {
            DataSet ds = util.ObtenerDS($"EXEC UDP_IndexEmpleados ", "T");


            StringBuilder html = new StringBuilder();
            Literal cadena = new Literal();

            foreach (DataRow fila in ds.Tables["T"].Rows)
            {
                html.Append("<tr><td>" +
                    fila["emp_Id"] + "</td><td>" +
                    fila["Nombre"] + "</td><td>" +
                    fila["Edad"] + "</td><td>" +
                    fila["Sexo"] + "</td><td>" +
                    fila["car_Nombre"] + "</td><td>" +
                    fila["Ciudad"] + "</td><td>" +
                    fila["emp_DireccionExacta"] + "</td><td>" +
                    fila["emp_Telefono"] + "</td><td>" +
                    "<a class='fa fa-pencil btn btn-block btn-warning' style='color: black' onclick='Editar(" + fila["emp_Id"] + ")' ></a>" + "</td><td>" +
                    "<a class='fa fa-trash btn btn-block btn-danger' style='color: black' onclick='Eliminar(" + fila["emp_Id"] + ")' ></a>" + "</td></tr>"

                );
            }

            cadena.Text = html.ToString();

            Datos_Empleados.Controls.Add(cadena);
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            cargarTabla();
            if (!IsPostBack)
            {
                Session["IdEmpleado"] = null;
            }
            else
            {
                string eventtarget = Request["__EVENTTARGET"];
                string eventargument = Request["__EVENTARGUMENT"];

                if (eventtarget == "Editar")
                {
                    Editar(eventargument);
                }
                if (eventtarget == "Eliminar")
                {
                    Eliminar(eventargument);
                }
            }
        }


        public void Editar(string id)
        {
            Session["IdEmpleado"] = id;
            Response.Redirect("EmpleadosAdmin.aspx");
        }

        public void Eliminar(string id)
        {
            emp.EliminarEmpleado(id);
            Response.Redirect("EmpleadosIndex.aspx");
        }

        protected void btnNuevo_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("EmpleadosAdmin.aspx");
        }
    }
}