<?php
if (isset($_POST['action'])&&$_POST['action']=="Dashboard") 
{
	echo CtrlDashboard::Dashboard();
}
class CtrlDashboard
{
    public static function Dashboard()
    {
        session_start();
        require_once "../modelo/MdlDashboard.php";
        $respuesta = MdlDashboard::Dashboard($_SESSION['idFinca']);
        return $respuesta;
    }
}