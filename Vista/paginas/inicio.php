<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="stylesheet" href="libreria/bootstrap/css/w3.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <title>Dashboard</title>
</head>
<body>
    <div class="w3-container">
        <h2 class="w3-center">Asociacion de Criadores Holando Boliviano</h2>
    <div class="w3-content w3-display-container">
    <img class="mySlides" src="images/banner.png" style="width:100%">
    <img class="mySlides" src="images/banner.png" style="width:100%">
    <button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
    <button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
    </div>
    <script>
    var slideIndex = 1;
    showDivs(slideIndex);

    function plusDivs(n) {
    showDivs(slideIndex += n);
    }
    function showDivs(n) {
    var i;
    var x = document.getElementsByClassName("mySlides");
    if (n > x.length) {slideIndex = 1}
    if (n < 1) {slideIndex = x.length}
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";  
    }
    x[slideIndex-1].style.display = "block";  
    }
    </script>
    <h2 class="w3-center"><p id="totales"></p></h2>
    <div class="w3-row">          
            <div class="w3-quarter">
                    <div class="w3-container">
                        <h2>Vacas</h2>            
                        <img src="images/VACA.png" class="w3-border" alt="Norway" style="padding:4px;width:80%">                       
                    </div>
                    <div class="w3-container w3-center"><p id="vacas"></p>
                </div>        
                </div>
                <div class="w3-quarter">
                    <div class="w3-container">
                        <h2>Vaquillonas</h2>            
                        <img src="images/VAQUILLONAS.png" class="w3-border" alt="Norway" style="padding:4px;width:80%">                       
                    </div>
                <div class="w3-container w3-center"><p id="vaquillonas"></p></div>
                
                </div>
                <div class="w3-quarter">
                    <div class="w3-container">
                        <h2>Vaquillas</h2>            
                        <img src="images/VAQUILLAS.png" class="w3-border" alt="Norway" style="padding:4px;width:80%">                       
                    </div>
                <div class="w3-container w3-center"><p id="vaquillas"></p></div>
                
                </div>
                <div class="w3-quarter">
                    <div class="w3-container" style="text-align: center;">
                        <h2>Terneras</h2>            
                        <img src="images/TERNERAS.png" class="w3-border" alt="Norway" style="padding:4px;width:80%">                       
                    </div>
                <div class="w3-container w3-center w3-theme-indigo"><p id="terneras"></p></div>
                
                </div>
            </div>
        </div>
    </div>   
    <script src="libreria/jquery/jquery.js"></script>
    <script src="libreria/bootstrap/js/bootstrap.min.js"></script>
    <script src="js/inicio.js"></script>
</body>
</html>