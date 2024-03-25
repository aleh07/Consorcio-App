<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Final_Herrera_Fernandez.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <title>Tu consorcio</title>
    <link rel="stylesheet" type="text/css" href="index.css" />
</head>
<body class="BodyLogin">
    <div class="container-fluid">
        <div class="row">

            <div class="col-12 d-flex justify-content-center ">

                <svg xmlns="http://www.w3.org/2000/svg" width="300" height="300" fill="currentColor" class="bi bi-building mt-3" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M14.763.075A.5.5 0 0 1 15 .5v15a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5V14h-1v1.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V10a.5.5 0 0 1 .342-.474L6 7.64V4.5a.5.5 0 0 1 .276-.447l8-4a.5.5 0 0 1 .487.022zM6 8.694 1 10.36V15h5V8.694zM7 15h2v-1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5V15h2V1.309l-7 3.5V15z" />
                    <path d="M2 11h1v1H2v-1zm2 0h1v1H4v-1zm-2 2h1v1H2v-1zm2 0h1v1H4v-1zm4-4h1v1H8V9zm2 0h1v1h-1V9zm-2 2h1v1H8v-1zm2 0h1v1h-1v-1zm2-2h1v1h-1V9zm0 2h1v1h-1v-1zM8 7h1v1H8V7zm2 0h1v1h-1V7zm2 0h1v1h-1V7zM8 5h1v1H8V5zm2 0h1v1h-1V5zm2 0h1v1h-1V5zm0-2h1v1h-1V3z" />
                </svg>
            </div>
            <div class="col-12 mb-3 d-flex align-self-start justify-content-center">
                <h1>ConsorciApp</h1>
            </div>
            <div class="col-12  d-flex align-self-start justify-content-center">
                <form id="form1" runat="server">
                    <div class="col-12 text-center">
                        <asp:TextBox ID="TxtEmail" CssClass="form-control mt-3" type="Mail" placeholder="Ingrese su Email" aria-label="Ingrese Nombre" runat="server"></asp:TextBox>
                        <asp:TextBox ID="TxtPass" CssClass="form-control mt-3" type="password"  MaxLength="8" placeholder=" Contraseña" aria-label="Ingrese Nombre" runat="server"></asp:TextBox>
                        <asp:Button ID="BtnAgregar" Text="ENTRAR" OnClick="BtnAgregar_Click" runat="server" CssClass="btn btn-dark mt-3" />
                       
                    </div>
                </form>
            </div>

        </div>
    </div>

</body>
</html>
