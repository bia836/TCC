
<?php
function converterYoutube($url)
{
    $partes = parse_url($url);

    if (!$partes) {
        return null;
    }

    $host = $partes['host'] ?? '';
    $caminho = trim($partes['path'] ?? '', '/');

    if ($host === 'youtu.be') {
        $id = explode('/', $caminho)[0];
    } elseif (
        in_array($host, ['www.youtube.com', 'youtube.com', 'm.youtube.com'])
    ) {
        if (str_starts_with($caminho, 'watch')) {
            parse_str($partes['query'] ?? '', $query);
            $id = $query['v'] ?? '';
        } else {
            $segmentos = explode('/', $caminho);
            $id = $segmentos[1] ?? '';
        }
    } else {
        return null;
    }

    if (!preg_match('/^[a-zA-Z0-9_-]{11}$/', $id)) {
        return null;
    }

    return 'https://www.youtube-nocookie.com/embed/' . $id;
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Conteúdos | Lumi</title>

    <link rel="stylesheet" href="/TCC/public/assets/css/conteudo.css">
    <link rel="stylesheet" href="/TCC/public/assets/css/tema.css">

    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">

    <script src="/TCC/public/assets/js/tema.js" defer></script>
</head>

<body>

<main class="pagina-conteudos">

    <header class="cabecalho">
        <a href="javascript:history.back()" class="voltar">← Voltar</a>

        <h1>
            <?= htmlspecialchars($conteudos[0]['materia'] ?? 'Conteúdos') ?>
        </h1>

        <p>Assista às aulas e acompanhe os materiais de estudo.</p>
    </header>

    
<?php if (empty($conteudos)): ?>

    <div class="estadoVazio">
        <h3>Nenhum conteúdo encontrado</h3>
        <p><?= htmlspecialchars($mensagem ?? 'Ainda não há conteúdos cadastrados para esta matéria.') ?></p>
    </div>

<?php else: ?>

    <section class="carrosselConteudos">

        <div class="progressoCarrossel">
            <span id="numeroConteudo">1 / <?= count($conteudos) ?></span>

            <div class="barraProgresso">
                <div id="barraAtual"></div>
            </div>
        </div>

        <div class="listaSlides">

            <?php foreach ($conteudos as $indice => $conteudo): ?>

                <article class="slideConteudo <?= $indice === 0 ? 'ativo' : '' ?>">

                    <span class="etiqueta">
                        CONTEÚDO <?= $indice + 1 ?>
                    </span>

                    <h2>
                        <?= htmlspecialchars($conteudo['titulo'] ?? 'Sem título') ?>
                    </h2>

                    <?php if (!empty($conteudo['descricao'])): ?>
                        <p class="descricaoConteudo">
                            <?= nl2br(htmlspecialchars($conteudo['descricao'])) ?>
                        </p>
                    <?php endif; ?>

                    <?php if (!empty($conteudo['url_video'])): ?>
                        <?php $videoEmbed = converterYoutube($conteudo['url_video']); ?>

                        <?php if ($videoEmbed): ?>
                            <div class="videoConteudo">
                                <iframe
                                    src="<?= htmlspecialchars($videoEmbed) ?>"
                                    title="Vídeo da aula"
                                    allowfullscreen>
                                </iframe>
                            </div>
                        <?php endif; ?>
                    <?php endif; ?>

                    <?php if (!empty($conteudo['texto_conteudo'])): ?>
                        <div class="textoConteudo">
                            <?= nl2br(htmlspecialchars($conteudo['texto_conteudo'])) ?>
                        </div>
                    <?php endif; ?>

                </article>

            <?php endforeach; ?>

        </div>

        <div class="controlesCarrossel">

            <button type="button" id="anteriorConteudo" class="botaoCarrossel">
                ← Anterior
            </button>

            <button type="button" id="proximoConteudo" class="botaoCarrossel">
                Próximo →
            </button>

        </div>

    </section>

<?php endif; ?>

</main>
<script src="/TCC/public/assets/js/conteudo.js"></script>
</body>
</html>
