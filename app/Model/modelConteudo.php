
<?php

class Conteudo
{
    private $conn;

    public function __construct($conn)
    {
        $this->conn=$conn;
    }

    // Busca todos os conteúdos de uma matéria

    
public function buscarPorMateria($id_materia)
{
    $sql = "SELECT
                c.id,
                c.titulo,
                c.descricao,
                c.url_video,
                c.tipo,
                c.texto_conteudo,
                c.id_materia,
                m.materia
            FROM conteudos c
            INNER JOIN materias m
                ON c.id_materia = m.id_materia
            WHERE c.id_materia = :id_materia
            ORDER BY c.id ASC";

    $stmt = $this->conn->prepare($sql);

    $stmt->bindValue(':id_materia', $id_materia, PDO::PARAM_INT);

    $stmt->execute();

    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}



public function listarAno($id_ano)
{
    $sql = "SELECT id_materia, materia
            FROM materias
            WHERE id_ano = :id_ano
            ORDER BY materia ASC";

    $stmt = $this->conn->prepare($sql);

    $stmt->bindValue(':id_ano', $id_ano, PDO::PARAM_INT);

    $stmt->execute();

    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

}
