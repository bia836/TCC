<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../assets/css/Materias/materiasano9.css">

</head>
<body>
   <header>
        <h1>Quais materias você gostaria de reforçar?</h1>
    </header>
    <main>
        <section class="principal">
            <div class="cards">

            <button type="button" class="selecionarTodas" id="selecionarTodas">Selecionar todas</button>
            
            <script>
                document.getElementById("selecionarTodas").addEventListener("click", function () {
                    const caixas = document.querySelectorAll('input[name="materias[]"]');
                    const marcarTodas = Array.from(caixas).some(c => !c.checked);
                    caixas.forEach(c => c.checked = marcarTodas);
                    this.textContent = marcarTodas ? "Desmarcar todas" : "Selecionar todas";
                });
            </script>
        
                <form action="../../../Controller/processar.php" method="POST">
            
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
                <input type="checkbox" name="materias[]" value="Arte">Arte
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

         