<?php

$paginaAtual = "atividades";
$esc = fn($texto) => htmlspecialchars((string) $texto, ENT_QUOTES, 'UTF-8');

if ($percentual >= 80) {
    $titulo = 'Excelente trabalho!';
    $mensagem = 'Você domina muito bem esse conteúdo. Que tal tentar um nível mais difícil?';
} elseif ($percentual >= 50) {
    $titulo = 'Bom resultado!';
    $mensagem = 'Você está no caminho certo. Revise os erros abaixo e tente de novo.';
} else {
    $titulo = 'Continue praticando!';
    $mensagem = 'Todo mundo começa de algum lugar. Revise as questões abaixo e tente outra vez.';
}
?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Lumi | Resultado do quiz</title>

    <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css">

    <link rel="stylesheet" href="/TCC/public/assets/css/home.css">
    <link rel="stylesheet" href="/TCC/public/assets/css/quizzes.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
</head>

<body>

    <?php include __DIR__ . '../menuLateral.php'; ?>

    <main class="conteudoQuiz">

        <header class="topoQuiz">

            <a href="/TCC/public/home" class="logo">lumi<span>.</span></a>

            <a href="/TCC/public/atividades" class="voltarQuiz">
                <i class="bx bx-arrow-back"></i>
                Voltar às atividades
            </a>

        </header>

        <section class="resumoResultado">

            <!-- Anel de porcentagem: o valor vai na variável CSS --percentual -->
            <div class="anelResultado" style="--percentual: <?= (int) $percentual ?>">
                <div class="miolioAnel">
                    <strong><?= (int) $percentual ?>%</strong>
                    <span>de acertos</span>
                </div>
            </div>

            <div class="textoResultado">
                <span class="etiqueta">
                    Resultado<?= $anoQuiz ? ' | ' . $esc($anoQuiz['nome_ano']) : '' ?>
                </span>

                <h1><?= $esc($titulo) ?></h1>

                <p class="placarResultado">
                    Você acertou <strong><?= (int) $acertos ?></strong>
                    de <strong><?= (int) $respondidas ?></strong> questões.
                </p>

                <p><?= $esc($mensagem) ?></p>

                <div class="acoesResultado">
                    <a href="<?= $esc($linkRefazer) ?>" class="botaoQuiz">
                        <i class="bx bx-refresh"></i>
                        Refazer quiz
                    </a>

                    <a href="/TCC/public/quizzes" class="botaoQuiz botaoSecundario">
                        Escolher outro quiz
                    </a>
                </div>
            </div>

        </section>

        <?php if (!empty($porMateria)): ?>

            <section class="secaoQuiz">

                <div class="tituloSecaoQuiz">
                    <h2>Desempenho por matéria</h2>
                    <p>Veja onde você foi melhor e onde vale reforçar.</p>
                </div>

                <div class="listaDesempenho">

                    <?php foreach ($porMateria as $nome => $dados):
                        $pct = $dados['total'] > 0 ? (int) round(($dados['acertos'] / $dados['total']) * 100) : 0;
                    ?>

                        <div class="linhaDesempenho">
                            <div class="cabecalhoDesempenho">
                                <span><?= $esc($nome) ?></span>
                                <span><?= (int) $dados['acertos'] ?>/<?= (int) $dados['total'] ?></span>
                            </div>
                            <div class="barraProgresso">
                                <div class="preenchimentoProgresso" style="width: <?= $pct ?>%"></div>
                            </div>
                        </div>

                    <?php endforeach; ?>

                </div>

            </section>

        <?php endif; ?>

        <section class="secaoQuiz">

            <div class="tituloSecaoQuiz">
                <h2>Revisão dos erros</h2>
                <p>Entender o erro é o caminho mais rápido para acertar na próxima.</p>
            </div>

            <?php if (empty($erradas)): ?>

                <div class="estadoVazioQuiz">
                    <i class="bx bx-trophy"></i>
                    <h3>Você acertou tudo!</h3>
                    <p>Nenhuma questão para revisar neste quiz.</p>
                </div>

            <?php else: ?>

                <div class="listaRevisao">

                    <?php foreach ($erradas as $e): ?>

                        <article class="cardRevisao">

                            <span class="etiqueta"><?= $esc($e['materia']) ?></span>

                            <h3><?= $esc($e['pergunta']) ?></h3>

                            <p class="respostaErrada">
                                <i class="bx bx-x-circle"></i>
                                <span>Sua resposta: <?= $esc($e['escolhida']) ?></span>
                            </p>

                            <p class="respostaCerta">
                                <i class="bx bx-check-circle"></i>
                                <span>Resposta correta: <?= $esc($e['correta']) ?></span>
                            </p>

                        </article>

                    <?php endforeach; ?>

                </div>

            <?php endif; ?>

        </section>

        <footer class="rodapeQuiz">
            <p>Cada tentativa deixa você mais perto do seu objetivo!</p>
        </footer>

    </main>

</body>
</html>
