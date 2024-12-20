﻿using LosTorresFerreterosSAS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LosTorresFerreterosSAS.Clases
{
    public class ClsOpeDepartamento
    {
        
        private LosTorresFerreterosSASEntities oEFR = new LosTorresFerreterosSASEntities();

        public List<Departamento> ListarDepartamentos()
        {
            return oEFR.Departamentoes.OrderBy(x => x.nombre_departamento).ToList();
        }

        public Departamento ConsultarDepartamento(int idCiudad)
        {
            var ciudad = oEFR.Ciudads.FirstOrDefault(c => c.codigo == idCiudad);
            return oEFR.Departamentoes.FirstOrDefault(x => x.codigo == ciudad.id_departamento);
        }

    }
}