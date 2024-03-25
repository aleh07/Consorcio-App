using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
namespace Negocio
{
    public class GrillaNegocios
    {
        AccesoDatos datos = new AccesoDatos();
        public List<Calendarios> Listar(DateTime fecha)
        {
            List<Calendarios> lista = new List<Calendarios>();
            AccesoDatos Datos = new AccesoDatos();
            //pongo en una cadena la fecha que viene por parametro , tuve que descomponer de esta manera la fecha por k en sql tiene este formato amo mes dia y no encontre otra forma de que me lo tome,
            string fechaseleccionada = "'" + fecha.Year + "/" + fecha.Month + "/" + fecha.Day + "'";
            Datos.setearConsulta("select  id,hora,evento ,descripcion from calendarios where estado = 1 and fecha =" + fechaseleccionada + "");
            Datos.ejecutarLectura();

            try
            {
                while (Datos.Lector.Read())
                {
                    Calendarios aux = new Calendarios();
                    // DateTime solofecha = (DateTime)Datos.Lector["fecha"];
                    //aux.Fecha = solofecha.ToShortDateString() ;
                    aux.Id = Convert.ToInt32((long)Datos.Lector["id"]);
                    aux.Horario = Convert.ToString(Datos.Lector["hora"]);
                    aux.evento = (string)Datos.Lector["evento"];
                    aux.Descripcion = (string)Datos.Lector["descripcion"];

                    lista.Add(aux);
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

        public void AgregarEvento(Calendarios calendar)
        {
            datos.setearSP("sp_ins_evento");

            datos.setearParametro("@Fecha", calendar.Fecha);
            datos.setearParametro("@Hora", calendar.Horario);
            datos.setearParametro("@Evento", calendar.evento);
            datos.setearParametro("@Descripcion", calendar.Descripcion);


            datos.ejectutarAccion();
            datos.cerrarConexion();
        }

        public void Modificar(Calendarios calendar)
        {
            datos.setearSP("sp_Modif_calendario");

            datos.setearParametro("@ID", calendar.Id);
            datos.setearParametro("@Fecha", calendar.Fecha);
            datos.setearParametro("@Hora", calendar.Horario);
            datos.setearParametro("@Evento", calendar.evento);
            datos.setearParametro("@Descripcion", calendar.Descripcion);

            datos.ejectutarAccion();
            datos.cerrarConexion();
        }

        public void eliminar(int id)
        {
            datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Calendarios SET Estado = 0 where ID =" + id);
                datos.ejectutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
                datos = null;
            }
        }

        public Calendarios TraerEvento(int id)
        {
            Usuario cuenta = new Usuario();
            AccesoDatos Datos = new AccesoDatos();



            Datos.setearConsulta("select * from calendarios where estado = 1 and id=" + id);
            Datos.ejecutarLectura();

            try
            {
                Datos.Lector.Read();

                Calendarios aux = new Calendarios();

                aux.Id = (long)Datos.Lector["Id"];
                aux.Fecha = (DateTime)Datos.Lector["Fecha"];
                aux.Horario = Convert.ToString(Datos.Lector["Hora"]);
                aux.evento = (string)Datos.Lector["Evento"];
                aux.Descripcion = (string)Datos.Lector["Descripcion"];
                aux.Estado = (bool)Datos.Lector["Estado"];


                 return aux;
            }
             catch (Exception e)
            {
                throw e;
            }
            finally
            {
                Datos.cerrarConexion();
            }
        }
    }
}
