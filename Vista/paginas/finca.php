<link rel="stylesheet" href="css/usuario.css">
<div class="contenedor-form">
	<form name="frmUsuario" method="post" id="frmUsuario">
		<div class="titulo-frm">			
			<h1 id="titulo">Finca</h1>
		</div>
		<div class="input">
			<label for="ci">Nro. Propietario</label>
			<input type="hidden" id="idusuario">
			<input type="text" id="nropropietario" placeholder="Ingrese número de carnet" tabindex="1">
		</div>
		<div class="input">
			<label for="nombre">Propietario</label>
			<input type="text" id="nombre" placeholder="Ingrese nombres y apellidos" tabindex="2">
		</div>
		<div class="input">
			<label for="nombre">Nro. Finca</label>
			<input type="text" id="nrofinca" placeholder="Ingrese nro. tacho" tabindex="3">
		</div>
		<div class="input">
			<label for="telefono">Nombre Finca</label>
			<input type="text" id="finca" placeholder="Ingrese nombre de finca" tabindex="4">
		</div>
		<div class="input">
			<label for="direccion">Teléfono</label>
			<input type="text" id="direccion" placeholder="Ingrese número de telefono" tabindex="5">
		</div>
		<div class="input">
			<label for="direccion">Direccion</label>
			<input type="text" id="direccion" placeholder="Ingrese una direccion" tabindex="6">
		</div>		
		<div class="alert" id="alert">
			<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
			<strong id="strong">Error!</strong><p id="mensaje" class="mensaje" ></p>
		</div>
		<div class="input">				
			<input type="button" id="submit" class="button button2" value="Registrar" tabindex="9">	
		</div>			
	</form>
	<div class="data">		
		<div class="buscar">		
			<div class="input">
				<input type="text" placeholder="Buscar usuario" id="buscarusuario"><img src="iconos/buscar.svg" alt="">
			</div>		
			<ul class="salida">
				<li><a href="" class="pdf"><img src="iconos/pdf.svg" alt="pdf"></a></li>				
				<li><a href="" class="print"><img src="iconos/print.svg" alt="pdf"></a></li>
			</ul>
		</div>
		<div class="table">
			<table>
				<thead>
					<th>N° Propietario.</th>
					<th>Nombre Propietario</th>
					<th>N° Finca</th>
					<th>Nombre Finca</th>
					<th>Teléfono</th>
					<th>Dirección</th>				
					<th>Acción</th>
				</thead>				
				<tbody id="fincas">	
					<tr>
						<td>1</td>
						<td>Orlando Vallejos Arnez</td>
						<td>1</td>
						<td>Maria Florencia</td>
						<td>73751692</td>
						<td>Tacata Alta</td>
						<td class="opciones">					
							<a href="#" class="update" id="'.$row['idUsuario'].'" title="editar"><img src="iconos/editar.svg" alt="Editar"></a>					
							<a href="#" class="blocked" id="'.$row['idUsuario'].'" title="bloquear"><img src="iconos/blocked-usr.svg" alt="Denegar"></a>
							<a href="#" class="active" id="'.$row['idUsuario'].'" title="activar"><img src="iconos/usr_cheket.svg" alt="Activar"></a>						
						</td>
					</tr>																
				</tbody>				
			</table>			
		</div>
		<div class="paginador">
			<ul>
				<li><a href="#">|<</a></li>
				<li><a href="#"><<</a></li>
				<li class="pageSelected">1</li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">>></a></li>
				<li><a href="#">>|</a></li>
			</ul>
		</div>
	</div>
</div>
<script src="libreria/jquery/jquery.js"></script>
<script src="js/finca.js"></script>

