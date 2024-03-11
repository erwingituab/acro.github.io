<?php 
session_start();
if ($_SESSION['active']==true) 
{
	$saludo     = "Bienvenido";
	$idusuario  = $_SESSION['idUsuario'];
	$ci         = $_SESSION['ci'];
	$nombre     = $_SESSION['nombre'];	
	$usuario    = $_SESSION['usuario'];
	$rol        = $_SESSION['rol'];
    $rolnombre  = '';
    if($rol==1)
    {
        $rolnombre = "Administrador";
    }
    if($rol==2)
    {
        $rolnombre = "Veterinario";
    }
    if($rol==3)
    {
    $rolnombre = "Productor";
    }
}
if ($_SESSION['activefinca']==true) 
{
	$saludo     = "Bienvenido";
	$idusuario  = $_SESSION['idFinca'];
    $finca      = $_SESSION['nombre_finca'];
    $propietario= $_SESSION['propietario'];	
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
    <link rel="stylesheet" href="./librerias/bootstrap/css/bootstrap.min.css">    
    <link rel="stylesheet" href="css/index.css">   
    <link rel="stylesheet" href="css/animales.css">
    <title>acrhobol</title>
</head>
<body>
<header class="header">
    <div class="logo">        
        <p><?php echo "Granja: ". $finca;?></p>
        <p><?php echo "Propietario: ". $propietario;?></p>
    </div>
    <nav>    
    <ul class="nav-links">      
        <li>      
            <a href="#"><?php echo $rolnombre;?>: <?php echo $nombre;?></a>
        </li>      
    </ul>
    </nav>
</header>  
<div class="body-acro">
<?php
if($rol==1)
{
    echo'

    <div class="nav">
    <ul class="list">
    <li class="list__item">      
        <div class="list__button">
        <img src="iconos/home.svg" class="list_img">
        <a href="salir" class="nav__link">Inicio</a>
        </div>
    </li>
    <li class="list__item">      
        <div class="list__button">
        <img src="iconos/dashboard.svg" class="list_img">
        <a href="dashboard" class="nav__link">Dashboard</a>
        </div>
    </li>
    <li class="list__item list__item--click">
        <div class="list__button list__button--click">
        <img src="iconos/table.svg" class="list_img">
        <a href="#" class="nav__link">Animales</a>
        <img src="iconos/arrow.svg" class="list__arrow">
        </div>
        <ul class="list__show">
            <li class="list__inside">
            <a href="animal" class="nav__link nav__link--inside"><img src="iconos/plus.svg" class="list_img" > Animal</a>
            </li>
            <li class="list__inside">
            <a href="vaquillonas" class="nav__link nav__link--inside"><img src="iconos/plus.svg" class="list_img" > Vaquillonas</a>
            </li>

            <li class="list__inside">
            <a href="crias" class="nav__link nav__link--inside"><img src="iconos/plus.svg" class="list_img" > Crias</a>
            </li>
        </ul>
    </li>
    </ul>
</div>

'; 
}
if($rol==2)
{
    echo'
    
    <div class="nav">
        <ul class="list">
        <li class="list__item">      
            <div class="list__button">
            <img src="iconos/home.svg" class="list_img">
            <a href="salir" class="nav__link">Inicio</a>
            </div>
        </li>
        <li class="list__item">      
            <div class="list__button">
            <img src="iconos/home.svg" class="list_img">
            <a href="dashboard" class="nav__link">Dashboard</a>
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
                <a href="finca" class="nav__link nav__link--inside"><img src="iconos/plus.svg" class="list_img" >Finca</a>
                </li>
                <li class="list__inside">
                <a href="fincahabilitada" class="nav__link nav__link--inside"><img src="iconos/print.svg" class="list_img" >Fincas</a>
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
    
    ';
    }
    if($rol==3)
    {
    echo'
    
    <div class="nav">
        <ul class="list">
        <li class="list__item">      
            <div class="list__button">
                <img src="iconos/home.svg" class="list_img">
            <   a href="salir" class="nav__link">Inicio</a>
            </div>
        </li> 
        <li class="list__item">      
            <div class="list__button">
            <img src="iconos/home.svg" class="list_img">
            <a href="dashboard" class="nav__link">Dashboard</a>
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
                <a href="finca" class="nav__link nav__link--inside"><img src="iconos/plus.svg" class="list_img" >Finca</a>
                </li>
                <li class="list__inside">
                    <a href="fincahabilitada" class="nav__link nav__link--inside"><img src="iconos/file.svg" class="list_img" >Fincas</a>
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
        
        ';
    }
?>
<div class="main">
    <?php
        if(isset($_GET['pagina'])){
            if($_GET['pagina']=='salir'||$_GET['pagina']=='dashboard'||$_GET['pagina']=='animal'||$_GET['pagina']=='fichaanimal'){
                include"".$_GET['pagina'].".php";
            }
            else{
                include "error404.php";
            }
        }
        else{
            include "dashboard.php";
        }
    ?>
</div>
</div>
<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>   -->
<script src="./librerias/jquery/jquery.js"></script>
<script src="./librerias/bootstrap/js/bootstrap.min.js"></script>
<script src="./librerias/sweetAlert2/js/sweetalert2.all.min.js"></script>
<script src="./librerias/sweetAlert2/js/sweetalert2.all.min.js"></script>
<script src="js/index.js"></script>
</body>
</html>