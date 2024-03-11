<?php
if (isset($_POST['action'])&&$_POST['action']=="Registrar") 
{
	echo CtrlAnimal::Registrar();
}
if (isset($_POST['action'])&&$_POST['action']=="Actualizar") 
{
	echo CtrlAnimal::Actualizar();
}
if (isset($_POST['action'])&&$_POST['action']=="Eliminar") 
{
	echo CtrlAnimal::Eliminar();
}
if (isset($_POST['action']) && $_POST['action']=="BuscarMostrarAnimales") 
{
	echo CtrlAnimal::BuscarMostrarAnimales();
}
if (isset($_POST['action']) && $_POST['action']=="Mostrar_datos_animal") 
{
	echo CtrlAnimal::Mostrar_datos_animal();
}
if (isset($_POST['action']) && $_POST['action']=="Mostrar_datos_animal_chb") 
{
	echo CtrlAnimal::Mostrar_datos_animal_chb();
}
class CtrlAnimal
{
    static public function Registrar()
    {
        session_start();
        require_once "../modelo/MdlAnimal.php";
        $animal = array("chb"           =>$_POST['chb'],
                        "fnacimiento"   =>$_POST['fnacimiento'],
                        "nroregistro"   =>$_POST['nroregistro'],
                        "categoria"     =>$_POST['categoria'],
                        "raza"          =>$_POST['raza'],
                        "nombre"        =>$_POST['nombre'],
                        "rp"            =>$_POST['rp'],
                        "chbmadre"      =>$_POST['chbmadre'],
                        "naabpadre"     =>$_POST['naabpadre'],
                        "FincaID"       =>$_SESSION['idFinca']);
        $respuesta = MdlAnimal::CreateAnimal($animal);
        return $respuesta;
    }
    static public function Actualizar()
    {
        session_start();
        require_once "../modelo/MdlAnimal.php";
        $animal = array("idAnimal"       =>$_POST['idAnimal'],
                        "chb"           =>$_POST['chb'],
                        "fnacimiento"   =>$_POST['fnacimiento'],
                        "nroregistro"   =>$_POST['nroregistro'],
                        "categoria"     =>$_POST['categoria'],
                        "raza"          =>$_POST['raza'],
                        "nombre"        =>$_POST['nombre'],
                        "rp"            =>$_POST['rp'],
                        "chbmadre"      =>$_POST['chbmadre'],
                        "naabpadre"     =>$_POST['naabpadre'],
                        "FincaID"       =>$_SESSION['idFinca']);
        $respuesta = MdlAnimal::Actualizar($animal);
        return $respuesta;
    }
    static public function Eliminar()
    {
        session_start();
        require_once "../modelo/MdlAnimal.php";
        $animal = array("idAnimal"      =>$_POST['idAnimal']);
        $respuesta = MdlAnimal::Eliminar($animal);
        return $respuesta;
    }
    static public function BuscarMostrarAnimales()
    {
        session_start();
        require_once "../Modelo/MdlAnimal.php";
        $respuesta = MdlAnimal::BuscarMostrarAnimales($_SESSION['idFinca'],$_POST['valor']);
        return $respuesta;
    }
    static public function Mostrar_datos_animal()
    {
        require_once "../Modelo/MdlAnimal.php";
        $respuesta = MdlAnimal::Mostrar_datos_animal($_POST['idAnimal']);
        return $respuesta;
    }
    static public function Mostrar_datos_animal_chb()
    {
        require_once "../Modelo/MdlAnimal.php";
        $respuesta = MdlAnimal::Mostrar_datos_animal_chb($_POST['chb']);
        if ($respuesta != null) 
		{	
            session_start();			
			$_SESSION['activeanimal']	= true;
			$_SESSION['idAnimal'] 		= $respuesta['idAnimal'];
			$_SESSION['chb']	        = $respuesta['chb'];
			$_SESSION['fnacimiento'] 	= $respuesta['fecha_nacimiento'];
			$_SESSION['nroregistro'] 	= $respuesta['nro_registro'];
			$_SESSION['categoria'] 	    = $respuesta['categoria'];
			$_SESSION['raza'] 		    = $respuesta['raza'];
			$_SESSION['nombreanimal'] 	= $respuesta['nombre'];
            $_SESSION['rp'] 		    = $respuesta['rp'];
            $_SESSION['chbmadre'] 		= $respuesta['chbmadre'];
            $_SESSION['naabpadre'] 		= $respuesta['naabpadre'];
			return 1;
		}
		else
		{
			return 0;
		}      
    }
}