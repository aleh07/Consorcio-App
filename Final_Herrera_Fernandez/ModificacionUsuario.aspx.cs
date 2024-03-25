using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;
namespace Final_Herrera_Fernandez
{
    public partial class ModificacionUsuario : System.Web.UI.Page
    {
        UsuarioNegocio negocioUser = new UsuarioNegocio();
        Usuario UsuarioaModificar = new Usuario();
        public List<Departamento> ListaDepartamentos { get; set; }
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
                        ListaDepartamentos = negocioUser.ListaDepartamentos();
                        DDLDepto.DataSource = ListaDepartamentos;
                        DDLDepto.DataBind();

                        Int32 ID = (Int32)Session["UserModif"];
                        UsuarioaModificar = negocioUser.TraerUsuario(ID);
                        DDLDepto.SelectedValue = Convert.ToString(UsuarioaModificar.IDDepto);
                        TxtNombreUsuario.Text = UsuarioaModificar.NombreUsuario;
                        TxtNombre.Text = UsuarioaModificar.Nombre;
                        TxtApellido.Text = UsuarioaModificar.Apellido;
                        TxtEmail.Text = UsuarioaModificar.Email;
                        TxtPass.Text = UsuarioaModificar.Pass;
                        //con esto seteo el textbox
                        FechaNac.Text = UsuarioaModificar.FechaNac.ToString("yyyy-MM-dd");

                        if (Convert.ToBoolean(UsuarioaModificar.Tipo == 1))
                        {

                            RadioVecino.Checked = false;
                            RadioAdmin.Checked = true;
                        }
                        else
                        {
                            RadioAdmin.Checked = false;
                            RadioVecino.Checked = true;
                        }
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

                        Usuario user = new Usuario();
                        Int32 ID = (Int32)Session["UserModif"];
                        user.ID = ID;
                        user.NombreUsuario = TxtNombreUsuario.Text;
                        user.Nombre = TxtNombre.Text;
                        user.Apellido = TxtApellido.Text;
                        user.Email = TxtEmail.Text.ToUpper();
            
                        int edad = negocioUser.ValidarEdad(DateTime.Parse(FechaNac.Text));
                        if (edad < 18)
                        {
                            Response.Write("<script>alert('El usuario debe ser mayor de edad');</script>");


                        }
                        else
                        { 

            
                            user.FechaNac = DateTime.Parse( FechaNac.Text);
             
            
                        user.IDDepto = Convert.ToInt32(DDLDepto.SelectedValue);
                    if (RadioVecino.Checked == true)
                            {
                            user.Tipo = 2;   
                             }
                        else 
                             {
                            user.Tipo = 1;
                             }
                        user.Pass = TxtPass.Text.ToUpper();



            
                        negocioUser.Modificar(user);
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "confirm", "if(!confirm('esta seguro que quiere eliminar?')){window.location='ABMUsuarios.aspx'};", true  )
                    //  NO LOGRE QUE ACTUALICE LA MODIFICACION Y A SU VEZ K MANDE UNA ALERTA O K CONSULTE ANTES DE HACERLO
                    Response.Write("<script>alert('Usuario Modificado');</script>");
                    
                    Response.Redirect("ABMUsuarios.aspx");
            

            }
            }
        }

      
    }
}