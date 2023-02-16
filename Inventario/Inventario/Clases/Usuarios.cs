using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Inventario.Clases
{
    public class Usuarios
    {
        Utilitarios util = new Utilitarios();

        public void InsertarUsuario(string Usuario, string Contrasenia, string Empleado, string UsuarioCrea) 
        {
            string sql = $"EXEC UDP_InsertarUsuario '{Usuario}', '{Contrasenia}','{Empleado}','{UsuarioCrea}'";
            util.ObtenerDS(sql,"T");
        }

        public void EditarUsuario(string ID , string Contrasenia, string Empleado, string UsuarioModificacion)
        {
            string sql = $"EXEC UDP_EdicionUsuario '{ID}', '{Contrasenia}','{Empleado}','{UsuarioModificacion}'";
            util.ObtenerDS(sql, "T");
        }

        public void EliminarUsuario(string ID)
        {
            string sql = $"EXEC UDP_BorrarUsuario '{ID}'";
            util.ObtenerDS(sql, "T");
        }


    }
}