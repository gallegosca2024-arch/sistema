<?php 
require_once("../../config/Conexion.php");
session_start();

if(isset($_SESSION["id_usuario"])){
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <?php require_once("../html/MainHead.php"); ?>
  <title>Homes</title>
</head>

<body>

  <!-- Menú Lateral izquierda -->
  <?php require_once("../html/MainMenu.php"); ?>
  <!-- Menú de la cabecera -->
  <?php require_once("../html/MainHeader.php"); ?>

  <!-- ########## INICIO: PANEL DEL MENÚ ########## -->
  <div class="br-mainpanel">
    <div class="br-pageheader pd-y-15 pd-l-20">
      <nav class="breadcrumb pd-0 mg-0 tx-12">
        <a class="breadcrumb-item" href="index.html">INICIO</a>
      </nav>
    </div>
    <div class="pd-x-20 pd-sm-x-30 pd-t-20 pd-sm-t-30">
      <h4 class="tx-gray-800 mg-b-5">INICIO</h4>
      <p class="mg-b-0">Pantalla de inicio</p>
    </div>

    <div class="br-pagebody">

    </div>

  </div>
  <!-- ########## FIN: PANEL DEL MENÚ ########## -->

  <?php require_once("../html/MainJs.php"); ?>


</body>

</html>

<?php 
    } else {
        header("Location:".Conectar::ruta()."view/404/");
        exit();
    }
?>