using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;
namespace Final_Herrera_Fernandez
{
    public partial class Inicio : System.Web.UI.Page
    {
        public List<avisos> listaComponentes { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
           AvisoNegocios negocio = new AvisoNegocios();
            Usuario cuenta= (Usuario)Session["cuenta"];
            try

            {
                if (cuenta.Tipo==2)
                {
                    if (Session["listabuscados"] == null)
                    {
                        listaComponentes = negocio.Listar();
                        Session.Add("ListarComponentes", listaComponentes);
                    }
                    else
                    {
                        listaComponentes = (List<avisos>)Session["listabuscados"];
                        Session["listabuscados"] = null;
                    }
                }
                else {
                   // ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('No tiene permiso');window.location ='Login.aspx';", true);
                    Response.Redirect("Error.aspx");
                    }
                
                
                
               
            }
            catch (Exception)
            {

                throw;
            }

        }



        protected void BtnBuscar_Click(object sender, EventArgs e)
        {
            List<avisos> ListaBuscados = new List<avisos>();
            if (Session["listabuscados"] == null)
            {
                Session.Add("listabuscados", ListaBuscados);
            }
            ListaBuscados = (List<avisos>)Session["ListarComponentes"];
            //Session["listabuscados"] = ListaBuscados.FindAll(c => c.DESCRIPCION.ToUpper.Contains(TxtBuscar.Text.ToUpper()));
            Session["ListarComponentes"] = Session["listabuscados"];
            Response.Redirect("Inicio.aspx");

        }
    }
}