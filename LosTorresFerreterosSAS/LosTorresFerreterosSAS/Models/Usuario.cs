//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LosTorresFerreterosSAS.Models
{
    using Newtonsoft.Json;
    using System;
    using System.Collections.Generic;
    
    public partial class Usuario
    {
        public int codigo { get; set; }
        public string usuario1 { get; set; }
        public string contrasenia { get; set; }
        public bool activo { get; set; }
        public int id_empleado { get; set; }

        [JsonIgnore]
        public virtual Empleado Empleado { get; set; }
    }
}
