<?php

class empresaFuncion
{

    function obtenerEmpresa($getData)
    {
        $getData = new empresaClass($getData['id']);
        return $getData->obtenerEmpresa();
    }

    function insertarEmpresa($getData)
    {
        $getData = new empresaClass(0,$getData['cuit'], $getData['nombre'], $getData['rubro'], ($getData['descripcion']), $getData['ubicacion'],($getData['correo']), $getData['img'], $getData['telefono']);
        return $getData->insertarEmpresa();
    }
}

class empresaEjecutar
{

    function searchAction($getAction, $getData)
    {

        $empresaFuncion = new empresaFuncion();
        $dataReturn = 'Empresa - No se encontro una funcion';

        if (isset($getData['json'])  && $getData['json'] !== false) {
            $getData['json'] = json_decode($getData['json'], true);
        }

        switch ($getAction) {
            case "obtener":
                $dataReturn = $empresaFuncion->obtenerEmpresa($getData);
                break;
            case "insertar":
                $dataReturn = $empresaFuncion->insertarEmpresa($getData['json']);
                break;
            default:
                $dataReturn = false;
                break;
            }
        return $dataReturn;
    }
}