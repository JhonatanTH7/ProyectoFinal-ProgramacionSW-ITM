using LosTorresFerreterosSAS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LosTorresFerreterosSAS.Clases
{
    public class ClsOpeCliente
    {

        private LosTorresFerreterosSASEntities oEFR = new LosTorresFerreterosSASEntities();

        public IQueryable ListarClientes()
        {
            return from CLI in oEFR.Set<Cliente>()
                   join TDC in oEFR.Set<TipoDocumento>() 
                    on CLI.id_tipodocumento equals TDC.codigo
                   join TIC in oEFR.Set<TipoCliente>()
                    on CLI.id_tipocliente equals TIC.codigo
                   where CLI.activo == true
                   orderby CLI.nombre_cliente
                   select new
                   {
                      CodigoCliente = CLI.codigo,
                      NombreCliente = CLI.nombre_cliente,
                      CodigoTipoDocumento = CLI.id_tipodocumento,
                      NombreTipoDocumento = TDC.nombre_tipodocumento,
                      NumeroDocCliente = CLI.numero_documento,
                      CodigoTipoCliente = CLI.id_tipocliente,
                      NombreTipoCliente = TIC.nombre_tipocliente,
                   };
        }


        public IQueryable ClienteXDoc(int docCli)
        {
            return from CLI in oEFR.Set<Cliente>()
                   join TDC in oEFR.Set<TipoDocumento>()
                    on CLI.id_tipodocumento equals TDC.codigo
                   join TIC in oEFR.Set<TipoCliente>()
                    on CLI.id_tipocliente equals TIC.codigo
                   where CLI.activo == true && CLI.numero_documento == docCli
                   select new
                   {
                       CodigoCliente = CLI.codigo,
                       NombreCliente = CLI.nombre_cliente,
                       CodigoTipoDocumento = CLI.id_tipodocumento,
                       NombreTipoDocumento = TDC.nombre_tipodocumento,
                       NumeroDocCliente = CLI.numero_documento,
                       CodigoTipoCliente = CLI.id_tipocliente,
                       NombreTipoCliente = TIC.nombre_tipocliente,
                   };
        }

    }
}