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
    public partial class ProveedoresIndex : System.Web.UI.Page
    {

        Clases.Proveedor proveedor = new Clases.Proveedor();
        Clases.Utilitarios util = new Clases.Utilitarios();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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
            Response.Redirect("ProveedorAdmin.aspx");
        }

        protected void btnBusca_Click(object sender, EventArgs e)
        {
            //proveedor.CargarGrid(gvProveedor, txtBuscar.Text);
        }
        public void Editar(string id)
        {
            Session["prov_Id"] = id;
            Response.Redirect("ProveedorAdmin.aspx");
        }

        public void Borrar(string id)
        {
            proveedor.Borrar(id);
            Response.Redirect("ProveedoresIndex.aspx");

        }

        protected void gvProveedor_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //gvProveedor.PageIndex = e.NewPageIndex;
        }
        public void cargarTable()
        {
            DataSet ds = util.ObtenerDS("EXEC UDP_BuscarProveedores '' ", "T");
            StringBuilder html = new StringBuilder();
            Literal cadena = new Literal();

            foreach (DataRow fila in ds.Tables["T"].Rows)
            {
                html.Append("<tr><td>" +
                    fila["prov_Id"] + "</td><td>" +
                    fila["prov_Nombre"] + "</td><td>" +
                    fila["mun_Nombre"] + "</td><td>" +
                    fila["prov_DireccionExacta"] + "</td><td>" +
                    fila["prov_Telefono"] + "</td><td>" +
                    fila["prov_Email"] + "</td><td>" +
                    "<a class='fa fa-pencil btn btn-warning' style='color: black' onclick='Editar(" + fila["prov_Id"] + ")'></a>" + "</td><td>" +
                    "<a class='fa fa-trash btn btn-danger' style='color:black' onclick='Eliminar(" + fila["prov_Id"] + ") '></a>" + "</td></tr>"
                    );
            }
            cadena.Text = html.ToString();
            Data_Alunmos.Controls.Add(cadena);
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProveedorAdmin.aspx");
        }


    }
}