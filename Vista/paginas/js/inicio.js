$(document).ready(function(){
    Dashboard();
    function Dashboard()
    {
        $.ajax({
            url	: "../../Controlador/CtrlDashboard.php",
            type: 'POST',
            data: {action:'DashboardInicio'},
            success:function(respuesta)
            {                  						            
                if (respuesta!=0) 
				{
					var Dashboard = $.parseJSON(respuesta);
					$("#terneras").text('CANTIDAD: '+Dashboard.terneras);
                    $("#vaquillas").text('CANTIDAD: '+Dashboard.vaquillas);
                    $("#vaquillonas").text('CANTIDAD: '+Dashboard.vaquillonas);
                    $("#vacas").text('CANTIDAD: '+Dashboard.vacas);
                    $("#totales").text('NUMERO TOTAL DE ANIMALES REGISTRADOS: '+Dashboard.totales);
				}
            }
        });
    }
});