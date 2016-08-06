<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="UAMShop.user.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Crear cuenta en UAM SHOP</title>
</head>
<body>
    <form id="form1" runat="server">
        <style>
            .test input,
            .test select
            {
                width: 100%;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                box-shadow: inset 0 1px 3px #ddd;
                border-radius: 4px;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                padding-left: 20px;
                padding-right: 20px;
                padding-top: 12px;
                padding-bottom: 12px;
            }

            .centrar
            {
                position: absolute;
                /*nos posicionamos en el centro del navegador*/
                top: 30%;
                left: 50%;
                /*determinamos una anchura*/
                width: 400px;
                /*indicamos que el margen izquierdo, es la mitad de la anchura*/
                margin-left: -240px;
                /*/*determinamos una altura*/
                height: 480px;
                /*indicamos que el margen superior, es la mitad de la altura*/
                margin-top: -150px;
                border: 1px solid #cccccc;
                padding: 5px;
                color: #666666;
            }

            label
            {
                font-size: 12px;
                font-weight: bold;
            }
        </style>
        <div class="test centrar" style="border-radius: 5px; padding: 40px;">
            <h3><i class="fa fa-user"></i> Crear mi cuenta </h3>
            <label for="nombre">Su nombre:</label>
            <input type="email" id="nombre" required="" value="" placeholder="Ingresa tu nombre aqui" maxlength="50" />

            <label for="correo">Correo:</label>
            <input type="email" id="correo" style="text-transform: lowercase" required="" value="" placeholder="usuario@dominio.com" maxlength="50" />

            <label for="contrasena">Contraseña:</label>
            <input type="password" id="contrasena" required="" placeholder="Define tu contraseña ( Máximo 10 caracteres )" maxlength="10" />
            <label for="repetircontrasena">Repetir contraseña:</label>
            <input type="password" id="repetircontrasena" required="" placeholder="Vuelve a escribir tu contraseña " maxlength="10" />
            <div>
                <br />
                <span style="font-size: 12px">Al crear una cuenta , usted está de acuerdo a las condiciones de uso y privacidad de  UAM SHOP.</span>
                <br />
                <br />
                <label>Ya tienes una cuenta? <a href="#">Inicia sesión</a></label>
                <br />
                <br />
                <a id="btnRelizarCompra" class="btn blue wide" role="button">Crear cuenta UAM SHOP <i class="fa fa-chevron-right"></i></a>
            </div>
        </div>
    </form>
    <link rel="stylesheet" type="text/css" href="../css/gridStyle.css">
    <link rel="stylesheet" type="text/css" href="../css/navBarStyle.css">
    <link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/generalStyle.css">
    <link rel="stylesheet" type="text/css" href="../css/alert.css" />
</body>
</html>
