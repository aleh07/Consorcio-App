using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Contactos 
    {
        public Int32 id { get; set; }
         
        public Servicios servicios { get; set; }
        public Int32 IdServicio { get; set; }
        public string NombreContacto { get; set; }
        public string Telefono { get; set; }
        public string Horarios { get; set; }
        public string Sitio { get; set; }
        public string ImgSitio { get; set; }

        public string Ubicacion { get; set; }

        public string ImgUbicacion { get; set; }
        public bool estado { get; set; }

    }
}
