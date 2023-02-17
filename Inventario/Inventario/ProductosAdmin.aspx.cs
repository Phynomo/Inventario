using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventario
{
    public partial class ProductosAdmin : System.Web.UI.Page
    {
        Clases.Utilitarios util = new Clases.Utilitarios();
        Clases.Productos productos = new Clases.Productos();
        protected void Page_Load(object sender, EventArgs e)
        {


            

            if (!IsPostBack)
            {
                productos.DdlCategorias(ddlCategoria);
                productos.DdlProveedores(ddlProveedores);
                btnNuevo.Visible = false;
                btnEditar.Visible = false;

                if (Session["pro_Id"] != null)
                {

                    cargarDatos(Session["pro_Id"].ToString());
                    btnEditar.Visible = true;

                }
                else
                {
                    btnNuevo.Visible = true;
                }

            }
        }
        public DataSet AgregarDatos(string Nombre, string Precio, string Categoria, string Proveedor, string stock)
        {
            DataSet ds = new DataSet();
            ds = util.ObtenerDS("UDP_InsertarProductos " + "'" + Nombre + "'" + "," + "'" + Precio + "'" + "," + "'" + Categoria + "'" + "," + "'" + Proveedor + "'" + "," + "'" + stock + "'" + "," + "'" + 1 + "'", "T");
            return ds;
        }
        public void cargarDatos(string id)
        {
            DataSet ds = new DataSet();
            ds = productos.cargarDatos(id);


            txtnombre.Value = ds.Tables["T"].Rows[0]["pro_Nombre"].ToString();
            txtPrecio.Value = ds.Tables["T"].Rows[0]["pro_Precio"].ToString();
            productos.DdlCategorias(ddlCategoria);
            ddlCategoria.SelectedValue = ds.Tables["T"].Rows[0]["cat_Id"].ToString();
            productos.DdlProveedores(ddlProveedores);
            ddlProveedores.SelectedValue = ds.Tables["T"].Rows[0]["prov_id"].ToString();
            txtStock.Value = ds.Tables["T"].Rows[0]["pro_Stock"].ToString();



        }
        protected void btnEditar_Click(object sender, EventArgs e)
        {
            string id = Session["pro_Id"].ToString();
            DataSet ds = new DataSet();



            ActualizarDatos(id, txtnombre.Value, txtPrecio.Value, ddlCategoria.SelectedValue, ddlCategoria.SelectedValue, txtStock.Value);
            //Response.Redirect("MaestroINDEX.aspx");

        }
        public void ActualizarDatos(string id, string Nombre, string Precio, string categoria, string Proveedor, string stock)
        {
            util.ObtenerDS("UDP_EditarProducto " + "'" + id + "'" + "," + "'" + Nombre + "'" + "," + "'" + Precio + "'" + "," + "'" + categoria + "'" + "," + "'" + Proveedor + "'" + "," + "'" + stock + "'" + "," + "'" + 1 + "'", "T");
            Response.Redirect("ProductosIndex.aspx");
        }


        protected void btnEditar_ServerClick(object sender, EventArgs e)
        {
            string id = Session["pro_Id"].ToString();
            ActualizarDatos(id, txtnombre.Value, txtPrecio.Value, ddlCategoria.SelectedValue, ddlCategoria.SelectedValue, txtStock.Value);
        }


        protected void btnNuevo_ServerClick(object sender, EventArgs e)
        {
            AgregarDatos(txtnombre.Value, txtPrecio.Value, ddlCategoria.SelectedValue, ddlCategoria.SelectedValue, txtStock.Value);
            Response.Redirect("ProductosIndex.aspx");
        }
    }
}