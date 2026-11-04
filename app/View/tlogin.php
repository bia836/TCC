<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Lumi | Login</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/TCC/public/assets/css/login.css">
</head>

<body>

    <main class="container">

        <a href="/TCC/public/" class="logo">lumi.</a>

        <section class="conteudo">

            <h1>Que bom ter você de volta!</h1>

            <p class="subtitulo">
                Entre na sua conta e continue aprendendo.
            </p>

            <form action="/TCC/public/login" method="POST">

                <div class="campo">
                    <label for="email">E-mail</label>

                    <input
                        type="email"
                        id="email"
                        name="email"
                        placeholder="Digite seu e-mail"
                        required
                    >
                </div>

                <div class="campo">
                    <label for="senha">Senha</label>

                    <input
                        type="password"
                        id="senha"
                        name="senha"
                        placeholder="Digite sua senha"
                        required
                    >
                </div>

                <div class="opcoes">

                    <label>
                        <input type="checkbox" name="lembrar">
                        Lembrar de mim
                    </label>

                    <a href="#">Esqueceu a senha?</a>

                </div>

                <button type="submit" class="botao">
                    Entrar <span>→</span>
                </button>

            </form>

            <div class="registrar">
                <p>
                    Ainda não tem uma conta?
                    <a href="/TCC/public/proposit">Cadastre-se</a>
                </p>
            </div>

        </section>

    </main>

</body>
</html>