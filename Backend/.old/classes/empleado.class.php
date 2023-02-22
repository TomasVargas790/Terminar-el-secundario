<?php

class empleadoClass
{
    private $id;
    private $nombre;
    private $apellido;
    private $correo;
    private $documento;
    private $ubicacion;
    private $telefono;
    private $img;
    private $cv;
    private $hash;
    private $hash_session;

    public function __construct($id = 0, $nombre = "", $apellido = "", $correo = "", $documento = "", $ubicacion = "", $telefono = "", $img = "", $cv = "", $hash = "",$hash_session="")
    {
        $this->id = $id;
        $this->nombre = $nombre;
        $this->apellido = $apellido;
        $this->correo = $correo;
        $this->documento = $documento;
        $this->ubicacion = $ubicacion;
        $this->telefono = $telefono;
        $this->img = $img;
        $this->cv = $cv;
        $this->hash = $hash;
        $this->hash_session = (string)$hash_session;
    }


    public function obtenerEmpleado()
    {
        if ($this->id == 0 || $this->id == "" || $this->id == null) {
            $dbc = new connectServer();
            return $dbc->getQuery("CALL `getEmpleado`($this->id)");
        } else {
            $dbc = new connectServer();
            return [
                "empleado" => $dbc->getQuery("CALL `getEmpleado`($this->id)", true),
                "estudios" => $dbc->getQuery("CALL `getEstudios`($this->id)"),
                "experiencia" => $dbc->getQuery("CALL `getExperiencia`($this->id)"),
                "idioma" => $dbc->getQuery("CALL `getIdioma`($this->id)"),
                "pasantias" => $dbc->getQuery("CALL `getPasantias`($this->id)")
            ];
        }
    }

    public function insertarEmpleado()
    {
        $dbc = new connectServer();
        return $dbc->getQuery("SELECT setEmpleado('$this->nombre','$this->apellido','$this->correo','$this->documento','$this->ubicacion','$this->telefono','$this->img','$this->cv','$this->hash','$this->hash_session') as consulta;",true);
    }

    public function loginEmpleado()
    {
        $dbc = new connectServer();
        return $dbc->getQuery("CALL logEmpleado('$this->correo','$this->hash')", true);
    }
}
