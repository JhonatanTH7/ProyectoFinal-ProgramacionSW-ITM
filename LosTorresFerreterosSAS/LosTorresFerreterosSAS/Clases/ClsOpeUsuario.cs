using LosTorresFerreterosSAS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace LosTorresFerreterosSAS.Clases
{
    public class ClsOpeUsuario
    {

        private LosTorresFerreterosSASEntities oEFR = new LosTorresFerreterosSASEntities();

        public Usuario tblUsuario { get; set; }

        public string Insertar(int documentoEmpleado, [FromBody] Usuario usuario)
        {
            try
            {
                var empleado = oEFR.Empleadoes.FirstOrDefault(e => e.numero_documento == documentoEmpleado);
                usuario.id_empleado = empleado.codigo;
                int codigoUsuario = oEFR.Usuarios.Max(u => u.codigo)+1;
                usuario.codigo = codigoUsuario;
                usuario.activo = true;
                oEFR.Usuarios.Add(usuario);
                oEFR.SaveChanges();
                return "Usuario agregado exitosamente";
            }
            catch (Exception ex)
            {

                return ex.Message;
            }
        }
    }
}