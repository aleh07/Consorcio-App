<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Expensas.aspx.cs" Inherits="Final_Herrera_Fernandez.Expensas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="container ">
        <div class="row">
            <div class="col-12 d-flex justify-content-center">
                <h1>Expensas</h1>
            </div>
            <div class="col-12 ">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">Mes</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>

                        <%foreach (var item in listaGrilla)
                            {%>
                        <tr>    
                            <td><%=item.Mes%></td>
                            <td><a class="btn btn-primary" target="_blank" href="<%=item.visorImagen %>">Ver</a></td>
                        </tr>
                        <%} %>
                    </tbody>
                </table>
            </div>
        </div>

        <div>
            <div class="row">
                <asp:Label CssClass="ok" ID="lblMensajeOk" runat="server"></asp:Label>
                <asp:Label CssClass="error" ID="lblMensajeError" runat="server"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
