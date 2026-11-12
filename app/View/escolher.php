<?php

$paginaAtual = "atividades";
$esc = fn($texto) => htmlspecialchars((string) $texto, ENT_QUOTES, 'UTF-8');

?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Lumi | Quizzes</title>

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

            <a href="/TCC/public/home" class="logo">lumi<span>.</span></a>

            <?php if (isset($ano)): ?>
                <a href="/TCC/public/quizzes" class="voltarQuiz">
                    <i class="bx bx-arrow-back"></i>
                    Voltar aos níveis
                </a>
            <?php else: ?>
                <a href="/TCC/public/atividades" class="voltarQuiz">
                    <i class="bx bx-arrow-back"></i>
                    Voltar às atividades
                </a>
            <?php endif; ?>

        </header>

        <?php if (!empty($erro)): ?>
            <div class="avisoQuiz">
                <i class="bx bx-info-circle"></i>
                <p><?= $esc($erro) ?></p>
            </div>
        <?php endif; ?>


        <?php if (!isset($ano)): ?>

            <section class="apresentacaoQuiz">
                <span class="etiqueta">TESTE SEUS CONHECIMENTOS</span>

                <h1>Escolha o seu <span>quiz</span></h1>

                <p>
                    Selecione o nível que você quer praticar.
                </p>
            </section>

            <section>

                <div class="tituloSecaoQuiz">
                    <h2>Níveis disponíveis</h2>
                    <p>Escolha onde você quer se desafiar hoje.</p>
                </div>

                <?php if (empty($anos)): ?>

                    <div class="estadoVazioQuiz">
                        <i class="bx bx-help-circle"></i>
                        <h3>Nenhum quiz cadastrado ainda</h3>
                        <p>Importe o arquivo database/quizzes.sql no banco para liberar os quizzes.</p>
                    </div>

                <?php else: ?>

                    <div class="gradeNiveis">

                        <?php foreach ($anos as $a): ?>

                            <a href="/TCC/public/quizzes?id_ano=<?= (int) $a['id_ano'] ?>" class="cardQuiz">

                                <div class="iconeQuiz">
                                    <i class="bx <?= (int) $a['id_ano'] === 4 ? 'bx-trophy' : 'bx-medal' ?>"></i>
                                </div>

                                <?php if ((int) $a['id_ano'] === (int) $idAnoDoAluno): ?>
                                    <span class="seloQuiz">Seu ano</span>
                                <?php endif; ?>

                                <h3><?= $esc($a['nome_ano']) ?></h3>

                                <p>
                                    <?= (int) $a['total'] ?> questões em
                                    <?= (int) $a['materias'] ?> matérias.
                                </p>

                                <span class="linkQuiz">
                                    Escolher nível <i class="bx bx-right-arrow-alt"></i>
                                </span>

                            </a>

                        <?php endforeach; ?>

                    </div>

                <?php endif; ?>

            </section>


        <?php else: ?>

            <section class="apresentacaoQuiz">
                <span class="etiqueta">QUIZ DO NÍVEL</span>

                <h1><?= $esc($ano['nome_ano']) ?></h1>

                <p>
                    Faça o quiz com várias matérias, ou faça uma matéria de cada vez.
                </p>
            </section>

            <section class="secaoQuiz">

                <div class="tituloSecaoQuiz">
                    <h2>Modos de quiz</h2>
                    <p>Questões de todas as matérias do nível.</p>
                </div>

                <div class="gradeModos">

                    <a href="/TCC/public/quizzes/iniciar?id_ano=<?= (int) $ano['id_ano'] ?>&modo=misto" class="cardQuiz">
                        <div class="iconeQuiz"><i class="bx bx-shuffle"></i></div>
                        <h3>Quiz misto</h3>
                        <p>10 questões sorteadas de todas as matérias. Ótimo para o dia a dia.</p>
                        <span class="linkQuiz">Começar <i class="bx bx-right-arrow-alt"></i></span>
                    </a>

                    <a href="/TCC/public/quizzes/iniciar?id_ano=<?= (int) $ano['id_ano'] ?>&modo=completo" class="cardQuiz">
                        <div class="iconeQuiz"><i class="bx bx-list-check"></i></div>
                        <h3>Simulado completo</h3>
                        <p><?= (int) $totalQuestoes ?> questões embaralhadas, com todas as matérias do nível.</p>
                        <span class="linkQuiz">Começar <i class="bx bx-right-arrow-alt"></i></span>
                    </a>

                </div>

            </section>

            <section class="secaoQuiz">

                <div class="tituloSecaoQuiz">
                    <h2>Por matéria</h2>
                    <p>Faça uma matéria de cada vez.</p>
                </div>

                <div class="gradeMateriasQuiz">

                    <?php foreach ($materias as $m): ?>

                        <a
                            href="/TCC/public/quizzes/iniciar?id_ano=<?= (int) $ano['id_ano'] ?>&modo=materia&id_materia=<?= (int) $m['id_materia'] ?>"
                            class="cardQuiz cardQuizMateria"
                        >
                            <div class="iconeQuiz">
                                <i class="bx <?= $iconesMaterias[$m['materia']] ?? 'bx-book-open' ?>"></i>
                            </div>

                            <h3><?= $esc($m['materia']) ?></h3>

                            <p><?= (int) $m['total'] ?> questões</p>

                            <span class="linkQuiz">
                                Começar <i class="bx bx-right-arrow-alt"></i>
                            </span>
                        </a>

                    <?php endforeach; ?>

                </div>

            </section>

        <?php endif; ?>

        <footer class="rodapeQuiz">
            <p>Errar faz parte de aprender. Tente de novo, o Lumi acompanha você!</p>
        </footer>

    </main>

</body>
</html>
