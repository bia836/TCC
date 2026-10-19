<?php

require("../../config/conecta.php");
require("../Model/modelResumo.php");
require __DIR__ . "/controllersessao.php";

 $id_pessoa = $_SESSION["id_pessoa"];
    $resumoModel = new Resumo ($conn);
    $resumos = $resumoModel->buscarResumos($id_pessoa, $id_materia);