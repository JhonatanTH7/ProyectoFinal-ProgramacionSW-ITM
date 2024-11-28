using LosTorresFerreterosSAS.Models;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LosTorresFerreterosSAS.Clases
{
    public class ClsOpeTipoproducto
    {
        private LosTorresFerreterosSASEntities oEFR = new LosTorresFerreterosSASEntities();

        public List<TipoProducto> ListarTipoProductos()
        {
            try
            {
                return oEFR.TipoProductoes.OrderBy(tp => tp.nombre_tipoproducto).ToList();
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}