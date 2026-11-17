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
// Lista todos os anos escolares
    public function listarAnos()
    {
       $sql = "SELECT id_ano, nome_ano FROM anos ORDER BY id_ano";

       $stmt = $this->conn->prepare($sql);
       $stmt->execute();

       return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }


    public function buscarPorEmail($email)
    {
        $sql = "SELECT * FROM pessoas WHERE email = ?";
        $stmt=$this->conn->prepare("$sql");
        $stmt->execute([$email]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function cadastrar($id_ano, $nome, $usuario, $email, $senha)
    {
        $stmt=$this->conn->prepare("INSERT INTO pessoas (id_ano, nome, usuario, email, senha) VALUES (?, ?, ?, ?, ?)"); 
        if($stmt->execute([$id_ano, $nome, $usuario, $email, $senha])){
        return $this->conn->lastInsertId();
        }

        return false;
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