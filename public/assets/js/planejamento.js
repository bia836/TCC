
// ELEMENTOS DO CALENDÁRIO

const mesAtual = document.getElementById("mesAtual");
const diasCalendario = document.getElementById("diasCalendario");
const dataSelecionada = document.getElementById("dataSelecionada");
const listaTarefasDia = document.getElementById("listaTarefasDia");

const botaoAnterior = document.getElementById("mesAnterior");
const botaoProximo = document.getElementById("proximoMes");

const campoData = document.getElementById("dataTarefa");


// TAREFAS RECEBIDAS DO PHP

const dados = document.getElementById("dadosTarefas");

const tarefas = dados ? JSON.parse(dados.textContent) : [];


// DATA ATUAL

const hoje = new Date();

let anoAtual = hoje.getFullYear();
let mes = hoje.getMonth();
let diaSelecionado = hoje.getDate();


// FORMATA UMA DATA PARA AAAA-MM-DD

function formatarData(ano, mes, dia) {
    return `${ano}-${String(mes + 1).padStart(2, "0")}-${String(dia).padStart(2, "0")}`;
}


// MOSTRA O CALENDÁRIO

function mostrarCalendario() {

    const primeiroDia = new Date(anoAtual, mes, 1).getDay();
    const ultimoDia = new Date(anoAtual, mes + 1, 0).getDate();

    const nomeMes = new Date(anoAtual, mes).toLocaleDateString("pt-BR", {
        month: "long",
        year: "numeric"
    });

    mesAtual.textContent = nomeMes.charAt(0).toUpperCase() + nomeMes.slice(1);

    diasCalendario.innerHTML = "";

    // ESPAÇOS ANTES DO PRIMEIRO DIA

    for (let i = 0; i < primeiroDia; i++) {
        const vazio = document.createElement("span");
        vazio.classList.add("diaVazio");
        diasCalendario.appendChild(vazio);
    }

    // CRIA OS DIAS DO MÊS

    for (let dia = 1; dia <= ultimoDia; dia++) {

        const data = formatarData(anoAtual, mes, dia);

        const botao = document.createElement("button");
        botao.type = "button";
        botao.textContent = dia;
        botao.classList.add("diaCalendario");

        // DESTACA O DIA SELECIONADO

        if (data === formatarData(anoAtual, mes, diaSelecionado)) {
            botao.classList.add("selecionado");
        }

        // DESTACA O DIA ATUAL

        if (
            dia === hoje.getDate() &&
            mes === hoje.getMonth() &&
            anoAtual === hoje.getFullYear()
        ) {
            botao.classList.add("hoje");
        }

        // MARCA OS DIAS QUE POSSUEM TAREFAS

        const possuiTarefa = tarefas.some(tarefa => {
            return tarefa.data_tarefa === data;
        });

        if (possuiTarefa) {
            botao.classList.add("temTarefa");
        }

        // SELECIONA O DIA AO CLICAR

        botao.addEventListener("click", () => {
            diaSelecionado = dia;
            mostrarCalendario();
            mostrarTarefas();
        });

        diasCalendario.appendChild(botao);
    }
}


// MOSTRA AS TAREFAS DO DIA SELECIONADO

