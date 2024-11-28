using LosTorresFerreterosSAS.Clases;
using LosTorresFerreterosSAS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace LosTorresFerreterosSAS.Controllers
{
    [EnableCors(origins: "http://localhost:55161", headers: "*", methods: "*")]
    public class DetallesPrestamoController : ApiController
    {
        public List<DetallesPrestamo> Get(int idPrestamo)
        {
            ClsOpeDetallesPrestamo objDetallesPrestamo = new ClsOpeDetallesPrestamo();
            return objDetallesPrestamo.ConsultarDetallesXIdPrestamo(idPrestamo);
        }

        public DetallesPrestamo Post([FromBody] DetallesPrestamo detPres)
        {
            ClsOpeDetallesPrestamo objDetallesPrestamo = new ClsOpeDetallesPrestamo();
            objDetallesPrestamo.tblDetallesPrestamo = detPres;
            return objDetallesPrestamo.Insert();

        }

        public string Put(int comando, [FromBody] DetallesPrestamo detPres)
        {
            ClsOpeDetallesPrestamo objDetallesPrestamo = new ClsOpeDetallesPrestamo();
            objDetallesPrestamo.tblDetallesPrestamo = detPres;

            switch (comando)
            {
                case 1:
                    return objDetallesPrestamo.ActualizarRetorno();
                case 2:
                    return objDetallesPrestamo.ActualizarFechaRetorno();
                default:
                    return objDetallesPrestamo.Actualizar();
            }
            
        }
    }
}