
<?php
$paginaAtual = "resumos";
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Criar resumo | Lumi</title>

    <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css">

    <link rel="stylesheet" href="/TCC/public/assets/css/home.css">
    <link rel="stylesheet" href="/TCC/public/assets/css/criarResumo.css">
     <link rel="stylesheet" href="/TCC/public/assets/css/tema.css">
    <script src="/TCC/public/assets/js/tema.js" defer></script>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
</head>
<body>

    <?php require __DIR__ . '/menuLateral.php'; ?>

    <main class="conteudo-principal">

        <div class="cabecalho-pagina">
            <span class="subtitulo">SEUS ESTUDOS</span>
            <h1>Criar resumo</h1>
            <p>Organize suas ideias e registre tudo o que aprendeu.</p>
        </div>

        <section class="area-criacao">

            <div class="titulo-area">
                <h2>Novo resumo</h2>
                <p>Preencha os campos abaixo para criar seu material de estudo.</p>
            </div>

            <form action="/TCC/public/criarResumos/salvar" method="post">

                <input
                    type="hidden"
                    name="id_materia"
                    value="<?= (int)($_GET['id_materia'] ?? 0) ?>"
                >

                <div class="campo">
                    <label for="titulo">Título do resumo</label>

                    <input
                        type="text"
                        id="titulo"
                        name="titulo"
                        placeholder="Ex.: Introdução à Biologia"
                        required
                    >
                </div>

                <div class="campo">
                    <label for="conteudo">Conteúdo do resumo</label>

                    <textarea
                        name="conteudo"
                        id="conteudo"
                        placeholder="Comece a escrever seu resumo aqui..."
                        required
                    ></textarea>
                </div>

                <div class="acoes">
                    <button type="submit">Salvar resumo</button>
                </div>

            </form>

        </section>

    </main>

</body>
</html>
