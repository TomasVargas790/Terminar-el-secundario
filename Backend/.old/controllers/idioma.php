<?php

class idiomaFuncion
{

    function obtenerIdioma($getData)
    {
        $getData = new idiomaClass($getData['id']);
        return $getData->obtenerIdioma();
    }
    function insertarIdioma($getData)
    {
        $getData = new idiomaClass(0,$getData['empleado'], $getData['idioma'], $getData['nivel']);
        return $getData->insertarIdioma();
    }
}

class idiomaEjecutar
{

    function searchAction($getAction, $getData)
    {

        $idiomaFuncion = new idiomaFuncion();
        $dataReturn = 'Idioma - No se encontro una funcion';


        if (isset($getData['json'])  && $getData['json'] !== false) {
            $getData['json'] = json_decode($getData['json'], true);
        }

        switch ($getAction) {
            case "obtener":
                $dataReturn = $idiomaFuncion->obtenerIdioma($getData);
                break;
            case "insertar":
                $dataReturn = $idiomaFuncion->insertarIdioma($getData['json']);
                break;
            default:
                $dataReturn = false;
        }

        return $dataReturn;
    }
}
