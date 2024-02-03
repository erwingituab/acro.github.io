<?php
require_once "conexion.php";
class MdlUsuario
{
    static public function Ingreso($table,$usuario)
	{
		$ConexionBD = new ConexionBD();
		$conexion 	= $ConexionBD->Abrir();
		$query 		= mysqli_query($conexion,"SELECT * FROM usuario WHERE usuario='".$usuario['usuario']."' AND clave='".$usuario['clave']."' ");
		$respuesta 	= mysqli_num_rows($query);
		if ($respuesta > 0) 
		{
			$usuario = mysqli_fetch_assoc($query);
			return $usuario;
		}
		else
		{
			return null;
		}
	}
	
	public static function Registrar($table,$usuario)
	{
		$ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
		$query = mysqli_query($conexion,"CALL sp_insertar_usuario(	'".$usuario['ci']."',
																	'".$usuario['nombre']."',
																	'".$usuario['apellidos']."',
																	'".$usuario['telefono']."',
																	'".$usuario['direccion']."',
																	'".$usuario['usuario']."',
																	'".$usuario['clave']."',
																	'".$usuario['rol']."')");
		if ($query) {
			return 1;
		}
		else
		{
			return 0;
		}
		$ConexionBD->Cerrar($conexion);
	}
	public static function Editar($table,$usuario)
	{
		$ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
		$query = mysqli_query($conexion,"CALL sp_modificar_usuario(	'".$usuario['idusuario']."',
																	'".$usuario['ci']."',
																	'".$usuario['nombre']."',
																	'".$usuario['apellidos']."',
																	'".$usuario['telefono']."',
																	'".$usuario['direccion']."',
																	'".$usuario['usuario']."',
																	'".$usuario['clave']."',
																	'".$usuario['rol']."')");
		if ($query) {
			return 1;
		}
		else
		{
			return 0;
		}
		$ConexionBD->Cerrar($conexion);
	}
	/*public static function Registrar($table,$usuario)
	{
		$ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
		$query = mysqli_query($conexion,"INSERT INTO usuario(ci,nombre,apellidos,telefono,direccion,usuario,clave,rol)
														VALUE(	'".$usuario['ci']."',
																'".$usuario['nombre']."',
																'".$usuario['apellidos']."',
																'".$usuario['telefono']."',
																'".$usuario['direccion']."',
																'".$usuario['usuario']."',
																'".$usuario['clave']."',
																'".$usuario['rol']."')");
		if ($query) {
			return 1;
		}
		else
		{
			return 0;
		}
		$ConexionBD->Cerrar($conexion);
	}
	public static function Editar($table,$usuario)
	{
		$ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
		$query = mysqli_query($conexion,"UPDATE usuario SET ci		='".$usuario['ci']."',
														nombre		='".$usuario['nombre']."',
														apellidos	='".$usuario['apellidos']."',
														telefono	='".$usuario['telefono']."',
														direccion	='".$usuario['direccion']."',
														usuario		='".$usuario['usuario']."',
														clave		='".$usuario['clave']."',
														rol			='".$usuario['rol']."',
														estatus		='".$usuario['estatus']."'");
		if ($query) {
			return 1;
		}
		else
		{
			return 0;
		}
		$ConexionBD->Cerrar($conexion);
	}*/
}