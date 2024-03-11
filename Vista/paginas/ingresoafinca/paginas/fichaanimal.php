<?php
if($_SESSION['activeanimal']==true)
{
    $idAnimal   = $_SESSION['idFinca'];                
	$chb        = $_SESSION['chb'];
	$fnacimiento= $_SESSION['fnacimiento'];
	$nroregistro= $_SESSION['nroregistro'];
	$categoria  = $_SESSION['categoria'];
	$raza       = $_SESSION['raza'];
	$nombreanimal= $_SESSION['nombreanimal'];
    $rp         = $_SESSION['rp'];
    $chbmadre   = $_SESSION['chbmadre'];
    $naabpadre  = $_SESSION['naabpadre'] ;
}?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php echo $idAnimal;echo $nombreanimal;?>
</body>
</html>