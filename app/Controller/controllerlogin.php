
<?php

require_once __DIR__ . '/../Model/modelLogin.php';

class LoginController
{
    private Pessoa $pessoaModel;

    public function __construct($conn)
    {
        $this->pessoaModel = new Pessoa($conn);
    }

    public function showLogin()
    {
        require __DIR__ . '/../View/tlogin.php';
    }

    public function login()
    {
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            http_response_code(405);
            exit('Método não permitido.');
        }

        $email = trim($_POST['email'] ?? '');
        $senha = $_POST['senha'] ?? '';

        if (
            !filter_var($email, FILTER_VALIDATE_EMAIL) ||
            $senha === ''
        ) {
            http_response_code(400);
            exit('Informe um e-mail e uma senha válidos.');
        }

        $pessoa = $this->pessoaModel->buscarPorEmail($email);

        if (!$pessoa || !password_verify($senha, $pessoa['senha'])) {
            http_response_code(401);
            exit('E-mail ou senha incorretos.');
        }

        session_regenerate_id(true);

        $_SESSION['id_pessoa'] = $pessoa['id_pessoa'];
        $_SESSION['id_ano'] = $pessoa['id_ano'];
        $_SESSION['nome'] = $pessoa['nome'];
        $_SESSION['email'] = $pessoa['email'];

        header('Location: /TCC/public/home');
        exit;
    }
}
