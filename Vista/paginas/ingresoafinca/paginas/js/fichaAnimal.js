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
$(document).ready(function()
{
    BuscarTratamientos("");
    var action = "";
    function BuscarTratamientos(valor)
    {
        $.ajax({
            url: '../../../../Controlador/CtrlFichaAnimal.php',
            type: 'POST',
            data: {action:'Buscar_mostrar_tratamientos',valor:valor},
            success:function(respuesta)
            {                                
                if(respuesta!=0){
                    $('#tratamientos').html(respuesta);
                }
            }
        });
    } 
    $('.servicio').hide();
    $('.parto').hide();
    $('.enfermedad').hide();
    $('.participante').hide();
    $(document).on('click','#cerrar',function(){
        document.getElementById('frmFicha').reset();
        $('.servicio').hide();
        $('.parto').hide();
        $('.enfermedad').hide();
        action="Registrar";
        $("#submit").text(action);
    });
    $(document).on('click','#btn-ficha',function(){
        $("#exampleModalLongTitle").text("REGISTRAR EVENTO");
		document.getElementById("fecha").focus();
		document.getElementById('frmFicha').reset();
        action="Registrar";
        $("#submit").text(action);
    });
    $(document).on('keyup','#clave',function(e){
        var valor = $($(this)).val();		
		$.ajax({
			url	: "../../../../Controlador/CtrlFichaAnimal.php",
			type: 'POST',
			data: {action:'evento',clave:valor},
			success:function(respuesta)
			{                 
                var evento = $.parseJSON(respuesta);
				if(respuesta!=0)
                {
                    var evento = $.parseJSON(respuesta);
                    $('#idEvento').val(evento.idEvento);
                    document.frmTratamiento.EventoID.value=evento.idEvento;
                    $("#nombre_evento").text(evento.descripcion);                                                      
                }
                else
                {                    
                    $('.servicio').hide();
                    $('.parto').hide();
                    $('.enfermedad').hide();
                    $('.participante').hide();
                }
                var keycode = e.keyCode || e.which;
                if(keycode == 13)
                {
                    if(evento.clave == "+")
                    {
                        $('#evento').text(evento.descripcion);
                        $('.servicio').show();
                        $('.participante').show();
                        $('.enfermedad').show();
                        action = "Cruzamiento";
                    }
                    if(evento.clave == 'P')
                    {
                        $('#evento').text(evento.descripcion);
                        $('.parto').show();
                        $('.enfermedad').show();
                        $('.participante').show();                      
                        action = "Parto";
                    }else{
                    if(evento.clave!='P' && evento.clave!='+')
                    {
                        $('#evento').text(evento.descripcion);
                        $('.enfermedad').show();
                        $('.participante').show();
                        action = "Tratamiento";
                    }}
                }
			}
		});		
    });  
    $(document) .on('keyup','#buscartoro',function(e){
        var valor = $($(this)).val();
        $.ajax({
            url:'../../../../Controlador/CtrlFichaAnimal.php',
            type:'POST',
            data: {action:'toro',hba:valor},
            success:function(respuesta)
            {                
                var toro = $.parseJSON(respuesta);
                if(respuesta!=0)
                {
                    $('#idReproductor').val(toro.idReproductor);
                    $('#toro').val(toro.nombre);
                }
                else{
                    $('#toro').val(respuesta);
                }
            }
        });
    });
    $(document) .on('keyup','#buscarnrotratamiento',function(e){
        var valor = $($(this)).val();
        $.ajax({
            url:'../../../../Controlador/CtrlFichaAnimal.php',
            type:'POST',
            data: {action:'BuscarTratamiento_nro',nrotratamiento:valor},
            success:function(respuesta)
            {                 
                var tratamiento = $.parseJSON(respuesta);
                if(respuesta!=0)
                {
                    $('#TratamientoID').val(tratamiento.idTratamiento);
                    $('#tratamiento').val(tratamiento.descripcion);
                }
                else{
                    $('#tratamiento').text(respuesta);
                }
            }
        });
    });
    $(document) .on('keyup','#buscarparticipante',function(e){
        var valor = $($(this)).val();
        $.ajax({
            url:'../../../../Controlador/CtrlFichaAnimal.php',
            type:'POST',
            data: {action:'buscarparticipante',valor:valor},
            success:function(respuesta)
            {                
                var participante = $.parseJSON(respuesta);
                if(respuesta!=0)
                {
                    $('#idParticipante').val(participante.idParticipante);
                    $('#nombreparticipante').val(participante.descripcion);
                }
                else{
                    $('#nombreparticipante').val(respuesta);
                }
            }
        });
    });
    $(document).on('click','#registrar-participante',function(){
        if(validarParticipante())
        {
            var alerta = document.getElementById("alert2");
            var mensaje = document.getElementById("mensaje");
            var strong = document.getElementById('strong');

            var nroparticipante = document.frmParticipante.nroparticipante.value;
            var descripcion = document.frmParticipante.descripcion.value;

            $.ajax({
                url:'../../../../Controlador/CtrlFichaAnimal.php',
                type:'POST',
                data: {action:'agregarparticipante',nroparticipante:nroparticipante,descripcion:descripcion},
                success:function(respuesta)
                {                    
                    if (respuesta==1)
					{
						//BuscarMostrarAnimales("");
						alerta.style.display = "block";
						alerta.style.backgroundColor="#41955D";
						strong.innerHTML = "Éxito!";
						mensaje.innerHTML = "Animal registrado.";
						document.getElementById('frmParticipante').reset();
						document.getElementById('frmParticipante').focus();
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
    });    
    $(document).on('click','#registrar-tratamiento',function(){
        if(validarTratamiento())
        {
            var alerta = document.getElementById("alert2");
            var mensaje = document.getElementById("mensaje");
            var strong = document.getElementById('strong');

            var nrotratamiento  = document.frmTratamiento.nrotratamiento.value;
            var descripcion     = document.frmTratamiento.descripciont.value;            

            $.ajax({
                url:'../../../../Controlador/CtrlFichaAnimal.php',
                type:'POST',
                data: {action:'agregartratamiento',nrotratamiento:nrotratamiento,descripcion:descripcion},
                success:function(respuesta)
                {                     
                    if (respuesta==1)
					{
						BuscarTratamientos("");
						alerta.style.display = "block";
						alerta.style.backgroundColor="#41955D";
						strong.innerHTML = "Éxito!";
						mensaje.innerHTML = "Tratamiento registrado.";
						document.getElementById('frmTratamiento').reset();
						document.getElementById('frmTratamiento').focus();
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
    });
    MostrarHistoriaAnimal();
    function MostrarHistoriaAnimal()
    {
        $.ajax({
            url	: "../../../../Controlador/CtrlFichaAnimal.php",
            type: 'POST',
            data: {action:'MostrarHistoriaAnimal'},
            success:function(respuesta)
            {  						            
                if(respuesta!=0){
                    $('#eventos').html(respuesta);
                }
            }
        });
    }
    $(document).on('click','#submit',function(){        
        if(action=="Cruzamiento")
        {
            if(ValidarCruzamiento())
            {
                var alerta = document.getElementById("alert");
                var mensaje = document.getElementById("mensaje");
                var strong = document.getElementById('strong');

                var fecha = document.getElementById('fecha').value;
                var idEvento = document.getElementById('idEvento').value;
                var ReproductorID = document.getElementById('idReproductor').value;
                var TratamientoID = document.getElementById('TratamientoID').value;
                var ParticipanteID = document.getElementById('idParticipante').value;

                $.ajax(
                {
                    url:'../../../../Controlador/CtrlFichaAnimal.php',
                    type:'POST',
                    data: {action:'RegistrarHistoria',fecha:fecha,idEvento:idEvento,TratamientoID:TratamientoID,ParticipanteID:ParticipanteID,ReproductorID:ReproductorID},
                    success:function(respuesta)
                    {                        
                        if (respuesta==1)
                        {
                            MostrarHistoriaAnimal();
                            alerta.style.display = "block";
                            alerta.style.backgroundColor="#41955D";
                            strong.innerHTML = "Éxito!";
                            mensaje.innerHTML = "Servicio registrado.";
                            document.getElementById('frmFicha').reset();
                            document.getElementById('fecha').focus();
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
        if(action=="Parto")
        {
            if(ValidarParto())
            {
                var alerta = document.getElementById("alert");
                var mensaje = document.getElementById("mensaje");
                var strong = document.getElementById('strong');

                var fecha           = document.getElementById('fecha').value;
                var idEvento        = document.getElementById('idEvento').value;
                var TratamientoID   = document.getElementById('TratamientoID').value;
                var ParticipanteID  = document.getElementById('idParticipante').value;
                var nroparto        = document.getElementById('numeroparto').value;
                var tipoparto       = document.getElementById('tipoparto').selectedIndex;
                var sexo            = document.getElementById('sexo').selectedIndex;
                var chbcria         = document.getElementById('chbcria').value;
                var peso            = document.getElementById('peso').value;
                
                $.ajax(
                    {
                        url:'../../../../Controlador/CtrlFichaAnimal.php',
                        type:'POST',
                        data: {action:'RegistrarParto',fecha:fecha,idEvento:idEvento,TratamientoID:TratamientoID,ParticipanteID:ParticipanteID,nroparto:nroparto,tipoparto:tipoparto,sexo:sexo,chbcria:chbcria,peso:peso},
                        success:function(respuesta)
                        { 
                            console.log(respuesta);                       
                            if (respuesta==1)
                            {
                                MostrarHistoriaAnimal();
                                alerta.style.display = "block";
                                alerta.style.backgroundColor="#41955D";
                                strong.innerHTML = "Éxito!";
                                mensaje.innerHTML = "Parto registrado.";
                                document.getElementById('frmFicha').reset();
                                document.getElementById('fecha').focus();
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
        if(action=="Tratamiento")
        {
            var alerta = document.getElementById("alert");
            var mensaje = document.getElementById("mensaje");
            var strong = document.getElementById('strong');

            var fecha = document.getElementById('fecha').value;
            var idEvento = document.getElementById('idEvento').value;
            var ReproductorID = document.getElementById('idReproductor').value;
            var TratamientoID = document.getElementById('TratamientoID').value;
            var ParticipanteID = document.getElementById('idParticipante').value;

            $.ajax(
            {
                url:'../../../../Controlador/CtrlFichaAnimal.php',
                type:'POST',
                data: {action:'RegistrarTratamiento',fecha:fecha,idEvento:idEvento,TratamientoID:TratamientoID,ParticipanteID:ParticipanteID},
                success:function(respuesta)
                {   
                    console.log(respuesta);                     
                    if (respuesta==1)
                    {
                        MostrarHistoriaAnimal();
                        alerta.style.display = "block";
                        alerta.style.backgroundColor="#41955D";
                        strong.innerHTML = "Éxito!";
                        mensaje.innerHTML = "Servicio registrado.";
                        document.getElementById('frmFicha').reset();
                        document.getElementById('fecha').focus();
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
    });
});
function ValidarCruzamiento()
{
    var alerta = document.getElementById("alert");
	var mensaje = document.getElementById("mensaje");
	var strong = document.getElementById('strong');

    var fecha = document.getElementById('fecha').value;
    var idReproductor = document.getElementById('idReproductor').value;
    var idParticipante = document.getElementById('idParticipante').value;
    
    if(fecha=="")
    {
        document.getElementById('fecha').focus();
		alerta.style.display = "block";
		alerta.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Ingrese fecha de evento a registrar.";
		return false;
    }
    if(idReproductor=="")
    {
        document.getElementById('buscartoro').focus();
		alerta.style.display = "block";
		alerta.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Buscar reproductor.";
		return false;
    }
    if(idParticipante=="")
    {
        document.getElementById('buscarparticipante').focus();
		alerta.style.display = "block";
		alerta.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Buscar Participante.";
		return false;
    }
    return true;
}
function ValidarParto()
{
    var alerta = document.getElementById("alert");
	var mensaje = document.getElementById("mensaje");
	var strong = document.getElementById('strong');

    var fecha           = document.getElementById('fecha').value;
    var nroparto        = document.getElementById('numeroparto').value;
    var tipoparto       = document.getElementById('tipoparto').selectedIndex;
    var sexo            = document.getElementById('sexo').selectedIndex;
    var chbcria         = document.getElementById('chbcria').value;
    var peso            = document.getElementById('peso').value;
    var idParticipante  = document.getElementById('idParticipante').value;

    if(fecha=="")
    {
        document.getElementById('fecha').focus();
		alerta.style.display = "block";
		alerta.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Ingrese fecha de evento a registrar.";
        return false;
    }
    if(nroparto=="")
    {
        document.getElementById('numeroparto').focus();
		alerta.style.display = "block";
		alerta.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Ingrese n'umero de parto.";
        return false;
    }
    if(tipoparto=="")
    {
        document.getElementById('tipoparto').focus();
		alerta.style.display = "block";
		alerta.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Seleccione tipo de parto";
        return false;
    }
    if(sexo=="")
    {
        document.getElementById('sexo').focus();
		alerta.style.display = "block";
		alerta.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Seleccione sexo de cria.";
        return false;
    }
    if(chbcria=="")
    {
        document.getElementById('chbcria').focus();
		alerta.style.display = "block";
		alerta.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Ingrese codigo chb de cria.";
        return false;
    }
    if(peso=="")
    {
        document.getElementById('peso').focus();
		alerta.style.display = "block";
		alerta.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Ingrese peso de cria al nacer o cero.";
        return false;
    }
    if(idParticipante=="")
    {
        document.getElementById('buscarparticipante').focus();
		alerta.style.display = "block";
		alerta.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Buscar el participante.";
        return false;
    }
    return true;
}
function ValidarFicha()
{
    var alerta = document.getElementById("alert");
	var mensaje = document.getElementById("mensaje");
	var strong = document.getElementById('strong');

    var fecha = document.getElementById('fecha').values;

    if(fecha=="")
    {
        document.getElementById('fecha').focus();
		alerta.style.display = "block";
		alerta.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Ingrese fecha de evento a registrar.";
		return false;
    }
    return true;
}
function validarTratamiento()
{
    var alerta = document.getElementById("alert3");
	var mensaje = document.getElementById("mensaje3");
	var strong = document.getElementById('strong');

    var nrotratamiento = document.frmTratamiento.nrotratamiento.value;
    var descripcion = document.frmTratamiento.descripciont.value;
    if(nrotratamiento=="")
    {
        document.getElementById('nroparticipante').focus();
		alerta.style.display = "block";
		alerta.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Ingrese número de tratamiento.";
		return false;
    }
    if(descripcion=="")
    {
        document.getElementById('descripcion').focus();
		alerta.style.display = "block";
		alerta.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Ingrese tratamiento.";
		return false;
    }
    return true;
}
function validarParticipante()
{
    var alerta = document.getElementById("alert2");
	var mensaje = document.getElementById("mensaje2");
	var strong = document.getElementById('strong');

    var nroparticipante = document.frmParticipante.nroparticipante.value;
    var descripcion = document.frmParticipante.descripcion.value;
    if(nroparticipante=="")
    {
        document.getElementById('nroparticipante').focus();
		alerta.style.display = "block";
		alerta.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Ingrese número participante.";
		return false;
    }
    if(descripcion=="")
    {
        document.getElementById('descripcion').focus();
		alerta.style.display = "block";
		alerta.style.backgroundColor=" #f44336";
		strong.innerHTML = "Error!";
		mensaje.innerHTML = "Ingrese nombre de participante.";
		return false;
    }
    return true;
}