<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ServiciosRecomendados.aspx.cs" Inherits="Final_Herrera_Fernandez.ServiciosRecomendados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">

            <div class="col-12 ">
                <h2 class="mb-5">Servicios Recomendados por la administracion</h2>
            </div>

            <div class="col-12">
                <asp:Button class="btn btn-primary" BorderStyle="Inset" ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />

                <asp:TextBox Width="170px" Height="35px" MaxLength="200" ID="txtBuscar" runat="server" TextMode="Search" CausesValidation="true"></asp:TextBox>
            </div>
            <div class="col-12">
                <asp:GridView ID="Lista" CssClass="table table-primary" runat="server"></asp:GridView>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Servicio</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Telefono</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%foreach (var item in ListaRegistros)
                            {%>
                                <tr>
                                    <td><%=item.NombreContacto %></td>
                                    <td><%= item.Servicio %></td>
                                    <td><%=item.Telefono %></td>
                                </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
