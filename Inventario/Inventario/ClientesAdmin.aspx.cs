using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventario
{
    public partial class ClientesAdmin : System.Web.UI.Page
    {
        Clases.Utilitarios util = new Clases.Utilitarios();
        Clases.Clientes clientes = new Clases.Clientes();
        protected void Page_Load(object sender, EventArgs e)
        {

            lblNombreAste.Visible = false;
            lblApellidoAste.Visible = false;
            lblDepartamentoAste.Visible = false;
            lblMunicipioAste.Visible = false;
            lblDireccionAste.Visible = false;
            lblTelefonoAste.Visible = false;
            lblEmailAste.Visible = false;



            if (!IsPostBack)
            {
                btnEditar.Visible = false;
                btnNuevo.Visible = false;
                clientes.DdlDepartamentos(ddlDepartamento);

                if (Session["cli_Id"] != null)
                {

                    cargarDatos(Session["cli_Id"].ToString());
                    btnEditar.Visible = true;

                }
                else
                {
                    btnNuevo.Visible = true;
                }
                        

            }
        }
        public DataSet AgregarDatos(string Nombre, string Apellido, string Municipio, string Direccion, string Telefono, string Email)
        {
            DataSet ds = new DataSet();
            ds = util.ObtenerDS("UDP_InsertarClientes " + "'" + Nombre + "'" + "," + "'" + Apellido + "'" + "," + "'" + Municipio + "'" + "," + "'" + Direccion + "'" + "," + "'" + Telefono + "'" + "," + "'" + Email + "'" + "," + "'" + 1 + "'", "T");
            return ds;
        }
        public void cargarDatos(string id)
        {
            DataSet ds = new DataSet();
            ds = clientes.cargarDatos(id);


            txtnombre.Value = ds.Tables["T"].Rows[0]["cli_Nombre"].ToString();
            txtApellido.Value = ds.Tables["T"].Rows[0]["cli_Apellido"].ToString();
            clientes.DdlDepartamentos(ddlDepartamento);
            clientes.DdlMunicipios(ddlMunicipio, ddlDepartamento.SelectedValue);
            ddlMunicipio.SelectedValue = ds.Tables["T"].Rows[0]["mun_Id"].ToString();
            txtdireccion.Value = ds.Tables["T"].Rows[0]["cli_DireccionExacta"].ToString();
            txtTelefono.Value = ds.Tables["T"].Rows[0]["cli_Telefono"].ToString();
            txtEmail.Value = ds.Tables["T"].Rows[0]["cli_CorreoElectronico"].ToString();


        }
        protected void btnEditar_Click(object sender, EventArgs e)
        {
            string id = Session["cli_Id"].ToString();
            DataSet ds = new DataSet();



            ActualizarDatos(id, txtnombre.Value, txtApellido.Value, ddlMunicipio.SelectedValue, txtdireccion.Value, txtTelefono.Value, txtEmail.Value);
            

        }
        public void ActualizarDatos(string id, string Nombre, string Apellido, string Municipio, string Direccion, string Telefono, string Email)
        {
            util.ObtenerDS("UDP_EditarClientes " + "'" + int.Parse(id) + "'" + "," + "'" + Nombre + "'" + "," + "'" + Apellido + "'" + "," + "'" + Municipio + "'" + "," + "'" + Direccion + "'" + "," + "'" + Telefono + "'" + "," + "'" + Email + "'" + "," + "'" + 1 + "'", "T");
            Response.Redirect("ClientesIndex.aspx");
        }


        protected void btnEditar_ServerClick(object sender, EventArgs e)
        {


            if (txtnombre.Value != "" && txtApellido.Value != "" && ddlDepartamento.SelectedValue != "0" && ddlMunicipio.SelectedValue != "0" && txtdireccion.Value != "" && txtTelefono.Value != "" && txtEmail.Value != "")
            {
                string id = Session["cli_Id"].ToString();
                ActualizarDatos(id, txtnombre.Value, txtApellido.Value, ddlMunicipio.SelectedValue, txtdireccion.Value, txtTelefono.Value, txtEmail.Value);
                Session["cli_Id"] = null;
            }
            else
            {
                if (txtnombre.Value == "") { lblNombreAste.Visible = true; }
                if (txtApellido.Value == "") { lblApellidoAste.Visible = true; }
                if (ddlDepartamento.SelectedValue == "0") { lblDepartamentoAste.Visible = true; }
                if (ddlMunicipio.SelectedValue == "0") { lblMunicipioAste.Visible = true; }
                if (txtdireccion.Value == "") { lblDireccionAste.Visible = true; }
                if (txtTelefono.Value == "") { lblTelefonoAste.Visible = true; }
                if (txtEmail.Value == "") { lblEmailAste.Visible = true; }
            }


        }



        protected void ddlDepartamento_SelectedIndexChanged(object sender, EventArgs e)
        {
            clientes.DdlMunicipios(ddlMunicipio, ddlDepartamento.SelectedValue);

        }

        protected void btnNuevo_ServerClick(object sender, EventArgs e)
        {

            if (txtnombre.Value != "" && txtApellido.Value != "" && ddlDepartamento.SelectedValue != "0" && ddlMunicipio.SelectedValue != "0" && txtdireccion.Value != "" && txtTelefono.Value != "" && txtEmail.Value != "")
            {
                AgregarDatos(txtnombre.Value, txtApellido.Value, ddlMunicipio.SelectedValue, txtdireccion.Value, txtTelefono.Value, txtEmail.Value);
                Response.Redirect("ClientesIndex.aspx");
            }
            else
            {
                if (txtnombre.Value == "") { lblNombreAste.Visible = true; }
                if (txtApellido.Value == "") { lblApellidoAste.Visible = true; }
                if (ddlDepartamento.SelectedValue == "0") { lblDepartamentoAste.Visible = true; }
                if (ddlMunicipio.SelectedValue == "0") { lblMunicipioAste.Visible = true; }
                if (txtdireccion.Value == "") { lblDireccionAste.Visible = true; }
                if (txtTelefono.Value == "") { lblTelefonoAste.Visible = true; }
                if (txtEmail.Value == "") { lblEmailAste.Visible = true; }
            }


        }
    }
}