using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class ProyectosNegocio
    {
        
        public List<Proyectos> ListarProyectosAprobados()
        {
            AccesoDatos Datos = new AccesoDatos();
            List<Proyectos> lista = new List<Proyectos>();


            Datos.setearConsulta("Select  p.nombre, p.descripcion,  p.monto , tp.descripcion From Proyectos as p inner join EstadosProyectos as tp on p.IDESTADO=tp.id ");

            Datos.ejecutarLectura();
            try
            {
                while (Datos.Lector.Read())
                {
                    Proyectos aux1 = new Proyectos();
                     
                    aux1.Nombre = (string)Datos.Lector["p.nombre"];
                    aux1.Descripcion = (string)Datos.Lector["p.descripcion"];
                    aux1.Monto = (decimal)Datos.Lector["p.monto"];
                    aux1.Tipo = new TipoProyecto();
                    aux1.Tipo.Descripcion = (string)Datos.Lector["tp.descripcion"];
                    lista.Add(aux1); 
                }

                return lista;
            }
            catch (Exception)
            {

                throw;
            }
            finally
             {
                Datos.cerrarConexion();
            }

        }

        
        public void AgregarProyecto(Proyectos proyecto)
        {
           

            AccesoDatos Datos = new AccesoDatos();
            Datos.setearSP("sp_ins_proyecto");

            Datos.setearParametro("@Nombre", proyecto.Nombre);
            Datos.setearParametro("@Descripcion", proyecto.Descripcion);
            Datos.setearParametro("@Monto", proyecto.Monto);
            Datos.setearParametro("@idestado",proyecto.Tipo.ID);
            Datos.ejectutarAccion();
            Datos.cerrarConexion();
        }

         
    }
}
