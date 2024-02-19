<?php
require_once "conexion.php";
class MdlFinca
{
    public static function MdlCreateFinca($finca)
    {
        $ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
        $query = mysqli_query($conexion,"CALL sp_create_finca(  '".$finca["_nro_propietario"]."',
                                                                '".$finca["_propietario"]."',
                                                                '".$finca["_nro_tacho"]."',
                                                                '".$finca["_nombre_finca"]."',
                                                                '".$finca["_telefono"]."',
                                                                '".$finca["_direccion"]."',
                                                                '".$finca['_idusuario']."')");
        if($query)
        {
            return 1;
        }else{
            return 0;
        }
        $ConexionBD->Cerrar($conexion);
    }
    public static function MdlUpdateFinca($finca)
    {
        $ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
        $query = mysqli_query($conexion,"CALL sp_update_finca(  '".$finca["_idFinca"]."',
                                                                '".$finca["_nro_propietario"]."',
                                                                '".$finca["_propietario"]."',
                                                                '".$finca["_nro_tacho"]."',
                                                                '".$finca["_nombre_finca"]."',
                                                                '".$finca["_telefono"]."',
                                                                '".$finca["_direccion"]."',
                                                                '".$finca['_idusuario']."')");
        if($query)
        {
            return 1;
        }else{
            return 0;
        }
        $ConexionBD->Cerrar($conexion);
    }
    public static function MdlEliminarFinca($finca)
    {
        $ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
        $query = mysqli_query($conexion,"CALL sp_delete_finca('".$finca["_idFinca"]."')");
        if($query)
        {
            return 1;
        }else{
            return 0;
        }
        $ConexionBD->Cerrar($conexion);
    }
    public static function Mostrar_datos_finca($idfinca)
	{
		$ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
		$query = mysqli_query($conexion,"CALL sp_buscar_finca('".$idfinca."')");
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
    public static function Buscar_mostrar_finca($valor)
    {
        $ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
		$query = mysqli_query($conexion,"CALL sp_mostrar_buscar_finca('".$valor."')");
		$resultado = mysqli_num_rows($query);
        $tabla_finca = '';
        if($resultado > 0)
        {
            while($row = $query->fetch_assoc())
			{
                $tabla_finca.='                
                <tr>
                    <td>'.$row['nroPropietario'].'</td>
                    <td>'.$row['propietario'].'</td>
                    <td>'.$row['nroTacho'].'</td>
                    <td>'.$row['nombre_finca'].'</td>
                    <td>'.$row['telefono'].'</td>
                    <td>'.$row['direccion'].'</td>
                    <td class="opciones">					
                        <a href="#" class="update" id="'.$row['idFinca'].'" title="editar"><img src="iconos/editar.svg" alt="Editar"></a>					
                        <a href="#" class="delete" id="'.$row['idFinca'].'" title="eliminar"><img src="iconos/eliminar-usr.svg" alt="Denegar"></a>                        						
                    </td>
                </tr>            
            ';
            }
        }else{
            $tabla_finca .="<tr><td colspan='9'>No hay Datos... :(</td></tr>";
        }
        return $tabla_finca;
    }
}