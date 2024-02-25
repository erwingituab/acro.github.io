document.getElementById("buscarevento").focus();
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
$(function(){
    $('.input').keyup(function(e) 
    {
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
            var clave = document.getElementById('clave');
            var descripcion = document.getElementById('descripcion');
            var tipoevento = document.getElementById('tipoevento');            
            if (clave.value=='')  		
            {
                ci.focus();
                return;
            }
            if (descripcion.value=='') 
            {
                tipoevento.focus();
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
    var action = "";
    $(document).on('click','#btnmodal',function(){
        $("#exampleModalLongTitle").text("Registrar Evento");
        action="Registrar";
        $("#submit").text(action);
    });
    $(document).on('click','#btnclose',function(){
        document.getElementById('frmEvento').reset();
        $("#exampleModalLongTitle").text("Registrar Evento");
        action="Registrar";
    });    
    $(document).on('click','#submit',function(){       
        if(action=="Registrar")
        {
            if(ValidarEvento())
            {
                var alert 	= document.getElementById("alert");
				var mensaje = document.getElementById("mensaje");
				var strong 	= document.getElementById('strong')

                var clave       = document.frmEvento.clave.value;
                var descripcion = document.frmEvento.descripcion.value;
                var tipoevento  = document.frmEvento.tipoevento.selectedIndex;
                $.ajax({
					url:"../../Controlador/CtrlEvento.php",
					method:"POST",
					data:{action:action,clave:clave,descripcion:descripcion,tipoevento:tipoevento},
					success:function(respuesta)
					{	                        
						if (respuesta==1) 
						{
							Buscar_mostrar_evento("");
							alert.style.display = "block";
							alert.style.backgroundColor="#41955D";
							strong.innerHTML = "Éxito!";
							mensaje.innerHTML = "Evento registrado.";
							document.getElementById('frmEvento').reset();
							document.getElementById('clave').focus();
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
        if(action=="Actualizar")
        {
            if(ValidarEvento())
            {
                var alert 	= document.getElementById("alert");
				var mensaje = document.getElementById("mensaje");
				var strong 	= document.getElementById('strong')

                var idEvento    = document.frmEvento.idEvento.value;
                var clave       = document.frmEvento.clave.value;
                var descripcion = document.frmEvento.descripcion.value;
                var tipoevento  = document.frmEvento.tipoevento.selectedIndex;
                $.ajax({
					url:"../../Controlador/CtrlEvento.php",
					method:"POST",
					data:{action:action,idEvento:idEvento,clave:clave,descripcion:descripcion,tipoevento:tipoevento},
					success:function(respuesta)
					{	
                        console.log(respuesta);                        
						if (respuesta==1) 
						{
							Buscar_mostrar_evento("");
							alert.style.display = "block";
							alert.style.backgroundColor="#41955D";
							strong.innerHTML = "Éxito!";
							mensaje.innerHTML = "Evento actualizado.";
							document.getElementById('frmEvento').reset();
							document.getElementById('clave').focus();
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
    $(document).on('click','.update',function(){
        $("#exampleModalLongTitle").text("Actualizar Evento");
        var idEvento = $(this).attr("id");
        $.ajax({
			url: '../../controlador/CtrlEvento.php',
			type: 'POST',
			data:{action:'Mostrar_datos_evento',idEvento:idEvento},
			success:function(respuesta)
			{                 					
				if (respuesta!=0) 
				{
					var evento = $.parseJSON(respuesta);
					$("#idEvento").val(evento.idEvento);
					$("#clave").val(evento.clave);
                    $("#descripcion").val(evento.descripcion);
                    $("#tipoevento").val(evento.tipoevento).selectedIndex;
					document.getElementById("clave").select();
					document.getElementById("clave").focus();
					action = "Actualizar";
					$("#submit").text(action);
				}				
			}
		})	
    });
    $(document).on('click','.delete',function(){
        var idEvento = $(this).attr("id");
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
					url: '../../Controlador/CtrlEvento.php',
					type: 'POST',
					data:{action:'Eliminar',idEvento:idEvento},
					success:function(respuesta)
					{
						console.log(respuesta);				
						if (respuesta!=0) 
						{						
							document.getElementById("buscarevento").focus();
							action = "Registrar";
							$("#submit").val(action);
							Buscar_mostrar_evento("");
						}else{
							console.log(respuesta);
						}				
					}
				});
			swalWithBootstrapButtons.fire({
				title: "Eliminado!",
				text: "El evento a sido eliminado.",
				icon: "success"				
			});
			} else if (
			  /* Read more about handling dismissals below */
			result.dismiss === Swal.DismissReason.cancel
			) 
            {
			swalWithBootstrapButtons.fire({
				title: "Cancelado",
				text: "El evento esta a salvo. :)",
				icon: "error"
			});
			}
		});
    });
    $(document).on('keyup','#buscarevento',function()
	{
		var valor = $($(this)).val();
		if (valor != "") 
		{
			Buscar_mostrar_evento(valor);
		}
		else
		{
			Buscar_mostrar_evento("");
		}
	});
    Buscar_mostrar_evento("");
    function Buscar_mostrar_evento(valor)
    {
        $.ajax({
            url: '../../controlador/CtrlEvento.php',
            type: 'POST',
            data: {action:'Buscar_mostrar_evento',valor:valor},
            success:function(respuesta)
            {                
                if(respuesta!=0){
                    $('#eventos').html(respuesta);
                }
            }
        });
    }    
});
function ValidarEvento()
{
    var alert 	= document.getElementById("alert");
	var mensaje = document.getElementById("mensaje");
	var strong 	= document.getElementById('strong')

    var clave = document.frmEvento.clave.value;
    var descripcion = document.frmEvento.descripcion.value;
    var tipoevento = document.frmEvento.tipoevento.selectedIndex;
    if(clave == "")
    {
        document.frmEvento.clave.focus();
		alert.style.display = "block";
		alert.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Ingrese clave del evento.";
		return false;
    }
    if(descripcion == "")
    {
        document.frmEvento.descripcion.focus();
		alert.style.display = "block";
		alert.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Ingrese una descripción.";
		return false;
    }
    if(tipoevento == "")
    {
        document.frmEvento.tipoevento.focus();
		alert.style.display = "block";
		alert.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Elija una opción.";
		return false;
    }
    return true;
}