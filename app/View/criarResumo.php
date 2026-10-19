<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
         <form action="/TCC/public/criarResumos/salvar" method="post">
            <input type="text" id="titulo" name="titulo" placeholder="Título" required>
            <input type="hidden" name="id_materia" value="<?= (int)($_GET['id_materia'] ?? 0) ?>"
>

            <label for="conteudo">Resumo</label>
            <textarea name="conteudo" id="conteudo" placeholder="Escreva seu resumo aqui..."></textarea>

            <button type="submit">Salvar resumo</button>
         </form>

         
</body>
</html>