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


        public void InsertarFacturaDetalles(string FacturaId, string ProductoId, string Cantidad, string UsuarioCreacion)
        {
            string sql = $"EXEC UDP_InsertarFacturaDetalles '{FacturaId}', '{ProductoId}', '{Cantidad}', '{UsuarioCreacion}'";
            util.ObtenerDS(sql, "T");
        }


        public void EliminarFactura(string id) 
        {
            string sql = $"EXEC UDP_BorrarFactura '{id}'";
            util.ObtenerDS(sql, "T");
        }

    }
}