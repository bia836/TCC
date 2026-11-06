
<?php
$paginaAtual = "perfil";
$mensagemSenha = $_SESSION['mensagem_senha'] ?? '';
unset($_SESSION['mensagem_senha']);

$nome = htmlspecialchars($pessoa['nome'] ?? '');
$usuario = htmlspecialchars($pessoa['usuario'] ?? '');
$email = htmlspecialchars($pessoa['email'] ?? '');
$ano = htmlspecialchars($pessoa['nome_ano'] ?? 'Não informado');

$dataCadastro = !empty($pessoa['criado_em'])
    ? date('d/m/Y', strtotime($pessoa['criado_em']))
    : 'Não informado';

$inicial = strtoupper(substr($nome, 0, 1));
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lumi - Perfil</title>

    <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css">
    <link rel="stylesheet" href="/TCC/public/assets/css/home.css">
    <link rel="stylesheet" href="/TCC/public/assets/css/perfil.css">
</head>

<body>

    <?php include "menuLateral.php"; ?>

    <main class="conteudoHome">

        <section class="perfilPagina">

            <div class="tituloSecao">
                <div>
                    <h2>Meu perfil</h2>
                    <p>Visualize suas informações pessoais.</p>
                </div>
            </div>

            <div class="cartaoPerfil">

                <?php if ($mensagemSenha): ?>
                    <p class="mensagemSenha">
                        <?= htmlspecialchars($mensagemSenha) ?>
                    </p>
                <?php endif; ?>

                <div class="cabecalhoPerfil">

                    <div class="fotoPerfil">
                        <?= $inicial ?>
                    </div>

                    <div class="identificacaoPerfil">
                        <h2><?= $nome ?></h2>
                        <p>@<?= $usuario ?></p>
                    </div>

                </div>

                <!-- info atuais -->

                <div class="informacoesPerfil">

                    <div class="campoPerfil">
                        <span>Nome completo</span>
                        <p><?= $nome ?></p>
                    </div>

                    <div class="campoPerfil">
                        <span>Nome de usuário</span>
                        <p><?= $usuario ?></p>
                    </div>

                    <div class="campoPerfil">
                        <span>E-mail</span>
                        <p><?= $email ?></p>
                    </div>

                    <div class="campoPerfil">
                        <span>Ano escolar</span>
                        <p><?= $ano ?></p>
                    </div>

                    <div class="campoPerfil">
                        <span>Data de cadastro</span>
                        <p><?= $dataCadastro ?></p>
                    </div>

                </div>

                <!--edicao -->

                <details class="editarPerfil">

                    <summary>Editar perfil</summary>

                    <!--editar as infos -->

                    <form action="/TCC/public/perfil/editar" method="POST">

                        <div class="campoEdicao">
                            <label>Nome completo</label>
                            <input type="text" name="nome" value="<?= $nome ?>" required>
                        </div>

                        <div class="campoEdicao">
                            <label>Nome de usuário</label>
                            <input type="text" name="usuario" value="<?= $usuario ?>" required>
                        </div>

                        <div class="campoEdicao">
                            <label>E-mail</label>
                            <input type="email" name="email" value="<?= $email ?>" required>
                        </div>

                        <div class="campoEdicao">
                            <label>Ano escolar</label>

                            <select name="id_ano" required>
                                <option value="1" <?= (int)$pessoa['id_ano'] === 1 ? 'selected' : '' ?>>1º ano do Ensino Médio</option>
                                <option value="2" <?= (int)$pessoa['id_ano'] === 2 ? 'selected' : '' ?>>2º ano do Ensino Médio</option>
                                <option value="3" <?= (int)$pessoa['id_ano'] === 3 ? 'selected' : '' ?>>3º ano do Ensino Médio</option>
                            </select>
                        </div>

                        <button type="submit">Salvar alterações</button>

                    </form>

                    <!-- alterar senha -->

                    <h3 class="subtituloEdicao">Alterar senha</h3>

                    <form action="/TCC/public/perfil/alterar-senha" method="POST">

                        <div class="campoEdicao">
                            <label>Senha atual</label>
                            <input type="password" name="senha_atual" required>
                        </div>

                        <div class="campoEdicao">
                            <label>Nova senha</label>
                            <input type="password" name="nova_senha" minlength="8" required>
                        </div>

                        <div class="campoEdicao">
                            <label>Confirmar nova senha</label>
                            <input type="password" name="confirmar_senha" minlength="8" required>
                        </div>

                        <button type="submit">Salvar nova senha</button>

                    </form>

                </details>

            </div>

        </section>

    </main>

</body>
</html>
