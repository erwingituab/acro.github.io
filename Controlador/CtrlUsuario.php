<?php

if (isset($_POST['usuario'])&&isset($_POST['clave'])) 
{
	echo CtrlUsuario::Ingreso();
}
if (isset($_POST['action'])&& $_POST['action']=="Buscar_mostrar_usuario") 
{
	echo CtrlUsuario::Buscar_mostrar_usuario($_POST['valor']);
}
if (isset($_POST['action'])&& $_POST['action']=="Mostrar_datos_usuario") 
{
	echo CtrlUsuario::Mostrar_datos_usuario($_POST['idusuario']);
}
if (isset($_POST['action'])&&$_POST['action']=="Mostrar") 
{
	echo CtrlUsuario::Registrar();
}
if (isset($_POST['action'])&&$_POST['action']=="Registrar") 
{
	echo CtrlUsuario::Registrar();
}
if (isset($_POST['action'])&&$_POST['action']=="Actualizar") 
{
	echo CtrlUsuario::Actualizar();
}

class CtrlUsuario
{	
    static public function MostrarLogin()
	{
		include "vista/paginas/login.php";
	}
    static public function Ingreso()
	{
		require_once "../modelo/MdlUsuario.php";
		$table 		= "usuario";
		$usuario 	= array("usuario"=>$_POST['usuario'],
							"clave"=>md5($_POST['clave']));
		$respuesta = MdlUsuario::Ingreso($table,$usuario);
		if ($respuesta != null) 
		{			
			if ($respuesta['status']==1)
			{
				session_start();
				$_SESSION['active']	= true;
				$_SESSION['idUsuario'] = $respuesta['idUsuario'];
				$_SESSION['ci'] = $respuesta['ci'];
				$_SESSION['nombre'] = $respuesta['nombre'];
				$_SESSION['apellidos'] = $respuesta['apellidos'];
				$_SESSION['usuario'] = $respuesta['usuario'];
				$_SESSION['rol'] = $respuesta['rol'];
				return 1;
			}
			else 
			{
				return 2;
			}
		}
		else
		{
			return 0;
		}
	}
	
	static public function Registrar()
	{
		require_once"../modelo/MdlUsuario.php";		
		$usuario = array("ci"		=>$_POST['ci'],
						"nombre"	=>$_POST['nombre'],
						"apellidos"	=>$_POST['apellidos'],
						"telefono"	=>$_POST["telefono"],
						"direccion"	=>$_POST["direccion"],
						"usuario"	=>$_POST["usuario"],
						"clave"		=>md5($_POST['clave']),
						"rol"		=>$_POST['rol']);
		$respuesta = MdlUsuario::Registrar($usuario);
		return $respuesta;
	}
	static public function Actualizar()
	{
		require_once"../modelo/MdlUsuario.php";	
		$usuario = array("idusuario"=>$_POST['idusuario'],
						"ci"		=>$_POST['ci'],
						"nombre"	=>$_POST['nombre'],
						"apellidos"	=>$_POST['apellidos'],
						"telefono"	=>$_POST["telefono"],
						"direccion"	=>$_POST["direccion"],
						"usuario"	=>$_POST["usuario"],
						"clave"		=>md5($_POST['clave']),
						"rol"=>$_POST['rol']);
		$respuesta = MdlUsuario::Actualizar($usuario);
		return $respuesta;
	}
	public static function Mostrar_datos_usuario($idusuario)
	{	
		require_once "../modelo/MdlUsuario.php";			
		$respuesta = MdlUsuario::Mostrar_datos_usuario($idusuario);
		return $respuesta;
	}
	public static function Buscar_mostrar_usuario($valor)
	{
		require_once "../modelo/MdlUsuario.php";
		$respuesta = MdlUsuario::Buscar_mostrar_usuario($valor);
		return $respuesta;
	}
}