using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Inventario.Clases
{
    public class Productos
    {

        Utilitarios util = new Utilitarios();


        public void CargarGrid(GridView gv)
        {
            DataSet ds = util.ObtenerDS("UDP_LlenarProductos ", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();


        }


        public DataSet cargarDatos(string id)
        {
            DataSet ds = new DataSet();
            ds = util.ObtenerDS("select * from tbProductos where pro_Id =" + int.Parse(id), "T");
            return ds;
        }

        public void DdlCategorias(DropDownList ddl)
        {
            util.CargarDdl("select [cat_Id],[cat_Descripcion] from [dbo].[tbCategoria] order by cat_Descripcion", null, ddl);
        }
        public void DdlProveedores(DropDownList ddl)
        {
            util.CargarDdl("select [prov_Id],[prov_Nombre] from [dbo].[tbProveedores] order by prov_Nombre", null, ddl);
        }


        public void Borrar(string id)
        {
            util.ObtenerDS("UDP_EliminarProducto " + "'" + int.Parse(id) + "'", "T");
        }



    }
}