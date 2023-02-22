<?php

class empleadorClass
{
    private $id;
    private $nombre;
    private $apellido;
    private $correo;
    private $documento;
    private $telefono;
    private $empresa;
    private $hash;
    private $hash_session;

    public function __construct($id = 0, $nombre = "", $apellido = "", $correo = "", $documento = "", $telefono = "",  $empresa = 0, $hash = "",$hash_session="")
    {
        $this->id = (int)$id;
        $this->nombre = (string)$nombre;
        $this->apellido = (string)$apellido;
        $this->correo = (string)$correo;
        $this->documento = (string)$documento;
        $this->telefono = (int)$telefono;
        $this->empresa = (int)$empresa;
        $this->hash = (string)$hash;
        $this->hash_session = (string)$hash_session;

    }


    public function obtenerEmpleador()
    {
        $dbc = new connectServer();
        return $dbc->getQuery("CALL `getEmpleador`($this->id)");
    }

    public function insertarEmpleador()
    {
        $dbc = new connectServer();
        return $dbc->getQuery("SELECT setEmpleador('$this->nombre','$this->apellido','$this->correo','$this->documento','$this->telefono',$this->empresa,'$this->hash','$this->hash_session') AS consulta",true);
    }

    public function loginEmpleador()    
    {
        $dbc = new connectServer(); 
        return $dbc->getQuery("CALL logEmpleador('$this->correo','$this->hash')",true);
    }
}
