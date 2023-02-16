using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Inventario.Clases
{
    public class CnxBasedeDatos
    {
        SqlConnection cnx = new SqlConnection();
        string con = "";

        public void Conexion()
        {
            con = @"data source = DESKTOP-51051C3\SQLEXPRESS; initial catalog = Tienda_Inventario; user id = dani2005; password = dani2005";

            cnx.ConnectionString = con;
        }


        public SqlConnection ObtenesCnx()
        {
            Conexion();
            return cnx;
        }




    }
}