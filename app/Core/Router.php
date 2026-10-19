
<?php

class Router
{
    private array $routes = [];

    private $conn;

    private string $basePath;

    public function __construct($conn, string $basePath = '')
    {
        $this->conn = $conn;
        $this->basePath = rtrim($basePath, '/');
    }

    public function add(
        string $method,
        string $path,
        string $controller,
        string $action,
        bool $authRequired = false
    ): void {
        $this->routes[] = [
            'method' => strtoupper($method),
            'path' => $this->normalizePath($path),
            'controller' => $controller,
            'action' => $action,
            'authRequired' => $authRequired
        ];
    }

    public function dispatch(string $uri, string $method): void
    {
        $uri = $this->normalizePath($uri);
        $method = strtoupper($method);

        foreach ($this->routes as $route) {
            if (
                $route['method'] !== $method ||
                $route['path'] !== $uri
            ) {
                continue;
            }

            if (
                $route['authRequired'] &&
                empty($_SESSION['id_pessoa'])
            ) {
                $this->redirect('/login');
            }

            $controllerName = $route['controller'];
            $action = $route['action'];

            if (!class_exists($controllerName)) {
                http_response_code(500);
                exit('Erro interno: controller não encontrado.');
            }

            $controller = new $controllerName($this->conn);

            if (!is_callable([$controller, $action])) {
                http_response_code(500);
                exit('Erro interno: ação do controller não encontrada.');
            }

            $controller->$action();
            return;
        }

        http_response_code(404);
echo 'Página não encontrada.';
echo '<br>URL recebida pelo Router: ' . htmlspecialchars($uri);
echo '<br>Método recebido: ' . htmlspecialchars($method);
    }

    private function normalizePath(string $path): string
    {
        $path = '/' . trim($path, '/');

        return $path;
    }

    private function redirect(string $path): void
    {
        header('Location: ' . $this->basePath . $path);
        exit;
    }
}
