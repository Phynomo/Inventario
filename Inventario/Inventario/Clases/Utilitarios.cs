using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Inventario.Clases
{
    public class Utilitarios
    {

        CnxBasedeDatos cnx = new CnxBasedeDatos();
        SqlConnection con = new SqlConnection();


        public DataSet ObtenerDS(string sql, string tabla)
        {
            con = cnx.ObtenesCnx();

            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(sql, con);

            da.Fill(ds, tabla);

            con.Close();

            return ds;

        }


        public void CargarDdl(string sql, DropDownList ddl)
        {
            DataSet ds = ObtenerDS(sql, "T");
            ddl.DataValueField = ds.Tables["T"].Columns[0].ColumnName;
            ddl.DataTextField = ds.Tables["T"].Columns[1].ColumnName;
            ddl.DataSource = ds.Tables["T"];

            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("--Seleccionar una opcion--", "0"));

        }

        public void CargarDdl(string sql, string value, DropDownList ddl)
        {
            DataSet ds = ObtenerDS(sql, "T");
            ddl.DataValueField = ds.Tables["T"].Columns[0].ColumnName;
            ddl.DataTextField = ds.Tables["T"].Columns[1].ColumnName;
            ddl.DataSource = ds.Tables["T"];

            if (value != null || value != "")
            {
                ddl.SelectedValue = value;
            }
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("Seleccione una Opcion", "0"));
        }

    }
}