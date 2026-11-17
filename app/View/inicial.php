<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Lumi: uma plataforma para aprender, revisar conteúdos e se preparar para provas e vestibulares.">
    <title>Lumi | Aprender pode ser divertido</title>

    <link rel="stylesheet" href="/TCC/public/assets/css/inicial.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/TCC/public/assets/css/tema.css">
      <script src="/TCC/public/assets/js/tema.js" defer></script>
</head>
<body>
    <header class="cabecalho">
       
       <div class="barra-topo">
              <a class="logo" href="/TCC/public/" aria-label="Lumi - página inicial">lumi<span>.</span></a>

            <div class="acoes-topo">
              <select id="temaEscolhido" class="seletor-tema" onchange="alterarTema(this.value)" aria-label="Escolher aparência">
                   <option value="escuro">Modo escuro</option>
                   <option value="claro">Modo claro</option>
             </select>

             <a class="link-entrar" href="/TCC/public/login">
                 Entrar na conta <span aria-hidden="true">↗</span>
             </a>
            </div>
        </div>
 

        <section class="topo">
            <div class="topo-conteudo">
                <span class="etiqueta"><span class="ponto"></span> SEU JEITO DE APRENDER</span>
                <h1>Descubra que<br> <span>aprender pode</span><br> ser incrível.</h1>
                <p>Estude no seu ritmo, explore novos conteúdos e transforme seus objetivos em conquistas. O Lumi acompanha você nessa jornada!</p>

                <div class="botoes-topo">
                    <a class="botao botao-principal" href="/TCC/public/proposit">Comece já <span aria-hidden="true">→</span></a>
                    <a class="botao botao-secundario" href="/TCC/public/login">Já tenho uma conta</a>
                </div>

                <div class="topo-nota">
                    <span class="nota-icone">✦</span>
                    <span>Do Ensino Fundamental ao Vestibular</span>
                </div>
            </div>

            <div class="topo-visual" aria-label="Mascote do Lumi">
                <div class="brilho brilho-um"></div>
                <div class="brilho brilho-dois"></div>
                <div class="orbita orbita-um"></div>
                <div class="orbita orbita-dois"></div>
                <div class="mascote-fundo">
                    <img src="/TCC/public/assets/img/lumi.png" alt="Mascote do Lumi">
                </div>
                <span class="flutuante flutuante-livro">✎ <small>Aprenda</small></span>
                <span class="flutuante flutuante-estrela">✦</span>
                <span class="flutuante flutuante-ideia">✧ <small>Descubra</small></span>
            </div>
        </section>
        <div class="onda" aria-hidden="true"></div>
    </header>

    <main>
        <section class="mais secao" id="sobre-lumi">
            <div class="sobre-imagem">
                <div class="sobre-moldura">
                    <img src="/TCC/public/assets/img/lumi.png" alt="Mascote do Lumi">
                    <span class="selo-sobre">Aprender<br>é uma aventura!</span>
                </div>
            </div>
            <div class="sobre-texto">
                <span class="subtitulo">PRAZER, SOMOS O LUMI</span>
                <h2>Um espaço feito para a sua <span>curiosidade</span> crescer.</h2>
                <p>Estudar não precisa ser uma tarefa cansativa. O Lumi reúne conteúdos organizados, atividades e recursos que tornam o aprendizado mais leve, dinâmico e interessante.</p>
                <p>Seja para revisar uma matéria, aprender algo novo ou se preparar para uma prova, aqui você encontra apoio para avançar no seu próprio ritmo.</p>
                <a class="link-roxo" href="/TCC/public/proposit">Quero conhecer <span aria-hidden="true">→</span></a>
            </div>
        </section>

        <section class="principal secao">
            <div class="titulo-secao">
                <span class="subtitulo">EXPLORE AS POSSIBILIDADES</span>
                <h2>Seus estudos, <span>do seu jeito.</span></h2>
                <p>Ferramentas para organizar, praticar e acompanhar sua evolução.</p>
            </div>

            <div class="cards">
                <article class="card card-planejamento">
                    <div class="card-icone"><img src="/TCC/public/assets/img/planejamento.png" alt=""></div>
                    <span class="card-numero">01</span>
                    <h3>Planejamentos</h3>
                    <p>Organize sua rotina e tenha mais clareza sobre o que estudar.</p>
                </article>
                <article class="card card-meta">
                    <div class="card-icone"><img src="/TCC/public/assets/img/meta.png" alt=""></div>
                    <span class="card-numero">02</span>
                    <h3>Metas</h3>
                    <p>Defina objetivos e acompanhe cada conquista pelo caminho.</p>
                </article>
                <article class="card card-resumo">
                    <div class="card-icone"><img src="/TCC/public/assets/img/resumo.png" alt=""></div>
                    <span class="card-numero">03</span>
                    <h3>Resumos</h3>
                    <p>Revise os principais assuntos de um jeito simples e organizado.</p>
                </article>
                <article class="card card-quiz">
                    <div class="card-icone"><img src="/TCC/public/assets/img/quiz.png" alt=""></div>
                    <span class="card-numero">04</span>
                    <h3>Quizzes</h3>
                    <p>Teste seus conhecimentos e aprenda enquanto pratica.</p>
                </article>
            </div>
        </section>

        <section class="diferencial secao">
            <div class="diferencial-conteudo">
                <span class="subtitulo">UM PASSO DE CADA VEZ</span>
                <h2>Seu próximo objetivo começa com <span>uma nova descoberta.</span></h2>
                <p>Do Ensino Fundamental ao Ensino Médio e à preparação para vestibulares, o Lumi quer deixar sua jornada de estudos mais acessível, organizada e motivadora.</p>
                <a class="botao botao-principal" href="/TCC/public/proposit">Faça parte do Lumi <span aria-hidden="true">→</span></a>
            </div>
            <div class="diferencial-detalhe" aria-hidden="true">
                <span class="detalhe-estrela estrela-a">✦</span>
                <span class="detalhe-estrela estrela-b">✧</span>
                <span class="detalhe-circulo"></span>
                <span class="detalhe-palavra">VOCÊ<br>CONSEGUE!</span>
            </div>
        </section>
    </main>

    <footer class="rodape">
        <div class="rodape-conteudo">
            <div class="rodape-marca">
                <a class="logo" href="/TCC/public/">lumi<span>.</span></a>
                <p>Aprender, descobrir e evoluir. Um conteúdo de cada vez.</p>
            </div>
            <div class="rodape-redes">
                <span>ACOMPANHE O LUMI</span>
                <div class="icones-redes">
                    <img src="/TCC/public/assets/img/instagram.png" alt="Instagram">
                    <img src="/TCC/public/assets/img/facebook.png" alt="Facebook">
                    <img src="/TCC/public/assets/img/whatsapp.png" alt="WhatsApp">
                </div>
            </div>
        </div>
        <div class="rodape-final">
            <span>© 2026 Lumi. Todos os direitos reservados.</span>
            <span>Feito para tornar o aprendizado mais leve. <b>✦</b></span>
        </div>
    </footer>
</body>
</html>
