<?php
if (isset($_POST['action'])&&$_POST['action']=="Registrar") 
{
	echo CtrlReproductor::RegistrarReproductor();
}
if (isset($_POST['action'])&&$_POST['action']=="Actualizar") 
{
	echo CtrlReproductor::ActualizarReproductor();
}
if (isset($_POST['action'])&&$_POST['action']=="Eliminar") 
{
	echo CtrlReproductor::EliminarReproductor();
}
if (isset($_POST['action'])&& $_POST['action']=="Buscar_mostrar_reproductor") 
{
	echo CtrlReproductor::Buscar_mostrar_reproductor($_POST['valor']);
}
if (isset($_POST['action'])&& $_POST['action']=="mostrar_datos_reproductor") 
{
	echo CtrlReproductor::mostrar_datos_reproductor($_POST['idReproductor']);
}
class CtrlReproductor
{    
    static public function RegistrarReproductor()
    {
        require_once "../Modelo/MdlReproductor.php";
        $reproductor = array("hba"=>$_POST['hba'],
                            "apodo"=>$_POST['apodo'],
                            "nombre"=>$_POST['nombre'],
                            "rp"=>$_POST["rp"],
                            "naab"=>$_POST["naab"],
                            "raza"=>$_POST["raza"],
                            "tiposervicio"=>$_POST['tiposervicio']);
		$respuesta = MdlReproductor::RegistrarReproductor($reproductor);
		return $respuesta;
    }
    static public function ActualizarReproductor()
    {
        require_once "../Modelo/MdlReproductor.php";
        $reproductor = array(
                            "idReproductor"=>$_POST['idReproductor'],
                            "hba"=>$_POST['hba'],
                            "apodo"=>$_POST['apodo'],
                            "nombre"=>$_POST['nombre'],
                            "rp"=>$_POST["rp"],
                            "naab"=>$_POST["naab"],
                            "raza"=>$_POST["raza"],
                            "tiposervicio"=>$_POST['tiposervicio']
        );
        $respuesta = MdlReproductor::ActualizarReproductor($reproductor);
        return $respuesta;
    }
    static public function EliminarReproductor()
    {
        require_once "../Modelo/MdlReproductor.php";
        $reproductor = array("idReproductor"=>$_POST['idReproductor']);
        $respuesta = MdlReproductor::EliminarReproductor($reproductor);
        return $respuesta;
    }
    public static function Buscar_mostrar_reproductor($valor)
	{
		require_once "../modelo/MdlReproductor.php";
		$respuesta = MdlReproductor::Buscar_mostrar_reproductor($valor);
		return $respuesta;
	}
    public static function mostrar_datos_reproductor($idReproductor)
    {
        require_once "../Modelo/MdlReproductor.php";
        $respuesta =MdlReproductor::mostrar_datos_reproductor($idReproductor);
        return $respuesta;
    }
}