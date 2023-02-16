using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Inventario.Clases
{
    public class Facturas
    {
        Clases.Utilitarios util = new Clases.Utilitarios();
        public void InsertarFactura(string Cliente, string Empleado, string UsuarioCreacion, string MetodoPago) 
        {
            string sql = $"EXEC UDP_InsertarFactura '{Cliente}', '{MetodoPago}', '{Empleado}', '{UsuarioCreacion}'";
            util.ObtenerDS(sql,"T");


        }


    }
}