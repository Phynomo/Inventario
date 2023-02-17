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
    public partial class ProductosIndex : System.Web.UI.Page
    {

        Clases.Productos productos = new Clases.Productos();
        Clases.Utilitarios util = new Clases.Utilitarios();

        protected void Page_Load(object sender, EventArgs e)
        {



            if (!IsPostBack)
            {
                Session["pro_Id"] = null;
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

                else if (eventtarget == "Borrar")
                {
                    Borrar(eventargument);

                }


            }
        }

        protected void btnNuevo_ServerClik(object sender, EventArgs e)
        {
            Response.Redirect("ProductosAdmin.aspx");
        }

        protected void btnBusca_Click(object sender, EventArgs e)
        {
            //proveedor.CargarGrid(gvProveedor, txtBuscar.Text);
        }
        public void Editar(string id)
        {
            Session["pro_Id"] = id;
            Response.Redirect("ProductosAdmin.aspx");
        }

        public void Borrar(string id)
        {
            productos.Borrar(id);
            Response.Redirect("ProductosIndex.aspx");

        }


        public void cargarTable()
        {
            DataSet ds = util.ObtenerDS("EXEC UDP_LlenarProductos  ", "T");
            StringBuilder html = new StringBuilder();
            Literal cadena = new Literal();

            foreach (DataRow fila in ds.Tables["T"].Rows)
            {
                html.Append("<tr><td>" +
                    fila["pro_Id"] + "</td><td>" +
                    fila["pro_Nombre"] + "</td><td>" +
                    fila["pro_Precio"] + "</td><td>" +
                    fila["cat_Descripcion"] + "</td><td>" +
                    fila["prov_Nombre"] + "</td><td>" +
                    fila["pro_Stock"] + "</td><td>" +
                    "<a class='fa fa-pencil btn btn-warning' style='color: black' onclick='Editar(" + fila["pro_Id"] + ")'></a>" + "</td><td>" +
                    "<a class='fa fa-trash btn btn-danger' style='color:black' onclick='Borrar(" + fila["pro_Id"] + ") '></a>" + "</td></tr>"
                    );
            }
            cadena.Text = html.ToString();
            Data_Alunmos.Controls.Add(cadena);
        }


        protected void btnNuevo_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("ProductosAdmin.aspx");
        }
    }
}