function mostrarTarefas() {

    const data = formatarData(anoAtual, mes, diaSelecionado);

    const dataBonita = new Date(anoAtual, mes, diaSelecionado)
        .toLocaleDateString("pt-BR");

    dataSelecionada.textContent = `Tarefas de ${dataBonita}`;

    campoData.value = data;

    listaTarefasDia.innerHTML = "";

    const tarefasDoDia = tarefas.filter(tarefa => {
        return tarefa.data_tarefa === data;
    });

    // MENSAGEM QUANDO NÃO EXISTEM TAREFAS

    if (tarefasDoDia.length === 0) {

        const mensagem = document.createElement("p");
        mensagem.classList.add("semTarefas");
        mensagem.textContent = "Nenhuma tarefa planejada para este dia.";

        listaTarefasDia.appendChild(mensagem);
        return;
    }

    // CRIA CADA TAREFA

    tarefasDoDia.forEach(tarefa => {

        const item = document.createElement("div");
        item.classList.add("itemTarefa");

        const concluida = Number(tarefa.concluida) === 1;

        if (concluida) {
            item.classList.add("tarefaConcluida");
        }

        const nome = document.createElement("span");
        nome.classList.add("nomeTarefa");
        nome.textContent = tarefa.titulo;

        const acoes = document.createElement("div");
        acoes.classList.add("acoesTarefa");

        // FORMULÁRIO PARA CONCLUIR OU DESFAZER

        const formConcluir = document.createElement("form");
        formConcluir.action = "/TCC/public/planejamento/concluir";
        formConcluir.method = "POST";

        const idConcluir = document.createElement("input");
        idConcluir.type = "hidden";
        idConcluir.name = "id_planejamento";
        idConcluir.value = tarefa.id_planejamento;

        const status = document.createElement("input");
        status.type = "hidden";
        status.name = "concluida";
        status.value = concluida ? 0 : 1;

        const botaoConcluir = document.createElement("button");
        botaoConcluir.type = "submit";
        botaoConcluir.classList.add("botaoConcluir");

        const iconeConcluir = document.createElement("i");
        iconeConcluir.classList.add("bx", concluida ? "bx-undo" : "bx-check");

        botaoConcluir.appendChild(iconeConcluir);
        botaoConcluir.append(concluida ? " Desfazer" : " Concluir");

        formConcluir.append(idConcluir, status, botaoConcluir);

        // FORMULÁRIO PARA EXCLUIR

        const formExcluir = document.createElement("form");
        formExcluir.action = "/TCC/public/planejamento/excluir";
        formExcluir.method = "POST";

        const idExcluir = document.createElement("input");
        idExcluir.type = "hidden";
        idExcluir.name = "id_planejamento";
        idExcluir.value = tarefa.id_planejamento;

        const botaoExcluir = document.createElement("button");
        botaoExcluir.type = "submit";
        botaoExcluir.classList.add("botaoExcluir");
        botaoExcluir.title = "Excluir tarefa";

        const iconeExcluir = document.createElement("i");
        iconeExcluir.classList.add("bx", "bx-trash");

        botaoExcluir.appendChild(iconeExcluir);
        formExcluir.append(idExcluir, botaoExcluir);

        // CONFIRMA ANTES DE EXCLUIR

        formExcluir.addEventListener("submit", evento => {
            if (!confirm("Deseja realmente excluir esta tarefa?")) {
                evento.preventDefault();
            }
        });

        acoes.append(formConcluir, formExcluir);

        item.append(nome, acoes);

        listaTarefasDia.appendChild(item);
    });
}


// AVANÇA PARA O MÊS SEGUINTE

botaoProximo.addEventListener("click", () => {

    mes++;

    if (mes > 11) {
        mes = 0;
        anoAtual++;
    }

    diaSelecionado = 1;

    mostrarCalendario();
    mostrarTarefas();
});


// VOLTA PARA O MÊS ANTERIOR

botaoAnterior.addEventListener("click", () => {

    mes--;

    if (mes < 0) {
        mes = 11;
        anoAtual--;
    }

    diaSelecionado = 1;

    mostrarCalendario();
    mostrarTarefas();
});


// ATUALIZA O CALENDÁRIO AO ESCOLHER UMA DATA NO CAMPO

campoData.addEventListener("change", () => {

    if (!campoData.value) return;

    const partes = campoData.value.split("-");

    anoAtual = Number(partes[0]);
    mes = Number(partes[1]) - 1;
    diaSelecionado = Number(partes[2]);

    mostrarCalendario();
    mostrarTarefas();
});


// INICIA O CALENDÁRIO

mostrarCalendario();
mostrarTarefas();
