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
    public partial class ModificarServicio : System.Web.UI.Page
    {
        ServiciosRecomendadosNegocio negocioModif = new ServiciosRecomendadosNegocio();
        ServiciosRecomendadosXAdmin SRaModificar = new ServiciosRecomendadosXAdmin ();
        public List<Servicios> ListaServicios { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            
                Usuario cuenta = (Usuario)Session["cuenta"];

                try
                {

                    if (cuenta.Tipo == 1)
                    {
                    if (!IsPostBack)
                    {
                        //Cargo en el repetidor mi lista de departamentos
                        ListaServicios = negocioModif.ListaTiposServicios();
                        DDLServicio.DataSource = ListaServicios;
                        DDLServicio.DataBind();

                        Int32 ID = (Int32)Session["SRModif"];
                        SRaModificar = negocioModif.TraerSR(ID);
                        DDLServicio.SelectedValue = Convert.ToString(SRaModificar.servicio.ID);
                        TxtNombre.Text = SRaModificar.NombreContacto;
                        TxtTelefono.Text = SRaModificar.Contacto;
                        TxtHorarios.Text = SRaModificar.Horario;
                        if (SRaModificar.PaginaWeb == "Error.aspx")
                        {
                            CBWeb.Checked = true;
                        }
                        TxtSitioweb.Text = SRaModificar.PaginaWeb;
                        if (SRaModificar.Ubicacion == "Error.aspx")
                        {
                            CBUbi.Checked = true;
                        }
                        TxtUbicacion.Text = SRaModificar.Ubicacion;
   


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


        protected void BtnModificar_Click(object sender, EventArgs e)
        {

            ServiciosRecomendadosNegocio srNeg = new ServiciosRecomendadosNegocio();
    
                Contactos srmodif = new Contactos();
                Int32 ID = (Int32)Session["SRModif"];
                srmodif.id = ID;
                srmodif.IdServicio= Convert.ToInt32(DDLServicio.SelectedValue);
                srmodif.NombreContacto = TxtNombre.Text;
                srmodif.Telefono = TxtTelefono.Text;
                srmodif.Horarios = TxtHorarios.Text;
                if (CBWeb.Checked == true)
                {
                    srmodif.ImgSitio = "https://cdn-icons-png.flaticon.com/512/1828/1828527.png";
                    srmodif.Sitio = "Error.aspx";
                }
                else
                {
                    srmodif.ImgSitio = "https://cdn-icons-png.flaticon.com/512/1006/1006669.png";
                    srmodif.Sitio = TxtSitioweb.Text;
                }
                if (CBUbi.Checked == true)
                {
                    srmodif.ImgUbicacion = "https://cdn-icons-png.flaticon.com/512/1828/1828527.png";
                    srmodif.Ubicacion = "Error.aspx";
                }
                else
                {
                    srmodif.ImgUbicacion = "https://cdn-icons-png.flaticon.com/512/1483/1483336.png";
                    srmodif.Ubicacion = TxtUbicacion.Text;
                }
            
            srNeg.Modificar(srmodif);
            Response.Write("<script>alert('Usuario Modificado');</script>");
        }

        protected void btvVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("ServiciosRecomendadosAdmin.aspx");
        }

       
    }
}