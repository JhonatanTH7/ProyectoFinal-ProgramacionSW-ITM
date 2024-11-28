using LosTorresFerreterosSAS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LosTorresFerreterosSAS.Clases
{
    public class ClsOpeDetallesPrestamo
    {

        private LosTorresFerreterosSASEntities oEFR = new LosTorresFerreterosSASEntities();

        public DetallesPrestamo tblDetallesPrestamo { get; set; }

        public List<DetallesPrestamo> ConsultarDetallesXIdPrestamo(int idPrestamo)
        {
            return oEFR.DetallesPrestamoes.Where(x => x.id_prestamo == idPrestamo).OrderBy(x => x.cantidad).ToList();
        }

        public DetallesPrestamo Insert()
        {

            int Cod = 0;
            Cod = oEFR.DetallesPrestamoes.DefaultIfEmpty().Max(x => x == null ? 1 : x.codigo + 1);

            if (Cod > 0)
            {
                tblDetallesPrestamo.codigo = Cod;
                oEFR.DetallesPrestamoes.Add(tblDetallesPrestamo);
                oEFR.SaveChanges();
                return tblDetallesPrestamo;
            }
            else
            {
                return tblDetallesPrestamo;
            }

        }

        public string Actualizar()
        {
            try
            {
                DetallesPrestamo detPrestamo = oEFR.DetallesPrestamoes.FirstOrDefault(x => x.codigo == tblDetallesPrestamo.codigo);
                detPrestamo.cantidad = tblDetallesPrestamo.cantidad;
                detPrestamo.fecha_retorno = tblDetallesPrestamo.fecha_retorno;
                detPrestamo.porcentaje_descuento = tblDetallesPrestamo.porcentaje_descuento;
                detPrestamo.porcentaje_iva = tblDetallesPrestamo.porcentaje_iva;
                detPrestamo.retornado = tblDetallesPrestamo.retornado;
                oEFR.SaveChanges();
                return "Se actualizo el detalle del prestamo";
            }
            catch
            {
                return "Error,Hubo un fallo al actualizar el detalle del prestamo";
            }
        }

        public string ActualizarRetorno()
        {
            try
            {
                DetallesPrestamo detPrestamo = oEFR.DetallesPrestamoes.FirstOrDefault(x => x.codigo == tblDetallesPrestamo.codigo);
                detPrestamo.retornado = tblDetallesPrestamo.retornado;
                oEFR.SaveChanges();
                return "Se actualizo el detalle del prestamo";
            }
            catch
            {
                return "Error,Hubo un fallo al actualizar el detalle del prestamo";
            }

        }

        public string ActualizarFechaRetorno()
        {
            try
            {
                DetallesPrestamo detPrestamo = oEFR.DetallesPrestamoes.FirstOrDefault(x => x.codigo == tblDetallesPrestamo.codigo);
                detPrestamo.fecha_retorno = tblDetallesPrestamo.fecha_retorno;
                oEFR.SaveChanges();
                return "Se actualizo el detalle del prestamo";
            }
            catch
            {
                return "Error,Hubo un fallo al actualizar el detalle del prestamo";
            }

        }
    }
}