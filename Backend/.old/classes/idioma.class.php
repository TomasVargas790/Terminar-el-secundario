<?php

    class idiomaClass{
        private $id;
        private $empleado;
        private $idioma;
        private $nivel;



        public function __construct($id=0,$empleado=0,$idioma="",$nivel="")
        {
            $this->id=$id;
            $this->empleado=$empleado;
            $this->idioma=$idioma;
            $this->nivel=$nivel;
        }


        public function obtenerIdioma(){
            $dbc = new connectServer();
            return $dbc->getQuery("CALL `getIdioma`($this->id)");
        }
        public function insertarIdioma(){
            $dbc = new connectServer();
            return $dbc->getQuery("SELECT `setIdioma`($this->empleado,'$this->idioma','$this->nivel') AS consulta",true);
        }
    }

?>