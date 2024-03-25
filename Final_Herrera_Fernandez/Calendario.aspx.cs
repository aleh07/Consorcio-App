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
    public partial class Calendario : System.Web.UI.Page
    {

        public List<Calendarios> listaCalendario { get; set; }
     
        protected void Page_Load(object sender, EventArgs e)
        {
            GrillaNegocios negocio = new GrillaNegocios();
            Usuario cuenta = (Usuario)Session["cuenta"];
            try
            {

                if (cuenta.Tipo == 2)
                {
                   if (!IsPostBack)
                {
                   DateTime fechasistema = DateTime.Now.Date;
                    CalendarioEvento.VisibleDate = DateTime.Today;
                    CalendarioEvento.SelectedDate = DateTime.Today;
                    listaCalendario = negocio.Listar(fechasistema);
                    GVCalendario.DataSource = listaCalendario;
                    GVCalendario.DataBind();

                }

                DateTime fechaseleccionada = CalendarioEvento.SelectedDate;
                listaCalendario = negocio.Listar(fechaseleccionada);
                GVCalendario.DataSource = listaCalendario;
                GVCalendario.DataBind();
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
