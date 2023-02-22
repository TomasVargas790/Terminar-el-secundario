<?php

class vacanteFuncion
{

    function obtenerVacante($getData)
    {
        $getData = new vacanteClass($getData['id']);
        return $getData->obtenerVacante();
    }
    function obtenerVacantes($getData)
    {
        $getData = new vacanteClass($getData['id']);
        return $getData->obtenerVacantes();
    }
    function insertarVacante($getData)
    {
        $getData = new vacanteClass(0, $getData['titulo'], $getData['descripcion'], $getData['salario'], $getData['cantidad'], $getData['ubicacion'], $getData['requisitos'], $getData['empresa'],);
        return $getData->insertarVacante();
    }
}

class vacanteEjecutar
{

    function searchAction($getAction, $getData)
    {

        $vacanteFuncion = new vacanteFuncion();
        $dataReturn = 'Vacante - No se encontro una funcion';

        if (isset($getData['json'])  && $getData['json'] !== false) {
            $getData['json'] = json_decode($getData['json'], true);
        }

        switch ($getAction) {
            case "obtener":
                $dataReturn = $vacanteFuncion->obtenerVacante($getData);
                break;
            case "obtenertodo":
                $dataReturn = $vacanteFuncion->obtenerVacantes($getData);
                break;
            case "insertar":
                $dataReturn = $vacanteFuncion->insertarVacante($getData['json']);
                break;
            default:
                $dataReturn = false;
        }
        return $dataReturn;
    }
}
