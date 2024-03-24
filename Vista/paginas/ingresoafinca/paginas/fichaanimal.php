<?php
if($_SESSION['activeanimal']==true)
{
    $idAnimal   = $_SESSION['idFinca'];                
	$chb        = $_SESSION['chb'];
	$fnacimiento= $_SESSION['fnacimiento'];
	$nroregistro= $_SESSION['nroregistro'];
	$categoria  = '';
    if($_SESSION['categoria']==1)
    {
        $categoria = 'TA';
    }
    if($_SESSION['categoria']==2)
    {
        $categoria = 'TB';
    }
    if($_SESSION['categoria']==3)
    {
        $categoria = 'TC';
    }
    if($_SESSION['categoria']==4)
    {
        $categoria = 'PPC';
    }
    if($_SESSION['categoria']==5)
    {
        $categoria = 'PAPI';
    }
    if($_SESSION['categoria']==6)
    {
        $categoria = 'PAPII';
    }
    if($_SESSION['categoria']==7)
    {
        $categoria = 'PP';
    }
    $raza = '';
    if($_SESSION['raza']==1)
    {
        $raza = 'Cruzas';
    }
    if($_SESSION['raza']==2)
    {
        $raza = 'Holstein';
    }
    if($_SESSION['raza']==3)
    {
        $raza = 'Jersey';
    }
    if($_SESSION['raza']==4)
    {
        $raza = 'Pardo Suizo';
    }
    if($_SESSION['raza']==5)
    {
        $raza = 'Otras';
    }	
	$nombreanimal= $_SESSION['nombreanimal'];
    $rp         = $_SESSION['rp'];
    $chbmadre   = $_SESSION['chbmadre'];
    $naabpadre  = $_SESSION['naabpadre'] ;
    $estado = '';
    if($_SESSION['estado']==0)
    {
        $estado = 'Activa';
    }
    if($_SESSION['estado']==1)
    {
        $estado = 'Baja';
    }
}?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/fichaanimal.css">
    <title>Document</title>
