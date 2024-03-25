<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Mensajes.aspx.cs" Inherits="Final_Herrera_Fernandez.Mensajes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
        <div class="row">
            <div class="col-12">
                <h1 style="text-align: center">Avisos por Mail</h1>
            </div>
            <div class="col-12">
                <label>Para:</label>
                <asp:DropDownList runat="server" CssClass="form-select my-3" ID="selectMail"></asp:DropDownList>
                <asp:TextBox ID="asunto" runat="server" type="text" class="form-control my-3" PlaceHolder="Asunto"></asp:TextBox>
                <textarea id="mensaje" runat="server" class="form-control my-3 " type="text" placeholder="Ingresa tu mensaje" cols="20" rows="4"></textarea>
            </div>
            <div class="col-12 d-flex justify-content-center ">
                <asp:Button ID="Button" runat="server" CssClass="btn btn-success display-6 p-4 my-3" Text="Enviar Correo" OnClick="Button_Click"/>
            </div>
        </div>
    </div>
</asp:Content>
