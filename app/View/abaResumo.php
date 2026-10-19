
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meus Resumos</title>

    <style>
        .modal {
            display: none;
            position: fixed;
            inset: 0;
            background: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
            z-index: 10;
        }

        .modal-conteudo {
            background: white;
            padding: 20px;
            width: 80%;
            max-width: 500px;
            border-radius: 8px;
        }
    </style>
</head>

<body>

<?php if (!isset($_GET['id_materia'])): ?>

    <h1>Meus Resumos</h1>
    <p>Escolha uma matéria para consultar seus resumos.</p>

    <div class="cards-materias">
        <?php foreach (($materias ?? []) as $m): ?>
            <div class="card-materia">
                <h2>
                    <?= htmlspecialchars($m['materia'] ?? '', ENT_QUOTES, 'UTF-8') ?>
                </h2>

                <a href="/TCC/public/abaResumo?id_materia=<?= (int)$m['id_materia'] ?>">
                    Ver resumos
                </a>
            </div>
        <?php endforeach; ?>
    </div>

<?php else: ?>

    <?php $idMateriaAtual = filter_input(INPUT_GET, 'id_materia', FILTER_VALIDATE_INT); ?>

    <a href="/TCC/public/abaResumo">← Voltar às matérias</a>

    <h1>Resumos da matéria</h1>

    <a href="/TCC/public/criarResumos?id_materia=<?= (int)$idMateriaAtual ?>">
        Criar novo resumo
    </a>

    <?php if (empty($resumos)): ?>
        <p>Você ainda não tem resumos nesta matéria.</p>
    <?php else: ?>

        <?php foreach ($resumos as $r): ?>
            <div class="card-resumo">
                <button
                    type="button"
                    onclick="abrirModal(this)"
                    data-id="<?= (int)$r['id'] ?>"
                    data-titulo="<?= htmlspecialchars($r['titulo'] ?? '', ENT_QUOTES, 'UTF-8') ?>"
                    data-conteudo="<?= htmlspecialchars($r['conteudo'] ?? '', ENT_QUOTES, 'UTF-8') ?>"
                >
                    <?= htmlspecialchars($r['titulo'] ?? 'Resumo sem título', ENT_QUOTES, 'UTF-8') ?>
                </button>
            </div>
        <?php endforeach; ?>

    <?php endif; ?>

    <div id="modal" class="modal">
        <div class="modal-conteudo">

            <h2 id="titulo_visualizacao"></h2>
            <p id="conteudo_visualizacao"></p>

            <form action="/TCC/public/resumos/editar" method="POST">
                <input type="hidden" name="id_materia" value="<?= (int)$idMateriaAtual ?>">
                <input type="hidden" name="id" id="id_editar">

                <label for="titulo_editar">Título</label>
                <input type="text" id="titulo_editar" name="titulo" required>

                <label for="conteudo_editar">Resumo</label>
                <textarea id="conteudo_editar" name="conteudo" required></textarea>

                <button type="submit">Salvar edição</button>
            </form>

            <form action="/TCC/public/resumos/excluir" method="POST"
                  onsubmit="return confirm('Deseja excluir este resumo?')">

                <input type="hidden" name="id_materia" value="<?= (int)$idMateriaAtual ?>">
                <input type="hidden" name="id" id="id_excluir">

                <button type="submit">Excluir</button>
            </form>

            <button type="button" onclick="fecharModal()">Fechar</button>
        </div>
    </div>

<?php endif; ?>

<script>
    function abrirModal(botao) {
        const id = botao.dataset.id;
        const titulo = botao.dataset.titulo;
        const conteudo = botao.dataset.conteudo;

        document.getElementById("titulo_visualizacao").textContent = titulo;
        document.getElementById("conteudo_visualizacao").textContent = conteudo;

        document.getElementById("titulo_editar").value = titulo;
        document.getElementById("conteudo_editar").value = conteudo;

        document.getElementById("id_editar").value = id;
        document.getElementById("id_excluir").value = id;

        document.getElementById("modal").style.display = "flex";
    }

    function fecharModal() {
        document.getElementById("modal").style.display = "none";
    }
</script>

</body>
</html>
