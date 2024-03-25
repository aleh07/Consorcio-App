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
    public partial class WebForm1 : System.Web.UI.Page
    {
        UsuarioNegocio negocio = new UsuarioNegocio();
        

        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Add("Cuenta", null);
        }

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
           
            string user= TxtEmail.Text;
            string Pass = TxtPass.Text;
          Usuario cuenta = negocio.ValidarUsuarios(user,Pass);

            if (cuenta != null)
            {
                Session.Add("Cuenta", cuenta);

                /*1 es un administrado 2 es un vecino */
                if (cuenta.Tipo == 1)
                {

                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Hola " + cuenta.NombreUsuario + "');window.location ='InicioAdmin.aspx';", true);
                    Response.Redirect("InicioAdmin.aspx");

                }
                else if (cuenta.Tipo == 2)
                {


                    /*al ser un vecino hay k mandarlo a un inicio diferente */
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Hola " + cuenta.NombreUsuario + "');window.location ='Inicio.aspx';", true);
                    Response.Redirect("Inicio.aspx");
                }

            }
            else
            {
                //mandar un mensaje de "debe loguiarse"
                Response.Write("<script>alert('Cuenta o usuario Incorrecta ,Cree una cuenta o verifique sus datos');</script>");
                //Response.Redirect("Inicio.aspx");


             }
            

        }
    }
}