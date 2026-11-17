<?php
$anos = $anos ?? [];
$materias = $materias ?? [];
$conteudos = $conteudos ?? [];
$mensagem = $mensagem ?? '';
$erro = $erro ?? '';
$conteudoEdicao = $conteudoEdicao ?? null;
$editando = is_array($conteudoEdicao);
function e($valor): string { return htmlspecialchars((string)$valor, ENT_QUOTES, 'UTF-8'); }
$anoEdicao = (int)($conteudoEdicao['id_ano'] ?? 0);
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciar conteúdos | Lumi</title>
    <link rel="stylesheet" href="/TCC/public/assets/css/tema.css">
    <link rel="stylesheet" href="/TCC/public/assets/css/gerenciarConteudos.css">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
    <script src="/TCC/public/assets/js/tema.js" defer></script>
</head>
<body>
<?php $paginaAtual = 'gerenciarConteudos'; include 'menuLateral.php'; ?>
<main class="gerenciarConteudos">
    <header class="gc-topo">
        <div>
            <span class="gc-etiqueta"><i class="bx bxs-shield"></i> ÁREA DO PROFESSOR</span>
            <h1>Gerenciar <span>conteúdos</span></h1>
            <p>Cadastre materiais por ano e matéria e navegue pelos conteúdos em carrosséis.</p>
        </div>
        <a class="gc-voltar" href="/TCC/public/home"><i class="bx bx-home-alt"></i> Voltar ao início</a>
    </header>

    <?php if ($mensagem): ?><div class="gc-alerta sucesso"><i class="bx bx-check-circle"></i><?= e($mensagem) ?></div><?php endif; ?>
    <?php if ($erro): ?><div class="gc-alerta erro"><i class="bx bx-error-circle"></i><?= e($erro) ?></div><?php endif; ?>

    <section class="gc-form-card gc-form-area">
        <div class="gc-titulo-card">
            <div class="gc-icone"><i class="bx bx-edit-alt"></i></div>
            <div><h2><?= $editando ? 'Editar conteúdo' : 'Cadastrar novo conteúdo' ?></h2>
                <p><?= $editando ? 'Atualize as informações do material.' : 'Informe o ano e a matéria aos quais o material pertence.' ?></p></div>
        </div>
        <form action="<?= $editando ? '/TCC/public/professor/conteudos/editar/salvar' : '/TCC/public/professor/conteudos/salvar' ?>" method="POST" class="gc-form" id="gc-form">
            <?php if ($editando): ?><input type="hidden" name="id" value="<?= (int)$conteudoEdicao['id'] ?>"><?php endif; ?>
            <div class="gc-campos">
                <div class="gc-campo gc-campo-largo">
                    <label for="titulo">Título do conteúdo</label>
                    <input id="titulo" name="titulo" type="text" maxlength="150" placeholder="Ex.: Introdução à Matemática" value="<?= e($conteudoEdicao['titulo'] ?? '') ?>" required>
                </div>
                <div class="gc-campo">
                    <label for="id_ano">Ano / etapa</label>
                    <select id="id_ano" name="id_ano" required>
                        <option value="">Selecione o ano</option>
                        <?php foreach ($anos as $ano): ?>
                            <option value="<?= (int)$ano['id_ano'] ?>" <?= $anoEdicao === (int)$ano['id_ano'] ? 'selected' : '' ?>><?= e($ano['nome_ano']) ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <div class="gc-campo">
                    <label for="id_materia">Matéria</label>
                    <select id="id_materia" name="id_materia" required disabled>
                        <option value="">Primeiro selecione o ano</option>
                        <?php foreach ($materias as $materia): ?>
                            <option value="<?= (int)$materia['id_materia'] ?>" data-ano="<?= (int)$materia['id_ano'] ?>" <?= (int)($conteudoEdicao['id_materia'] ?? 0) === (int)$materia['id_materia'] ? 'selected' : '' ?>><?= e($materia['materia']) ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <div class="gc-campo">
                    <label for="tipo">Tipo de conteúdo</label>
                    <select id="tipo" name="tipo" required>
                        <option value="aula" <?= ($conteudoEdicao['tipo'] ?? 'aula') === 'aula' ? 'selected' : '' ?>>Aula</option>
                        <option value="resumo" <?= ($conteudoEdicao['tipo'] ?? '') === 'resumo' ? 'selected' : '' ?>>Resumo</option>
                        <option value="dica" <?= ($conteudoEdicao['tipo'] ?? '') === 'dica' ? 'selected' : '' ?>>Dica</option>
                    </select>
                </div>
                <div class="gc-campo gc-campo-largo">
                    <label for="descricao">Descrição breve</label>
                    <textarea id="descricao" name="descricao" rows="2" placeholder="Explique brevemente o que será abordado."><?= e($conteudoEdicao['descricao'] ?? '') ?></textarea>
                </div>
                <div class="gc-campo gc-campo-largo">
                    <label for="url_video">Link do vídeo <span>(opcional)</span></label>
                    <input id="url_video" name="url_video" type="url" placeholder="https://..." value="<?= e($conteudoEdicao['url_video'] ?? '') ?>">
                </div>
                <div class="gc-campo gc-campo-largo">
                    <label for="texto_conteudo">Texto da aula</label>
                    <textarea id="texto_conteudo" name="texto_conteudo" rows="4" placeholder="Escreva aqui o conteúdo que ficará disponível para os alunos."><?= e($conteudoEdicao['texto_conteudo'] ?? '') ?></textarea>
                </div>
            </div>
            <div class="gc-form-rodape">
                <button type="submit" class="gc-botao-principal"><i class="bx <?= $editando ? 'bx-save' : 'bx-plus' ?>"></i><?= $editando ? 'Salvar alterações' : 'Salvar conteúdo' ?></button>
                <?php if ($editando): ?><a class="gc-voltar" href="/TCC/public/professor/conteudos">Cancelar edição</a><?php endif; ?>
            </div>
        </form>
    </section>

    <section class="gc-explorador">
        <div class="gc-titulo-card gc-titulo-explorador">
            <div class="gc-icone"><i class="bx bx-library"></i></div>
            <div><h2>Conteúdos cadastrados</h2><p>Navegue por ano, matéria e material.</p></div>
            <span class="gc-total"><?= count($conteudos) ?> conteúdos</span>
        </div>

        <section class="gc-etapa">
            <div class="gc-etapa-cabecalho"><span class="gc-numero">1</span><div><h3>Escolha o ano</h3><p>Deslize para encontrar a etapa desejada.</p></div></div>
            <div class="gc-carrossel-linha">
                <button class="gc-seta" type="button" data-scroll="anos" data-dir="-1" aria-label="Anos anteriores"><i class="bx bx-chevron-left"></i></button>
                <div class="gc-carrossel" id="anos">
                    <?php foreach ($anos as $ano): ?>
                        <button type="button" class="gc-card-selecao gc-ano" data-ano="<?= (int)$ano['id_ano'] ?>"><i class="bx bx-calendar"></i><strong><?= e($ano['nome_ano']) ?></strong><small>Ver matérias</small></button>
                    <?php endforeach; ?>
                </div>
                <button class="gc-seta" type="button" data-scroll="anos" data-dir="1" aria-label="Próximos anos"><i class="bx bx-chevron-right"></i></button>
            </div>
        </section>

        <section class="gc-etapa gc-etapa-oculta" id="etapa-materias">
            <div class="gc-etapa-cabecalho"><span class="gc-numero">2</span><div><h3>Escolha a matéria</h3><p id="gc-ajuda-materia">Selecione uma matéria.</p></div></div>
            <div class="gc-carrossel-linha">
                <button class="gc-seta" type="button" data-scroll="materias" data-dir="-1" aria-label="Matérias anteriores"><i class="bx bx-chevron-left"></i></button>
                <div class="gc-carrossel" id="materias">
                    <?php foreach ($materias as $materia): ?>
                        <button type="button" class="gc-card-selecao gc-materia" data-ano="<?= (int)$materia['id_ano'] ?>" data-materia="<?= (int)$materia['id_materia'] ?>"><i class="bx bx-book-open"></i><strong><?= e($materia['materia']) ?></strong><small>Ver conteúdos</small></button>
                    <?php endforeach; ?>
                </div>
                <button class="gc-seta" type="button" data-scroll="materias" data-dir="1" aria-label="Próximas matérias"><i class="bx bx-chevron-right"></i></button>
            </div>
        </section>

        <section class="gc-etapa gc-etapa-oculta" id="etapa-conteudos">
            <div class="gc-etapa-cabecalho"><span class="gc-numero">3</span><div><h3 id="gc-titulo-conteudos">Conteúdos da matéria</h3><p id="gc-ajuda-conteudos">Selecione uma matéria.</p></div></div>
            <div class="gc-carrossel-linha">
                <button class="gc-seta" type="button" data-scroll="conteudos" data-dir="-1" aria-label="Conteúdos anteriores"><i class="bx bx-chevron-left"></i></button>
                <div class="gc-carrossel gc-carrossel-conteudos" id="conteudos">
                    <?php foreach ($conteudos as $item): ?>
                        <article class="gc-card-conteudo" data-materia="<?= (int)$item['id_materia'] ?>">
                            <div class="gc-card-conteudo-topo"><span class="gc-tipo"><?= e($item['tipo'] ?? 'aula') ?></span><span class="gc-id">#<?= (int)$item['id'] ?></span></div>
                            <h4><?= e($item['titulo']) ?></h4>
                            <p><?= e($item['descricao'] ?? 'Sem descrição cadastrada.') ?></p>
                            <small class="gc-ano-card"><?= e($item['nome_ano'] ?? '') ?> · <?= e($item['materia'] ?? '') ?></small>
                            <div class="gc-card-acoes">
                                <a href="/TCC/public/professor/conteudos/editar?id=<?= (int)$item['id'] ?>"><i class="bx bx-edit"></i> Editar</a>
                                <form action="/TCC/public/professor/conteudos/excluir" method="POST" onsubmit="return confirm('Deseja realmente excluir este conteúdo?');">
                                    <input type="hidden" name="id" value="<?= (int)$item['id'] ?>">
                                    <button type="submit"><i class="bx bx-trash"></i> Excluir</button>
                                </form>
                            </div>
                        </article>
                    <?php endforeach; ?>
                </div>
                <button class="gc-seta" type="button" data-scroll="conteudos" data-dir="1" aria-label="Próximos conteúdos"><i class="bx bx-chevron-right"></i></button>
            </div>
            <div class="gc-vazio gc-vazio-filtro" id="gc-sem-conteudo" hidden><i class="bx bx-folder-open"></i><h3>Essa matéria ainda não tem conteúdos</h3><p>Cadastre o primeiro material pelo formulário acima.</p></div>
        </section>
    </section>
    <p class="gc-nota"><i class="bx bx-info-circle"></i> Área exclusiva para professores.</p>
