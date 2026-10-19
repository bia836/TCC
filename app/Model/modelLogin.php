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
        // $query = ;

        // $stmt = $conn->prepare($query);
        // $stmt->bind_param("s", $email);
        // $stmt->execute();

        // $res = $stmt->get_result();

        // return $res->fetch_object();
    }
}