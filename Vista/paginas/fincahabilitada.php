<link rel="stylesheet" href="css/usuario.css">
<div class="contenedor-form">
<div class="data">		
		<div class="buscar">		
			<div class="input">
				<input type="text" placeholder="Buscar propietario o finca" id="buscarfinca"><img src="iconos/buscar.svg" alt="">
			</div>	
			<p>GRANJAS HABILITADAS</p>	
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
					<th>N° Granja</th>
					<th>Nombre Granjas</th>
					<th>Teléfono</th>
					<th>Dirección</th>				
					<th>Acción</th>
				</thead>				
				<tbody id="fincas">
					
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
<script src="js/fincahabilitada.js"></script>