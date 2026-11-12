<?php

$paginaAtual = "atividades";
$esc = fn($texto) => htmlspecialchars((string) $texto, ENT_QUOTES, 'UTF-8');

$letras = ['A', 'B', 'C', 'D', 'E'];
$respondida = $resposta !== null;
$ehUltima = $numero >= $total;
?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Lumi | Questão <?= (int) $numero ?> de <?= (int) $total ?></title>

    <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css">

    <link rel="stylesheet" href="/TCC/public/assets/css/home.css">
    <link rel="stylesheet" href="/TCC/public/assets/css/quizzes.css">
     <link rel="stylesheet" href="/TCC/public/assets/css/tema.css">
    <script src="/TCC/public/assets/js/tema.js" defer></script>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
</head>

<body>

    <?php include __DIR__ . '../menuLateral.php'; ?>

    <main class="conteudoQuiz">

        <header class="topoQuiz">

            <a href="/TCC/public/quizzes/sair" class="voltarQuiz"
               onclick="return confirm('Deseja sair do quiz? Seu andamento será perdido.')">
                <i class="bx bx-arrow-back"></i>
                Sair do quiz
            </a>

            <span class="contadorQuiz">
                Questão <?= (int) $numero ?> de <?= (int) $total ?>
            </span>

        </header>

        <div class="barraProgresso" role="progressbar"
             aria-valuenow="<?= (int) $percentual ?>" aria-valuemin="0" aria-valuemax="100">
            <div class="preenchimentoProgresso" style="width: <?= (int) $percentual ?>%"></div>
        </div>

        <?php if (!empty($erro)): ?>
            <div class="avisoQuiz">
                <i class="bx bx-info-circle"></i>
                <p><?= $esc($erro) ?></p>
            </div>
        <?php endif; ?>

        <section class="cardQuestao">

            <span class="etiqueta"><?= $esc($questao["materia"]) ?></span>

            <h1 class="enunciadoQuestao"><?= $esc($questao['pergunta']) ?></h1>

            <?php if (!$respondida): ?>

                <!-- ANTES DE RESPONDER -->
                <form action="/TCC/public/quizzes/responder" method="POST">

                    <div class="listaAlternativas">

                        <?php foreach ($alternativas as $i => $alt): ?>

                            <label class="alternativaQuiz">
                                <input type="radio" name="id_alternativa" value="<?= (int) $alt['id'] ?>" required>
                                <span class="corpoAlternativa">
                                    <span class="letraAlternativa"><?= $letras[$i] ?? '' ?></span>
                                    <span class="textoAlternativa"><?= $esc($alt['texto']) ?></span>
                                </span>
                            </label>

                        <?php endforeach; ?>

                    </div>

                    <button type="submit" class="botaoQuiz">
                        <i class="bx bx-check"></i>
                        Responder
                    </button>

                </form>

            <?php else: ?>

                <!-- DEPOIS DE RESPONDER -->
                <div class="listaAlternativas">

                    <?php foreach ($alternativas as $i => $alt):
                        $idAlt = (int) $alt['id'];
                        $classe = 'alternativaNeutra';
                        $icone = '';

                        if ($idAlt === $resposta['id_correta']) {
                            $classe = 'alternativaCorreta';
                            $icone = 'bx-check-circle';
                        } elseif ($idAlt === $resposta['id_alternativa']) {
                            $classe = 'alternativaErrada';
                            $icone = 'bx-x-circle';
                        }
                    ?>

                        <div class="alternativaQuiz alternativaTravada <?= $classe ?>">
                            <span class="corpoAlternativa">
                                <span class="letraAlternativa"><?= $letras[$i] ?? '' ?></span>
                                <span class="textoAlternativa"><?= $esc($alt['texto']) ?></span>
                                <?php if ($icone): ?>
                                    <i class="bx <?= $icone ?> iconeResposta"></i>
                                <?php endif; ?>
                            </span>
                        </div>

                    <?php endforeach; ?>

                </div>

                <div class="retornoQuiz <?= $resposta['acertou'] ? 'retornoAcerto' : 'retornoErro' ?>">
                    <i class="bx <?= $resposta['acertou'] ? 'bx-check-circle' : 'bx-x-circle' ?>"></i>
                    <p>
                        <?php if ($resposta['acertou']): ?>
                            <strong>Resposta correta!</strong> Muito bem, continue assim.
                        <?php else: ?>
                            <strong>Não foi dessa vez.</strong> A alternativa correta está destacada em verde.
                        <?php endif; ?>
                    </p>
                </div>

                <form action="/TCC/public/quizzes/proxima" method="POST">
                    <button type="submit" class="botaoQuiz">
                        <?= $ehUltima ? 'Ver resultado' : 'Próxima questão' ?>
                        <i class="bx bx-right-arrow-alt"></i>
                    </button>
                </form>

            <?php endif; ?>

        </section>

    </main>

</body>
</html>
