<?php

class vacanteClass
{
    private $id;
    private $titulo;
    private $descripcion;
    private $salario;
    private $cantidad;
    private $ubicacion;
    private $requisitos;
    private $empresa;


    public function __construct($id, $titulo = "", $descripcion = "", $salario = 0.0, $cantidad = 0, $ubicacion = "", $requisitos = "", $empresa = 0)
    {
        if (isset($id)) {
            $this->id = $id;
        } else {
            $id = "";
        }
        $this->titulo = $titulo;
        $this->descripcion = $descripcion;
        $this->salario = $salario;
        $this->cantidad = $cantidad;
        $this->ubicacion = $ubicacion;
        $this->requisitos = $requisitos;
        $this->empresa = $empresa;
    }

    public function obtenerVacante()
    {
        if ($this->id == 0 || $this->id == ""|| $this->id == null) {
            $dbc = new connectServer();
            return $dbc->getQuery("CALL getVacante($this->id)");
        } else {
            $dbc = new connectServer();
            $consulta_1 = $dbc->getQuery("CALL `getVacante`($this->id)", true);

            return [
                "vacante" => $consulta_1,
                "empresa" => $dbc->getQuery("CALL getEmpresa(" . $consulta_1['vacante_empresa'] . ")", true)
            ];
        }
    }

    public function obtenerVacantes()
    {
        $dbc = new connectServer();
        return  $dbc->getQuery("CALL `getVacantes`($this->id)");
    }

    public function insertarVacante()
    {
        $dbc = new connectServer();
        return $dbc->getQuery("SELECT `setVacante`('$this->titulo','$this->descripcion',$this->salario,$this->cantidad,'$this->ubicacion','$this->requisitos',$this->empresa) AS consulta", true);
    }
}
