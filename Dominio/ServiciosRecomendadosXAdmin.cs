using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
  public  class ServiciosRecomendadosXAdmin
    {
        public Int32 ID { get; set; }
        public Int32 ServicioID { get; set; }
        public Servicios servicio { get; set; }

        public String NombreContacto { get; set; }

        public String Contacto { get; set; }
        public string Horario { get; set; }

        public string PaginaWeb { get; set; }
         
        public string ImgSitio { get; set; }

        public string Ubicacion { get; set; }

        public string ImgUbi { get; set; }

        public bool estado { get; set; }
    }
}
