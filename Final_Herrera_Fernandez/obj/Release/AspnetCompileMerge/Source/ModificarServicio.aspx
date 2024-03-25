<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ModificarServicio.aspx.cs" Inherits="Final_Herrera_Fernandez.ModificarServicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container text-center">
            <div class="row">
                <div class="col-12 mb-5">
                    <h2>Actualizar Servicios Recomendados</h2>
                </div>
                
                <div class="col-12">
                    <asp:Label ID="LblServicios" runat="server" Text="Tipo de Servicio" ></asp:Label>
                    <asp:DropDownList ID="DDLServicio" class="form-control mb-2" runat="server"  AutoPostBack="false" DataTextField="Descripcion" DataValueField="Id"  ></asp:DropDownList>     
                    <asp:Label ID="LblNombre" runat="server" Text="Nombre Contacto" ></asp:Label>
                    <asp:TextBox runat="server" ID="TxtNombre" class="form-control mb-2" type="text"></asp:TextBox>
                    <asp:Label ID="LblContacto" runat="server" Text="Contacto" ></asp:Label>
                    <asp:TextBox ID="TxtTelefono" class="form-control mb-2" type="text"  runat="server"></asp:TextBox>
                    <asp:Label ID="LblHorarios" runat="server" Text="Horarios  de atencion" ></asp:Label>
                    <asp:TextBox ID="TxtHorarios" class="form-control mb-2" type="text"  runat="server"></asp:TextBox>
                      <asp:Label ID="LblSitioWeb" runat="server" Text="Sitio web" ></asp:Label>
                   <div class="col-12">
                    <asp:TextBox ID="TxtSitioweb" class="form-control mb-2" placeholder="Pegue el vinculo (solo si tiene web) "   runat="server" ></asp:TextBox>   
                   </div> 
                     <div class="col-4">
                     <div class="form-check form-switch">
                     <input class="form-check-input" type="checkbox" role="switch" id="CBWeb" runat="server"    />
                     <label class="form-check-label" for="flexSwitchCheckDefault">Sin Web</label>  
                   </div>
                    </div>                
                    <asp:Label ID="LblUbicacion" runat="server" Text="Ubicacion Geografica" ></asp:Label>
                     <div class="col-12">
                        <asp:TextBox ID="TxtUbicacion" class="form-control mb-2" placeholder="Pegue el vinculo (solo si tiene ubi)"   runat="server" ></asp:TextBox>      
                       </div>
                     <div class="col-4">
                        <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" role="switch" id="CBUbi" runat="server" />
                        <label class="form-check-label" for="flexSwitchCheckDefault">Sin Ubi</label>
                         </div>
                    </div>
                    <br />
                <div class="col-12">
                     <asp:Button runat="server" CssClass="btn btn-danger" Text="Volver" ID="btvVolver" OnClick="btvVolver_Click" />
                
                     <asp:Button runat="server"  CssClass="btn btn-primary" Text="Modificar" ID="BtnModificar" OnClick="BtnModificar_Click" />
                </div>
            </div>
        </div>
         </div>       
</asp:Content>
