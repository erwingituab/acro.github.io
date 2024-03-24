<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="stylesheet" href="librerias/bootstrap/css/w3.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <title>Dashboard</title>
</head>
<body>
    <div class="container">
   
    <div class="w3-panel w3-light-grey w3-border w3-round">
        <p><?php echo $finca;?></p>
        <h2 class="w3-center" id="totales"></h2>    
    </div>    
        <div class="w3-container">       
    <div class="w3-row">            
        <div class="w3-quarter">            
            <div class="w3-container">
                <h2>Vacas</h2>            
                <img src="images/VACA.png" class="w3-border" alt="Norway" style="padding:16px;width:100%">                       
            </div>            
            <div class="w3-container w3-center w3-theme-indigo"><p id="vacas"></p>
        </div>        
        </div>
        <div class="w3-quarter">
            <div class="w3-container">
                <h2>Vaquillonas</h2>            
                <img src="images/VAQUILLONAS.png" class="w3-border" alt="Norway" style="padding:16px;width:100%">                       
            </div>
        <div class="w3-container w3-center w3-theme-indigo"><p id="vaquillonas"></p></div>
        
        </div>
        <div class="w3-quarter">
            <div class="w3-container">
                <h2>Vaquillas</h2>            
                <img src="images/VAQUILLAS.png" class="w3-border" alt="Norway" style="padding:4px;width:100%">                       
            </div>
        <div class="w3-container w3-center w3-theme-indigo"><p id="vaquillas"></p></div>
        
        </div>
        <div class="w3-quarter">
            <div class="w3-container" style="text-align: center;">
                <h2>Terneras</h2>            
                <img src="images/TERNERAS.png" class="w3-border" alt="Norway" style="padding:4px;width:100%">                       
            </div>
        <div class="w3-container w3-center w3-theme-indigo"><p id="terneras"></p></div>               
        </div>
        
    </div>
    </div>
    </div> 
    </div>   
    <script src="librerias/jquery/jquery.js"></script>
    <script src="librerias/bootstrap/js/bootstrap.min.js"></script>
    <script src="js/dashboard.js"></script>
</body>
</html>