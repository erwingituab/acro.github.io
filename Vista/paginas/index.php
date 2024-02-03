<?php 
session_start();
if ($_SESSION['active']==true) {
	$saludo = "Bienvenido";
	$idusuario = $_SESSION['idUsuario'];
	$ci = $_SESSION['ci'];
	$nombre = $_SESSION['nombre'];	
	$usuario = $_SESSION['usuario'];
	$rol = $_SESSION['rol'];
}
else
{
	session_destroy();
	header('location:../../');
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/index.css">    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>   
    <script src="libreria/jquery/jquery.js"></script>
    <script src="libreria/bootstrap/js/bootstrap.min.js"></script>
    <title>acrhobol</title>
</head>
<body>
<header class="header">
  <div class="logo">
    <img src="images/acrhobol.png" alt="">
  </div>
  <nav>
    <ul class="nav-links">      
      <li>      
        <a href="#">usuario: <?php echo $nombre;?></a>
      </li>      
    </ul>
  </nav>
</header>  
<div class="body-acro">
<div class="nav">
  <ul class="list">

    <li class="list__item">      
      <div class="list__button">
        <img src="iconos/home.svg" class="list_img">
        <a href="inicio" class="nav__link">Inicio</a>
      </div>
    </li>    
    <li class="list__item">      
      <div class="list__button">
        <img src="iconos/usuario.svg" class="list_img">
        <a href="usuario" class="nav__link">Usuario</a>
      </div>
    </li>
    <li class="list__item list__item--click">
      <div class="list__button list__button--click">
        <img src="iconos/archive.svg" class="list_img" >
        <a href="#" class="nav__link">Archivos</a>
        <img src="iconos/arrow.svg" class="list__arrow">
      </div>
      <ul class="list__show">
          <li class="list__inside">
            <a href="finca" class="nav__link nav__link--inside">Finca</a>
          </li>

          <li class="list__inside">
            <a href="animales" class="nav__link nav__link--inside">Animales</a>            
          </li>

          <li class="list__inside">
            <a href="animales" class="nav__link nav__link--inside">Ficha Clínica</a>            
          </li>
      </ul>
    </li>   

    <!--<li class="list__item">      
      <div class="list__button">
        <img src="" class="list_img">
        <a href="#" class="nav__link">Estadistica</a>
      </div>
    </li>-->

    <li class="list__item list__item--click">
      <div class="list__button list__button--click">
        <img src="iconos/report.svg" class="list_img">
        <a href="#" class="nav__link">Reportes</a>
        <img src="iconos/arrow.svg" class="list__arrow">
      </div>
      <ul class="list__show">
          <li class="list__inside">
            <a href="#" class="nav__link nav__link--inside">Listado de Animales</a>
          </li>
          
          <li class="list__inside">
            <a href="#" class="nav__link nav__link--inside">Ficha Clínica</a>
          </li>
      </ul>
    </li> 
    <li class="list__item list__item--click">
      <div class="list__button list__button--click">
        <img src="iconos/toro.svg" class="list_img" >
        <a href="#" class="nav__link">Toros</a>
        <img src="iconos/arrow.svg" class="list__arrow">
      </div>
      <ul class="list__show">
          <li class="list__inside">
            <a href="usuario" class="nav__link nav__link--inside">Tabla de Toros</a>
          </li>

          <li class="list__inside">
            <a href="finca" class="nav__link nav__link--inside">Listado de tabla de Toros</a>
          </li>          
      </ul>
    </li> 
    
    <li class="list__item">      
      <div class="list__button">
        <img src="iconos/exit.svg" class="list_img">
        <a href="salir" class="nav__link">Salir</a>
      </div>
    </li>
</ul>
</div>
<div class="main">
  <?php
      if(isset($_GET['pagina'])){
          if($_GET['pagina']=='salir'||$_GET['pagina']=='inicio'||$_GET['pagina']=='usuario'||$_GET['pagina']=='finca'||$_GET['pagina']=='animales'){
              include"".$_GET['pagina'].".php";
          }
          else{
              include "error404.php";
          }
      }
      else{
          include "inicio.php";
      }
  ?>
</div>
</div>
<script src="js/index.js"></script>
</body>
</html>