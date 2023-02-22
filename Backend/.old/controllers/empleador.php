<?php

class empleadorFuncion
{

    function obtenerEmpleador($getData)
    {
        $getData = new empleadorClass($getData['id']);
        return $getData->obtenerEmpleador();
    }

    function insertarEmpleador($getData)
    {
        $getData = new empleadorClass(0,$getData['nombre'], $getData['apellido'], $getData['correo'], ($getData['documento']),($getData['telefono']), $getData['empresa'], $getData['hash'],$getData['hash_session']);
        return $getData->insertarEmpleador();
    }
    function loginEmpleador($getData)
    {
        $getData = new empleadorClass(0,"","",$getData['correo'],"","","", $getData['hash']);
        return $getData->loginEmpleador();
    }
}

class empleadorEjecutar
{

    function searchAction($getAction, $getData)
    {

        $EmpleadorFuncion = new empleadorFuncion();
        $dataReturn = 'Empleador - No se encontro una funcion';

        if (isset($getData['json'])  && $getData['json'] !== false) {
            $getData['json'] = json_decode($getData['json'], true);
        }

        switch ($getAction) {
            case "obtener":
                $dataReturn = $EmpleadorFuncion->obtenerEmpleador($getData);
                break;
            case "insertar":
                $dataReturn = $EmpleadorFuncion->insertarEmpleador($getData['json']);
                break;
            case "login":
                $dataReturn = $EmpleadorFuncion->loginEmpleador($getData['json']);
                break;
            }

        return $dataReturn;
    }
}
