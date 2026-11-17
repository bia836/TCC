<?php
    $host = "localhost";
    $usuario = "root";
    $senha = "";
    $banco = "bancotcc";

    try{
        $conn = new PDO(
            "mysql:host=$host;dbname=$banco;charset=utf8mb4",
            $usuario,
            $senha
        );

        $conn->setAttribute(PDO::ATTR_ERRMODE,
    PDO::ERRMODE_EXCEPTION);
    } catch(PDOException $e){
        echo "Erro na conexão: " . $e->getMessage();
    }
    


 