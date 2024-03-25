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
    public partial class Mensajes : System.Web.UI.Page
    {
        public List<Usuario> usuarios { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario cuenta = (Usuario)Session["cuenta"];
            try
            {

                if (cuenta.Tipo == 1)
                {
                            ListItem item = new ListItem();
                    UsuarioNegocio negocio = new UsuarioNegocio();

                    usuarios = negocio.ListaUsuarios();
                     
                    foreach (Usuario user in usuarios)
                    {
                        item.Text = user.Nombre + " " + user.Apellido;
                        item.Value = user.Email;
                        selectMail.Items.Add(item);
                        item = new ListItem();
                    }
                    item.Text = "Todos";
                    item.Value = "";
                    selectMail.Items.Add(item);
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

        protected void Button_Click(object sender, EventArgs e)
        {
              logic ObjetoLogic = new logic();

            if (selectMail.SelectedValue != "")
            {

                string msg = ObjetoLogic.EnviarCorreo(selectMail.SelectedValue, asunto.Text.Trim(), mensaje.InnerText.Trim());
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('" + msg + "');window.location='Mensajes.aspx';", true);

            }
            else
            {
                string msgMasivo = "";
                foreach (var item in usuarios)
                {
                    msgMasivo = ObjetoLogic.EnviarCorreo(item.Email, asunto.Text.Trim(), mensaje.Value);
                }

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "alert('" + msgMasivo + "');window.location='Mensajes.aspx';", true);
            }
        }
    }
}