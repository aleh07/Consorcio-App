 using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using System.Data.SqlClient;
namespace Negocio
{
    public class ExpensasNegocios
    {


        AccesoDatos Datos = new AccesoDatos();
        public List<Archivos> ListarRegistros()
        {

            List<Archivos> lista = new List<Archivos>();

            Datos.setearConsulta("select tbl.id ,D.Descripcion, U.NOMBRE,U.APELLIDO,tbl.mes,tbl.content from tbl_contents tbl inner join Usuarios U on  U.ID = tbl.idvecino inner join Departamento D on D.ID = U.IDDepto ");
            Datos.ejecutarLectura();
            try
            {
                while (Datos.Lector.Read())
                {
                    Archivos aux = new Archivos();
                    aux.ID = (Int32)Datos.Lector["ID"];
                    aux.Mes = (string)Datos.Lector["mes"];
                    aux.Imagen = (byte[])Datos.Lector["content"];
                    aux.visorImagen = "VistadeArhivosPDF.aspx?id=" + aux.ID;    

                    aux.vecino = new Usuario();
                    aux.vecino.Nombre = (string)Datos.Lector["NOMBRE"];
                    aux.vecino.Apellido = (string)Datos.Lector["APELLIDO"];

                    aux.Depto = new Departamento();
                    aux.Depto.Descripcion = (string)Datos.Lector["DESCRIPCION"];

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

      

        public List<Archivos> ListarRegistrosXVecino(long id)
        {

            List<Archivos> lista = new List<Archivos>();

            Datos.setearConsulta("select tbl.id ,tbl.idvecino,D.Descripcion, U.NOMBRE,U.APELLIDO,tbl.mes,tbl.content from tbl_contents tbl inner join Usuarios U on  U.ID = tbl.idvecino inner join Departamento D on D.ID = U.IDDepto where tbl.idvecino="+id);
            Datos.setearParametro("@id", Convert.ToInt32(id));
            Datos.ejecutarLectura();
            try
            {
                while (Datos.Lector.Read())
                {
                    Archivos aux = new Archivos();
                    aux.ID = (Int32)Datos.Lector["ID"];
                    aux.Mes = (string)Datos.Lector["mes"];
                    aux.Imagen = (byte[])Datos.Lector["content"];
                    aux.visorImagen = "VistadeArhivosPDF.aspx?id=" + aux.ID;

                    aux.vecino = new Usuario();
                    aux.vecino.Nombre = (string)Datos.Lector["NOMBRE"];
                    aux.vecino.Apellido = (string)Datos.Lector["APELLIDO"];

                    aux.Depto = new Departamento();
                    aux.Depto.Descripcion = (string)Datos.Lector["DESCRIPCION"];
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

        public bool subirArchivo(byte[] fuImagen, int IdVecino, string mes)
        {


            try
            {
                Datos.setearConsulta("Insert Into tbl_contents(content,IDVECINO,mes) Values (@content,@idVecino,@mes)");

                Datos.setearParametro("@content", fuImagen);
                Datos.setearParametro("@idVecino", IdVecino);
                Datos.setearParametro("@mes", mes);

                Datos.ejectutarAccion();

                return true;
            }
            catch (Exception)
            {
                return false;

            }
            finally
            {
                Datos.cerrarConexion();


            }
        }
    }
}
