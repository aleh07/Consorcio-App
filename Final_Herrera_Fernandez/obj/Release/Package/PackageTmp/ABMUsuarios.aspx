<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="ABMUsuarios.aspx.cs" Inherits="Final_Herrera_Fernandez.ABMUsuarios"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-12 ">
                <button type="button" class="btn btn-dark my-2" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                    Crear Usuario
                </button>
            </div>
            <div class="col-12">
               
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Nombre</th>
                            <th scope="col">Apellido</th>
                            <th scope="col">Usuario</th>
                            <th scope="col">Email</th>
                            <th scope="col">Depto</th>
                            <th scope="col">Tipo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rep" runat="server">
                            <ItemTemplate>
                                <tr>
                                        <td><%#Eval("Nombre") %></td>
                                        <td><%#Eval("Apellido")%></td>
                                        <td><%#Eval("NombreUsuario")%></td>
                                        <td><%#Eval("Email")%></td>
                                        <td><%#Eval("Departamento.Descripcion")%></td> 
                                         <td><%#Eval("Tipo") %></td>
                                        <td><asp:Button  Text="Modificar" ID="btnModificar" CssClass="btn btn-primary" runat="server"  CommandArgument='<%#Eval("id") %>' OnClick="btnModificar_Click"     /></td> </button>
                                    <td><asp:Button runat="server" ID="btnDelete" CommandArgument='<%#Eval("id") %>' Text="Eliminar" CssClass="btn btn-danger" OnClick= "btnDelete_Click" /></td>
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
                    <h5 class="modal-title " id="staticBackdropLabel">Registrar Usuario</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="container">
                        <div class="row">

                            <div class="col-12">
                                <asp:Label ID="LblDpto" runat="server" class="form-control mb-2" Text="Ingrese su Depto" ForeColor="#660066"></asp:Label>
                                <asp:DropDownList ID="DDLDepto" class="form-control mb-2" runat="server"  AutoPostBack="False" DataTextField="descripcion" DataValueField="id"></asp:DropDownList>     
                                <asp:TextBox ID="TxtNombreUsuario" class="form-control mb-2" type="text" placeholder="Ingrese Nombre de usuario" aria-label="Ingrese Nombre de Usuario" runat="server"></asp:TextBox>
                                <asp:Label ID="LblPass" runat="server" class="form-control mb-2" Text=" Se convertiran a mayusculas!!" ForeColor="#660066"></asp:Label>
                                <asp:TextBox ID="TxtPass" class="form-control mb-2" MaxLength="8" type="password" placeholder="Ingrese su Contraseña 8 caracteres max" runat="server" CssClass="form-control mb-2"></asp:TextBox>                               
                                <asp:TextBox ID="TxtApellido" class="form-control mb-2" type="text" placeholder="Ingrese su Apellido" aria-label="Ingrese Nombre" runat="server"></asp:TextBox>
                                <asp:TextBox ID="TxtNombre" class="form-control mb-2" type="text" placeholder="Ingrese su Nombre" aria-label="Ingrese Nombre" runat="server"></asp:TextBox>
                                <asp:TextBox ID="TxtEmail" class="form-control mb-2" type="email" placeholder="Ingrese su Email ( se convertira a mayusculas!!)" aria-label="Ingrese Nombre" runat="server"></asp:TextBox>
                                
                                <asp:Label ID="LblNac" runat="server" class="form-control mb-2" Text="Ingrese su Fecha Nac" ForeColor="#660066"></asp:Label>
                                <asp:TextBox ID="FechaNac" runat="server" Type="Date" class="form-control" placeholder="yyyy/mm/dd" ></asp:TextBox>
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
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <asp:Button ID="BtnAgregar" Text="Registrar" OnClick="BtnAgregar_Click" runat="server" CssClass="btn btn-primary" type="submit" />
                </div>
            </div>
        </div>
    </div>


   

</asp:Content>
