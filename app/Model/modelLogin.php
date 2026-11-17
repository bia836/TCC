<?php

class Pessoa
{
    private $conn;

    public function __construct($conn){
        $this->conn = $conn;
    }

    public function buscarPorEmail($email)
    {

        $stmt = $this->conn->prepare("SELECT * FROM pessoas WHERE email = ?");
        $stmt->execute([$email]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}