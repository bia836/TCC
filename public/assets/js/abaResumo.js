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


// Fecha o modal ao clicar fora dele

document.addEventListener("click", function(event) {

    const modal = document.getElementById("modal");

    if (modal && event.target === modal) {
        fecharModal();
    }

});


// Fecha o modal ao pressionar ESC

document.addEventListener("keydown", function(event) {

    if (event.key === "Escape") {
        fecharModal();
    }

});