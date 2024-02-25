<link rel="stylesheet" href="css/evento.css">
<link rel="stylesheet" href="libreria/bootstrap/css/bootstrap.min.css">
<div class="contenedor-form">
    <div class="data">		
		<div class="buscar">		
			<div class="input">
				<input type="text" placeholder="Buscar evento" id="buscarevento"><img src="iconos/buscar.svg" alt="">
			</div>
			<p>EVENTOS</p>		
			<ul class="salida">
				<li><a href="" class="pdf"><img src="iconos/pdf.svg" alt="pdf"></a></li>				
				<li><a href="" class="print"><img src="iconos/print.svg" alt="pdf"></a></li>
			</ul>
		</div>
		<div class="table">
			<table>			
				<thead>
					<th>Clave</th>
					<th>Descripcion</th>
					<th>Tipo de Evento</th>					
					<th>Acción</th>
				</thead>				
				<tbody id="eventos">	
																				
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
		<button type="button" id="btnmodal" class="btn btn-primary" data-toggle="modal" data-target="#registrar"><img src="iconos/plus.svg" alt="" style="color:#fff;">Registrar</button>
	</div>
    
    <!-- Modal -->
    <div class="modal fade" id="registrar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle"></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
		<form name="frmEvento" method="post" id="frmEvento">
			<div class="form-group">
				<label for="clave">Clave de Evento</label>
				<input type="hidden" id="idEvento">
				<input type="text" class="form-control" id="clave" placeholder="Ingrese clave de evento." aria-describedby="emailHelp" tabindex="1">			
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Descripcion</label>
				<input type="text" class="form-control" id="descripcion" placeholder="Ingrese descripcion." tabindex="2">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Tipo de Evento</label>
					<select id="tipoevento" class="form-control" tabindex="3">
						<option value="" selected>Elija opción</option>
						<option value="1">REPRODUCTIVO</option>
						<option value="2">PREÑEZ</option>
						<option value="3">SECADO</option>
						<option value="4">SERVICIO</option>
						<option value="5">VACIA</option>						
						<option value="6">ENF. REPRODUCTIVA</option>
						<option value="7">ENF. SANITARIA </option>
						<option value="8">ENF. DIGESTIVA</option>
						<option value="9">ESTADO CORPORAL</option>
						<option value="10">BAJA - OTRAS</option>
						<option value="11">BAJA - MUERTE</option>						
						<option value="12">VARIOS</option>
					</select>
			</div>
			<div class="form-group">
				<div class="alert" id="alert">
					<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
					<strong id="strong">Error!</strong><p id="mensaje" class="mensaje" ></p>
				</div>
			</div>					
        </div>
        <div class="modal-footer">
            <button type="button" id="btnclose" class="btn btn-secondary" data-dismiss="modal" tabindex="5">Close</button>
            <button type="button" id="submit" class="btn btn-primary" tabindex="4"><img src="iconos/plus.svg" alt="">Registrar</button>
        </div>
		</form>
        </div>
    </div>
    </div>
</div>
<script src="libreria/jquery/jquery.js"></script>
<script src="js/evento.js"></script>