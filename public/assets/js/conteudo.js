
const slides = document.querySelectorAll('.slideConteudo');

if (slides.length > 0) {

    let atual = 0;

    const anterior = document.getElementById('anteriorConteudo');
    const proximo = document.getElementById('proximoConteudo');
    const numero = document.getElementById('numeroConteudo');
    const barra = document.getElementById('barraAtual');

    function mostrarConteudo(indice) {

        slides.forEach((slide, i) => {
            slide.classList.toggle('ativo', i === indice);
        });

        atual = indice;

        numero.textContent = `${atual + 1} / ${slides.length}`;

        const porcentagem = ((atual + 1) / slides.length) * 100;
        barra.style.width = `${porcentagem}%`;

        anterior.disabled = atual === 0;
        proximo.disabled = atual === slides.length - 1;
    }

    anterior.addEventListener('click', () => {
        if (atual > 0) {
            mostrarConteudo(atual - 1);
        }
    });

    proximo.addEventListener('click', () => {
        if (atual < slides.length - 1) {
            mostrarConteudo(atual + 1);
        }
    });

    mostrarConteudo(0);
}
