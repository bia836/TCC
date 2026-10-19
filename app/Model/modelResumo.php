<?php

class Resumo {

private $conn;

    public function __construct($conn){
        // global $conn;
        $this->conn = $conn;
    }

public function salvarResumo ($id_pessoa, $id_materia, $titulo, $conteudo){
    $stmt = $this->conn->prepare("INSERT INTO resumos (id_pessoa, id_materia, titulo, conteudo) VALUES (?, ?, ?, ?)"); 
    return  $stmt->execute([$id_pessoa, $id_materia, $titulo, $conteudo]);
    // $query = "INSERT INTO resumos (id_pessoa, titulo, conteudo)
    // VALUES (?, ?, ?)";

    // $stmt = $conn->prepare($query);
    //     $stmt->bind_param("iss", $id_pessoas, $titulo, $conteudo);

    //     return $stmt->execute();
}

public function listarAno($id_ano){
    $stmt = $this->conn->prepare("SELECT * FROM materias WHERE id_ano = ?");
    $stmt->execute([$id_ano]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC); 
}

public function buscarResumos($id_pessoa, $id_materia)
{
    $stmt = $this->conn->prepare("SELECT * FROM resumos WHERE id_pessoa = ? AND id_materia = ? ORDER BY criado_em DESC");
    $stmt->execute([$id_pessoa, $id_materia]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
    // $sql = "SELECT *
    //         FROM resumos
    //         WHERE id_pessoa = ?";

    // $stmt = $conn->prepare($sql);

    // $stmt->bind_param("i", $id_pessoa);

    // $stmt->execute();

    // return $stmt->get_result();
}

public function editar($id_pessoa, $id_materia, $id, $titulo, $conteudo){
        $stmt = $this->conn->prepare("UPDATE resumos SET titulo = :titulo, conteudo = :conteudo WHERE id = :id AND id_pessoa = :id_pessoa AND id_materia = :id_materia");
        return $stmt->execute([':id_materia' => $id_materia,
            ':id' => $id,
            ':id_pessoa' => $id_pessoa,
            ':titulo' => $titulo,
            ':conteudo' => $conteudo
        ]);
}

public function excluir($id, $id_pessoa, $id_materia){
        $stmt = $this->conn->prepare("DELETE FROM resumos WHERE id = ? AND id_pessoa = ? AND id_materia = ?");
        return $stmt->execute([$id, $id_pessoa, $id_materia]); 
}

}