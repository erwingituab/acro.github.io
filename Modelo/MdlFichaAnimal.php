<?php
require_once "conexion.php";
class MdlFichaAnimal
{
    public static function AgregarParticipante($participante)
    {
        $ConexionBD = new ConexionBD();
        $conexion = $ConexionBD->Abrir();
        $query = mysqli_query($conexion,"CALL sp_agregar_participante('".$participante['nroparticipante']."',																
																'".$participante['descripcion']."')");
		if ($query) {
			return 1;
		}
		else
		{
			return 0;
		}
		$ConexionBD->Cerrar($conexion);
    }
    public static function AgregarTratamiento($tratamiento)
    {
        $ConexionBD = new ConexionBD();
        $conexion = $ConexionBD->Abrir();
        $query = mysqli_query($conexion,"CALL sp_agregar_tratamiento('".$tratamiento['nrotratamiento']."',
                                                                    '".$tratamiento['descripcion']."')");
		if ($query) {
			return 1;
		}
		else
		{
			return 0;
		}
		$ConexionBD->Cerrar($conexion);
    }
    public static function BuscarParticipante($valor)
    {
        $ConexionBD = new ConexionBD();
        $conexion = $ConexionBD->Abrir();
        $query = mysqli_query($conexion,"CALL sp_buscar_participante('".$valor."')");
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
    public static function BuscarTratamiento_nro($valor)
    {
        $ConexionBD = new ConexionBD();
        $conexion = $ConexionBD->Abrir();
        $query = mysqli_query($conexion,"CALL sp_buscar_nrotratamiento('".$valor."')");
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
    public static function MostrarEvento($clave)
    {
        $ConexionBD = new ConexionBD();
        $conexion = $ConexionBD->Abrir();
        $query = mysqli_query($conexion,"CALL sp_mostrar_evento('".$clave."')");
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
    public static function BuscarToro($hba)
    {
        $ConexionBD = new ConexionBD();
        $conexion = $ConexionBD->Abrir();
        $query = mysqli_query($conexion,"CALL sp_buscar_toro('".$hba."')");
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
    static public function Buscar_mostrar_tratamientos($valor)
	{
		$ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
		$query = mysqli_query($conexion,"CALL sp_buscar_mostrar_tratamiento('".$valor."')");
		$resultado = mysqli_num_rows($query);
		$tabla_tratamiento = '';		
		if($resultado > 0)
		{
			while($row = $query->fetch_assoc())
			{
				$tabla_tratamiento.='
				<tr>
					<td>'.$row['nrotratamiento'].'</td>
					<td>'.$row['descripcion'].'</td>						
				</tr>	
				';
			}
		}
		else
		{
			$tabla_tratamiento .="<tr><td colspan='4'>No hay Datos tratamiento... :(</td></tr>";
		}
		return $tabla_tratamiento;
	}
    static public function RegistrarHistoria($historia)
    {
        $ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
		$query = mysqli_query($conexion,"CALL sp_create_historia('".$historia['fecha']."',
																'".$historia['AnimalID']."',
																'".$historia['EventoID']."',
                                                                '".$historia['TratamientoID']."',
                                                                '".$historia['ParticipanteID']."')");
		if ($query) {
			return 1;
		}
		else
		{
			return 0;
		}
		$ConexionBD->Cerrar($conexion);
    }
    static public function RegistrarCruzamiento($cruzamiento)
    {
        $ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
		$query = mysqli_query($conexion,"CALL sp_create_cruzamiento('".$cruzamiento['EventoID']."',
																'".$cruzamiento['ReproductorID']."')");
		if ($query) {
			return 1;
		}
		else
		{
			return 0;
		}
		$ConexionBD->Cerrar($conexion);
    }
    static public function RegistrarParto($parto)
    {
        $ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
		$query = mysqli_query($conexion,"CALL sp_create_parto(  '".$parto['nroparto']."',
																'".$parto['tipo']."',
																'".$parto['sexo']."',
                                                                '".$parto['chbcria']."',
                                                                '".$parto['peso']."',
                                                                '".$parto['EventoID']."')");
		if ($query) {
			return 1;
		}
		else
		{
			return 0;
		}
		$ConexionBD->Cerrar($conexion);
    }
    static public function MostrarHistoriaAnimal($chb)
    {
        $ConexionBD = new ConexionBD();
		$conexion   = $ConexionBD->Abrir();
		$query      = mysqli_query($conexion,"CALL sp_mostrar_servicios('".$chb."')");        
		$resultado  = mysqli_num_rows($query);        
		$tabla_tratamiento = '';
        $contador = 1;		
		if($resultado > 0)
		{
			while($row = $query->fetch_assoc())
			{
				$tabla_tratamiento.='
				<tr>
                    <td>'.$contador.'</td>
					<td>'.$row['fecha'].'</td>
					<td>'.$row['evento'].'</td>
                    <td>'.$row['tratamiento'].'</td>
                    <td></td>					
                    <td>'.$row['participante'].'</td>
                    <td>'.$row['reproductor'].'</td>
                    <td class="opciones">	
                        <button type="button" id="'.$row['idHIstoria'].'" data-toggle="modal" data-target=".bd-example-modal-lg" class="update btn btn-warning btn-sm" ><img src="iconos/editar.svg" alt="Editar">Modificar</button>
                        <button type="button" id="'.$row['idHIstoria'].'" class="delete btn btn-danger btn-sm"><img src="iconos/x.svg" alt="Editar">Eliminar</button>                                                  						
                    </td>
				</tr>	
				';
                $contador = $contador + 1;
			}
		}        
		else
		{
			$tabla_tratamiento .="";
		}
        $partos = MdlFichaAnimal::MostrarHistoriaParto($chb,$contador);
		return $tabla_tratamiento.$partos;
        
    }
    static public function MostrarHistoriaParto($chb,$contadors)
    {
        $ConexionBD = new ConexionBD();
		$conexion   = $ConexionBD->Abrir();
        $query2     = mysqli_query($conexion,"CALL sp_mostrar_partos('".$chb."')");
        $resultado2 = mysqli_num_rows($query2);
        $tabla_parto = '';
        $tipo_parto = '';
        $sexo = '';
        $contador = $contadors;	
        if($resultado2 > 0)
        {
            while($row2 = $query2->fetch_assoc())
			{
				$tabla_parto.='
				<tr>
                    <td>'.$contador.'</td>
					<td>'.$row2['fecha'].'</td>
					<td>'.$row2['evento'].'</td>
                    <td>'.$row2['tratamiento'].'</td>';
                    if($row2['tipo']==1){$tipo_parto='Normal';}
                    if($row2['tipo']==2){$tipo_parto='Dif. Intensa';}
                    if($row2['tipo']==3){$tipo_parto='Dif. Leve';}
                    if($row2['tipo']==4){$tipo_parto='Cesarea';}
                $tabla_parto.='<td>'.$tipo_parto.'						
                    '.$row2['nroparto'].'°Lact.';
                    if($row2['sexo']==1){$sexo='Hembra';}
                    if($row2['sexo']==2){$sexo='Macho';}
                    if($row2['sexo']==3){$sexo='H/M';}
                $tabla_parto.='
                    '.$sexo.'</td>
                    <td>'.$row2['participante'].'</td>
                    <td></td>
                    <td class="opciones">	
                        <button type="button" id="'.$row2['idHIstoria'].'" data-toggle="modal" data-target=".bd-example-modal-lg" class="update btn btn-warning btn-sm" ><img src="iconos/editar.svg" alt="Editar">Modificar</button>
                        <button type="button" id="'.$row2['idHIstoria'].'" class="delete btn btn-danger btn-sm"><img src="iconos/x.svg" alt="Editar">Eliminar</button>                                                  						
                    </td>
				</tr>	
				';
                $contador = $contador + 1;
			}
        }
        else
		{
			$tabla_parto .="";
		}
		return $tabla_parto;
    }
}