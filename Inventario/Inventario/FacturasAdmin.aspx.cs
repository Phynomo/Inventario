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
            if (Session["FacDetalles"] != null && Session["FacDetalles"].ToString() != "")
            {
                DataSet ds = util.ObtenerDS($"EXEC UDP_IndexFacturaDetalles '{Session["FacDetalles"].ToString()}'", "T");


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
                        "<a class='fa fa-trash btn btn-block btn-danger' style='color: black' onclick='Eliminar(" + fila["facd_Id"] + ")' ></a>" + "</td></tr>"

                    );
                }

                cadena.Text = html.ToString();

                Datos_Productos.Controls.Add(cadena);
            }

        }

        public void Eliminar(string id) 
        {
            string sqlEliminarDetalle = $"DELETE FROM [dbo].[tbFDetalles] WHERE facd_Id = '{id}'";
            util.ObtenerDS(sqlEliminarDetalle, "T");
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            lblClienteAste.Visible = false;
            lblMetodoPagoAste.Visible = false;
            lblProductoAste.Visible = false;
            lblCantidadAste.Visible = false;


            if (!IsPostBack)
            {
                
                ddlProducto.Enabled = false;
                txtCantidad.Enabled = false;
                btnAgregarProducto.Enabled = false;
                string sqlClientes = $"SELECT [cli_Id] ,[cli_Nombre]+' '+[cli_Apellido] as nombre FROM [dbo].[tbClientes] Where cli_Estado = 1";
                util.CargarDdl(sqlClientes, ddlCliente);

                string sqlMetodosPago = $"SELECT [metpago_Id] ,[metpago_Descripcion] FROM [dbo].[tbMetodoPago] WHERE metpago_Estado = 1";
                util.CargarDdl(sqlMetodosPago, ddlMetodoPago);

                string sqlProductos = $"SELECT [pro_Id],[pro_Nombre] FROM [dbo].[tbProductos] WHERE pro_Estado = 1 AND pro_stock > 0";
                util.CargarDdl(sqlProductos, ddlProducto);

                cargarTabla();
                string uno = Session["FacDetalles"].ToString();
                if (Session["FacDetalles"] != null && Session["FacDetalles"].ToString() != "")
                {
                    CargarDatos(Session["FacDetalles"].ToString());
                }


            }
            else
            {
                string eventtarget = Request["__EVENTTARGET"];
                string eventargument = Request["__EVENTARGUMENT"];

                if (eventtarget == "Eliminar")
                {
                    Eliminar(eventargument);
                    cargarTabla();
                }
            }
            
            
        }


        public void CargarDatos( string id) 
        {
            if (Session["FacDetalles"] != null && Session["FacDetalles"].ToString() != "")
            {
                DataSet ds = new DataSet();
                string sql = $"EXEC UDP_IndexFacturaDetalles '{id}'";
                ds = util.ObtenerDS(sql, "T");

                ddlCliente.SelectedValue = ds.Tables["T"].Rows[0]["cli_Id"].ToString();
                ddlMetodoPago.SelectedValue = ds.Tables["T"].Rows[0]["metpago_Id"].ToString();

                ddlCliente.Enabled = false;
                ddlMetodoPago.Enabled = false;
                btnComenzar.Enabled = false;
                ddlProducto.Enabled = true;
                txtCantidad.Enabled = true;
                btnAgregarProducto.Enabled = true;

                //cargarTabla();
            }
        }



        protected void btnAgregarProducto_Click(object sender, EventArgs e)
        {

            


            if (ddlProducto.SelectedValue != "0" && txtCantidad.Text != "")
            {
                DataSet ds = new DataSet();
                string sql = $"SELECT [pro_Stock] FROM [dbo].[tbProductos] WHERE pro_Estado = 1 AND pro_Id = '{ddlProducto.SelectedValue}'";
                ds = util.ObtenerDS(sql, "T");

                int stock = int.Parse(ds.Tables["T"].Rows[0]["pro_Stock"].ToString()) - int.Parse(txtCantidad.Text);

                if (stock > 0)
                {
                    factu.InsertarFacturaDetalles(Session["FacDetalles"].ToString(), ddlProducto.SelectedValue, txtCantidad.Text, "1");
                    cargarTabla();
                    ddlProducto.SelectedValue = "0";
                    txtCantidad.Text = "";
                }
                else
                {
                    lblCantidadAste.Visible = true;
                    txtCantidad.Text = "";
                    cargarTabla();
                }
                
            }
            else
            {

                if (ddlProducto.SelectedValue == "0")
                {
                    lblProductoAste.Visible = true;
                }
                if (txtCantidad.Text == "")
                {
                    lblCantidadAste.Visible = true;
                }
            }

            
        }

        protected void btnComenzar_Click(object sender, EventArgs e)
        {
            if (ddlCliente.SelectedValue != "0" && ddlMetodoPago.SelectedValue != "0")
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
            else
            {
                
                if (ddlCliente.SelectedValue == "0")
                {
                    lblClienteAste.Visible = true;
                }
                if (ddlMetodoPago.SelectedValue == "0")
                {
                    lblMetodoPagoAste.Visible = true;
                }
            }

            
        }

        protected void btnFinalizar_Click(object sender, EventArgs e)
        {
            Session["FacDetalles"] = "";
            Response.Redirect("FacturasIndex.aspx");
        }
    }
}