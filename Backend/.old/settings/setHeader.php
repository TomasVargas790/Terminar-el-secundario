<?php

    include_once "connectServer.php";
    include_once "getFunctions.php";
    include_once "listClasses.php";
    include_once "listControllers.php";

    header("Access-Control-Allow-Origin: *");
    header('Access-Control-Allow-Credentials: true');
    header('Access-Control-Allow-Methods: PUT, GET, POST, DELETE, OPTIONS');
    header("Access-Control-Allow-Headers: X-Requested-With, Content-Type");
    header('Content-Type: text/html; charset=utf-8');

    
?>