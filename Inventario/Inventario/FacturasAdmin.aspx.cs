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

    public partial class FacturasAdmin : System.Web.UI.Page
    {
        Clases.Utilitarios util = new Clases.Utilitarios();
        Clases.Facturas factu = new Clases.Facturas();
        public void cargarTabla()
        {
            if (Session["FacDetalles"] != null)
            {
                DataSet ds = util.ObtenerDS($"EXEC UDP_IndexFacturaDetalles '{Session["FacDetalles"].ToString()}'", "T");


                //txtCliente.Text = ds.Tables["T"].Rows[0]["nombreCliente"].ToString();
                //txtEmpleado.Text = ds.Tables["T"].Rows[0]["nombreEmpleado"].ToString();
                //txtMetodo.Text = ds.Tables["T"].Rows[0]["metpago_Descripcion"].ToString();
                //txtFacturaId.Text = ds.Tables["T"].Rows[0]["fac_Id"].ToString();
                //txtFechaFactura.Text = ds.Tables["T"].Rows[0]["fac_Fecha"].ToString();
                //txtSubTotal.Text = ds.Tables["T"].Rows[0]["Subtotal"].ToString();
                //txtIva.Text = ds.Tables["T"].Rows[0]["IVA"].ToString();
                //txtTotal.Text = ds.Tables["T"].Rows[0]["Total"].ToString();

                StringBuilder html = new StringBuilder();
                Literal cadena = new Literal();

                foreach (DataRow fila in ds.Tables["T"].Rows)
                {
                    html.Append("<tr><td>" +
                        fila["pro_Nombre"] + "</td><td>" +
                        fila["prov_Nombre"] + "</td><td>" +
                        fila["facd_Precio"] + "</td><td>" +
                        fila["facd_catidad"] + "</td><td>" +
                        fila["CantidadPrecio"] + "</td><td>" +
                        "<a class='fa fa-trash btn btn-block btn-danger' style='color: black' onclick='Eliminar(" + fila["fac_Id"] + ")' ></a>" + "</td></tr>"

                    );
                }

                cadena.Text = html.ToString();

                Datos_Productos.Controls.Add(cadena);
            }

        }



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlProducto.Enabled = false;
                txtCantidad.Enabled = false;
                btnAgregarProducto.Enabled = false;
            }
            
            cargarTabla();
            string sqlClientes = $"SELECT [cli_Id] ,[cli_Nombre]+' '+[cli_Apellido] as nombre FROM [dbo].[tbClientes] Where cli_Estado = 1";
            util.CargarDdl(sqlClientes, ddlCliente);

            string sqlMetodosPago = $"SELECT [metpago_Id] ,[metpago_Descripcion] FROM [dbo].[tbMetodoPago] WHERE metpago_Estado = 1";
            util.CargarDdl(sqlMetodosPago, ddlMetodoPago);

            string sqlProductos = $"SELECT [pro_Id],[pro_Nombre] FROM [dbo].[tbProductos] WHERE pro_Estado = 1";
            util.CargarDdl(sqlProductos, ddlProducto);
        }

        protected void btnAgregarProducto_Click(object sender, EventArgs e)
        {

        }

        protected void btnComenzar_Click(object sender, EventArgs e)
        {

            factu.InsertarFactura(ddlCliente.SelectedValue, "1", "1", ddlMetodoPago.SelectedValue);

            string sql = "SELECT MAX(fac_Id) as Maximo FROM [Tienda_Inventario].[dbo].[tbFactura]";
            DataSet ds = new DataSet();
            ds = util.ObtenerDS(sql, "T");
            Session["FacDetalles"] = ds.Tables["T"].Rows[0]["Maximo"].ToString();
            ddlCliente.Enabled = false;
            ddlMetodoPago.Enabled = false;
            ddlProducto.Enabled = true;
            txtCantidad.Enabled = true;
            btnAgregarProducto.Enabled = true;
        }
    }
}