<?php

class sessionClass
{
    private $empleado_session;
    private $hash_session;

    public function __construct($empleado_session="",$hash_session="")
    {
        $this->empleado_session=$empleado_session;
        $this->hash_session=$hash_session;
    }
    
    public function activarSession(){
        $dbc = new connectServer();
        return $dbc->getQuery("SELECT activarSession('$this->empleado_session') as consulta",true);
    }
    public function validarSession(){
        $dbc = new connectServer();
        return $dbc->getQuery("SELECT validarSession('$this->hash_session') as consulta",true);
    }

    public function cerrarSession(){
        $dbc = new connectServer();
        return $dbc->getQuery("SELECT cerrarSession('$this->hash_session') as consulta",true);
    }
}
?>