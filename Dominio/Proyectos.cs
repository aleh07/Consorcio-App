using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Proyectos
    {
       
        public string Nombre { get; set; }
        public string Descripcion { get; set; }

      
        public TipoProyecto Tipo { get; set; }
        public decimal Monto { get; set; }
        
    }
}
