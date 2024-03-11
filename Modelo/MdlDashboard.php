<?php
require_once "conexion.php";
class MdlDashboard
{
    public static function Dashboard($idFinca)
    {
        $ConexionBD = new ConexionBD();
		$conexion   = $ConexionBD->Abrir();
        $query      = mysqli_query($conexion,"SELECT DATEDIFF(DATE(NOW()),fecha_nacimiento)dias FROM animal WHERE idAnimal=idAnimal AND fincaID = '".$idFinca."'");
        $resultado  = mysqli_num_rows($query);

        $vacas      = 0;
        $vaquillonas= 0;
        $vaquillas  = 0;
        $terneras   = 0;
        $totales    = 0;      
        if($resultado > 0)
        {
            while($row = $query->fetch_assoc())
            {
                if($row['dias'] <= 180){$terneras++;}
                if($row['dias'] >= 181 && $row['dias']<=540){$vaquillas++;}
                if($row['dias'] >= 541){$vaquillonas++;}
            }
        }
        $totales = $terneras+$vaquillas+$vaquillonas+$vacas;
        $data = array("terneras"=>$terneras,"vaquillas"=>$vaquillas,"vaquillonas"=>$vaquillonas,"vacas"=>$vacas,"totales"=>$totales);
        return json_encode($data,JSON_UNESCAPED_UNICODE);
        //return "terneras:".$terneras."vaquillas:".$vaquillas."vaquillonas:".$vaquillonas."Vacas:".$vacas;
    }
}