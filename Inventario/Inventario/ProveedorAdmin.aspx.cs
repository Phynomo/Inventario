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

            lblNombreAste.Visible = false;
            lblDepartamentoAste.Visible = false;
            lblMunicipioAste.Visible = false;
            lblDireccionAste.Visible = false;
            lblEmailAste.Visible = false;
            lblTelefonoAste.Visible = false;

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
            if (txtnombre.Value != "" && ddlMunicipio.SelectedValue != "0" && txtdireccion.Value != "" && txtTelefono.Value != "" && txtEmail.Value != "")
            {
                string id = Session["prov_Id"].ToString();
                ActualizarDatos(id, txtnombre.Value, ddlMunicipio.SelectedValue, txtdireccion.Value, txtTelefono.Value, txtEmail.Value);

            }
            else
            {
                if (txtnombre.Value == "") { lblNombreAste.Visible = true; }
                if (ddlMunicipio.SelectedValue == "0") { lblMunicipioAste.Visible = true; }
                if (txtdireccion.Value == "") { lblDireccionAste.Visible = true; }
                if (txtTelefono.Value == "") { lblTelefonoAste.Visible = true; }
                if (txtEmail.Value == "") { lblEmailAste.Visible = true; }
            }

        }



        protected void ddlDepartamento_SelectedIndexChanged(object sender, EventArgs e)
        {
            proveedor.DdlMunicipios(ddlMunicipio, ddlDepartamento.SelectedValue);

        }

        protected void btnNuevo_ServerClick(object sender, EventArgs e)
        {

            if (txtnombre.Value != "" && ddlMunicipio.SelectedValue != "0" && txtdireccion.Value != "" && txtTelefono.Value != "" && txtEmail.Value != "")
            {
                AgregarDatos(txtnombre.Value, ddlMunicipio.SelectedValue, txtdireccion.Value, txtTelefono.Value, txtEmail.Value);
                Response.Redirect("ProveedoresIndex.aspx");

            }
            else
            {
                if (txtnombre.Value == "") { lblNombreAste.Visible = true; }
                if (ddlMunicipio.SelectedValue == "0") { lblMunicipioAste.Visible = true; }
                if (txtdireccion.Value == "") { lblDireccionAste.Visible = true; }
                if (txtTelefono.Value == "") { lblTelefonoAste.Visible = true; }
                if (txtEmail.Value == "") { lblEmailAste.Visible = true; }
            }
        }

    }
}