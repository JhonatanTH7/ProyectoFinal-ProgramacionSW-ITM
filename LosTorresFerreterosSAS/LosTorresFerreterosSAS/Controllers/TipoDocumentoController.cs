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
    public class TipoDocumentoController : ApiController
    {
       
        public List<TipoDocumento> Get()
        {
            ClsOpeTipoDocumento objTipoDocumento = new ClsOpeTipoDocumento();
            return objTipoDocumento.ListarTiposDocumento();
        }

    }
}