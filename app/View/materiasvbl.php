<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../public/assets/css/Materias/materiasvbl.css">

</head>
<body>
   <header>
        <h1>Quais materias você gostaria de reforçar?</h1>
    </header>
    <main>
        <section class="principal">
            <div class="cards">

        
                <form action="../Controller/processar.php" method="POST">
            
                <label>
                <input type="checkbox" name="materias[]" value="Português">Português
                </label>

                <label>
                <input type="checkbox" name="materias[]" value="Matemática">Matemática
                </label>

                <label>
                <input type="checkbox" name="materias[]" value="Biologia">Biologia
                </label>
                
                <label>
                <input type="checkbox" name="materias[]" value="Química">Química
                </label>

                <label>
                <input type="checkbox" name="materias[]" value="Física">Física
                </label>

                <label>
                <input type="checkbox" name="materias[]" value="Geografia">Geografia
                </label>

                <label>
                <input type="checkbox" name="materias[]" value="História">História
                </label>

                <label>
                <input type="checkbox" name="materias[]" value="Sociologia">Sociologia
                </label>

                <label>
                <input type="checkbox" name="materias[]" value="Filosofia">Filosofia
                </label>

                <label>
                <input type="checkbox" name="materias[]" value="Redação">Redação
                </label>

                <label>
                <input type="checkbox" name="materias[]" value="Inglês">Inglês
                </label>
 
                <button type="submit"> Cadastrar</button>

                </form>
            </div>

        </section>
    </main>
</body>
</html>