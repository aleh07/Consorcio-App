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
    public partial class ModificacionCalendario : System.Web.UI.Page
    {
        GrillaNegocios negocioCalendar = new GrillaNegocios();
        Calendarios EventoaModificar = new Calendarios();
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario cuenta = (Usuario)Session["cuenta"];

            try
            {

                if (cuenta.Tipo == 1)
                {
                    if (!IsPostBack)
                    {
                       

                        Int32 ID = (Int32)Session["CalendarioModif"];
                      EventoaModificar = negocioCalendar.TraerEvento(ID);
                       
                        TxtFecha.Text = EventoaModificar.Fecha.ToString("yyyy-MM-dd");
                        TxtHora .Text= EventoaModificar.Horario;
                        TxtEvento.Text = EventoaModificar.evento;
                        TxtDescripcion.Text = EventoaModificar.Descripcion;
                       
                      
                    }
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

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {

                Calendarios calend = new Calendarios();
                Int32 ID = (Int32)Session["CalendarioModif"];
                calend.Id = ID;
                calend.Fecha = Convert.ToDateTime(TxtFecha.Text);
                calend.Horario = TxtHora.Text;
                calend.evento = TxtEvento.Text;
                calend.Descripcion = TxtDescripcion.Text;
                negocioCalendar.Modificar(calend);
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "confirm", "if(!confirm('esta seguro que quiere eliminar?')){window.location='ABMUsuarios.aspx'};", true  )
                    //  NO LOGRE QUE ACTUALICE LA MODIFICACION Y A SU VEZ K MANDE UNA ALERTA O K CONSULTE ANTES DE HACERLO
                    Response.Write("<script>alert('Usuario Modificado');</script>");

                    Response.Redirect("CalendarioAdmin.aspx");


                }
            }
        }
    
}