
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Lumi | Conteúdos por matéria</title>

    <link rel="stylesheet" href="/TCC/public/assets/css/abaResumo.css">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
</head>

<body>

    <?php
    $paginaAtual = "conteudo";
    include "menuLateral.php";
    ?>

    <main class="conteudoResumos">

        <header class="topoResumos">

            <a href="/TCC/public/home" class="logo">
                lumi<span>.</span>
            </a>

            <a href="/TCC/public/home" class="voltarHome">
                <i class="bx bx-home-alt"></i>
                Voltar ao início
            </a>

        </header>


        <?php if (!isset($_GET['id_materia'])): ?>

            <!-- APRESENTAÇÃO DAS MATÉRIAS -->

            <section class="apresentacaoResumos">

                <span class="etiqueta">SUA BIBLIOTECA DE ESTUDOS</span>

                <h1>Meus <span>conteúdos</span></h1>

                <p>
                    Escolha uma matéria para acessar os conteúdos,
                    aprender e continuar estudando.
                </p>

            </section>


            <section class="materias">

                <div class="tituloSecao">
                    <h2>Suas matérias</h2>
                    <p>Selecione uma matéria para começar.</p>
                </div>


                <div class="gradeMaterias">

                    <?php foreach (($materias ?? []) as $m): ?>

                        <a
                            href="/TCC/public/listarConteudos?id_materia=<?= (int)$m['id_materia'] ?>"
                            class="cardMateria"
                        >

                            <div class="iconeMateria">
                                <i class="bx bx-book-open"></i>
                            </div>

                            <h3>
                                <?= htmlspecialchars($m['materia'] ?? '', ENT_QUOTES, 'UTF-8') ?>
                            </h3>

                            <span class="abrirResumo">
                                Ver conteúdos
                                <i class="bx bx-right-arrow-alt"></i>
                            </span>

                        </a>

                    <?php endforeach; ?>

                </div>

                <?php if (empty($materias)): ?>
                    <div class="estadoVazio">
                        <i class="bx bx-book"></i>
                        <h3>Nenhuma matéria encontrada!</h3>
                        <p>Não existem matérias cadastradas para esta etapa.</p>
                    </div>
                <?php endif; ?>

            </section>


        <?php else: ?>

            <?php
            $idMateriaAtual = filter_input(
                INPUT_GET,
                'id_materia',
                FILTER_VALIDATE_INT
            );
            ?>

            <a href="/TCC/public/conteudos" class="voltarMaterias">
                <i class="bx bx-arrow-back"></i>
                Voltar às matérias
            </a>


            <!-- APRESENTAÇÃO DOS CONTEÚDOS -->

            <section class="apresentacaoResumos">

                <span class="etiqueta">SUA BIBLIOTECA DE ESTUDOS</span>

                <h1>Explore seus <span>conteúdos</span></h1>

                <p>
                    Assista às aulas e leia os materiais disponíveis
                    para esta matéria.
                </p>

            </section>


            <section class="listaResumos">

                <div class="tituloSecao">

                    <div>
                        <h2>Conteúdos disponíveis</h2>
                        <p>Aprenda no seu ritmo e revise sempre que precisar.</p>
                    </div>

                </div>


                <?php if (empty($conteudos)): ?>

                    <div class="estadoVazio">

                        <i class="bx bx-book-content"></i>

                        <h3>Nenhum conteúdo por aqui ainda!</h3>

                        <p>
                            Ainda não existem conteúdos cadastrados para esta matéria.
                        </p>

                    </div>

                <?php else: ?>

                    <div class="gradeResumos">

                        <?php foreach ($conteudos as $c): ?>

                            <?php
                            $urlVideo = trim($c['url_video'] ?? '');
                            $videoId = '';

                            if (preg_match(
                                '~(?:youtube\.com/(?:watch\?v=|embed/|shorts/)|youtu\.be/)([a-zA-Z0-9_-]{11})~',
                                $urlVideo,
                                $matches
                            )) {
                                $videoId = $matches[1];
                            }
                            ?>

                            <article class="cardResumo">

                                <span class="iconeResumo">
                                    <i class="bx bx-book-content"></i>
                                </span>

                                <h3 class="tituloResumo">
                                    <?= htmlspecialchars(
                                        $c['titulo'] ?? 'Conteúdo sem título',
                                        ENT_QUOTES,
                                        'UTF-8'
                                    ) ?>
                                </h3>

                                <?php if (!empty($c['descricao'])): ?>
                                    <p>
                                        <?= nl2br(htmlspecialchars(
                                            $c['descricao'],
                                            ENT_QUOTES,
                                            'UTF-8'
                                        )) ?>
                                    </p>
                                <?php endif; ?>


                                <?php if ($videoId !== ''): ?>

                                    <div class="videoConteudo">

                                        <iframe
                                            src="https://www.youtube.com/embed/<?= htmlspecialchars($videoId, ENT_QUOTES, 'UTF-8') ?>"
                                            title="<?= htmlspecialchars($c['titulo'] ?? 'Vídeo educativo', ENT_QUOTES, 'UTF-8') ?>"
                                            frameborder="0"
                                            allowfullscreen
                                            loading="lazy">
                                        </iframe>

                                    </div>

                                <?php elseif (!empty($urlVideo)): ?>

                                    <p>
                                        <a
                                            href="<?= htmlspecialchars($urlVideo, ENT_QUOTES, 'UTF-8') ?>"
                                            target="_blank"
                                            rel="noopener noreferrer"
                                        >
                                            Assistir ao vídeo
                                            <i class="bx bx-link-external"></i>
                                        </a>
                                    </p>

                                <?php endif; ?>


                                <?php if (!empty($c['texto_conteudo'])): ?>

                                    <div class="textoConteudo">

                                        <h4>
                                            <i class="bx bx-book-open"></i>
                                            Material de estudo
                                        </h4>

                                        <p>
                                            <?= nl2br(htmlspecialchars(
                                                $c['texto_conteudo'],
                                                ENT_QUOTES,
                                                'UTF-8'
                                            )) ?>
                                        </p>

                                    </div>

                                <?php endif; ?>

                            </article>

                        <?php endforeach; ?>

                    </div>

                <?php endif; ?>

            </section>

        <?php endif; ?>


        <footer class="rodapeResumos">
            <p>Continue no seu ritmo. O Lumi acompanha você!</p>
        </footer>

    </main>

</body>
</html>
