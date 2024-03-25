using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
   public  class Usuario :Persona
    {
        public long ID { get; set; }
        public string NombreUsuario { get; set; }
        /*NOBRE ,APELLIDO  Y FECHA NAC LO HEREDO DE PERSONA */

        public string Email { get; set; }
        public string Pass { get; set; }

        public DateTime FechaAlta { get; set; }
        public int Tipo { get; set; }
        public bool Estado { get; set; }

        public Int32 IDDepto { get; set; }

        public Departamento departamento { get; set; }

    }
}
