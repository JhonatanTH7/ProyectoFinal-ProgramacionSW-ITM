using LosTorresFerreterosSAS.Clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace LosTorresFerreterosSAS.Controllers
{
    public class ProductoController : ApiController
    {
       
        public IQueryable Get()
        {
            ClsOpeProducto objProducto = new ClsOpeProducto();
            return objProducto.ListarProductosDisponibles();
        }

        public IQueryable Get(int idProd)
        {
            ClsOpeProducto objProducto = new ClsOpeProducto();
            return objProducto.ProductoXId(idProd);
        }

    }
}