
<?php

class Planejamento
{
    private $conn;

    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    // Listar tarefas do estudante
    public function listarTarefas($id_pessoa)
    {
        $sql = "SELECT * FROM planejamento
                WHERE id_pessoa = ?
                ORDER BY data_tarefa ASC, id_planejamento DESC";

        $stmt = $this->conn->prepare($sql);
        $stmt->execute([$id_pessoa]);

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Adicionar uma tarefa
    public function adicionarTarefa($id_pessoa, $titulo, $data_tarefa)
    {
        $sql = "INSERT INTO planejamento
                (id_pessoa, titulo, data_tarefa)
                VALUES (?, ?, ?)";

        $stmt = $this->conn->prepare($sql);

        return $stmt->execute([
            $id_pessoa,
            $titulo,
            $data_tarefa
        ]);
    }

    // Marcar tarefa como concluída ou pendente
    public function atualizarStatus($id_planejamento, $id_pessoa, $concluida)
    {
        $sql = "UPDATE planejamento
                SET concluida = ?
                WHERE id_planejamento = ?
                AND id_pessoa = ?";

        $stmt = $this->conn->prepare($sql);

        return $stmt->execute([
            $concluida,
            $id_planejamento,
            $id_pessoa
        ]);
    }

    // Excluir uma tarefa
    public function excluirTarefa($id_planejamento, $id_pessoa)
    {
        $sql = "DELETE FROM planejamento
                WHERE id_planejamento = ?
                AND id_pessoa = ?";

        $stmt = $this->conn->prepare($sql);

        return $stmt->execute([
            $id_planejamento,
            $id_pessoa
        ]);
    }
}
