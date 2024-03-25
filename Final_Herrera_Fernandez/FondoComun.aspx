<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FondoComun.aspx.cs" Inherits="Final_Herrera_Fernandez.FondoComun" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="container-fluid text-center">
        <div class="row">
            <div class="col-12">
                <h2>Saldo</h2>
                <h2>$00</h2>

            </div>
            <div class="col-6">
                                <!-- Button trigger modal -->
                <button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                    Propuesta
                </button>
                </div>
                <!-- Modal -->
                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title " id="staticBackdropLabel">Propuestas de proyetos</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                
                                    <div class="row">
                                        <div class="col-12">
                                            <asp:TextBox ID="txtNombre" CssClass="form-control my-2" placeholder="Nombre" runat="server"></asp:TextBox>

                                            <asp:TextBox ID="txtDescripcion" CssClass="form-control my-1" placeholder="Descripcion" runat="server"></asp:TextBox>

                                            <asp:TextBox ID="txtMonto" CssClass="form-control my-1" placeholder="Monto" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                           
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <asp:Button id="btnEnviar" type="button" class="btn btn-primary"  runat="server" OnClick="btnEnviar_Click" Text="Enviar" />
                            </div>
                    </div>
                </div>

            </div>
            <div class="col-6">
               <!-- Button trigger modal -->
               <button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">
                    Proyectos
                </button>

                <!-- Modal -->
                <div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel2">Proyectos Aprobados</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <asp:GridView ID="ListaAprobados" CssClass="table" runat="server" ></asp:GridView>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
