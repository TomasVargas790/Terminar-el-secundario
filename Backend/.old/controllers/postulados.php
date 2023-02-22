<?php

class postuladosFuncion
{

    function obtenerPostulados($getData)
    {
        $getData = new postuladosClass($getData['id']);
        return $getData->obtenerPostulados();
    }
    function insertarPostulados($getData)
    {
        $getData = new postuladosClass(0,$getData['vacante'],$getData['empleado']);
        return $getData->insertarPostulados();
    }
}

class postuladosEjecutar
{

    function searchAction($getAction, $getData)
    {

        $postuladosFuncion = new postuladosFuncion();
        $dataReturn = 'Postulados - No se encontro una funcion';

        if (isset($getData['json'])  && $getData['json'] !== false) {
            $getData['json'] = json_decode($getData['json'], true);
        }
        
        switch ($getAction) {
            case "obtener":
                $dataReturn = $postuladosFuncion->obtenerPostulados($getData);
                break;
            case "insertar":
                $dataReturn = $postuladosFuncion->insertarPostulados($getData['json']);
                break;
            default:
                $dataReturn = false;
        }

        return $dataReturn;
    }
}
