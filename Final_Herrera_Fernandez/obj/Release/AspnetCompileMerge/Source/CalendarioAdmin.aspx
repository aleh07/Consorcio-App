<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="CalendarioAdmin.aspx.cs" Inherits="Final_Herrera_Fernandez.CalendarioAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 797px;
            height: 250px;
            overflow-y: auto;
            overflow-x: hidden;
        }
    </style> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container-fluid">
        <div class="row  ">
            <div class="col-12 d-flex justify-content-center">
                   <button type="button" class="btn btn-dark my-2" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                    Crear Evento
                  </button>
                <asp:Calendar ID="CalendarioEvento" width="80%"  CssClass="table table-striped table-bordered" runat="server" BorderStyle="Outset" CaptionAlign="Top" ClientIDMode="Predictable" Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" Font-Underline="False" ForeColor="Black" Height="302px"  VisibleDate="2022-06-18"></asp:Calendar>
            </div>
            <div class="col-12 d-flex justify-content-center">
                <div class="auto-style1">
                     <asp:Label ID="LBlEvento" runat="server" ></asp:Label>
                    <asp:Panel ID="PanelEvento" runat="server" >
                      
                    <table class="table">
                    <thead >
                        <tr>
                            <th scope="col">Hora</th>
                            <th scope="col">Evento</th>
                            <th scope="col">Descripcion</th>
                        </tr>
                        
                    </thead>
                    </asp:Panel>
                    <tbody>
                          
                        <asp:Repeater ID="rep" runat="server" 
                           
                            >
                            <ItemTemplate>
                                <tr>
                                       
                                        <td><%#Eval("Horario")%></td>
                                        <td><%#Eval("evento")%></td>
                                        <td><%#Eval("Descripcion")%></td>
                                         <td><asp:Button  Text="Modificar" ID="btnModificar" CssClass="btn btn-primary" runat="server"  CommandArgument='<%#Eval("id") %>' OnClick="btnModificar_Click"     /></td> </button>
                                        <td><asp:Button runat="server" ID="btnDelete" CommandArgument='<%#Eval("id") %>' Text="Eliminar" CssClass="btn btn-danger" OnClick="btnDelete_Click" /></td>
                                    
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
                      
                 </div>
            </div>
        </div>
    </div>

             <div class="modal fade" id="staticBackdrop" data-bs-backdrop="satic" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title " id="staticBackdropLabel">Registrar Calendario</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="container">
                        <div class="row">

                            <div class="col-12">
                                 <asp:Label ID="LblFecha" runat="server" class="form-control mb-2" Text="Ingrese la fecha del evento " ForeColor="#660066"></asp:Label>     
                                <asp:TextBox ID="TxtFecha" class="form-control mb-2" type="date" runat="server"></asp:TextBox>
                                <asp:Label ID="LBlHora" runat="server" class="form-control mb-2" Text="Ingrese la Hora del evento " ForeColor="#660066"></asp:Label>  
                                <asp:TextBox ID="TxtHora" class="form-control mb-2"  type="time" runat="server" CssClass="form-control mb-2"></asp:TextBox>                               
                                <asp:TextBox ID="TxtEvento" class="form-control mb-2" type="text" placeholder="Ingrese el Evento"  runat="server"></asp:TextBox>
                                <asp:TextBox ID="TxtDescripcion" class="form-control mb-2" type="text" placeholder="Ingrese una breve descripcion si lo desea"  runat="server" TextMode="MultiLine" MaxLength="500"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <asp:Button ID="BtnAgregar" Text="Registrar" Onclick="BtnAgregar_Click" runat="server" CssClass="btn btn-primary" type="submit" />
                </div>
            </div>
        </div>
    </div>


   

</asp:Content>

