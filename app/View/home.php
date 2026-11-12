<?php
$paginaAtual = "home";

$nomeUsuario = $_SESSION['nome'] ?? 'Estudante';
$primeiroNome = explode(' ', trim($nomeUsuario))[0];
$tarefas = $tarefas ?? [];
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Lumi | Início</title>

    <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css">

    <link rel="stylesheet" href="/TCC/public/assets/css/home.css">
     <link rel="stylesheet" href="/TCC/public/assets/css/tema.css">
    <script src="/TCC/public/assets/js/tema.js" defer></script>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
</head>

<body>

    <?php include "menuLateral.php"; ?>

    <main class="conteudoHome">

        <header class="topoHome">
            <a href="/TCC/public/home" class="logo">lumi<span>.</span></a>

            <a href="/TCC/public/perfil" class="perfilTopo">
                <i class="bx bx-user-circle"></i>
                <span>Meu perfil</span>
            </a>
        </header>


        <section class="boasVindas">

            <div class="textoBoasVindas">
                <span class="etiqueta">SEU ESPAÇO DE ESTUDOS</span>

                <h1>
                    Olá, <?= htmlspecialchars($primeiroNome, ENT_QUOTES, 'UTF-8') ?>!
                    <span>Vamos aprender?</span>
                </h1>

                <p>
                    Que bom ter você por aqui! Organize seus estudos
                    e continue avançando no seu próprio ritmo.
                </p>
            </div>

            <div class="imagemBoasVindas">
                <i class="bx bx-book-reader"></i>
            </div>

        </section>

        
        <section class="planejamento">

            <div class="tituloSecao">
                <div>
                    <h2>Meu planejamento</h2>
                    <p>Organize suas tarefas e acompanhe seus estudos.</p>
                </div>
            </div>

            <div class="calendarioLayout">

                <div class="calendario">

                    <div class="cabecalhoCalendario">

                        <button type="button" id="mesAnterior">
                            <i class="bx bx-chevron-left"></i>
                        </button>

                        <h3 id="mesAtual"></h3>

                        <button type="button" id="proximoMes">
                            <i class="bx bx-chevron-right"></i>
                        </button>

                    </div>

                    <div class="diasSemana">
                        <span>Dom</span>
                        <span>Seg</span>
                        <span>Ter</span>
                        <span>Qua</span>
                        <span>Qui</span>
                        <span>Sex</span>
                        <span>Sáb</span>
                    </div>

                    <div class="diasCalendario" id="diasCalendario"></div>

                </div>

                <div class="painelDia">

                    <h3 id="dataSelecionada">Tarefas do dia</h3>

                    <form action="/TCC/public/planejamento/adicionar" method="POST" class="formPlanejamento">

                        <input
                            type="text"
                            name="titulo"
                            placeholder="O que você precisa estudar?"
                            maxlength="150"
                            required
                        >

                        <input
                            type="date"
                            name="data_tarefa"
                            id="dataTarefa"
                            required
                        >

                        <button type="submit">
                            <i class="bx bx-plus"></i>
                            Adicionar tarefa
                        </button>

                    </form>

                    <div class="listaPlanejamento" id="listaTarefasDia"></div>

                </div>

            </div>

            <script type="application/json" id="dadosTarefas"><?=
                json_encode(
                    $tarefas,
                    JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_AMP | JSON_HEX_QUOT
                )
            ?></script>

        </section>



        <section class="acessos">

            <div class="tituloSecao">
                <div>
                    <h2>O que vamos estudar hoje?</h2>
                    <p>Escolha por onde deseja começar.</p>
                </div>
            </div>


            <div class="gradeCards">

                <a href="/TCC/public/conteudomateria" class="cardAcesso" aria-disabled="true">

                    <div class="iconeCard">
                        <i class="bx bx-play-circle"></i>
                    </div>


                    <h3>Videoaulas</h3>

                    <p>
                        Aprenda com aulas organizadas por matérias
                        e conteúdos.
                    </p>

                    <span class="seta">→</span>

                </a>


                <a href="/TCC/public/abaResumo" class="cardAcesso">

                    <div class="iconeCard">
                        <i class="bx bx-book-content"></i>
                    </div>


                    <h3>Meus resumos</h3>

                    <p>
                        Consulte seus resumos, organize suas matérias
                        e crie novos conteúdos.
                    </p>

                    <span class="seta">→</span>

                </a>


                <a href="/TCC/public/quizzes" class="cardAcesso" aria-disabled="true">

                    <div class="iconeCard">
                        <i class="bx bx-brain"></i>
                    </div>

                    

                    <h3>Quizzes</h3>

                    <p>
                        Teste seus conhecimentos com atividades
                        rápidas e divertidas.
                    </p>

                    <span class="seta">→</span>

                </a>

            </div>

        </section>

        
       

        <section class="parteInferior">



            <div class="dica">

                <span class="etiqueta">DICA DO LUMI</span>

                <i class="bx bx-bulb"></i>

                <h2>Estude no seu ritmo!</h2>

                <p>
                    Pequenos momentos de estudo também fazem
                    diferença. O importante é continuar.
                </p>

            </div>

        </section>


        <footer class="rodapeHome">
            <p>Continue no seu ritmo. O Lumi acompanha você!</p>
        </footer>

    </main>
    <script src="/TCC/public/assets/js/planejamento.js"></script>

</body>
</html>