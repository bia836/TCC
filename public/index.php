
<?php

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

require_once __DIR__ . '/../config/conecta.php';

require_once __DIR__ . '/../app/Core/Router.php';

$basePath = '/TCC/public';
//sempre que forem colocar caminhos ou acessar pelo navegador, digitem /TCC/public/ (isso abre a landing page) e o nome doq querem abrir.

//requere os controllers
spl_autoload_register(function ($class) {
    $controllers = [
        'PaginaInicialController' => __DIR__ . '/../app/Controller/controllerRotas.php',
        'CadastroController' => __DIR__ . '/../app/Controller/controllercadastro.php',
        'LoginController' => __DIR__ . '/../app/Controller/controllerlogin.php',
        'ResumoController' => __DIR__ . '/../app/Controller/controllerresumo.php',
        'ProcessarController' => __DIR__ . '/../app/Controller/controllerprocessar.php',
        'SessaoController' => __DIR__ . '/../app/Controller/controllersessao.php',
        'LogoutController' => __DIR__ . '/../app/Controller/controllerlogout.php',
    ];

    if (isset($controllers[$class])) {
        require_once $controllers[$class];
    }
});

$router = new Router($conn, $basePath);

// registrar rotas públicas. 
$router->add('GET', '/', 'PaginaInicialController', 'index');
//GET é o método http. / é meio q o nome da url. 'PaginaInicialController' é o nome dado ao controllerRotas. index é a função.
$router->add('GET', '/proposit', 'PaginaInicialController', 'proposit');
$router->add('GET', '/anosem', 'PaginaInicialController', 'anosem');
$router->add('GET', '/cadastro', 'CadastroController', 'index');
$router->add('POST', '/cadastro', 'CadastroController', 'cadastrar');
$router->add('GET', '/home', 'PaginaInicialController', 'home');
$router->add('GET', '/atividades', 'PaginaInicialController', 'atividades');
$router->add('GET', '/perfil', 'PaginaInicialController', 'perfil');
$router->add('GET', '/config', 'PaginaInicialController', 'config');
$router->add('GET', '/login', 'LoginController', 'showLogin');
$router->add('POST', '/login', 'LoginController', 'login');

// rotas que exigem uma sessão autenticada.
$router->add('GET', '/dashboard', 'ProcessarController', 'index', true);
$router->add('POST', '/processar', 'ProcessarController', 'processar', true);

$router->add('GET', '/abaResumo', 'ResumoController', 'listarAno', true);
$router->add('GET', '/resumos', 'ResumoController', 'index', true);
$router->add('GET', '/criarResumos', 'PaginaInicialController', 'criaR', true);

$router->add('POST', '/resumos/editar', 'ResumoController', 'editar', true);
$router->add('POST', '/resumos/excluir', 'ResumoController', 'excluir', true);
$router->add('POST', '/criarResumos/salvar', 'ResumoController', 'salvarResumo', true);
$router->add('POST', '/perfil/editar', 'CadastroController', 'editar', true);
$router->add('POST', '/perfil/excluir', 'CadastroController', 'excluir', true);

$router->add('POST', '/logout', 'LogoutController', 'logout', true);

$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$method = $_SERVER['REQUEST_METHOD'];

if (strpos($uri, $basePath) === 0) {
    $uri = substr($uri, strlen($basePath));
} elseif (strpos($uri, '/TCC') === 0) {
    $uri = substr($uri, strlen('/TCC'));
}

$uri = '/' . trim($uri, '/');

if ($uri === '//') {
    $uri = '/';
}


$router->dispatch($uri, $method);
