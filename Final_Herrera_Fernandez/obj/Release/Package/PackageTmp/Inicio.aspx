<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Final_Herrera_Fernandez.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         
     <div class="container-carrusel" >
    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
        
  <div class="carousel-inner">
    <div class="carousel-item active">
    <img src="https://www.investa.com.au/getattachment/Properties/567-Collins-Street/567collins-header2.jpg.aspx"  alt="img3">
    </div>
    <div class="carousel-item">
    <img src="https://www.investa.com.au/getattachment/Properties/567-Collins-Street/567collins-header2.jpg.aspx" alt="img2">
    </div>
    <div class="carousel-item">
    <img src="https://www.investa.com.au/getattachment/Properties/567-Collins-Street/567collins-header2.jpg.aspx"  alt="img3">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</div>


      <br />  

   

    <!--textbox de buscar-->
 
        <div class="d-flex justify-content-center">
            <asp:TextBox ID="TxtBuscar" runat="server" ></asp:TextBox>
            <asp:Button ID="BtnBuscar" style="margin-left:5px;" class="btn btn-outline-dark" OnClick="BtnBuscar_Click" runat="server" Text="Buscar" />
        </div>
        <!--cards -->
        <div class="row row-cols-1 row-cols-md-4 g-4 "style="padding:2rem">

            <%foreach (Dominio.avisos item in listaComponentes)
                {%>
                     <% if (item.Estado==true)//colocar los componentes en true
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
        </div>

</asp:Content>
