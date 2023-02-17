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
    public partial class CategoriaIndex : System.Web.UI.Page
    {

        Clases.Utilitarios util = new Clases.Utilitarios();
        Clases.Categorias cat = new Clases.Categorias();

        public void cargarTabla()
        {
            DataSet ds = util.ObtenerDS("EXEC UDP_IndexCategorias", "T");

            StringBuilder html = new StringBuilder();
            Literal cadena = new Literal();

            foreach (DataRow fila in ds.Tables["T"].Rows)
            {
                html.Append("<tr><td>" +
                    fila["cat_Id"] + "</td><td>" +
                    fila["cat_Descripcion"] + "</td><td>" +
                    "<a class='fa fa-pencil btn btn-block btn-warning' style='color: black' onclick='Editar(" + fila["cat_Id"] + ")' ></a>" + "</td><td>" +
                    "<a class='fa fa-trash btn btn-block btn-danger' style='color: black' onclick='Eliminar(" + fila["cat_Id"] + ")' ></a>" + "</td></tr>"


                );
            }

            cadena.Text = html.ToString();

            Datos_Categorias.Controls.Add(cadena);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            cargarTabla();

            lblCategoriaEditarAste.Visible = false;
            lblCategoriaGuardarAste.Visible = false;

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
            if (Session["IdCategoria"] == null)
            {
                Session["IdCategoria"] = id;
                CargarDatos(id);
            }

        }


        public void Eliminar(string id)
        {
            cat.EliminarCategoria(id);
            Response.Redirect("CategoriaIndex.aspx");
        }

        public void CargarDatos(string id)
        {
            DataSet ds = new DataSet();
            string sql = $"SELECT * FROM [dbo].[tbCategoria] Where cat_Id = '{id}'";
            ds = util.ObtenerDS(sql, "T");

            txtCategoriaEditar.Text = ds.Tables["T"].Rows[0]["cat_Descripcion"].ToString();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (txtCategoriaGuardar.Text != "")
            {
                cat.InsertarCategoria(txtCategoriaGuardar.Text, Session["IdUsuario"].ToString());
                Session["IdCategoria"] = null;
                Response.Redirect("CategoriaIndex.aspx");
            }
            else
            {
                if (txtCategoriaGuardar.Text == "")
                {
                    lblCategoriaGuardarAste.Visible = true;
                }
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            if (txtCategoriaEditar.Text != "")
            {

                cat.EditarCategoria(Session["IdCategoria"].ToString(), txtCategoriaEditar.Text, Session["IdUsuario"].ToString());
                Session["IdCategoria"] = null;
                Response.Redirect("CategoriaIndex.aspx");
            }
            else
            {
                if (txtCategoriaEditar.Text == "")
                {
                    lblCategoriaEditarAste.Visible = true;
                }
            }
        }



        protected void btnCancelar_ServerClick(object sender, EventArgs e)
        {
            Session["IdCategoria"] = null;
            Response.Redirect("CategoriaIndex.aspx");
        }



    }
}