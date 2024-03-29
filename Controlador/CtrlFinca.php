<?php
if (isset($_POST['action'])&&$_POST['action']=="IngresoaFinca") 
{
	echo CtrlFinca::IngresoaFinca();
}
if (isset($_POST['action'])&&$_POST['action']=="Registrar") 
{
	echo CtrlFinca::CreateFinca();
}
if (isset($_POST['action'])&&$_POST['action']=="Actualizar") 
{
	echo CtrlFinca::UpdateFinca();
}
if (isset($_POST['action'])&&$_POST['action']=="Eliminar") 
{
	echo CtrlFinca::DeleteFinca();
}
if (isset($_POST['action'])&&$_POST['action']=="Buscar_mostrar_finca") 
{
	echo CtrlFinca::Buscar_mostrar_finca($_POST['valor']);
}
if (isset($_POST['action'])&&$_POST['action']=="Buscar_mostrar_finca_habilitada") 
{
	echo CtrlFinca::Buscar_mostrar_finca_habilitada($_POST['valor']);
}
if (isset($_POST['action'])&& $_POST['action']=="Mostrar_datos_finca") 
{
	echo CtrlFinca::Mostrar_datos_finca($_POST['idfinca']);
}
class CtrlFinca
{
	static public function IngresoaFinca()
	{
		require_once "../modelo/MdlFinca.php";		
		$Finca 	= array("idFinca"=>$_POST['idFinca']);
		$respuesta = MdlFinca::MdlIngresoaFinca($Finca);
		if ($respuesta != null) 
		{		
			session_start();
			$_SESSION['activefinca']	= true;
			$_SESSION['idFinca'] 		= $respuesta['idFinca'];
			$_SESSION['nroPropietario']	= $respuesta['nroPropietario'];
			$_SESSION['propietario'] 	= $respuesta['propietario'];
			$_SESSION['nroTacho'] 		= $respuesta['nroTacho'];
			$_SESSION['nombre_finca'] 	= $respuesta['nombre_finca'];
			$_SESSION['telefono'] 		= $respuesta['telefono'];
			$_SESSION['direccion'] 		= $respuesta['direccion'];
			return 1;
		}
		else
		{
			return 0;
		}
	}
    static public function CreateFinca()
    {
		session_start();
        require_once "../Modelo/MdlFinca.php";
        $finca = array( "_nro_propietario"  =>$_POST['nropropietario'],
						"_propietario"	    =>$_POST['propietario'],
						"_nro_tacho"	    =>$_POST['nrofinca'],
						"_nombre_finca"	    =>$_POST["finca"],
						"_telefono"	        =>$_POST["telefono"],
						"_direccion"	    =>$_POST["direccion"],
						"_idusuario" 		=>$_SESSION['idUsuario']);
		$respuesta = MdlFinca::MdlCreateFinca($finca);
		return $respuesta;
    }
	public static function UpdateFinca()
	{
		session_start();
        require_once "../Modelo/MdlFinca.php";
        $finca = array( "_idFinca"  		=>$_POST['idfinca'],
						"_nro_propietario"  =>$_POST['nropropietario'],
						"_propietario"	    =>$_POST['propietario'],
						"_nro_tacho"	    =>$_POST['nrofinca'],
						"_nombre_finca"	    =>$_POST["finca"],
						"_telefono"	        =>$_POST["telefono"],
						"_direccion"	    =>$_POST["direccion"],
						"_idusuario" 		=>$_SESSION['idUsuario']);
		$respuesta = MdlFinca::MdlUpdateFinca($finca);
		return $respuesta;
	}
	public static function DeleteFinca()
	{
		session_start();
        require_once "../Modelo/MdlFinca.php";
        $finca = array( "_idFinca"=>$_POST['idfinca']);
		$respuesta = MdlFinca::MdlEliminarFinca($finca);
		return $respuesta;
	}
	public static function Buscar_mostrar_finca($valor)
	{
		require_once "../modelo/MdlFinca.php";
		$respuesta = MdlFinca::Buscar_mostrar_finca($valor);
		return $respuesta;
	}
	public static function Buscar_mostrar_finca_habilitada($valor)
	{
		require_once "../modelo/MdlFinca.php";
		$respuesta = MdlFinca::Buscar_mostrar_finca_habilitada($valor);
		return $respuesta;
	}
	public static function Mostrar_datos_finca($idfinca)
	{	
		require_once "../modelo/MdlFinca.php";			
		$respuesta = MdlFinca::Mostrar_datos_finca($idfinca);
		return $respuesta;
	}
}