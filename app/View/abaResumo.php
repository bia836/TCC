<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Lumi | Meus Resumos</title>

    <link rel="stylesheet" href="/TCC/public/assets/css/abaResumo.css">

    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">

    <script src="/TCC/public/assets/js/abaResumo.js" defer></script>
</head>

<body>

    <?php
    $paginaAtual = "resumos";
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

            <section class="apresentacaoResumos">

                <span class="etiqueta">SUA BIBLIOTECA DE ESTUDOS</span>

                <h1>Meus <span>resumos</span></h1>

                <p>
                    Escolha uma matéria para consultar seus resumos
                    e continuar aprendendo.
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
                            href="/TCC/public/abaResumo?id_materia=<?= (int)$m['id_materia'] ?>"
                            class="cardMateria"
                        >

                            <div class="iconeMateria">
                                <i class="bx bx-book-open"></i>
                            </div>

                            <h3>
                                <?= htmlspecialchars($m['materia'] ?? '', ENT_QUOTES, 'UTF-8') ?>
                            </h3>

                            <p>Visualize seus resumos desta matéria.</p>

                            <span class="linkMateria">
                                Ver resumos <i class="bx bx-right-arrow-alt"></i>
                            </span>

                        </a>

                    <?php endforeach; ?>

                </div>

            </section>


        <?php else: ?>

            <?php
            $idMateriaAtual = filter_input(INPUT_GET, 'id_materia', FILTER_VALIDATE_INT);
            ?>

            <a href="/TCC/public/abaResumo" class="voltarMaterias">
                <i class="bx bx-arrow-back"></i>
                Voltar às matérias
            </a>


            <section class="apresentacaoResumos">

                <span class="etiqueta">SUA BIBLIOTECA DE ESTUDOS</span>

                <h1>Seus <span>resumos</span></h1>

                <p>
                    Aqui ficam todos os resumos que você criou
                    para esta matéria.
                </p>

            </section>


            <section class="listaResumos">

                <div class="tituloSecao">

                    <div>
                        <h2>Resumos salvos</h2>
                        <p>Consulte ou edite seus materiais de estudo.</p>
                    </div>

                    <a
                        href="/TCC/public/criarResumos?id_materia=<?= (int)$idMateriaAtual ?>"
                        class="botaoCriar"
                    >
                        <i class="bx bx-plus"></i>
                        Criar resumo
                    </a>

                </div>


                <?php if (empty($resumos)): ?>

                    <div class="estadoVazio">

                        <i class="bx bx-book-content"></i>

                        <h3>Nenhum resumo por aqui ainda!</h3>

                        <p>
                            Que tal criar seu primeiro resumo desta matéria?
                        </p>

                        <a href="/TCC/public/criarResumos?id_materia=<?= (int)$idMateriaAtual ?>">
                            Criar meu primeiro resumo
                        </a>

                    </div>

                <?php else: ?>

                    <div class="gradeResumos">

                        <?php foreach ($resumos as $r): ?>

                            <button
                                type="button"
                                class="cardResumo"
                                onclick="abrirModal(this)"
                                data-id="<?= (int)$r['id'] ?>"
                                data-titulo="<?= htmlspecialchars($r['titulo'] ?? '', ENT_QUOTES, 'UTF-8') ?>"
                                data-conteudo="<?= htmlspecialchars($r['conteudo'] ?? '', ENT_QUOTES, 'UTF-8') ?>"
                            >

                                <span class="iconeResumo">
                                    <i class="bx bx-file-blank"></i>
                                </span>

                                <span class="tituloResumo">
                                    <?= htmlspecialchars($r['titulo'] ?? 'Resumo sem título', ENT_QUOTES, 'UTF-8') ?>
                                </span>

                                <span class="abrirResumo">
                                    Abrir resumo <i class="bx bx-right-arrow-alt"></i>
                                </span>

                            </button>

                        <?php endforeach; ?>

                    </div>

                <?php endif; ?>

            </section>


            <div id="modal" class="modal">

                <div class="modalConteudo">

                    <button
                        type="button"
                        class="fecharModal"
                        onclick="fecharModal()"
                        aria-label="Fechar janela"
                    >
                        <i class="bx bx-x"></i>
                    </button>


                    <div class="cabecalhoModal">
                        <span class="etiqueta">SEU MATERIAL DE ESTUDO</span>
                        <h2 id="titulo_visualizacao"></h2>
                    </div>


                    <div class="visualizacaoResumo">
                        <p id="conteudo_visualizacao"></p>
                    </div>


                    <div class="editarResumo">

                        <h3>Editar resumo</h3>

                        <form action="/TCC/public/resumos/editar" method="POST">

                            <input
                                type="hidden"
                                name="id_materia"
                                value="<?= (int)$idMateriaAtual ?>"
                            >

                            <input
                                type="hidden"
                                name="id"
                                id="id_editar"
                            >

                            <div class="campoModal">

                                <label for="titulo_editar">Título</label>

                                <input
                                    type="text"
                                    id="titulo_editar"
                                    name="titulo"
                                    required
                                >

                            </div>


                            <div class="campoModal">

                                <label for="conteudo_editar">Resumo</label>

                                <textarea
                                    id="conteudo_editar"
                                    name="conteudo"
                                    rows="6"
                                    required
                                ></textarea>

                            </div>


                            <button type="submit" class="botaoSalvar">
                                <i class="bx bx-save"></i>
                                Salvar edição
                            </button>

                        </form>

                    </div>


                    <form
                        action="/TCC/public/resumos/excluir"
                        method="POST"
                        onsubmit="return confirm('Deseja excluir este resumo?')"
                        class="formExcluir"
                    >

                        <input
                            type="hidden"
                            name="id_materia"
                            value="<?= (int)$idMateriaAtual ?>"
                        >

                        <input
                            type="hidden"
                            name="id"
                            id="id_excluir"
                        >

                        <button type="submit" class="botaoExcluir">
                            <i class="bx bx-trash"></i>
                            Excluir resumo
                        </button>

                    </form>

                </div>

            </div>

        <?php endif; ?>

        <footer class="rodapeResumos">
            <p>Continue no seu ritmo. O Lumi acompanha você!</p>
        </footer>

    </main>

</body>
</html>