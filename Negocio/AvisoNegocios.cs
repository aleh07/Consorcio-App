using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
namespace Negocio
{
    public class AvisoNegocios
    {

        public List<avisos> Listar()
        {
            List<avisos> lista = new List<avisos>();
            AccesoDatos Datos = new AccesoDatos();

            Datos.setearConsulta("select * from avisos");
            Datos.ejecutarLectura();

            try
            {
                while (Datos.Lector.Read())
                {
                    avisos aux = new avisos();
                   
                    aux.DESCRIPCION = (string)Datos.Lector["Descripcion"];
                    //buscar la manera para que sean solo 2 digitos luego de la coma
                    aux.FECHA = (DateTime)Datos.Lector["Fecha"];
                    aux.IMAGENURL = (string)Datos.Lector["ImagenUrl"]; 
                    aux.idcategoria = (int)Datos.Lector["IdCategoria"];
                    aux.Estado = (bool)Datos.Lector["Estado"];
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

    }
}
