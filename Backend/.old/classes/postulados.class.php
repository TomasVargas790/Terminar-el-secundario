<?php

    class postuladosClass{
        private $id;
        private $id_vacante;
        private $id_empleado;



        public function __construct($id=0,$id_vacante=0,$id_empleado=0)
        {
            $this->id=$id;
            $this->id_vacante=$id_vacante;
            $this->id_empleado=$id_empleado;
        }


        public function obtenerPostulados(){
            $dbc = new connectServer();
            return $dbc->getQuery("CALL `getPostulados`($this->id)");
        }   
        public function insertarPostulados(){
            $dbc = new connectServer();
            return $dbc->getQuery("SELECT `setPostulados`($this->id_vacante,$this->id_empleado) AS consulta",true);
        }
    }

?>