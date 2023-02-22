<?php

    class estudiosFuncion{
        
        function obtenerEstudios($getData){
            $getData = new estudiosClass($getData['id']);
            return $getData->obtenerEstudios();
        }

        function insertarEstudios($getData){
            $getData = new estudiosClass(0, $getData['empleado'],$getData['titulo'], $getData['promedio'], $getData['fecha_inicio'],$getData['fecha_fin'], $getData['descripcion']);
            return $getData->insertarEstudios();
        }
    }

    class estudiosEjecutar{

        function searchAction($getAction, $getData){
            
            $estudiosFuncion = new estudiosFuncion();
            $dataReturn = 'estudios - No se encontro una funcion';

            if (isset($getData['json'])  && $getData['json'] !== false) {
                $getData['json'] = json_decode($getData['json'], true);
            }

            switch($getAction){
                case "obtener":
                    $dataReturn = $estudiosFuncion->obtenerEstudios($getData);
                    break;
                case "insertar":
                    $dataReturn = $estudiosFuncion->insertarEstudios($getData['json']);
                    break;
            }

            return $dataReturn;

        }

    }

?>