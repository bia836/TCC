
<?php

require_once __DIR__ . '/../Model/modelConteudo.php';

class Video
{
    private Conteudo $conteudoModel;

    public function __construct($conn)
    {
        $this->conteudoModel = new Conteudo($conn);
    }

    // Página que mostra os cards das matérias
    public function materias()
    {

        $id_ano = $_SESSION['id_ano'] ?? null;

        if (!$id_ano) {
            header('Location: /TCC/public/login');
            exit;
        }

        $materias = $this->conteudoModel->listarAno($id_ano);

        require __DIR__ . '/../View/conteudomateria.php';
    }

    // Página que mostra os conteúdos da matéria selecionada
    public function conteudos()
    {
        $id_ano = $_SESSION['id_ano'] ?? null;

        if (!$id_ano) {
            header('Location: /TCC/public/login');
            exit;
        }

        $id_materia = filter_input(
            INPUT_GET,
            'id_materia',
            FILTER_VALIDATE_INT
        );

        if (!$id_materia || $id_materia <= 0) {
            http_response_code(400);
            echo "Matéria inválida.";
            return;
        }

        $conteudos = $this->conteudoModel->buscarPorMateria($id_materia);

        $mensagem = '';

        if (empty($conteudos)) {
            $mensagem = 'Ainda não existem conteúdos cadastrados para esta matéria.';
        }

        require __DIR__ . '/../View/conteudo.php';
    }
}
