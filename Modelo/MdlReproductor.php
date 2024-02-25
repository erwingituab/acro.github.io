<?php
require_once "conexion.php";
class MdlReproductor
{
    static public function RegistrarReproductor($Reporductor)
    {
        $ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
		$query = mysqli_query($conexion,"CALL sp_create_reproductor('".$Reporductor['hba']."',
																	'".$Reporductor['apodo']."',
																	'".$Reporductor['nombre']."',
																	'".$Reporductor['rp']."',
																	'".$Reporductor['naab']."',
																	'".$Reporductor['raza']."',
																	'".$Reporductor['tiposervicio']."')");
		if ($query) {
			return 1;
		}
		else
		{
			return 0;
		}
		$ConexionBD->Cerrar($conexion);
    }
	static public function ActualizarReproductor($Reporductor)
    {
        $ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
		$query = mysqli_query($conexion,"CALL sp_update_reproductor('".$Reporductor['idReproductor']."',
																	'".$Reporductor['hba']."',
																	'".$Reporductor['apodo']."',
																	'".$Reporductor['nombre']."',
																	'".$Reporductor['rp']."',
																	'".$Reporductor['naab']."',
																	'".$Reporductor['raza']."',
																	'".$Reporductor['tiposervicio']."')");
		if ($query) {
			return 1;
		}
		else
		{
			return 0;
		}
		$ConexionBD->Cerrar($conexion);
    }
	static public function EliminarReproductor($Reproductor)
	{
		$ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
		$query = mysqli_query($conexion,"CALL sp_delete_reproductor('".$Reproductor['idReproductor']."')");
		if ($query) {
			return 1;
		}
		else
		{
			return 0;
		}
		$ConexionBD->Cerrar($conexion);
	}
	static public function mostrar_datos_reproductor($idreproductor)
	{
		$ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
		$query = mysqli_query($conexion,"CALL sp_mostrar_reproductor('".$idreproductor."')");
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
	static public function Buscar_mostrar_reproductor($valor)
	{
		$ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
		$query = mysqli_query($conexion,"CALL sp_mostrar_buscar_reproductor('".$valor."')");
		$resultado = mysqli_num_rows($query);
		$tabla_reproductor = '';
		$raza = "";
		$tiposervicio = "";
		if($resultado > 0)
		{
			while($row = $query->fetch_assoc())
			{
				$tabla_reproductor.='
				<tr>
					<td>'.$row["nombre"].'</td>
					<td>'.$row["apodo"].'</td>
					<td>'.$row["hba"].'</td>
					<td>'.$row["rp"].'</td>
					<td>'.$row["naab"].'</td>';
					if($row['raza']==1){$raza="Cruzas";}
					if($row['raza']==2){$raza="Holstein";}
					if($row['raza']==3){$raza="Jersey";}
					if($row['raza']==4){$raza="Otras";}
					$tabla_reproductor.='
					<td>'.$raza.'</td>';
					if($row['tiposervicio']==1){$tiposervicio='Inseminacion Artificial';}
					if($row['tiposervicio']==2){$tiposervicio='Monta Natural';}
					if($row['tiposervicio']==3){$tiposervicio='Transferencia de Embrion';}
					$tabla_reproductor.='
					<td>'.$tiposervicio.'</td>
					<td class="opciones">					
                        <a href="#" class="update" id="'.$row['idReproductor'].'" title="editar"><img src="iconos/editar.svg" alt="Editar"></a>					
                        <a href="#" class="delete" id="'.$row['idReproductor'].'" title="eliminar"><img src="iconos/eliminar-usr.svg" alt="Denegar"></a>                        						
                    </td>
				</tr>
				';
			}
		}
		else
		{
			$tabla_reproductor .="<tr><td colspan='9'>No hay Datos... :(</td></tr>";
		}
		return $tabla_reproductor;
	}
}