
<?php
require __DIR__ . "/../Controller/controllersessao.php";
$paginaAtual = "atividades";
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Lumi - Atividades</title>

    <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css">

    <link rel="stylesheet" href="/TCC/public/assets/css/home.css">
    <link rel="stylesheet" href="/TCC/public/assets/css/atividades.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
</head>

<body>

    <?php include "menuLateral.php"; ?>

    <main class="conteudoHome conteudoAtividades">

        <section class="cabecalhoAtividades">
            <span class="identificacao">SEU ESPAÇO DE APRENDIZADO</span>

            <h1>Atividades</h1>

            <p>
                Escolha como você quer aprender hoje.
                Explore seus materiais e continue evoluindo!
            </p>
        </section>

        <section class="listaAtividades">

            <!-- RESUMOS -->
            <a href="/TCC/public/abaResumo" class="cardAtividade cardResumos">

                <div class="iconeAtividade">
                    <i class="bx bx-notepad"></i>
                </div>

                <div class="informacoesAtividade">
                    <span class="statusDisponivel">Disponível</span>

                    <h2>Resumos</h2>

                    <p>
                        Crie, organize e consulte seus resumos
                        para facilitar seus estudos.
                    </p>

                    <span class="linkAtividade">
                        Acessar resumos
                        <i class="bx bx-right-arrow-alt"></i>
                    </span>
                </div>

            </a>

            <!-- VIDEOAULAS -->
            <a href="/TCC/public/conteudomateria" class="cardAtividade cardResumo">

                <div class="iconeAtividade">
                    <i class="bx bx-play-circle"></i>
                </div>

                <div class="informacoesAtividade">
                    <span class="statusDisponivel">Disponível</span>

                    <h2>Videoaulas</h2>

                    <p>
                        Aprenda novos conteúdos com aulas
                        explicativas e práticas.
                    </p>


                    <span class="linkAtividade">
                        Acessar conteúdos
                        <i class="bx bx-right-arrow-alt"></i>
                    </span>
                </div>

</a>

            <!-- QUIZZES -->
            <div class="cardAtividade cardFuturo">

                <div class="iconeAtividade">
                    <i class="bx bx-brain"></i>
                </div>

                <div class="informacoesAtividade">
                    <span class="statusBreve">Em breve</span>

                    <h2>Quizzes</h2>

                    <p>
                        Teste seus conhecimentos e descubra
                        o quanto você já aprendeu.
                    </p>

                    <span class="linkIndisponivel">
                        Disponível em breve
                    </span>
                </div>

            </div>

        </section>

        <section class="mensagemAtividades">
            <i class="bx bx-bulb"></i>

            <p>
                <strong>Dica:</strong> estudar um pouquinho todos os dias
                pode fazer uma grande diferença no seu aprendizado!
            </p>
        </section>

    </main>

</body>
</html>
