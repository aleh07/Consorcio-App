<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ExpensasAdmin.aspx.cs" Inherits="Final_Herrera_Fernandez.ExpensasAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container ">
        <div class="row">
            
            <div class="col-12  d-flex justify-content-center">
                <h1>Expensas</h1>
            </div>
            <div class="col-12 d-flex justify-content-center">
                <asp:DropDownList ID="selectVecino" CssClass="form-select my-3" runat="server"   ></asp:DropDownList>
                 <asp:Button CssClass="btn btn-primary mx-2" ID="BtnFiltrar"  runat="server" Text="Filtrar Expensas por vecino " />
            </div>
                
            
            <div class="col-12 d-flex justify-content-center">
                <asp:DropDownList ID="SelectMes" CssClass="form-select my-3" runat="server">
                    <asp:ListItem Value="Enero">Enero</asp:ListItem>
                    <asp:ListItem Value="Febrero">Febrero</asp:ListItem>
                    <asp:ListItem Value="Marzo">Marzo</asp:ListItem>
                    <asp:ListItem Value="Abril">Abril</asp:ListItem>
                    <asp:ListItem Value="Mayo">Mayo</asp:ListItem>
                    <asp:ListItem Value="Junio">Junio</asp:ListItem>
                    <asp:ListItem Value="Julio">Julio</asp:ListItem>
                    <asp:ListItem Value="Agosto">Agosto</asp:ListItem>
                    <asp:ListItem Value="Septiembre">Septiembre</asp:ListItem>
                    <asp:ListItem Value="Octubre">Octubre</asp:ListItem>
                    <asp:ListItem Value="Noviembre">Noviembre</asp:ListItem>
                    <asp:ListItem Value="Diciembre">Diciembre</asp:ListItem>
                </asp:DropDownList>
            </div>
          </div>
         
            <div class="col-12 d-flex justify-content-center">
                <asp:FileUpload ID="fuImagen" class="form-control" CssClass="mb-4" runat="server" />
            </div>
            <div class="col-12  d-flex justify-content-center">
                <button type="button" id="BtnCargadas"  class="btn btn-primary  mx-2" data-bs-toggle="modal" data-bs-target="#exampleModal"   >
                   Expensas Cargadas
                </button>
                <asp:Button CssClass="btn btn-primary mx-2" ID="btnSubir" OnClick="btnSubir_Click" OnClientClick="return ValidarFormulario();" runat="server" Text="Subir Archivo" />
            </div>
        </div>
        <div>
            <div class="row">
                <asp:Label CssClass="ok" ID="lblMensajeOk" runat="server"></asp:Label>
                <asp:Label CssClass="error" ID="lblMensajeError" runat="server"></asp:Label>
            </div>
            <div class="row">
                <br />
            </div>


            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Expensas Cargadas</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">Depto</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Apellido</th>
                            <th scope="col">Mes</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>

                        <%foreach (var item in listaGrilla)
                            {%>
                        <tr>
                             <td><%= item.Depto.Descripcion %></td>
                            <td><%= item.vecino.Nombre %></td>
                            <td><%= item.vecino.Apellido %></td>
                            <td><%=item.Mes%></td>
                            <td><a class="btn btn-primary" target="_blank" href="<%=item.visorImagen %>">Ver</a></td>
                            
                        </tr>
                        <%} %>
                    </tbody>
                </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
      
        </div>
    </div>
</asp:Content>
