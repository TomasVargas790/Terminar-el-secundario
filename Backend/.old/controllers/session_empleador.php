<?php

class sessionEmpleadorFuncion
{
    function validarSessionEmpleador($getData)
    {
        $getData = new sessionEmpleadorClass("",$getData['hash_session_empleador']);
        return $getData->validarSessionEmpleador();
    }
    function cerrarSessionEmpleador($getData)
    {
        $getData = new sessionEmpleadorClass("",$getData['hash_session_empleador']);
        return $getData->cerrarSessionEmpleador();
    }
    function activarSessionEmpleador($getData)
    {
        $getData = new sessionEmpleadorClass($getData['empleador_session']);
        return $getData->activarSessionEmpleador();
    }
}
class sessionEmpleadorEjecutar
{

    function searchAction($getAction, $getData)
    {

        $sessionEmpleadorFuncion = new sessionEmpleadorFuncion();
        $dataReturn = 'SessionEmpleador - No se encontro una funcion';

        if (isset($getData['json'])  && $getData['json'] !== false) {
            $getData['json'] = json_decode($getData['json'], true);
        }

        switch ($getAction) {
            case "validar":
                $dataReturn = $sessionEmpleadorFuncion->validarSessionEmpleador($getData['json']);
                break;
            case "cerrar":
                $dataReturn = $sessionEmpleadorFuncion->cerrarSessionEmpleador($getData['json']);
                break;
            case "activar":
                $dataReturn = $sessionEmpleadorFuncion->activarSessionEmpleador($getData['json']);
                break;
            default:
                $dataReturn = false;
        }
        return $dataReturn;
    }
}
