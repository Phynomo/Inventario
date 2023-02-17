using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventario
{
    public partial class ProveedorAdmin : System.Web.UI.Page
    {

        Clases.Utilitarios util = new Clases.Utilitarios();
        Clases.Proveedor proveedor = new Clases.Proveedor();
        protected void Page_Load(object sender, EventArgs e)
        {


            //btnCancelar.Visible = true;
            //btnEditar.Visible = false;

            if (!IsPostBack)
            {
                proveedor.DdlDepartamentos(ddlDepartamento);
                //proveedor.DdlMunicipios(ddlMunicipio, ddlDepartamento.SelectedValue);



                if (Session["prov_Id"] != null)
                {

                    cargarDatos(Session["prov_Id"].ToString());
                    btnEditar.Visible = true;

                }

            }
        }
        public DataSet AgregarDatos(string Nombre, string Municipio, string Direccion, string Telefono, string Email)
        {
            DataSet ds = new DataSet();
            ds = util.ObtenerDS("UDP_InsertarProveedores " + "'" + Nombre + "'" + "," + "'" + Municipio + "'" + "," + "'" + Direccion + "'" + "," + "'" + Telefono + "'" + "," + "'" + Email + "'" + "," + "'" + 1 + "'", "T");
            return ds;
        }
        public void cargarDatos(string id)
        {
            DataSet ds = new DataSet();
            ds = proveedor.cargarDatos(id);


            txtnombre.Value = ds.Tables["T"].Rows[0]["prov_Nombre"].ToString();
            proveedor.DdlDepartamentos(ddlDepartamento);
            proveedor.DdlMunicipios(ddlMunicipio, ddlDepartamento.SelectedValue);
            ddlMunicipio.SelectedValue = ds.Tables["T"].Rows[0]["mun_Id"].ToString();
            txtdireccion.Value = ds.Tables["T"].Rows[0]["prov_DireccionExacta"].ToString();
            txtTelefono.Value = ds.Tables["T"].Rows[0]["prov_Telefono"].ToString();
            txtEmail.Value = ds.Tables["T"].Rows[0]["prov_Email"].ToString();


        }
        protected void btnEditar_Click(object sender, EventArgs e)
        {
            string id = Session["prov_Id"].ToString();
            DataSet ds = new DataSet();



            ActualizarDatos(id, txtnombre.Value, ddlMunicipio.SelectedValue, txtdireccion.Value, txtTelefono.Value, txtEmail.Value);
            //Response.Redirect("MaestroINDEX.aspx");

        }
        public void ActualizarDatos(string id, string Nombre, string Municipio, string Direccion, string Telefono, string Email)
        {
            util.ObtenerDS("UDP_EditarProveedores " + "'" + int.Parse(id) + "'" + "," + "'" + Nombre + "'" + "," + "'" + Municipio + "'" + "," + "'" + Direccion + "'" + "," + "'" + Telefono + "'" + "," + "'" + Email + "'" + "," + "'" + 1 + "'", "T");
            Response.Redirect("ProveedoresIndex.aspx");
        }


        protected void btnEditar_ServerClick(object sender, EventArgs e)
        {
            string id = Session["prov_Id"].ToString();
            ActualizarDatos(id, txtnombre.Value, ddlMunicipio.SelectedValue, txtdireccion.Value, txtTelefono.Value, txtEmail.Value);

        }



        protected void ddlDepartamento_SelectedIndexChanged(object sender, EventArgs e)
        {
            proveedor.DdlMunicipios(ddlMunicipio, ddlDepartamento.SelectedValue);

        }

        protected void btnNuevo_ServerClick(object sender, EventArgs e)
        {
            AgregarDatos(txtnombre.Value, ddlMunicipio.SelectedValue, txtdireccion.Value, txtTelefono.Value, txtEmail.Value);
            Response.Redirect("ProveedoresIndex.aspx");
        }

    }
}