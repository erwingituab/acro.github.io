document.getElementById('ci').focus();
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
function mover(event, to) {
   let list = $('input');
   let index = list.index($(event.target));
   index = Math.max(0,index + to);
   list.eq(index).focus();
}
$(document).ready(function(event) 
{
	var action = "Registrar";
	$("#submit").val(action);	
	$(document).on('keyup','#buscarusuario',function()
	{
		var valor = $($(this)).val();
		if (valor != "") 
		{
			Buscar_mostrar_usuario(valor);
		}
		else
		{
			Buscar_mostrar_usuario("");
		}
	});
	$(document).on('click','.update',function()
	{		
		var idusuario = $(this).attr("id");
		$.ajax({
			url: '../../controlador/CtrlUsuario.php',
			type: 'POST',
			data:{action:'Mostrar_datos_usuario',idusuario:idusuario},
			success:function(respuesta)
			{				
				if (respuesta!=0) 
				{
					var usuario = $.parseJSON(respuesta);
					$("#idusuario").val(usuario.idUsuario);
					$("#ci").val(usuario.ci);
					$("#nombre").val(usuario.nombre);
					$("#apellidos").val(usuario.apellidos);
					$("#telefono").val(usuario.telefono);
					$("#direccion").val(usuario.direccion);					
					$("#rol").val(usuario.rol).selectedIndex;
					$("#usuario").val(usuario.usuario);
					$("#estatus").val(usuario.estatusid);
					document.getElementById("ci").select();
					document.getElementById("ci").focus();
					action = "Actualizar";
					$("#submit").val(action);
				}				
			}
		})		
	});
	$(document).on('click','.blocked',function(){

		var idusuario = $(this).attr("id");
		
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
			confirmButtonText: "Si, bloquealo!",
			cancelButtonText: "No, cancelado!",
			reverseButtons: true
		  }).then((result) => {
			if (result.isConfirmed) {
				$.ajax({
					url: '../../controlador/CtrlUsuario.php',
					type: 'POST',
					data:{action:'Bloquear',idusuario:idusuario},
					success:function(respuesta)
					{				
						if (respuesta!=0) 
						{							
							document.getElementById("ci").select();
							document.getElementById("ci").focus();
							action = "Registrar";
							$("#submit").val(action);
							Buscar_mostrar_usuario("");
						}else{
							console.log(respuesta);
						}				
					}
				});
			  	swalWithBootstrapButtons.fire({
				title: "Bloqueado!",
				text: "El usuario a sido bloqueado.",
				icon: "success"				
			  });
			} else if (
			  /* Read more about handling dismissals below */
			  result.dismiss === Swal.DismissReason.cancel
			) {
			  swalWithBootstrapButtons.fire({
				title: "Cancelado",
				text: "El usuario esta a activo:)",
				icon: "error"
			  });
			}
		  });
	});
	$(document).on('click','.active',function(){

		var idusuario = $(this).attr("id");
		
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
			confirmButtonText: "Si, Activar usuario!",
			cancelButtonText: "No, cancelado!",
			reverseButtons: true
		  }).then((result) => {
			if (result.isConfirmed) {
				$.ajax({
					url: '../../controlador/CtrlUsuario.php',
					type: 'POST',
					data:{action:'Activar',idusuario:idusuario},
					success:function(respuesta)
					{				
						if (respuesta!=0) 
						{							
							document.getElementById("ci").select();
							document.getElementById("ci").focus();
							action = "Registrar";
							$("#submit").val(action);
							Buscar_mostrar_usuario("");
						}else{
							console.log(respuesta);
						}				
					}
				});
			  	swalWithBootstrapButtons.fire({
				title: "Activado!",
				text: "El usuario a sido activado.",
				icon: "success"				
			  });
			} else if (
			  /* Read more about handling dismissals below */
			  result.dismiss === Swal.DismissReason.cancel
			) {
			  swalWithBootstrapButtons.fire({
				title: "Cancelado",
				text: "El usuario esta bloqueado:)",
				icon: "error"
			  });
			}
		  });
	});
	$("#submit").on("click",function()
	{			
		if(ValidarUsuario())
		{
			if(action=="Registrar")
			{
				var alertaU = document.getElementById("alert");
				var mensajeU = document.getElementById("mensaje");
				var strong = document.getElementById('strong')
				//Datos a enviar
				var ci = document.getElementById("ci").value;
				var nombre = document.getElementById("nombre").value;
				var apellidos = document.getElementById("apellidos").value;
				var telefono = document.getElementById("telefono").value;
				var direccion = document.getElementById("direccion").value;
				var usuario = document.getElementById("usuario").value;
				var clave = document.getElementById("clave").value;
				var rol = document.getElementById("rol").selectedIndex;
				$.ajax({
					url:"../../controlador/CtrlUsuario.php",
					method:"POST",
					data:{action:action,ci:ci,nombre:nombre,apellidos:apellidos,telefono:telefono,direccion:direccion,usuario:usuario,clave:clave,rol:rol},
					success:function(respuesta)
					{									
						if (respuesta==1) 
						{
							Buscar_mostrar_usuario("");
							alertaU.style.display = "block";
							alertaU.style.backgroundColor="#41955D";
							strong.innerHTML = "Éxito!";
							mensajeU.innerHTML = "Usuario registrado.";
							document.getElementById('frmUsuario').reset();
							document.getElementById('ci').focus();
							setTimeout(function() { 
								alertaU.style.display = "none";	
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
				var alertaU = document.getElementById("alert");
				var mensajeU = document.getElementById("mensaje");
				var strong = document.getElementById('strong')
				//Datos a enviar
				var idusuario = document.getElementById("idusuario").value;
				var ci = document.getElementById("ci").value;
				var nombre = document.getElementById("nombre").value;
				var apellidos = document.getElementById("apellidos").value;
				var telefono = document.getElementById("telefono").value;
				var direccion = document.getElementById("direccion").value;
				var usuario = document.getElementById("usuario").value;
				var clave = document.getElementById("clave").value;
				var rol = document.getElementById("rol").selectedIndex;
				$.ajax({
					url:"../../controlador/CtrlUsuario.php",
					method:"POST",
					data:{action:action,idusuario:idusuario,ci:ci,nombre:nombre,apellidos:apellidos,telefono:telefono,direccion:direccion,usuario:usuario,clave:clave,rol:rol},
					success:function(respuesta)
					{	
						console.log(respuesta);				
						if (respuesta==1) 
						{
							Buscar_mostrar_usuario("");
							alertaU.style.display = "block";
							alertaU.style.backgroundColor="#41955D";
							strong.innerHTML = "Éxito!";
							mensajeU.innerHTML = "Datos Actualizados.";
							document.getElementById('frmUsuario').reset();
							document.getElementById('ci').focus();
							setTimeout(function() { 
								alertaU.style.display = "none";
								action="Actualizar";
								$("#submit").val(action);	
							}, 4000);
						}
						else{
							console.log("Error");
						}
					}
				});
			}
			if(action=="Eliminar")
			{

			}			
		}
		//return false;		
	});
	
	Buscar_mostrar_usuario("");
	function Buscar_mostrar_usuario(valor)
	{		
		$.ajax({
			url: '../../controlador/CtrlUsuario.php',
			type: 'POST',
			data: {action:'Buscar_mostrar_usuario',valor:valor},
			success:function(respuesta)
			{
				//console.log(respuesta);
				if(respuesta!=0){
					$('#usuarios').html(respuesta);
				}
			}
		});
	}


});
function ValidarUsuario()
{
	var alertaU = document.getElementById("alert");
	var mensajeU = document.getElementById("mensaje");
	var strong = document.getElementById('strong')
	var ci = document.getElementById("ci");
	var nombre = document.getElementById("nombre");
    var nombre = document.getElementById("apellidos");
	var telefono = document.getElementById("telefono");
	var direccion = document.getElementById("direccion");
	var usuario = document.getElementById("usuario");
	var clave = document.getElementById("clave");
	var rol = document.getElementById("rol");
	if (ci.value=="") 
	{		
		document.frmUsuario.ci.focus();
		alertaU.style.display = "block";
		alertaU.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensajeU.innerHTML = "Ingrese ci";
		return false;
	}	
    if (apellidos.value=="") 
	{		
		document.frmUsuario.apellidos.focus();
		alertaU.style.display = "block";
		alertaU.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensajeU.innerHTML = "Ingrese apellidos";
		return false;
	}
	if (nombre.value=="") 
	{
		document.frmUsuario.nombre.focus();
		alertaU.style.display = "block";
		alertaU.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensajeU.innerHTML = "Ingrese nombre";
		return false;
	}
	if (telefono.value=="") 
	{
		document.frmUsuario.telefono.focus();
		alertaU.style.display = "block";
		alertaU.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensajeU.innerHTML = "Ingrese telefono";
		return false;
	}
	if (direccion.value=="") 
	{
		document.frmUsuario.direccion.focus();
		alertaU.style.display = "block";
		alertaU.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensajeU.innerHTML = "Ingrese direccion";
		return false;
	}
	if (usuario.value=="") 
	{
		document.frmUsuario.usuario.focus();
		alertaU.style.display = "block";
		alertaU.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensajeU.innerHTML = "Ingrese usuario";
		return false;
	}
	if (clave.value=="") 
	{
		document.frmUsuario.clave.focus();
		alertaU.style.display = "block";
		alertaU.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensajeU.innerHTML = "Ingrese clave";
		return false;
	}
	if (rol.value=="") 
	{
		document.frmUsuario.rol.focus();
		alertaU.style.display = "block";
		alertaU.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensajeU.innerHTML = "Elija un rol";
		return false;
	}	
	return true;
	/*
	alertaU.style.display = "block";
		alertaU.style.backgroundColor="#41955D";
		strong.innerHTML = "Éxito!";
		mensajeU.innerHTML = "Usuario registrado.";
	*/		
}