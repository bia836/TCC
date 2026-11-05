
<?php

require_once __DIR__ . '/../Model/modelPlanejamento.php';

class PlanejamentoController
{
    private $planejamentoModel;

    public function __construct($conn)
    {
        $this->planejamentoModel = new Planejamento($conn);
    }

    // Listar tarefas
    public function listar()
    {
        $id_pessoa = $_SESSION['id_pessoa'];

        $tarefas = $this->planejamentoModel->listarTarefas($id_pessoa);

        require __DIR__ . '/../View/home.php';
    }

    // Adicionar tarefa
    public function adicionar()
    {
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            http_response_code(405);
            exit;
        }

        $id_pessoa = $_SESSION['id_pessoa'];
        $titulo = trim($_POST['titulo'] ?? '');
        $data_tarefa = $_POST['data_tarefa'] ?? '';

        if ($titulo === '' || $data_tarefa === '') {
            header('Location: /TCC/public/home');
            exit;
        }

        $data = DateTime::createFromFormat('Y-m-d', $data_tarefa);

        if (!$data || $data->format('Y-m-d') !== $data_tarefa) {
            header('Location: /TCC/public/home');
            exit;
        }

        $this->planejamentoModel->adicionarTarefa(
            $id_pessoa,
            $titulo,
            $data_tarefa
        );

        header('Location: /TCC/public/home');
        exit;
    }

    // Concluir ou reabrir tarefa
    public function concluir()
    {
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            http_response_code(405);
            exit;
        }

        $id_pessoa = $_SESSION['id_pessoa'];
        $id_planejamento = filter_input(INPUT_POST, 'id_planejamento', FILTER_VALIDATE_INT);
        $concluida = filter_input(INPUT_POST, 'concluida', FILTER_VALIDATE_INT);

        if (!$id_planejamento || !in_array($concluida, [0, 1], true)) {
            header('Location: /TCC/public/home');
            exit;
        }

        $this->planejamentoModel->atualizarStatus(
            $id_planejamento,
            $id_pessoa,
            $concluida
        );

        header('Location: /TCC/public/home');
        exit;
    }

    // Excluir tarefa
    public function excluir()
    {
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            http_response_code(405);
            exit;
        }

        $id_pessoa = $_SESSION['id_pessoa'];
        $id_planejamento = filter_input(INPUT_POST, 'id_planejamento', FILTER_VALIDATE_INT);

        if ($id_planejamento) {
            $this->planejamentoModel->excluirTarefa(
                $id_planejamento,
                $id_pessoa
            );
        }

        header('Location: /TCC/public/home');
        exit;
    }
}
