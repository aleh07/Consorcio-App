 <%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Calendario.aspx.cs" Inherits="Final_Herrera_Fernandez.Calendario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 816px;
            height: 250px;
            overflow-y: auto;
            overflow-x: hidden;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="GvEventos">
        <div class="row">
            <div class="col-12 d-flex justify-content-center">
               <asp:Calendar ID="CalendarioEvento" Width="80%" CssClass="table table-striped table-bordered" runat="server" BorderStyle="Outset" CaptionAlign="Top" ClientIDMode="Predictable" Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" Font-Underline="False" ForeColor="Black" Height="302px" ></asp:Calendar>
            </div>
            <br />
            <br />
            <br />
            <br />
            <div class="col-12 d-flex justify-content-center">
                <div class="auto-style1">
                    <asp:GridView ID="GVCalendario" runat="server"   CssClass="table table-striped table-bordered" BackColor="White" BorderColor="#CC33FF" EmptyDataText="  NO HAY EVENTOS  HOY ,  ELIJA OTRA FECHA PARA VER LOS PROXIMOS EVENTOS!!" GridLines="Vertical" Enabled="False"  AllowPaging="True" Font-Size="Medium">
                        <AlternatingRowStyle BorderColor="#0099FF" />
                        <EditRowStyle Font-Underline="False" HorizontalAlign="Center" />
                        <EmptyDataRowStyle BackColor="Silver" BorderStyle="Solid" Font-Names="Book Antiqua" Font-Size="Larger" />
                        <HeaderStyle BackColor="Silver" HorizontalAlign="Center" />
                        <RowStyle BorderStyle="Solid" />
                        <SelectedRowStyle BorderStyle="Groove" HorizontalAlign="Center" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
