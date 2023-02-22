<?php

error_reporting(1);


include_once './settings/setHeader.php';

$dbc = new connectServer();
$dataGet = $_REQUEST;
$classGet = $dataGet['class'];
$actionGet = $dataGet['action'];
$dataReturn = "No data;";

switch ($classGet) {
    case "empleado":
        $callControl = new empleadoEjecutar();
        break;
    case "empleador":
        $callControl = new empleadorEjecutar();
        break;
    case "empresa":
        $callControl = new empresaEjecutar();
        break;
    case "experiencia":
        $callControl = new experienciaEjecutar();
        break;
    case "estudios":
        $callControl = new estudiosEjecutar();
        break;
    case "idioma":
        $callControl = new idiomaEjecutar();
        break;
    case "vacante":
        $callControl = new vacanteEjecutar();
        break;
    case "postulados":
        $callControl = new postuladosEjecutar();
        break;
    case "session":
        $callControl = new sessionEjecutar();
        break;
    case "sessionempleador":
        $callControl = new sessionEmpleadorEjecutar();
        break;
    default:
        $callControl = false;
        break;
}

if ($callControl !== false) {
    $dataReturn = $callControl->searchAction($actionGet, $dataGet);
}

$dataReturn = getAjax($dataReturn);

echo $dataReturn;
