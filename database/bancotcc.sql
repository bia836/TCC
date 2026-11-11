-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10/11/2026 às 20:46
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bancotcc`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `alternativas`
--

CREATE TABLE `alternativas` (
  `id` int(11) NOT NULL,
  `id_atividade` int(11) NOT NULL,
  `texto` text NOT NULL,
  `correta` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `anos`
--

CREATE TABLE `anos` (
  `id_ano` int(11) NOT NULL,
  `nome_ano` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `anos`
--

INSERT INTO `anos` (`id_ano`, `nome_ano`) VALUES
(1, '1º ano do Ensino Médio'),
(2, '2º ano do Ensino Médio'),
(3, '3º ano do Ensino Médio'),
(4, 'Vestibular / ENEM');

-- --------------------------------------------------------

--
-- Estrutura para tabela `atividades`
--

CREATE TABLE `atividades` (
  `id` int(11) NOT NULL,
  `pergunta` text NOT NULL,
  `id_materia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `conteudos`
--

CREATE TABLE `conteudos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `descricao` text DEFAULT NULL,
  `url_video` varchar(255) DEFAULT NULL,
  `tipo` enum('dica','aula','resumo') DEFAULT NULL,
  `criado_em` datetime DEFAULT current_timestamp(),
  `id_materia` int(11) DEFAULT NULL,
  `texto_conteudo` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `conteudos`
--

INSERT INTO `conteudos` (`id`, `titulo`, `descricao`, `url_video`, `tipo`, `criado_em`, `id_materia`, `texto_conteudo`) VALUES
-- 1º ANO ENSINO FUNDAMENTAL (3 conteúdos por matéria)
(1, '[1º Ano Fund.] Matemática - Contagem e Números de 1 a 50', 'Introdução à contagem e reconhecimento numérico básico.', 'https://www.youtube.com/watch?v=F5GGs1Rpt7I', 'aula', '2026-11-10 21:00:00', 1, NULL),
(2, '[1º Ano Fund.] Matemática - Noções de Adição Simples', 'Juntando quantidades com pequenos objetos.', 'https://www.youtube.com/watch?v=LxuTxkHAXeQ', 'aula', '2026-11-10 21:00:00', 1, NULL),
(3, '[1º Ano Fund.] Matemática - Formas Geométricas Básicas no Dia a Dia', 'Identificando círculos, quadrados e triângulos ao nosso redor.', 'https://www.youtube.com/watch?v=8v_w8itTslc', 'aula', '2026-11-10 21:00:00', 1, NULL),
(4, '[1º Ano Fund.] Português - Alfabeto e Vogais', 'Reconhecimento das vogais e primeiras famílias silábicas.', 'https://www.youtube.com/watch?v=LMaE0gAsI04', 'aula', '2026-11-10 21:00:00', 2, NULL),
(5, '[1º Ano Fund.] Português - Formação de Palavras Simples', 'Juntando consoantes e vogais para formar as primeiras palavras.', 'https://www.youtube.com/watch?v=XsN0e_xPyNI', 'aula', '2026-11-10 21:00:00', 2, NULL),
(6, '[1º Ano Fund.] Português - Leitura de Imagens e Pequenas Histórias', 'Compreensão de narrativas visuais e contação de histórias.', 'https://www.youtube.com/watch?v=TuBKsV3lSQc', 'aula', '2026-11-10 21:00:00', 2, NULL),
(7, '[1º Ano Fund.] História - Minha Família e Minha História', 'A importância da família e a linha do tempo pessoal.', 'https://www.youtube.com/watch?v=6iwkrRpb03A', 'aula', '2026-11-10 21:00:00', 3, NULL),
(8, '[1º Ano Fund.] História - A Rotina no Dia a Dia', 'Compreensão dos momentos do dia: manhã, tarde e noite.', 'https://www.youtube.com/watch?v=VOzIQK4m0k8', 'aula', '2026-11-10 21:00:00', 3, NULL),
(9, '[1º Ano Fund.] História - Minha Escola e Meus Amigos', 'O ambiente escolar e a convivência em comunidade.', 'https://www.youtube.com/watch?v=jAMnrrqGYcw', 'aula', '2026-11-10 21:00:00', 3, NULL),
(10, '[1º Ano Fund.] Geografia - A Casa e os Espaços de Vivência', 'Identificação dos cômodos da moradia e regras de convivência.', 'https://www.youtube.com/watch?v=9E8ajFP0Iq0', 'aula', '2026-11-10 21:00:00', 7, NULL),
(11, '[1º Ano Fund.] Geografia - O Caminho de Casa para a Escola', 'Noções espaciais básicas, pontos de referência e trajetos.', 'https://www.youtube.com/watch?v=nrzFMOq1k-w', 'aula', '2026-11-10 21:00:00', 7, NULL),
(12, '[1º Ano Fund.] Geografia - Os Espaços Públicos e Privados', 'Diferença entre praças, ruas e ambientes particulares.', 'https://www.youtube.com/live/YvH0XoPyANA', 'aula', '2026-11-10 21:00:00', 7, NULL),
(13, '[1º Ano Fund.] Ciências - O Corpo Humano e os Sentidos', 'Os cinco sentidos e os cuidados básicos com a higiene pessoal.', 'https://www.youtube.com/watch?v=bMwEgGaB1ZQ', 'aula', '2026-11-10 21:00:00', 5, NULL),
(14, '[1º Ano Fund.] Ciências - Os Animais e as Plantas ao Nosso Redor', 'Diferenciação básica entre seres vivos na natureza.', 'https://www.youtube.com/watch?v=6H_8eFmx-g0', 'aula', '2026-11-10 21:00:00', 5, NULL),
(15, '[1º Ano Fund.] Ciências - Hábitos de Higiene e Saúde', 'Importância de lavar as mãos, escovar os dentes e boa alimentação.', 'https://www.youtube.com/watch?v=Ijb2CVy_-y0', 'aula', '2026-11-10 21:00:00', 5, NULL),

-- 2º ANO ENSINO FUNDAMENTAL (3 conteúdos por matéria)
(16, '[2º Ano Fund.] Matemática - Adição e Subtração com Reagrupamento', 'Operações fundamentais com dezenas e unidades.', 'https://www.youtube.com/watch?v=MSZdhDBoXe0', 'aula', '2026-11-10 21:00:00', 12, NULL),
(17, '[2º Ano Fund.] Matemática - Introdução à Tabuada e Dobro/Metade', 'Noções iniciais de multiplicação e divisão intuitiva.', 'https://www.youtube.com/watch?v=ddZHkCUcYRM', 'aula', '2026-11-10 21:00:00', 12, NULL),
(18, '[2º Ano Fund.] Matemática - Medidas de Tempo (Calendário e Horas)', 'Dias da semana, meses do ano e leitura de relógios de ponteiro.', 'https://www.youtube.com/watch?v=0HXlohthSoY', 'aula', '2026-11-10 21:00:00', 12, NULL),
(19, '[2º Ano Fund.] Português - Sílabas Complexas e Famílias Silábicas', 'Leitura e formação de palavras com LH, NH e CH.', 'https://www.youtube.com/watch?v=LMaE0gAsI04', 'aula', '2026-11-10 21:00:00', 13, NULL),
(20, '[2º Ano Fund.] Português - Pontuação Básica: Ponto Final e Interrogação', 'Uso correto do ponto final e ponto de interrogação nas frases.', 'https://www.youtube.com/watch?v=TuBKsV3lSQc', 'aula', '2026-11-10 21:00:00', 13, NULL),
(21, '[2º Ano Fund.] Português - Aumento e Diminutivo das Palavras', 'Como transformar palavras usando sufixos de tamanho.', 'https://www.youtube.com/watch?v=X61lboe5_pM', 'aula', '2026-11-10 21:00:00', 13, NULL),
(22, '[2º Ano Fund.] História - A Comunidade e os Trabalhadores', 'A importância de diferentes profissões no dia a dia da cidade.', 'https://www.youtube.com/watch?v=6iwkrRpb03A', 'aula', '2026-11-10 21:00:00', 14, NULL),
(23, '[2º Ano Fund.] História - Brincadeiras de Ontem e de Hoje', 'Transformações nos brinquedos e brincadeiras ao longo do tempo.', 'https://www.youtube.com/watch?v=VOzIQK4m0k8', 'aula', '2026-11-10 21:00:00', 14, NULL),
(24, '[2º Ano Fund.] História - Documentos Pessoais e Memória', 'A importância da certidão de nascimento e registros de identidade.', 'https://www.youtube.com/watch?v=jAMnrrqGYcw', 'aula', '2026-11-10 21:00:00', 14, NULL),
(25, '[2º Ano Fund.] Geografia - Paisagem Natural e Paisagem Modificada', 'Diferença entre o que a natureza criou e o que o ser humano construiu.', 'https://www.youtube.com/watch?v=9E8ajFP0Iq0', 'aula', '2026-11-10 21:00:00', 18, NULL),
(26, '[2º Ano Fund.] Geografia - O Bairro e suas Características', 'Ruas, comércios e a convivência nos espaços públicos.', 'https://www.youtube.com/watch?v=nrzFMOq1k-w', 'aula', '2026-11-10 21:00:00', 18, NULL),
(27, '[2º Ano Fund.] Geografia - Cuidados com o Meio Ambiente no Bairro', 'Coleta seletiva e preservação de praças e ruas.', 'https://www.youtube.com/live/YvH0XoPyANA', 'aula', '2026-11-10 21:00:00', 18, NULL),
(28, '[2º Ano Fund.] Ciências - Os Seres Vivos e o Ambiente', 'Ciclo de vida dos animais e das plantas.', 'https://www.youtube.com/watch?v=bMwEgGaB1ZQ', 'aula', '2026-11-10 21:00:00', 16, NULL),
(29, '[2º Ano Fund.] Ciências - Ambientes Aquáticos e Terrestres', 'Como os animais se adaptam aos diferentes habitats.', 'https://www.youtube.com/watch?v=6H_8eFmx-g0', 'aula', '2026-11-10 21:00:00', 16, NULL),
(30, '[2º Ano Fund.] Ciências - Luz, Calor e Som no Dia a Dia', 'Fontes de luz natural e artificial e percepção dos sons.', 'https://www.youtube.com/watch?v=Ijb2CVy_-y0', 'aula', '2026-11-10 21:00:00', 16, NULL),

-- 3º ANO ENSINO FUNDAMENTAL (3 conteúdos por matéria)
(31, '[3º Ano Fund.] Matemática - Introdução à Multiplicação', 'A ideia de soma de parcelas iguais e tabuada básica.', 'https://www.youtube.com/watch?v=ddZHkCUcYRM', 'aula', '2026-11-10 21:00:00', 23, NULL),
(32, '[3º Ano Fund.] Matemática - Medidas de Comprimento, Massa e Capacidade', 'Uso de metro, quilograma e litro no cotidiano.', 'https://www.youtube.com/watch?v=MSZdhDBoXe0', 'aula', '2026-11-10 21:00:00', 23, NULL),
(33, '[3º Ano Fund.] Matemática - Sistema Monetário Brasileiro', 'Reconhecimento de cédulas, moedas e troco em compras simples.', 'https://www.youtube.com/watch?v=0HXlohthSoY', 'aula', '2026-11-10 21:00:00', 23, NULL),
(34, '[3º Ano Fund.] Português - Tipos de Frases (Afirmativa, Negativa, Interrogativa)', 'Pontuação e entonação correta na leitura.', 'https://www.youtube.com/watch?v=X61lboe5_pM', 'aula', '2026-11-10 21:00:00', 24, NULL),
(35, '[3º Ano Fund.] Português - Substantivos e Adjetivos Simples', 'Identificação de nomes de seres e suas qualidades.', 'https://www.youtube.com/watch?v=LMaE0gAsI04', 'aula', '2026-11-10 21:00:00', 24, NULL),
(36, '[3º Ano Fund.] Português - Sinônimos e Antônimos', 'Palavras com sentidos semelhantes e opostos.', 'https://www.youtube.com/watch?v=XsN0e_xPyNI', 'aula', '2026-11-10 21:00:00', 24, NULL),
(37, '[3º Ano Fund.] História - A Fundação do Município', 'Como a cidade onde moramos começou e quem foram os pioneiros.', 'https://www.youtube.com/watch?v=6iwkrRpb03A', 'aula', '2026-11-10 21:00:00', 25, NULL),
(38, '[3º Ano Fund.] História - O Trabalho no Campo e na Cidade', 'A interdependência entre a zona rural e a zona urbana.', 'https://www.youtube.com/watch?v=VOzIQK4m0k8', 'aula', '2026-11-10 21:00:00', 25, NULL),
(39, '[3º Ano Fund.] História - Migração e a Chegada de Novos Moradores', 'A influência de diferentes culturas na formação da população local.', 'https://www.youtube.com/watch?v=jAMnrrqGYcw', 'aula', '2026-11-10 21:00:00', 25, NULL),
(40, '[3º Ano Fund.] Geografia - O Município e a Zona Rural/Urbana', 'Diferenças econômicas e sociais entre campo e cidade.', 'https://www.youtube.com/watch?v=9E8ajFP0Iq0', 'aula', '2026-11-10 21:00:00', 29, NULL),
(41, '[3º Ano Fund.] Geografia - Mapas Simples e Orientação por Pontos Cardeais', 'Noções básicas de rosa dos ventos e representação cartográfica.', 'https://www.youtube.com/watch?v=nrzFMOq1k-w', 'aula', '2026-11-10 21:00:00', 29, NULL),
(42, '[3º Ano Fund.] Geografia - O Clima e o Tempo Atmosférico na Região', 'Como o clima influencia as roupas, vestuário e o cotidiano.', 'https://www.youtube.com/live/YvH0XoPyANA', 'aula', '2026-11-10 21:00:00', 29, NULL),
(43, '[3º Ano Fund.] Ciências - Cadeias Alimentares Simples', 'Produtores, consumidores e decompositores na natureza.', 'https://www.youtube.com/watch?v=bMwEgGaB1ZQ', 'aula', '2026-11-10 21:00:00', 27, NULL),
(44, '[3º Ano Fund.] Ciências - Água e Solo: Recursos Essenciais', 'A importância da preservação da água e dos tipos de solo.', 'https://www.youtube.com/watch?v=6H_8eFmx-g0', 'aula', '2026-11-10 21:00:00', 27, NULL),
(45, '[3º Ano Fund.] Ciências - O Ciclo da Água na Natureza', 'Evaporação, condensação e precipitação explicadas de forma simples.', 'https://www.youtube.com/watch?v=Ijb2CVy_-y0', 'aula', '2026-11-10 21:00:00', 27, NULL),

-- 4º ANO ENSINO FUNDAMENTAL (3 conteúdos por matéria)
(46, '[4º Ano Fund.] Matemática - Divisão Exata e Não Exata', 'O algoritmo da divisão e o conceito de resto.', 'https://www.youtube.com/watch?v=0HXlohthSoY', 'aula', '2026-11-10 21:00:00', 34, NULL),
(47, '[4º Ano Fund.] Matemática - Introdução às Frações', 'Partes de um todo e representação fracionária básica.', 'https://www.youtube.com/watch?v=F5GGs1Rpt7I', 'aula', '2026-11-10 21:00:00', 34, NULL),
(48, '[4º Ano Fund.] Matemática - Perímetro e Área de Figuras Planas', 'Cálculo de medidas em malhas quadriculadas.', 'https://www.youtube.com/watch?v=ddZHkCUcYRM', 'aula', '2026-11-10 21:00:00', 34, NULL),
(49, '[4º Ano Fund.] Português - Substantivos Próprios e Comuns', 'Classificação e uso correto de letras maiúsculas.', 'https://www.youtube.com/watch?v=XsN0e_xPyNI', 'aula', '2026-11-10 21:00:00', 35, NULL),
(50, '[4º Ano Fund.] Português - Sílabas Tônicas e Acentuação Básica', 'Identificação da sílaba mais forte nas palavras.', 'https://www.youtube.com/watch?v=LMaE0gAsI04', 'aula', '2026-11-10 21:00:00', 35, NULL),
(51, '[4º Ano Fund.] Português - Produção de Textos Narrativos e Parágrafos', 'Como estruturar início, meio e fim em uma historinha.', 'https://www.youtube.com/watch?v=TuBKsV3lSQc', 'aula', '2026-11-10 21:00:00', 35, NULL),
(52, '[4º Ano Fund.] História - Os Primeiros Habitantes e a Colonização', 'A chegada dos portugueses e os povos indígenas originários.', 'https://www.youtube.com/watch?v=6iwkrRpb03A', 'aula', '2026-11-10 21:00:00', 36, NULL),
(53, '[4º Ano Fund.] História - Caminhos e Rotas do Comércio Antigo', 'Como as trocas comerciais moldaram as primeiras vilas e cidades.', 'https://www.youtube.com/watch?v=VOzIQK4m0k8', 'aula', '2026-11-10 21:00:00', 36, NULL),
(54, '[4º Ano Fund.] História - A Expansão do Território Brasileiro', 'As expedições dos bandeirantes e a interiorização do Brasil.', 'https://www.youtube.com/watch?v=jAMnrrqGYcw', 'aula', '2026-11-10 21:00:00', 36, NULL),
(55, '[4º Ano Fund.] Geografia - O Estado e a Região onde Vivo', 'Divisão político-administrativa do Brasil e estados vizinhos.', 'https://www.youtube.com/watch?v=9E8ajFP0Iq0', 'aula', '2026-11-10 21:00:00', 40, NULL),
(56, '[4º Ano Fund.] Geografia - Relevo e Hidrografia do Brasil', 'Rios, montanhas, planaltos e depressões no território brasileiro.', 'https://www.youtube.com/watch?v=nrzFMOq1k-w', 'aula', '2026-11-10 21:00:00', 40, NULL),
(57, '[4º Ano Fund.] Geografia - População e Migrações Internas', 'O deslocamento de pessoas entre regiões brasileiras.', 'https://www.youtube.com/live/YvH0XoPyANA', 'aula', '2026-11-10 21:00:00', 40, NULL),
(58, '[4º Ano Fund.] Ciências - O Sistema Solar e os Movimentos da Terra', 'Rotação, translação e as fases da Lua.', 'https://www.youtube.com/watch?v=7kluWpnlVPU', 'aula', '2026-11-10 21:00:00', 38, NULL),
(59, '[4º Ano Fund.] Ciências - Misturas e Transformações dos Materiais', 'Materiais solúveis e insolúveis, mudanças físicas do dia a dia.', 'https://www.youtube.com/watch?v=bMwEgGaB1ZQ', 'aula', '2026-11-10 21:00:00', 38, NULL),
(60, '[4º Ano Fund.] Ciências - Ecossistemas e Teias Alimentares', 'Relações ecológicas entre os seres vivos nos biomas.', 'https://www.youtube.com/watch?v=6H_8eFmx-g0', 'aula', '2026-11-10 21:00:00', 38, NULL),

-- 5º ANO ENSINO FUNDAMENTAL (3 conteúdos por matéria)
(61, '[5º Ano Fund.] Matemática - Operações com Frações e Números Decimais', 'Soma, subtração de frações e leitura de números com vírgula.', 'https://www.youtube.com/watch?v=F5GGs1Rpt7I', 'aula', '2026-11-10 21:00:00', 45, NULL),
(62, '[5º Ano Fund.] Matemática - Porcentagem e Gráficos Básicos', 'Cálculos de porcentagens simples e leitura de tabelas estatísticas.', 'https://www.youtube.com/watch?v=0HXlohthSoY', 'aula', '2026-11-10 21:00:00', 45, NULL),
(63, '[5º Ano Fund.] Matemática - Volume e Unidades de Medida Cúbicas', 'Noções espaciais e cálculo de capacidade em blocos.', 'https://www.youtube.com/watch?v=MSZdhDBoXe0', 'aula', '2026-11-10 21:00:00', 45, NULL),
(64, '[5º Ano Fund.] Português - Coesão e Pontuação em Textos Narrativos', 'Uso de travessão, dois-pontos e vírgula na contação de histórias.', 'https://www.youtube.com/watch?v=TuBKsV3lSQc', 'aula', '2026-11-10 21:00:00', 46, NULL),
(65, '[5º Ano Fund.] Português - Pronomes e Variação Linguística', 'Uso de pronomes pessoais e respeito às formas de falar.', 'https://www.youtube.com/watch?v=LMaE0gAsI04', 'aula', '2026-11-10 21:00:00', 46, NULL),
(66, '[5º Ano Fund.] Português - Concordância Básica entre Nome e Verbo', 'Regras essenciais para escrever frases corretas.', 'https://www.youtube.com/watch?v=X61lboe5_pM', 'aula', '2026-11-10 21:00:00', 46, NULL),
(67, '[5º Ano Fund.] História - A Formação do Povo Brasileiro', 'A miscigenação cultural entre indígenas, africanos e europeus.', 'https://www.youtube.com/watch?v=6iwkrRpb03A', 'aula', '2026-11-10 21:00:00', 47, NULL),
(68, '[5º Ano Fund.] História - Cidadania e Direitos no Brasil', 'A Constituição, os direitos das crianças e deveres em sociedade.', 'https://www.youtube.com/watch?v=VOzIQK4m0k8', 'aula', '2026-11-10 21:00:00', 47, NULL),
(69, '[5º Ano Fund.] História - Patrimônio Histórico e Cultural', 'A importância de preservar monumentos, festas e tradições.', 'https://www.youtube.com/watch?v=jAMnrrqGYcw', 'aula', '2026-11-10 21:00:00', 47, NULL),
(70, '[5º Ano Fund.] Geografia - Regiões Brasileiras e Diversidade Cultural', 'As cinco grandes regiões do Brasil, biomas e costumes locais.', 'https://www.youtube.com/watch?v=9E8ajFP0Iq0', 'aula', '2026-11-10 21:00:00', 51, NULL),
(71, '[5º Ano Fund.] Geografia - Globalização e Meio Ambiente Urbano', 'Problemas ambientais nas grandes cidades e lixo urbano.', 'https://www.youtube.com/watch?v=nrzFMOq1k-w', 'aula', '2026-11-10 21:00:00', 51, NULL),
(72, '[5º Ano Fund.] Geografia - Redes de Transporte e Comunicação', 'Como circulam pessoas, mercadorias e informações no país.', 'https://www.youtube.com/live/YvH0XoPyANA', 'aula', '2026-11-10 21:00:00', 51, NULL),
(73, '[5º Ano Fund.] Ciências - Sistema Digestório e Respiratório', 'Como o corpo humano absorve nutrientes e oxigênio.', 'https://www.youtube.com/watch?v=bMwEgGaB1ZQ', 'aula', '2026-11-10 21:00:00', 49, NULL),
(74, '[5º Ano Fund.] Ciências - Fontes de Energia e Eletricidade', 'Energia renovável, não renovável e circuitos elétricos simples.', 'https://www.youtube.com/watch?v=6H_8eFmx-g0', 'aula', '2026-11-10 21:00:00', 49, NULL),
(75, '[5º Ano Fund.] Ciências - Astronomia e Instrumentos de Observação', 'O uso de telescópios e a exploração do espaço.', 'https://www.youtube.com/watch?v=Ijb2CVy_-y0', 'aula', '2026-11-10 21:00:00', 49, NULL),

-- 6º ANO ENSINO FUNDAMENTAL (3 conteúdos por matéria)
(76, '[6º Ano Fund.] Matemática - Números Inteiros e Operações com Negativos', 'A reta numérica e o conjunto dos números inteiros.', 'https://www.youtube.com/watch?v=MSZdhDBoXe0', 'aula', '2026-11-10 21:00:00', 56, NULL),
(77, '[6º Ano Fund.] Matemática - Frações e Operações Fundamentais', 'Conceito, simplificação e operações com frações ordinárias.', 'https://www.youtube.com/watch?v=ddZHkCUcYRM', 'aula', '2026-11-10 21:00:00', 56, NULL),
(78, '[6º Ano Fund.] Matemática - Expressões Numéricas e Potenciação', 'Ordem de resolução de operações matemáticas básicas.', 'https://www.youtube.com/watch?v=0HXlohthSoY', 'aula', '2026-11-10 21:00:00', 56, NULL),
(79, '[6º Ano Fund.] Português - Morfologia: Substantivos e Adjetivos', 'Estrutura e classificação das classes gramaticais.', 'https://www.youtube.com/watch?v=LMaE0gAsI04', 'aula', '2026-11-10 21:00:00', 57, NULL),
(80, '[6º Ano Fund.] Português - Gêneros Textuais: Notícia e Reportagem', 'Características de textos informativos na mídia.', 'https://www.youtube.com/watch?v=X61lboe5_pM', 'aula', '2026-11-10 21:00:00', 57, NULL),
(81, '[6º Ano Fund.] Português - Fonética e Fonologia: Encontros Vocálicos', 'Diferença entre fonemas, letras, ditongos e hiatos.', 'https://www.youtube.com/watch?v=XsN0e_xPyNI', 'aula', '2026-11-10 21:00:00', 57, NULL),
(82, '[6º Ano Fund.] História - A Pré-História e o Surgimento da Agricultura', 'A Revolução Neolítica e as primeiras comunidades humanas.', 'https://www.youtube.com/watch?v=6iwkrRpb03A', 'aula', '2026-11-10 21:00:00', 58, NULL),
(83, '[6º Ano Fund.] História - As Primeiras Civilizações: Mesopotâmia e Egito', 'A organização política e social nos vales dos grandes rios.', 'https://www.youtube.com/watch?v=VOzIQK4m0k8', 'aula', '2026-11-10 21:00:00', 58, NULL),
(84, '[6º Ano Fund.] História - Grécia Antiga: A Origem da Democracia', 'A formação das pólis gregas, Atenas e Esparta.', 'https://www.youtube.com/watch?v=jAMnrrqGYcw', 'aula', '2026-11-10 21:00:00', 58, NULL),
(85, '[6º Ano Fund.] Geografia - Orientação e Coordenadas Geográficas', 'Latitude, longitude e pontos cardeais.', 'https://www.youtube.com/watch?v=nrzFMOq1k-w', 'aula', '2026-11-10 21:00:00', 62, NULL),
(86, '[6º Ano Fund.] Geografia - A Dinâmica Interna e Externa da Terra', 'Placas tectônicas, terremotos, vulcões e intemperismo.', 'https://www.youtube.com/live/YvH0XoPyANA', 'aula', '2026-11-10 21:00:00', 62, NULL),
(87, '[6º Ano Fund.] Geografia - As Camadas da Atmosfera e o Clima', 'A troposfera, estratofera e fenômenos meteorológicos.', 'https://www.youtube.com/watch?v=9E8ajFP0Iq0', 'aula', '2026-11-10 21:00:00', 62, NULL),
(88, '[6º Ano Fund.] Ciências - Célula: A Unidade da Vida', 'Introdução à citologia, organelas básicas e seres vivos.', 'https://www.youtube.com/watch?v=bMwEgGaB1ZQ', 'aula', '2026-11-10 21:00:00', 60, NULL),
(89, '[6º Ano Fund.] Ciências - Misturas Homogêneas e Heterogêneas', 'Métodos de separação de misturas no laboratório e cotidiano.', 'https://www.youtube.com/watch?v=6H_8eFmx-g0', 'aula', '2026-11-10 21:00:00', 60, NULL),
(90, '[6º Ano Fund.] Ciências - Astronomia: O Sistema Solar em Detalhes', 'Características dos planetas rochosos e gasosos.', 'https://www.youtube.com/watch?v=7kluWpnlVPU', 'aula', '2026-11-10 21:00:00', 60, NULL),

-- 7º ANO ENSINO FUNDAMENTAL (3 conteúdos por matéria)
(91, '[7º Ano Fund.] Matemática - Equações do 1º Grau com Uma Incógnita', 'Como isolar a incógnita e resolver problemas algébricos.', 'https://www.youtube.com/watch?v=LxuTxkHAXeQ', 'aula', '2026-11-10 21:00:00', 67, NULL),
(92, '[7º Ano Fund.] Matemática - Razão e Proporção', 'Regra de três simples e aplicações práticas.', 'https://www.youtube.com/watch?v=MSZdhDBoXe0', 'aula', '2026-11-10 21:00:00', 67, NULL),
(93, '[7º Ano Fund.] Matemática - Números Racionais e Operações com Decimais', 'Estudo aprofundado de frações, dízimas e números com vírgula.', 'https://www.youtube.com/watch?v=0HXlohthSoY', 'aula', '2026-11-10 21:00:00', 67, NULL),
(94, '[7º Ano Fund.] Português - Verbos: Tempos e Modos Verbais', 'Indicativo, subjuntivo e imperativo no cotidiano.', 'https://www.youtube.com/watch?v=X61lboe5_pM', 'aula', '2026-11-10 21:00:00', 68, NULL),
(95, '[7º Ano Fund.] Português - Concordância Verbal e Nominal Básica', 'Como combinar corretamente palavras em frases complexas.', 'https://www.youtube.com/watch?v=LMaE0gAsI04', 'aula', '2026-11-10 21:00:00', 68, NULL),
(96, '[7º Ano Fund.] Português - Variação Linguística e Preconceito', 'As diferentes formas de falar a língua portuguesa no Brasil.', 'https://www.youtube.com/watch?v=TuBKsV3lSQc', 'aula', '2026-11-10 21:00:00', 68, NULL),
(97, '[7º Ano Fund.] História - O Período Feudal e a Idade Média', 'A sociedade feudal, economia e o papel da Igreja.', 'https://www.youtube.com/watch?v=VOzIQK4m0k8', 'aula', '2026-11-10 21:00:00', 69, NULL),
(98, '[7º Ano Fund.] História - O Renascimento Cultural e Científico', 'A redescoberta dos clássicos e a revolução artística na Europa.', 'https://www.youtube.com/watch?v=6iwkrRpb03A', 'aula', '2026-11-10 21:00:00', 69, NULL),
(99, '[7º Ano Fund.] História - A Colonização do Brasil: Economia Açucareira', 'O sistema de capitanias hereditárias e o trabalho escravizado.', 'https://www.youtube.com/watch?v=jAMnrrqGYcw', 'aula', '2026-11-10 21:00:00', 69, NULL),
(100, '[7º Ano Fund.] Geografia - Demografia Brasileira e População', 'Crescimento vegetativo, êxodo rural e distribuição demográfica.', 'https://www.youtube.com/watch?v=9E8ajFP0Iq0', 'aula', '2026-11-10 21:00:00', 73, NULL),
(101, '[7º Ano Fund.] Geografia - Urbanização e Problemas nas Cidades', 'Crescimento desordenado, periferias e saneamento básico.', 'https://www.youtube.com/watch?v=nrzFMOq1k-w', 'aula', '2026-11-10 21:00:00', 73, NULL),
(102, '[7º Ano Fund.] Geografia - A Industrialização Brasileira', 'Fases da industrialização e concentração fabril no Sudeste.', 'https://www.youtube.com/live/YvH0XoPyANA', 'aula', '2026-11-10 21:00:00', 73, NULL),
(103, '[7º Ano Fund.] Ciências - Biodiversidade e Reinos dos Seres Vivos', 'Classificação dos seres vivos e reinos biológicos.', 'https://www.youtube.com/watch?v=6H_8eFmx-g0', 'aula', '2026-11-10 21:00:00', 71, NULL),
(104, '[7º Ano Fund.] Ciências - Máquinas Simples e Física do Quotidiano', 'Alavancas, polias e planos inclinados na física básica.', 'https://www.youtube.com/watch?v=bMwEgGaB1ZQ', 'aula', '2026-11-10 21:00:00', 71, NULL),
(105, '[7º Ano Fund.] Ciências - Clima, Biomas e Ecossistemas do Brasil', 'Características de florestas, savanas e campos brasileiros.', 'https://www.youtube.com/watch?v=Ijb2CVy_-y0', 'aula', '2026-11-10 21:00:00', 71, NULL),

-- 8º ANO ENSINO FUNDAMENTAL (3 conteúdos por matéria)
(106, '[8º Ano Fund.] Matemática - Teorema de Pitágoras no Triângulo Retângulo', 'Catetos, hipotenusa e cálculo de distâncias.', 'https://www.youtube.com/watch?v=MSZdhDBoXe0', 'aula', '2026-11-10 21:00:00', 78, NULL),
(107, '[8º Ano Fund.] Matemática - Sistemas de Equações do 1º Grau', 'Método da substituição e da adição para resolução de problemas.', 'https://www.youtube.com/watch?v=LxuTxkHAXeQ', 'aula', '2026-11-10 21:00:00', 78, NULL),
(108, '[8º Ano Fund.] Matemática - Estatística Básica: Média, Mediana e Moda', 'Análise de gráficos e medidas de tendência central.', 'https://www.youtube.com/watch?v=ddZHkCUcYRM', 'aula', '2026-11-10 21:00:00', 78, NULL),
(109, '[8º Ano Fund.] Português - Orações Coordenadas e Período Composto', 'Relações sintáticas de coordenação entre orações.', 'https://www.youtube.com/watch?v=LMaE0gAsI04', 'aula', '2026-11-10 21:00:00', 79, NULL),
(110, '[8º Ano Fund.] Português - Vozes Verbais: Ativa, Passiva e Reflexiva', 'Como o sujeito pratica ou sofre a ação na frase.', 'https://www.youtube.com/watch?v=X61lboe5_pM', 'aula', '2026-11-10 21:00:00', 79, NULL),
(111, '[8º Ano Fund.] Português - Figuras de Linguagem: Metáfora e Comparação', 'Recursos expressivos na construção de textos literários.', 'https://www.youtube.com/watch?v=TuBKsV3lSQc', 'aula', '2026-11-10 21:00:00', 79, NULL),
(112, '[8º Ano Fund.] História - Revolução Industrial e Iluminismo', 'As transformações tecnológicas e sociais do século XVIII.', 'https://www.youtube.com/watch?v=AGKX8fGF-D8', 'aula', '2026-11-10 21:00:00', 80, NULL),
(113, '[8º Ano Fund.] História - A Independência dos Estados Unidos e Revolução Francesa', 'A queda do Absolutismo e a Declaração dos Direitos.', 'https://www.youtube.com/watch?v=6iwkrRpb03A', 'aula', '2026-11-10 21:00:00', 80, NULL),
(114, '[8º Ano Fund.] História - O Período Regencial e Revoltas no Brasil Império', 'Conflitos internos e instabilidade política no Brasil do século XIX.', 'https://www.youtube.com/watch?v=jAMnrrqGYcw', 'aula', '2026-11-10 21:00:00', 80, NULL),
(115, '[8º Ano Fund.] Geografia - Globalização e Blocos Econômicos no Mundo', 'A divisão internacional do trabalho e trocas comerciais.', 'https://www.youtube.com/watch?v=9E8ajFP0Iq0', 'aula', '2026-11-10 21:00:00', 84, NULL),
(116, '[8º Ano Fund.] Geografia - A América Latina: Economia e Desigualdade', 'Aspectos físicos, históricos e socioeconômicos do subcontinente.', 'https://www.youtube.com/watch?v=nrzFMOq1k-w', 'aula', '2026-11-10 21:00:00', 84, NULL),
(117, '[8º Ano Fund.] Geografia - Os Tigres Asiáticos e a Economia do Pacífico', 'O rápido crescimento industrial de países como Coreia do Sul e Taiwan.', 'https://www.youtube.com/live/YvH0XoPyANA', 'aula', '2026-11-10 21:00:00', 84, NULL),
(118, '[8º Ano Fund.] Ciências - Sistema Nervoso e Órgãos dos Sentidos', 'O papel do cérebro, neurônios e reflexos corporais.', 'https://www.youtube.com/watch?v=6H_8eFmx-g0', 'aula', '2026-11-10 21:00:00', 82, NULL),
(119, '[8º Ano Fund.] Ciências - Reprodução Humana e Educação Sexual', 'Sistema reprodutor e transformações na puberdade.', 'https://www.youtube.com/watch?v=bMwEgGaB1ZQ', 'aula', '2026-11-10 21:00:00', 82, NULL),
(120, '[8º Ano Fund.] Ciências - Eletricidade e Circuitos Elétricos', 'Corrente elétrica, condutores, isolantes e consumo residencial.', 'https://www.youtube.com/watch?v=7kluWpnlVPU', 'aula', '2026-11-10 21:00:00', 82, NULL),

-- 9º ANO ENSINO FUNDAMENTAL (3 conteúdos por matéria)
(121, '[9º Ano Fund.] Matemática - Equação do 2º Grau (Fórmula de Bhaskara)', 'Resolução de equações quadráticas completas e incompletas.', 'https://www.youtube.com/watch?v=8v_w8itTslc', 'aula', '2026-11-10 21:00:00', 89, NULL),
(122, '[9º Ano Fund.] Matemática - Razões Trigonométricas no Triângulo Retângulo', 'Seno, cosseno e tangente aplicados a problemas geométricos.', 'https://www.youtube.com/watch?v=MSZdhDBoXe0', 'aula', '2026-11-10 21:00:00', 89, NULL),
(123, '[9º Ano Fund.] Matemática - Funções: Introdução e Gráficos', 'O conceito de função e representação no plano cartesiano.', 'https://www.youtube.com/watch?v=LxuTxkHAXeQ', 'aula', '2026-11-10 21:00:00', 89, NULL),
(124, '[9º Ano Fund.] Português - Orações Subordinadas e Coesão Avançada', 'Estruturação de períodos compostos por subordinação.', 'https://www.youtube.com/watch?v=TuBKsV3lSQc', 'aula', '2026-11-10 21:00:00', 90, NULL),
(125, '[9º Ano Fund.] Português - Sintaxe de Regência e Crase', 'Regras avançadas de regência verbal/nominal e uso do acento indicativo de crase.', 'https://www.youtube.com/watch?v=LMaE0gAsI04', 'aula', '2026-11-10 21:00:00', 90, NULL),
(126, '[9º Ano Fund.] Português - O Artigo de Opinião e Texto Argumentativo', 'Como estruturar argumentos sólidos em textos opinativos.', 'https://www.youtube.com/watch?v=X61lboe5_pM', 'aula', '2026-11-10 21:00:00', 90, NULL),
(127, '[9º Ano Fund.] História - A Era Vargas e os Movimentos do Século XX', 'O cenário político do Brasil entre 1930 e 1945.', 'https://www.youtube.com/watch?v=6wA_1C8hg-M', 'aula', '2026-11-10 21:00:00', 91, NULL),
(128, '[9º Ano Fund.] História - As Guerras Mundiais e o Período Entre-Guerras', 'O impacto geopolítico da Primeira e Segunda Guerra Mundial.', 'https://www.youtube.com/watch?v=AGKX8fGF-D8', 'aula', '2026-11-10 21:00:00', 91, NULL),
(129, '[9º Ano Fund.] História - A Ditadura Militar no Brasil e a Redemocratização', 'O golpe de 1964, resistência e a Constituinte de 1988.', 'https://www.youtube.com/watch?v=jAMnrrqGYcw', 'aula', '2026-11-10 21:00:00', 91, NULL),
(130, '[9º Ano Fund.] Geografia - Geopolítica e Conflitos Internacionais', 'A nova ordem mundial após a Guerra Fria.', 'https://www.youtube.com/watch?v=nrzFMOq1k-w', 'aula', '2026-11-10 21:00:00', 95, NULL),
(131, '[9º Ano Fund.] Geografia - A Europa e a União Europeia', 'Integração regional, economia e desafios demográficos do continente europeu.', 'https://www.youtube.com/watch?v=9E8ajFP0Iq0', 'aula', '2026-11-10 21:00:00', 95, NULL),
(132, '[9º Ano Fund.] Geografia - Os Países Emergentes: BRICS', 'O papel geopolítico e econômico do Brasil, Rússia, Índia, China e África do Sul.', 'https://www.youtube.com/live/YvH0XoPyANA', 'aula', '2026-11-10 21:00:00', 95, NULL),
(133, '[9º Ano Fund.] Ciências/Biologia - Genética e Leis de Mendel', 'Noções básicas de hereditariedade e DNA.', 'https://www.youtube.com/watch?v=bMwEgGaB1ZQ', 'aula', '2026-11-10 21:00:00', 93, NULL),
(134, '[9º Ano Fund.] Ciências - Átomos, Elementos Químicos e Tabela Periódica', 'Introdução à química: prótons, nêutrons e elétrons.', 'https://www.youtube.com/watch?v=7kluWpnlVPU', 'aula', '2026-11-10 21:00:00', 93, NULL),
(135, '[9º Ano Fund.] Ciências - Ondas, Luz e Som na Física Moderna', 'Espectro eletromagnético, reflexão e refração.', 'https://www.youtube.com/watch?v=6H_8eFmx-g0', 'aula', '2026-11-10 21:00:00', 93, NULL),

-- 1º ANO (Ensino Médio)
(136, '[1º Ano] Matemática - Teoria dos Conjuntos e Conjuntos Numéricos', 'Operações entre conjuntos e subconjuntos numéricos.', 'https://www.youtube.com/watch?v=F5GGs1Rpt7I', 'aula', '2026-10-14 13:38:52', 100, NULL),
(137, '[1º Ano] Matemática - Função do 1º Grau (Afim)', 'Gráfico, raiz e aplicações práticas da função afim.', 'https://www.youtube.com/watch?v=LxuTxkHAXeQ', 'aula', '2026-10-14 13:38:52', 100, NULL),
(138, '[1º Ano] Matemática - Função do 2º Grau (Quadrática)', 'Vértice da parábola, pontos máximos e mínimos.', 'https://www.youtube.com/watch?v=8v_w8itTslc', 'aula', '2026-10-14 13:38:52', 100, NULL),
(139, '[1º Ano] Português - Funções da Linguagem e Comunicação', 'Os elementos da comunicação e as funções da linguagem.', 'https://www.youtube.com/watch?v=LMaE0gAsI04', 'aula', '2026-10-14 13:38:52', 101, NULL),
(140, '[1º Ano] Português - Trovadorismo e Humanismo', 'As origens da literatura em língua portuguesa.', 'https://www.youtube.com/watch?v=X61lboe5_pM', 'aula', '2026-10-14 13:38:52', 101, NULL),
(141, '[1º Ano] Português - Quinhentismo no Brasil', 'A literatura de informação e os primeiros cronistas.', 'https://www.youtube.com/watch?v=XsN0e_xPyNI', 'aula', '2026-10-14 13:38:52', 101, NULL),
(142, '[1º Ano] História - O Surgimento do Homem e do Estado', 'Introdução às primeiras civilizações e formação do Estado.', 'https://www.youtube.com/watch?v=6iwkrRpb03A', 'aula', '2026-10-14 13:38:52', 102, NULL),
(143, '[1º Ano] História - Egito Antigo e Antiguidade Oriental', 'Características políticas, sociais e culturais do Egito Antigo.', 'https://www.youtube.com/watch?v=VOzIQK4m0k8', 'aula', '2026-10-14 13:38:52', 102, NULL),
(144, '[1º Ano] História - Introdução aos Estudos Históricos', 'Compreensão do papel do historiador e das fontes históricas.', 'https://www.youtube.com/watch?v=jAMnrrqGYcw', 'aula', '2026-10-14 13:38:52', 102, NULL),
(145, '[1º Ano] Química - Introdução à Matéria e Modelos Atômicos', 'Evolução dos modelos de Dalton, Thomson, Rutherford e Bohr.', 'https://www.youtube.com/watch?v=7kluWpnlVPU', 'aula', '2026-10-14 13:38:52', 103, NULL),
(146, '[1º Ano] Química - Tabela Periódica e Ligações Químicas', 'Propriedades periódicas e ligações químicas.', 'https://www.youtube.com/live/7Ad9IHTXmw0', 'aula', '2026-10-14 13:38:52', 103, NULL),
(147, '[1º Ano] Química - Funções Inorgânicas', 'Identificação e nomenclatura de ácidos, bases, sais e óxidos.', 'https://www.youtube.com/live/qfBCDMX3Yy4', 'aula', '2026-10-14 13:38:52', 103, NULL),
(148, '[1º Ano] Biologia - Introdução à Bioquímica Celular', 'Composição química da célula e substâncias orgânicas.', 'https://www.youtube.com/watch?v=bMwEgGaB1ZQ', 'aula', '2026-10-14 13:38:52', 104, NULL),
(149, '[1º Ano] Biologia - Estrutura Celular e Organelas', 'Estudo detalhado das membranas e organelas celulares.', 'https://www.youtube.com/watch?v=6H_8eFmx-g0', 'aula', '2026-10-14 13:38:52', 104, NULL),
(150, '[1º Ano] Biologia - Divisão Celular (Mitose e Meiose)', 'Como ocorre a duplicação e formação de células reprodutivas.', 'https://www.youtube.com/watch?v=Ijb2CVy_-y0', 'aula', '2026-10-14 13:38:52', 104, NULL),
(151, '[1º Ano] Física - Cinemática: Movimento Uniforme', 'Velocidade escalar média, aceleração e equações horárias.', 'https://www.youtube.com/watch?v=5eid5-U3Dvw', 'aula', '2026-10-14 13:38:52', 105, NULL),
(152, '[1º Ano] Física - Leis de Newton e Dinâmica', 'Aplicações das leis de Newton, força peso, normal e atrito.', 'https://www.youtube.com/watch?v=hxciSW_B8Hw', 'aula', '2026-10-14 13:38:52', 105, NULL),
(153, '[1º Ano] Física - Trabalho, Potência e Energia Mecânica', 'Conservação de energia mecânica e trabalho.', 'https://www.youtube.com/watch?v=Sj3sCRwMc0Q', 'aula', '2026-10-14 13:38:52', 105, NULL),
(154, '[1º Ano] Geografia - Conceitos Básicos de Espaço Geográfico', 'Entendimento das categorias: espaço, paisagem e território.', 'https://www.youtube.com/watch?v=9E8ajFP0Iq0', 'aula', '2026-10-14 13:38:52', 106, NULL),
(155, '[1º Ano] Geografia - Cartografia e Fuso Horário', 'Leitura de mapas e coordenadas geográficas.', 'https://www.youtube.com/watch?v=nrzFMOq1k-w', 'aula', '2026-10-14 13:38:52', 106, NULL),
(156, '[1º Ano] Geografia - Geomorfologia e Relevo Terrestre', 'Agentes internos e externos formadores do relevo da Terra.', 'https://www.youtube.com/live/YvH0XoPyANA', 'aula', '2026-10-14 13:38:52', 106, NULL),
(157, '[1º Ano] Inglês - Estratégias de Leitura e Interpretação de Textos', 'Dicas para interpretação rápida em vestibulares.', 'https://www.youtube.com/watch?v=F5GGs1Rpt7I', 'aula', '2026-10-14 13:38:52', 107, NULL),
(158, '[1º Ano] Inglês - Simple Present e Simple Past', 'Revisão dos tempos verbais fundamentais.', 'https://www.youtube.com/watch?v=LxuTxkHAXeQ', 'aula', '2026-10-14 13:38:52', 107, NULL),
(159, '[1º Ano] Inglês - Falsos Cognatos (False Friends)', 'Palavras parecidas em inglês e português que mudam o sentido.', 'https://www.youtube.com/watch?v=8v_w8itTslc', 'aula', '2026-10-14 13:38:52', 107, NULL),
(160, '[1º Ano] Sociologia - O que é Sociologia e o Olhar Sociológico', 'A origem da Sociologia no contexto da Revolução Industrial.', 'https://www.youtube.com/watch?v=u0C3F1Fq32E', 'aula', '2026-10-14 13:38:52', 108, NULL),
(161, '[1º Ano] Sociologia - Socialização e Instituições Sociais', 'O papel da família, escola e estado.', 'https://www.youtube.com/live/u4ZREcGwkF4', 'aula', '2026-10-14 13:38:52', 108, NULL),
(162, '[1º Ano] Sociologia - Cultura e Etnocentrismo', 'Diversidade cultural e relativismo cultural.', 'https://www.youtube.com/live/oxApmqaXlsM', 'aula', '2026-10-14 13:38:52', 108, NULL),
(163, '[1º Ano] Filosofia - Origem da Filosofia e o Mito ao Logos', 'O surgimento da racionalidade grega na polis.', 'https://www.youtube.com/watch?v=UK6OKSsastQ', 'aula', '2026-10-14 13:38:52', 109, NULL),
(164, '[1º Ano] Filosofia - Filosofia Pré-Socrática', 'A busca pela arché com Tales, Heráclito e Parmênides.', 'https://www.youtube.com/watch?v=Y9_UovLgduo', 'aula', '2026-10-14 13:38:52', 109, NULL),
(165, '[1º Ano] Filosofia - Sócrates e os Sofistas', 'O método socrático frente ao relativismo dos sofistas.', 'https://www.youtube.com/live/ZmKPQuJAq3s', 'aula', '2026-10-14 13:38:52', 109, NULL),
(166, '[1º Ano] Redação - Estrutura da Dissertação-Argumentativa', 'Introdução, desenvolvimento e conclusão no modelo ENEM.', 'https://www.youtube.com/watch?v=VRQtqA3Fbeo', 'aula', '2026-10-14 13:38:52', 110, NULL),
(167, '[1º Ano] Redação - Como Construir uma Boa Tese', 'Apresentação do ponto de vista no primeiro parágrafo.', 'https://www.youtube.com/watch?v=MeKHJVPNV30', 'aula', '2026-10-14 13:38:52', 110, NULL),
(168, '[1º Ano] Redação - Coesão e Coerência Textual', 'Uso adequado de conectivos textuais.', 'https://www.youtube.com/watch?v=TuBKsV3lSQc', 'aula', '2026-10-14 13:38:52', 110, NULL),

-- 2º ANO (Ensino Médio)
(169, '[2º Ano] Matemática - Trigonometria no Triângulo Retângulo', 'Seno, cosseno e tangente aplicados.', 'https://www.youtube.com/watch?v=MSZdhDBoXe0', 'aula', '2026-10-14 13:38:52', 111, NULL),
(170, '[2º Ano] Matemática - Geometria Plana: Áreas e Perímetros', 'Cálculo de áreas de polígonos e círculos.', 'https://www.youtube.com/watch?v=ddZHkCUcYRM', 'aula', '2026-10-14 13:38:52', 111, NULL),
(171, '[2º Ano] Matemática - Matrizes e Determinantes', 'Operações fundamentais com matrizes.', 'https://www.youtube.com/watch?v=0HXlohthSoY', 'aula', '2026-10-14 13:38:52', 111, NULL),
(172, '[2º Ano] Português - Sintaxe: Sujeito e Predicado', 'A estrutura da oração e termos essenciais.', 'https://www.youtube.com/watch?v=LMaE0gAsI04', 'aula', '2026-10-14 13:38:52', 112, NULL),
(173, '[2º Ano] Português - Barroco e Arcadismo', 'Movimentos literários coloniais e suas características.', 'https://www.youtube.com/watch?v=X61lboe5_pM', 'aula', '2026-10-14 13:38:52', 112, NULL),
(174, '[2º Ano] Português - Romantismo: Poesia e Prosa', 'As gerações românticas no Brasil.', 'https://www.youtube.com/watch?v=XsN0e_xPyNI', 'aula', '2026-10-14 13:38:52', 112, NULL),
(175, '[2º Ano] História - Mercantilismo e Expansão Marítima', 'Análise das grandes navegações europeias.', 'https://www.youtube.com/watch?v=6kytaR8VhBY', 'aula', '2026-10-14 13:38:52', 113, NULL),
(176, '[2º Ano] História - Colonização da América Portuguesa', 'A estrutura do Brasil Colônia e economia açucareira.', 'https://www.youtube.com/watch?v=MfahAxGnSQo', 'aula', '2026-10-14 13:38:52', 113, NULL),
(177, '[2º Ano] História - Independência dos EUA e Iluminismo', 'As bases filosóficas e o processo de independência americana.', 'https://www.youtube.com/watch?v=AGKX8fGF-D8', 'aula', '2026-10-14 13:38:52', 113, NULL),
(178, '[2º Ano] Química - Soluções e Concentrações Químicas', 'Molaridade, títulos e diluição de soluções.', 'https://www.youtube.com/watch?v=7kluWpnlVPU', 'aula', '2026-10-14 13:38:52', 114, NULL),
(179, '[2º Ano] Química - Termoquímica', 'Cálculo de variação de entalpia nas reações.', 'https://www.youtube.com/live/7Ad9IHTXmw0', 'aula', '2026-10-14 13:38:52', 114, NULL),
(180, '[2º Ano] Química - Cinética e Equilíbrio Químico', 'Velocidade das reações e constante de equilíbrio.', 'https://www.youtube.com/live/qfBCDMX3Yy4', 'aula', '2026-10-14 13:38:52', 114, NULL),
(181, '[2º Ano] Biologia - Reinos dos Seres Vivos e Vírus', 'Classificação biológica e vírus.', 'https://www.youtube.com/watch?v=bMwEgGaB1ZQ', 'aula', '2026-10-14 13:38:52', 115, NULL),
(182, '[2º Ano] Biologia - Introdução à Botânica e Plantas', 'Anatomia e grupos vegetais.', 'https://www.youtube.com/watch?v=6H_8eFmx-g0', 'aula', '2026-10-14 13:38:52', 115, NULL),
(183, '[2º Ano] Biologia - Zoologia dos Invertebrados e Vertebrados', 'Características gerais dos filos animais.', 'https://www.youtube.com/watch?v=Ijb2CVy_-y0', 'aula', '2026-10-14 13:38:52', 115, NULL),
(184, '[2º Ano] Física - Termologia e Calorimetria', 'Escalas termométricas e trocas de calor.', 'https://www.youtube.com/watch?v=5eid5-U3Dvw', 'aula', '2026-10-14 13:38:52', 116, NULL),
(185, '[2º Ano] Física - Óptica Geométrica e Espelhos', 'Reflexão da luz e espelhos planos/esféricos.', 'https://www.youtube.com/watch?v=hxciSW_B8Hw', 'aula', '2026-10-14 13:38:52', 116, NULL),
(186, '[2º Ano] Física - Ondulatória', 'Características das ondas e fenômenos ondulatórios.', 'https://www.youtube.com/watch?v=Sj3sCRwMc0Q', 'aula', '2026-10-14 13:38:52', 116, NULL),
(187, '[2º Ano] Geografia - Demografia e Dinâmica Populacional', 'Crescimento vegetativo e pirâmides etárias.', 'https://www.youtube.com/watch?v=9E8ajFP0Iq0', 'aula', '2026-10-14 13:38:52', 117, NULL),
(188, '[2º Ano] Geografia - Processo de Urbanização', 'A formação das metrópoles e problemas urbanos.', 'https://www.youtube.com/watch?v=nrzFMOq1k-w', 'aula', '2026-10-14 13:38:52', 117, NULL),
(189, '[2º Ano] Geografia - Espaço Agrário e Agronegócio', 'Estrutura fundiária e modernização do campo.', 'https://www.youtube.com/live/YvH0XoPyANA', 'aula', '2026-10-14 13:38:52', 117, NULL),
(190, '[2º Ano] Inglês - Future Tenses (Futuro em Inglês)', 'Uso de will, going to e present continuous para o futuro.', 'https://www.youtube.com/watch?v=F5GGs1Rpt7I', 'aula', '2026-10-14 13:38:52', 118, NULL),
(191, '[2º Ano] Inglês - Passive Voice (Voz Passiva)', 'Como transformar orações da voz ativa para a passiva.', 'https://www.youtube.com/watch?v=LxuTxkHAXeQ', 'aula', '2026-10-14 13:38:52', 118, NULL),
(192, '[2º Ano] Inglês - Relative Pronouns (Pronomes Relativos)', 'Uso de who, which, that, whose.', 'https://www.youtube.com/watch?v=8v_w8itTslc', 'aula', '2026-10-14 13:38:52', 118, NULL),
(193, '[2º Ano] Sociologia - Émile Durkheim e o Fato Social', 'Conceito de fato social e coesão social.', 'https://www.youtube.com/watch?v=u0C3F1Fq32E', 'aula', '2026-10-14 13:38:52', 119, NULL),
(194, '[2º Ano] Sociologia - Karl Marx e a Luta de Classes', 'Materialismo histórico e mais-valia.', 'https://www.youtube.com/live/u4ZREcGwkF4', 'aula', '2026-10-14 13:38:52', 119, NULL),
(195, '[2º Ano] Sociologia - Max Weber e a Ação Social', 'Tipos de dominação e ação social.', 'https://www.youtube.com/live/oxApmqaXlsM', 'aula', '2026-10-14 13:38:52', 119, NULL),
(196, '[2º Ano] Filosofia - Platão e o Mito da Caverna', 'A teoria das ideias e o dualismo platônico.', 'https://www.youtube.com/watch?v=UK6OKSsastQ', 'aula', '2026-10-14 13:38:52', 120, NULL),
(197, '[2º Ano] Filosofia - Aristóteles e a Ética', 'A virtude como justa medida.', 'https://www.youtube.com/watch?v=Y9_UovLgduo', 'aula', '2026-10-14 13:38:52', 120, NULL),
(198, '[2º Ano] Filosofia Medieval - Patrística e Escolástica', 'A relação entre fé e razão.', 'https://www.youtube.com/live/ZmKPQuJAq3s', 'aula', '2026-10-14 13:38:52', 120, NULL),
(199, '[2º Ano] Redação - Tipos de Argumento e Projeto de Texto', 'Argumentos de autoridade e alusão histórica.', 'https://www.youtube.com/watch?v=VRQtqA3Fbeo', 'aula', '2026-10-14 13:38:52', 121, NULL),
(200, '[2º Ano] Redação - Uso de Repertório Sociocultural', 'Como inserir filósofos, filmes e dados no texto.', 'https://www.youtube.com/watch?v=MeKHJVPNV30', 'aula', '2026-10-14 13:38:52', 121, NULL),
(201, '[2º Ano] Redação - Evitando Marcas de Oralidade', 'Aprimoramento do vocabulário formal.', 'https://www.youtube.com/watch?v=TuBKsV3lSQc', 'aula', '2026-10-14 13:38:52', 121, NULL),

-- 3º ANO (Ensino Médio)
(202, '[3º Ano] Matemática - Geometria Espacial (Sólidos)', 'Cálculo de volume e área de prismas e cilindros.', 'https://www.youtube.com/watch?v=MSZdhDBoXe0', 'aula', '2026-10-14 13:38:52', 23, NULL),
(203, '[3º Ano] Matemática - Análise Combinatória e Probabilidade', 'Arranjo, combinação e cálculo de probabilidades.', 'https://www.youtube.com/watch?v=ddZHkCUcYRM', 'aula', '2026-10-14 13:38:52', 23, NULL),
(204, '[3º Ano] Matemática - Estatística Básica', 'Média, mediana, moda e desvio padrão.', 'https://www.youtube.com/watch?v=0HXlohthSoY', 'aula', '2026-10-14 13:38:52', 23, NULL),
(205, '[3º Ano] Português - Realismo e Parnasianismo', 'A literatura crítica de Machado de Assis e o rigor formal.', 'https://www.youtube.com/watch?v=LMaE0gAsI04', 'aula', '2026-10-14 13:38:52', 24, NULL),
(206, '[3º Ano] Português - Modernismo no Brasil', 'As fases do Modernismo brasileiro e suas características.', 'https://www.youtube.com/watch?v=X61lboe5_pM', 'aula', '2026-10-14 13:38:52', 24, NULL),
(207, '[3º Ano] Português - Concordância e Regência', 'Regras avançadas cobradas no ENEM e vestibulares.', 'https://www.youtube.com/watch?v=XsN0e_xPyNI', 'aula', '2026-10-14 13:38:52', 24, NULL),
(208, '[3º Ano] História - Brasil Império no Século XIX', 'Primeiro Reinado, Período Regencial e Segundo Reinado.', 'https://www.youtube.com/watch?v=6wA_1C8hg-M', 'aula', '2026-10-14 13:38:52', 25, NULL),
(209, '[3º Ano] História - Proclamação da República e Era Vargas', 'República Oligárquica e Era Vargas (1930-1945).', 'https://www.youtube.com/watch?v=AGKX8fGF-D8', 'aula', '2026-10-14 13:38:52', 25, NULL),
(210, '[3º Ano] História - Guerra Fria e Redemocratização', 'O cenário geopolítico mundial e o Brasil contemporâneo.', 'https://www.youtube.com/watch?v=jAMnrrqGYcw', 'aula', '2026-10-14 13:38:52', 25, NULL),
(211, '[3º Ano] Química - Introdução à Química Orgânica', 'Cadeias carbônicas e nomenclatura IUPAC.', 'https://www.youtube.com/watch?v=7kluWpnlVPU', 'aula', '2026-10-14 13:38:52', 26, NULL),
(212, '[3º Ano] Química - Funções Orgânicas', 'Álcoois, cetonas, ésteres e ácidos carboxílicos.', 'https://www.youtube.com/live/7Ad9IHTXmw0', 'aula', '2026-10-14 13:38:52', 26, NULL),
(213, '[3º Ano] Química - Isomeria e Reações Orgânicas', 'Tipos de isomeria plana e espacial.', 'https://www.youtube.com/live/qfBCDMX3Yy4', 'aula', '2026-10-14 13:38:52', 26, NULL),
(214, '[3º Ano] Biologia - Leis de Mendel e Genética', 'Herança genética, cruzamentos e heredogramas.', 'https://www.youtube.com/watch?v=bMwEgGaB1ZQ', 'aula', '2026-10-14 13:38:52', 27, NULL),
(215, '[3º Ano] Biologia - Evolução e Seleção Natural', 'Darwinismo e neodarwinismo na evolução das espécies.', 'https://www.youtube.com/watch?v=6H_8eFmx-g0', 'aula', '2026-10-14 13:38:52', 27, NULL),
(216, '[3º Ano] Biologia - Ecologia e Biomas', 'Relações ecológicas e fluxo de energia.', 'https://www.youtube.com/watch?v=Ijb2CVy_-y0', 'aula', '2026-10-14 13:38:52', 27, NULL),
(217, '[3º Ano] Física - Eletrostática e Lei de Coulomb', 'Processos de eletrização e campo elétrico.', 'https://www.youtube.com/watch?v=5eid5-U3Dvw', 'aula', '2026-10-14 13:38:52', 28, NULL),
(218, '[3º Ano] Física - Eletrodinâmica e Circuitos', 'Leis de Ohm e potência em circuitos elétricos.', 'https://www.youtube.com/watch?v=hxciSW_B8Hw', 'aula', '2026-10-14 13:38:52', 28, NULL),
(219, '[3º Ano] Física - Eletromagnetismo', 'Campo magnético e indução eletromagnética.', 'https://www.youtube.com/watch?v=Sj3sCRwMc0Q', 'aula', '2026-10-14 13:38:52', 28, NULL),
(220, '[3º Ano] Geografia - Globalização e Blocos Econômicos', 'A integração econômica mundial e divisão do trabalho.', 'https://www.youtube.com/watch?v=9E8ajFP0Iq0', 'aula', '2026-10-14 13:38:52', 29, NULL),
(221, '[3º Ano] Geografia - Fontes de Energia e Meio Ambiente', 'Matriz energética e impactos ambientais globais.', 'https://www.youtube.com/watch?v=nrzFMOq1k-w', 'aula', '2026-10-14 13:38:52', 29, NULL),
(222, '[3º Ano] Geografia - Geopolítica Mundial Contemporânea', 'Conflitos internacionais e multipolaridade.', 'https://www.youtube.com/live/YvH0XoPyANA', 'aula', '2026-10-14 13:38:52', 29, NULL),
(223, '[3º Ano] Inglês - Reported Speech (Discurso Indireto)', 'Como relatar o que outra pessoa disse em inglês.', 'https://www.youtube.com/watch?v=F5GGs1Rpt7I', 'aula', '2026-10-14 13:38:52', 30, NULL),
(224, '[3º Ano] Inglês - Conditionals (First, Second, Third)', 'Frases condicionais e hipóteses.', 'https://www.youtube.com/watch?v=LxuTxkHAXeQ', 'aula', '2026-10-14 13:38:52', 30, NULL),
(225, '[3º Ano] Inglês - Connectors and Linking Words', 'Conectivos avançados para coesão textual em inglês.', 'https://www.youtube.com/watch?v=8v_w8itTslc', 'aula', '2026-10-14 13:38:52', 30, NULL),
(226, '[3º Ano] Sociologia - Estado, Poder e Cidadania', 'Relações de poder e direitos civis/políticos.', 'https://www.youtube.com/watch?v=u0C3F1Fq32E', 'aula', '2026-10-14 13:38:52', 31, NULL),
(227, '[3º Ano] Sociologia - Movimentos Sociais', 'A importância dos movimentos na transformação da sociedade.', 'https://www.youtube.com/live/u4ZREcGwkF4', 'aula', '2026-10-14 13:38:52', 31, NULL),
(228, '[3º Ano] Sociologia - Desigualdade Social e Racismo Estrutural', 'Análise das disparidades sociais no Brasil.', 'https://www.youtube.com/live/oxApmqaXlsM', 'aula', '2026-10-14 13:38:52', 31, NULL),
(229, '[3º Ano] Filosofia Política - Maquiavel e Contratualistas', 'Realismo político de Maquiavel, Hobbes, Locke e Rousseau.', 'https://www.youtube.com/watch?v=UK6OKSsastQ', 'aula', '2026-10-14 13:38:52', 32, NULL),
(230, '[3º Ano] Filosofia - Racionalismo e Empirismo', 'Descartes e Hume na teoria do conhecimento.', 'https://www.youtube.com/watch?v=Y9_UovLgduo', 'aula', '2026-10-14 13:38:52', 32, NULL),
(231, '[3º Ano] Filosofia - Escola de Frankfurt', 'A crítica à indústria cultural no século XX.', 'https://www.youtube.com/live/ZmKPQuJAq3s', 'aula', '2026-10-14 13:38:52', 32, NULL),
(232, '[3º Ano] Redação - Proposta de Intervenção (5 Elementos)', 'Agente, Ação, Meio/Modo, Efeito e Detalhamento no ENEM.', 'https://www.youtube.com/watch?v=VRQtqA3Fbeo', 'aula', '2026-10-14 13:38:52', 33, NULL),
(233, '[3º Ano] Redação - Análise de Redações Nota 1000', 'Desconstrução de redações nota máxima.', 'https://www.youtube.com/watch?v=MeKHJVPNV30', 'aula', '2026-10-14 13:38:52', 33, NULL),
(234, '[3º Ano] Redação - Checkup Final e Gerenciamento de Tempo', 'Estratégias de rascunho e controle de tempo de prova.', 'https://www.youtube.com/watch?v=TuBKsV3lSQc', 'aula', '2026-10-14 13:38:52', 33, NULL),

-- VESTIBULAR / ENEM
(235, '[Vestibular] Matemática - Revisão de Porcentagem e Razão/Proporção', 'Resolução de questões clássicas de matemática financeira e escala.', 'https://www.youtube.com/watch?v=MSZdhDBoXe0', 'aula', '2026-11-10 20:00:00', 34, NULL),
(236, '[Vestibular] Matemática - Análise de Gráficos e Tabelas no ENEM', 'Interpretação de dados estatísticos em provas de vestibulares.', 'https://www.youtube.com/watch?v=ddZHkCUcYRM', 'aula', '2026-11-10 20:00:00', 34, NULL),
(237, '[Vestibular] Matemática - Geometria de Alta Frequência no ENEM', 'Resolução prática de questões de geometria plana e espacial.', 'https://www.youtube.com/watch?v=0HXlohthSoY', 'aula', '2026-11-10 20:00:00', 34, NULL),
(238, '[Vestibular] Português - Interpretação de Texto e Variantes Linguísticas', 'Análise de gêneros textuais e preconceito linguístico.', 'https://www.youtube.com/watch?v=LMaE0gAsI04', 'aula', '2026-11-10 20:00:00', 35, NULL),
(239, '[Vestibular] Português - Figuras de Linguagem mais Cobradas', 'Identificação rápida de metáforas, metonímias e ironias nas questões.', 'https://www.youtube.com/watch?v=X61lboe5_pM', 'aula', '2026-11-10 20:00:00', 35, NULL),
(240, '[Vestibular] Português - Escolas Literárias no Vestibular', 'Quadro comparativo de estilos de época e autores recorrentes.', 'https://www.youtube.com/watch?v=XsN0e_xPyNI', 'aula', '2026-11-10 20:00:00', 35, NULL),
(241, '[Vestibular] História - História do Brasil: O que mais cai no ENEM', 'Revisão intensiva de Vargas, Ditadura Militar e República Velha.', 'https://www.youtube.com/watch?v=6wA_1C8hg-M', 'aula', '2026-11-10 20:00:00', 36, NULL),
(242, '[Vestibular] História - História Geral no Vestibular', 'Foco em Revolução Industrial, Guerras Mundiais e Iluminismo.', 'https://www.youtube.com/watch?v=AGKX8fGF-D8', 'aula', '2026-11-10 20:00:00', 36, NULL),
(243, '[Vestibular] História - Questões Comentadas de História', 'Estratégia de resolução e eliminação de alternativas incorretas.', 'https://www.youtube.com/watch?v=jAMnrrqGYcw', 'aula', '2026-11-10 20:00:00', 36, NULL),
(244, '[Vestibular] Química - Estequiometria sem Mistérios', 'Cálculos estequiométricos passo a passo focados no ENEM.', 'https://www.youtube.com/watch?v=7kluWpnlVPU', 'aula', '2026-11-10 20:00:00', 37, NULL),
(245, '[Vestibular] Química - Química Ambiental no Vestibular', 'Efeito estufa, chuva ácida, lixo e tratamento de água.', 'https://www.youtube.com/live/7Ad9IHTXmw0', 'aula', '2026-11-10 20:00:00', 37, NULL),
(246, '[Vestibular] Química - Funções e Reações Orgânicas Relevantes', 'Revisão rápida dos grupos funcionais e reações frequentes.', 'https://www.youtube.com/live/qfBCDMX3Yy4', 'aula', '2026-11-10 20:00:00', 37, NULL),
(247, '[Vestibular] Biologia - Ecologia e Impactos Ambientais no ENEM', 'O tema número 1 em biologia: biomas, teias e preservação.', 'https://www.youtube.com/watch?v=bMwEgGaB1ZQ', 'aula', '2026-11-10 20:00:00', 38, NULL),
(248, '[Vestibular] Biologia - Citologia e Genética Intensiva', 'Mapeamento de questões sobre DNA, organelas e heredogramas.', 'https://www.youtube.com/watch?v=6H_8eFmx-g0', 'aula', '2026-11-10 20:00:00', 38, NULL),
(249, '[Vestibular] Biologia - Biotecnologia e Imunologia', 'Vacinas, soros, pcr e transgênicos nas provas atuais.', 'https://www.youtube.com/watch?v=Ijb2CVy_-y0', 'aula', '2026-11-10 20:00:00', 38, NULL),
(250, '[Vestibular] Física - Eletrodinâmica: O Assunto mais Cobrado', 'Consumo de energia, circuitos e disjuntores no ENEM.', 'https://www.youtube.com/watch?v=5eid5-U3Dvw', 'aula', '2026-11-10 20:00:00', 39, NULL),
(251, '[Vestibular] Física - Ondulatória e Fenômenos Físicos', 'Resolução de questões sobre acústica, refração e difração.', 'https://www.youtube.com/watch?v=hxciSW_B8Hw', 'aula', '2026-11-10 20:00:00', 39, NULL),
(252, '[Vestibular] Física - Mecânica e Conservação de Energia', 'Trabalho, energia potencial, cinética e leis de Newton.', 'https://www.youtube.com/watch?v=Sj3sCRwMc0Q', 'aula', '2026-11-10 20:00:00', 39, NULL),
(253, '[Vestibular] Geografia - Geografia do Brasil: Questões Agrárias e Urbanas', 'Uso da terra, agronegócio e mobilidade urbana.', 'https://www.youtube.com/watch?v=9E8ajFP0Iq0', 'aula', '2026-11-10 20:00:00', 40, NULL),
(254, '[Vestibular] Geografia - Climatologia e Impactos Ambientais Globalizados', 'Fenômenos climáticos e acordos globais de meio ambiente.', 'https://www.youtube.com/watch?v=nrzFMOq1k-w', 'aula', '2026-11-10 20:00:00', 40, NULL),
(255, '[Vestibular] Geografia - Geopolítica Contemporânea para Vestibulares', 'Análise de conflitos globais recentes e rotas comerciais.', 'https://www.youtube.com/live/YvH0XoPyANA', 'aula', '2026-11-10 20:00:00', 40, NULL),
(256, '[Vestibular] Inglês - Estratégias de Skimming e Scanning', 'Técnicas de leitura dinâmica para responder questões em minutos.', 'https://www.youtube.com/watch?v=F5GGs1Rpt7I', 'aula', '2026-11-10 20:00:00', 41, NULL),
(257, '[Vestibular] Inglês - Resolução de Questões ENEM Anteriores', 'Análise de enunciados e pegadinhas recorrentes.', 'https://www.youtube.com/watch?v=LxuTxkHAXeQ', 'aula', '2026-11-10 20:00:00', 41, NULL),
(258, '[Vestibular] Inglês - Conectivos e Vocabulário de Prova', 'Palavras de transição fundamentais para entender textos acadêmicos.', 'https://www.youtube.com/watch?v=8v_w8itTslc', 'aula', '2026-11-10 20:00:00', 41, NULL),
(259, '[Vestibular] Sociologia - Pensadores Clássicos no Vestibular', 'Comparativo rápido entre Durkheim, Marx e Weber.', 'https://www.youtube.com/watch?v=u0C3F1Fq32E', 'aula', '2026-11-10 20:00:00', 42, NULL),
(260, '[Vestibular] Sociologia - Direitos, Cidadania e Movimentos Sociais', 'Evolução dos direitos humanos e conceitos de minoria.', 'https://www.youtube.com/live/u4ZREcGwkF4', 'aula', '2026-11-10 20:00:00', 42, NULL),
(261, '[Vestibular] Sociologia - Cultura de Massa e Mídia', 'A influência dos meios de comunicação na sociedade moderna.', 'https://www.youtube.com/live/oxApmqaXlsM', 'aula', '2026-11-10 20:00:00', 42, NULL),
(262, '[Vestibular] Filosofia - Filosofia Política nas Provas', 'Maquiavel, Hobbes, Locke, Rousseau e Hannah Arendt.', 'https://www.youtube.com/watch?v=UK6OKSsastQ', 'aula', '2026-11-10 20:00:00', 43, NULL),
(263, '[Vestibular] Filosofia - Ética e Epistemologia', 'Conceitos éticos clássicos e teoria do conhecimento.', 'https://www.youtube.com/watch?v=Y9_UovLgduo', 'aula', '2026-11-10 20:00:00', 43, NULL),
(264, '[Vestibular] Filosofia - Filósofos da Modernidade e Pós-Modernidade', 'Nietzsche, Kant e Foucault no ENEM.', 'https://www.youtube.com/live/ZmKPQuJAq3s', 'aula', '2026-11-10 20:00:00', 43, NULL),
(265, '[Vestibular] Redação - Projeto de Texto para Nota 1000', 'Passo a passo para estruturar a redação antes de escrever.', 'https://www.youtube.com/watch?v=VRQtqA3Fbeo', 'aula', '2026-11-10 20:00:00', 44, NULL),
(266, '[Vestibular] Redação - Repertórios Coringa para Qualquer Tema', 'Alusões históricas e filosóficas universais aplicáveis na prova.', 'https://www.youtube.com/watch?v=MeKHJVPNV30', 'aula', '2026-11-10 20:00:00', 44, NULL),
(267, '[Vestibular] Redação - Como Garantir 200 Pontos na Proposta de Intervenção', 'Checklist prático dos 5 elementos obrigatórios da proposta.', 'https://www.youtube.com/watch?v=TuBKsV3lSQc', 'aula', '2026-11-10 20:00:00', 44, NULL);
-- Estrutura para tabela `conteudo_categoria`
--

CREATE TABLE `conteudo_categoria` (
  `id_conteudo` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `conteudo_categoria`
--

INSERT INTO `conteudo_categoria` (`id_conteudo`, `id_categoria`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `materias`
--

CREATE TABLE `materias` (
  `id_materia` int(11) NOT NULL,
  `id_ano` int(11) NOT NULL,
  `materia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `materias`
