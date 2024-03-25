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
    public partial class FondoComunAdmin : System.Web.UI.Page
    {
        public List<Proyectos> ListaProyectos { get; set; }
        ProyectosNegocio negocio = new ProyectosNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        Usuario cuenta = (Usuario)Session["cuenta"];
            try
            {

                if (cuenta.Tipo == 1)
                {
                    ListaProyectos = negocio.ListarProyectosAprobados();
                    ListaAprobados.DataSource = ListaProyectos;
                    ListaAprobados.DataBind();
                   
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

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            Proyectos proyecto = new Proyectos();

            proyecto.Nombre = txtNombre.Text;
            proyecto.Descripcion = txtDescripcion.Text;
            proyecto.Monto = decimal.Parse(txtMonto.Text);
            proyecto.Tipo.ID = int.Parse(txtIdTipo.Text);
            negocio.AgregarProyecto(proyecto);
        }
    }
}