$(document).ready(function(){
    Dashboard();
    function Dashboard()
    {
        $.ajax({
            url	: "../../../../Controlador/CtrlDashboard.php",
            type: 'POST',
            data: {action:'Dashboard'},
            success:function(respuesta)
            {                  						            
                if (respuesta!=0) 
				{
					var Dashboard = $.parseJSON(respuesta);
					$("#terneras").text(Dashboard.terneras);
                    $("#vaquillas").text(Dashboard.vaquillas);
                    $("#vaquillonas").text(Dashboard.vaquillonas);
                    $("#vacas").text(Dashboard.vacas);
                    $("#totales").text(Dashboard.totales);
				}
            }
        });
    }
});