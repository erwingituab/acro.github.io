<link rel="stylesheet" href="css/usuario.css">
<div class="contenedor-form">
	<form name="frmReproductor" method="post" id="frmReproductor">
		<div class="titulo-frm">			
			<h1 id="titulo">Toro</h1>
		</div>
		<div class="input">
			<label for="nombre">Nombre</label>
			<input type="hidden" id="idReproductor">
			<input type="text" id="nombre" placeholder="Ingrese nombre de toro" tabindex="1">
		</div>
		<div class="input">
			<label for="apodo">Apodo</label>
			<input type="text" id="apodo" placeholder="Ingrese apodo" tabindex="2">
		</div>
		<div class="input">
			<label for="hba">HBA</label>
			<input type="hidden" id="idreproductor">
			<input type="text" id="hba" placeholder="Ingrese codigo HBA del toro." tabindex="3">
		</div>		
		<div class="input">
			<label for="rp">Codigo USA</label>
			<input type="text" id="rp" placeholder="Ingrese codigo usa." tabindex="4">
		</div>
		<div class="input">
			<label for="direccion">Codigo NAAB</label>
			<input type="text" id="naab" placeholder="Ingrese codigo NAAB" tabindex="5">
		</div>		
		<div class="input">
			<label for="raza">Raza</label>
			<select id="raza" tabindex="6">
				<option value=""selected>Elija opcion</option>
				<option value="1">Cruzas</option>
				<option value="2">Holstein</option>
				<option value="3">Jersey</option>
                <option value="4">Otras</option>
			</select>
		</div>
        <div class="input">
			<label for="tiposervicio">Tipo de Servicio</label>
			<select id="tiposervicio" tabindex="7">
				<option value=""selected>Elija opcion</option>
				<option value="1">Inseminacion Artificial</option>
				<option value="2">Monta Natural</option>
				<option value="3">Trans. Embriones</option>                
			</select>
		</div>
		<div class="alert" id="alert">
			<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
			<strong id="strong">Error!</strong><p id="mensaje" class="mensaje" ></p>
		</div>
		<div class="input">				
			<input type="button" id="submit" class="button button2" value="Registrar" tabindex="8">	
		</div>			
	</form>
	<div class="data">		
		<div class="buscar">		
			<div class="input">
				<input type="text" placeholder="Buscar toro" id="buscartoro"><img src="iconos/buscar.svg" alt="">
			</div>		
			<ul class="salida">
				<li><a href="" class="pdf"><img src="iconos/pdf.svg" alt="pdf"></a></li>				
				<li><a href="" class="print"><img src="iconos/print.svg" alt="pdf"></a></li>
			</ul>
		</div>
		<div class="table">
			<table>
				<thead>					
					<th>NOMBRE</th>
					<th>APODO</th>
					<th>HBA</th>
					<th>USA</th>				
					<th>NAAB</th>
					<th>RAZA</th>
					<th>T. SERV</th>					
					<th>Acción</th>
				</thead>				
				<tbody id="toros">	
					
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
<script src="js/reproductor.js"></script>