</main>
<script>
document.addEventListener('DOMContentLoaded', () => {
    const anoSelect = document.getElementById('id_ano');
    const materiaSelect = document.getElementById('id_materia');
    const materiaOptions = [...materiaSelect.options].filter(o => o.value);
    const materiaCards = [...document.querySelectorAll('.gc-materia')];
    const conteudoCards = [...document.querySelectorAll('.gc-card-conteudo')];
    const etapaMaterias = document.getElementById('etapa-materias');
    const etapaConteudos = document.getElementById('etapa-conteudos');
    const semConteudo = document.getElementById('gc-sem-conteudo');

    function filtrarMaterias(ano, materiaInicial = '') {
        materiaSelect.innerHTML = '';
        const placeholder = new Option(ano ? 'Selecione uma matéria' : 'Primeiro selecione o ano', '');
        materiaSelect.add(placeholder);
        let total = 0;
        materiaOptions.forEach(opt => {
            if (opt.dataset.ano === String(ano)) {
                materiaSelect.add(new Option(opt.textContent, opt.value));
                total++;
            }
        });
        materiaSelect.disabled = !ano || total === 0;
        if (materiaInicial) materiaSelect.value = String(materiaInicial);
    }
    anoSelect.addEventListener('change', () => filtrarMaterias(anoSelect.value));
    filtrarMaterias(anoSelect.value, <?= (int)($conteudoEdicao['id_materia'] ?? 0) ?> || '');

    document.querySelectorAll('.gc-ano').forEach(card => card.addEventListener('click', () => {
        const ano = card.dataset.ano;
        document.querySelectorAll('.gc-ano').forEach(c => c.classList.toggle('ativo', c === card));
        materiaCards.forEach(c => { c.hidden = c.dataset.ano !== ano; c.classList.remove('ativo'); });
        etapaMaterias.classList.remove('gc-etapa-oculta');
        etapaConteudos.classList.add('gc-etapa-oculta');
        document.getElementById('gc-ajuda-materia').textContent = card.querySelector('strong').textContent + ' — escolha uma matéria.';
        document.getElementById('materias').scrollTo({left:0, behavior:'smooth'});
    }));

    materiaCards.forEach(card => card.addEventListener('click', () => {
        materiaCards.forEach(c => c.classList.toggle('ativo', c === card));
        let total = 0;
        conteudoCards.forEach(c => {
            const mostrar = c.dataset.materia === card.dataset.materia;
            c.hidden = !mostrar;
            if (mostrar) total++;
        });
        etapaConteudos.classList.remove('gc-etapa-oculta');
        document.getElementById('gc-titulo-conteudos').textContent = 'Conteúdos de ' + card.querySelector('strong').textContent;
        document.getElementById('gc-ajuda-conteudos').textContent = total + (total === 1 ? ' material encontrado.' : ' materiais encontrados.');
        if (semConteudo) semConteudo.hidden = total !== 0;
        document.getElementById('conteudos').scrollTo({left:0, behavior:'smooth'});
    }));

    document.querySelectorAll('.gc-seta').forEach(btn => btn.addEventListener('click', () => {
        const carrossel = document.getElementById(btn.dataset.scroll);
        carrossel?.scrollBy({left: Number(btn.dataset.dir) * Math.max(220, carrossel.clientWidth * .75), behavior:'smooth'});
    }));

    // Ao editar, já abre a sequência de ano e matéria correspondente.
    const materiaAtual = materiaSelect.value;
    if (materiaAtual) {
        const cardMateria = materiaCards.find(c => c.dataset.materia === materiaAtual);
        if (cardMateria) {
            document.querySelector('.gc-ano[data-ano="' + cardMateria.dataset.ano + '"]')?.click();
            cardMateria.click();
        }
    }
});
</script>
</body>
</html>
