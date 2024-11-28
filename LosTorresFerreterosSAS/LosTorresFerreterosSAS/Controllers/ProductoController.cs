﻿using LosTorresFerreterosSAS.Clases;
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