<?php

class experienciaFuncion
{

    function obtenerExperiencia($getData)
    {
        $getData = new experienciaClass($getData['id']);
        return $getData->obtenerExperiencia();
    }    
    function insertarExperiencia($getData)
    {
        $getData = new experienciaClass(0,$getData['empleado'], $getData['empresa'],$getData['titulo'],$getData['rubro'], $getData['descripcion'],$getData['fecha_inicio'], $getData['fecha_fin']);
        return $getData->insertarExperiencia();
    }
}

class experienciaEjecutar
{

    function searchAction($getAction, $getData)
    {

        if (isset($getData['json'])  && $getData['json'] !== false) {
            $getData['json'] = json_decode($getData['json'], true);
        }

        $experienciaFuncion = new experienciaFuncion();
        $dataReturn = 'Experiencia - No se encontro una funcion';

        switch ($getAction) {
            case "obtener":
                $dataReturn = $experienciaFuncion->obtenerExperiencia($getData);
                break;
            case "insertar":
                $dataReturn = $experienciaFuncion->insertarExperiencia($getData['json']);
                break;
            default:
                $dataReturn = false;
        }

        return $dataReturn;
    }
}