--

INSERT INTO `materias` (`id_materia`, `id_ano`, `materia`) VALUES
-- 1º Ano
(1, 1, 'Matemática'),
(2, 1, 'Português'),
(3, 1, 'História'),
(4, 1, 'Química'),
(5, 1, 'Biologia'),
(6, 1, 'Física'),
(7, 1, 'Geografia'),
(8, 1, 'Inglês'),
(9, 1, 'Sociologia'),
(10, 1, 'Filosofia'),
(11, 1, 'Redação'),
-- 2º Ano
(12, 2, 'Matemática'),
(13, 2, 'Português'),
(14, 2, 'História'),
(15, 2, 'Química'),
(16, 2, 'Biologia'),
(17, 2, 'Física'),
(18, 2, 'Geografia'),
(19, 2, 'Inglês'),
(20, 2, 'Sociologia'),
(21, 2, 'Filosofia'),
(22, 2, 'Redação'),
-- 3º Ano
(23, 3, 'Matemática'),
(24, 3, 'Português'),
(25, 3, 'História'),
(26, 3, 'Química'),
(27, 3, 'Biologia'),
(28, 3, 'Física'),
(29, 3, 'Geografia'),
(30, 3, 'Inglês'),
(31, 3, 'Sociologia'),
(32, 3, 'Filosofia'),
(33, 3, 'Redação'),
-- Vestibular / ENEM
(34, 4, 'Matemática'),
(35, 4, 'Português'),
(36, 4, 'História'),
(37, 4, 'Química'),
(38, 4, 'Biologia'),
(39, 4, 'Física'),
(40, 4, 'Geografia'),
(41, 4, 'Inglês'),
(42, 4, 'Sociologia'),
(43, 4, 'Filosofia'),
(44, 4, 'Redação');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pessoas`
--

CREATE TABLE `pessoas` (
  `id_pessoa` int(11) NOT NULL,
  `id_ano` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `email` varchar(150) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `criado_em` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pessoas`
