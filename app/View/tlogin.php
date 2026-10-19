<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css">
    <link rel="stylesheet" href="/TCC/public/assets/css/login.css">
    <title>Document</title>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+Oriya:wght@400..700&family=Roboto+Mono:ital,wght@0,100..700;1,100..700&display=swap" rel="stylesheet">
</head>
<body>
    <main class="container">
        <form action="/TCC/public/login" method="post">

            <h1>Login</h1>

            <div class="input-box">
                <input placeholder="E-mail" type="email" name="email" required>
                <i class="bx bxs-user"></i>
            </div>

            <div class="input-box">
                <input placeholder="Senha" type="password" name="senha" required>
                <i class="bx bxs-lock-alt"></i>
            </div>

            <div class="lembrar-esquecer">
                <label>
                <input type="checkbox"> 
                Lembrar minha senha
                </label>

                <a href="#">Esqueci minha senha</a>
            </div>

                <button type="submit" class="login">Login</button>

            <div class="registrar">
                <p>Não tem uma conta? <a href="tcadastro.php">Cadastre-se</a></p>
            </div>

        </form>

    </main>
</body>
</html>