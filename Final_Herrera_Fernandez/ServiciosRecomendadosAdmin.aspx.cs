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
    public partial class ServiciosRecomendadosAdmin : System.Web.UI.Page
    {
        public List<Contactos> ListaRegistros { get; set; }
        public List<Servicios> ListatiposServicios { get; set; }
        ServiciosRecomendadosNegocio negocio = new ServiciosRecomendadosNegocio();
        
        protected void Page_Load(object sender, EventArgs e)
        {
           
           
        

            Usuario cuenta = (Usuario)Session["cuenta"];
            try
            {
                
                if (cuenta.Tipo == 1)
                 {
                    if (!IsPostBack)
                    {
                        if (Session["listaBuscados"] == null)
                        {
                            //Cargo los tipos de srvicios
                            ListatiposServicios = negocio.ListaTiposServicios();
                            DDLServicio.DataSource = ListatiposServicios;
                            DDLServicio.DataBind();
                            // Cargo Los registros de servicios recomendados   
                            ListaRegistros = negocio.ServiciosRecomendados();
                            Session.Add("ListarSevicios", ListaRegistros);
                            rep.DataSource = ListaRegistros;
                            rep.DataBind();
                        }
                        


                    }
                 else
                 {

                    ListaRegistros = (List<Contactos>)Session["listaBuscados"];
                    Session["listaBuscados"] = null;
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

        protected void btnDelete_Command(object sender, CommandEventArgs e)
        {
            var argument = ((Button)sender).CommandArgument;
            int ID = Convert.ToInt32(argument);
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "confirm", "if(!confirm('esta seguro que quiere eliminar?')){window.location='ABMUsuarios.aspx'};", true  );
            //  NO LOGRE QUE ACTUALICE LA ELIMINANCION Y A SU VEZ K MANDE UNA ALERTA O K CONSULTE SI DESEA ELIMINAR ANTES DE HACERLO
            negocio.Eliminar(ID);
            
            //Response.Write("<script>alert('Usuario Eliminado');</script>");
            Page.Response.Redirect(Page.Request.Url.ToString(), false);
            Context.ApplicationInstance.CompleteRequest();
        }

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            ServiciosRecomendadosXAdmin sr = new ServiciosRecomendadosXAdmin();
          
            sr.ServicioID =Convert.ToInt32(DDLServicio.SelectedValue);
            sr.NombreContacto = TxtNombre.Text;
            sr.Contacto = TxtNombre.Text;
            sr.Horario = TxtHorarios.Text;
            
            if (CBWeb.Checked)
            {
                //mando por default como pagina "error.aspx" y y cambio al icono "X
                sr.PaginaWeb = "Error.aspx";
                sr.ImgSitio = "https://cdn-icons-png.flaticon.com/512/1828/1828527.png";

            }
            else
            {
                sr.PaginaWeb = TxtSitioweb.Text; ;
                sr.ImgSitio = "https://cdn-icons-png.flaticon.com/512/1006/1006669.png";
            }

            if (CBUbi.Checked)
            {
                //mando por default como ubicacion "error.aspx" y y cambio al icono "X
                sr.Ubicacion = "Error.aspx";
                sr.ImgUbi = "https://cdn-icons-png.flaticon.com/512/1828/1828527.png";

            }
            else 
            {
                sr.Ubicacion = TxtUbicacion.Text;
                sr.ImgUbi = "https://cdn-icons-png.flaticon.com/512/1483/1483336.png";
            }

            negocio.AgregarServicio(sr);
            Response.Write("<script>alert('Servicio Creado');</script>");
            Page.Response.Redirect(Page.Request.Url.ToString(), false);
            Context.ApplicationInstance.CompleteRequest();
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            //INTENTE USAR MODAL PERO NO LOGRO QUE DESDE EL BOTON MODIFICAR ME ABRA EL MODAL DEL FORMULARIO ,SI LO CARGA Y SI ACCEDO DEL BOTON "CREAR USUARIO" LO MUESTRA PRECARGADO ,CREO QUE SE DEBE A K NO USO BUTTON SINO ASPBUTTON 
            
            var argument = ((Button)sender).CommandArgument;
            int ID = Convert.ToInt32(argument);
            Session.Add("SRModif", ID);
            Response.Redirect("ModificarServicio.aspx");
        }
    }
}