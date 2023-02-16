using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Inventario.Clases
{
    public class Proveedor
    {

        Utilitarios util = new Utilitarios();


        public void CargarGrid(GridView gv, string bqd)
        {
            DataSet ds = util.ObtenerDS("UDP_Buscar '" + bqd + "'", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();


        }


        public DataSet cargarDatos(string id)
        {
            DataSet ds = new DataSet();
            ds = util.ObtenerDS("select * from tbProveedores where prov_Id =" + int.Parse(id), "T");
            return ds;
        }

        public void DdlMunicipios(DropDownList ddl)
        {
            util.CargarDdl("select [mun_Id], [mun_Nombre]  from tbMunicipios order by mun_Nombre ", null, ddl);
        }


    }
}