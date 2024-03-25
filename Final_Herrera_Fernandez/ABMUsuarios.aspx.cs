using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;
using System.Windows.Input;
using System.Windows;

namespace Final_Herrera_Fernandez
{
    public partial class ABMUsuarios : System.Web.UI.Page
    {
        public List<Usuario> ListaUsuarios { get; set; }
        public List<Departamento> ListaDepartamentos { get; set; }

        UsuarioNegocio negocioUser = new UsuarioNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
  
           Usuario usuariologuiado = (Usuario)Session["Cuenta"];
            try
            {
                if (usuariologuiado.Tipo == 1)
                {
                    if (!IsPostBack) 
                    {
                        //Cargo en el repetidor mi lista de usuarios
                    ListaUsuarios = negocioUser.ListaUsuarios();
                    Session.Add("ListarSevicios", ListaUsuarios);
                    rep.DataSource = ListaUsuarios;
                    rep.DataBind();
                        //Cargo en el repetidor mi lista de departamentos
                    ListaDepartamentos = negocioUser.ListaDepartamentos();
                    DDLDepto.DataSource = ListaDepartamentos;               
                    DDLDepto.DataBind();
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
                throw ex;
            }






        }

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();

            Usuario usuariologuiado = new Usuario();
            usuariologuiado = (Usuario)Session["Cuenta"];
            
            Usuario user = new Usuario();
            user.NombreUsuario = TxtNombreUsuario.Text;
            user.Nombre = TxtNombre.Text;
            user.Apellido = TxtApellido.Text;
            //valido que el email no se encuentre en la db , 1 email x usuario
            bool ocupado = negocio.ValidarEmail(TxtEmail.Text);
            if (ocupado == true)
            {
                Response.Write("<script>alert('Ese email ya existe');</script>");
                
            }
            else {
                    user.Email =  TxtEmail.Text.ToUpper();
                    user.Pass = TxtPass.Text.ToUpper();
                    user.FechaNac = DateTime.Parse(FechaNac.Text);
                    user.IDDepto = Convert.ToInt32(DDLDepto.SelectedValue);
                    user.Estado = true;
                    if (RadioAdmin.Checked == true) { user.Tipo = 1; }
                    else { user.Tipo = 2; }
                    int edad = negocio.ValidarEdad(user.FechaNac);
                    if (edad < 18)
                    {
                        Response.Write("<script>alert('El usuario debe ser mayor de edad');</script>");


                    }
                    else
                    {
                        if (usuariologuiado == null)
                        {
                            Response.Write("<script>alert('Utd debe loguearse  y ser administrador para dar de alta');</script>");
                        }

                        else if (usuariologuiado.Tipo == 1)
                        {
                            negocio.AgregarUsuario(user);
                        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "confirm", "if(!confirm('esta seguro que quiere eliminar?')){window.location='ABMUsuarios.aspx'};", true  )
                        //  NO LOGRE QUE DE ALTA Y A SU VEZ K MANDE UNA ALERTA O K CONSULTE ANTES DE HACERLO
                        Response.Write("<script>alert('Usuario Creado');</script>");
                            Page.Response.Redirect(Page.Request.Url.ToString(), false);
                            Context.ApplicationInstance.CompleteRequest();
                        }

                    }
            
                   };

            }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            var argument = ((Button)sender).CommandArgument;
            int ID = Convert.ToInt32(argument);
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "confirm", "if(!confirm('esta seguro que quiere eliminar?')){window.location='ABMUsuarios.aspx'};", true  );
            //  NO LOGRE QUE ACTUALICE LA ELIMINANCION Y A SU VEZ K MANDE UNA ALERTA O K CONSULTE SI DESEA ELIMINAR ANTES DE HACERLO
            negocioUser.eliminar(ID);
            
            //Response.Write("<script>alert('Usuario Eliminado');</script>");
            Page.Response.Redirect(Page.Request.Url.ToString(), false);
            Context.ApplicationInstance.CompleteRequest();




        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            //INTENTE USAR MODAL PERO NO LOGRO QUE DESDE EL BOTON MODIFICAR ME ABRA EL MODAL DEL FORMULARIO ,SI LO CARGA Y SI ACCEDO DEL BOTON "CREAR USUARIO" LO MUESTRA PRECARGADO ,CREO QUE SE DEBE A K NO USO BUTTON SINO ASPBUTTON 
            
            var argument = ((Button)sender).CommandArgument;
            int ID = Convert.ToInt32(argument);
            Session.Add("UserModif", ID);
            Response.Redirect("ModificacionUsuario.aspx");
        }
    }
}