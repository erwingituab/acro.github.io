document.getElementById('nropropietario').focus();
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
$(document).ready(function(event){	
	Buscar_mostrar_finca("");
	function Buscar_mostrar_finca(valor)
	{		
		$.ajax({
			url: '../../controlador/CtrlFinca.php',
			type: 'POST',
			data: {action:'Buscar_mostrar_finca',valor:valor},
			success:function(respuesta)
			{				
				if(respuesta!=0){
					$('#fincas').html(respuesta);
				}
			}
		});
	}
	$(document).on('keyup','#buscarusuario',function()
	{
		var valor = $($(this)).val();
		if (valor != "") 
		{
			Buscar_mostrar_finca(valor);
		}
		else
		{
			Buscar_mostrar_finca("");
		}
	});	
	$(document).on('click','.delete',function(){
		var idfinca = $(this).attr("id");
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
			if (result.isConfirmed) {
				$.ajax({
					url: '../../controlador/CtrlFinca.php',
					type: 'POST',
					data:{action:'Eliminar',idfinca:idfinca},
					success:function(respuesta)
					{							
						if (respuesta!=0) 
						{						
							document.getElementById("nropropietario").focus();
							action = "Registrar";
							$("#submit").val(action);
							Buscar_mostrar_finca("");
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
				text: "El usuario esta a activo:)",
				icon: "error"
			  });
			}
		  });
	});
	$(document).on('click','.update',function()
	{		
		var idfinca = $(this).attr("id");
		$.ajax({
			url: '../../controlador/CtrlFinca.php',
			type: 'POST',
			data:{action:'Mostrar_datos_finca',idfinca:idfinca},
			success:function(respuesta)
			{						
				if (respuesta!=0) 
				{
					var finca = $.parseJSON(respuesta);
					$("#idfinca").val(finca.idFinca);
					$("#nropropietario").val(finca.nroPropietario);
					$("#propietario").val(finca.propietario);
					$("#nrofinca").val(finca.nroTacho);
					$("#finca").val(finca.nombre_finca);
					$("#telefono").val(finca.telefono);
					$("#direccion").val(finca.direccion);	
					
					document.getElementById("nropropietario").select();
					document.getElementById("nropropietario").focus();
					action = "Actualizar";
					$("#submit").val(action);
				}				
			}
		})		
	});
    var action = "Registrar";
    $("#submit").val(action);
    $("#submit").on("click",function()
    {
        if(ValidarFinca())
        {
            if(action=="Registrar")
            {   
				var alertaU = document.getElementById("alert");
				var mensajeU = document.getElementById("mensaje");
				var strong = document.getElementById('strong')

                var nropropietario 	= document.getElementById("nropropietario").value;
                var propietario 	= document.getElementById("propietario").value;
                var nrofinca 		= document.getElementById("nrofinca").value;
                var finca 			= document.getElementById("finca").value;
                var telefono 		= document.getElementById("telefono").value;
                var direccion 		= document.getElementById("direccion").value;				
                $.ajax({
                    url:'../../controlador/CtrlFinca.php',
                    method:'POST',
                    data:{action:action,nropropietario:nropropietario,propietario:propietario,nrofinca:nrofinca,finca:finca,telefono:telefono,direccion:direccion},
                    success:function(respuesta)
                    {						
                        if (respuesta==1) 
						{
							Buscar_mostrar_finca("");
							alertaU.style.display = "block";
							alertaU.style.backgroundColor="#41955D";
							strong.innerHTML = "Éxito!";
							mensajeU.innerHTML = "Nueva Finca registrada.";
							document.getElementById('frmFinca').reset();
							document.getElementById('nropropietario').focus();
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
				var idfinca 		= document.getElementById("idfinca").value;
                var nropropietario 	= document.getElementById("nropropietario").value;
                var propietario 	= document.getElementById("propietario").value;
                var nrofinca 		= document.getElementById("nrofinca").value;
                var finca 			= document.getElementById("finca").value;
                var telefono 		= document.getElementById("telefono").value;
                var direccion 		= document.getElementById("direccion").value;				
                $.ajax({
                    url:'../../controlador/CtrlFinca.php',
                    method:'POST',
                    data:{action:action,idfinca:idfinca,nropropietario:nropropietario,propietario:propietario,nrofinca:nrofinca,finca:finca,telefono:telefono,direccion:direccion},
                    success:function(respuesta)
                    {						
                        if (respuesta==1) 
						{
							Buscar_mostrar_finca("");
							action = "Registrar";
							$("#submit").val(action);
							alertaU.style.display = "block";
							alertaU.style.backgroundColor="#41955D";
							strong.innerHTML = "Éxito!";
							mensajeU.innerHTML = "Datos de finca actualizados.";
							document.getElementById('frmFinca').reset();
							document.getElementById('nropropietario').focus();
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
        }
    });
});
function ValidarFinca()
{
    var alertaU  = document.getElementById("alert");
	var mensajeU = document.getElementById("mensaje");
	var strong   = document.getElementById('strong')

	var nropropietario = document.getElementById("nropropietario");
	var propietario = document.getElementById("propietario");
    var nrofinca = document.getElementById("nrofinca");
	var finca = document.getElementById("finca");
	var telefono = document.getElementById("telefono");
	var direccion = document.getElementById("direccion");
	
	if (nropropietario.value=="") 
	{	
		nropropietario.style.borderColor = "#f44336";
		setTimeout(function() { 
			nropropietario.style.borderColor = "#ddd";
		}, 4000);
		document.frmFinca.nropropietario.focus();
		alertaU.style.display = "block";
		alertaU.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensajeU.innerHTML = "Ingrese número propietario";
		return false;
	}	
    if (propietario.value=="") 
	{
		propietario.style.borderColor = "#f44336";
		setTimeout(function() { 
			propietario.style.borderColor = "#ddd";
		}, 4000);		
		document.frmFinca.propietario.focus();
		alertaU.style.display = "block";
		alertaU.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensajeU.innerHTML = "Ingrese nombre de propietario";
		return false;
	}
	if (nrofinca.value=="") 
	{
		nrofinca.style.borderColor = "#f44336";
		setTimeout(function() { 
			nrofinca.style.borderColor = "#ddd";
		}, 4000);
		document.frmFinca.nrofinca.focus();
		alertaU.style.display = "block";
		alertaU.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensajeU.innerHTML = "Ingrese n´numero de finca.";
		return false;
	}
	if (finca.value=="") 
	{
		finca.style.borderColor = "#f44336";
		setTimeout(function() { 
			finca.style.borderColor = "#ddd";
		}, 4000);
		document.frmFinca.finca.focus();
		alertaU.style.display = "block";
		alertaU.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensajeU.innerHTML = "Ingrese nombre de la finca";
		return false;
	}
    if (telefono.value=="") 
	{
		telefono.style.borderColor = "#f44336";
		setTimeout(function() { 
			telefono.style.borderColor = "#ddd";
		}, 4000);
		document.frmFinca.telefono.focus();
		alertaU.style.display = "block";
		alertaU.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensajeU.innerHTML = "Ingrese número de teléfono.";
		return false;
	}
	if (direccion.value=="") 
	{
		direccion.style.borderColor = "#f44336";
		setTimeout(function() { 
			direccion.style.borderColor = "#ddd";
		}, 4000);
		document.frmFinca.direccion.focus();
		alertaU.style.display = "block";
		alertaU.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensajeU.innerHTML = "Ingrese direccion";
		return false;
	}	
	return true;

}