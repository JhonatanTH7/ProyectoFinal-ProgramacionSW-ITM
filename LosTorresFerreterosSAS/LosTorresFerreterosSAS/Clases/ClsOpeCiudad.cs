using LosTorresFerreterosSAS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LosTorresFerreterosSAS.Clases
{
    public class ClsOpeCiudad
    {

        private LosTorresFerreterosSASEntities oEFR = new LosTorresFerreterosSASEntities();

        public List<Ciudad> ListarCiudadesPorDepartamento(int idDpto)
        {
            return oEFR.Ciudads. Where(x => x.id_departamento == idDpto).OrderBy(x => x.nombre_ciudad).ToList();
        }

    }
}