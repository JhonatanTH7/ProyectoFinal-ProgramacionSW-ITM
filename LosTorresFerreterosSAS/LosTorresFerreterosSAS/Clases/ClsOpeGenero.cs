using LosTorresFerreterosSAS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LosTorresFerreterosSAS.Clases
{
    public class ClsOpeGenero
    {

        private LosTorresFerreterosSASEntities oEFR = new LosTorresFerreterosSASEntities();

        public List<Genero> ListarGeneros()
        {
            return oEFR.Generoes.OrderBy(x => x.nombre_genero).ToList();
        }

    }
}