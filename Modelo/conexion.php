<?php 
/**
 * ConexionBD acro
 */
class ConexionBD
{
	private $Servidor;
	private $Usuario;
	private $Pasword;
	private $BasedeDatos;
	function Abrir($Servidor="localhost",$Usuario="root",$Pasword="*10780686Eaf",$BasedeDatos="proyecto")
	{
		$Conexion = @mysqli_connect($Servidor,$Usuario,$Pasword,$BasedeDatos)or die("no se pudo establecer una conexion con la base de datos acro ...Consulte a Soporte técnico.");
		return $Conexion;
	}
	function Cerrar($Conexion)
	{
		$cerrar = mysqli_close($Conexion);
		return $cerrar;
	}
}