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
    [EnableCors(origins: "http://localhost:XXXXX", headers: "*", methods: "*")]
    public class GeneroController : ApiController
    {
        
        public List<Genero> Get()
        {
            ClsOpeGenero objGenero = new ClsOpeGenero();
            return objGenero.ListarGeneros();
        }

    }
}