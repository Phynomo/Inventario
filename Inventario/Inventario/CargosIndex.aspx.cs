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
    public partial class CargosIndex : System.Web.UI.Page
    {

        Clases.Utilitarios util = new Clases.Utilitarios();
        Clases.Cargos car = new Clases.Cargos();

        public void cargarTabla()
        {
            DataSet ds = util.ObtenerDS("EXEC UDP_IndexCargos", "T");

            StringBuilder html = new StringBuilder();
            Literal cadena = new Literal();

            foreach (DataRow fila in ds.Tables["T"].Rows)
            {
                html.Append("<tr><td>" +
                    fila["car_Id"] + "</td><td>" +
                    fila["car_Nombre"] + "</td><td>" +
                    "<a class='fa fa-pencil btn btn-block btn-warning' style='color: black' onclick='Editar(" + fila["car_Id"] + ")' ></a>" + "</td><td>" +
                    "<a class='fa fa-trash btn btn-block btn-danger' style='color: black' onclick='Eliminar(" + fila["car_Id"] + ")' ></a>" + "</td></tr>"


                );
            }

            cadena.Text = html.ToString();

            Datos_Cargos.Controls.Add(cadena);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            cargarTabla();

            lblCargoEditarAste.Visible = false;
            lblCargoGuardarAste.Visible = false;

            if (!IsPostBack)
            {
            }
            else
            {
                string eventtarget = Request["__EVENTTARGET"];
                string eventargument = Request["__EVENTARGUMENT"];

                if (eventtarget == "Editar")
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
            if (Session["IdCargo"] == null)
            {
                Session["IdCargo"] = id;
                CargarDatos(id);
            }

        }


        public void Eliminar(string id)
        {
            car.EliminarCargo(id);
            Response.Redirect("CargosIndex.aspx");
        }

        public void CargarDatos(string id)
        {
            DataSet ds = new DataSet();
            string sql = $"SELECT * FROM [dbo].[tbCargos] Where car_Id = '{id}'";
            ds = util.ObtenerDS(sql, "T");

            txtCargoEditar.Text = ds.Tables["T"].Rows[0]["car_Nombre"].ToString();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (txtCargoGuardar.Text != "")
            {
                car.InsertarCargos(txtCargoGuardar.Text,"1");
                Session["IdCargo"] = null;
                Response.Redirect("CargosIndex.aspx");
            }
            else
            {
                if (txtCargoGuardar.Text == "")
                {
                    lblCargoGuardarAste.Visible = true;
                }
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            if (txtCargoEditar.Text != "")
            {

                car.EditarGargos(Session["IdCargo"].ToString(), txtCargoEditar.Text, "1");
                Session["IdCargo"] = null;
                Response.Redirect("CargosIndex.aspx");
            }
            else
            {
                if (txtCargoEditar.Text == "")
                {
                    lblCargoEditarAste.Visible = true;
                }
            }
        }



        protected void btnCancelar_ServerClick(object sender, EventArgs e)
        {
            Session["IdCargo"] = null;
            Response.Redirect("CargosIndex.aspx");
        }

    }
}