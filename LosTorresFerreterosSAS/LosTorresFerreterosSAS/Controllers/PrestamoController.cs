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
    public class PrestamoController : ApiController
    {

        public IQueryable Get(int comando, int parametro)
        {
            ClsOpePrestamo objPrestamo = new ClsOpePrestamo();

            switch(comando)
            {
                case 1:
                    return objPrestamo.ConsultarPrestamosXDocCliente(parametro);
                default:
                    return objPrestamo.ConsultarPrestamosXId(parametro);
            }

        }

        public Prestamo Post([FromBody] Prestamo pres)
        {
            ClsOpePrestamo objPrestamo = new ClsOpePrestamo();
            objPrestamo.tblPrestamo = pres;
            return objPrestamo.Insertar();
        }

        public string Put(int comando, int idPrestamo, [FromBody] Prestamo pres)
        {
            ClsOpePrestamo objPrestamo = new ClsOpePrestamo();
            objPrestamo.tblPrestamo = pres;
            switch (comando)
            {
                case 1:
                    return objPrestamo.ActualizarValores(idPrestamo);
                default:
                    return objPrestamo.Actualizar(idPrestamo);

            }
        }

        public string Delete(int idPrestamo)
        {
            ClsOpePrestamo objPrestamo = new ClsOpePrestamo();
            return objPrestamo.Eliminar(idPrestamo);
        }

    }
}