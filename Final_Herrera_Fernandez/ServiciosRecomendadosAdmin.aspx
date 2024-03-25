<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="ServiciosRecomendadosAdmin.aspx.cs" Inherits="Final_Herrera_Fernandez.ServiciosRecomendadosAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
        <div class="row">
                        <div class="col-12 ">
                <button type="button" class="btn btn-dark my-2" data-bs-toggle="modal" data-bs-target="#staticBackdrop" runat="server"  >
                    Crear Servicio
                </button>
            </div>
            <div class="col-3"></div>
            <div class="col-8 ">
                <h2 class="mb-5">Servicios Recomendados por la administracion</h2>
            </div>
            <div class="col-12">
                <asp:GridView ID="Lista" CssClass="table table-primary" runat="server"></asp:GridView>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Servicio</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Contacto</th>
                            <th scope="col">Horarios</th>
                            <th scope="col">Site</th>
                            <th scope="col">Ubicacion</th>
                 
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rep" runat="server">
                            <ItemTemplate>
                                <tr> 
                                    <td><%#Eval("servicios.Descripcion") %></td>
                                   <td><%#Eval("NombreContacto")%></td>
                                    <td><%#Eval("Telefono")%></td>
                                    <td><%#Eval("Horarios")%></td>
                                    
                                    <td><asp:HyperLink ID="HLSitio" ImageHeight="20px" ImageWidth="20px" ImageUrl=<%#Eval("ImgSitio")%> href=<%#Eval("Sitio")%> runat ="server"></asp:HyperLink></td>
                                    <td><asp:HyperLink ID="HLUbicacion"  ImageHeight="20px" ImageWidth="20px" ImageUrl=<%#Eval("ImgUbicacion")%> href=<%#Eval("Ubicacion")%> runat="server"></asp:HyperLink></td>                                  
                                    <td> <td><asp:Button  Text="Modificar" ID="btnModificar" CssClass="btn btn-primary" runat="server"  CommandArgument='<%#Eval("id") %>' OnClick="btnModificar_Click"/></td> </button>
                                    <td><asp:Button runat="server" ID="btnDelete" CommandArgument='<%#Eval("id") %>' Text="Eliminar" CssClass="btn btn-danger" Oncommand="btnDelete_Command" /></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>

            </div>
        </div>
    </div>

  
     <div class="modal fade" id="staticBackdrop" data-bs-backdrop="satic" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title " id="staticBackdropLabel">Servicios Recomendados</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="container">                  
                       <div class="row">
                <div class="col-12">

                    <asp:Label ID="LblServicios" runat="server" Text="Servicio" ></asp:Label>
                    <asp:DropDownList ID="DDLServicio" class="form-control mb-2" runat="server"  AutoPostBack="False" DataTextField="Descripcion" DataValueField="Id"  ></asp:DropDownList>     
                    <asp:Label ID="LblNombre" runat="server" Text="Nombre Contacto" ></asp:Label>
                    <asp:TextBox runat="server" ID="TxtNombre" class="form-control mb-2" type="text"></asp:TextBox>
                    <asp:Label ID="LblContacto" runat="server" Text="Contacto" ></asp:Label>
                    <asp:TextBox ID="TxtTelefono" class="form-control mb-2" type="text"  runat="server"></asp:TextBox>
                    <asp:Label ID="LblHorarios" runat="server" Text="Horarios  de atencion" ></asp:Label> 
                    <asp:TextBox ID="TxtHorarios" class="form-control mb-2" type="text"  runat="server"></asp:TextBox>                   
                    </div>
                    <asp:Label ID="LblSitioWeb" runat="server" Text="Sitio web" ></asp:Label>
                    <div class="col-8"> 
                    <asp:TextBox ID="TxtSitioweb" class="form-control mb-2" placeholder="Pegue el vinculo (solo si tiene web) "   runat="server" ></asp:TextBox>   
                    </div>
                      <br>
                    <div class ="col-4">
                     <div class="form-check form-switch">
                     <input class="form-check-input" type="checkbox" role="switch" id="CBWeb" runat="server"    />
                     <label class="form-check-label" for="flexSwitchCheckDefault">Sin Web</label>  
                     </div>
                    </div>
                     <br>
                     <br>
                    <asp:Label ID="LblUbicacion" runat="server" Text="Ubicacion Geografica" ></asp:Label>
                      <div class="col-8" > 
                        <asp:TextBox ID="TxtUbicacion" class="form-control mb-2" placeholder="Pegue el vinculo (solo si tiene ubi)"   runat="server" ></asp:TextBox>      
                   </div> 
                      <br />
                     <div class ="col-4">
                        <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" role="switch" id="CBUbi" runat="server" />
                        <label class="form-check-label" for="flexSwitchCheckDefault">Sin Ubi</label>
                        </div>   
                     </div>
                       
                    <br />
                    </div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <asp:Button ID="BtnAgregar" Text="Agregar" OnClick="BtnAgregar_Click" runat="server" CssClass="btn btn-primary" type="submit" />
                  
                </div>
            </div>
        </div>
       </div>

</asp:Content>
