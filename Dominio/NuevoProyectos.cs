using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class NuevoProyectos
    {
        public string Nombre { set; get; }
        public string Descripcion { set; get; }
        public decimal Monto { set; get; }
        public DateTime FechaAlta { set; get; }

        public TipoProyecto Tipo { set; get; }

    }
}
