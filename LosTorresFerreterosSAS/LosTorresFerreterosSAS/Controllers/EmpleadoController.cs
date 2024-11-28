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
    public class EmpleadoController : ApiController
    {
        public string Post(Empleado empleado)
        {
            ClsOpeEmpleado _clsEmpleado = new ClsOpeEmpleado();
            return _clsEmpleado.InsertarEmpleado(empleado);
        }

        public Empleado Get(int documentoEmpleado)
        {
            ClsOpeEmpleado _clsEmpleado = new ClsOpeEmpleado();
            return _clsEmpleado.ConsultarEmpleado(documentoEmpleado);
        }

        public string Put(Empleado empleado)
        {
            ClsOpeEmpleado _clsEmpleado = new ClsOpeEmpleado();
            return _clsEmpleado.ActualizarEmpleado(empleado);
        }
    }
}