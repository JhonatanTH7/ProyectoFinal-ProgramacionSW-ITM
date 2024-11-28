using LosTorresFerreterosSAS.Clases;
using LosTorresFerreterosSAS.Models;

using Microsoft.Ajax.Utilities;

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
    public class TipoProductoController : ApiController
    {
        public List<TipoProducto> Get()
        {
            ClsOpeTipoproducto _clsTipoProducto = new ClsOpeTipoproducto();
            return _clsTipoProducto.ListarTipoProductos();
        }
    }
}