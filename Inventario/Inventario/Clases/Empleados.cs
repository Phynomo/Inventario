using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Inventario.Clases
{
    public class Empleados
    {
        Utilitarios util = new Utilitarios();

        public void InsetarEmpleado(string Nombre, string Apellido, string Sexo, string Municipio, string DireccionExacta, string EstadoCivil, string Telefono,
            string Correo, string FechaNacimiento, string FechaContratacion, string Cargo, string UsuarioCreacion) 
        {
            string sql = $"EXEC UDP_InsertarEmpleados '{Nombre}', '{Apellido}', '{Sexo}', '{Municipio}','{DireccionExacta}','{EstadoCivil}', '{Telefono}', '{Correo}', '{FechaNacimiento}','{FechaContratacion}', '{Cargo}', '{UsuarioCreacion}'";
            util.ObtenerDS(sql, "T");
        }

        public void EditarEmpleado(string id, string Nombre, string Apellido, string Sexo, string Municipio, string DireccionExacta, string EstadoCivil, string Telefono,
            string Correo, string FechaNacimiento, string FechaContratacion, string Cargo, string UsuarioCreacion)
        {
            string sql = $"EXEC UDP_EditarEmpleados '{id}', '{Nombre}', '{Apellido}', '{Sexo}', '{Municipio}','{DireccionExacta}','{EstadoCivil}', '{Telefono}', '{Correo}', '{FechaNacimiento}','{FechaContratacion}', '{Cargo}', '{UsuarioCreacion}'";
            util.ObtenerDS(sql, "T");
        }

        public void EliminarEmpleado(string id)
        {
            string sql = $"EXEC UDP_EliminarEmpleados '{id}'";
            util.ObtenerDS(sql, "T");
        }
    }
}