<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/TCC/public/assets/css/cadastro.css">
</head>
<body>

    <main class="principal">

        <section class="registrar">
            <h1>Seja bem-vindo!</h1>

            <form action="/TCC/public/cadastro" method="POST">
            
                <div>
                <input type="text" placeholder="Nome" name="nome" required>
                <input type="text" placeholder="Usuário" name="usuario" required>
                </div>
    
                <div>
                <input type="email" placeholder="E-mail" name="email" required>
                <input type="password" placeholder="Senha" name="senha" required>
                </div>

                <div>
                <button type="button" onclick="alert('Em breve!')" class="botao">Entrar com Google</button>
                
<input
    type="hidden"
    name="id_ano"
    value="<?= htmlspecialchars((string) ($id_ano ?? '')) ?>"
>

                <button type="submit" class="botao">Cadastrar-se</button>
                
                </div>

            </form>

        </section>

        <section>

        </section>

    </main>
</body>
</html>