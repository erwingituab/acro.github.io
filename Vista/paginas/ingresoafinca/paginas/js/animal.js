document.getElementById('buscaranimal').focus();
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
			var chb         = document.getElementById('chb').value;
            var fnacimiento = document.getElementById('fnacimiento').value;
            var nroregistro = document.getElementById('nroregistro').value;
            var categoria   = document.getElementById('categoria').value;
            var raza        = document.getElementById('raza').value;
            var nombre      = document.getElementById('nombre').value;
            var rp          = document.getElementById('rp').value;
            var chbmadre    = document.getElementById('chbmadre').value;
            var naabpadre   = document.getElementById('naabpadre').value;
			if (chb=='')  		
			{
				chb.focus();
				return;
			}
			if (fnacimiento=='') 
			{
				fnacimiento.focus();
				return;
			}
			if (nroregistro=='') 
			{
				nroregistro.focus();
				return;
			}
			if (categoria.selectedIndex=='') 
			{
				categoria.focus();
				return;
			}
			if (raza.selectedIndex=='') 
			{
				raza.focus();
				return;
			}
			if (nombre=='') 
			{
				nombre.focus();
				return;
			}
			if (rp==0) 
			{
				rp.focus();
				return;
			}
			if (chbmadre==0) 
			{
				chbmadre.focus();
				return;
			}
			if (naabpadre==0) 
			{
				naabpadre.focus();
				return;
			}
			else{
				document.getElementById('submit').focus();
				return;
			}
		}
	});
});
function mover(event, to) 
{
	let list = $('input');
	let index = list.index($(event.target));
	index = Math.max(0,index + to);
	list.eq(index).focus();
}
$(document).ready(function(){
	var action = '';
	$(document).on('click','#cerrar',function(){
		document.getElementById('frmAnimal').reset();
		document.getElementById('buscaranimal').focus();
	});    
	$(document).on('click','.agregar',function(){
		$('.modal-title').html('<img src="iconos/plus.svg" alt="">AGREGAR ANIMAL');
		action = "Registrar";		
    	$("#submit").val(action);
	});
    $(document).on('click','#submit',function()
	{
        if(ValidarAnimales())
        {
            if(action=="Registrar")
            {
                var alerta = document.getElementById("alert");
                var mensaje = document.getElementById("mensaje");
                var strong = document.getElementById('strong')

                var chb         = document.getElementById('chb').value;
                var fnacimiento = document.getElementById('fnacimiento').value;
                var nroregistro = document.getElementById('nroregistro').value;
                var categoria   = document.getElementById('categoria').value;
                var raza        = document.getElementById('raza').value;
                var nombre      = document.getElementById('nombre').value;
                var rp          = document.getElementById('rp').value;
                var chbmadre    = document.getElementById('chbmadre').value;
                var naabpadre   = document.getElementById('naabpadre').value;
                $.ajax({
					url:"../../../../Controlador/CtrlAnimal.php",
					method:"POST",
					data:{action:action,chb:chb,fnacimiento:fnacimiento,nroregistro:nroregistro,categoria:categoria,raza:raza,nombre:nombre,rp:rp,chbmadre:chbmadre,naabpadre:naabpadre},
					success:function(respuesta)
					{                        							
						if (respuesta==1) 
						{
							BuscarMostrarAnimales("");
							alerta.style.display = "block";
							alerta.style.backgroundColor="#41955D";
							strong.innerHTML = "Éxito!";
							mensaje.innerHTML = "Animal registrado.";
							document.getElementById('frmAnimal').reset();
							document.getElementById('chb').focus();
							setTimeout(function() { 
								alerta.style.display = "none";	
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
				var alerta = document.getElementById("alert");
                var mensaje = document.getElementById("mensaje");
                var strong = document.getElementById('strong')
				var idAnimal 	= document.getElementById('idAnimal').value;
                var chb         = document.getElementById('chb').value;
                var fnacimiento = document.getElementById('fnacimiento').value;
                var nroregistro = document.getElementById('nroregistro').value;
                var categoria   = document.getElementById('categoria').value;
                var raza        = document.getElementById('raza').value;
                var nombre      = document.getElementById('nombre').value;
                var rp          = document.getElementById('rp').value;
                var chbmadre    = document.getElementById('chbmadre').value;
                var naabpadre   = document.getElementById('naabpadre').value;
                $.ajax({
					url:"../../../../Controlador/CtrlAnimal.php",
					method:"POST",
					data:{action:action,idAnimal:idAnimal,chb:chb,fnacimiento:fnacimiento,nroregistro:nroregistro,categoria:categoria,raza:raza,nombre:nombre,rp:rp,chbmadre:chbmadre,naabpadre:naabpadre},
					success:function(respuesta)
					{  
						console.log(respuesta);                      							
						if (respuesta==1) 
						{
							BuscarMostrarAnimales("");
							alerta.style.display = "block";
							alerta.style.backgroundColor="#41955D";
							strong.innerHTML = "Éxito!";
							mensaje.innerHTML = "Datos actualizados.";
							document.getElementById('frmAnimal').reset();
							document.getElementById('chb').focus();
							setTimeout(function() { 
								alerta.style.display = "none";	
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
	$(document).on('click','.delete',function(){
		var idAnimal = $(this).attr("id");
		const swalWithBootstrapButtons = Swal.mixin({
			customClass: 
            {
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
					url: '../../../../Controlador/CtrlAnimal.php',
					type: 'POST',
					data:{action:'Eliminar',idAnimal:idAnimal},
					success:function(respuesta)
					{										
						if (respuesta!=0) 
						{						
							document.getElementById("buscaranimal").focus();
							action = "Registrar";
							$("#submit").val(action);
							BuscarMostrarAnimales("");
						}else{
							console.log(respuesta);
						}				
					}
				});
			swalWithBootstrapButtons.fire({
				title: "Eliminado!",
				text: "El animal a sido eliminado.",
				icon: "success"				
			});
			} else if (
			  /* Read more about handling dismissals below */
			result.dismiss === Swal.DismissReason.cancel
			) 
            {
			swalWithBootstrapButtons.fire({
				title: "Cancelado",
				text: "Datos del animal estan a salvo. :)",
				icon: "error"
			});
			}
		});
	});
	$(document).on('keyup','#buscaranimal',function(e)
	{
		var valor = $($(this)).val();
		if (valor != "") 
		{
			BuscarMostrarAnimales(valor);
		}
		else
		{
			BuscarMostrarAnimales("");
		}
		var keycode = e.keyCode || e.which;
		if (keycode == 13) 
		{
			$.ajax({
				url	: "../../../../Controlador/CtrlAnimal.php",
				type: 'POST',
				data: {action:'Mostrar_datos_animal_chb',chb:valor},
				success:function(respuesta)
				{  	
					if (respuesta==1) 
					{
						if(window.history.replaceState)
						{
							window.history.replaceState(null, null, window.location.href);
						}
						window.location.href="fichaanimal";
					}
					else
					{
						console.log('Error ingreso finca.');
					}
				}
			});
		}
	});
	$(document).on('click','.update',function()
	{
		$('.modal-title').html('<img src="iconos/editar.svg" alt="">MODIFICAR ANIMAL');
		document.getElementById("chb").select();
		document.getElementById("chb").focus();
		action = "Actualizar";
		$("#submit").val(action);		
		var idAnimal = $(this).attr("id");
		$.ajax({
            url	: "../../../../Controlador/CtrlAnimal.php",
            type: 'POST',
            data: {action:'Mostrar_datos_animal',idAnimal:idAnimal},
            success:function(respuesta)
            {  						            
                if (respuesta!=0) 
				{
					var animal = $.parseJSON(respuesta);
					$("#idAnimal").val(animal.idAnimal);
					$("#chb").val(animal.chb);
					$("#fnacimiento").val(animal.fecha_nacimiento);					
					$("#nroregistro").val(animal.nro_registro);
					$("#categoria").val(animal.categoria).selectedIndex;
					$("#raza").val(animal.raza).selectedIndex;					
					$("#nombre").val(animal.nombre);
					$("#rp").val(animal.rp);
					$("#chbmadre").val(animal.chbmadre);
					$("#naabpadre").val(animal.naabpadre);										
				}	
            }
        });
	});
	BuscarMostrarAnimales("");
	function BuscarMostrarAnimales(valor)
    {
        $.ajax({
            url	: "../../../../Controlador/CtrlAnimal.php",
            type: 'POST',
            data: {action:'BuscarMostrarAnimales',valor:valor},
            success:function(respuesta)
            {  						            
                if(respuesta!=0){
                    $('#animales').html(respuesta);
                }
            }
        });
    }  
});
function ValidarAnimales()
{
    var alerta = document.getElementById("alert");
	var mensaje = document.getElementById("mensaje");
	var strong = document.getElementById('strong')

    var chb         = document.getElementById('chb').value;
    var fnacimiento = document.getElementById('fnacimiento').value;
    var nroregistro = document.getElementById('nroregistro').value;
    var categoria   = document.getElementById('categoria').value;
    var raza        = document.getElementById('raza').value;
    var nombre      = document.getElementById('nombre').value;
    var rp          = document.getElementById('rp').value;
    var chbmadre    = document.getElementById('chbmadre').value;
    var naabpadre   = document.getElementById('naabpadre').value;
    if(chb == "")
    {
        document.getElementById('chb').focus();
		alerta.style.display = "block";
		alerta.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Ingrese codigo CHB.";
		return false;
    }
    if(fnacimiento == "")
    {
        document.getElementById('fnacimiento').focus();
		alerta.style.display = "block";
		alerta.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Ingrese fecha de nacimiento.";
		return false;
    }
    if(nroregistro == "")
    {
        document.getElementById('nroregistro').focus();
		alerta.style.display = "block";
		alerta.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Ingrese Nro Certificado de Nacimiento o valor Cero.";
		return false;
    }
    if(categoria == "")
    {
        document.getElementById('categoria').focus();
		alerta.style.display = "block";
		alerta.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Seleccione categoria del animal.";
		return false;
    }
    if(raza == "")
    {
        document.getElementById('raza').focus();
		alerta.style.display = "block";
		alerta.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Seleccione la raza del animal.";
		return false;
    }
    if(nombre == "")
    {
        document.getElementById('nombre').focus();
		alerta.style.display = "block";
		alerta.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Ingrese Nómbre del animal.";
		return false;
    }
    if(rp == "")
    {
        document.getElementById('rp').focus();
		alerta.style.display = "block";
		alerta.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Ingrese Nro de registro propio o valor Cero.";
		return false;
    }
    if(chbmadre == "")
    {
        document.getElementById('chbmadre').focus();
		alerta.style.display = "block";
		alerta.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Ingrese Nro CHB de madre o valor Cero.";
		return false;
    }
    if(naabpadre == "")
    {
        document.getElementById('naabpadre').focus();
		alerta.style.display = "block";
		alerta.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Ingrese codigo NAAB del padre o valor Cero.";
		return false;
    }
    return true;
}