
<?php

require_once __DIR__ . '/../Model/modelCadastro.php';

class CadastroController
{
    private $cadastroModel;

    public function __construct($conn)
    {
        $this->cadastroModel = new Cadastro($conn);
    }

   public function index(){
    $id_ano = $_GET['id_ano'] ?? null;

    $erro_cadastro = $_SESSION['erro_cadastro'] ?? '';
    unset($_SESSION['erro_cadastro']);

    require __DIR__ . '/../View/tcadastro.php';
    }

  public function cadastrar()
{
    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        http_response_code(405);
        return;
    }

    $id_ano = filter_input(INPUT_POST, 'id_ano', FILTER_VALIDATE_INT);
    $nome = trim($_POST['nome'] ?? '');
    $usuario = trim($_POST['usuario'] ?? '');
    $email = trim($_POST['email'] ?? '');
    $senha = $_POST['senha'] ?? '';

    if (!$id_ano || $nome === '' || $usuario === '' ||
        !filter_var($email, FILTER_VALIDATE_EMAIL)) {

        $_SESSION['erro_cadastro'] = 'Confira se todos os campos foram preenchidos corretamente.';
        header('Location: /TCC/public/cadastro?id_ano=' . urlencode((string) $id_ano));
        exit;
    }

    if (strlen($senha) < 8) {
        $_SESSION['erro_cadastro'] = 'A senha precisa ter pelo menos 8 caracteres.';
        header('Location: /TCC/public/cadastro?id_ano=' . urlencode((string) $id_ano));
        exit;
    }

    if ($this->cadastroModel->buscarPorEmail($email)) {
        $_SESSION['erro_cadastro'] = 'Este e-mail já está cadastrado.';
        header('Location: /TCC/public/cadastro?id_ano=' . urlencode((string) $id_ano));
        exit;
    }

    $senhaHash = password_hash($senha, PASSWORD_DEFAULT);

    $id_pessoa = $this->cadastroModel->cadastrar(
        $id_ano,
        $nome,
        $usuario,
        $email,
        $senhaHash
    );

    session_regenerate_id(true);
    $_SESSION['id_pessoa'] = $id_pessoa;
    $_SESSION['id_ano'] = $id_ano;

    header('Location: /TCC/public/home');
    exit;
}

    public function editar()
    {
        $this->exigirLogin();

        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            http_response_code(405);
            return;
        }

        $id_pessoa = $_SESSION['id_pessoa'];
        $id_ano = filter_input(INPUT_POST, 'id_ano', FILTER_VALIDATE_INT);
        $nome = trim($_POST['nome'] ?? '');
        $usuario = trim($_POST['usuario'] ?? '');
        $email = trim($_POST['email'] ?? '');

        if (
            !$id_ano || $nome === '' || $usuario === '' ||
            !filter_var($email, FILTER_VALIDATE_EMAIL)
        ) {
            http_response_code(400);
            exit('Dados inválidos.');
        }

        $this->cadastroModel->atualizar(
            $id_pessoa,
            $id_ano,
            $nome,
            $usuario,
            $email
        );

        header('Location: /TCC/public/perfil');
        exit;
    }

    public function excluir()
    {
        $this->exigirLogin();

        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            http_response_code(405);
            return;
        }

        $id_pessoa = $_SESSION['id_pessoa'];

        $this->cadastroModel->deletar($id_pessoa);

        session_unset();
        session_destroy();

        header('Location: /TCC/public/');
        exit;
    }

    private function exigirLogin()
    {
        if (empty($_SESSION['id_pessoa'])) {
            header('Location: /TCC/public/login');
            exit;
        }
    }
}
