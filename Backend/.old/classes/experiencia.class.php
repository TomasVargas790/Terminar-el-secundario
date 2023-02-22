<?php

    class experienciaClass{
        private $id;
        private $empleado;
        private $empresa;
        private $titulo;
        private $rubro;
        private $descripcion;
        private $fecha_inicio;
        private $fecha_fin;



        public function __construct($id=0,$empleado=0,$empresa="",$titulo="",$rubro="",$descripcion="",$fecha_inicio="",$fecha_fin="")
        {
            $this->id=$id;
            $this->empleado=$empleado;
            $this->empresa=$empresa;
            $this->titulo=$titulo;
            $this->rubro=$rubro;
            $this->descripcion=$descripcion;
            $this->fecha_inicio=$fecha_inicio;
            $this->fecha_fin=$fecha_fin;
        }


        public function obtenerExperiencia(){
            $dbc = new connectServer();
            return $dbc->getQuery("CALL `getExperiencia`($this->id)");
        }
        public function insertarExperiencia(){
            $dbc = new connectServer();
            return $dbc->getQuery("SELECT `setExperiencia`($this->empleado,'$this->empresa','$this->titulo','$this->rubro','$this->descripcion','$this->fecha_inicio','$this->fecha_fin')
            AS consulta",true);
        }
    }

?>