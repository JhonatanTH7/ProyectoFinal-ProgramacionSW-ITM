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
    public class DepartamentoController : ApiController
    {
       
        public List<Departamento> Get()
        {
            ClsOpeDepartamento objDepartamento = new ClsOpeDepartamento();
            return objDepartamento.ListarDepartamentos();
        }

        public Departamento Get(int idCiudad)
        {
            ClsOpeDepartamento objDepartamento = new ClsOpeDepartamento();
            return objDepartamento.ConsultarDepartamento(idCiudad);
        }

    }
}