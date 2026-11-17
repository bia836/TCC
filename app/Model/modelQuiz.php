<?php


class Quiz
{
    private $conn;

    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    /* Lista os níveis (1º, 2º, 3º ano e Vestibular) que já têm questões cadastradas. */
    public function listarAnos()
    {
        $sql = "SELECT an.id_ano,
                       an.nome_ano,
                       COUNT(a.id) AS total,
                       COUNT(DISTINCT a.id_materia) AS materias
                FROM anos an
                INNER JOIN materias m ON m.id_ano = an.id_ano
                INNER JOIN atividades a ON a.id_materia = m.id_materia
                GROUP BY an.id_ano, an.nome_ano
                ORDER BY an.id_ano";

        return $this->conn->query($sql)->fetchAll(PDO::FETCH_ASSOC);
    }

    public function buscarAno($id_ano)
    {
        $stmt = $this->conn->prepare("SELECT id_ano, nome_ano FROM anos WHERE id_ano = ?");
        $stmt->execute([$id_ano]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    /* Matérias de um nível que têm pelo menos uma questão. */
    public function listarMaterias($id_ano)
    {
        $sql = "SELECT m.id_materia, m.materia, COUNT(a.id) AS total
                FROM materias m
                INNER JOIN atividades a ON a.id_materia = m.id_materia
                WHERE m.id_ano = ?
                GROUP BY m.id_materia, m.materia
                ORDER BY m.id_materia";

        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$id_ano]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function materiaPertenceAoAno($id_materia, $id_ano)
    {
        $stmt = $this->conn->prepare("SELECT 1 FROM materias WHERE id_materia = ? AND id_ano = ?");
        $stmt->execute([$id_materia, $id_ano]);
        return (bool) $stmt->fetchColumn();
    }

    public function sortearPorAno($id_ano, $limite = null)
    {
        $sql = "SELECT a.id
                FROM atividades a
                INNER JOIN materias m ON a.id_materia = m.id_materia
                WHERE m.id_ano = :ano
                ORDER BY RAND()";

        if ($limite) {
            $sql .= " LIMIT :limite";
        }

        $stmt = $this->conn->prepare($sql);
        $stmt->bindValue(':ano', (int) $id_ano, PDO::PARAM_INT);

        if ($limite) {
            $stmt->bindValue(':limite', (int) $limite, PDO::PARAM_INT);
        }

        $stmt->execute();
        return array_map('intval', $stmt->fetchAll(PDO::FETCH_COLUMN));
    }

    public function sortearPorMateria($id_materia)
    {
        $stmt = $this->conn->prepare("SELECT id FROM atividades WHERE id_materia = ? ORDER BY RAND()");
        $stmt->execute([$id_materia]);
        return array_map('intval', $stmt->fetchAll(PDO::FETCH_COLUMN));
    }

    /* Pergunta + nome da matéria. */
    public function buscarQuestao($id_atividade)
    {
        $sql = "SELECT a.id, a.pergunta, m.materia
                FROM atividades a
                INNER JOIN materias m ON a.id_materia = m.id_materia
                WHERE a.id = ?";

        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$id_atividade]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function listarAlternativas($id_atividade)
    {
        $stmt = $this->conn->prepare("SELECT id, texto FROM alternativas WHERE id_atividade = ?");
        $stmt->execute([$id_atividade]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function buscarAlternativa($id_alternativa, $id_atividade)
    {
        $stmt = $this->conn->prepare("SELECT id, texto, correta FROM alternativas WHERE id = ? AND id_atividade = ?");
        $stmt->execute([$id_alternativa, $id_atividade]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function buscarCorreta($id_atividade)
    {
        $stmt = $this->conn->prepare("SELECT id, texto FROM alternativas WHERE id_atividade = ? AND correta = 1 LIMIT 1");
        $stmt->execute([$id_atividade]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function salvarProgresso($id_usuario, $id_atividade, $acertou)
    {
        $stmt = $this->conn->prepare("INSERT INTO progresso (id_usuario, id_atividade, acertou) VALUES (?, ?, ?)");
        return $stmt->execute([$id_usuario, $id_atividade, $acertou ? 1 : 0]);
    }

    public function buscarDetalhes(array $ids)
    {
        if (empty($ids)) {
            return [];
        }

        $marcadores = implode(',', array_fill(0, count($ids), '?'));

        $sql = "SELECT a.id, a.pergunta, m.materia
                FROM atividades a
                INNER JOIN materias m ON a.id_materia = m.id_materia
                WHERE a.id IN ($marcadores)";

        $stmt = $this->conn->prepare($sql);
        $stmt->execute(array_values($ids));

        $mapa = [];
        foreach ($stmt->fetchAll(PDO::FETCH_ASSOC) as $linha) {
            $mapa[(int) $linha['id']] = $linha;
        }
        return $mapa;
    }

    public function buscarTextos(array $ids)
    {
        if (empty($ids)) {
            return [];
        }

        $marcadores = implode(',', array_fill(0, count($ids), '?'));

        $stmt = $this->conn->prepare("SELECT id, texto FROM alternativas WHERE id IN ($marcadores)");
        $stmt->execute(array_values($ids));

        $mapa = [];
        foreach ($stmt->fetchAll(PDO::FETCH_ASSOC) as $linha) {
            $mapa[(int) $linha['id']] = $linha['texto'];
        }
        return $mapa;
    }
}
