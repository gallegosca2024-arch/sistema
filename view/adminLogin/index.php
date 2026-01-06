<?php
/* Llamado Cadena de Conexión */
require_once("../../config/Conexion.php");
if (isset($_POST["Enviar"]) and $_POST["Enviar"] == "si") {
    require_once("../../models/Usuario.php");
    /* Llamado al Modelo Usuario */
    $usuario = new Usuario();
    $usuario->login();
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>SISTEMA DE CERTIFICACIÓN :: login</title>

    <link href="../../public/lib/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="../../public/lib/Ionicons/css/ionicons.css" rel="stylesheet">

    <link rel="stylesheet" href="../../public/css/bracket.css">

</head>

<body>

    <div class="d-flex align-items-center justify-content-center bg-br-primary ht-100v">
        <form action="" method="post">
            <div class="login-wrapper wd-300 wd-xs-350 pd-25 pd-xs-40 bg-white rounded shadow-base">
                <div class="signin-logo tx-center">
                    <img src="../../public/img/LOGO_KAIROSIG.png" alt="Logo KAIROSIG">
                </div>
                <div class="tx-center mg-b-60">Sistema de Certificación</div>
<!-- Capturando mensajes de error -->
                <?php
                    if (isset($_GET["m"])) {
                        switch ($_GET["m"]) {
                            case "1";
                            ?>
                            <div class="alert alert-warning" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <strong class="d-block d-sm-inline-block-force">Error!</strong> Datos incorrectos, por favor verifique e intente nuevamente.
                            </div>
                            <?php
                            break;

                            case "2";
                            ?>
                            <div class="alert alert-warning" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <strong class="d-block d-sm-inline-block-force">Error!</strong> Campos vacios, por favor ingrese sus datos.
                            </div>
                            <?php
                            break;
                        }
                    }
                ?>
                <div class="form-group">
                    <input type="text" id="correo" name="correo" class="form-control" placeholder="Ingresa tu Correo Electrónico">
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <input type="password" id="password-field pass" name="pass" class="form-control" placeholder="Ingresa tu contraseña">
                        <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                    </div>
                    <a href="" class="tx-info tx-12 d-block mg-t-10">¿Olvidaste tu contraseña?</a>
                </div>
                <input type="hidden" name="Enviar" class="form-control" value="si">
                <button type="submit" class="btn btn-info btn-block">Iniciar Sesión</button>
            </div>
        </form>
    </div>
    <script src="../../public/lib/jquery/jquery.js"></script>
    <script src="../../public/lib/popper.js/popper.js"></script>
    <script src="../../public/lib/bootstrap/bootstrap.js"></script>

    <script src="../../public/js/login-script.js"></script>

</body>

</html>