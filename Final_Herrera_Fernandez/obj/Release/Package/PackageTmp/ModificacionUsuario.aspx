<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master"   AutoEventWireup="true" CodeBehind="ModificacionUsuario.aspx.cs" Inherits="Final_Herrera_Fernandez.ModificacionUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container text-center" aria-multiline="True">
            <div class="row">
                <div class="col-12 mb-5">
                    <h2>Formulario Registro</h2>
                </div>

                <div class="col-12">
                                <asp:Label ID="LblDpto" runat="server" Text="Departamento" ></asp:Label>
                                <asp:DropDownList ID="DDLDepto" class="form-control mb-2" runat="server" placeholder="Ingrese Su ID de Departamento" AutoPostBack="False" DataTextField="descripcion" DataValueField="id"  ></asp:DropDownList>     
                                <asp:Label ID="LblUsuario" runat="server"  Text="Usuario"></asp:Label>
                                <asp:TextBox ID="TxtNombreUsuario" class="form-control mb-2"   type="text" placeholder="Ingrese Nombre de usuario" aria-label="Ingrese Nombre de Usuario" runat="server"></asp:TextBox>
                                <asp:Label ID="LblPass" runat="server" Text="Contraseña( se convertiran a mayusculas!!)" ></asp:Label>
                                <asp:TextBox ID="TxtPass" class="form-control mb-2" MaxLength="8" type="password" placeholder="Ingrese su Contraseña 8 caracteres max" runat="server" CssClass="form-control mb-2"></asp:TextBox>                               
                                <asp:Label ID="LblApellido" runat="server" Text="Apellido"></asp:Label>
                                <asp:TextBox ID="TxtApellido" class="form-control mb-2" type="text" placeholder=" Apellido" aria-label="Ingrese Nombre" runat="server"></asp:TextBox>
                                <asp:Label ID="LblNombre" runat="server"  Text="Nombre"></asp:Label>
                                <asp:TextBox ID="TxtNombre" class="form-control mb-2" type="text" placeholder="Ingrese su Nombre" aria-label="Ingrese Nombre" runat="server"></asp:TextBox>
                                <asp:Label ID="LblEmail" runat="server"  Text="Email ( se convertiran a mayusculas!!)"></asp:Label>
                                <asp:TextBox ID="TxtEmail" class="form-control mb-2" type="email" placeholder="Ingrese su Email" aria-label="Ingrese Nombre" runat="server"></asp:TextBox>
                                
                                <asp:Label ID="LblFechnac" runat="server"  Text="Fecha Nacimiento"></asp:Label>
                                <asp:TextBox ID="FechaNac" runat="server" Type="Date" class="form-control"></asp:TextBox>
                            </div>
                            <div class="col-6">
                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="RadioAdmin" runat="server">
                                <label class="form-control mb-2" for="flexRadioDefault1" id="LblAdmin" runat="server">
                                    Administrador
                                </label>
                            </div>
                            <div class="col-6">
                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="RadioVecino" runat="server" checked />
                                <label class="form-control mb-2" for="flexRadioDefault2" id="LblVecino" runat="server">
                                    Vecino
                                </label>
                            </div>
                        </div>
                   
               
                    <asp:Button ID="BtnAgregar" Text="Modificar" OnClick="BtnAgregar_Click" runat="server" CssClass="btn btn-primary" type="submit" />
           </div>

</asp:Content>
