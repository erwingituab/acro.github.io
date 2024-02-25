<?php
if (isset($_POST['action'])&&$_POST['action']=="Registrar") 
{
	echo CtrlEvento::RegistrarEvento();
}
if (isset($_POST['action'])&&$_POST['action']=="Actualizar") 
{
	echo CtrlEvento::ActualizarEvento();
}
if (isset($_POST['action'])&&$_POST['action']=="Eliminar") 
{
	echo CtrlEvento::EliminarEvento();
}
if (isset($_POST['action'])&&$_POST['action']=="Mostrar_datos_evento") 
{
	echo CtrlEvento::Mostrar_datos_evento($_POST['idEvento']);
}
if (isset($_POST['action'])&&$_POST['action']=="Buscar_mostrar_evento") 
{
	echo CtrlEvento::Buscar_mostrar_evento($_POST['valor']);
}
class CtrlEvento
{
    static public function RegistrarEvento()
    {
        require_once "../Modelo/MdlEvento.php";
        $evento = array("clave"      =>$_POST['clave'],
                        "descripcion"=>$_POST['descripcion'],
                        "tipoevento" =>$_POST['tipoevento']);
		$respuesta = MdlEvento::RegistrarEvento($evento);
		return $respuesta;
    }
    static public function ActualizarEvento()
    {
        require_once "../Modelo/MdlEvento.php";
        $evento = array("idEvento"   =>$_POST['idEvento'],
                        "clave"      =>$_POST['clave'],
                        "descripcion"=>$_POST['descripcion'],
                        "tipoevento" =>$_POST['tipoevento']);
		$respuesta = MdlEvento::ActualizarEvento($evento);
		return $respuesta;
    }
    static public function EliminarEvento()
    {
        require_once "../Modelo/MdlEvento.php";
        $evento = array("idEvento"   =>$_POST['idEvento']);
		$respuesta = MdlEvento::EliminarEvento($evento);
		return $respuesta;
    }
    static public function Mostrar_datos_evento($idEvento)
    {
        require_once "../Modelo/MdlEvento.php";
        $respuesta = MdlEvento::Mostrar_datos_evento($idEvento);
        return $respuesta;
    }
    static public function Buscar_mostrar_evento($valor)
    {
        require_once "../Modelo/MdlEvento.php";
        $respuesta = MdlEvento::Buscar_mostrar_evento($valor);
        return $respuesta;
    }
}