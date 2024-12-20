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
    
    public partial class Prestamo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Prestamo()
        {
            this.DetallesPrestamoes = new HashSet<DetallesPrestamo>();
        }
    
        public int codigo { get; set; }
        public string fecha { get; set; }
        public int subtotal { get; set; }
        public int valor_total { get; set; }
        public int id_cliente { get; set; }
        public int id_empleado { get; set; }

        [JsonIgnore]
        public virtual Cliente Cliente { get; set; }
        [JsonIgnore]
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DetallesPrestamo> DetallesPrestamoes { get; set; }
        [JsonIgnore]
        public virtual Empleado Empleado { get; set; }
    }
}
