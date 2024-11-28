using LosTorresFerreterosSAS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LosTorresFerreterosSAS.Clases
{
    public class ClsOpePrestamo
    {

        private LosTorresFerreterosSASEntities oEFR = new LosTorresFerreterosSASEntities();

        public Prestamo tblPrestamo { get; set; }


        public IQueryable ConsultarPrestamosXDocCliente(int docCliente)
        {
            return from PRES in oEFR.Set<Prestamo>()
                   join CLI in oEFR.Set<Cliente>() on PRES.id_cliente equals CLI.codigo
                   where CLI.numero_documento == docCliente
                   select new
                   {
                      CodigoPrestamo = PRES.codigo,
                      FechaPrestamo = PRES.fecha,
                      SubTotalPrestamo = PRES.subtotal,
                      ValorTotalPrestamo = PRES.valor_total,
                      CodigoEmpleado = PRES.id_empleado
                   };
        }

        public IQueryable ConsultarPrestamosXId (int idPres)
        {
            return from PRES in oEFR.Set<Prestamo>()
                   where PRES.codigo == idPres
                   select new
                   {
                       CodigoPrestamo = PRES.codigo,
                       FechaPrestamo = PRES.fecha,
                       SubTotalPrestamo = PRES.subtotal,
                       ValorTotalPrestamo = PRES.valor_total,
                       CodigoEmpleado = PRES.id_empleado
                   };
        }

        public Prestamo Insertar()
        {

            int Cod = 0;
            Cod = oEFR.Prestamoes.DefaultIfEmpty().Max(x => x == null ? 1 : x.codigo + 1);

            if (Cod > 0)
            {
                tblPrestamo.codigo = Cod;
                oEFR.Prestamoes.Add(tblPrestamo);
                oEFR.SaveChanges();
                return tblPrestamo;
            }
            else {
                return tblPrestamo;
            }

        }

        public string ActualizarValores(int idPrestamo)
        {
            try
            {
                Prestamo pres = oEFR.Prestamoes.FirstOrDefault(x => x.codigo == tblPrestamo.codigo);
                pres.subtotal = tblPrestamo.subtotal;
                pres.valor_total = tblPrestamo.valor_total;
                oEFR.SaveChanges();
                return "Valores del Prestamo Actualizados";
            }
            catch
            {
                return "Error al Actualizar los valores del Prestamo";
            }
        }

        public string Actualizar(int idPrestamo)
        {
            try
            {
                Prestamo pres = oEFR.Prestamoes.FirstOrDefault(x => x.codigo == idPrestamo);
                pres.fecha = tblPrestamo.fecha;
                pres.subtotal = tblPrestamo.subtotal;
                pres.valor_total = tblPrestamo.valor_total;
                pres.id_cliente = tblPrestamo.id_cliente;
                oEFR.SaveChanges();
                return "Se actualizo el prestamo";
            }
            catch
            {
                return "Error,Hubo un fallo al actualizar el prestamo";
            }

        }

        public string Eliminar(int idPrestamo)
        {
            try
            {
                if (oEFR.DetallesPrestamoes.FirstOrDefault(x => x.id_prestamo == idPrestamo) == null)
                {
                    Prestamo pres = oEFR.Prestamoes.FirstOrDefault(x => x.codigo == tblPrestamo.codigo);
                    oEFR.Prestamoes.Remove(pres);
                    oEFR.SaveChanges();
                    return "Se elimino el prestamo";
                }
                else
                {
                    return "No se puede eliminar el prestamo, ya que tiene detalles de prestamo asociados";
                }
            }
            catch
            {
                return "Error,Hubo un fallo al eliminar el prestamo";
            }
        }

    }
}