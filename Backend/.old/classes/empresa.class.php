<?php

class empresaClass
{
    private $id;
    private $cuit;
    private $nombre;
    private $rubro;
    private $descripcion;
    private $ubicacion;
    private $correo;
    private $img;
    private $telefono;


    public function __construct($id = 0, $cuit = 0, $nombre = "", $rubro = "", $descripcion = "", $ubicacion = "", $correo = "", $img = "", $telefono = "")
    {
        $this->id = $id;
        $this->cuit = $cuit;
        $this->nombre = $nombre;
        $this->rubro = $rubro;
        $this->descripcion = $descripcion;
        $this->ubicacion = $ubicacion;
        $this->correo = $correo;
        $this->img = $img;
        $this->telefono = $telefono;
    }


    public function obtenerEmpresa()
    {
        $dbc = new connectServer();
        if ($this->id == 0 || "" || null) {
            return $dbc->getQuery(("CALL `getEmpresa`($this->id)"));
        }
        return [
            "empresa" => $dbc->getQuery("CALL `getEmpresa`($this->id)", true),
            "vacante" => $dbc->getQuery("CALL `getVacante`($this->id)"),
            "pasantias" => $dbc->getQuery("CALL `getPasantias`($this->id)")
        ];
    }
    public function insertarEmpresa()
    {
        $dbc = new connectServer();
        return $dbc->getQuery("SELECT `setEmpresa`($this->cuit,'$this->nombre','$this->rubro','$this->descripcion','$this->ubicacion','$this->correo','$this->img','$this->telefono') AS consulta", true);
    }
}
