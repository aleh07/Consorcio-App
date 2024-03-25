using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
namespace Final_Herrera_Fernandez
{
    public partial class VistadeArhivosPDF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario cuenta = (Usuario)Session["cuenta"];
            try
            {
                
                    if (cuenta.Tipo == 1)
                    {
                       //Logre luego de guardarlo en una session accder a los archivos y descargarlos.
                int id = int.Parse(Request.QueryString["id"]);
                List<Archivos> listado = (List<Archivos>)Session["listarComponentes"];
                Archivos seleccionado = listado.Find(x => x.ID == id);
                byte[] imagen = (byte[])seleccionado.Imagen;
                seleccionado.visorImagen = "Vista de Archivos PDF.aspx?id=" + id;
                Response.ContentType = "image/JPEG";
                Response.ContentType = "application/pdf";
                Response.BinaryWrite(imagen);
                    }
                    else
                    {
                        // ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('No tiene permiso');window.location ='Login.aspx';", true);
                        Response.Redirect("Error.aspx");
                    }


                
            }
            catch (Exception ex)
            {
                string mensaje = ex.Message;
            }
        }
    }
}