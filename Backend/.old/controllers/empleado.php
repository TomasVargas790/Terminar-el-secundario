<?php

class empleadoFuncion
{

    function obtenerEmpleado($getData)
    {
        $getData = new empleadoClass($getData['id']);
        return $getData->obtenerEmpleado();
    }

    function insertarEmpleado($getData)
    {
        $getData = new empleadoClass(0, $getData['nombre'], $getData['apellido'], $getData['correo'], ($getData['dni']), $getData['ubicacion'], ($getData['telefono']), $getData['img'], $getData['cv'], $getData['hash'],$getData['hash_session']);
        return $getData->insertarEmpleado();
    }
    function loginEmpleado($getData)
    {
        $getData = new empleadoClass(0, "", "", $getData['correo'], "", "", "", "", "", $getData['hash']);
        return $getData->loginEmpleado();
    }
}

class empleadoEjecutar
{

    function searchAction($getAction, $getData)
    {

        $EmpleadoFuncion = new empleadoFuncion();
        $dataReturn = 'Empleado - No se encontro una funcion';

        if (isset($getData['json'])  && $getData['json'] !== false) {
            $getData['json'] = json_decode($getData['json'], true);
        }
        switch ($getAction) {
            case "obtener":
                $dataReturn = $EmpleadoFuncion->obtenerEmpleado($getData);
                break;
            case "insertar":
                $dataReturn = $EmpleadoFuncion->insertarEmpleado($getData['json']);
                break;
            case "login":
                $dataReturn = $EmpleadoFuncion->loginEmpleado($getData['json']);
                break;
            default:
                $dataReturn = false;
                break;
        }


        return $dataReturn;
    }
}