--

INSERT INTO `pessoas` (`id_pessoa`, `id_ano`, `nome`, `usuario`, `email`, `senha`, `criado_em`) VALUES
(9, 3, 'salve', 'pfv', 'devdd@gmail.com', '$2y$10$IoWUuo1f4BeAtDAPDugCQuUVLiDTYhUsGdc4WqsdJJKcLQYzZMNDy', '2026-10-17 22:40:24'),
(10, 3, 'bia', 'bia1', 'bia1@gmail.com', '$2y$10$lxP4MDGy/bS4/GeLwKFH5OeGHo2X06uu3cHJCsLU1hYk7j5qC/Uke', '2026-10-17 22:43:05'),
(11, 1, 'beatriz', 'ola', 'ola@gmail.com', '$2y$10$il9a7c4zK4BKsHr5SADWuO/arVl13yo1VK.xk7z/Hm1d7lh1Obaty', '2026-10-18 17:17:35'),
(12, 3, 'Estela', 'estelaxs', 'estelamaria.a9@gmail.com', '$2y$10$UTXprhoMbiQ2gRP4gmsG7uIPqsLDx7eNKjAk0tQ8QYvTg8Slu8ipa', '2026-10-27 08:37:14'),
(13, 2, 'Estela', 'batatinha', 'estelinha@gmail.com', '$2y$10$5Yj1MfHuQTHLNYITiznEle67jdxNl5outwf5sIg.LCA5idY2utNO.', '2026-11-03 20:01:30'),
(14, 3, 'Estela Maria Alves d', 'estelar', 'mariazinha.90@gmail.com', '$2y$10$O6qQ5apdY9W3hFtWnxABVeETovfnX9ZvJGTCJRkScz9gd0oXOwnf.', '2026-11-03 22:16:44'),
(16, 2, 'Estela Maria Alves de Souza', 'estelarr', 'estelamaria.a89@gmail.com', '$2y$10$mgt9lUfGOiGBTpur90mqHu6vPHWZWLuoFjNZl.W36MpTVo3y6lrta', '2026-11-04 21:27:42'),
(17, 1, 'Batata', 'batatinhaa', 'mariazonaa@gmail.com', '$2y$10$kDSVHL4.8WHv078ThDDiKOQ98FOcVDtaSGsTZGmfv5FxN./0zzODy', '2026-11-04 21:37:27'),
(18, 2, 'Polenta da silva', 'polentinha', 'estelao.89@gmail.com', '$2y$10$QJMIrAcq1wSLEDXg8CdrMe3C7DcBJ90PIEhwr3HxOZtaMkYpajLY.', '2026-11-04 21:43:27');

