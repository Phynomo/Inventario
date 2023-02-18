using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventario
{
    public partial class EmpleadosAdmin : System.Web.UI.Page
    {

        Clases.Utilitarios util = new Clases.Utilitarios();
        Clases.Empleados emp = new Clases.Empleados();

        protected void Page_Load(object sender, EventArgs e)
        {
            lblNombreAste.Visible = false;
            lblApellidoAste.Visible = false;
            lblSexoAste.Visible = false;
            lblDepartamentoAste.Visible = false;
            lblMunicipioAste.Visible = false;
            lblDireccionExactaAste.Visible = false;
            lblEstadoCivilAste.Visible = false;
            lblFechaContratacionAste.Visible = false;
            lblFechaNacimientoAste.Visible = false;
            lblCargoAste.Visible = false;
            lblTelefonoAste.Visible = false;
            lblCorreoAste.Visible = false;

            if (!IsPostBack)
            {
                btnEditar.Visible = false;
                btnGuardar.Visible = false;
                txtFechaContratacionEditar.Visible = false;
                txtFechaNacimentoEditar.Visible = false;
                txtFechaNacimiento.Visible = false;
                txtFechaContratacion.Visible = false;
                ddlMunicipio.Enabled = false;
                string sqlDepartamentos = $"SELECT [dep_Id],[dep_Nombre] FROM [Tienda_Inventario].[dbo].[tbDepartamentos] WHERE dep_Estado = 1";
                util.CargarDdl(sqlDepartamentos, ddlDepartamento);
                
                string sqlEstadoCivil = $"SELECT [estciv_Id],[estciv_Nombre] FROM [dbo].[tbEstadosCiviles] WHERE estciv_Estado = 1";
                util.CargarDdl(sqlEstadoCivil, ddlEstadoCivil);
                
                string sqlCargos = $"SELECT [car_Id],[car_Nombre] FROM [dbo].[tbCargos] WHERE car_Estado = 1 ";
                util.CargarDdl(sqlCargos, ddlCargo);

                if (Session["IdEmpleado"] != null)
                {
                    btnEditar.Visible = true;
                    txtFechaContratacionEditar.Visible = true;
                    txtFechaNacimentoEditar.Visible = true;
                    CargarDatos(Session["IdEmpleado"].ToString());
                }
                else
                {
                    btnGuardar.Visible = true;
                    txtFechaContratacion.Visible = true;
                    txtFechaNacimiento.Visible = true;
                }


            }
            else
            {
                
            }


        }


        public void CargarDatos(string id)
        {
            DataSet ds = new DataSet();
            string sql = $"SELECT * FROM [dbo].[tbEmpleados] T1 INNER JOIN [dbo].[tbMunicipios] t2 ON t2.mun_Id = t1.mun_Id WHERE emp_Estado = 1 AND emp_Id = '{id}'";
            ds = util.ObtenerDS(sql, "T");


            txtNombre.Text = ds.Tables["T"].Rows[0]["emp_Nombre"].ToString();
            txtApellido.Text = ds.Tables["T"].Rows[0]["emp_Apellido"].ToString();
            txtFechaNacimentoEditar.Text = ds.Tables["T"].Rows[0]["emp_FechaNacimiento"].ToString().Replace("00:00:00", "");
            txtFechaContratacionEditar.Text = ds.Tables["T"].Rows[0]["emp_FechaContratacion"].ToString().Replace("00:00:00", "");

            if (ds.Tables["T"].Rows[0]["emp_Sexo"].ToString() == "M")
            {
                rbM.Checked = true;
            }
            else
            {
                rbF.Checked = true;
            }

            ddlDepartamento.SelectedValue = ds.Tables["T"].Rows[0]["dep_Id"].ToString();

            ddlMunicipio.Enabled = true;
            string sqlMunicipios = $"SELECT[mun_Id] ,mun_Nombre FROM[dbo].[tbMunicipios] WHERE mun_Estado = 1 AND dep_Id = '{ddlDepartamento.SelectedValue}'";
            util.CargarDdl(sqlMunicipios, ddlMunicipio);
            ddlMunicipio.SelectedValue = ds.Tables["T"].Rows[0]["mun_Id"].ToString();

            ddlEstadoCivil.SelectedValue = ds.Tables["T"].Rows[0]["estciv_Id"].ToString();

            txtCorreo.Text = ds.Tables["T"].Rows[0]["emp_CorreoElectronico"].ToString();
            txtDireccionExacata.Value = ds.Tables["T"].Rows[0]["emp_DireccionExacta"].ToString();
            txtTelefono.Text = ds.Tables["T"].Rows[0]["emp_Telefono"].ToString();
            ddlCargo.SelectedValue = ds.Tables["T"].Rows[0]["car_Id"].ToString();
        }


        protected void ddlDepartamento_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlMunicipio.Enabled = true;
            string sqlMunicipios = $"SELECT[mun_Id] ,mun_Nombre FROM[dbo].[tbMunicipios] WHERE mun_Estado = 1 AND dep_Id = '{ddlDepartamento.SelectedValue}'";
            util.CargarDdl(sqlMunicipios, ddlMunicipio);
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (txtNombre.Text != "" && txtApellido.Text != "" && (rbM.Checked || rbF.Checked) && ddlEstadoCivil.SelectedValue != "0" && ddlDepartamento.SelectedValue != "0"
                && ddlMunicipio.SelectedValue != "0" && txtDireccionExacata.Value != "" && txtFechaNacimiento.Value != "" && ddlCargo.SelectedValue != "0"
                && txtFechaContratacion.Value != "" && txtTelefono.Text != "" && txtCorreo.Text != "")
            {
                string sexo = "O";
                if (rbF.Checked)
                {
                    sexo = "F";
                }
                else if (rbM.Checked)
                {
                    sexo = "M";
                }

                emp.InsetarEmpleado(txtNombre.Text,txtApellido.Text,sexo,ddlMunicipio.SelectedValue,txtDireccionExacata.Value,ddlEstadoCivil.SelectedValue,txtTelefono.Text,txtCorreo.Text,txtFechaNacimiento.Value,txtFechaContratacion.Value,ddlCargo.SelectedValue, Session["IdUsuario"].ToString());

                Response.Redirect("EmpleadosIndex.aspx");
            }
            else
            {
                
                if (txtNombre.Text == "")
                {
                    lblNombreAste.Visible = true;
                }
                if (txtApellido.Text == "")
                {
                    lblApellidoAste.Visible = true;
                }
                if (!rbM.Checked && !rbF.Checked)
                {
                    lblSexoAste.Visible = true;
                }
                if (ddlEstadoCivil.SelectedValue == "0")
                {
                    lblEstadoCivilAste.Visible = true;
                }
                if (ddlDepartamento.SelectedValue== "0")
                {
                    lblDepartamentoAste.Visible = true;
                }
                if (ddlMunicipio.SelectedValue == "0")
                {
                    lblMunicipioAste.Visible = true;
                }
                if (txtDireccionExacata.Value == "")
                {
                    lblDireccionExactaAste.Visible = true;
                }
                if (txtFechaNacimiento.Value == "")
                {
                    lblFechaNacimientoAste.Visible = true;
                }
                if (ddlCargo.SelectedValue == "0")
                {
                    lblCargoAste.Visible = true;
                }
                if (txtFechaContratacion.Value == "")
                {
                    lblFechaContratacionAste.Visible = true;
                }
                if (txtTelefono.Text == "")
                {
                    lblTelefonoAste.Visible = true;
                }
                if (txtCorreo.Text == "")
                {
                    lblCorreoAste.Visible = true;
                }
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            if (txtNombre.Text != "" && txtApellido.Text != "" && (rbM.Checked || rbF.Checked) && ddlEstadoCivil.SelectedValue != "0" && ddlDepartamento.SelectedValue != "0"
                && ddlMunicipio.SelectedValue != "0" && txtDireccionExacata.Value != "" && txtFechaNacimentoEditar.Text != "" && ddlCargo.SelectedValue != "0"
                && txtFechaContratacionEditar.Text != "" && txtTelefono.Text != "" && txtCorreo.Text != "")
            {

                try
                {
                    Convert.ToDateTime(txtFechaNacimentoEditar.Text);
                    Convert.ToDateTime(txtFechaContratacionEditar.Text);

                    string sexo = "O";
                    if (rbF.Checked)
                    {
                        sexo = "F";
                    }
                    else if (rbM.Checked)
                    {
                        sexo = "M";
                    }

                    emp.EditarEmpleado(Session["IdEmpleado"].ToString(), txtNombre.Text, txtApellido.Text, sexo, ddlMunicipio.SelectedValue, txtDireccionExacata.Value, ddlEstadoCivil.SelectedValue, txtTelefono.Text, txtCorreo.Text, txtFechaNacimentoEditar.Text, txtFechaContratacionEditar.Text, ddlCargo.SelectedValue, Session["IdUsuario"].ToString());
                    Session["IdEmpleado"] = null;
                    Response.Redirect("EmpleadosIndex.aspx");


                }
                catch
                {
                    try
                    {
                        Convert.ToDateTime(txtFechaNacimentoEditar.Text);
                    }
                    catch
                    {
                        lblFechaNacimientoAste.Visible = true;
                    }
                    try
                    {
                        Convert.ToDateTime(txtFechaContratacionEditar.Text);
                    }
                    catch
                    {
                        lblFechaContratacionAste.Visible = true;
                    }
                }
                    
                

                
            }
            else
            {

                if (txtNombre.Text == "")
                {
                    lblNombreAste.Visible = true;
                }
                if (txtApellido.Text == "")
                {
                    lblApellidoAste.Visible = true;
                }
                if (!rbM.Checked && !rbF.Checked)
                {
                    lblSexoAste.Visible = true;
                }
                if (ddlEstadoCivil.SelectedValue == "0")
                {
                    lblEstadoCivilAste.Visible = true;
                }
                if (ddlDepartamento.SelectedValue == "0")
                {
                    lblDepartamentoAste.Visible = true;
                }
                if (ddlMunicipio.SelectedValue == "0")
                {
                    lblMunicipioAste.Visible = true;
                }
                if (txtDireccionExacata.Value == "")
                {
                    lblDireccionExactaAste.Visible = true;
                }
                if (txtFechaNacimentoEditar.Text == "")
                {
                    lblFechaNacimientoAste.Visible = true;
                }
                if (ddlCargo.SelectedValue == "0")
                {
                    lblCargoAste.Visible = true;
                }
                if (txtFechaContratacionEditar.Text == "")
                {
                    lblFechaContratacionAste.Visible = true;
                }
                if (txtTelefono.Text == "")
                {
                    lblTelefonoAste.Visible = true;
                }
                if (txtCorreo.Text == "")
                {
                    lblCorreoAste.Visible = true;
                }
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Session["IdEmpleado"] = null;
            Response.Redirect("EmpleadosIndex.aspx");
        }
    }
}