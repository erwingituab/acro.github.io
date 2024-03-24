<?php
if (isset($_POST['action'])&&$_POST['action']=="agregarparticipante") 
{
	echo CtrlFichaAnimal::AgregarParticipante();
}
if (isset($_POST['action'])&&$_POST['action']=="agregartratamiento") 
{
	echo CtrlFichaAnimal::AgregarTratamiento();
}
if (isset($_POST['action'])&&$_POST['action']=="buscarparticipante") 
{
	echo CtrlFichaAnimal::BuscarParticipante();
}
if (isset($_POST['action'])&&$_POST['action']=="evento") 
{
	echo CtrlFichaAnimal::BuscarEventoClave();
}
if (isset($_POST['action'])&&$_POST['action']=="toro") 
{
	echo CtrlFichaAnimal::BuscarToro();
}
if (isset($_POST['action'])&&$_POST['action']=="Buscar_mostrar_tratamientos") 
{
	echo CtrlFichaAnimal::Buscar_mostrar_tratamientos($_POST['valor']);
}
if (isset($_POST['action'])&&$_POST['action']=="BuscarTratamiento_nro") 
{
	echo CtrlFichaAnimal::BuscarTratamiento_nro();
}
if (isset($_POST['action'])&&$_POST['action']=="MostrarHistoriaAnimal")
{
	echo CtrlFichaAnimal::MostrarHistoriaAnimal();
}
if (isset($_POST['action'])&&$_POST['action']=="RegistrarHistoria")
{
	echo CtrlFichaAnimal::RegistrarHistoria();
}
if (isset($_POST['action'])&&$_POST['action']=="RegistrarParto")
{
	echo CtrlFichaAnimal::RegistrarParto();
}
if (isset($_POST['action'])&&$_POST['action']=="RegistrarTratamiento")
{
	echo CtrlFichaAnimal::RegistrarTratamiento();
}
class CtrlFichaAnimal
{
    public static function AgregarParticipante()
    {
        require_once '../Modelo/MdlFichaAnimal.php';
        $participante = array(  "nroparticipante"      =>$_POST['nroparticipante'],
                                "descripcion"          =>$_POST['descripcion']);
        $respuesta = MdlFichaAnimal::AgregarParticipante($participante);
        return $respuesta;
    }
    public static function AgregarTratamiento()
    {
        require_once '../Modelo/MdlFichaAnimal.php';
        $tratamiento = array(  "nrotratamiento"     =>$_POST['nrotratamiento'],
                                "descripcion"       =>$_POST['descripcion']);
        $respuesta = MdlFichaAnimal::AgregarTratamiento($tratamiento);
        return $respuesta;
    }
    public static function BuscarParticipante(){
        require_once "../Modelo/MdlFichaAnimal.php";
        $respuesta = MdlFichaAnimal::BuscarParticipante($_POST['valor']);
        return $respuesta;
    }
    public static function BuscarEventoClave(){
        require_once "../Modelo/MdlFichaAnimal.php";
        $respuesta = MdlFichaAnimal::MostrarEvento($_POST['clave']);
        return $respuesta;
    }
    public static function BuscarToro(){
        require_once "../Modelo/MdlFichaAnimal.php";
        $respuesta = MdlFichaAnimal::BuscarToro($_POST['hba']);
        return $respuesta;
    }
    static public function BuscarTratamiento_nro()
    {
        require_once "../Modelo/MdlFichaAnimal.php";
        $respuesta = MdlFichaAnimal::BuscarTratamiento_nro($_POST['nrotratamiento']);
        return $respuesta;
    }
    static public function Buscar_mostrar_tratamientos($valor)
    {
        require_once "../Modelo/MdlFichaAnimal.php";
        $respuesta = MdlFichaAnimal::Buscar_mostrar_tratamientos($valor);
        return $respuesta;
    }
    static public function RegistrarHistoria()
    {
        require_once "../Modelo/MdlFichaAnimal.php";
        session_start();
        $historia = array(  "fecha"         =>$_POST['fecha'],
                            "AnimalID"      =>$_SESSION['idAnimal'],
                            "EventoID"      =>$_POST['idEvento'],
                            "TratamientoID" =>$_POST['TratamientoID'],
                            "ParticipanteID"=>$_POST['ParticipanteID']);
        $respuesta = MdlFichaAnimal::RegistrarHistoria($historia);
        if($respuesta==1)        
        {
            $cruzamiento = array("EventoID"=>$_POST['idEvento'],
                                "ReproductorID"=>$_POST['ReproductorID']);
            $respuestac= MdlFichaAnimal::RegistrarCruzamiento($cruzamiento);
            return $respuestac;
        }
    }
    static public function MostrarHistoriaAnimal()
    {
        require_once "../Modelo/MdlFichaAnimal.php";
        session_start();
        $respuesta = MdlFichaAnimal::MostrarHistoriaAnimal($_SESSION['chb']);
        return $respuesta;
    }
    static public function RegistrarParto()
    {
        require_once "../Modelo/MdlFichaAnimal.php";
        session_start();
        $historia = array(  "fecha"         =>$_POST['fecha'],
                            "AnimalID"      =>$_SESSION['idAnimal'],
                            "EventoID"      =>$_POST['idEvento'],
                            "TratamientoID" =>$_POST['TratamientoID'],
                            "ParticipanteID"=>$_POST['ParticipanteID']);
        $respuesta = MdlFichaAnimal::RegistrarHistoria($historia);        
        if($respuesta==1)        
        {
            $parto = array( "nroparto"  =>$_POST['nroparto'],
                            "tipo"      =>$_POST['tipoparto'],
                            "sexo"      =>$_POST['sexo'],
                            "chbcria"   =>$_POST['chbcria'],
                            "peso"      =>$_POST['peso'],
                            "EventoID"  =>$_POST['idEvento']);
            $respuestap= MdlFichaAnimal::RegistrarParto($parto);
            return $respuestap;
        }
    }
    static public function RegistrarTratamiento()
    {
        require_once "../Modelo/MdlFichaAnimal.php";
        session_start();
        $historia = array(  "fecha"         =>$_POST['fecha'],
                            "AnimalID"      =>$_SESSION['idAnimal'],
                            "EventoID"      =>$_POST['idEvento'],
                            "TratamientoID" =>$_POST['TratamientoID'],
                            "ParticipanteID"=>$_POST['ParticipanteID']);
        $respuesta = MdlFichaAnimal::RegistrarHistoria($historia);
        return $respuesta;      
    }
}