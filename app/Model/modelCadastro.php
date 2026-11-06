<?php

class Cadastro
{
    private $conn;

    public function __construct($conn){
        $this->conn = $conn;
    }
    
    
// pega as infos do estudantes
public function buscarPorId($id_pessoa)
{
    $sql = "SELECT 
                p.id_pessoa,
                p.id_ano,
                p.nome,
                p.usuario,
                p.email,
                p.criado_em,
                a.nome_ano
            FROM pessoas p
            LEFT JOIN anos a ON p.id_ano = a.id_ano
            WHERE p.id_pessoa = ?";

    $stmt = $this->conn->prepare($sql);
    $stmt->execute([$id_pessoa]);

    return $stmt->fetch(PDO::FETCH_ASSOC);
}


    public function buscarPorEmail($email)
    {
        $sql = "SELECT * FROM pessoas WHERE email = ?";
        $stmt=$this->conn->prepare("$sql");
        $stmt->execute([$email]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
        // $query = "SELECT * FROM pessoas WHERE email = ?";

        // $stmt = $conn->prepare($query);
        // $stmt->bind_param("s", $email);
        // $stmt->execute();

        // $res = $stmt->get_result();

        // return $res->fetch_object();
    }

    public function cadastrar($id_ano, $nome, $usuario, $email, $senha)
    {
        $stmt=$this->conn->prepare("INSERT INTO pessoas (id_ano, nome, usuario, email, senha) VALUES (?, ?, ?, ?, ?)"); 
        if($stmt->execute([$id_ano, $nome, $usuario, $email, $senha])){
        return $this->conn->lastInsertId();
        }

        return false;
        // $query = "INSERT INTO pessoas (nome, usuario, email, senha)
        //           VALUES (?, ?, ?, ?)";

        // $stmt = $conn->prepare($query);
        // $stmt->bind_param("ssss", $nome, $usuario, $email, $senha);

        // return $stmt->execute();
    }

   public function atualizar ($id_pessoa, $id_ano, $nome, $usuario, $email){
        $sql = "UPDATE pessoas SET id_ano = :id_ano, nome = :nome, usuario = :usuario, email = :email WHERE id_pessoa = :id_pessoa";
        $stmt=$this->conn->prepare($sql);
        return $stmt->execute([':id_pessoa' => $id_pessoa,
':id_ano' => $id_ano,
                        ':nome' => $nome,
                        ':usuario' => $usuario,
                        ':email' => $email,
                        ]);
   }  
   
   //alteracao de senha
   public function buscarSenhaPorId($id_pessoa)
{
    $sql = "SELECT senha FROM pessoas WHERE id_pessoa = ?";
    $stmt = $this->conn->prepare($sql);
    $stmt->execute([$id_pessoa]);

    return $stmt->fetchColumn();
}

   public function atualizarSenha ($id_pessoa, $senha){
        $sql = "UPDATE pessoas SET senha = :senha WHERE id_pessoa = :id_pessoa";
        $stmt=$this->conn->prepare($sql);
        return $stmt->execute([':id_pessoa' => $id_pessoa,
                        ':senha' => $senha,
                        ]);
   }
   
   public function deletar($id_pessoa){
    $sql = "DELETE FROM pessoas WHERE id_pessoa = :id_pessoa";
    $stmt=$this->conn->prepare($sql);
    return $stmt->execute([':id_pessoa' => $id_pessoa]);
   }
}