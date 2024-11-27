using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using LosTorresFerreterosSAS.Clases;

namespace LosTorresFerreterosSAS.Controllers
{
    [EnableCors(origins: "http://localhost:XXXXX", headers: "*", methods: "*")]
    public class ClienteController : ApiController
    {
       
        public IQueryable Get()
        {
            ClsOpeCliente oCliente = new ClsOpeCliente();
            return oCliente.ListarClientes();
        }

        public IQueryable Get(int docCli)
        {
            ClsOpeCliente oCliente = new ClsOpeCliente();
            return oCliente.ClienteXDoc(docCli);
        }

    }
}