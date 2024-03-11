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
		$tipo_evento='';
		if($resultado >0 )
		{
			while($row = $query->fetch_assoc())
			{
				$tabla_evento.='
				<tr>
						<td>'.$row['clave'].'</td>
						<td>'.$row['descripcion'].'</td>';
						if($row['tipoevento']==1){$tipo_evento="REPRODUCTIVO";}
						if($row['tipoevento']==2){$tipo_evento="PREÑEZ";}
						if($row['tipoevento']==3){$tipo_evento="SECADO";}
						if($row['tipoevento']==4){$tipo_evento="SERVICIO";}
						if($row['tipoevento']==5){$tipo_evento="VACIA";}
						if($row['tipoevento']==6){$tipo_evento="ENF. REPRODUCTIVA";}
						if($row['tipoevento']==7){$tipo_evento="ENF. SANITARIA";}
						if($row['tipoevento']==8){$tipo_evento="ENF. DIGESTIVA";}
						if($row['tipoevento']==9){$tipo_evento="ESTADO CORPORAL";}
						if($row['tipoevento']==10){$tipo_evento="BAJA - OTRAS";}
						if($row['tipoevento']==11){$tipo_evento="BAJA - MUERTE";}
						if($row['tipoevento']==12){$tipo_evento="OTRAS";}
						$tabla_evento.='
						<td>'.$tipo_evento.'</td>
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