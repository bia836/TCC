
<?php
require_once __DIR__ . '/../Model/modelResumo.php';

// require("../../config/conecta.php");
// require("../Model/modelResumo.php");
// require __DIR__ . "/controllersessao.php";

class ResumoController
{
    private Resumo $resumoModel;

    public function __construct($conn)
    {
        $this->resumoModel = new Resumo($conn);
    }

   public function listarAno()
{
    $id_pessoa = $_SESSION['id_pessoa'] ?? null;
    $id_ano = $_SESSION['id_ano'] ?? null;

    if (!$id_pessoa || !$id_ano) {
        header('Location: /TCC/public/login');
        exit;
    }

    $id_materia = filter_input(
        INPUT_GET,
        'id_materia',
        FILTER_VALIDATE_INT
    );

    if ($id_materia) {
        $resumos = $this->resumoModel->buscarResumos(
            $id_pessoa,
            $id_materia
        );

        require __DIR__ . '/../View/abaResumo.php';
        return;
    }

    $materias = $this->resumoModel->listarAno($id_ano);

    require __DIR__ . '/../View/abaResumo.php';
}


//    public function buscarResumos()
// {

//     $id_pessoa = $_SESSION['id_pessoa'];
//     $id_materia = filter_input(INPUT_GET, 'id_materia', FILTER_VALIDATE_INT);

//     if (!$id_materia) {
//         http_response_code(400);
//         exit('Matéria inválida.');
//     }

//     $resumos = $this->resumoModel->buscarResumos(
//         $id_pessoa,
//         $id_materia
//     );

//     require_once __DIR__ . '/../View/abaResumo.php';
// }

    public function salvarResumo()
    {
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            http_response_code(405);
            return;
        }

        $id_pessoa = $_SESSION['id_pessoa'] ?? null;
        $id_materia = filter_input(INPUT_POST, 'id_materia', FILTER_VALIDATE_INT);
        $titulo = trim($_POST['titulo'] ?? '');
        $conteudo = trim($_POST['conteudo'] ?? '');

        if (!$id_pessoa || !$id_materia || $titulo === '' || $conteudo === '') {
            http_response_code(400);
            echo 'Preencha todos os campos corretamente.';
            return;
        }

        $this->resumoModel->salvarResumo(
            $id_pessoa,
            $id_materia,
            $titulo,
            $conteudo
        );

        header('Location: /TCC/public/abaResumo?id_materia=' . $id_materia);
exit;
    }

    public function editar()
    {
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            http_response_code(405);
            return;
        }

        $id_pessoa = $_SESSION['id_pessoa'] ?? null;
        $id_materia = filter_input(INPUT_POST, 'id_materia', FILTER_VALIDATE_INT);
        $id = filter_input(INPUT_POST, 'id', FILTER_VALIDATE_INT);
        $titulo = trim($_POST['titulo'] ?? '');
        $conteudo = trim($_POST['conteudo'] ?? '');

        if (!$id_pessoa || !$id_materia || !$id ||
            $titulo === '' || $conteudo === '') {
            http_response_code(400);
            echo 'Dados inválidos para editar o resumo.';
            var_dump($id_pessoa, $id_materia, $id,
            $titulo, $conteudo);
            return;
        }

        $this->resumoModel->editar(
            $id_pessoa,
            $id_materia,
            $id,
            $titulo,
            $conteudo
        );

        header('Location: /TCC/public/abaResumo?id_materia=' . $id_materia);
exit;
    }

    public function excluir()
    {
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            http_response_code(405);
            return;
        }

        $id_pessoa = $_SESSION['id_pessoa'] ?? null;
        $id_materia = filter_input(INPUT_POST, 'id_materia', FILTER_VALIDATE_INT);
        $id = filter_input(INPUT_POST, 'id', FILTER_VALIDATE_INT);

        if (!$id_pessoa || !$id_materia || !$id) {
            http_response_code(400);
            echo 'Dados inválidos para excluir o resumo.';
            return;
        }

        $this->resumoModel->excluir(
            $id,
            $id_pessoa,
            $id_materia
        );

        header('Location: /TCC/public/abaResumo?id_materia=' . $id_materia);
exit;
    }
}
