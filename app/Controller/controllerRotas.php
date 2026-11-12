<?php

require_once __DIR__ . '/../Model/modelPlanejamento.php';
require_once __DIR__ . '/../Model/modelCadastro.php';

class PaginaInicialController
{

   private $planejamentoModel;
   private $cadastroModel;

    public function __construct($conn)
     {
       $this->planejamentoModel = new Planejamento($conn);
       $this->cadastroModel = new Cadastro($conn);
     }

    public function index()
    {
        require_once __DIR__ . '/../View/inicial.php';
    }

    public function proposit()
{
    require_once __DIR__ . '/../View/proposit.php';
}

 public function anosem()
{
    require_once __DIR__ . '/../View/anosem.php';
}

    public function anosf1()
{
    require_once __DIR__ . '/../View/anosf1.php';
}

    public function anosf2()
{
    require_once __DIR__ . '/../View/anosf2.php';
}

 public function home()
{
    if (empty($_SESSION['id_pessoa'])) {
        header('Location: /TCC/public/login');
        exit;
    }

    $id_pessoa = $_SESSION['id_pessoa'];

    $tarefas = $this->planejamentoModel->listarTarefas($id_pessoa);

    require_once __DIR__ . '/../View/home.php';
}

    public function atividades(){
         if (empty($_SESSION['id_pessoa'])) {
        header('Location: /TCC/public/login');
        exit;
    }
        require_once __DIR__ . '/../View/atividades.php';
    }

    public function perfil(){
         if (empty($_SESSION['id_pessoa'])) {
        header('Location: /TCC/public/login');
        exit;
    }
     $id_pessoa = $_SESSION['id_pessoa'];

    $pessoa = $this->cadastroModel->buscarPorId($id_pessoa);

    if (!$pessoa) {
        http_response_code(404);
        exit('Estudante não encontrado.');
    }
        require_once __DIR__ . '/../View/perfil.php';
    }

    public function config(){
         if (empty($_SESSION['id_pessoa'])) {
        header('Location: /TCC/public/login');
        exit;
    }
        require_once __DIR__ . '/../View/config.php';
    }

    public function abaResumo(){
         if (empty($_SESSION['id_pessoa'])) {
        header('Location: /TCC/public/login');
        exit;
    }
        require_once __DIR__ . '/../View/abaResumo.php';
    }

    public function criaR(){
         if (empty($_SESSION['id_pessoa'])) {
        header('Location: /TCC/public/login');
        exit;
    }
        require_once __DIR__ . '/../View/criarResumo.php';
    }

    public function conteudos(){
        if (empty($_SESSION['id_pessoa'])) {
        header('Location: /TCC/public/login');
        exit;
    }
        require_once __DIR__ . '/../View/conteudo.php';

    }

    public function conteudomateria(){
        if (empty($_SESSION['id_pessoa'])) {
        header('Location: /TCC/public/login');
        exit;
    }
        require_once __DIR__ . '/../View/conteudomateria.php';

    }
}