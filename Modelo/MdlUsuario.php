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
	
	public static function Registrar($usuario)
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
	public static function Actualizar($usuario)
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
	public static function Bloquear($usuario)
	{
		$ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
		$query = mysqli_query($conexion,"CALL sp_bloquear_usuario('".$usuario['idusuario']."')");
		if ($query) {
			return 1;
		}
		else
		{
			return 0;
		}
		$ConexionBD->Cerrar($conexion);
	}
	public static function Activar($usuario)
	{
		$ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
		$query = mysqli_query($conexion,"CALL sp_activar_usuario('".$usuario['idusuario']."')");
		if ($query) {
			return 1;
		}
		else
		{
			return 0;
		}
		$ConexionBD->Cerrar($conexion);
	}
	public static function Mostrar_datos_usuario($idusuario)
	{
		$ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
		$query = mysqli_query($conexion,"CALL sp_buscar_usuario('".$idusuario."')");
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
	public static function Buscar_mostrar_usuario($valor)
	{
		$ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
		$query = mysqli_query($conexion,"CALL sp_buscar_mostrar_usuario('".$valor."')");
		$resultado = mysqli_num_rows($query);
		$tabla_usuario = '';
		$rol = "";
		$status = "";
		if($resultado > 0)
		{
			while($row = $query->fetch_assoc())
			{
				$tabla_usuario.='
				<tr>
				<tr>
				<td>'.$row['ci'].'</td>
				<td>'.$row['nombre'].'</td>
				<td>'.$row['apellidos'].'</td>
				<td>'.$row['telefono'].'</td>
				<td>'.$row['direccion'].'</td>
				<td>'.$row['usuario'].'</td>';
				if($row['rol']==1){
					$rol = "Administrador";
				}
				if($row['rol']==2)
				{
					$rol = "Veterinario";
				}
				if($row['rol']==3){
					$rol = "Productor";
				}
				$tabla_usuario.='
				<td>'.$rol.'</td>
				';				
				if($row['status']==1)
				{
					$status = "Activo";
				}
				if($row['status']==2)
				{
					$status = "Bloqueado";
				}
				$tabla_usuario.='
				<td>'.$status.'</td>
				<td class="opciones">					
					<a href="#" class="update" id="'.$row['idUsuario'].'" title="editar"><img src="iconos/editar.svg" alt="Editar"></a>					
					<a href="#" class="blocked" id="'.$row['idUsuario'].'" title="bloquear"><img src="iconos/blocked-usr.svg" alt="Denegar"></a>
					<a href="#" class="active" id="'.$row['idUsuario'].'" title="activar"><img src="iconos/usr_cheket.svg" alt="Activar"></a>						
				</td>';			
			}
		}
		else
		{
			$tabla_usuario .="<tr><td colspan='9'>No hay Datos... :(</td></tr>";
		}
		return $tabla_usuario;
	}
	public static function paginador()
	{
		$ConexionBD = new ConexionBD();
		$conexion = $ConexionBD->Abrir();
		$query = mysqli_query($conexion,"SELECT COUNT(*) as registros FROM usuario");
		$resultado = mysqli_fetch_array($query);
		$total_registro = $resultado['registros'];
		$por_pagina = 5;
		if(empty($_GET['paginador']))
		{
			$pagina = 1;
		}else{
			$pagina = $_GET['paginador'];
		}
		
		$desde = ($pagina - 1) * $por_pagina;
		$total_paginas = ceil($total_registro / $por_pagina);
		$consulta = mysqli_query($conexion,"SELECT idUsuario,ci,nombre,apellidos,telefono,direccion,usuario,rol,status FROM usuario
		WHERE status=1 LIMIT $desde,$por_pagina ORDER BY 1 DESC");

		$resultado = mysqli_num_rows($consulta);
		$tabla_usuario = '';
		$rol = "";
		$status = "";
		if($resultado > 0)
		{
			while($row = $query->fetch_assoc())
			{
				$tabla_usuario.='
				<tr>
				<tr>
				<td>'.$row['ci'].'</td>
				<td>'.$row['nombre'].'</td>
				<td>'.$row['apellidos'].'</td>
				<td>'.$row['telefono'].'</td>
				<td>'.$row['direccion'].'</td>
				<td>'.$row['usuario'].'</td>';
				if($row['rol']==1){
					$rol = "Administrador";
				}
				if($row['rol']==2)
				{
					$rol = "Veterinario";
				}
				if($row['rol']==3){
					$rol = "Productor";
				}
				$tabla_usuario.='
				<td>'.$rol.'</td>
				';
				if($row['status']==1)
				{
					$status = "Activo";
				}
				if($row['status']==2)
				{
					$status = "denegado";
				}
				$tabla_usuario.='
				<td>'.$status.'</td>
				<td class="opciones">					
					<a href="#" class="update" id="'.$row['idUsuario'].'" title="editar"><img src="iconos/editar.svg" alt="Editar"></a>
					<a href="#" class="delete" id="'.$row['idUsuario'].'" title="eliminar"><img src="iconos/eliminar-usr.svg" alt="Eliminar"></a>
					<a href="#" class="blocked" id="'.$row['idUsuario'].'" title="bloquear"><img src="iconos/blocked-usr.svg" alt="Eliminar"></a>							
				</td>';			
			}
		}
		else
		{
			$tabla_usuario .="<tr><td colspan='9'>No hay Datos... :(</td></tr>";
		}
		return $tabla_usuario;
	}
}