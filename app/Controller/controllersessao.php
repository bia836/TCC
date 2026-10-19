
<?php

class SessaoController
{
    public function __construct($conn)
    {
    }

    public function verificarLogin()
    {
        if (empty($_SESSION['id_pessoa'])) {
            header('Location: /TCC/public/login');
            exit;
        }
    }
}
