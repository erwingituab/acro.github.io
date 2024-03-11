<?php
require_once "conexion.php";
class MdlAnimal
{
    static public function CreateAnimal($animal)
    {
        $ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
        $query = mysqli_query($conexion,"CALL sp_create_animal( '".$animal["chb"]."',
                                                                '".$animal["fnacimiento"]."',
                                                                '".$animal["nroregistro"]."',
                                                                '".$animal["categoria"]."',
                                                                '".$animal["raza"]."',
                                                                '".$animal["nombre"]."',
                                                                '".$animal["rp"]."',
                                                                '".$animal["chbmadre"]."',
                                                                '".$animal["naabpadre"]."',
                                                                '".$animal['FincaID']."')");
        if($query)
        {
            return 1;
        }else{
            return 0;
        }
        $ConexionBD->Cerrar($conexion);
    }
    static public function Actualizar($animal)
    {
        $ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
        $query = mysqli_query($conexion,"CALL sp_update_animal( '".$animal["idAnimal"]."',
                                                                '".$animal["chb"]."',
                                                                '".$animal["fnacimiento"]."',
                                                                '".$animal["nroregistro"]."',
                                                                '".$animal["categoria"]."',
                                                                '".$animal["raza"]."',
                                                                '".$animal["nombre"]."',
                                                                '".$animal["rp"]."',
                                                                '".$animal["chbmadre"]."',
                                                                '".$animal["naabpadre"]."',
                                                                '".$animal['FincaID']."')");
        if($query)
        {
            return 1;
        }else{
            return 0;
        }
        $ConexionBD->Cerrar($conexion);
    }
    static public function Eliminar($animal)
    {
        $ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
		$query = mysqli_query($conexion,"CALL sp_delete_animal( '".$animal['idAnimal']."')");
		if ($query) {
			return 1;
		}
		else
		{
			return 0;
		}
		$ConexionBD->Cerrar($conexion);
    }
    static public function Mostrar_datos_animal($idAnimal)
    {
        $ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
		$query = mysqli_query($conexion,"CALL sp_buscar_mostrar_animal('".$idAnimal."')");
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
    static public function Mostrar_datos_animal_chb($chb)
    {
        $ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
		$query = mysqli_query($conexion,"CALL sp_buscar_mostrar_animal('".$chb."')");
		$respuesta 	= mysqli_num_rows($query);
		if ($respuesta > 0) 
		{
			$finca = mysqli_fetch_assoc($query);
			return $finca;
		}
		else
		{
			return null;
		}
    }
    static public function BuscarMostrarAnimales($idFinca,$valor)
    {
        $ConexionBD = new ConexionBD();
		$conexion   = $ConexionBD->Abrir();
		$query      = mysqli_query($conexion,"CALL sp_buscar_animales('".$idFinca."','".$valor."')");
		$resultado  = mysqli_num_rows($query);
		$tabla_animales = '';
        $contador = 1;
		$estado='';
		if($resultado >0 )
		{
			while($row = $query->fetch_assoc())
			{
				$tabla_animales.='
                <tr>
                    <th scope="row">'.$contador.'</th>
                    <td>'.$row['chb'].'</td>
                    <td>'.$row['rp'].'</td>';
                    if($row['estado']==0){$estado='A';}else{$estado='B';}
                    $tabla_animales.='
                    <td>'.$estado.'</td>
                    <td>'.$row['fecha_nacimiento'].'</td>
                    <td>'.$row['nombre'].'</td>
                    <td>'.$row['chbmadre'].'</td>
                    <th scope="col">'.$row['naabpadre'].'</th>
                    <td class="opciones">	
                        <button type="button" id="'.$row['idAnimal'].'" data-toggle="modal" data-target=".bd-example-modal-lg" class="update btn btn-warning btn-sm" ><img src="iconos/editar.svg" alt="Editar">Modificar</button>
                        <button type="button" id="'.$row['idAnimal'].'" class="delete btn btn-danger btn-sm"><img src="iconos/x.svg" alt="Editar">Eliminar</button>
                        <button type="button" id="'.$row['idAnimal'].'" class="evento btn btn-info btn-sm"><img src="iconos/plus.svg" alt="Evento">Evento</button>                                						
                    </td>
                </tr>  
				';
                $contador = $contador + 1;
			}
		}
		else
		{
			$tabla_animales .="<tr><td colspan='4'>No hay Datos... :(</td></tr>";
		}
		return $tabla_animales;
    }
}