</head>
<body>    
    <div class="container">
        <form>
            <div class="form-row">
                <div class="col">
                    <div class="form-group">
                        <fieldset><legend>Ficha clínica</legend></fieldset>
                    </div>
                </div>
            </div>
            <div class="form-row"> 
                <div class="col">
                    <div class="form-group">                    
                        <div class="campo"><?php echo'Estado: '. $estado; ?></div>
                    </div>
                </div>               
                <div class="col">                    
                    <div class="form-group">                    
                        <div class="campo"><?php echo'CHB: '. $chb; ?></div>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">                    
                        <div class="campo"><?php echo 'Nacimiento: '. $fnacimiento; ?></div>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">                    
                        <div class="campo"><?php echo'N° Registro: '. $nroregistro; ?></div>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">                    
                        <div class="campo"><?php echo'Categoría: '. $categoria; ?></div>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">                    
                        <div class="campo"><?php echo'Raza: '. $raza; ?></div>
                    </div>
                </div>     
            </div>
            <div class="form-row">                
                <div class="col">
                    <div class="form-group">                    
                        <div class="campo"><?php echo'Nombre: '. $nombreanimal; ?></div>
                    </div>
                </div>                              
                <div class="col">
                    <div class="form-group">                    
                        <div class="campo"><?php echo'RP: '. $rp; ?></div>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">                    
                        
                    </div>
                </div>                                      
            </div>
            <div class="form-row">
                <div class="col">
                    <div class="form-group">                    
                        <div class="campo"><?php echo'Madre: '. $chbmadre; ?></div>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">                    
                        <div class="campo"><?php echo'Padre: '. $naabpadre; ?></div>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">                    
                        
                    </div>
                </div>
            </div>
        </form>
        <div class="table">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">FECHA</th>                
                    <th scope="col">EVENTO</th>
                    <th scope="col">TRATAMIENTO</th>
                    <th scope="col">TIPO PARTO</th>
                    <th scope="col">PARTICIPANTE</th>
                    <th scope="col">REPRODUCTOR</th>
                    <th scope="col">OPCIÓN</th>      
                </tr>
            </thead>
            <tbody id="eventos"></tbody>
        </table>
        <!-- Button trigger modal -->
        <button type="button" class="agregar btn btn-primary" id="btn-ficha" data-toggle="modal" data-target=".bd-example-modal-lg"><img src="iconos/plus.svg" alt=""> Agregar</button>
        </div>  
    </div>
    <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content">    
        <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        </div>
        <div class="modal-body">
        <form id="frmFicha">
            <fieldset>
                <legend><?php echo 'VACA: '. $chb. ' ' .$nombreanimal;?></legend>
                <div class="form-row">
                    <div class="col-md-4 mb-3">
                        <label for="validationCustom01">FECHA</label>
                        <input type="hidden" id="idAnimal">
                        <input type="date" class="form-control" id="fecha" tabindex="1">                        
                    </div>                     
                    <div class="col-md-4 mb-3">
                        <label for="validationCustom01">EVENTO</label>
                        <input type="hidden" id="idEvento">
                        <input type="text" class="form-control" id="clave" placeholder="Seleccionar evento" tabindex="2">
                        <div class="valid-feedback">
                        Código CHB
                        </div>
                    </div> 
                    <div class="col-md-4 mb-3">
                        <label for="validationCustom01">TIPO EVENTO</label>
                        <input type="hidden" id="idEvento">
                        <p id='nombre_evento'></p>                        
                    </div>                 
                </div>                                                                  
            </fieldset>
            <div class="formularios">
                <div class="servicio">
                    <fieldset>
                        <legend>Evento <p id="evento"></p></legend>
                        <div class="form-row">
                            <div class="col-md-4 mb-3">
                                <label for="validationCustom01">BUSCAR REPRODUCTOR</label>                                
                                <input type="text" class="form-control" id="buscartoro" placeholder="ID REPRODUCTOR" tabindex="3">                                
                            </div>
                            <div class="col-md-8 mb-3">
                                <label for="validationCustom01">REPRODUCTOR</label>
                                <input type="hidden" id="idReproductor">
                                <input type="text" readonly="true" class="form-control" id="toro" placeholder="REPRODUCTOR">
                            </div>                            
                        </div>                        
                    </fieldset>                    
                </div>
                <!--evento parto-->
                <div class="parto">
                    <fieldset>
                        <legend>Evento <p id="evento"></p></legend>
                        <div class="form-row">
                            <div class="col-md-4 mb-3">
                                <label for="validationCustom01">NRO. PARTO</label>
                                <input type="text" class="form-control" id="numeroparto" placeholder="NRO. PARTO" tabindex="3">
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="validationCustom01">TIPO PARTO</label>
                                <select class="form-control" id="tipoparto" tabindex="4">
                                        <option value="" selected>Elija opción</option>
                                        <option value="1">Normal</option>
                                        <option value="2">Dif. Intensa</option>
                                        <option value="3">Dif. Leve</option>
                                        <option value="4">Cesarea</option>
                                    </select>
                            </div>                            
                        </div>
                        <div class="form-row">
                            <legend>Datos de la Cría</legend>
                            <div class="col-md-4 mb-3">
                                <label for="validationCustom01">SEXO</label>
                                <select class="form-control" id="sexo" tabindex="5">
                                        <option value="" selected>Elija opción</option>
                                        <option value="1">Hembra</option>
                                        <option value="2">Macho</option>
                                        <option value="3">Freemartin H/M</option>                                      
                                    </select>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="validationCustom01">CHB Cría</label>
                                <input type="text" class="form-control" id="chbcria" placeholder="CHB Cría" tabindex="6">
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="validationCustom01">Peso al Nacer</label>
                                <input type="text" class="form-control" id="peso" placeholder="Peso de Cría" tabindex="7">
                            </div>
                        </div>                                         
                </div>
                <div class="enfermedad">
                    <legend>Evento <p id="evento"></p></legend>
                    <div class="form-row">
                        <legend>Diagnóstico</legend>
                        <div class="col-md-4 mb-3">
                            <label for="validationCustom01">Número de Tratamiento</label>
                            <input type="text" class="form-control" id="buscarnrotratamiento" placeholder="Buscar Tratamiento" tabindex="3"><br>
                            <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#modaltratamiento"><img src="iconos/plus.svg" alt="">Tratamiento</button>
                        </div>
                        <div class="col-md-8 mb-3">
                            <label for="validationCustom01">Tratamiento/Diagnóstico</label>
                            <input type="hidden" id="TratamientoID">
                            <input type="text" readonly="true" class="form-control" id="tratamiento" placeholder="TRATAMIENTO">
                        </div>
                    </div> 
                </div>
                <div class="participante">
                    <legend>Participante</legend>
                    <div class="form-row">                            
                        <div class="col-md-4 mb-3">
                            <label for="validationCustom01">Buscar participante</label>
                            <input type="text" class="form-control" id="buscarparticipante" placeholder="Buscar Participante" tabindex="4"><br>
                            <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#modalparticipante"><img src="iconos/plus.svg" alt="">Participante</button>
                        </div>
                        <div class="col-md-8 mb-3">
                            <label for="validationCustom01">Participante</label>
                            <input type="hidden" id="idParticipante">
                            <input type="text" readonly="true" class="form-control" id="nombreparticipante" placeholder="Nómbre participante.">
                        </div>                            
                    </div>
                </div>
                </fieldset>
            </div> 
            <div class="alert" id="alert">
			<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
			<strong id="strong">Error!</strong><p id="mensaje" class="mensaje" ></p>
		</div>          
        </form>
        </div>
        <div class="modal-footer">
            <button type="button" id="cerrar" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            <input type="button" id="submit" class="btn btn-primary" value="Registrar" tabindex="5">
        </div>    
    </div>
    </div>
