using LosTorresFerreterosSAS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LosTorresFerreterosSAS.Clases
{
    public class ClsOpeDetallesPrestamo
    {

        private LosTorresFerreterosSASEntities oEFR = new LosTorresFerreterosSASEntities();

        public DetallesPrestamo tblDetallesPrestamo { get; set; }

    }
}