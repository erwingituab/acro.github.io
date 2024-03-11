<div class="container">    
    <div class="input-group mb-3">
    <div class="input-group-prepend">
        <span class="input-group-text" id="basic-addon3">INGRESE CHB DE LA VACA</span>
    </div>
    <input type="text" class="form-control" id="buscaranimal" aria-describedby="basic-addon3">
    </div>
    <div class="table">
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">CHB</th>
                <th scope="col">Rp.</th>
                <th scope="col">Est.</th>
                <th scope="col">F. Nac.</th>
                <th scope="col">Nombre</th>
                <th scope="col">Madre</th>
                <th scope="col">Padre</th>
                <th scope="col">Opciones</th>      
            </tr>
            </thead>
            <tbody id="animales">                      
            </tbody>
        </table> 
    </div> 
    <nav aria-label="...">
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-end">
                <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1">Previous</a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                <a class="page-link" href="#">Next</a>
                </li>
            </ul>
        </nav>
    </nav>
    <!-- Button trigger modal -->
    <button type="button" class="agregar btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg"><img src="iconos/plus.svg" alt=""> Agregar</button>
</div>
<!-- Modal -->
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
        <form id="frmAnimal">
            <fieldset>
                <legend>IDENTIFICACION DE LA HEMBRA</legend>
                <div class="form-row">
                    <div class="col-md-4 mb-3">
                        <label for="validationCustom01">CHB</label>
                        <input type="hidden" id="idAnimal">
                        <input type="text" class="form-control" id="chb" placeholder="Código chb" tabindex="1">
                        <div class="valid-feedback">
                        Código CHB
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                    <label for="validationCustom02">Fecha de Nacimiento</label>
                    <input type="date" class="form-control" id="fnacimiento" placeholder="Fecha de nacimiento" tabindex="2">
                    <div class="valid-feedback">
                        Fecha de Nacimiento
                    </div>
                    </div>
                    <div class="col-md-4 mb-3">
                    <label for="validationCustom02">N° Certificado de Nacimiento</label>
                    <input type="text" class="form-control" id="nroregistro" placeholder="Certificado de Nacimiento" tabindex="3">
                    <div class="valid-feedback">
                        Nro. Certificado
                    </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                    <label for="validationCustom01">Categoría</label>
                    <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <label class="input-group-text" for="inputGroupSelect01">Options</label>
                    </div>
                    <select class="custom-select" id="categoria" tabindex="4">
                        <option value="" selected>Elija opción</option>
                        <option value="1">TA</option>
                        <option value="2">TB</option>
                        <option value="3">TC</option>
                        <option value="4">PPC</option>
                        <option value="5">PAPI</option>
                        <option value="6">PAPII</option>
                        <option value="7">PP</option>
                    </select>
                    </div>
                    </div>
                    <div class="col-md-6 mb-3">
                    <label for="validationCustom02">Raza</label>
                    <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <label class="input-group-text" for="inputGroupSelect01">Opción</label>
                    </div>
                    <select class="custom-select" id="raza" tabindex="5">
                        <option value="" selected>Elija opción</option>
                        <option value="1">Cruzas</option>
                        <option value="2">Holstein</option>
                        <option value="3">Jersey</option>
                        <option value="4">Pardo Suizo</option>
                        <option value="5">Otras</option>                        
                    </select>
                    </div>
                    </div>                    
                </div>
                <div class="form-row">
                    <div class="col-md-8 mb-3">
                        <label for="validationCustom01">Nombre</label>
                        <input type="text" class="form-control" id="nombre" placeholder="Ingrese nómbre" tabindex="6">
                        <div class="valid-feedback">
                        Nómbre
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                    <label for="validationCustom02">Nro. R.P.</label>
                    <input type="text" class="form-control" id="rp" placeholder="Nro. Registro propio" value="0" tabindex="7">
                    <div class="valid-feedback">
                        Registro Propio
                    </div>
                    </div>                    
                </div>
                <legend>GENEALOGIA</legend>
                <div class="form-row ">
                <div class="col-md-6 mb-3">
                    <label for="validationCustom01">CHB Madre</label>
                    <input type="text" class="form-control" id="chbmadre" placeholder="CHB Madre" tabindex="8">
                    <div class="valid-feedback">
                        CHB Madre
                    </div>
                    </div>
                    <div class="col-md-6 mb-3">
                    <label for="validationCustom01">NAAB Padre</label>
                    <input type="text" class="form-control" id="naabpadre" placeholder="Código NAAB" tabindex="9">
                    <div class="valid-feedback">
                        Código NAAB del Padre
                    </div>
                    </div>                  
                </div>                                                            
            </fieldset>  
            <div class="alert" id="alert">
			<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
			<strong id="strong">Error!</strong><p id="mensaje" class="mensaje" ></p>
		</div>          
        </form>
        </div>
        <div class="modal-footer">
            <button type="button" id="cerrar" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            <input type="button" id="submit" class="btn btn-primary" value="Registrar" tabindex="10">            
        </div>    
    </div>
    </div>
</div>
<script src="librerias/jquery/jquery.js"></script>
<script src="js/animal.js"></script>