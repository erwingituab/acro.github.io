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
	$(document).on('keyup','#buscarusuario',function()
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
});