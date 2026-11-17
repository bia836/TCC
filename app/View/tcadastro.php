
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lumi | Criar conta</title>

    <link rel="stylesheet" href="/TCC/public/assets/css/cadastro.css">
     <link rel="stylesheet" href="/TCC/public/assets/css/tema.css">
     <script src="/TCC/public/assets/js/tema.js" defer></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
</head>
<body>

    <main class="principal">

        <a class="logo" href="/TCC/public/">lumi<span>.</span></a>

        <section class="registrar">

            <div class="introducao">
                <h1>Crie sua <span>conta!</span></h1>
                <p>Comece sua jornada de aprendizado com a gente.</p>
            </div>

            <form action="/TCC/public/cadastro" method="POST" id="cadastroForm">

                <div class="campo">
                    <label for="nome">Nome completo</label>
                    <input type="text" id="nome" name="nome"
                        placeholder="Digite seu nome" required>
                </div>

                <div class="campo">
                    <label for="usuario">Nome de usuário</label>
                    <input type="text" id="usuario" name="usuario"
                        placeholder="Escolha um usuário" required>
                </div>

                <div class="campo">
                    <label for="email">E-mail</label>
                    <input type="email" id="email" name="email"
                        placeholder="Digite seu e-mail" required>
                </div>

               <div class="campo">
    <label for="senha">Senha</label>

    <input
        type="password"
        id="senha"
        name="senha"
        placeholder="Crie uma senha"
        required
    >

    <small id="avisoSenha" class="aviso">
        A senha precisa ter pelo menos 8 caracteres.
    </small>

    <?php if (!empty($erro_cadastro)): ?>
        <small class="aviso"><?= htmlspecialchars($erro_cadastro) ?></small>
    <?php endif; ?>
</div>
            <input
                 type="hidden"
                 name="id_ano"
                 value="<?= htmlspecialchars((string) ($id_ano ?? '')) ?>"
             >

                <button type="submit" class="botao">
                    Criar minha conta
                    <span>→</span>
                </button>

            </form>

            <p class="login">
                Já tem uma conta?
                <a href="/TCC/public/login">Entrar</a>
            </p>

        </section>

    </main>

    <script>
    const formulario = document.getElementById('cadastroForm');
    const senha = document.getElementById('senha');
    const aviso = document.getElementById('avisoSenha');

    formulario.addEventListener('submit', function(event) {

        if (senha.value.length < 8) {
            event.preventDefault();
            aviso.style.display = 'block';
        } else {
            aviso.style.display = 'none';
        }

    });

    senha.addEventListener('input', function() {
        if (senha.value.length >= 8) {
            aviso.style.display = 'none';
        }
    });
</script>
</body>
</html>
