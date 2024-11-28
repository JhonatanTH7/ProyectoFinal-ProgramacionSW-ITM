using LosTorresFerreterosSAS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LosTorresFerreterosSAS.Clases
{
    public class ClsOpeProducto
    {

        private LosTorresFerreterosSASEntities oEFR = new LosTorresFerreterosSASEntities();

        public IQueryable ListarProductosDisponibles()
        {
            return from PRO in oEFR.Set<Producto>()
                   join TIP in oEFR.Set<TipoProducto>()
                    on PRO.id_tipoproducto equals TIP.codigo
                   join MAR in oEFR.Set<Marca>()
                    on PRO.id_marca equals MAR.codigo
                   where PRO.activo == true && PRO.existencia > 0
                   orderby PRO.descripcion
                   select new
                   {
                       CodigoProducto = PRO.codigo,
                       ExistenciaProducto = PRO.existencia,
                       ValorDiaProducto = PRO.valor_dia,
                       NombreProducto = PRO.descripcion,
                       CaracteristicasProducto = PRO.caracteristicas,
                       CodigoTipoProducto = PRO.id_tipoproducto,
                       NombreTipoProducto = TIP.nombre_tipoproducto,
                       CodigoMarca = PRO.id_marca,
                       NombreMarca = MAR.nombre_marca,
                   };
        }

        public IQueryable ProductoXId(int idProd)
        {
            return from PRO in oEFR.Set<Producto>()
                   join TIP in oEFR.Set<TipoProducto>()
                    on PRO.id_tipoproducto equals TIP.codigo
                   join MAR in oEFR.Set<Marca>()
                    on PRO.id_marca equals MAR.codigo
                   where PRO.activo == true && PRO.codigo == idProd
                   select new
                   {
                       CodigoProducto = PRO.codigo,
                       ExistenciaProducto = PRO.existencia,
                       ValorDiaProducto = PRO.valor_dia,
                       NombreProducto = PRO.descripcion,
                       CaracteristicasProducto = PRO.caracteristicas,
                       CodigoTipoProducto = PRO.id_tipoproducto,
                       NombreTipoProducto = TIP.nombre_tipoproducto,
                       CodigoMarca = PRO.id_marca,
                       NombreMarca = MAR.nombre_marca,
                   };
        }

        public List<Producto> ListarProductosPorTipo(int idTipoProducto)
        {
            return oEFR.Productoes.Where(p => p.id_tipoproducto== idTipoProducto && p.activo).ToList();
        }

    }
}