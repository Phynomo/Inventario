using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Inventario.Clases
{
    public class Cargos
    {

        Utilitarios util = new Utilitarios();

        public void InsertarCargos(string Cargo, string UsuarioCrea)
        {
            string sql = $"EXEC UDP_InsertarCargos '{Cargo}', '{UsuarioCrea}'";
            util.ObtenerDS(sql, "T");
        }

        public void EditarGargos(string ID, string Cargo, string UsuarioModificacion)
        {
            string sql = $"EXEC UDP_EditarCargo '{ID}', '{Cargo}','{UsuarioModificacion}'";
            util.ObtenerDS(sql, "T");
        }

        public void EliminarCargo(string ID)
        {
            string sql = $"EXEC UDP_BorrarCargo '{ID}'";
            util.ObtenerDS(sql, "T");
        }

    }
}