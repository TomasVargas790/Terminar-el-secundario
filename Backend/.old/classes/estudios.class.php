<?php

    class estudiosClass{
        private $id;
        private $empleado;
        private $titulo;
        private $promedio;
        private $descripcion;
        private $fecha_inicio;
        private $fecha_fin;



        public function __construct($id=0,$empleado=0,$titulo="",$promedio=0.0,$descripcion="",$fecha_inicio="",$fecha_fin="")
        {
            $this->id=$id;
            $this->empleado=$empleado;
            $this->titulo=$titulo;
            $this->promedio=$promedio;
            $this->descripcion=$descripcion;
            $this->fecha_inicio=$fecha_inicio;
            $this->fecha_fin=$fecha_fin;
        }


        public function obtenerEstudios(){
            $dbc = new connectServer();
            return $dbc->getQuery("CALL `getEstudios`($this->id)");
        }
        public function insertarEstudios(){
            $dbc = new connectServer();
            return $dbc->getQuery("SELECT `setEstudios`($this->empleado,'$this->titulo',$this->promedio,'$this->descripcion','$this->fecha_inicio','$this->fecha_fin') AS consulta",true);
        }
    }

?>