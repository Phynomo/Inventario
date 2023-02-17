using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Inventario.Clases
{
    public class Clientes
    {

        Utilitarios util = new Utilitarios();


        public void CargarGrid(GridView gv)
        {
            DataSet ds = util.ObtenerDS("UDP_LlenarCliente ", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();


        }


        public DataSet cargarDatos(string id)
        {
            DataSet ds = new DataSet();
            ds = util.ObtenerDS("select * from tbClientes where cli_Id =" + int.Parse(id), "T");
            return ds;
        }

        public void DdlDepartamentos(DropDownList ddl)
        {
            util.CargarDdl("select dep_Id, dep_Nombre  from tbDepartamentos order by dep_Nombre", null, ddl);
        }


        public void DdlMunicipios(DropDownList ddl, string id_depto)
        {
            util.CargarDdl("select [mun_Id], [mun_Nombre]  from tbMunicipios where dep_Id =  '" + id_depto + "' order by mun_Nombre ", null, ddl);
        }


        public void Borrar(string id)
        {
            util.ObtenerDS("UDP_EliminarClientes " + "'" + id + "'", "T");
        }




    }
}