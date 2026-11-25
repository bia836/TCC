
<?php

class Conteudo
{
    private $conn;

    public function __construct($conn)
    {
        $this->conn=$conn;
    }
 
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

    public function listarAnos(): array {
        return $this->conn->query("SELECT id_ano, nome_ano FROM anos ORDER BY id_ano")->fetchAll(PDO::FETCH_ASSOC);
    }

    public function listarMaterias(): array {
        return $this->conn->query("SELECT id_materia, materia, id_ano FROM materias ORDER BY id_ano, materia")->fetchAll(PDO::FETCH_ASSOC);
    }

    public function listarTodos(): array {
        $sql = "SELECT c.id, c.titulo, c.descricao, c.url_video, c.tipo,
                       c.texto_conteudo, c.id_materia, m.materia, m.id_ano, a.nome_ano
                FROM conteudos c
                LEFT JOIN materias m ON m.id_materia = c.id_materia
                LEFT JOIN anos a ON a.id_ano = m.id_ano
                ORDER BY c.id DESC";
        return $this->conn->query($sql)->fetchAll(PDO::FETCH_ASSOC);
    }

    public function buscarPorId(int $id): array|false {
        $sql = "SELECT c.id, c.titulo, c.descricao, c.url_video, c.tipo,
                       c.texto_conteudo, c.id_materia, m.id_ano
                FROM conteudos c
                LEFT JOIN materias m ON m.id_materia = c.id_materia
                WHERE c.id = :id LIMIT 1";
        $s = $this->conn->prepare($sql);
        $s->execute([':id' => $id]);
        return $s->fetch(PDO::FETCH_ASSOC);
    }

    public function materiaPertenceAno(int $idMateria, int $idAno): bool {
        $s = $this->conn->prepare("SELECT COUNT(*) FROM materias WHERE id_materia = :materia AND id_ano = :ano");
        $s->execute([':materia' => $idMateria, ':ano' => $idAno]);
        return (int)$s->fetchColumn() > 0;
    }

    public function criar(array $d): bool {
        $s = $this->conn->prepare("INSERT INTO conteudos (titulo, descricao, url_video, tipo, id_materia, texto_conteudo)
                                   VALUES (:titulo, :descricao, :url_video, :tipo, :id_materia, :texto_conteudo)");
        return $s->execute([
            ':titulo' => $d['titulo'], ':descricao' => $d['descricao'],
            ':url_video' => $d['url_video'], ':tipo' => $d['tipo'],
            ':id_materia' => $d['id_materia'], ':texto_conteudo' => $d['texto_conteudo']
        ]);
    }

    public function atualizar(int $id, array $d): bool {
        $s = $this->conn->prepare("UPDATE conteudos
                                   SET titulo=:titulo, descricao=:descricao, url_video=:url_video,
                                       tipo=:tipo, id_materia=:id_materia, texto_conteudo=:texto_conteudo
                                   WHERE id=:id");
        return $s->execute([
            ':titulo' => $d['titulo'], ':descricao' => $d['descricao'],
            ':url_video' => $d['url_video'], ':tipo' => $d['tipo'],
            ':id_materia' => $d['id_materia'], ':texto_conteudo' => $d['texto_conteudo'],
            ':id' => $id
        ]);
    }

    public function excluir(int $id): bool {
        $s = $this->conn->prepare("DELETE FROM conteudos WHERE id=:id");
        $s->execute([':id' => $id]);
        return $s->rowCount() > 0;
    }

}
