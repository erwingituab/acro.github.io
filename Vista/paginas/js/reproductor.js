document.getElementById('nombre').focus();
document.addEventListener('keypress', function(evt) 
{
	// Si el evento NO es una tecla Enter
	if (evt.key !== 'Enter') {
		return;
	}
	let element = evt.target;
	// AQUI logica para encontrar el siguiente
	let tabIndex = element.tabIndex + 1;
	var next = document.querySelector('[tabindex="'+tabIndex+'"]');
	// Si encontramos un elemento
	if (next) {
		next.focus();
		event.preventDefault();
	}
});
$(function() 
{
  $('.input').keyup(function(e) {
    if(e.keyCode==38)//38 para arriba
      mover(e,-1);
    if(e.keyCode==40)//40 para abajo
      mover(e,1);
  	if (e.keyCode==39) 
  	{
  		document.getElementById('buscarusuario').focus();
  	}
  	if (e.keyCode==37) 
  	{
  		var ci = document.getElementById('ci');
  		var nombre = document.getElementById('nombre');
  		var telefono = document.getElementById('telefono');
  		var direccion = document.getElementById('direccion');
  		var usuario = document.getElementById('usuario');
  		var clave = document.getElementById('clave');
  		var rol = document.getElementById('rol');
  		if (ci.value=='')  		
  		{
  			ci.focus();
  			return;
  		}
  		if (nombre.value=='') 
  		{
  			nombre.focus();
  			return;
  		}
  		if (telefono.value=='') 
  		{
  			telefono.focus();
  			return;
  		}
  		if (direccion.value=='') 
  		{
  			direccion.focus();
  			return;
  		}
  		if (usuario.value=='') 
  		{
  			usuario.focus();
  			return;
  		}
  		if (clave.value=='') 
  		{
  			clave.focus();
  			return;
  		}
  		if (rol.selectedIndex==0) 
  		{
  			rol.focus();
  			return;
  		}
  		else{
  			document.getElementById('submit').focus();
  			return;
  		}
  	}
  });
});
$(document).ready(function(){
	var action = 'Registrar';
	$("#submit").val(action);
	Buscar_mostrar_reproductor("");
	function Buscar_mostrar_reproductor(valor)
	{
		$.ajax({
			url: '../../Controlador/CtrlReproductor.php',
			type: 'POST',
			data: {action:'Buscar_mostrar_reproductor',valor:valor},
			success:function(respuesta)
			{
				if(respuesta!=0){
					$('#toros').html(respuesta);
				}
			}
		});
	}	
	$(document).on('keyup','#buscartoro',function()
	{
		var valor = $($(this)).val();
		if (valor != "") 
		{
			Buscar_mostrar_reproductor(valor);
		}
		else
		{
			Buscar_mostrar_reproductor("");
		}
	});
	$(document).on('click','#submit',function(){
		if(ValidarReproductor())
		{
			if(action=="Registrar")
			{
				var alert 	= document.getElementById("alert");
				var mensaje = document.getElementById("mensaje");
				var strong 	= document.getElementById('strong');

				var hba 	= document.frmReproductor.hba.value;
				var apodo 	= document.frmReproductor.apodo.value;
				var nombre 	= document.frmReproductor.nombre.value;
				var rp 		= document.frmReproductor.rp.value;
				var naab 	= document.frmReproductor.naab.value;
				var raza 	= document.frmReproductor.raza.selectedIndex;
				var tiposervicio = document.frmReproductor.tiposervicio.value;
				$.ajax({
					url:"../../controlador/CtrlReproductor.php",
					method:"POST",
					data:{action:action,hba:hba,apodo:apodo,nombre:nombre,rp:rp,naab:naab,raza:raza,tiposervicio:tiposervicio},
					success:function(respuesta)
					{	
						if (respuesta==1) 
						{
							Buscar_mostrar_reproductor("");
							alert.style.display = "block";
							alert.style.backgroundColor="#41955D";
							strong.innerHTML = "Éxito!";
							mensaje.innerHTML = "Reproductor registrado.";
							document.getElementById('frmReproductor').reset();
							document.getElementById('hba').focus();
							setTimeout(function() { 
								alert.style.display = "none";	
							}, 4000);
						}
						else{
							console.log("Error");
						}
					}
				});
			}
			if(action=="Actualizar")
			{
				var alert 	= document.getElementById("alert");
				var mensaje = document.getElementById("mensaje");
				var strong 	= document.getElementById('strong')
				var idReproductor = document.frmReproductor.idReproductor.value;
				var hba 	= document.frmReproductor.hba.value;
				var apodo 	= document.frmReproductor.apodo.value;
				var nombre 	= document.frmReproductor.nombre.value;
				var rp 		= document.frmReproductor.rp.value;
				var naab 	= document.frmReproductor.naab.value;
				var raza 	= document.frmReproductor.raza.selectedIndex;
				var tiposervicio = document.frmReproductor.tiposervicio.value;
				$.ajax({
					url:"../../controlador/CtrlReproductor.php",
					method:"POST",
					data:{action:action,idReproductor:idReproductor,hba:hba,apodo:apodo,nombre:nombre,rp:rp,naab:naab,raza:raza,tiposervicio:tiposervicio},
					success:function(respuesta)
					{										
						if (respuesta==1) 
						{
							Buscar_mostrar_reproductor("");
							alert.style.display = "block";
							alert.style.backgroundColor="#41955D";
							strong.innerHTML = "Éxito!";
							mensaje.innerHTML = "Reproductor actualizado.";
							document.getElementById('frmReproductor').reset();
							action = "Registrar";
							$("#submit").val(action);
							document.getElementById('nombre').focus();
							setTimeout(function() { 
								alert.style.display = "none";	
							}, 4000);
						}
						else{
							console.log("Error");
						}
					}
				});
			}			
		}
	});
	$(document).on('click','.update',function()
	{		
		var idReproductor = $(this).attr("id");
		$.ajax({
			url: '../../controlador/CtrlReproductor.php',
			type: 'POST',
			data:{action:'mostrar_datos_reproductor',idReproductor:idReproductor},
			success:function(respuesta)
			{					
				if (respuesta!=0) 
				{
					var reproductor = $.parseJSON(respuesta);
					$('#idReproductor').val(reproductor.idReproductor);
					$("#nombre").val(reproductor.nombre);
					$("#apodo").val(reproductor.apodo);
					$("#hba").val(reproductor.hba);
					$("#rp").val(reproductor.rp);
					$("#naab").val(reproductor.naab);
					$("#raza").val(reproductor.raza).selectedIndex;					
					$("#tiposervicio").val(reproductor.tiposervicio).selectedIndex;
					
					document.getElementById("nombre").select();
					document.getElementById("nombre").focus();
					action = "Actualizar";
					$("#submit").val(action);
				}				
			}
		})		
	});
	$(document).on('click','.delete',function(){
		var idReproductor = $(this).attr("id");
		const swalWithBootstrapButtons = Swal.mixin({
			customClass: {
			  confirmButton: "btn btn-success",
			  cancelButton: "btn btn-danger"
			},
			buttonsStyling: false
		  });
		  swalWithBootstrapButtons.fire({
			title: "Está seguro?",
			text: "¡No podrás revertir esto!",
			icon: "warning",
			showCancelButton: true,
			confirmButtonText: "Si, Eliminalo!",
			cancelButtonText: "No, cancelado!",
			reverseButtons: true
		  }).then((result) => {
			if (result.isConfirmed) 
			{
				$.ajax({
					url: '../../Controlador/CtrlReproductor.php',
					type: 'POST',
					data:{action:'Eliminar',idReproductor:idReproductor},
					success:function(respuesta)
					{
						console.log(respuesta);				
						if (respuesta!=0) 
						{						
							document.getElementById("nombre").focus();
							action = "Registrar";
							$("#submit").val(action);
							Buscar_mostrar_reproductor("");
						}else{
							console.log(respuesta);
						}				
					}
				});
			  	swalWithBootstrapButtons.fire({
				title: "Eliminado!",
				text: "la Finca a sido eliminada.",
				icon: "success"				
			  });
			} else if (
			  /* Read more about handling dismissals below */
			  result.dismiss === Swal.DismissReason.cancel
			) {
			  swalWithBootstrapButtons.fire({
				title: "Cancelado",
				text: "El reproductor esta a  a salvo. :)",
				icon: "error"
			  });
			}
		  });
	});
});
function ValidarReproductor()
{
	var alert 	= document.getElementById("alert");
	var mensaje = document.getElementById("mensaje");
	var strong 	= document.getElementById('strong')

	var hba 	= document.frmReproductor.hba.value;
	var apodo 	= document.frmReproductor.apodo.value;
	var nombre 	= document.frmReproductor.nombre.value;
	var rp 		= document.frmReproductor.rp.value;
	var naab 	= document.frmReproductor.naab.value;
	var raza 	= document.frmReproductor.raza.selectedIndex;
	var tiposervicio = document.frmReproductor.tiposervicio.value;
	if(nombre == "")
	{
		document.frmReproductor.nombre.focus();
		alert.style.display = "block";
		alert.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Ingrese nombre del Toro.";
		return false;
	}
	if(apodo == "")
	{
		document.frmReproductor.apodo.focus();
		alert.style.display = "block";
		alert.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Ingrese apodo del Toro.";
		return false;
	}
	if(hba == "")
	{
		document.frmReproductor.hba.focus();
		alert.style.display = "block";
		alert.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Ingrese codigo HBA del Toro.";
		return false;
	}	
	if(rp == "")
	{
		document.frmReproductor.rp.focus();
		alert.style.display = "block";
		alert.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Ingrese numero registro propio del Toro.";
		return false;
	}
	if(naab == "")
	{
		document.frmReproductor.naab.focus();
		alert.style.display = "block";
		alert.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Ingrese codigo NAAB del Toro.";
		return false;
	}
	if(raza == "")
	{
		document.frmReproductor.raza.focus();
		alert.style.display = "block";
		alert.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "ISeleccione una raza de toro.";
		return false;
	}
	if(tiposervicio == "")
	{
		document.frmReproductor.tiposervicio.focus();
		alert.style.display = "block";
		alert.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Seleccione tipo de servicio.";
		return false;
	}
	return true;
}
