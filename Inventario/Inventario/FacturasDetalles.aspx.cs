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
    public partial class FacturasDetalles : System.Web.UI.Page
    {

        Clases.Utilitarios util = new Clases.Utilitarios();

        public void cargarTabla()
        {
            DataSet ds = util.ObtenerDS($"EXEC UDP_IndexFacturaDetalles '{Session["FacDetalles"].ToString()}'", "T");


            txtCliente.Text = ds.Tables["T"].Rows[0]["nombreCliente"].ToString();
            txtEmpleado.Text = ds.Tables["T"].Rows[0]["nombreEmpleado"].ToString();
            txtMetodo.Text = ds.Tables["T"].Rows[0]["metpago_Descripcion"].ToString(); 
            txtFacturaId.Text = ds.Tables["T"].Rows[0]["fac_Id"].ToString();
            txtFechaFactura.Text = ds.Tables["T"].Rows[0]["fac_Fecha"].ToString();
            txtSubTotal.Text = ds.Tables["T"].Rows[0]["Subtotal"].ToString();  
            txtIva.Text = ds.Tables["T"].Rows[0]["IVA"].ToString();
            txtTotal.Text = ds.Tables["T"].Rows[0]["Total"].ToString();

            StringBuilder html = new StringBuilder();
            Literal cadena = new Literal();

            foreach (DataRow fila in ds.Tables["T"].Rows)
            {
                html.Append("<tr><td>" +
                    fila["pro_Nombre"] + "</td><td>" +
                    fila["prov_Nombre"] + "</td><td>" +
                    fila["facd_Precio"] + "</td><td>" +
                    fila["facd_catidad"] + "</td><td>" +
                    fila["CantidadPrecio"] + "</td></tr>"

                );
            }

            cadena.Text = html.ToString();

            Datos_FacturaDetalles.Controls.Add(cadena);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            cargarTabla();
        }
    }
}