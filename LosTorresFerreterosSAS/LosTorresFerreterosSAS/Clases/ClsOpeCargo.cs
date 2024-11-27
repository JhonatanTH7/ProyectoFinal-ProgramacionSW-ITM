using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LosTorresFerreterosSAS.Models;

namespace LosTorresFerreterosSAS.Clases
{
    public class ClsOpeCargo
    {

        private LosTorresFerreterosSASEntities oEFR = new LosTorresFerreterosSASEntities();

        public List<Cargo> ListarCargos()
        {
            return oEFR.Cargoes.OrderBy(x => x.nombre_cargo).ToList();
        }

    }
}