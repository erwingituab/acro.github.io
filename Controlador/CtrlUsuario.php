<?php
if (isset($_POST['usuario'])&&isset($_POST['clave'])) 
{
	echo CtrlUsuario::Ingreso();
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
		$table = "usuario";
		$usuario = array("ci"=>$_POST['ci'],
						"nombre"=>$_POST['nombre'],
						"apellidos"=>$_POST['apellidos'],
						"telefono"=>$_POST["telefono"],
						"direccion"=>$_POST["direccion"],
						"usuario"=>$_POST["usuario"],
						"clave"=>md5($_POST['clave']),
						"rol"=>$_POST['rol']);
		$respuesta = MdlUsuario::Registrar($table , $usuario);
		return $respuesta;
	}
	static public function Editar()
	{
		require_once"../modelo/MdlUsuario.php";
		$table = "usuario";
		$usuario = array("idusuario"=>$_POST['idusuario'],
						"ci"=>$_POST['ci'],
						"nombre"=>$_POST['nombre'],
						"apellidos"=>$_POST['apellidos'],
						"telefono"=>$_POST["telefono"],
						"direccion"=>$_POST["direccion"],
						"usuario"=>$_POST["usuario"],
						"clave"=>md5($_POST['clave']),
						"rol"=>$_POST['rol']);
		$respuesta = MdlUsuario::Editar($table , $usuario);
		return $respuesta;
	}
}