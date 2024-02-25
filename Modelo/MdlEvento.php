<?php
require_once "conexion.php";
class MdlEvento
{
    static public function RegistrarEvento($evento)
    {
        $ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
		$query = mysqli_query($conexion,"CALL sp_create_evento('".$evento['clave']."',
																'".$evento['descripcion']."',
																'".$evento['tipoevento']."')");
		if ($query) {
			return 1;
		}
		else
		{
			return 0;
		}
		$ConexionBD->Cerrar($conexion);
    }
	static public function ActualizarEvento($evento)
    {
        $ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
		$query = mysqli_query($conexion,"CALL sp_update_evento( '".$evento['idEvento']."',
																'".$evento['clave']."',
																'".$evento['descripcion']."',
																'".$evento['tipoevento']."')");
		if ($query) {
			return 1;
		}
		else
		{
			return 0;
		}
		$ConexionBD->Cerrar($conexion);
    }
	static public function EliminarEvento($evento)
    {
        $ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
		$query = mysqli_query($conexion,"CALL sp_delete_evento( '".$evento['idEvento']."')");
		if ($query) {
			return 1;
		}
		else
		{
			return 0;
		}
		$ConexionBD->Cerrar($conexion);
    }
	public static function Mostrar_datos_evento($idEvento)
	{
		$ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
		$query = mysqli_query($conexion,"CALL sp_mostrar_datos_evento('".$idEvento."')");
		$resultado = mysqli_num_rows($query);
		$data = "";
		if($resultado >0)
		{
			$data = mysqli_fetch_assoc($query);
		}
		else
		{
			$data = 0;
		}
		return json_encode($data,JSON_UNESCAPED_UNICODE);
	}
	static public function Buscar_mostrar_evento($valor)
	{
		$ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
		$query = mysqli_query($conexion,"CALL sp_buscar_mostrar_evento('".$valor."')");
		$resultado = mysqli_num_rows($query);
		$tabla_evento = '';
		if($resultado >0 )
		{
			while($row = $query->fetch_assoc())
			{
				$tabla_evento.='
				<tr>
						<td>'.$row['clave'].'</td>
						<td>'.$row['descripcion'].'</td>
						<td>'.$row['tipoevento'].'</td>
						<td class="opciones">					
							<a href="#" class="update"data-target="#registrar" data-toggle="modal" id="'.$row['idEvento'].'" title="editar"><img src="iconos/editar.svg" alt="Editar"></a>					
							<a href="#" class="delete" id="'.$row['idEvento'].'" title="eliminar"><img src="iconos/x.svg" alt="Denegar"></a>                        						
						</td>
					</tr>	
				';
			}
		}
		else
		{
			$tabla_evento .="<tr><td colspan='4'>No hay Datos... :(</td></tr>";
		}
		return $tabla_evento;
	}
}