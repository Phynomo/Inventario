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
    public partial class ClientesIndex : System.Web.UI.Page
    {
        Clases.Clientes Clientes = new Clases.Clientes();
        Clases.Utilitarios util = new Clases.Utilitarios();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["cli_Id"] = null;
                //proveedor.CargarGrid(gvProveedor,txtBuscar.Text);
                cargarTable();
            }
            else
            {

                string eventtarget = Request["__EVENTTARGET"];
                string eventargument = Request["__EVENTARGUMENT"];

                if (eventtarget == "Editar")
                {
                    Editar(eventargument);
                }

                else if (eventtarget == "Eliminar")
                {
                    Borrar(eventargument);

                }


            }
        }

        protected void btnNuevo_ServerClik(object sender, EventArgs e)
        {
            Response.Redirect("ClientesAdmin.aspx");
        }


        public void Editar(string id)
        {
            Session["cli_Id"] = id;
            Response.Redirect("ClientesAdmin.aspx");
        }

        public void Borrar(string id)
        {
            Clientes.Borrar(id);
            Response.Redirect("ClientesIndex.aspx");

        }


        public void cargarTable()
        {
            DataSet ds = util.ObtenerDS("EXEC UDP_LlenarCliente  ", "T");
            StringBuilder html = new StringBuilder();
            Literal cadena = new Literal();

            foreach (DataRow fila in ds.Tables["T"].Rows)
            {
                html.Append("<tr><td>" +
                    fila["cli_Id"] + "</td><td>" +
                    fila["cli_Nombre"] + "</td><td>" +
                    fila["cli_Apellido"] + "</td><td>" +
                    fila["mun_Nombre"] + "</td><td>" +
                    fila["cli_DireccionExacta"] + "</td><td>" +
                    fila["cli_Telefono"] + "</td><td>" +
                    fila["cli_CorreoElectronico"] + "</td><td>" +
                    "<a class='fa fa-pencil btn btn-block btn-warning' style='color: black' onclick='Editar(" + fila["cli_Id"] + ")'></a>" + "</td><td>" +
                    "<a class='fa fa-trash btn btn-block btn-danger' style='color:black' onclick='Eliminar(" + fila["cli_Id"] + ") '></a>" + "</td></tr>"
                    );
            }
            cadena.Text = html.ToString();
            Data_Alunmos.Controls.Add(cadena);
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("ClientesAdmin.aspx");
        }
    }
}