-- --------------------------------------------------------

--
-- Estrutura para tabela `planejamento`
--

CREATE TABLE `planejamento` (
  `id_planejamento` int(11) NOT NULL,
  `id_pessoa` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `data_tarefa` date NOT NULL,
  `concluida` tinyint(1) NOT NULL DEFAULT 0,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `planejamento`
--

INSERT INTO `planejamento` (`id_planejamento`, `id_pessoa`, `titulo`, `data_tarefa`, `concluida`, `criado_em`) VALUES
(1, 18, 'matematica', '2026-11-16', 1, '2026-11-05 01:14:34'),
(2, 18, 'prova da roseli', '2026-12-02', 0, '2026-11-05 01:15:04'),
(3, 18, 'feriado, estudar prova de proxima semana', '2026-11-20', 0, '2026-11-05 01:27:31'),
(4, 18, 'chorar no enem', '2026-11-15', 0, '2026-11-05 01:27:49'),
(5, 18, 'me matar no enem', '2026-11-08', 1, '2026-11-05 01:28:02');

-- --------------------------------------------------------

--
-- Estrutura para tabela `progresso`
--

CREATE TABLE `progresso` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_atividade` int(11) DEFAULT NULL,
  `acertou` tinyint(1) DEFAULT NULL,
  `data` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `resumos`
--

CREATE TABLE `resumos` (
  `id` int(11) NOT NULL,
  `id_pessoa` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `conteudo` text NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `resumos`
--

INSERT INTO `resumos` (`id`, `id_pessoa`, `id_materia`, `titulo`, `conteudo`, `criado_em`, `atualizado_em`) VALUES
(1, 10, 23, 'vai funcionar', 'sera', '2026-10-18 23:29:20', '2026-10-18 23:29:20'),
(2, 10, 23, 'ué', 'funcionou?', '2026-10-18 23:38:24', '2026-10-18 23:38:24'),
(5, 12, 31, 'eliana', 'fdrtvsvbcfgvbvuvgvdfcfgvggvfbmkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkcnftvbyhbcfgbvfrdbftbgff', '2026-10-27 11:37:57', '2026-10-27 11:38:17'),
(6, 14, 27, 'Suólen', 'genes sla oq\r\nhomozigoto sla oq\r\nmitose sla oq', '2026-11-05 00:12:10', '2026-11-05 00:13:45'),
(7, 18, 19, 'GCHGHGH', 'JHVHJK', '2026-11-05 01:33:08', '2026-11-05 01:33:08');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `alternativas`
--
ALTER TABLE `alternativas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_atividade` (`id_atividade`);

--
-- Índices de tabela `anos`
--
ALTER TABLE `anos`
  ADD PRIMARY KEY (`id_ano`);

--
-- Índices de tabela `atividades`
--
ALTER TABLE `atividades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_conteudo` (`id_materia`);

--
-- Índices de tabela `conteudos`
--
ALTER TABLE `conteudos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_conteudos_materias` (`id_materia`);

--
-- Índices de tabela `conteudo_categoria`
--
ALTER TABLE `conteudo_categoria`
  ADD PRIMARY KEY (`id_conteudo`,`id_categoria`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Índices de tabela `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id_materia`),
  ADD KEY `id_ano` (`id_ano`);

--
-- Índices de tabela `pessoas`
--
ALTER TABLE `pessoas`
  ADD PRIMARY KEY (`id_pessoa`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_ano` (`id_ano`);

--
-- Índices de tabela `planejamento`
--
ALTER TABLE `planejamento`
  ADD PRIMARY KEY (`id_planejamento`),
  ADD KEY `idx_pessoa_data` (`id_pessoa`,`data_tarefa`);

--
-- Índices de tabela `progresso`
--
ALTER TABLE `progresso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_atividade` (`id_atividade`);

--
-- Índices de tabela `resumos`
--
ALTER TABLE `resumos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pessoa` (`id_pessoa`),
  ADD KEY `id_materia` (`id_materia`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alternativas`
--
ALTER TABLE `alternativas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `anos`
--
ALTER TABLE `anos`
  MODIFY `id_ano` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `atividades`
--
ALTER TABLE `atividades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `conteudos`
--
ALTER TABLE `conteudos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT de tabela `materias`
--
ALTER TABLE `materias`
  MODIFY `id_materia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de tabela `pessoas`
--
ALTER TABLE `pessoas`
  MODIFY `id_pessoa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `planejamento`
--
ALTER TABLE `planejamento`
  MODIFY `id_planejamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `progresso`
--
ALTER TABLE `progresso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `resumos`
--
ALTER TABLE `resumos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `alternativas`
--
ALTER TABLE `alternativas`
  ADD CONSTRAINT `alternativas_ibfk_1` FOREIGN KEY (`id_atividade`) REFERENCES `atividades` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `conteudos`
--
ALTER TABLE `conteudos`
  ADD CONSTRAINT `fk_conteudos_materias` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`);

--
-- Restrições para tabelas `conteudo_categoria`
--
ALTER TABLE `conteudo_categoria`
  ADD CONSTRAINT `conteudo_categoria_ibfk_1` FOREIGN KEY (`id_conteudo`) REFERENCES `conteudos` (`id`),
  ADD CONSTRAINT `conteudo_categoria_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `materias` (`id_materia`);

--
-- Restrições para tabelas `materias`
--
ALTER TABLE `materias`
  ADD CONSTRAINT `materias_ibfk_1` FOREIGN KEY (`id_ano`) REFERENCES `anos` (`id_ano`);

--
-- Restrições para tabelas `pessoas`
--
ALTER TABLE `pessoas`
  ADD CONSTRAINT `pessoas_ibfk_1` FOREIGN KEY (`id_ano`) REFERENCES `anos` (`id_ano`);

--
-- Restrições para tabelas `planejamento`
--
ALTER TABLE `planejamento`
  ADD CONSTRAINT `fk_planejamento_pessoas` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoas` (`id_pessoa`) ON DELETE CASCADE;

--
-- Restrições para tabelas `progresso`
--
ALTER TABLE `progresso`
  ADD CONSTRAINT `progresso_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `pessoas` (`id_pessoa`) ON DELETE CASCADE,
  ADD CONSTRAINT `progresso_ibfk_2` FOREIGN KEY (`id_atividade`) REFERENCES `atividades` (`id`);

--
-- Restrições para tabelas `resumos`
--
ALTER TABLE `resumos`
  ADD CONSTRAINT `resumos_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoas` (`id_pessoa`) ON DELETE CASCADE,
  ADD CONSTRAINT `resumos_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
