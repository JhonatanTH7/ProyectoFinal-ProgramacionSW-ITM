using LosTorresFerreterosSAS.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;

namespace LosTorresFerreterosSAS.Clases
{
    public class ClsOpeEmpleado
    {

        private LosTorresFerreterosSASEntities oEFR = new LosTorresFerreterosSASEntities();

        public Empleado tblEmpleado { get; set; }

        public string InsertarEmpleado(Empleado empleado)
        {
            try
            {
                int codigoEmpleado = oEFR.Empleadoes.Max(e => e.codigo)+1;
                empleado.codigo = codigoEmpleado;
                empleado.activo = true;
                oEFR.Empleadoes.Add(empleado);
                oEFR.SaveChanges();
                return "Empleado agregado correctamente";
            }
            catch (Exception ex)
            {

                return ex.Message;
            }
        }

        public Empleado ConsultarEmpleado(int documentoEmpleado)
        {
            try
            {
                var empleado = oEFR.Empleadoes.FirstOrDefault(e => e.numero_documento == documentoEmpleado);
                return empleado;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public string ActualizarEmpleado(Empleado empleado)
        {
            try
            {
                int codigoEmpleado = oEFR.Empleadoes.FirstOrDefault(e => e.numero_documento==empleado.numero_documento).codigo;
                empleado.codigo = codigoEmpleado;
                oEFR.Empleadoes.AddOrUpdate(empleado);
                oEFR.SaveChanges();
                return "Empleado actualizado correctamente";
            }
            catch (Exception ex)
            {

                return ex.Message;
            }
        }

    }
}