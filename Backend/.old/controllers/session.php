<?php

class sessionFuncion
{
    function validarSession($getData)
    {
        $getData = new sessionClass("",$getData['hash_session']);
        return $getData->validarSession();
    }
    function cerrarSession($getData)
    {
        $getData = new sessionClass("",$getData['hash_session']);
        return $getData->cerrarSession();
    }
    function activarSession($getData)
    {
        $getData = new sessionClass($getData['empleado_session']);
        return $getData->activarSession();
    }
}
class sessionEjecutar
{

    function searchAction($getAction, $getData)
    {

        $sessionFuncion = new sessionFuncion();
        $dataReturn = 'Session - No se encontro una funcion';

        if (isset($getData['json'])  && $getData['json'] !== false) {
            $getData['json'] = json_decode($getData['json'], true);
        }

        switch ($getAction) {
            case "validar":
                $dataReturn = $sessionFuncion->validarSession($getData['json']);
                break;
            case "cerrar":
                $dataReturn = $sessionFuncion->cerrarSession($getData['json']);
                break;
            case "activar":
                $dataReturn = $sessionFuncion->activarSession($getData['json']);
                break;
            default:
                $dataReturn = false;
        }
        return $dataReturn;
    }
}
