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
    public partial class UsuariosIndex : System.Web.UI.Page
    {

        Clases.Utilitarios util = new Clases.Utilitarios();
        Clases.Usuarios usu = new Clases.Usuarios();
        public void cargarTabla() 
        {
            DataSet ds = util.ObtenerDS("EXEC UDP_IndexUsuario", "T");

            StringBuilder html = new StringBuilder();
            Literal cadena = new Literal();

            foreach (DataRow fila in ds.Tables["T"].Rows)
            {
                html.Append("<tr><td>" +
                    fila["usu_Id"] + "</td><td>" +
                    fila["usu_Usuario"] + "</td><td>" +
                    fila["emp_Nombre"] + "</td><td>" +
                    "<a class='fa fa-pencil btn btn-warning' style='color: black' onclick='Editar(" + fila["usu_Id"] + ")' >Editar</a>" + "</td><td>" +
                    "<a class='fa fa-trash btn btn-danger' style='color: black' onclick='Eliminar(" + fila["usu_Id"] + ")' >Borrar</a>" + "</td></tr>"


                );
            }

            cadena.Text = html.ToString();

            Datos_Usuarios.Controls.Add(cadena);
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            cargarTabla();
            if (!IsPostBack)
            {
                string sql = "SELECT [emp_Id],[emp_Nombre]+' '+[emp_Apellido] as emp_Nombre FROM [Tienda_Inventario].[dbo].[tbEmpleados]WHERE emp_Estado = 1";
                util.CargarDdl(sql, ddlEmpleadoGuardar);
                util.CargarDdl(sql, ddlEmpleadoEditar);
            }
            else
            {
                string eventtarget = Request["__EVENTTARGET"];
                string eventargument = Request["__EVENTARGUMENT"];

                if (eventtarget == "Editar" || Session["IdUsuarios"] != null)
                {

                    Editar(eventargument);
                    Response.Write("<script src='Content/js/jquery-3.1.1.min.js'></script>");
                    Response.Write("<script src = 'Content/js/bootstrap.js' ></script>");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "myFuncionAlerta", "ModalEditar();", true);
                }

                if (eventtarget == "Eliminar")
                {
                    Eliminar(eventargument);
                }
            }
        }


        public void Editar(string id)
        {
            if (Session["IdUsuarios"] == null)
            {
                Session["IdUsuarios"] = id;
                CargarDatos(id);
            }

        }


        public void Eliminar(string id)
        {
            usu.EliminarUsuario(id);
            Response.Redirect("UsuariosIndex.aspx");
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (txtUsuarioGuardar.Text != "" && txtContraseniaGuardar.Text != "" && ddlEmpleadoGuardar.SelectedValue !="0")
            {
                //usu.InsertarUsuario(txtUsuarioGuardar.Text,txtContraseniaGuardar.Text,ddlEmpleadoGuardar.SelectedValue, Session["IdUsuario"].ToString());
                usu.InsertarUsuario(txtUsuarioGuardar.Text, txtContraseniaGuardar.Text, ddlEmpleadoGuardar.SelectedValue, "1");
                Session["IdUsuarios"] = null;
                Response.Redirect("UsuariosIndex.aspx");
            }
        }


        public void CargarDatos(string id)
        {
            DataSet ds = new DataSet();
            string sql = $"SELECT * FROM [Tienda_Inventario].[dbo].[tbUsuarios] Where usu_Id = '{id}'";
            ds = util.ObtenerDS(sql, "T");

            ddlEmpleadoEditar.SelectedValue = ds.Tables["T"].Rows[0]["emp_Id"].ToString();

        }


        protected void btnEditar_Click(object sender, EventArgs e)
        {
            if (txtContraseniaEditar.Text != "" && ddlEmpleadoEditar.SelectedValue != "0")
            {
                usu.EditarUsuario(Session["IdUsuarios"].ToString(), txtContraseniaEditar.Text, ddlEmpleadoEditar.SelectedValue, "1");
                Session["IdUsuarios"] = null;
                Response.Redirect("UsuariosIndex.aspx");
            }
        }

        protected void btnCancelar_ServerClick(object sender, EventArgs e)
        {
            Session["IdUsuarios"] = null;
            Response.Redirect("UsuariosIndex.aspx");
        }
    }
}