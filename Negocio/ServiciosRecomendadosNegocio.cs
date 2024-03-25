using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
namespace Negocio
{
    public class ServiciosRecomendadosNegocio
    {
        AccesoDatos Datos = new AccesoDatos();
        public List<Contactos> ServiciosRecomendados()
        {

            List<Contactos> lista = new List<Contactos>();
            Datos.setearConsulta("select SR.ID,SR.IDSERVICIO,S.DESCRIPCION,SR.txt_Nombre,SR.NroContacto,SR.Horarios,SR.Sitio,SR.ImgSitio,SR.Ubicacion,SR.ImgUbicacion,SR.ESTADO from ServiciosRecomendados AS SR inner join SERVICIOS AS S ON SR.IDSERVICIO=S.ID where SR.ESTADO = 1");
            Datos.ejecutarLectura();

            try
            {

                while (Datos.Lector.Read())
                {
                    Contactos aux = new Contactos();

                    aux.id = Convert.ToInt32((long)Datos.Lector["ID"]);
                    aux.servicios = new Servicios();
                    aux.servicios.ID = (Int32)Datos.Lector["IDSERVICIO"];
                    aux.servicios.Descripcion = (String)Datos.Lector["DESCRIPCION"];
                    aux.NombreContacto = (string)Datos.Lector["txt_Nombre"];
                    aux.Telefono = (string)Datos.Lector["NroContacto"];
                    aux.Horarios = (string)Datos.Lector["Horarios"];
                    aux.Sitio = (string)Datos.Lector["Sitio"];
                    aux.ImgSitio = (string)Datos.Lector["ImgSitio"];
                    aux.Ubicacion = (string)Datos.Lector["Ubicacion"];
                    aux.ImgUbicacion = (string)Datos.Lector["ImgUbicacion"];
                    aux.estado = (bool)Datos.Lector["ESTADO"];

                    lista.Add(aux);
                }
                return lista;
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

        public List<Servicios> ListaTiposServicios()
        {
            AccesoDatos Datos = new AccesoDatos();
            List<Servicios> lista = new List<Servicios>();
            Datos.setearConsulta("select * from Servicios");


            try
            {
                Datos.ejecutarLectura();
                while (Datos.Lector.Read())
                {
                    Servicios aux = new Servicios();

                    aux.ID = Convert.ToInt32(Datos.Lector["ID"]);
                    aux.Descripcion = (string)Datos.Lector["DESCRIPCION"];


                    lista.Add(aux);
                }
                return lista;
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

       public  ServiciosRecomendadosXAdmin TraerSR(int id)
        {

            AccesoDatos Datos = new AccesoDatos();



            Datos.setearConsulta("select SR.ID,SR.IDSERVICIO,S.DESCRIPCION,SR.txt_Nombre,SR.NroContacto,SR.Horarios,SR.Sitio,SR.ImgSitio,SR.Ubicacion,SR.ImgUbicacion,SR.ESTADO from ServiciosRecomendados AS SR inner join SERVICIOS AS S ON SR.IDSERVICIO=S.ID where SR.ESTADO = 1 and SR.ID =" + id);
            Datos.ejecutarLectura();

            try
            {

                Datos.Lector.Read();
                {
                    ServiciosRecomendadosXAdmin aux = new ServiciosRecomendadosXAdmin();

                    aux.ID = Convert.ToInt32((long)Datos.Lector["ID"]);
                    aux.servicio = new Servicios();
                    aux.servicio.ID = (Int32)Datos.Lector["IDSERVICIO"];
                    aux.servicio.Descripcion = (String)Datos.Lector["DESCRIPCION"];
                    aux.NombreContacto = (string)Datos.Lector["txt_Nombre"];
                    aux.Contacto = (string)Datos.Lector["NroContacto"];
                    aux.Horario = (string)Datos.Lector["Horarios"];
                    aux.PaginaWeb = (string)Datos.Lector["Sitio"];
                    aux.ImgSitio = (string)Datos.Lector["ImgSitio"];
                    aux.Ubicacion = (string)Datos.Lector["Ubicacion"];
                    aux.ImgUbi = (string)Datos.Lector["ImgUbicacion"];
                    aux.estado = (bool)Datos.Lector["ESTADO"];

                 return aux;
                }

                

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
        public void AgregarServicio(ServiciosRecomendadosXAdmin ser)
        {
            Datos.setearSP("sp_ins_serviciorecomendado");

            Datos.setearParametro("@Servicio", ser.ServicioID);
            Datos.setearParametro("@NombreContacto", ser.NombreContacto);
            Datos.setearParametro("@Contacto", ser.Contacto);
            Datos.setearParametro("@Horario", ser.Horario);
            Datos.setearParametro("@Paginaweb", ser.PaginaWeb);
            Datos.setearParametro("@ImgSitio", ser.ImgSitio);
            Datos.setearParametro("@Ubicacion", ser.Ubicacion);
            Datos.setearParametro("@ImgUbicacion", ser.ImgUbi);

            Datos.ejectutarAccion();
            Datos.cerrarConexion();
        }
        public bool Eliminar(int id)
        {
            try
            {
                Datos.setearConsulta("UPDATE ServiciosRecomendados SET Estado = 0 where ID = @id");
                Datos.setearParametro("@id", id);
                Datos.ejecutarLectura();
                return true;
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
        public bool Modificar(Contactos contactos)
        {
            try
            {
                Datos.setearConsulta("UPDATE ServiciosRecomendados SET IDSERVICIO = @IdServicio, txt_Nombre = @Nombre,NroContacto = @Telefono,Horarios = @horarios,ImgSitio=@ImgSitio, Sitio=@Sitio, ImgUbicacion=@ImgUbicacion, Ubicacion=@Ubicacion,  Estado = 1 where id=@id");
                Datos.setearParametro("@id", contactos.id);
                Datos.setearParametro("@IdServicio", contactos.IdServicio );
                Datos.setearParametro("@Nombre", contactos.NombreContacto);
                Datos.setearParametro("@Telefono", contactos.Telefono);
                Datos.setearParametro("@horarios", contactos.Horarios);
                Datos.setearParametro("@ImgSitio", contactos.ImgSitio);
                Datos.setearParametro("@Sitio", contactos.Sitio);
                Datos.setearParametro("@ImgUbicacion", contactos.ImgUbicacion);
                Datos.setearParametro("@Ubicacion", contactos.Ubicacion);
                Datos.ejecutarLectura();
                return true;
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
    }
}
