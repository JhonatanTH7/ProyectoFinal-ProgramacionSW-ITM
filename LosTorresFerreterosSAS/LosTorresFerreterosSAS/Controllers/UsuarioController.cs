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
    public class UsuarioController : ApiController
    {

        public IQueryable Get([FromBody] Login credenciales)
        {
            ClsOpeUsuario objUsuario = new ClsOpeUsuario();
            objUsuario.tblUsuario = new Usuario();
            objUsuario.tblUsuario.usuario1 = credenciales.usuario;
            objUsuario.tblUsuario.contrasenia = credenciales.contrasenia;
            return objUsuario.ValidarCredenciales();
        }

        public string Post(int documentoEmpleado, Usuario usuario)
        {
            ClsOpeUsuario _clsUsuario = new ClsOpeUsuario();
            return _clsUsuario.Insertar(documentoEmpleado, usuario);
        }

        public string Put (int comando, [FromBody] Usuario usu)
        {
            ClsOpeUsuario objUsuario = new ClsOpeUsuario();
            objUsuario.tblUsuario = usu;
            switch (comando)
            {
                case 1:
                    return objUsuario.ActualizarContraseña();
                case 2:
                    return objUsuario.SwitchActivo();
                default:
                    return objUsuario.ActualizarNombreUsuario();
            }
            
        }

        //public string Post([FromBody] Usuario usuario)
        //{
        //    ClsOpeUsuario objUsuario = new ClsOpeUsuario();
        //    objUsuario.tblUsuario = usuario;
        //    return objUsuario.Insertar(documentoEmpleado);
        //}

    }
}