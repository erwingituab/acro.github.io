<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="vista/paginas/libreria/bootstrap/css/bootstrap.min.css">
<script src="vista/paginas/libreria/jquery/jquery.js"></script>
<script src="vista/paginas/js/login.js"></script>
<title>Login</title>
</head>
<body>
    <?php
    require"Controlador/CtrlUsuario.php";
    $mostrarLogin = CtrlUsuario::MostrarLogin();
    echo $mostrarLogin;?>
</body>
</html>