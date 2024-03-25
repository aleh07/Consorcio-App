<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="InicioAdmin.aspx.cs" Inherits="Final_Herrera_Fernandez.InicioAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="carouselExampleIndicators" class="carousel slide">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://badianhotel.com/wp-content/uploads/2020/08/What-are-amenities-destacada.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://ingenieriademenu.com/wp-content/uploads/2020/12/amenities-ecologicos-para-hoteles-768x480.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://supplieseco.com/wp-content/uploads/2021/05/amenities-hoteles-480x327.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

      <br />  

   

   <%-- <!--textbox de buscar-->
 
        <div class="d-flex justify-content-center">
            <asp:TextBox ID="TxtBuscar" runat="server" ></asp:TextBox>
            <asp:Button ID="BtnBuscar1" style="margin-left:5px;" class="btn btn-outline-dark" OnClick="BtnBuscar1_Click" runat="server" Text="Buscar" />
        </div>
        <!--cards -->
        <div class="row row-cols-1 row-cols-md-4 g-4 "style="padding:2rem">

            <%foreach (Dominio.avisos item in listaComponentesAdmin)
                {%>
                     <% if (item.Estado == true)//colocar los componentes en true
                         {%>
                            <div class="Componente">
                             <img  src="<%= item.IMAGENURL %>" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title"Style="color:red ; display:flex;justify-content:center""><%= item.FECHA %></h5>
                                <h5 class="card-text "Style="color:green ; display:flex;justify-content:center" ><span">$<%= item.DESCRIPCION %></span></h5>
                               
                                </div>
                            </div>
                        <%}%>
               
            <%} %>
        </div>--%>
</asp:Content>
