using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Inventario.Clases
{
    public class Categorias
    {
        Utilitarios util = new Utilitarios();

        public void InsertarCategoria(string Categoria, string UsuarioCrea)
        {
            string sql = $"EXEC UDP_InsertarCategorias '{Categoria}', '{UsuarioCrea}'";
            util.ObtenerDS(sql, "T");
        }

        public void EditarCategoria(string ID, string Categoria, string UsuarioModificacion)
        {
            string sql = $"EXEC UDP_EditarCategorias '{ID}', '{Categoria}','{UsuarioModificacion}'";
            util.ObtenerDS(sql, "T");
        }

        public void EliminarCategoria(string ID)
        {
            string sql = $"EXEC UDP_BorrarCaTegorias '{ID}'";
            util.ObtenerDS(sql, "T");
        }



    }
}