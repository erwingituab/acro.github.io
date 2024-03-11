$(document).ready(function(event){
    Buscar_mostrar_finca_habilitada("");
	function Buscar_mostrar_finca_habilitada(valor)
	{		
		$.ajax({
			url: '../../controlador/CtrlFinca.php',
			type: 'POST',
			data: {action:'Buscar_mostrar_finca_habilitada',valor:valor},
			success:function(respuesta)
			{				
				if(respuesta!=0){
					$('#fincas').html(respuesta);
				}
			}
		});
	}
	$(document).on('keyup','#buscarfinca',function()
	{
		var valor = $($(this)).val();
		if (valor != "") 
		{
			Buscar_mostrar_finca_habilitada(valor);
		}
		else
		{
			Buscar_mostrar_finca_habilitada("");
		}
	});
	$(document).on('click','.ingresar',function(){		
		var idFinca = $(this).attr("id");		
		$.ajax({
			url:"../../controlador/CtrlFinca.php",
			type:"POST",
			data:{action:'IngresoaFinca',idFinca:idFinca},
			success:function(sms)
			{				
				if (sms==1) 
				{
					if(window.history.replaceState)
					{
						window.history.replaceState(null, null, window.location.href);
					}
					window.location.href="ingresoafinca/paginas/";
				}
				else
				{
					console.log('Error ingreso finca.');
				}
			}
		})
	});
});