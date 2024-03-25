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
    public partial class CalendarioAdmin : System.Web.UI.Page
    {
        public List<Calendarios> listaCalendario { get; set; }

        GrillaNegocios negocio = new GrillaNegocios();
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario cuenta = (Usuario)Session["cuenta"];

            
            try
            {
                if (cuenta.Tipo == 1)
                {
                  if (!IsPostBack)
                {
                    DateTime fechasistema = Convert.ToDateTime(DateTime.Now.Date.ToShortDateString());
                    CalendarioEvento.VisibleDate = DateTime.Today;
                    CalendarioEvento.SelectedDate = DateTime.Today;
                    listaCalendario = negocio.Listar(fechasistema);
                        if (listaCalendario.Count == 0)
                        {
                            PanelEvento.Visible = false;
                            LBlEvento.Visible = true;
                            LBlEvento.Text = "Hoy no hay eventos programados";
                            rep.DataSource = listaCalendario;
                            rep.DataBind();
                        }
                        else { 
                        
                            PanelEvento.Visible = true;
                            LBlEvento.Visible = false;
                            rep.DataSource = listaCalendario;
                            rep.DataBind(); 
                           
                         }

                    }

                DateTime fechaseleccionada = Convert.ToDateTime(CalendarioEvento.SelectedDate.ToShortDateString());
                listaCalendario = negocio.Listar(fechaseleccionada);
                    if (listaCalendario.Count == 0)
                    {
                        PanelEvento.Visible = false;
                        LBlEvento.Visible = true;
                        LBlEvento.Text = "Hoy no hay eventos programados";
                        rep.DataSource =  listaCalendario ;
                        rep.DataBind();

                    }
                    else
                    {

                        PanelEvento.Visible = true;
                        LBlEvento.Visible = false;
                        rep.DataSource = listaCalendario;
                        rep.DataBind();
                       
                    }
                   
                }
                else
                {
                    // ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('No tiene permiso');window.location ='Login.aspx';", true);
                    Response.Redirect("Error.aspx");
                }



            }
              catch (Exception )
            {

                Response.Redirect("Error.aspx");

            }
            
            
         
        }

        protected void GVCalendario_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            //INTENTE USAR MODAL PERO NO LOGRO QUE DESDE EL BOTON MODIFICAR ME ABRA EL MODAL DEL FORMULARIO ,SI LO CARGA Y SI ACCEDO DEL BOTON "CREAR USUARIO" LO MUESTRA PRECARGADO ,CREO QUE SE DEBE A K NO USO BUTTON SINO ASPBUTTON 
            
            var argument = ((Button)sender).CommandArgument;
            int ID = Convert.ToInt32(argument);
            Session.Add("CalendarioModif", ID);
            Response.Redirect("ModificacionCalendario.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            var argument = ((Button)sender).CommandArgument;
            int ID = Convert.ToInt32(argument);
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "confirm", "if(!confirm('esta seguro que quiere eliminar?')){window.location='ABMUsuarios.aspx'};", true  );
            //  NO LOGRE QUE ACTUALICE LA ELIMINANCION Y A SU VEZ K MANDE UNA ALERTA O K CONSULTE SI DESEA ELIMINAR ANTES DE HACERLO
            negocio.eliminar(ID);

            // 
            Page.Response.Redirect(Page.Request.Url.ToString(), false);
            Context.ApplicationInstance.CompleteRequest();
        }

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            

            Usuario usuariologuiado = new Usuario();
            usuariologuiado = (Usuario)Session["Cuenta"];

            Calendarios calendario = new Calendarios();
            calendario.Fecha = DateTime.Parse(TxtFecha.Text);
            calendario.Horario = TxtHora.Text;
            calendario.evento= TxtEvento.Text;
            calendario.Descripcion = TxtDescripcion.Text;
            calendario.Estado = true;
               
                {
                    if (usuariologuiado == null)
                    {
                        Response.Write("<script>alert('Utd debe loguearse  y ser administrador para dar de alta');</script>");
                    }

                    else if (usuariologuiado.Tipo == 1)
                    {
                        negocio.AgregarEvento(calendario);
                        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "confirm", "if(!confirm('esta seguro que quiere eliminar?')){window.location='ABMUsuarios.aspx'};", true  )
                        //  NO LOGRE QUE DE ALTA Y A SU VEZ K MANDE UNA ALERTA O K CONSULTE ANTES DE HACERLO
                        Response.Write("<script>alert('Evento Agregado');</script>");
                        Page.Response.Redirect(Page.Request.Url.ToString(), false);
                        Context.ApplicationInstance.CompleteRequest();
                    }

                }

            }

        }
    
}