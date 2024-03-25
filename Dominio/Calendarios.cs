using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Calendarios
    {
        //public String Fecha { get; set; }

        public long Id { get; set;
        }
        public String Horario { get; set; }

        public DateTime Fecha { get; set; }

        public String evento { get; set; }

        public string Descripcion { get; set; }

        public bool  Estado { get; set; }
    }
}
