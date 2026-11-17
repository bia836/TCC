// pega o tema que foi escolhido antes
const temaSalvo = localStorage.getItem("temaLumi") || "escuro";

// coloca no site o tema
document.documentElement.setAttribute("data-tema", temaSalvo);

// atualiza o tema 
const seletorTema = document.getElementById("temaEscolhido");

if (seletorTema) {
    seletorTema.value = temaSalvo;
}

// função q troca o tema
function alterarTema(tema) {
    if (tema !== "claro" && tema !== "escuro") {
        return;
    }

    document.documentElement.setAttribute("data-tema", tema);

    // Salva a preferência no navegador
    localStorage.setItem("temaLumi", tema);
}