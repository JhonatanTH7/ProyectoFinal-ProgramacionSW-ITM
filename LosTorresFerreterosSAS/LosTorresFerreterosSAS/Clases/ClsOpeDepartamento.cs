using LosTorresFerreterosSAS.Models;
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

    }
}