</div>
<script src="librerias/jquery/jquery.js"></script>
<script src="js/fichaAnimal.js"></script>

                    <!-- Modal Participante-->
                    <div class="modal fade" id="modalparticipante" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle">Agregar participante</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                            <form name="frmParticipante" method="post" id="frmEvento">
                                <div class="col-md-12 mb-3">
                                    <label for="validationCustom01">Nro. Participante</label>
                                    <input type="text" class="form-control" id="nroparticipante" placeholder="Ingrese número de participante" tabindex="3">
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label for="validationCustom01">Descripcion</label>
                                    <input type="text" class="form-control" id="descripcion" placeholder="Ingrese nombre participante" tabindex="3">
                                </div>
                                </div>
                                <div class="col-md-12 mb-3">
                                    <div class="alert" id="alert2">
                                        <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
                                        <strong id="strong">Error!</strong><p id="mensaje2" class="mensaje" ></p>
                                    </div>
                                </div>
                            </form>
                            
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="button" id="registrar-participante" class="btn btn-primary">Guardar</button>
                            </div>
                            </div>
                        </div>
                    </div>

                <!-- Modal Tratamientos-->
                <div class="modal fade" id="modaltratamiento" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle">Tratamiento</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                            <table>
                                <thead>
                                <th>Nro.</th>
                                <th>Tratamiento</th>
                                </thead>
                                <tbody id="tratamientos"></tbody>
                            </table>                            
                            <div class="modal-footer">
                                <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#modalagregartratamiento"><img src="iconos/plus.svg" alt="">Agregar</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="button" id="registrar-tratamiento" class="btn btn-primary">Guardar</button>
                            </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal Agregar-->
                <div class="modal fade" id="modalagregartratamiento" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle">Tratamiento</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                            <form name="frmTratamiento" method="post" id="frmTratamiento">
                                <div class="col-md-12 mb-3">
                                    <label for="validationCustom01">Nro. Tratamiento</label>                                    
                                    <input type="text" class="form-control" id="nrotratamiento" placeholder="Ingrese número de tratamiento" tabindex="3">
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label for="validationCustom01">Descripcion</label>
                                    <input type="text" class="form-control" id="descripciont" placeholder="Ingrese una descripcion" tabindex="3">
                                    <input type="hidden" id="EventoID">
                                </div>
                                </div>
                                <div class="col-md-12 mb-3">
                                    <div class="alert" id="alert3">
                                        <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
                                        <strong id="strong">Error!</strong><p id="mensaje3" class="mensaje" ></p>
                                    </div>
                                </div>
                            </form>
                            
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="button" id="registrar-tratamiento" class="btn btn-primary">Guardar</button>
                            </div>
                            </div>
                        </div>
                    </div>
</body>
</html>