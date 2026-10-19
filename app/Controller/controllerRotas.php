<?php

class PaginaInicialController
{

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

    public function home()
{
     if (empty($_SESSION['id_pessoa'])) {
        header('Location: /TCC/public/login');
        exit;
    }
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

}