<?php

class sessionEmpleadorClass
{
    private $empleador_session;
    private $hash_session_empleador;

    public function __construct($empleador_session="",$hash_session_empleador="")
    {
        $this->empleador_session=$empleador_session;
        $this->hash_session_empleador=$hash_session_empleador;
    }
    
    public function activarSessionEmpleador(){
        $dbc = new connectServer();
        return $dbc->getQuery("SELECT activarSessionEmpleador('$this->empleador_session') as consulta",true);
    }
    public function validarSessionEmpleador(){
        $dbc = new connectServer();
        return $dbc->getQuery("SELECT validarSessionEmpleador('$this->hash_session_empleador') as consulta",true);
    }

    public function cerrarSessionEmpleador(){
        $dbc = new connectServer();
        return $dbc->getQuery("SELECT cerrarSessionEmpleador('$this->hash_session_empleador') as consulta",true);
    }
}
?>