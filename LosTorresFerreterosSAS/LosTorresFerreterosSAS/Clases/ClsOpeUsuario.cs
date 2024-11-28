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

        public IQueryable ValidarCredenciales()
        {
            return from USU in oEFR.Set<Usuario>()
                   where USU.activo == true && USU.usuario1 == tblUsuario.usuario1 && USU.contrasenia == tblUsuario.contrasenia
                   select new
                   {
                       IdUsuario = USU.codigo,
                       NombreUsuario = USU.usuario1
                   };
        }

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
            catch
            {
                return "Error al ingresar usuario";
            }
        }

        public string ActualizarContraseña()
        {
            try
            {
                var usuario = oEFR.Usuarios.FirstOrDefault(u => u.codigo == tblUsuario.codigo);
                usuario.contrasenia = tblUsuario.contrasenia;
                oEFR.SaveChanges();
                return "Contraseña actualizada exitosamente";
            }
            catch
            {
                return "Error al actualizar contraseña";
            }
        }

        public string SwitchActivo()
        {
            try
            {
                var usuario = oEFR.Usuarios.FirstOrDefault(u => u.codigo == tblUsuario.codigo);
                usuario.activo = !usuario.activo;
                oEFR.SaveChanges();
                return "Estado de usuario actualizado exitosamente";
            }
            catch
            {
                return "Error al actualizar estado de usuario";
            }
        }

        public string ActualizarNombreUsuario()
        {
            try
            {
                if (!ExisteNombreDeUsuario())
                {
                var usuario = oEFR.Usuarios.FirstOrDefault(u => u.codigo == tblUsuario.codigo);
                usuario.usuario1 = tblUsuario.usuario1;
                oEFR.SaveChanges();
                return "Nombre de usuario actualizado exitosamente";
                }
                return "El nombre de usuario ya esta en uso";
            }
            catch
            {
                return "Error al actualizar nombre de usuario";
            }
        }

        //public string Insertar()
        //{
        //    try
        //    {
        //        if (!ExisteNombreDeUsuario())
        //        {
        //            var empleado = oEFR.Empleadoes.FirstOrDefault(e => e.numero_documento == tblUsuario.id_empleado);
        //            int codigoUsuario = oEFR.Usuarios.DefaultIfEmpty().Max(x => x == null ? 1 : x.codigo + 1);
        //            tblUsuario.codigo = codigoUsuario;
        //            tblUsuario.activo = true;
        //            oEFR.Usuarios.Add(tblUsuario);
        //            oEFR.SaveChanges();
        //            return "Usuario agregado exitosamente";
        //        }
        //        return "El nombre de usuario ya esta en uso";
        //    }
        //    catch
        //    {
        //        return "Error al ingresar usuario";
        //    }
        //}

        private bool ExisteNombreDeUsuario()
        {
            return oEFR.Usuarios.FirstOrDefault(e => e.usuario1 == tblUsuario.usuario1) != null;
        }
    }
}