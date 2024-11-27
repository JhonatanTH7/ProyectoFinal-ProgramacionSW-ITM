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
    
    public partial class Cliente
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Cliente()
        {
            this.Prestamoes = new HashSet<Prestamo>();
            this.Sedes = new HashSet<Sede>();
            this.Telefonoes = new HashSet<Telefono>();
        }
    
        public int codigo { get; set; }
        public string nombre_cliente { get; set; }
        public int numero_documento { get; set; }
        public bool activo { get; set; }
        public int id_tipodocumento { get; set; }
        public int id_tipocliente { get; set; }
        public int id_empleado { get; set; }

        [JsonIgnore]
        public virtual Empleado Empleado { get; set; }
        [JsonIgnore]
        public virtual TipoDocumento TipoDocumento { get; set; }
        [JsonIgnore]
        public virtual TipoCliente TipoCliente { get; set; }
        [JsonIgnore]
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Prestamo> Prestamoes { get; set; }
        [JsonIgnore]
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Sede> Sedes { get; set; }
        [JsonIgnore]
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Telefono> Telefonoes { get; set; }
    }
}