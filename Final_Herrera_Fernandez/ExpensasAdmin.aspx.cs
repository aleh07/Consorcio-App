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
    public partial class ExpensasAdmin : System.Web.UI.Page
    {

        public List<Usuario> usuarios { get; set; }
        public List<Archivos> listaGrilla { get; set; }

        ExpensasNegocios expensasNegocios = new ExpensasNegocios();

        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario cuenta = (Usuario)Session["cuenta"];

            try
            {

                if (cuenta.Tipo == 1)
                {

                    if (!IsPostBack)
                    {

                        ListItem item = new ListItem();
                        UsuarioNegocio negocio = new UsuarioNegocio();
                   
                        usuarios = negocio.ListaUsuarios();
                        foreach (Usuario user in usuarios)
                        {
                            item.Text = user.Nombre + " " + user.Apellido;
                            item.Value = user.ID.ToString();
                            selectVecino.Items.Add(item);
                     
                            item = new ListItem();

                        }

                        listaGrilla = expensasNegocios.ListarRegistros();
                        Session.Add("ListarComponentes", listaGrilla);
                    }
                    else
                    {


                        long Id = Convert.ToInt32(selectVecino.SelectedValue);
                        listaGrilla = expensasNegocios.ListarRegistrosXVecino(Id);
                        Session.Add("ListarComponentes", listaGrilla);

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
          
           
        

        protected void btnSubir_Click(object sender, EventArgs e)
        {
            if (expensasNegocios.subirArchivo(fuImagen.FileBytes, int.Parse(selectVecino.SelectedValue), SelectMes.SelectedValue.ToString()))
            {
                // Mostrar la imagen de la base de datos SQL Server en la página
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('Archivo cargado correctamente.');window.location='ExpensasAdmin.aspx';", true);

            }
            else
            {
                lblMensajeOk.Text = "";
                lblMensajeError.Text = "error al subir imagen";
            }
        }

        
    }
}