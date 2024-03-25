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
    public partial class ServiciosRecomendados : System.Web.UI.Page
    {
        public List<Contactos> ListaRegistros { get; set; }
        ServiciosRecomendadosNegocio negocio = new ServiciosRecomendadosNegocio();

        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario cuenta = (Usuario)Session["cuenta"];
            try
            { 
                if (cuenta.Tipo == 2)
            {
                ListaRegistros = negocio.ServiciosRecomendados();
            Lista.DataSource = ListaRegistros;
            Lista.DataBind();
            Session.Add("ListarSevicios", Lista);
            }
            else
            {
                // ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('No tiene permiso');window.location ='Login.aspx';", true);
                Response.Redirect("Error.aspx");
            }

            }
            catch (Exception)
            {

                throw;
            }
           

           
        }

       protected void btnBuscar_Click(object sender, EventArgs e)
        {
            List<Contactos> listaBuscados = new List<Contactos>();
            if (Session["listaBuscados"] == null)
            {
                Session.Add("listaBuscados", listaBuscados);
            }
            listaBuscados = (List<Contactos>)Session["ListarSevicios"];
            Session["listaBuscados"] = listaBuscados.FindAll(i => i.NombreContacto.ToUpper().Contains(txtBuscar.Text.ToUpper()) || i.servicios.Descripcion.ToUpper().Contains(txtBuscar.Text.ToUpper()) || i.Telefono.ToString().ToUpper().Contains(txtBuscar.Text.ToUpper()));

            Session["listaServicios"] = Session["listaBuscados"];
            Response.Redirect("ServiciosRecomendados.aspx");
        }
    }
}