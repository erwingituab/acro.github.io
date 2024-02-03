<nav class="navbar bg-body-tertiary">
  <div class="container">
    <a class="navbar-brand" href="#">
      <img src="vista/images/acrhobol.png" alt="Logo" width="50" height="50" class="d-inline-block rounded align-text-top">
      ACRHOBOL
    </a>
  </div>
</nav>
<section class="vh-100">
  <div class="container-fluid h-custom">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-9 col-lg-6 col-xl-5">
        <img src="vista/Images/login.png"
          class="img-fluid" alt="Sample image">
      </div>
      <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
        <form id="frmLogin" offset="off">          
          <div class="divider d-flex align-items-center my-4">
            <p class="text-center fw-bold mx-3 mb-0">Iniciar sesion</p>
          </div>
          <!-- usuario input -->
          <div class="form-outline mb-4">
            <input type="text" id="txtusuario" class="form-control form-control-lg"
              placeholder="Ingrese nombre de usuario" />
            <label class="form-label" for="form3Example3">Usuario</label>
          </div>

          <!-- Password input -->
          <div class="form-outline mb-3">
            <input type="password" id="txtclave" class="form-control form-control-lg"
              placeholder="Ingrese password" />
            <label class="form-label" for="form3Example4">Password</label>
          </div>
		  <div class="text-center text-lg-start mt-4 pt-2">
            <button type="submit" class="btn btn-primary btn-lg submit"
              style="padding-left: 2.5rem; padding-right: 2.5rem;">Ingresar</button>            
          </div>
		  <div class="mensaje" style="display: none;">
			<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
			<strong>Error!</strong><p id="error"></p>
		</div>
        </form>
      </div>
    </div>
  </div>  
</section>	
</div>