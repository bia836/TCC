<?php
/*
   HOME
   Tela inicial exibida depois que o perfil é criado.
   O menu lateral fica em menuLateral.php (compartilhado).
*/
// require __DIR__ . "/TCC/public/SessaoController";
$paginaAtual = "home";
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lumi - Home</title>
    <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css">
    <link rel="stylesheet" href="/TCC/public/assets/css/home.css">
</head>
<body>
    <?php include "menuLateral.php"; ?>

    <main class="conteudoHome">
        <h1>Bem-vindo ao Lumi</h1>
        <p>Seu perfil foi criado.</p>
    </main>
</body>
</html>
