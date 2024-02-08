<link rel="stylesheet" href="css/usuario.css">
<div class="contenedor-form">
	<form name="frmUsuario" method="post" id="frmUsuario">
		<div class="titulo-frm">			
			<h1 id="titulo">Usuario</h1>
		</div>
		<div class="input">
			<label for="ci">Ci</label>
			<input type="hidden" id="idusuario">
			<input type="text" id="ci" placeholder="Ingrese número de carnet" tabindex="1">
		</div>
		<div class="input">
			<label for="nombre">Nombre</label>
			<input type="text" id="nombre" placeholder="Ingrese nombres" tabindex="2">
		</div>
		<div class="input">
			<label for="nombre">Apellidos</label>
			<input type="text" id="apellidos" placeholder="Ingrese apellidos" tabindex="3">
		</div>
		<div class="input">
			<label for="telefono">Teléfono</label>
			<input type="text" id="telefono" placeholder="Ingrese numero de teléfono" tabindex="4">
		</div>
		<div class="input">
			<label for="direccion">Direccion</label>
			<input type="text" id="direccion" placeholder="Ingrese una direccion" tabindex="5">
		</div>
		<div class="input">
			<label for="usuario">Usuario</label>
			<input type="text" id="usuario" placeholder="Ingrese nombre usuario" tabindex="6">
		</div>
		<div class="input">
			<label for="clave">Password</label>
			<input type="text" id="clave" placeholder="Ingrese password" tabindex="7">
		</div>
		<div class="input">
			<label for="rol">Rol</label>
			<select id="rol" tabindex="8">
				<option value=""selected>Elija opcion</option>
				<option value="1">Administrador</option>
				<option value="2">Veterinario</option>
				<option value="3">Socio</option>
			</select>
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
					<th>Ci</th>
					<th>Nombre</th>
					<th>Apellidos</th>
					<th>Teléfono</th>
					<th>Dirección</th>
					<th>Usuario</th>
					<th>Rol</th>
					<th>Status</th>
					<th>Acción</th>
				</thead>				
				<tbody id="usuarios">	
																					
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
<script src="js/usuario.js"></script>

