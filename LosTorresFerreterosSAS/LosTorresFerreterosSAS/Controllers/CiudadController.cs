using LosTorresFerreterosSAS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using LosTorresFerreterosSAS.Clases;
using System.Web.Http.Cors;

namespace LosTorresFerreterosSAS.Controllers
{
    [EnableCors(origins: "http://localhost:XXXXX", headers: "*", methods: "*")]
    public class CiudadController : ApiController
    {
        
        public List<Ciudad> Get(int idDpto)
        {
            ClsOpeCiudad objCiudad = new ClsOpeCiudad();
            return objCiudad.ListarCiudadesPorDepartamento(idDpto); 
        }

    }
}