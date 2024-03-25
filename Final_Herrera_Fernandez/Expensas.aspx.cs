using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;
namespace Final_Herrera_Fernandez
{
    public partial class Expensas : System.Web.UI.Page
    {
        public List<Archivos> listaGrilla { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {


            ExpensasNegocios negocio = new ExpensasNegocios();
            Usuario cuenta = (Usuario)Session["cuenta"];
            Usuario usuario = new Usuario();
            try
            {

               
                    if (cuenta.Tipo == 2)
                    {
                         //if (!IsPostBack)
                //{

                //    listaGrilla = negocio.ListarRegistros();
                //    Session.Add("ListarComponentes", listaGrilla);
                //}


                listaGrilla = negocio.ListarRegistrosXVecino(usuario.ID);
                Session.Add("ListarComponentes", listaGrilla);
                    } 
                    else
                    {
                        // ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('No tiene permiso');window.location ='Login.aspx';", true);
                        Response.Redirect("Error.aspx");
                    }




                }
              
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());

                Response.Redirect("Error.aspx");
            }
        }
        
    }
}