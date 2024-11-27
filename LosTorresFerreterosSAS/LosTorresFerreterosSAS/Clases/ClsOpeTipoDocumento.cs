using LosTorresFerreterosSAS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LosTorresFerreterosSAS.Clases
{
    public class ClsOpeTipoDocumento
    {

        private LosTorresFerreterosSASEntities oEFR = new LosTorresFerreterosSASEntities();

        public List<TipoDocumento> ListarTiposDocumento()
        {
            return oEFR.TipoDocumentoes.OrderBy(x => x.nombre_tipodocumento).ToList();
        }

    }
}