<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ModificacionCalendario.aspx.cs" Inherits="Final_Herrera_Fernandez.ModificacionCalendario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <div class="container text-center" aria-multiline="True">
            <div class="row">
                <div class="col-12 mb-5">
                    <h2>Formulario Registro</h2>
                </div>

                             <div class="col-12">
                                <asp:Label ID="LblFecha" runat="server" Text=" Fecha del evento "> </asp:Label>     
                                <asp:TextBox ID="TxtFecha" class="form-control mb-2" type="date" runat="server"></asp:TextBox>
                                <asp:Label ID="LblHora" runat="server"  Text=" Hora del evento " ></asp:Label>  
                                <asp:TextBox ID="TxtHora" class="form-control mb-2"  type="time" runat="server" CssClass="form-control mb-2"></asp:TextBox> 
                                 <asp:Label ID="LblEvento" runat="server" Text=" Evento "> </asp:Label>  
                                <asp:TextBox ID="TxtEvento" class="form-control mb-2" type="text"  runat="server"></asp:TextBox>
                                 <asp:Label ID="LblDescripcion" runat="server" Text=" Descripcion "> </asp:Label>  
                                <asp:TextBox ID="TxtDescripcion" class="form-control mb-2" type="text" runat="server" TextMode="MultiLine" MaxLength="500"></asp:TextBox>
                            </div>
                           
                        </div>
                   
               
                    <asp:Button ID="BtnAgregar" Text="Modificar" OnClick="BtnAgregar_Click" runat="server" CssClass="btn btn-primary" type="submit" />
           </div>
</asp:Content>
