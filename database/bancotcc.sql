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
  `nome_ano` varchar(255) NOT NULL,
  `etapa` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `anos`
--

INSERT INTO `anos` (`id_ano`, `nome_ano`, `etapa`) VALUES
(1, '1º ano do Ensino Médio', 'Ensino Médio'),
(2, '2º ano do Ensino Médio', 'Ensino Médio'),
(3, '3º ano do Ensino Médio', 'Ensino Médio'),
(4, 'Vestibular / ENEM', 'Vestibular'),
(5, '1º ano do Ensino Fundamental', 'Fundamental I'),
(6, '2º ano do Ensino Fundamental', 'Fundamental I'),
(7, '3º ano do Ensino Fundamental', 'Fundamental I'),
(8, '4º ano do Ensino Fundamental', 'Fundamental I'),
(9, '5º ano do Ensino Fundamental', 'Fundamental I'),
(10, '6º ano do Ensino Fundamental', 'Fundamental II'),
(11, '7º ano do Ensino Fundamental', 'Fundamental II'),
(12, '8º ano do Ensino Fundamental', 'Fundamental II'),
(13, '9º ano do Ensino Fundamental', 'Fundamental II');

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
(1, '[1º Ano Fund.] Matemática - Contagem e Números de 1 a 50', 'Introdução à contagem e reconhecimento numérico básico.', 'https://www.youtube.com/watch?v=F5GGs1Rpt7I', 'aula', '2026-11-10 21:00:00', 45, 'Este conteúdo apresenta contagem e números de 1 a 50. Introdução à contagem e reconhecimento numérico básico.

Objetivo da aula
Compreender os conceitos centrais de contagem e números de 1 a 50 e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(2, '[1º Ano Fund.] Matemática - Noções de Adição Simples', 'Juntando quantidades com pequenos objetos.', 'https://www.youtube.com/watch?v=LxuTxkHAXeQ', 'aula', '2026-11-10 21:00:00', 45, 'Este conteúdo apresenta noções de adição simples. Juntando quantidades com pequenos objetos.

Objetivo da aula
Compreender os conceitos centrais de noções de adição simples e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(3, '[1º Ano Fund.] Matemática - Formas Geométricas Básicas no Dia a Dia', 'Identificando círculos, quadrados e triângulos ao nosso redor.', 'https://www.youtube.com/watch?v=8v_w8itTslc', 'aula', '2026-11-10 21:00:00', 45, 'Este conteúdo apresenta formas geométricas básicas no dia a dia. Identificando círculos, quadrados e triângulos ao nosso redor.

Objetivo da aula
Compreender os conceitos centrais de formas geométricas básicas no dia a dia e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(4, '[1º Ano Fund.] Português - Alfabeto e Vogais', 'Reconhecimento das vogais e primeiras famílias silábicas.', 'https://www.youtube.com/watch?v=LMaE0gAsI04', 'aula', '2026-11-10 21:00:00', 46, 'Este conteúdo apresenta alfabeto e vogais. Reconhecimento das vogais e primeiras famílias silábicas.

Objetivo da aula
Compreender os conceitos centrais de alfabeto e vogais e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(5, '[1º Ano Fund.] Português - Formação de Palavras Simples', 'Juntando consoantes e vogais para formar as primeiras palavras.', 'https://www.youtube.com/watch?v=XsN0e_xPyNI', 'aula', '2026-11-10 21:00:00', 46, 'Este conteúdo apresenta formação de palavras simples. Juntando consoantes e vogais para formar as primeiras palavras.

Objetivo da aula
Compreender os conceitos centrais de formação de palavras simples e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(6, '[1º Ano Fund.] Português - Leitura de Imagens e Pequenas Histórias', 'Compreensão de narrativas visuais e contação de histórias.', 'https://www.youtube.com/watch?v=TuBKsV3lSQc', 'aula', '2026-11-10 21:00:00', 46, 'Este conteúdo apresenta leitura de imagens e pequenas histórias. Compreensão de narrativas visuais e contação de histórias.

Objetivo da aula
Compreender os conceitos centrais de leitura de imagens e pequenas histórias e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(7, '[1º Ano Fund.] História - Minha Família e Minha História', 'A importância da família e a linha do tempo pessoal.', 'https://www.youtube.com/watch?v=6iwkrRpb03A', 'aula', '2026-11-10 21:00:00', 47, 'Este conteúdo apresenta minha família e minha história. A importância da família e a linha do tempo pessoal.

Objetivo da aula
Compreender os conceitos centrais de minha família e minha história e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(8, '[1º Ano Fund.] História - A Rotina no Dia a Dia', 'Compreensão dos momentos do dia: manhã, tarde e noite.', 'https://www.youtube.com/watch?v=VOzIQK4m0k8', 'aula', '2026-11-10 21:00:00', 47, 'Este conteúdo apresenta a rotina no dia a dia. Compreensão dos momentos do dia: manhã, tarde e noite.

Objetivo da aula
Compreender os conceitos centrais de a rotina no dia a dia e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(9, '[1º Ano Fund.] História - Minha Escola e Meus Amigos', 'O ambiente escolar e a convivência em comunidade.', 'https://www.youtube.com/watch?v=jAMnrrqGYcw', 'aula', '2026-11-10 21:00:00', 47, 'Este conteúdo apresenta minha escola e meus amigos. O ambiente escolar e a convivência em comunidade.

Objetivo da aula
Compreender os conceitos centrais de minha escola e meus amigos e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(10, '[1º Ano Fund.] Geografia - A Casa e os Espaços de Vivência', 'Identificação dos cômodos da moradia e regras de convivência.', 'https://www.youtube.com/watch?v=9E8ajFP0Iq0', 'aula', '2026-11-10 21:00:00', 48, 'Este conteúdo apresenta a casa e os espaços de vivência. Identificação dos cômodos da moradia e regras de convivência.

Objetivo da aula
Compreender os conceitos centrais de a casa e os espaços de vivência e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(11, '[1º Ano Fund.] Geografia - O Caminho de Casa para a Escola', 'Noções espaciais básicas, pontos de referência e trajetos.', 'https://www.youtube.com/watch?v=nrzFMOq1k-w', 'aula', '2026-11-10 21:00:00', 48, 'Este conteúdo apresenta o caminho de casa para a escola. Noções espaciais básicas, pontos de referência e trajetos.

Objetivo da aula
Compreender os conceitos centrais de o caminho de casa para a escola e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(12, '[1º Ano Fund.] Geografia - Os Espaços Públicos e Privados', 'Diferença entre praças, ruas e ambientes particulares.', 'https://www.youtube.com/live/YvH0XoPyANA', 'aula', '2026-11-10 21:00:00', 48, 'Este conteúdo apresenta os espaços públicos e privados. Diferença entre praças, ruas e ambientes particulares.

Objetivo da aula
Compreender os conceitos centrais de os espaços públicos e privados e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(13, '[1º Ano Fund.] Ciências - O Corpo Humano e os Sentidos', 'Os cinco sentidos e os cuidados básicos com a higiene pessoal.', 'https://www.youtube.com/watch?v=bMwEgGaB1ZQ', 'aula', '2026-11-10 21:00:00', 49, 'Este conteúdo apresenta o corpo humano e os sentidos. Os cinco sentidos e os cuidados básicos com a higiene pessoal.

Objetivo da aula
Compreender os conceitos centrais de o corpo humano e os sentidos e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(14, '[1º Ano Fund.] Ciências - Os Animais e as Plantas ao Nosso Redor', 'Diferenciação básica entre seres vivos na natureza.', 'https://www.youtube.com/watch?v=6H_8eFmx-g0', 'aula', '2026-11-10 21:00:00', 49, 'Este conteúdo apresenta os animais e as plantas ao nosso redor. Diferenciação básica entre seres vivos na natureza.

Objetivo da aula
Compreender os conceitos centrais de os animais e as plantas ao nosso redor e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(15, '[1º Ano Fund.] Ciências - Hábitos de Higiene e Saúde', 'Importância de lavar as mãos, escovar os dentes e boa alimentação.', 'https://www.youtube.com/watch?v=Ijb2CVy_-y0', 'aula', '2026-11-10 21:00:00', 49, 'Este conteúdo apresenta hábitos de higiene e saúde. Importância de lavar as mãos, escovar os dentes e boa alimentação.

Objetivo da aula
Compreender os conceitos centrais de hábitos de higiene e saúde e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),

-- 2º ANO ENSINO FUNDAMENTAL (3 conteúdos por matéria)
(16, '[2º Ano Fund.] Matemática - Adição e Subtração com Reagrupamento', 'Operações fundamentais com dezenas e unidades.', 'https://www.youtube.com/watch?v=MSZdhDBoXe0', 'aula', '2026-11-10 21:00:00', 50, 'Este conteúdo apresenta adição e subtração com reagrupamento. Operações fundamentais com dezenas e unidades.

Objetivo da aula
Compreender os conceitos centrais de adição e subtração com reagrupamento e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(17, '[2º Ano Fund.] Matemática - Introdução à Tabuada e Dobro/Metade', 'Noções iniciais de multiplicação e divisão intuitiva.', 'https://www.youtube.com/watch?v=ddZHkCUcYRM', 'aula', '2026-11-10 21:00:00', 50, 'Este conteúdo apresenta introdução à tabuada e dobro/metade. Noções iniciais de multiplicação e divisão intuitiva.

Objetivo da aula
Compreender os conceitos centrais de introdução à tabuada e dobro/metade e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(18, '[2º Ano Fund.] Matemática - Medidas de Tempo (Calendário e Horas)', 'Dias da semana, meses do ano e leitura de relógios de ponteiro.', 'https://www.youtube.com/watch?v=0HXlohthSoY', 'aula', '2026-11-10 21:00:00', 50, 'Este conteúdo apresenta medidas de tempo (calendário e horas). Dias da semana, meses do ano e leitura de relógios de ponteiro.

Objetivo da aula
Compreender os conceitos centrais de medidas de tempo (calendário e horas) e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(19, '[2º Ano Fund.] Português - Sílabas Complexas e Famílias Silábicas', 'Leitura e formação de palavras com LH, NH e CH.', 'https://www.youtube.com/watch?v=LMaE0gAsI04', 'aula', '2026-11-10 21:00:00', 51, 'Este conteúdo apresenta sílabas complexas e famílias silábicas. Leitura e formação de palavras com LH, NH e CH.

Objetivo da aula
Compreender os conceitos centrais de sílabas complexas e famílias silábicas e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(20, '[2º Ano Fund.] Português - Pontuação Básica: Ponto Final e Interrogação', 'Uso correto do ponto final e ponto de interrogação nas frases.', 'https://www.youtube.com/watch?v=TuBKsV3lSQc', 'aula', '2026-11-10 21:00:00', 51, 'Este conteúdo apresenta pontuação básica: ponto final e interrogação. Uso correto do ponto final e ponto de interrogação nas frases.

Objetivo da aula
Compreender os conceitos centrais de pontuação básica: ponto final e interrogação e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(21, '[2º Ano Fund.] Português - Aumento e Diminutivo das Palavras', 'Como transformar palavras usando sufixos de tamanho.', 'https://www.youtube.com/watch?v=X61lboe5_pM', 'aula', '2026-11-10 21:00:00', 51, 'Este conteúdo apresenta aumento e diminutivo das palavras. Como transformar palavras usando sufixos de tamanho.

Objetivo da aula
Compreender os conceitos centrais de aumento e diminutivo das palavras e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(22, '[2º Ano Fund.] História - A Comunidade e os Trabalhadores', 'A importância de diferentes profissões no dia a dia da cidade.', 'https://www.youtube.com/watch?v=6iwkrRpb03A', 'aula', '2026-11-10 21:00:00', 52, 'Este conteúdo apresenta a comunidade e os trabalhadores. A importância de diferentes profissões no dia a dia da cidade.

Objetivo da aula
Compreender os conceitos centrais de a comunidade e os trabalhadores e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(23, '[2º Ano Fund.] História - Brincadeiras de Ontem e de Hoje', 'Transformações nos brinquedos e brincadeiras ao longo do tempo.', 'https://www.youtube.com/watch?v=VOzIQK4m0k8', 'aula', '2026-11-10 21:00:00', 52, 'Este conteúdo apresenta brincadeiras de ontem e de hoje. Transformações nos brinquedos e brincadeiras ao longo do tempo.

Objetivo da aula
Compreender os conceitos centrais de brincadeiras de ontem e de hoje e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(24, '[2º Ano Fund.] História - Documentos Pessoais e Memória', 'A importância da certidão de nascimento e registros de identidade.', 'https://www.youtube.com/watch?v=jAMnrrqGYcw', 'aula', '2026-11-10 21:00:00', 52, 'Este conteúdo apresenta documentos pessoais e memória. A importância da certidão de nascimento e registros de identidade.

Objetivo da aula
Compreender os conceitos centrais de documentos pessoais e memória e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(25, '[2º Ano Fund.] Geografia - Paisagem Natural e Paisagem Modificada', 'Diferença entre o que a natureza criou e o que o ser humano construiu.', 'https://www.youtube.com/watch?v=9E8ajFP0Iq0', 'aula', '2026-11-10 21:00:00', 53, 'Este conteúdo apresenta paisagem natural e paisagem modificada. Diferença entre o que a natureza criou e o que o ser humano construiu.

Objetivo da aula
Compreender os conceitos centrais de paisagem natural e paisagem modificada e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(26, '[2º Ano Fund.] Geografia - O Bairro e suas Características', 'Ruas, comércios e a convivência nos espaços públicos.', 'https://www.youtube.com/watch?v=nrzFMOq1k-w', 'aula', '2026-11-10 21:00:00', 53, 'Este conteúdo apresenta o bairro e suas características. Ruas, comércios e a convivência nos espaços públicos.

Objetivo da aula
Compreender os conceitos centrais de o bairro e suas características e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(27, '[2º Ano Fund.] Geografia - Cuidados com o Meio Ambiente no Bairro', 'Coleta seletiva e preservação de praças e ruas.', 'https://www.youtube.com/live/YvH0XoPyANA', 'aula', '2026-11-10 21:00:00', 53, 'Este conteúdo apresenta cuidados com o meio ambiente no bairro. Coleta seletiva e preservação de praças e ruas.

Objetivo da aula
Compreender os conceitos centrais de cuidados com o meio ambiente no bairro e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(28, '[2º Ano Fund.] Ciências - Os Seres Vivos e o Ambiente', 'Ciclo de vida dos animais e das plantas.', 'https://www.youtube.com/watch?v=bMwEgGaB1ZQ', 'aula', '2026-11-10 21:00:00', 54, 'Este conteúdo apresenta os seres vivos e o ambiente. Ciclo de vida dos animais e das plantas.

Objetivo da aula
Compreender os conceitos centrais de os seres vivos e o ambiente e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(29, '[2º Ano Fund.] Ciências - Ambientes Aquáticos e Terrestres', 'Como os animais se adaptam aos diferentes habitats.', 'https://www.youtube.com/watch?v=6H_8eFmx-g0', 'aula', '2026-11-10 21:00:00', 54, 'Este conteúdo apresenta ambientes aquáticos e terrestres. Como os animais se adaptam aos diferentes habitats.

Objetivo da aula
Compreender os conceitos centrais de ambientes aquáticos e terrestres e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(30, '[2º Ano Fund.] Ciências - Luz, Calor e Som no Dia a Dia', 'Fontes de luz natural e artificial e percepção dos sons.', 'https://www.youtube.com/watch?v=Ijb2CVy_-y0', 'aula', '2026-11-10 21:00:00', 54, 'Este conteúdo apresenta luz, calor e som no dia a dia. Fontes de luz natural e artificial e percepção dos sons.

Objetivo da aula
Compreender os conceitos centrais de luz, calor e som no dia a dia e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),

-- 3º ANO ENSINO FUNDAMENTAL (3 conteúdos por matéria)
(31, '[3º Ano Fund.] Matemática - Introdução à Multiplicação', 'A ideia de soma de parcelas iguais e tabuada básica.', 'https://www.youtube.com/watch?v=ddZHkCUcYRM', 'aula', '2026-11-10 21:00:00', 55, 'Este conteúdo apresenta introdução à multiplicação. A ideia de soma de parcelas iguais e tabuada básica.

Objetivo da aula
Compreender os conceitos centrais de introdução à multiplicação e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(32, '[3º Ano Fund.] Matemática - Medidas de Comprimento, Massa e Capacidade', 'Uso de metro, quilograma e litro no cotidiano.', 'https://www.youtube.com/watch?v=MSZdhDBoXe0', 'aula', '2026-11-10 21:00:00', 55, 'Este conteúdo apresenta medidas de comprimento, massa e capacidade. Uso de metro, quilograma e litro no cotidiano.

Objetivo da aula
Compreender os conceitos centrais de medidas de comprimento, massa e capacidade e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(33, '[3º Ano Fund.] Matemática - Sistema Monetário Brasileiro', 'Reconhecimento de cédulas, moedas e troco em compras simples.', 'https://www.youtube.com/watch?v=0HXlohthSoY', 'aula', '2026-11-10 21:00:00', 55, 'Este conteúdo apresenta sistema monetário brasileiro. Reconhecimento de cédulas, moedas e troco em compras simples.

Objetivo da aula
Compreender os conceitos centrais de sistema monetário brasileiro e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(34, '[3º Ano Fund.] Português - Tipos de Frases (Afirmativa, Negativa, Interrogativa)', 'Pontuação e entonação correta na leitura.', 'https://www.youtube.com/watch?v=X61lboe5_pM', 'aula', '2026-11-10 21:00:00', 56, 'Este conteúdo apresenta tipos de frases (afirmativa, negativa, interrogativa). Pontuação e entonação correta na leitura.

Objetivo da aula
Compreender os conceitos centrais de tipos de frases (afirmativa, negativa, interrogativa) e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(35, '[3º Ano Fund.] Português - Substantivos e Adjetivos Simples', 'Identificação de nomes de seres e suas qualidades.', 'https://www.youtube.com/watch?v=LMaE0gAsI04', 'aula', '2026-11-10 21:00:00', 56, 'Este conteúdo apresenta substantivos e adjetivos simples. Identificação de nomes de seres e suas qualidades.

Objetivo da aula
Compreender os conceitos centrais de substantivos e adjetivos simples e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(36, '[3º Ano Fund.] Português - Sinônimos e Antônimos', 'Palavras com sentidos semelhantes e opostos.', 'https://www.youtube.com/watch?v=XsN0e_xPyNI', 'aula', '2026-11-10 21:00:00', 56, 'Este conteúdo apresenta sinônimos e antônimos. Palavras com sentidos semelhantes e opostos.

Objetivo da aula
Compreender os conceitos centrais de sinônimos e antônimos e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(37, '[3º Ano Fund.] História - A Fundação do Município', 'Como a cidade onde moramos começou e quem foram os pioneiros.', 'https://www.youtube.com/watch?v=6iwkrRpb03A', 'aula', '2026-11-10 21:00:00', 57, 'Este conteúdo apresenta a fundação do município. Como a cidade onde moramos começou e quem foram os pioneiros.

Objetivo da aula
Compreender os conceitos centrais de a fundação do município e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(38, '[3º Ano Fund.] História - O Trabalho no Campo e na Cidade', 'A interdependência entre a zona rural e a zona urbana.', 'https://www.youtube.com/watch?v=VOzIQK4m0k8', 'aula', '2026-11-10 21:00:00', 57, 'Este conteúdo apresenta o trabalho no campo e na cidade. A interdependência entre a zona rural e a zona urbana.

Objetivo da aula
Compreender os conceitos centrais de o trabalho no campo e na cidade e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(39, '[3º Ano Fund.] História - Migração e a Chegada de Novos Moradores', 'A influência de diferentes culturas na formação da população local.', 'https://www.youtube.com/watch?v=jAMnrrqGYcw', 'aula', '2026-11-10 21:00:00', 57, 'Este conteúdo apresenta migração e a chegada de novos moradores. A influência de diferentes culturas na formação da população local.

Objetivo da aula
Compreender os conceitos centrais de migração e a chegada de novos moradores e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(40, '[3º Ano Fund.] Geografia - O Município e a Zona Rural/Urbana', 'Diferenças econômicas e sociais entre campo e cidade.', 'https://www.youtube.com/watch?v=9E8ajFP0Iq0', 'aula', '2026-11-10 21:00:00', 58, 'Este conteúdo apresenta o município e a zona rural/urbana. Diferenças econômicas e sociais entre campo e cidade.

Objetivo da aula
Compreender os conceitos centrais de o município e a zona rural/urbana e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(41, '[3º Ano Fund.] Geografia - Mapas Simples e Orientação por Pontos Cardeais', 'Noções básicas de rosa dos ventos e representação cartográfica.', 'https://www.youtube.com/watch?v=nrzFMOq1k-w', 'aula', '2026-11-10 21:00:00', 58, 'Este conteúdo apresenta mapas simples e orientação por pontos cardeais. Noções básicas de rosa dos ventos e representação cartográfica.

Objetivo da aula
Compreender os conceitos centrais de mapas simples e orientação por pontos cardeais e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(42, '[3º Ano Fund.] Geografia - O Clima e o Tempo Atmosférico na Região', 'Como o clima influencia as roupas, vestuário e o cotidiano.', 'https://www.youtube.com/live/YvH0XoPyANA', 'aula', '2026-11-10 21:00:00', 58, 'Este conteúdo apresenta o clima e o tempo atmosférico na região. Como o clima influencia as roupas, vestuário e o cotidiano.

Objetivo da aula
Compreender os conceitos centrais de o clima e o tempo atmosférico na região e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(43, '[3º Ano Fund.] Ciências - Cadeias Alimentares Simples', 'Produtores, consumidores e decompositores na natureza.', 'https://www.youtube.com/watch?v=bMwEgGaB1ZQ', 'aula', '2026-11-10 21:00:00', 59, 'Este conteúdo apresenta cadeias alimentares simples. Produtores, consumidores e decompositores na natureza.

Objetivo da aula
Compreender os conceitos centrais de cadeias alimentares simples e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(44, '[3º Ano Fund.] Ciências - Água e Solo: Recursos Essenciais', 'A importância da preservação da água e dos tipos de solo.', 'https://www.youtube.com/watch?v=6H_8eFmx-g0', 'aula', '2026-11-10 21:00:00', 59, 'Este conteúdo apresenta água e solo: recursos essenciais. A importância da preservação da água e dos tipos de solo.

Objetivo da aula
Compreender os conceitos centrais de água e solo: recursos essenciais e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(45, '[3º Ano Fund.] Ciências - O Ciclo da Água na Natureza', 'Evaporação, condensação e precipitação explicadas de forma simples.', 'https://www.youtube.com/watch?v=Ijb2CVy_-y0', 'aula', '2026-11-10 21:00:00', 59, 'Este conteúdo apresenta o ciclo da água na natureza. Evaporação, condensação e precipitação explicadas de forma simples.

Objetivo da aula
Compreender os conceitos centrais de o ciclo da água na natureza e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),

-- 4º ANO ENSINO FUNDAMENTAL (3 conteúdos por matéria)
(46, '[4º Ano Fund.] Matemática - Divisão Exata e Não Exata', 'O algoritmo da divisão e o conceito de resto.', 'https://www.youtube.com/watch?v=0HXlohthSoY', 'aula', '2026-11-10 21:00:00', 60, 'Este conteúdo apresenta divisão exata e não exata. O algoritmo da divisão e o conceito de resto.

Objetivo da aula
Compreender os conceitos centrais de divisão exata e não exata e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(47, '[4º Ano Fund.] Matemática - Introdução às Frações', 'Partes de um todo e representação fracionária básica.', 'https://www.youtube.com/watch?v=F5GGs1Rpt7I', 'aula', '2026-11-10 21:00:00', 60, 'Este conteúdo apresenta introdução às frações. Partes de um todo e representação fracionária básica.

Objetivo da aula
Compreender os conceitos centrais de introdução às frações e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(48, '[4º Ano Fund.] Matemática - Perímetro e Área de Figuras Planas', 'Cálculo de medidas em malhas quadriculadas.', 'https://www.youtube.com/watch?v=ddZHkCUcYRM', 'aula', '2026-11-10 21:00:00', 60, 'Este conteúdo apresenta perímetro e área de figuras planas. Cálculo de medidas em malhas quadriculadas.

Objetivo da aula
Compreender os conceitos centrais de perímetro e área de figuras planas e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(49, '[4º Ano Fund.] Português - Substantivos Próprios e Comuns', 'Classificação e uso correto de letras maiúsculas.', 'https://www.youtube.com/watch?v=XsN0e_xPyNI', 'aula', '2026-11-10 21:00:00', 61, 'Este conteúdo apresenta substantivos próprios e comuns. Classificação e uso correto de letras maiúsculas.

Objetivo da aula
Compreender os conceitos centrais de substantivos próprios e comuns e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(50, '[4º Ano Fund.] Português - Sílabas Tônicas e Acentuação Básica', 'Identificação da sílaba mais forte nas palavras.', 'https://www.youtube.com/watch?v=LMaE0gAsI04', 'aula', '2026-11-10 21:00:00', 61, 'Este conteúdo apresenta sílabas tônicas e acentuação básica. Identificação da sílaba mais forte nas palavras.

Objetivo da aula
Compreender os conceitos centrais de sílabas tônicas e acentuação básica e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(51, '[4º Ano Fund.] Português - Produção de Textos Narrativos e Parágrafos', 'Como estruturar início, meio e fim em uma historinha.', 'https://www.youtube.com/watch?v=TuBKsV3lSQc', 'aula', '2026-11-10 21:00:00', 61, 'Este conteúdo apresenta produção de textos narrativos e parágrafos. Como estruturar início, meio e fim em uma historinha.

Objetivo da aula
Compreender os conceitos centrais de produção de textos narrativos e parágrafos e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(52, '[4º Ano Fund.] História - Os Primeiros Habitantes e a Colonização', 'A chegada dos portugueses e os povos indígenas originários.', 'https://www.youtube.com/watch?v=6iwkrRpb03A', 'aula', '2026-11-10 21:00:00', 62, 'Este conteúdo apresenta os primeiros habitantes e a colonização. A chegada dos portugueses e os povos indígenas originários.

Objetivo da aula
Compreender os conceitos centrais de os primeiros habitantes e a colonização e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(53, '[4º Ano Fund.] História - Caminhos e Rotas do Comércio Antigo', 'Como as trocas comerciais moldaram as primeiras vilas e cidades.', 'https://www.youtube.com/watch?v=VOzIQK4m0k8', 'aula', '2026-11-10 21:00:00', 62, 'Este conteúdo apresenta caminhos e rotas do comércio antigo. Como as trocas comerciais moldaram as primeiras vilas e cidades.

Objetivo da aula
Compreender os conceitos centrais de caminhos e rotas do comércio antigo e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(54, '[4º Ano Fund.] História - A Expansão do Território Brasileiro', 'As expedições dos bandeirantes e a interiorização do Brasil.', 'https://www.youtube.com/watch?v=jAMnrrqGYcw', 'aula', '2026-11-10 21:00:00', 62, 'Este conteúdo apresenta a expansão do território brasileiro. As expedições dos bandeirantes e a interiorização do Brasil.

Objetivo da aula
Compreender os conceitos centrais de a expansão do território brasileiro e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(55, '[4º Ano Fund.] Geografia - O Estado e a Região onde Vivo', 'Divisão político-administrativa do Brasil e estados vizinhos.', 'https://www.youtube.com/watch?v=9E8ajFP0Iq0', 'aula', '2026-11-10 21:00:00', 63, 'Este conteúdo apresenta o estado e a região onde vivo. Divisão político-administrativa do Brasil e estados vizinhos.

Objetivo da aula
Compreender os conceitos centrais de o estado e a região onde vivo e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(56, '[4º Ano Fund.] Geografia - Relevo e Hidrografia do Brasil', 'Rios, montanhas, planaltos e depressões no território brasileiro.', 'https://www.youtube.com/watch?v=nrzFMOq1k-w', 'aula', '2026-11-10 21:00:00', 63, 'Este conteúdo apresenta relevo e hidrografia do brasil. Rios, montanhas, planaltos e depressões no território brasileiro.

Objetivo da aula
Compreender os conceitos centrais de relevo e hidrografia do brasil e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(57, '[4º Ano Fund.] Geografia - População e Migrações Internas', 'O deslocamento de pessoas entre regiões brasileiras.', 'https://www.youtube.com/live/YvH0XoPyANA', 'aula', '2026-11-10 21:00:00', 63, 'Este conteúdo apresenta população e migrações internas. O deslocamento de pessoas entre regiões brasileiras.

Objetivo da aula
Compreender os conceitos centrais de população e migrações internas e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(58, '[4º Ano Fund.] Ciências - O Sistema Solar e os Movimentos da Terra', 'Rotação, translação e as fases da Lua.', 'https://www.youtube.com/watch?v=7kluWpnlVPU', 'aula', '2026-11-10 21:00:00', 64, 'Este conteúdo apresenta o sistema solar e os movimentos da terra. Rotação, translação e as fases da Lua.

Objetivo da aula
Compreender os conceitos centrais de o sistema solar e os movimentos da terra e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(59, '[4º Ano Fund.] Ciências - Misturas e Transformações dos Materiais', 'Materiais solúveis e insolúveis, mudanças físicas do dia a dia.', 'https://www.youtube.com/watch?v=bMwEgGaB1ZQ', 'aula', '2026-11-10 21:00:00', 64, 'Este conteúdo apresenta misturas e transformações dos materiais. Materiais solúveis e insolúveis, mudanças físicas do dia a dia.

Objetivo da aula
Compreender os conceitos centrais de misturas e transformações dos materiais e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(60, '[4º Ano Fund.] Ciências - Ecossistemas e Teias Alimentares', 'Relações ecológicas entre os seres vivos nos biomas.', 'https://www.youtube.com/watch?v=6H_8eFmx-g0', 'aula', '2026-11-10 21:00:00', 64, 'Este conteúdo apresenta ecossistemas e teias alimentares. Relações ecológicas entre os seres vivos nos biomas.

Objetivo da aula
Compreender os conceitos centrais de ecossistemas e teias alimentares e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),

-- 5º ANO ENSINO FUNDAMENTAL (3 conteúdos por matéria)
(61, '[5º Ano Fund.] Matemática - Operações com Frações e Números Decimais', 'Soma, subtração de frações e leitura de números com vírgula.', 'https://www.youtube.com/watch?v=F5GGs1Rpt7I', 'aula', '2026-11-10 21:00:00', 65, 'Este conteúdo apresenta operações com frações e números decimais. Soma, subtração de frações e leitura de números com vírgula.

Objetivo da aula
Compreender os conceitos centrais de operações com frações e números decimais e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(62, '[5º Ano Fund.] Matemática - Porcentagem e Gráficos Básicos', 'Cálculos de porcentagens simples e leitura de tabelas estatísticas.', 'https://www.youtube.com/watch?v=0HXlohthSoY', 'aula', '2026-11-10 21:00:00', 65, 'Este conteúdo apresenta porcentagem e gráficos básicos. Cálculos de porcentagens simples e leitura de tabelas estatísticas.

Objetivo da aula
Compreender os conceitos centrais de porcentagem e gráficos básicos e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(63, '[5º Ano Fund.] Matemática - Volume e Unidades de Medida Cúbicas', 'Noções espaciais e cálculo de capacidade em blocos.', 'https://www.youtube.com/watch?v=MSZdhDBoXe0', 'aula', '2026-11-10 21:00:00', 65, 'Este conteúdo apresenta volume e unidades de medida cúbicas. Noções espaciais e cálculo de capacidade em blocos.

Objetivo da aula
Compreender os conceitos centrais de volume e unidades de medida cúbicas e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(64, '[5º Ano Fund.] Português - Coesão e Pontuação em Textos Narrativos', 'Uso de travessão, dois-pontos e vírgula na contação de histórias.', 'https://www.youtube.com/watch?v=TuBKsV3lSQc', 'aula', '2026-11-10 21:00:00', 66, 'Este conteúdo apresenta coesão e pontuação em textos narrativos. Uso de travessão, dois-pontos e vírgula na contação de histórias.

Objetivo da aula
Compreender os conceitos centrais de coesão e pontuação em textos narrativos e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(65, '[5º Ano Fund.] Português - Pronomes e Variação Linguística', 'Uso de pronomes pessoais e respeito às formas de falar.', 'https://www.youtube.com/watch?v=LMaE0gAsI04', 'aula', '2026-11-10 21:00:00', 66, 'Este conteúdo apresenta pronomes e variação linguística. Uso de pronomes pessoais e respeito às formas de falar.

Objetivo da aula
Compreender os conceitos centrais de pronomes e variação linguística e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(66, '[5º Ano Fund.] Português - Concordância Básica entre Nome e Verbo', 'Regras essenciais para escrever frases corretas.', 'https://www.youtube.com/watch?v=X61lboe5_pM', 'aula', '2026-11-10 21:00:00', 66, 'Este conteúdo apresenta concordância básica entre nome e verbo. Regras essenciais para escrever frases corretas.

Objetivo da aula
Compreender os conceitos centrais de concordância básica entre nome e verbo e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(67, '[5º Ano Fund.] História - A Formação do Povo Brasileiro', 'A miscigenação cultural entre indígenas, africanos e europeus.', 'https://www.youtube.com/watch?v=6iwkrRpb03A', 'aula', '2026-11-10 21:00:00', 67, 'Este conteúdo apresenta a formação do povo brasileiro. A miscigenação cultural entre indígenas, africanos e europeus.

Objetivo da aula
Compreender os conceitos centrais de a formação do povo brasileiro e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(68, '[5º Ano Fund.] História - Cidadania e Direitos no Brasil', 'A Constituição, os direitos das crianças e deveres em sociedade.', 'https://www.youtube.com/watch?v=VOzIQK4m0k8', 'aula', '2026-11-10 21:00:00', 67, 'Este conteúdo apresenta cidadania e direitos no brasil. A Constituição, os direitos das crianças e deveres em sociedade.

Objetivo da aula
Compreender os conceitos centrais de cidadania e direitos no brasil e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(69, '[5º Ano Fund.] História - Patrimônio Histórico e Cultural', 'A importância de preservar monumentos, festas e tradições.', 'https://www.youtube.com/watch?v=jAMnrrqGYcw', 'aula', '2026-11-10 21:00:00', 67, 'Este conteúdo apresenta patrimônio histórico e cultural. A importância de preservar monumentos, festas e tradições.

Objetivo da aula
Compreender os conceitos centrais de patrimônio histórico e cultural e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(70, '[5º Ano Fund.] Geografia - Regiões Brasileiras e Diversidade Cultural', 'As cinco grandes regiões do Brasil, biomas e costumes locais.', 'https://www.youtube.com/watch?v=9E8ajFP0Iq0', 'aula', '2026-11-10 21:00:00', 68, 'Este conteúdo apresenta regiões brasileiras e diversidade cultural. As cinco grandes regiões do Brasil, biomas e costumes locais.

Objetivo da aula
Compreender os conceitos centrais de regiões brasileiras e diversidade cultural e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(71, '[5º Ano Fund.] Geografia - Globalização e Meio Ambiente Urbano', 'Problemas ambientais nas grandes cidades e lixo urbano.', 'https://www.youtube.com/watch?v=nrzFMOq1k-w', 'aula', '2026-11-10 21:00:00', 68, 'Este conteúdo apresenta globalização e meio ambiente urbano. Problemas ambientais nas grandes cidades e lixo urbano.

Objetivo da aula
Compreender os conceitos centrais de globalização e meio ambiente urbano e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(72, '[5º Ano Fund.] Geografia - Redes de Transporte e Comunicação', 'Como circulam pessoas, mercadorias e informações no país.', 'https://www.youtube.com/live/YvH0XoPyANA', 'aula', '2026-11-10 21:00:00', 68, 'Este conteúdo apresenta redes de transporte e comunicação. Como circulam pessoas, mercadorias e informações no país.

Objetivo da aula
Compreender os conceitos centrais de redes de transporte e comunicação e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(73, '[5º Ano Fund.] Ciências - Sistema Digestório e Respiratório', 'Como o corpo humano absorve nutrientes e oxigênio.', 'https://www.youtube.com/watch?v=bMwEgGaB1ZQ', 'aula', '2026-11-10 21:00:00', 69, 'Este conteúdo apresenta sistema digestório e respiratório. Como o corpo humano absorve nutrientes e oxigênio.

Objetivo da aula
Compreender os conceitos centrais de sistema digestório e respiratório e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(74, '[5º Ano Fund.] Ciências - Fontes de Energia e Eletricidade', 'Energia renovável, não renovável e circuitos elétricos simples.', 'https://www.youtube.com/watch?v=6H_8eFmx-g0', 'aula', '2026-11-10 21:00:00', 69, 'Este conteúdo apresenta fontes de energia e eletricidade. Energia renovável, não renovável e circuitos elétricos simples.

Objetivo da aula
Compreender os conceitos centrais de fontes de energia e eletricidade e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(75, '[5º Ano Fund.] Ciências - Astronomia e Instrumentos de Observação', 'O uso de telescópios e a exploração do espaço.', 'https://www.youtube.com/watch?v=Ijb2CVy_-y0', 'aula', '2026-11-10 21:00:00', 69, 'Este conteúdo apresenta astronomia e instrumentos de observação. O uso de telescópios e a exploração do espaço.

Objetivo da aula
Compreender os conceitos centrais de astronomia e instrumentos de observação e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),

-- 6º ANO ENSINO FUNDAMENTAL (3 conteúdos por matéria)
(76, '[6º Ano Fund.] Matemática - Números Inteiros e Operações com Negativos', 'A reta numérica e o conjunto dos números inteiros.', 'https://www.youtube.com/watch?v=MSZdhDBoXe0', 'aula', '2026-11-10 21:00:00', 70, 'Este conteúdo apresenta números inteiros e operações com negativos. A reta numérica e o conjunto dos números inteiros.

Objetivo da aula
Compreender os conceitos centrais de números inteiros e operações com negativos e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(77, '[6º Ano Fund.] Matemática - Frações e Operações Fundamentais', 'Conceito, simplificação e operações com frações ordinárias.', 'https://www.youtube.com/watch?v=ddZHkCUcYRM', 'aula', '2026-11-10 21:00:00', 70, 'Este conteúdo apresenta frações e operações fundamentais. Conceito, simplificação e operações com frações ordinárias.

Objetivo da aula
Compreender os conceitos centrais de frações e operações fundamentais e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(78, '[6º Ano Fund.] Matemática - Expressões Numéricas e Potenciação', 'Ordem de resolução de operações matemáticas básicas.', 'https://www.youtube.com/watch?v=0HXlohthSoY', 'aula', '2026-11-10 21:00:00', 70, 'Este conteúdo apresenta expressões numéricas e potenciação. Ordem de resolução de operações matemáticas básicas.

Objetivo da aula
Compreender os conceitos centrais de expressões numéricas e potenciação e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(79, '[6º Ano Fund.] Português - Morfologia: Substantivos e Adjetivos', 'Estrutura e classificação das classes gramaticais.', 'https://www.youtube.com/watch?v=LMaE0gAsI04', 'aula', '2026-11-10 21:00:00', 71, 'Este conteúdo apresenta morfologia: substantivos e adjetivos. Estrutura e classificação das classes gramaticais.

Objetivo da aula
Compreender os conceitos centrais de morfologia: substantivos e adjetivos e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(80, '[6º Ano Fund.] Português - Gêneros Textuais: Notícia e Reportagem', 'Características de textos informativos na mídia.', 'https://www.youtube.com/watch?v=X61lboe5_pM', 'aula', '2026-11-10 21:00:00', 71, 'Este conteúdo apresenta gêneros textuais: notícia e reportagem. Características de textos informativos na mídia.

Objetivo da aula
Compreender os conceitos centrais de gêneros textuais: notícia e reportagem e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(81, '[6º Ano Fund.] Português - Fonética e Fonologia: Encontros Vocálicos', 'Diferença entre fonemas, letras, ditongos e hiatos.', 'https://www.youtube.com/watch?v=XsN0e_xPyNI', 'aula', '2026-11-10 21:00:00', 71, 'Este conteúdo apresenta fonética e fonologia: encontros vocálicos. Diferença entre fonemas, letras, ditongos e hiatos.

Objetivo da aula
Compreender os conceitos centrais de fonética e fonologia: encontros vocálicos e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(82, '[6º Ano Fund.] História - A Pré-História e o Surgimento da Agricultura', 'A Revolução Neolítica e as primeiras comunidades humanas.', 'https://www.youtube.com/watch?v=6iwkrRpb03A', 'aula', '2026-11-10 21:00:00', 72, 'Este conteúdo apresenta a pré-história e o surgimento da agricultura. A Revolução Neolítica e as primeiras comunidades humanas.

Objetivo da aula
Compreender os conceitos centrais de a pré-história e o surgimento da agricultura e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(83, '[6º Ano Fund.] História - As Primeiras Civilizações: Mesopotâmia e Egito', 'A organização política e social nos vales dos grandes rios.', 'https://www.youtube.com/watch?v=VOzIQK4m0k8', 'aula', '2026-11-10 21:00:00', 72, 'Este conteúdo apresenta as primeiras civilizações: mesopotâmia e egito. A organização política e social nos vales dos grandes rios.

Objetivo da aula
Compreender os conceitos centrais de as primeiras civilizações: mesopotâmia e egito e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(84, '[6º Ano Fund.] História - Grécia Antiga: A Origem da Democracia', 'A formação das pólis gregas, Atenas e Esparta.', 'https://www.youtube.com/watch?v=jAMnrrqGYcw', 'aula', '2026-11-10 21:00:00', 72, 'Este conteúdo apresenta grécia antiga: a origem da democracia. A formação das pólis gregas, Atenas e Esparta.

Objetivo da aula
Compreender os conceitos centrais de grécia antiga: a origem da democracia e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(85, '[6º Ano Fund.] Geografia - Orientação e Coordenadas Geográficas', 'Latitude, longitude e pontos cardeais.', 'https://www.youtube.com/watch?v=nrzFMOq1k-w', 'aula', '2026-11-10 21:00:00', 73, 'Este conteúdo apresenta orientação e coordenadas geográficas. Latitude, longitude e pontos cardeais.

Objetivo da aula
Compreender os conceitos centrais de orientação e coordenadas geográficas e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(86, '[6º Ano Fund.] Geografia - A Dinâmica Interna e Externa da Terra', 'Placas tectônicas, terremotos, vulcões e intemperismo.', 'https://www.youtube.com/live/YvH0XoPyANA', 'aula', '2026-11-10 21:00:00', 73, 'Este conteúdo apresenta a dinâmica interna e externa da terra. Placas tectônicas, terremotos, vulcões e intemperismo.

Objetivo da aula
Compreender os conceitos centrais de a dinâmica interna e externa da terra e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(87, '[6º Ano Fund.] Geografia - As Camadas da Atmosfera e o Clima', 'A troposfera, estratofera e fenômenos meteorológicos.', 'https://www.youtube.com/watch?v=9E8ajFP0Iq0', 'aula', '2026-11-10 21:00:00', 73, 'Este conteúdo apresenta as camadas da atmosfera e o clima. A troposfera, estratofera e fenômenos meteorológicos.

Objetivo da aula
Compreender os conceitos centrais de as camadas da atmosfera e o clima e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(88, '[6º Ano Fund.] Ciências - Célula: A Unidade da Vida', 'Introdução à citologia, organelas básicas e seres vivos.', 'https://www.youtube.com/watch?v=bMwEgGaB1ZQ', 'aula', '2026-11-10 21:00:00', 74, 'Este conteúdo apresenta célula: a unidade da vida. Introdução à citologia, organelas básicas e seres vivos.

Objetivo da aula
Compreender os conceitos centrais de célula: a unidade da vida e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(89, '[6º Ano Fund.] Ciências - Misturas Homogêneas e Heterogêneas', 'Métodos de separação de misturas no laboratório e cotidiano.', 'https://www.youtube.com/watch?v=6H_8eFmx-g0', 'aula', '2026-11-10 21:00:00', 74, 'Este conteúdo apresenta misturas homogêneas e heterogêneas. Métodos de separação de misturas no laboratório e cotidiano.

Objetivo da aula
Compreender os conceitos centrais de misturas homogêneas e heterogêneas e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(90, '[6º Ano Fund.] Ciências - Astronomia: O Sistema Solar em Detalhes', 'Características dos planetas rochosos e gasosos.', 'https://www.youtube.com/watch?v=7kluWpnlVPU', 'aula', '2026-11-10 21:00:00', 74, 'Este conteúdo apresenta astronomia: o sistema solar em detalhes. Características dos planetas rochosos e gasosos.

Objetivo da aula
Compreender os conceitos centrais de astronomia: o sistema solar em detalhes e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),

-- 7º ANO ENSINO FUNDAMENTAL (3 conteúdos por matéria)
(91, '[7º Ano Fund.] Matemática - Equações do 1º Grau com Uma Incógnita', 'Como isolar a incógnita e resolver problemas algébricos.', 'https://www.youtube.com/watch?v=LxuTxkHAXeQ', 'aula', '2026-11-10 21:00:00', 75, 'Este conteúdo apresenta equações do 1º grau com uma incógnita. Como isolar a incógnita e resolver problemas algébricos.

Objetivo da aula
Compreender os conceitos centrais de equações do 1º grau com uma incógnita e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(92, '[7º Ano Fund.] Matemática - Razão e Proporção', 'Regra de três simples e aplicações práticas.', 'https://www.youtube.com/watch?v=MSZdhDBoXe0', 'aula', '2026-11-10 21:00:00', 75, 'Este conteúdo apresenta razão e proporção. Regra de três simples e aplicações práticas.

Objetivo da aula
Compreender os conceitos centrais de razão e proporção e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(93, '[7º Ano Fund.] Matemática - Números Racionais e Operações com Decimais', 'Estudo aprofundado de frações, dízimas e números com vírgula.', 'https://www.youtube.com/watch?v=0HXlohthSoY', 'aula', '2026-11-10 21:00:00', 75, 'Este conteúdo apresenta números racionais e operações com decimais. Estudo aprofundado de frações, dízimas e números com vírgula.

Objetivo da aula
Compreender os conceitos centrais de números racionais e operações com decimais e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(94, '[7º Ano Fund.] Português - Verbos: Tempos e Modos Verbais', 'Indicativo, subjuntivo e imperativo no cotidiano.', 'https://www.youtube.com/watch?v=X61lboe5_pM', 'aula', '2026-11-10 21:00:00', 76, 'Este conteúdo apresenta verbos: tempos e modos verbais. Indicativo, subjuntivo e imperativo no cotidiano.

Objetivo da aula
Compreender os conceitos centrais de verbos: tempos e modos verbais e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(95, '[7º Ano Fund.] Português - Concordância Verbal e Nominal Básica', 'Como combinar corretamente palavras em frases complexas.', 'https://www.youtube.com/watch?v=LMaE0gAsI04', 'aula', '2026-11-10 21:00:00', 76, 'Este conteúdo apresenta concordância verbal e nominal básica. Como combinar corretamente palavras em frases complexas.

Objetivo da aula
Compreender os conceitos centrais de concordância verbal e nominal básica e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(96, '[7º Ano Fund.] Português - Variação Linguística e Preconceito', 'As diferentes formas de falar a língua portuguesa no Brasil.', 'https://www.youtube.com/watch?v=TuBKsV3lSQc', 'aula', '2026-11-10 21:00:00', 76, 'Este conteúdo apresenta variação linguística e preconceito. As diferentes formas de falar a língua portuguesa no Brasil.

Objetivo da aula
Compreender os conceitos centrais de variação linguística e preconceito e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(97, '[7º Ano Fund.] História - O Período Feudal e a Idade Média', 'A sociedade feudal, economia e o papel da Igreja.', 'https://www.youtube.com/watch?v=VOzIQK4m0k8', 'aula', '2026-11-10 21:00:00', 77, 'Este conteúdo apresenta o período feudal e a idade média. A sociedade feudal, economia e o papel da Igreja.

Objetivo da aula
Compreender os conceitos centrais de o período feudal e a idade média e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(98, '[7º Ano Fund.] História - O Renascimento Cultural e Científico', 'A redescoberta dos clássicos e a revolução artística na Europa.', 'https://www.youtube.com/watch?v=6iwkrRpb03A', 'aula', '2026-11-10 21:00:00', 77, 'Este conteúdo apresenta o renascimento cultural e científico. A redescoberta dos clássicos e a revolução artística na Europa.

Objetivo da aula
Compreender os conceitos centrais de o renascimento cultural e científico e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(99, '[7º Ano Fund.] História - A Colonização do Brasil: Economia Açucareira', 'O sistema de capitanias hereditárias e o trabalho escravizado.', 'https://www.youtube.com/watch?v=jAMnrrqGYcw', 'aula', '2026-11-10 21:00:00', 77, 'Este conteúdo apresenta a colonização do brasil: economia açucareira. O sistema de capitanias hereditárias e o trabalho escravizado.

Objetivo da aula
Compreender os conceitos centrais de a colonização do brasil: economia açucareira e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(100, '[7º Ano Fund.] Geografia - Demografia Brasileira e População', 'Crescimento vegetativo, êxodo rural e distribuição demográfica.', 'https://www.youtube.com/watch?v=9E8ajFP0Iq0', 'aula', '2026-11-10 21:00:00', 78, 'Este conteúdo apresenta demografia brasileira e população. Crescimento vegetativo, êxodo rural e distribuição demográfica.

Objetivo da aula
Compreender os conceitos centrais de demografia brasileira e população e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(101, '[7º Ano Fund.] Geografia - Urbanização e Problemas nas Cidades', 'Crescimento desordenado, periferias e saneamento básico.', 'https://www.youtube.com/watch?v=nrzFMOq1k-w', 'aula', '2026-11-10 21:00:00', 78, 'Este conteúdo apresenta urbanização e problemas nas cidades. Crescimento desordenado, periferias e saneamento básico.

Objetivo da aula
Compreender os conceitos centrais de urbanização e problemas nas cidades e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(102, '[7º Ano Fund.] Geografia - A Industrialização Brasileira', 'Fases da industrialização e concentração fabril no Sudeste.', 'https://www.youtube.com/live/YvH0XoPyANA', 'aula', '2026-11-10 21:00:00', 78, 'Este conteúdo apresenta a industrialização brasileira. Fases da industrialização e concentração fabril no Sudeste.

Objetivo da aula
Compreender os conceitos centrais de a industrialização brasileira e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(103, '[7º Ano Fund.] Ciências - Biodiversidade e Reinos dos Seres Vivos', 'Classificação dos seres vivos e reinos biológicos.', 'https://www.youtube.com/watch?v=6H_8eFmx-g0', 'aula', '2026-11-10 21:00:00', 79, 'Este conteúdo apresenta biodiversidade e reinos dos seres vivos. Classificação dos seres vivos e reinos biológicos.

Objetivo da aula
Compreender os conceitos centrais de biodiversidade e reinos dos seres vivos e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(104, '[7º Ano Fund.] Ciências - Máquinas Simples e Física do Quotidiano', 'Alavancas, polias e planos inclinados na física básica.', 'https://www.youtube.com/watch?v=bMwEgGaB1ZQ', 'aula', '2026-11-10 21:00:00', 79, 'Este conteúdo apresenta máquinas simples e física do quotidiano. Alavancas, polias e planos inclinados na física básica.

Objetivo da aula
Compreender os conceitos centrais de máquinas simples e física do quotidiano e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(105, '[7º Ano Fund.] Ciências - Clima, Biomas e Ecossistemas do Brasil', 'Características de florestas, savanas e campos brasileiros.', 'https://www.youtube.com/watch?v=Ijb2CVy_-y0', 'aula', '2026-11-10 21:00:00', 79, 'Este conteúdo apresenta clima, biomas e ecossistemas do brasil. Características de florestas, savanas e campos brasileiros.

Objetivo da aula
Compreender os conceitos centrais de clima, biomas e ecossistemas do brasil e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),

-- 8º ANO ENSINO FUNDAMENTAL (3 conteúdos por matéria)
(106, '[8º Ano Fund.] Matemática - Teorema de Pitágoras no Triângulo Retângulo', 'Catetos, hipotenusa e cálculo de distâncias.', 'https://www.youtube.com/watch?v=MSZdhDBoXe0', 'aula', '2026-11-10 21:00:00', 80, 'Este conteúdo apresenta teorema de pitágoras no triângulo retângulo. Catetos, hipotenusa e cálculo de distâncias.

Objetivo da aula
Compreender os conceitos centrais de teorema de pitágoras no triângulo retângulo e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(107, '[8º Ano Fund.] Matemática - Sistemas de Equações do 1º Grau', 'Método da substituição e da adição para resolução de problemas.', 'https://www.youtube.com/watch?v=LxuTxkHAXeQ', 'aula', '2026-11-10 21:00:00', 80, 'Este conteúdo apresenta sistemas de equações do 1º grau. Método da substituição e da adição para resolução de problemas.

Objetivo da aula
Compreender os conceitos centrais de sistemas de equações do 1º grau e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(108, '[8º Ano Fund.] Matemática - Estatística Básica: Média, Mediana e Moda', 'Análise de gráficos e medidas de tendência central.', 'https://www.youtube.com/watch?v=ddZHkCUcYRM', 'aula', '2026-11-10 21:00:00', 80, 'Este conteúdo apresenta estatística básica: média, mediana e moda. Análise de gráficos e medidas de tendência central.

Objetivo da aula
Compreender os conceitos centrais de estatística básica: média, mediana e moda e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(109, '[8º Ano Fund.] Português - Orações Coordenadas e Período Composto', 'Relações sintáticas de coordenação entre orações.', 'https://www.youtube.com/watch?v=LMaE0gAsI04', 'aula', '2026-11-10 21:00:00', 81, 'Este conteúdo apresenta orações coordenadas e período composto. Relações sintáticas de coordenação entre orações.

Objetivo da aula
Compreender os conceitos centrais de orações coordenadas e período composto e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(110, '[8º Ano Fund.] Português - Vozes Verbais: Ativa, Passiva e Reflexiva', 'Como o sujeito pratica ou sofre a ação na frase.', 'https://www.youtube.com/watch?v=X61lboe5_pM', 'aula', '2026-11-10 21:00:00', 81, 'Este conteúdo apresenta vozes verbais: ativa, passiva e reflexiva. Como o sujeito pratica ou sofre a ação na frase.

Objetivo da aula
Compreender os conceitos centrais de vozes verbais: ativa, passiva e reflexiva e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(111, '[8º Ano Fund.] Português - Figuras de Linguagem: Metáfora e Comparação', 'Recursos expressivos na construção de textos literários.', 'https://www.youtube.com/watch?v=TuBKsV3lSQc', 'aula', '2026-11-10 21:00:00', 81, 'Este conteúdo apresenta figuras de linguagem: metáfora e comparação. Recursos expressivos na construção de textos literários.

Objetivo da aula
Compreender os conceitos centrais de figuras de linguagem: metáfora e comparação e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(112, '[8º Ano Fund.] História - Revolução Industrial e Iluminismo', 'As transformações tecnológicas e sociais do século XVIII.', 'https://www.youtube.com/watch?v=AGKX8fGF-D8', 'aula', '2026-11-10 21:00:00', 82, 'Este conteúdo apresenta revolução industrial e iluminismo. As transformações tecnológicas e sociais do século XVIII.

Objetivo da aula
Compreender os conceitos centrais de revolução industrial e iluminismo e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(113, '[8º Ano Fund.] História - A Independência dos Estados Unidos e Revolução Francesa', 'A queda do Absolutismo e a Declaração dos Direitos.', 'https://www.youtube.com/watch?v=6iwkrRpb03A', 'aula', '2026-11-10 21:00:00', 82, 'Este conteúdo apresenta a independência dos estados unidos e revolução francesa. A queda do Absolutismo e a Declaração dos Direitos.

Objetivo da aula
Compreender os conceitos centrais de a independência dos estados unidos e revolução francesa e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(114, '[8º Ano Fund.] História - O Período Regencial e Revoltas no Brasil Império', 'Conflitos internos e instabilidade política no Brasil do século XIX.', 'https://www.youtube.com/watch?v=jAMnrrqGYcw', 'aula', '2026-11-10 21:00:00', 82, 'Este conteúdo apresenta o período regencial e revoltas no brasil império. Conflitos internos e instabilidade política no Brasil do século XIX.

Objetivo da aula
Compreender os conceitos centrais de o período regencial e revoltas no brasil império e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(115, '[8º Ano Fund.] Geografia - Globalização e Blocos Econômicos no Mundo', 'A divisão internacional do trabalho e trocas comerciais.', 'https://www.youtube.com/watch?v=9E8ajFP0Iq0', 'aula', '2026-11-10 21:00:00', 83, 'Este conteúdo apresenta globalização e blocos econômicos no mundo. A divisão internacional do trabalho e trocas comerciais.

Objetivo da aula
Compreender os conceitos centrais de globalização e blocos econômicos no mundo e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(116, '[8º Ano Fund.] Geografia - A América Latina: Economia e Desigualdade', 'Aspectos físicos, históricos e socioeconômicos do subcontinente.', 'https://www.youtube.com/watch?v=nrzFMOq1k-w', 'aula', '2026-11-10 21:00:00', 83, 'Este conteúdo apresenta a américa latina: economia e desigualdade. Aspectos físicos, históricos e socioeconômicos do subcontinente.

Objetivo da aula
Compreender os conceitos centrais de a américa latina: economia e desigualdade e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(117, '[8º Ano Fund.] Geografia - Os Tigres Asiáticos e a Economia do Pacífico', 'O rápido crescimento industrial de países como Coreia do Sul e Taiwan.', 'https://www.youtube.com/live/YvH0XoPyANA', 'aula', '2026-11-10 21:00:00', 83, 'Este conteúdo apresenta os tigres asiáticos e a economia do pacífico. O rápido crescimento industrial de países como Coreia do Sul e Taiwan.

Objetivo da aula
Compreender os conceitos centrais de os tigres asiáticos e a economia do pacífico e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(118, '[8º Ano Fund.] Ciências - Sistema Nervoso e Órgãos dos Sentidos', 'O papel do cérebro, neurônios e reflexos corporais.', 'https://www.youtube.com/watch?v=6H_8eFmx-g0', 'aula', '2026-11-10 21:00:00', 84, 'Este conteúdo apresenta sistema nervoso e órgãos dos sentidos. O papel do cérebro, neurônios e reflexos corporais.

Objetivo da aula
Compreender os conceitos centrais de sistema nervoso e órgãos dos sentidos e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(119, '[8º Ano Fund.] Ciências - Reprodução Humana e Educação Sexual', 'Sistema reprodutor e transformações na puberdade.', 'https://www.youtube.com/watch?v=bMwEgGaB1ZQ', 'aula', '2026-11-10 21:00:00', 84, 'Este conteúdo apresenta reprodução humana e educação sexual. Sistema reprodutor e transformações na puberdade.

Objetivo da aula
Compreender os conceitos centrais de reprodução humana e educação sexual e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(120, '[8º Ano Fund.] Ciências - Eletricidade e Circuitos Elétricos', 'Corrente elétrica, condutores, isolantes e consumo residencial.', 'https://www.youtube.com/watch?v=7kluWpnlVPU', 'aula', '2026-11-10 21:00:00', 84, 'Este conteúdo apresenta eletricidade e circuitos elétricos. Corrente elétrica, condutores, isolantes e consumo residencial.

Objetivo da aula
Compreender os conceitos centrais de eletricidade e circuitos elétricos e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),

-- 9º ANO ENSINO FUNDAMENTAL (3 conteúdos por matéria)
(121, '[9º Ano Fund.] Matemática - Equação do 2º Grau (Fórmula de Bhaskara)', 'Resolução de equações quadráticas completas e incompletas.', 'https://www.youtube.com/watch?v=8v_w8itTslc', 'aula', '2026-11-10 21:00:00', 85, 'Este conteúdo apresenta equação do 2º grau (fórmula de bhaskara). Resolução de equações quadráticas completas e incompletas.

Objetivo da aula
Compreender os conceitos centrais de equação do 2º grau (fórmula de bhaskara) e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(122, '[9º Ano Fund.] Matemática - Razões Trigonométricas no Triângulo Retângulo', 'Seno, cosseno e tangente aplicados a problemas geométricos.', 'https://www.youtube.com/watch?v=MSZdhDBoXe0', 'aula', '2026-11-10 21:00:00', 85, 'Este conteúdo apresenta razões trigonométricas no triângulo retângulo. Seno, cosseno e tangente aplicados a problemas geométricos.

Objetivo da aula
Compreender os conceitos centrais de razões trigonométricas no triângulo retângulo e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(123, '[9º Ano Fund.] Matemática - Funções: Introdução e Gráficos', 'O conceito de função e representação no plano cartesiano.', 'https://www.youtube.com/watch?v=LxuTxkHAXeQ', 'aula', '2026-11-10 21:00:00', 85, 'Este conteúdo apresenta funções: introdução e gráficos. O conceito de função e representação no plano cartesiano.

Objetivo da aula
Compreender os conceitos centrais de funções: introdução e gráficos e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(124, '[9º Ano Fund.] Português - Orações Subordinadas e Coesão Avançada', 'Estruturação de períodos compostos por subordinação.', 'https://www.youtube.com/watch?v=TuBKsV3lSQc', 'aula', '2026-11-10 21:00:00', 86, 'Este conteúdo apresenta orações subordinadas e coesão avançada. Estruturação de períodos compostos por subordinação.

Objetivo da aula
Compreender os conceitos centrais de orações subordinadas e coesão avançada e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(125, '[9º Ano Fund.] Português - Sintaxe de Regência e Crase', 'Regras avançadas de regência verbal/nominal e uso do acento indicativo de crase.', 'https://www.youtube.com/watch?v=LMaE0gAsI04', 'aula', '2026-11-10 21:00:00', 86, 'Este conteúdo apresenta sintaxe de regência e crase. Regras avançadas de regência verbal/nominal e uso do acento indicativo de crase.

Objetivo da aula
Compreender os conceitos centrais de sintaxe de regência e crase e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(126, '[9º Ano Fund.] Português - O Artigo de Opinião e Texto Argumentativo', 'Como estruturar argumentos sólidos em textos opinativos.', 'https://www.youtube.com/watch?v=X61lboe5_pM', 'aula', '2026-11-10 21:00:00', 86, 'Este conteúdo apresenta o artigo de opinião e texto argumentativo. Como estruturar argumentos sólidos em textos opinativos.

Objetivo da aula
Compreender os conceitos centrais de o artigo de opinião e texto argumentativo e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(127, '[9º Ano Fund.] História - A Era Vargas e os Movimentos do Século XX', 'O cenário político do Brasil entre 1930 e 1945.', 'https://www.youtube.com/watch?v=6wA_1C8hg-M', 'aula', '2026-11-10 21:00:00', 87, 'Este conteúdo apresenta a era vargas e os movimentos do século xx. O cenário político do Brasil entre 1930 e 1945.

Objetivo da aula
Compreender os conceitos centrais de a era vargas e os movimentos do século xx e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(128, '[9º Ano Fund.] História - As Guerras Mundiais e o Período Entre-Guerras', 'O impacto geopolítico da Primeira e Segunda Guerra Mundial.', 'https://www.youtube.com/watch?v=AGKX8fGF-D8', 'aula', '2026-11-10 21:00:00', 87, 'Este conteúdo apresenta as guerras mundiais e o período entre-guerras. O impacto geopolítico da Primeira e Segunda Guerra Mundial.

Objetivo da aula
Compreender os conceitos centrais de as guerras mundiais e o período entre-guerras e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(129, '[9º Ano Fund.] História - A Ditadura Militar no Brasil e a Redemocratização', 'O golpe de 1964, resistência e a Constituinte de 1988.', 'https://www.youtube.com/watch?v=jAMnrrqGYcw', 'aula', '2026-11-10 21:00:00', 87, 'Este conteúdo apresenta a ditadura militar no brasil e a redemocratização. O golpe de 1964, resistência e a Constituinte de 1988.

Objetivo da aula
Compreender os conceitos centrais de a ditadura militar no brasil e a redemocratização e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(130, '[9º Ano Fund.] Geografia - Geopolítica e Conflitos Internacionais', 'A nova ordem mundial após a Guerra Fria.', 'https://www.youtube.com/watch?v=nrzFMOq1k-w', 'aula', '2026-11-10 21:00:00', 88, 'Este conteúdo apresenta geopolítica e conflitos internacionais. A nova ordem mundial após a Guerra Fria.

Objetivo da aula
Compreender os conceitos centrais de geopolítica e conflitos internacionais e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(131, '[9º Ano Fund.] Geografia - A Europa e a União Europeia', 'Integração regional, economia e desafios demográficos do continente europeu.', 'https://www.youtube.com/watch?v=9E8ajFP0Iq0', 'aula', '2026-11-10 21:00:00', 88, 'Este conteúdo apresenta a europa e a união europeia. Integração regional, economia e desafios demográficos do continente europeu.

Objetivo da aula
Compreender os conceitos centrais de a europa e a união europeia e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(132, '[9º Ano Fund.] Geografia - Os Países Emergentes: BRICS', 'O papel geopolítico e econômico do Brasil, Rússia, Índia, China e África do Sul.', 'https://www.youtube.com/live/YvH0XoPyANA', 'aula', '2026-11-10 21:00:00', 88, 'Este conteúdo apresenta os países emergentes: brics. O papel geopolítico e econômico do Brasil, Rússia, Índia, China e África do Sul.

Objetivo da aula
Compreender os conceitos centrais de os países emergentes: brics e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(133, '[9º Ano Fund.] Ciências/Biologia - Genética e Leis de Mendel', 'Noções básicas de hereditariedade e DNA.', 'https://www.youtube.com/watch?v=bMwEgGaB1ZQ', 'aula', '2026-11-10 21:00:00', 89, 'Este conteúdo apresenta genética e leis de mendel. Noções básicas de hereditariedade e DNA.

Objetivo da aula
Compreender os conceitos centrais de genética e leis de mendel e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(134, '[9º Ano Fund.] Ciências - Átomos, Elementos Químicos e Tabela Periódica', 'Introdução à química: prótons, nêutrons e elétrons.', 'https://www.youtube.com/watch?v=7kluWpnlVPU', 'aula', '2026-11-10 21:00:00', 89, 'Este conteúdo apresenta átomos, elementos químicos e tabela periódica. Introdução à química: prótons, nêutrons e elétrons.

Objetivo da aula
Compreender os conceitos centrais de átomos, elementos químicos e tabela periódica e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(135, '[9º Ano Fund.] Ciências - Ondas, Luz e Som na Física Moderna', 'Espectro eletromagnético, reflexão e refração.', 'https://www.youtube.com/watch?v=6H_8eFmx-g0', 'aula', '2026-11-10 21:00:00', 89, 'Este conteúdo apresenta ondas, luz e som na física moderna. Espectro eletromagnético, reflexão e refração.

Objetivo da aula
Compreender os conceitos centrais de ondas, luz e som na física moderna e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),

-- 1º ANO (Ensino Médio)
(136, '[1º Ano] Matemática - Teoria dos Conjuntos e Conjuntos Numéricos', 'Operações entre conjuntos e subconjuntos numéricos.', 'https://www.youtube.com/watch?v=F5GGs1Rpt7I', 'aula', '2026-10-14 13:38:52', 1, 'Este conteúdo apresenta teoria dos conjuntos e conjuntos numéricos. Operações entre conjuntos e subconjuntos numéricos.

Objetivo da aula
Compreender os conceitos centrais de teoria dos conjuntos e conjuntos numéricos e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(137, '[1º Ano] Matemática - Função do 1º Grau (Afim)', 'Gráfico, raiz e aplicações práticas da função afim.', 'https://www.youtube.com/watch?v=LxuTxkHAXeQ', 'aula', '2026-10-14 13:38:52', 1, 'Este conteúdo apresenta função do 1º grau (afim). Gráfico, raiz e aplicações práticas da função afim.

Objetivo da aula
Compreender os conceitos centrais de função do 1º grau (afim) e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(138, '[1º Ano] Matemática - Função do 2º Grau (Quadrática)', 'Vértice da parábola, pontos máximos e mínimos.', 'https://www.youtube.com/watch?v=8v_w8itTslc', 'aula', '2026-10-14 13:38:52', 1, 'Este conteúdo apresenta função do 2º grau (quadrática). Vértice da parábola, pontos máximos e mínimos.

Objetivo da aula
Compreender os conceitos centrais de função do 2º grau (quadrática) e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(139, '[1º Ano] Português - Funções da Linguagem e Comunicação', 'Os elementos da comunicação e as funções da linguagem.', 'https://www.youtube.com/watch?v=LMaE0gAsI04', 'aula', '2026-10-14 13:38:52', 2, 'Este conteúdo apresenta funções da linguagem e comunicação. Os elementos da comunicação e as funções da linguagem.

Objetivo da aula
Compreender os conceitos centrais de funções da linguagem e comunicação e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(140, '[1º Ano] Português - Trovadorismo e Humanismo', 'As origens da literatura em língua portuguesa.', 'https://www.youtube.com/watch?v=X61lboe5_pM', 'aula', '2026-10-14 13:38:52', 2, 'Este conteúdo apresenta trovadorismo e humanismo. As origens da literatura em língua portuguesa.

Objetivo da aula
Compreender os conceitos centrais de trovadorismo e humanismo e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(141, '[1º Ano] Português - Quinhentismo no Brasil', 'A literatura de informação e os primeiros cronistas.', 'https://www.youtube.com/watch?v=XsN0e_xPyNI', 'aula', '2026-10-14 13:38:52', 2, 'Este conteúdo apresenta quinhentismo no brasil. A literatura de informação e os primeiros cronistas.

Objetivo da aula
Compreender os conceitos centrais de quinhentismo no brasil e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(142, '[1º Ano] História - O Surgimento do Homem e do Estado', 'Introdução às primeiras civilizações e formação do Estado.', 'https://www.youtube.com/watch?v=6iwkrRpb03A', 'aula', '2026-10-14 13:38:52', 3, 'Este conteúdo apresenta o surgimento do homem e do estado. Introdução às primeiras civilizações e formação do Estado.

Objetivo da aula
Compreender os conceitos centrais de o surgimento do homem e do estado e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(143, '[1º Ano] História - Egito Antigo e Antiguidade Oriental', 'Características políticas, sociais e culturais do Egito Antigo.', 'https://www.youtube.com/watch?v=VOzIQK4m0k8', 'aula', '2026-10-14 13:38:52', 3, 'Este conteúdo apresenta egito antigo e antiguidade oriental. Características políticas, sociais e culturais do Egito Antigo.

Objetivo da aula
Compreender os conceitos centrais de egito antigo e antiguidade oriental e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(144, '[1º Ano] História - Introdução aos Estudos Históricos', 'Compreensão do papel do historiador e das fontes históricas.', 'https://www.youtube.com/watch?v=jAMnrrqGYcw', 'aula', '2026-10-14 13:38:52', 3, 'Este conteúdo apresenta introdução aos estudos históricos. Compreensão do papel do historiador e das fontes históricas.

Objetivo da aula
Compreender os conceitos centrais de introdução aos estudos históricos e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(145, '[1º Ano] Química - Introdução à Matéria e Modelos Atômicos', 'Evolução dos modelos de Dalton, Thomson, Rutherford e Bohr.', 'https://www.youtube.com/watch?v=7kluWpnlVPU', 'aula', '2026-10-14 13:38:52', 4, 'Este conteúdo apresenta introdução à matéria e modelos atômicos. Evolução dos modelos de Dalton, Thomson, Rutherford e Bohr.

Objetivo da aula
Compreender os conceitos centrais de introdução à matéria e modelos atômicos e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(146, '[1º Ano] Química - Tabela Periódica e Ligações Químicas', 'Propriedades periódicas e ligações químicas.', 'https://www.youtube.com/live/7Ad9IHTXmw0', 'aula', '2026-10-14 13:38:52', 4, 'Este conteúdo apresenta tabela periódica e ligações químicas. Propriedades periódicas e ligações químicas.

Objetivo da aula
Compreender os conceitos centrais de tabela periódica e ligações químicas e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(147, '[1º Ano] Química - Funções Inorgânicas', 'Identificação e nomenclatura de ácidos, bases, sais e óxidos.', 'https://www.youtube.com/live/qfBCDMX3Yy4', 'aula', '2026-10-14 13:38:52', 4, 'Este conteúdo apresenta funções inorgânicas. Identificação e nomenclatura de ácidos, bases, sais e óxidos.

Objetivo da aula
Compreender os conceitos centrais de funções inorgânicas e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(148, '[1º Ano] Biologia - Introdução à Bioquímica Celular', 'Composição química da célula e substâncias orgânicas.', 'https://www.youtube.com/watch?v=bMwEgGaB1ZQ', 'aula', '2026-10-14 13:38:52', 5, 'Este conteúdo apresenta introdução à bioquímica celular. Composição química da célula e substâncias orgânicas.

Objetivo da aula
Compreender os conceitos centrais de introdução à bioquímica celular e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(149, '[1º Ano] Biologia - Estrutura Celular e Organelas', 'Estudo detalhado das membranas e organelas celulares.', 'https://www.youtube.com/watch?v=6H_8eFmx-g0', 'aula', '2026-10-14 13:38:52', 5, 'Este conteúdo apresenta estrutura celular e organelas. Estudo detalhado das membranas e organelas celulares.

Objetivo da aula
Compreender os conceitos centrais de estrutura celular e organelas e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(150, '[1º Ano] Biologia - Divisão Celular (Mitose e Meiose)', 'Como ocorre a duplicação e formação de células reprodutivas.', 'https://www.youtube.com/watch?v=Ijb2CVy_-y0', 'aula', '2026-10-14 13:38:52', 5, 'Este conteúdo apresenta divisão celular (mitose e meiose). Como ocorre a duplicação e formação de células reprodutivas.

Objetivo da aula
Compreender os conceitos centrais de divisão celular (mitose e meiose) e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(151, '[1º Ano] Física - Cinemática: Movimento Uniforme', 'Velocidade escalar média, aceleração e equações horárias.', 'https://www.youtube.com/watch?v=5eid5-U3Dvw', 'aula', '2026-10-14 13:38:52', 6, 'Este conteúdo apresenta cinemática: movimento uniforme. Velocidade escalar média, aceleração e equações horárias.

Objetivo da aula
Compreender os conceitos centrais de cinemática: movimento uniforme e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(152, '[1º Ano] Física - Leis de Newton e Dinâmica', 'Aplicações das leis de Newton, força peso, normal e atrito.', 'https://www.youtube.com/watch?v=hxciSW_B8Hw', 'aula', '2026-10-14 13:38:52', 6, 'Este conteúdo apresenta leis de newton e dinâmica. Aplicações das leis de Newton, força peso, normal e atrito.

Objetivo da aula
Compreender os conceitos centrais de leis de newton e dinâmica e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(153, '[1º Ano] Física - Trabalho, Potência e Energia Mecânica', 'Conservação de energia mecânica e trabalho.', 'https://www.youtube.com/watch?v=Sj3sCRwMc0Q', 'aula', '2026-10-14 13:38:52', 6, 'Este conteúdo apresenta trabalho, potência e energia mecânica. Conservação de energia mecânica e trabalho.

Objetivo da aula
Compreender os conceitos centrais de trabalho, potência e energia mecânica e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(154, '[1º Ano] Geografia - Conceitos Básicos de Espaço Geográfico', 'Entendimento das categorias: espaço, paisagem e território.', 'https://www.youtube.com/watch?v=9E8ajFP0Iq0', 'aula', '2026-10-14 13:38:52', 7, 'Este conteúdo apresenta conceitos básicos de espaço geográfico. Entendimento das categorias: espaço, paisagem e território.

Objetivo da aula
Compreender os conceitos centrais de conceitos básicos de espaço geográfico e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(155, '[1º Ano] Geografia - Cartografia e Fuso Horário', 'Leitura de mapas e coordenadas geográficas.', 'https://www.youtube.com/watch?v=nrzFMOq1k-w', 'aula', '2026-10-14 13:38:52', 7, 'Este conteúdo apresenta cartografia e fuso horário. Leitura de mapas e coordenadas geográficas.

Objetivo da aula
Compreender os conceitos centrais de cartografia e fuso horário e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(156, '[1º Ano] Geografia - Geomorfologia e Relevo Terrestre', 'Agentes internos e externos formadores do relevo da Terra.', 'https://www.youtube.com/live/YvH0XoPyANA', 'aula', '2026-10-14 13:38:52', 7, 'Este conteúdo apresenta geomorfologia e relevo terrestre. Agentes internos e externos formadores do relevo da Terra.

Objetivo da aula
Compreender os conceitos centrais de geomorfologia e relevo terrestre e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(157, '[1º Ano] Inglês - Estratégias de Leitura e Interpretação de Textos', 'Dicas para interpretação rápida em vestibulares.', 'https://www.youtube.com/watch?v=F5GGs1Rpt7I', 'aula', '2026-10-14 13:38:52', 8, 'Este conteúdo apresenta estratégias de leitura e interpretação de textos. Dicas para interpretação rápida em vestibulares.

Objetivo da aula
Compreender os conceitos centrais de estratégias de leitura e interpretação de textos e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(158, '[1º Ano] Inglês - Simple Present e Simple Past', 'Revisão dos tempos verbais fundamentais.', 'https://www.youtube.com/watch?v=LxuTxkHAXeQ', 'aula', '2026-10-14 13:38:52', 8, 'Este conteúdo apresenta simple present e simple past. Revisão dos tempos verbais fundamentais.

Objetivo da aula
Compreender os conceitos centrais de simple present e simple past e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(159, '[1º Ano] Inglês - Falsos Cognatos (False Friends)', 'Palavras parecidas em inglês e português que mudam o sentido.', 'https://www.youtube.com/watch?v=8v_w8itTslc', 'aula', '2026-10-14 13:38:52', 8, 'Este conteúdo apresenta falsos cognatos (false friends). Palavras parecidas em inglês e português que mudam o sentido.

Objetivo da aula
Compreender os conceitos centrais de falsos cognatos (false friends) e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(160, '[1º Ano] Sociologia - O que é Sociologia e o Olhar Sociológico', 'A origem da Sociologia no contexto da Revolução Industrial.', 'https://www.youtube.com/watch?v=u0C3F1Fq32E', 'aula', '2026-10-14 13:38:52', 9, 'Este conteúdo apresenta o que é sociologia e o olhar sociológico. A origem da Sociologia no contexto da Revolução Industrial.

Objetivo da aula
Compreender os conceitos centrais de o que é sociologia e o olhar sociológico e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(161, '[1º Ano] Sociologia - Socialização e Instituições Sociais', 'O papel da família, escola e estado.', 'https://www.youtube.com/live/u4ZREcGwkF4', 'aula', '2026-10-14 13:38:52', 9, 'Este conteúdo apresenta socialização e instituições sociais. O papel da família, escola e estado.

Objetivo da aula
Compreender os conceitos centrais de socialização e instituições sociais e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(162, '[1º Ano] Sociologia - Cultura e Etnocentrismo', 'Diversidade cultural e relativismo cultural.', 'https://www.youtube.com/live/oxApmqaXlsM', 'aula', '2026-10-14 13:38:52', 9, 'Este conteúdo apresenta cultura e etnocentrismo. Diversidade cultural e relativismo cultural.

Objetivo da aula
Compreender os conceitos centrais de cultura e etnocentrismo e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(163, '[1º Ano] Filosofia - Origem da Filosofia e o Mito ao Logos', 'O surgimento da racionalidade grega na polis.', 'https://www.youtube.com/watch?v=UK6OKSsastQ', 'aula', '2026-10-14 13:38:52', 10, 'Este conteúdo apresenta origem da filosofia e o mito ao logos. O surgimento da racionalidade grega na polis.

Objetivo da aula
Compreender os conceitos centrais de origem da filosofia e o mito ao logos e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(164, '[1º Ano] Filosofia - Filosofia Pré-Socrática', 'A busca pela arché com Tales, Heráclito e Parmênides.', 'https://www.youtube.com/watch?v=Y9_UovLgduo', 'aula', '2026-10-14 13:38:52', 10, 'Este conteúdo apresenta filosofia pré-socrática. A busca pela arché com Tales, Heráclito e Parmênides.

Objetivo da aula
Compreender os conceitos centrais de filosofia pré-socrática e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(165, '[1º Ano] Filosofia - Sócrates e os Sofistas', 'O método socrático frente ao relativismo dos sofistas.', 'https://www.youtube.com/live/ZmKPQuJAq3s', 'aula', '2026-10-14 13:38:52', 10, 'Este conteúdo apresenta sócrates e os sofistas. O método socrático frente ao relativismo dos sofistas.

Objetivo da aula
Compreender os conceitos centrais de sócrates e os sofistas e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(166, '[1º Ano] Redação - Estrutura da Dissertação-Argumentativa', 'Introdução, desenvolvimento e conclusão no modelo ENEM.', 'https://www.youtube.com/watch?v=VRQtqA3Fbeo', 'aula', '2026-10-14 13:38:52', 11, 'Este conteúdo apresenta estrutura da dissertação-argumentativa. Introdução, desenvolvimento e conclusão no modelo ENEM.

Objetivo da aula
Compreender os conceitos centrais de estrutura da dissertação-argumentativa e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(167, '[1º Ano] Redação - Como Construir uma Boa Tese', 'Apresentação do ponto de vista no primeiro parágrafo.', 'https://www.youtube.com/watch?v=MeKHJVPNV30', 'aula', '2026-10-14 13:38:52', 11, 'Este conteúdo apresenta como construir uma boa tese. Apresentação do ponto de vista no primeiro parágrafo.

Objetivo da aula
Compreender os conceitos centrais de como construir uma boa tese e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(168, '[1º Ano] Redação - Coesão e Coerência Textual', 'Uso adequado de conectivos textuais.', 'https://www.youtube.com/watch?v=TuBKsV3lSQc', 'aula', '2026-10-14 13:38:52', 11, 'Este conteúdo apresenta coesão e coerência textual. Uso adequado de conectivos textuais.

Objetivo da aula
Compreender os conceitos centrais de coesão e coerência textual e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),

-- 2º ANO (Ensino Médio)
(169, '[2º Ano] Matemática - Trigonometria no Triângulo Retângulo', 'Seno, cosseno e tangente aplicados.', 'https://www.youtube.com/watch?v=MSZdhDBoXe0', 'aula', '2026-10-14 13:38:52', 12, 'Este conteúdo apresenta trigonometria no triângulo retângulo. Seno, cosseno e tangente aplicados.

Objetivo da aula
Compreender os conceitos centrais de trigonometria no triângulo retângulo e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(170, '[2º Ano] Matemática - Geometria Plana: Áreas e Perímetros', 'Cálculo de áreas de polígonos e círculos.', 'https://www.youtube.com/watch?v=ddZHkCUcYRM', 'aula', '2026-10-14 13:38:52', 12, 'Este conteúdo apresenta geometria plana: áreas e perímetros. Cálculo de áreas de polígonos e círculos.

Objetivo da aula
Compreender os conceitos centrais de geometria plana: áreas e perímetros e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(171, '[2º Ano] Matemática - Matrizes e Determinantes', 'Operações fundamentais com matrizes.', 'https://www.youtube.com/watch?v=0HXlohthSoY', 'aula', '2026-10-14 13:38:52', 12, 'Este conteúdo apresenta matrizes e determinantes. Operações fundamentais com matrizes.

Objetivo da aula
Compreender os conceitos centrais de matrizes e determinantes e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(172, '[2º Ano] Português - Sintaxe: Sujeito e Predicado', 'A estrutura da oração e termos essenciais.', 'https://www.youtube.com/watch?v=LMaE0gAsI04', 'aula', '2026-10-14 13:38:52', 13, 'Este conteúdo apresenta sintaxe: sujeito e predicado. A estrutura da oração e termos essenciais.

Objetivo da aula
Compreender os conceitos centrais de sintaxe: sujeito e predicado e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(173, '[2º Ano] Português - Barroco e Arcadismo', 'Movimentos literários coloniais e suas características.', 'https://www.youtube.com/watch?v=X61lboe5_pM', 'aula', '2026-10-14 13:38:52', 13, 'Este conteúdo apresenta barroco e arcadismo. Movimentos literários coloniais e suas características.

Objetivo da aula
Compreender os conceitos centrais de barroco e arcadismo e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(174, '[2º Ano] Português - Romantismo: Poesia e Prosa', 'As gerações românticas no Brasil.', 'https://www.youtube.com/watch?v=XsN0e_xPyNI', 'aula', '2026-10-14 13:38:52', 13, 'Este conteúdo apresenta romantismo: poesia e prosa. As gerações românticas no Brasil.

Objetivo da aula
Compreender os conceitos centrais de romantismo: poesia e prosa e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(175, '[2º Ano] História - Mercantilismo e Expansão Marítima', 'Análise das grandes navegações europeias.', 'https://www.youtube.com/watch?v=6kytaR8VhBY', 'aula', '2026-10-14 13:38:52', 14, 'Este conteúdo apresenta mercantilismo e expansão marítima. Análise das grandes navegações europeias.

Objetivo da aula
Compreender os conceitos centrais de mercantilismo e expansão marítima e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(176, '[2º Ano] História - Colonização da América Portuguesa', 'A estrutura do Brasil Colônia e economia açucareira.', 'https://www.youtube.com/watch?v=MfahAxGnSQo', 'aula', '2026-10-14 13:38:52', 14, 'Este conteúdo apresenta colonização da américa portuguesa. A estrutura do Brasil Colônia e economia açucareira.

Objetivo da aula
Compreender os conceitos centrais de colonização da américa portuguesa e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(177, '[2º Ano] História - Independência dos EUA e Iluminismo', 'As bases filosóficas e o processo de independência americana.', 'https://www.youtube.com/watch?v=AGKX8fGF-D8', 'aula', '2026-10-14 13:38:52', 14, 'Este conteúdo apresenta independência dos eua e iluminismo. As bases filosóficas e o processo de independência americana.

Objetivo da aula
Compreender os conceitos centrais de independência dos eua e iluminismo e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(178, '[2º Ano] Química - Soluções e Concentrações Químicas', 'Molaridade, títulos e diluição de soluções.', 'https://www.youtube.com/watch?v=7kluWpnlVPU', 'aula', '2026-10-14 13:38:52', 15, 'Este conteúdo apresenta soluções e concentrações químicas. Molaridade, títulos e diluição de soluções.

Objetivo da aula
Compreender os conceitos centrais de soluções e concentrações químicas e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(179, '[2º Ano] Química - Termoquímica', 'Cálculo de variação de entalpia nas reações.', 'https://www.youtube.com/live/7Ad9IHTXmw0', 'aula', '2026-10-14 13:38:52', 15, 'Este conteúdo apresenta termoquímica. Cálculo de variação de entalpia nas reações.

Objetivo da aula
Compreender os conceitos centrais de termoquímica e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(180, '[2º Ano] Química - Cinética e Equilíbrio Químico', 'Velocidade das reações e constante de equilíbrio.', 'https://www.youtube.com/live/qfBCDMX3Yy4', 'aula', '2026-10-14 13:38:52', 15, 'Este conteúdo apresenta cinética e equilíbrio químico. Velocidade das reações e constante de equilíbrio.

Objetivo da aula
Compreender os conceitos centrais de cinética e equilíbrio químico e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(181, '[2º Ano] Biologia - Reinos dos Seres Vivos e Vírus', 'Classificação biológica e vírus.', 'https://www.youtube.com/watch?v=bMwEgGaB1ZQ', 'aula', '2026-10-14 13:38:52', 16, 'Este conteúdo apresenta reinos dos seres vivos e vírus. Classificação biológica e vírus.

Objetivo da aula
Compreender os conceitos centrais de reinos dos seres vivos e vírus e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(182, '[2º Ano] Biologia - Introdução à Botânica e Plantas', 'Anatomia e grupos vegetais.', 'https://www.youtube.com/watch?v=6H_8eFmx-g0', 'aula', '2026-10-14 13:38:52', 16, 'Este conteúdo apresenta introdução à botânica e plantas. Anatomia e grupos vegetais.

Objetivo da aula
Compreender os conceitos centrais de introdução à botânica e plantas e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(183, '[2º Ano] Biologia - Zoologia dos Invertebrados e Vertebrados', 'Características gerais dos filos animais.', 'https://www.youtube.com/watch?v=Ijb2CVy_-y0', 'aula', '2026-10-14 13:38:52', 16, 'Este conteúdo apresenta zoologia dos invertebrados e vertebrados. Características gerais dos filos animais.

Objetivo da aula
Compreender os conceitos centrais de zoologia dos invertebrados e vertebrados e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(184, '[2º Ano] Física - Termologia e Calorimetria', 'Escalas termométricas e trocas de calor.', 'https://www.youtube.com/watch?v=5eid5-U3Dvw', 'aula', '2026-10-14 13:38:52', 17, 'Este conteúdo apresenta termologia e calorimetria. Escalas termométricas e trocas de calor.

Objetivo da aula
Compreender os conceitos centrais de termologia e calorimetria e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(185, '[2º Ano] Física - Óptica Geométrica e Espelhos', 'Reflexão da luz e espelhos planos/esféricos.', 'https://www.youtube.com/watch?v=hxciSW_B8Hw', 'aula', '2026-10-14 13:38:52', 17, 'Este conteúdo apresenta óptica geométrica e espelhos. Reflexão da luz e espelhos planos/esféricos.

Objetivo da aula
Compreender os conceitos centrais de óptica geométrica e espelhos e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(186, '[2º Ano] Física - Ondulatória', 'Características das ondas e fenômenos ondulatórios.', 'https://www.youtube.com/watch?v=Sj3sCRwMc0Q', 'aula', '2026-10-14 13:38:52', 17, 'Este conteúdo apresenta ondulatória. Características das ondas e fenômenos ondulatórios.

Objetivo da aula
Compreender os conceitos centrais de ondulatória e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(187, '[2º Ano] Geografia - Demografia e Dinâmica Populacional', 'Crescimento vegetativo e pirâmides etárias.', 'https://www.youtube.com/watch?v=9E8ajFP0Iq0', 'aula', '2026-10-14 13:38:52', 18, 'Este conteúdo apresenta demografia e dinâmica populacional. Crescimento vegetativo e pirâmides etárias.

Objetivo da aula
Compreender os conceitos centrais de demografia e dinâmica populacional e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(188, '[2º Ano] Geografia - Processo de Urbanização', 'A formação das metrópoles e problemas urbanos.', 'https://www.youtube.com/watch?v=nrzFMOq1k-w', 'aula', '2026-10-14 13:38:52', 18, 'Este conteúdo apresenta processo de urbanização. A formação das metrópoles e problemas urbanos.

Objetivo da aula
Compreender os conceitos centrais de processo de urbanização e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(189, '[2º Ano] Geografia - Espaço Agrário e Agronegócio', 'Estrutura fundiária e modernização do campo.', 'https://www.youtube.com/live/YvH0XoPyANA', 'aula', '2026-10-14 13:38:52', 18, 'Este conteúdo apresenta espaço agrário e agronegócio. Estrutura fundiária e modernização do campo.

Objetivo da aula
Compreender os conceitos centrais de espaço agrário e agronegócio e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(190, '[2º Ano] Inglês - Future Tenses (Futuro em Inglês)', 'Uso de will, going to e present continuous para o futuro.', 'https://www.youtube.com/watch?v=F5GGs1Rpt7I', 'aula', '2026-10-14 13:38:52', 19, 'Este conteúdo apresenta future tenses (futuro em inglês). Uso de will, going to e present continuous para o futuro.

Objetivo da aula
Compreender os conceitos centrais de future tenses (futuro em inglês) e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(191, '[2º Ano] Inglês - Passive Voice (Voz Passiva)', 'Como transformar orações da voz ativa para a passiva.', 'https://www.youtube.com/watch?v=LxuTxkHAXeQ', 'aula', '2026-10-14 13:38:52', 19, 'Este conteúdo apresenta passive voice (voz passiva). Como transformar orações da voz ativa para a passiva.

Objetivo da aula
Compreender os conceitos centrais de passive voice (voz passiva) e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(192, '[2º Ano] Inglês - Relative Pronouns (Pronomes Relativos)', 'Uso de who, which, that, whose.', 'https://www.youtube.com/watch?v=8v_w8itTslc', 'aula', '2026-10-14 13:38:52', 19, 'Este conteúdo apresenta relative pronouns (pronomes relativos). Uso de who, which, that, whose.

Objetivo da aula
Compreender os conceitos centrais de relative pronouns (pronomes relativos) e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(193, '[2º Ano] Sociologia - Émile Durkheim e o Fato Social', 'Conceito de fato social e coesão social.', 'https://www.youtube.com/watch?v=u0C3F1Fq32E', 'aula', '2026-10-14 13:38:52', 20, 'Este conteúdo apresenta émile durkheim e o fato social. Conceito de fato social e coesão social.

Objetivo da aula
Compreender os conceitos centrais de émile durkheim e o fato social e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(194, '[2º Ano] Sociologia - Karl Marx e a Luta de Classes', 'Materialismo histórico e mais-valia.', 'https://www.youtube.com/live/u4ZREcGwkF4', 'aula', '2026-10-14 13:38:52', 20, 'Este conteúdo apresenta karl marx e a luta de classes. Materialismo histórico e mais-valia.

Objetivo da aula
Compreender os conceitos centrais de karl marx e a luta de classes e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(195, '[2º Ano] Sociologia - Max Weber e a Ação Social', 'Tipos de dominação e ação social.', 'https://www.youtube.com/live/oxApmqaXlsM', 'aula', '2026-10-14 13:38:52', 20, 'Este conteúdo apresenta max weber e a ação social. Tipos de dominação e ação social.

Objetivo da aula
Compreender os conceitos centrais de max weber e a ação social e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(196, '[2º Ano] Filosofia - Platão e o Mito da Caverna', 'A teoria das ideias e o dualismo platônico.', 'https://www.youtube.com/watch?v=UK6OKSsastQ', 'aula', '2026-10-14 13:38:52', 21, 'Este conteúdo apresenta platão e o mito da caverna. A teoria das ideias e o dualismo platônico.

Objetivo da aula
Compreender os conceitos centrais de platão e o mito da caverna e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(197, '[2º Ano] Filosofia - Aristóteles e a Ética', 'A virtude como justa medida.', 'https://www.youtube.com/watch?v=Y9_UovLgduo', 'aula', '2026-10-14 13:38:52', 21, 'Este conteúdo apresenta aristóteles e a ética. A virtude como justa medida.

Objetivo da aula
Compreender os conceitos centrais de aristóteles e a ética e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(198, '[2º Ano] Filosofia Medieval - Patrística e Escolástica', 'A relação entre fé e razão.', 'https://www.youtube.com/live/ZmKPQuJAq3s', 'aula', '2026-10-14 13:38:52', 21, 'Este conteúdo apresenta patrística e escolástica. A relação entre fé e razão.

Objetivo da aula
Compreender os conceitos centrais de patrística e escolástica e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(199, '[2º Ano] Redação - Tipos de Argumento e Projeto de Texto', 'Argumentos de autoridade e alusão histórica.', 'https://www.youtube.com/watch?v=VRQtqA3Fbeo', 'aula', '2026-10-14 13:38:52', 22, 'Este conteúdo apresenta tipos de argumento e projeto de texto. Argumentos de autoridade e alusão histórica.

Objetivo da aula
Compreender os conceitos centrais de tipos de argumento e projeto de texto e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(200, '[2º Ano] Redação - Uso de Repertório Sociocultural', 'Como inserir filósofos, filmes e dados no texto.', 'https://www.youtube.com/watch?v=MeKHJVPNV30', 'aula', '2026-10-14 13:38:52', 22, 'Este conteúdo apresenta uso de repertório sociocultural. Como inserir filósofos, filmes e dados no texto.

Objetivo da aula
Compreender os conceitos centrais de uso de repertório sociocultural e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(201, '[2º Ano] Redação - Evitando Marcas de Oralidade', 'Aprimoramento do vocabulário formal.', 'https://www.youtube.com/watch?v=TuBKsV3lSQc', 'aula', '2026-10-14 13:38:52', 22, 'Este conteúdo apresenta evitando marcas de oralidade. Aprimoramento do vocabulário formal.

Objetivo da aula
Compreender os conceitos centrais de evitando marcas de oralidade e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),

-- 3º ANO (Ensino Médio)
(202, '[3º Ano] Matemática - Geometria Espacial (Sólidos)', 'Cálculo de volume e área de prismas e cilindros.', 'https://www.youtube.com/watch?v=MSZdhDBoXe0', 'aula', '2026-10-14 13:38:52', 23, 'Este conteúdo apresenta geometria espacial (sólidos). Cálculo de volume e área de prismas e cilindros.

Objetivo da aula
Compreender os conceitos centrais de geometria espacial (sólidos) e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(203, '[3º Ano] Matemática - Análise Combinatória e Probabilidade', 'Arranjo, combinação e cálculo de probabilidades.', 'https://www.youtube.com/watch?v=ddZHkCUcYRM', 'aula', '2026-10-14 13:38:52', 23, 'Este conteúdo apresenta análise combinatória e probabilidade. Arranjo, combinação e cálculo de probabilidades.

Objetivo da aula
Compreender os conceitos centrais de análise combinatória e probabilidade e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(204, '[3º Ano] Matemática - Estatística Básica', 'Média, mediana, moda e desvio padrão.', 'https://www.youtube.com/watch?v=0HXlohthSoY', 'aula', '2026-10-14 13:38:52', 23, 'Este conteúdo apresenta estatística básica. Média, mediana, moda e desvio padrão.

Objetivo da aula
Compreender os conceitos centrais de estatística básica e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(205, '[3º Ano] Português - Realismo e Parnasianismo', 'A literatura crítica de Machado de Assis e o rigor formal.', 'https://www.youtube.com/watch?v=LMaE0gAsI04', 'aula', '2026-10-14 13:38:52', 24, 'Este conteúdo apresenta realismo e parnasianismo. A literatura crítica de Machado de Assis e o rigor formal.

Objetivo da aula
Compreender os conceitos centrais de realismo e parnasianismo e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(206, '[3º Ano] Português - Modernismo no Brasil', 'As fases do Modernismo brasileiro e suas características.', 'https://www.youtube.com/watch?v=X61lboe5_pM', 'aula', '2026-10-14 13:38:52', 24, 'Este conteúdo apresenta modernismo no brasil. As fases do Modernismo brasileiro e suas características.

Objetivo da aula
Compreender os conceitos centrais de modernismo no brasil e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(207, '[3º Ano] Português - Concordância e Regência', 'Regras avançadas cobradas no ENEM e vestibulares.', 'https://www.youtube.com/watch?v=XsN0e_xPyNI', 'aula', '2026-10-14 13:38:52', 24, 'Este conteúdo apresenta concordância e regência. Regras avançadas cobradas no ENEM e vestibulares.

Objetivo da aula
Compreender os conceitos centrais de concordância e regência e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(208, '[3º Ano] História - Brasil Império no Século XIX', 'Primeiro Reinado, Período Regencial e Segundo Reinado.', 'https://www.youtube.com/watch?v=6wA_1C8hg-M', 'aula', '2026-10-14 13:38:52', 25, 'Este conteúdo apresenta brasil império no século xix. Primeiro Reinado, Período Regencial e Segundo Reinado.

Objetivo da aula
Compreender os conceitos centrais de brasil império no século xix e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(209, '[3º Ano] História - Proclamação da República e Era Vargas', 'República Oligárquica e Era Vargas (1930-1945).', 'https://www.youtube.com/watch?v=AGKX8fGF-D8', 'aula', '2026-10-14 13:38:52', 25, 'Este conteúdo apresenta proclamação da república e era vargas. República Oligárquica e Era Vargas (1930-1945).

Objetivo da aula
Compreender os conceitos centrais de proclamação da república e era vargas e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(210, '[3º Ano] História - Guerra Fria e Redemocratização', 'O cenário geopolítico mundial e o Brasil contemporâneo.', 'https://www.youtube.com/watch?v=jAMnrrqGYcw', 'aula', '2026-10-14 13:38:52', 25, 'Este conteúdo apresenta guerra fria e redemocratização. O cenário geopolítico mundial e o Brasil contemporâneo.

Objetivo da aula
Compreender os conceitos centrais de guerra fria e redemocratização e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(211, '[3º Ano] Química - Introdução à Química Orgânica', 'Cadeias carbônicas e nomenclatura IUPAC.', 'https://www.youtube.com/watch?v=7kluWpnlVPU', 'aula', '2026-10-14 13:38:52', 26, 'Este conteúdo apresenta introdução à química orgânica. Cadeias carbônicas e nomenclatura IUPAC.

Objetivo da aula
Compreender os conceitos centrais de introdução à química orgânica e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(212, '[3º Ano] Química - Funções Orgânicas', 'Álcoois, cetonas, ésteres e ácidos carboxílicos.', 'https://www.youtube.com/live/7Ad9IHTXmw0', 'aula', '2026-10-14 13:38:52', 26, 'Este conteúdo apresenta funções orgânicas. Álcoois, cetonas, ésteres e ácidos carboxílicos.

Objetivo da aula
Compreender os conceitos centrais de funções orgânicas e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(213, '[3º Ano] Química - Isomeria e Reações Orgânicas', 'Tipos de isomeria plana e espacial.', 'https://www.youtube.com/live/qfBCDMX3Yy4', 'aula', '2026-10-14 13:38:52', 26, 'Este conteúdo apresenta isomeria e reações orgânicas. Tipos de isomeria plana e espacial.

Objetivo da aula
Compreender os conceitos centrais de isomeria e reações orgânicas e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(214, '[3º Ano] Biologia - Leis de Mendel e Genética', 'Herança genética, cruzamentos e heredogramas.', 'https://www.youtube.com/watch?v=bMwEgGaB1ZQ', 'aula', '2026-10-14 13:38:52', 27, 'Este conteúdo apresenta leis de mendel e genética. Herança genética, cruzamentos e heredogramas.

Objetivo da aula
Compreender os conceitos centrais de leis de mendel e genética e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(215, '[3º Ano] Biologia - Evolução e Seleção Natural', 'Darwinismo e neodarwinismo na evolução das espécies.', 'https://www.youtube.com/watch?v=6H_8eFmx-g0', 'aula', '2026-10-14 13:38:52', 27, 'Este conteúdo apresenta evolução e seleção natural. Darwinismo e neodarwinismo na evolução das espécies.

Objetivo da aula
Compreender os conceitos centrais de evolução e seleção natural e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(216, '[3º Ano] Biologia - Ecologia e Biomas', 'Relações ecológicas e fluxo de energia.', 'https://www.youtube.com/watch?v=Ijb2CVy_-y0', 'aula', '2026-10-14 13:38:52', 27, 'Este conteúdo apresenta ecologia e biomas. Relações ecológicas e fluxo de energia.

Objetivo da aula
Compreender os conceitos centrais de ecologia e biomas e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(217, '[3º Ano] Física - Eletrostática e Lei de Coulomb', 'Processos de eletrização e campo elétrico.', 'https://www.youtube.com/watch?v=5eid5-U3Dvw', 'aula', '2026-10-14 13:38:52', 28, 'Este conteúdo apresenta eletrostática e lei de coulomb. Processos de eletrização e campo elétrico.

Objetivo da aula
Compreender os conceitos centrais de eletrostática e lei de coulomb e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(218, '[3º Ano] Física - Eletrodinâmica e Circuitos', 'Leis de Ohm e potência em circuitos elétricos.', 'https://www.youtube.com/watch?v=hxciSW_B8Hw', 'aula', '2026-10-14 13:38:52', 28, 'Este conteúdo apresenta eletrodinâmica e circuitos. Leis de Ohm e potência em circuitos elétricos.

Objetivo da aula
Compreender os conceitos centrais de eletrodinâmica e circuitos e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(219, '[3º Ano] Física - Eletromagnetismo', 'Campo magnético e indução eletromagnética.', 'https://www.youtube.com/watch?v=Sj3sCRwMc0Q', 'aula', '2026-10-14 13:38:52', 28, 'Este conteúdo apresenta eletromagnetismo. Campo magnético e indução eletromagnética.

Objetivo da aula
Compreender os conceitos centrais de eletromagnetismo e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(220, '[3º Ano] Geografia - Globalização e Blocos Econômicos', 'A integração econômica mundial e divisão do trabalho.', 'https://www.youtube.com/watch?v=9E8ajFP0Iq0', 'aula', '2026-10-14 13:38:52', 29, 'Este conteúdo apresenta globalização e blocos econômicos. A integração econômica mundial e divisão do trabalho.

Objetivo da aula
Compreender os conceitos centrais de globalização e blocos econômicos e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(221, '[3º Ano] Geografia - Fontes de Energia e Meio Ambiente', 'Matriz energética e impactos ambientais globais.', 'https://www.youtube.com/watch?v=nrzFMOq1k-w', 'aula', '2026-10-14 13:38:52', 29, 'Este conteúdo apresenta fontes de energia e meio ambiente. Matriz energética e impactos ambientais globais.

Objetivo da aula
Compreender os conceitos centrais de fontes de energia e meio ambiente e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(222, '[3º Ano] Geografia - Geopolítica Mundial Contemporânea', 'Conflitos internacionais e multipolaridade.', 'https://www.youtube.com/live/YvH0XoPyANA', 'aula', '2026-10-14 13:38:52', 29, 'Este conteúdo apresenta geopolítica mundial contemporânea. Conflitos internacionais e multipolaridade.

Objetivo da aula
Compreender os conceitos centrais de geopolítica mundial contemporânea e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(223, '[3º Ano] Inglês - Reported Speech (Discurso Indireto)', 'Como relatar o que outra pessoa disse em inglês.', 'https://www.youtube.com/watch?v=F5GGs1Rpt7I', 'aula', '2026-10-14 13:38:52', 30, 'Este conteúdo apresenta reported speech (discurso indireto). Como relatar o que outra pessoa disse em inglês.

Objetivo da aula
Compreender os conceitos centrais de reported speech (discurso indireto) e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(224, '[3º Ano] Inglês - Conditionals (First, Second, Third)', 'Frases condicionais e hipóteses.', 'https://www.youtube.com/watch?v=LxuTxkHAXeQ', 'aula', '2026-10-14 13:38:52', 30, 'Este conteúdo apresenta conditionals (first, second, third). Frases condicionais e hipóteses.

Objetivo da aula
Compreender os conceitos centrais de conditionals (first, second, third) e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(225, '[3º Ano] Inglês - Connectors and Linking Words', 'Conectivos avançados para coesão textual em inglês.', 'https://www.youtube.com/watch?v=8v_w8itTslc', 'aula', '2026-10-14 13:38:52', 30, 'Este conteúdo apresenta connectors and linking words. Conectivos avançados para coesão textual em inglês.

Objetivo da aula
Compreender os conceitos centrais de connectors and linking words e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(226, '[3º Ano] Sociologia - Estado, Poder e Cidadania', 'Relações de poder e direitos civis/políticos.', 'https://www.youtube.com/watch?v=u0C3F1Fq32E', 'aula', '2026-10-14 13:38:52', 31, 'Este conteúdo apresenta estado, poder e cidadania. Relações de poder e direitos civis/políticos.

Objetivo da aula
Compreender os conceitos centrais de estado, poder e cidadania e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(227, '[3º Ano] Sociologia - Movimentos Sociais', 'A importância dos movimentos na transformação da sociedade.', 'https://www.youtube.com/live/u4ZREcGwkF4', 'aula', '2026-10-14 13:38:52', 31, 'Este conteúdo apresenta movimentos sociais. A importância dos movimentos na transformação da sociedade.

Objetivo da aula
Compreender os conceitos centrais de movimentos sociais e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(228, '[3º Ano] Sociologia - Desigualdade Social e Racismo Estrutural', 'Análise das disparidades sociais no Brasil.', 'https://www.youtube.com/live/oxApmqaXlsM', 'aula', '2026-10-14 13:38:52', 31, 'Este conteúdo apresenta desigualdade social e racismo estrutural. Análise das disparidades sociais no Brasil.

Objetivo da aula
Compreender os conceitos centrais de desigualdade social e racismo estrutural e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(229, '[3º Ano] Filosofia Política - Maquiavel e Contratualistas', 'Realismo político de Maquiavel, Hobbes, Locke e Rousseau.', 'https://www.youtube.com/watch?v=UK6OKSsastQ', 'aula', '2026-10-14 13:38:52', 32, 'Este conteúdo apresenta maquiavel e contratualistas. Realismo político de Maquiavel, Hobbes, Locke e Rousseau.

Objetivo da aula
Compreender os conceitos centrais de maquiavel e contratualistas e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(230, '[3º Ano] Filosofia - Racionalismo e Empirismo', 'Descartes e Hume na teoria do conhecimento.', 'https://www.youtube.com/watch?v=Y9_UovLgduo', 'aula', '2026-10-14 13:38:52', 32, 'Este conteúdo apresenta racionalismo e empirismo. Descartes e Hume na teoria do conhecimento.

Objetivo da aula
Compreender os conceitos centrais de racionalismo e empirismo e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(231, '[3º Ano] Filosofia - Escola de Frankfurt', 'A crítica à indústria cultural no século XX.', 'https://www.youtube.com/live/ZmKPQuJAq3s', 'aula', '2026-10-14 13:38:52', 32, 'Este conteúdo apresenta escola de frankfurt. A crítica à indústria cultural no século XX.

Objetivo da aula
Compreender os conceitos centrais de escola de frankfurt e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(232, '[3º Ano] Redação - Proposta de Intervenção (5 Elementos)', 'Agente, Ação, Meio/Modo, Efeito e Detalhamento no ENEM.', 'https://www.youtube.com/watch?v=VRQtqA3Fbeo', 'aula', '2026-10-14 13:38:52', 33, 'Este conteúdo apresenta proposta de intervenção (5 elementos). Agente, Ação, Meio/Modo, Efeito e Detalhamento no ENEM.

Objetivo da aula
Compreender os conceitos centrais de proposta de intervenção (5 elementos) e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(233, '[3º Ano] Redação - Análise de Redações Nota 1000', 'Desconstrução de redações nota máxima.', 'https://www.youtube.com/watch?v=MeKHJVPNV30', 'aula', '2026-10-14 13:38:52', 33, 'Este conteúdo apresenta análise de redações nota 1000. Desconstrução de redações nota máxima.

Objetivo da aula
Compreender os conceitos centrais de análise de redações nota 1000 e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(234, '[3º Ano] Redação - Checkup Final e Gerenciamento de Tempo', 'Estratégias de rascunho e controle de tempo de prova.', 'https://www.youtube.com/watch?v=TuBKsV3lSQc', 'aula', '2026-10-14 13:38:52', 33, 'Este conteúdo apresenta checkup final e gerenciamento de tempo. Estratégias de rascunho e controle de tempo de prova.

Objetivo da aula
Compreender os conceitos centrais de checkup final e gerenciamento de tempo e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),

-- VESTIBULAR / ENEM
(235, '[Vestibular] Matemática - Revisão de Porcentagem e Razão/Proporção', 'Resolução de questões clássicas de matemática financeira e escala.', 'https://www.youtube.com/watch?v=MSZdhDBoXe0', 'aula', '2026-11-10 20:00:00', 34, 'Este conteúdo apresenta revisão de porcentagem e razão/proporção. Resolução de questões clássicas de matemática financeira e escala.

Objetivo da aula
Compreender os conceitos centrais de revisão de porcentagem e razão/proporção e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(236, '[Vestibular] Matemática - Análise de Gráficos e Tabelas no ENEM', 'Interpretação de dados estatísticos em provas de vestibulares.', 'https://www.youtube.com/watch?v=ddZHkCUcYRM', 'aula', '2026-11-10 20:00:00', 34, 'Este conteúdo apresenta análise de gráficos e tabelas no enem. Interpretação de dados estatísticos em provas de vestibulares.

Objetivo da aula
Compreender os conceitos centrais de análise de gráficos e tabelas no enem e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(237, '[Vestibular] Matemática - Geometria de Alta Frequência no ENEM', 'Resolução prática de questões de geometria plana e espacial.', 'https://www.youtube.com/watch?v=0HXlohthSoY', 'aula', '2026-11-10 20:00:00', 34, 'Este conteúdo apresenta geometria de alta frequência no enem. Resolução prática de questões de geometria plana e espacial.

Objetivo da aula
Compreender os conceitos centrais de geometria de alta frequência no enem e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Comece identificando os dados do problema e o que precisa ser encontrado. Organize os números, escolha a operação ou representação adequada e resolva cada etapa com atenção. Ao final, confira o resultado usando uma estimativa ou a operação inversa quando possível.

Atividade de fixação
Exemplo de estudo: crie uma situação do cotidiano que envolva o conceito da aula, resolva-a no caderno e explique por que escolheu esse procedimento.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(238, '[Vestibular] Português - Interpretação de Texto e Variantes Linguísticas', 'Análise de gêneros textuais e preconceito linguístico.', 'https://www.youtube.com/watch?v=LMaE0gAsI04', 'aula', '2026-11-10 20:00:00', 35, 'Este conteúdo apresenta interpretação de texto e variantes linguísticas. Análise de gêneros textuais e preconceito linguístico.

Objetivo da aula
Compreender os conceitos centrais de interpretação de texto e variantes linguísticas e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(239, '[Vestibular] Português - Figuras de Linguagem mais Cobradas', 'Identificação rápida de metáforas, metonímias e ironias nas questões.', 'https://www.youtube.com/watch?v=X61lboe5_pM', 'aula', '2026-11-10 20:00:00', 35, 'Este conteúdo apresenta figuras de linguagem mais cobradas. Identificação rápida de metáforas, metonímias e ironias nas questões.

Objetivo da aula
Compreender os conceitos centrais de figuras de linguagem mais cobradas e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(240, '[Vestibular] Português - Escolas Literárias no Vestibular', 'Quadro comparativo de estilos de época e autores recorrentes.', 'https://www.youtube.com/watch?v=XsN0e_xPyNI', 'aula', '2026-11-10 20:00:00', 35, 'Este conteúdo apresenta escolas literárias no vestibular. Quadro comparativo de estilos de época e autores recorrentes.

Objetivo da aula
Compreender os conceitos centrais de escolas literárias no vestibular e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(241, '[Vestibular] História - História do Brasil: O que mais cai no ENEM', 'Revisão intensiva de Vargas, Ditadura Militar e República Velha.', 'https://www.youtube.com/watch?v=6wA_1C8hg-M', 'aula', '2026-11-10 20:00:00', 36, 'Este conteúdo apresenta história do brasil: o que mais cai no enem. Revisão intensiva de Vargas, Ditadura Militar e República Velha.

Objetivo da aula
Compreender os conceitos centrais de história do brasil: o que mais cai no enem e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(242, '[Vestibular] História - História Geral no Vestibular', 'Foco em Revolução Industrial, Guerras Mundiais e Iluminismo.', 'https://www.youtube.com/watch?v=AGKX8fGF-D8', 'aula', '2026-11-10 20:00:00', 36, 'Este conteúdo apresenta história geral no vestibular. Foco em Revolução Industrial, Guerras Mundiais e Iluminismo.

Objetivo da aula
Compreender os conceitos centrais de história geral no vestibular e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(243, '[Vestibular] História - Questões Comentadas de História', 'Estratégia de resolução e eliminação de alternativas incorretas.', 'https://www.youtube.com/watch?v=jAMnrrqGYcw', 'aula', '2026-11-10 20:00:00', 36, 'Este conteúdo apresenta questões comentadas de história. Estratégia de resolução e eliminação de alternativas incorretas.

Objetivo da aula
Compreender os conceitos centrais de questões comentadas de história e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Estude o contexto em que os acontecimentos ocorreram, identificando período, grupos sociais envolvidos, interesses e transformações. Relacione causas e consequências e compare diferentes experiências históricas, evitando analisar o passado sem considerar seu próprio contexto.

Atividade de fixação
Exemplo de estudo: monte uma linha do tempo com os principais acontecimentos da aula e acrescente uma causa ou consequência para cada um.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(244, '[Vestibular] Química - Estequiometria sem Mistérios', 'Cálculos estequiométricos passo a passo focados no ENEM.', 'https://www.youtube.com/watch?v=7kluWpnlVPU', 'aula', '2026-11-10 20:00:00', 37, 'Este conteúdo apresenta estequiometria sem mistérios. Cálculos estequiométricos passo a passo focados no ENEM.

Objetivo da aula
Compreender os conceitos centrais de estequiometria sem mistérios e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(245, '[Vestibular] Química - Química Ambiental no Vestibular', 'Efeito estufa, chuva ácida, lixo e tratamento de água.', 'https://www.youtube.com/live/7Ad9IHTXmw0', 'aula', '2026-11-10 20:00:00', 37, 'Este conteúdo apresenta química ambiental no vestibular. Efeito estufa, chuva ácida, lixo e tratamento de água.

Objetivo da aula
Compreender os conceitos centrais de química ambiental no vestibular e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(246, '[Vestibular] Química - Funções e Reações Orgânicas Relevantes', 'Revisão rápida dos grupos funcionais e reações frequentes.', 'https://www.youtube.com/live/qfBCDMX3Yy4', 'aula', '2026-11-10 20:00:00', 37, 'Este conteúdo apresenta funções e reações orgânicas relevantes. Revisão rápida dos grupos funcionais e reações frequentes.

Objetivo da aula
Compreender os conceitos centrais de funções e reações orgânicas relevantes e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(247, '[Vestibular] Biologia - Ecologia e Impactos Ambientais no ENEM', 'O tema número 1 em biologia: biomas, teias e preservação.', 'https://www.youtube.com/watch?v=bMwEgGaB1ZQ', 'aula', '2026-11-10 20:00:00', 38, 'Este conteúdo apresenta ecologia e impactos ambientais no enem. O tema número 1 em biologia: biomas, teias e preservação.

Objetivo da aula
Compreender os conceitos centrais de ecologia e impactos ambientais no enem e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(248, '[Vestibular] Biologia - Citologia e Genética Intensiva', 'Mapeamento de questões sobre DNA, organelas e heredogramas.', 'https://www.youtube.com/watch?v=6H_8eFmx-g0', 'aula', '2026-11-10 20:00:00', 38, 'Este conteúdo apresenta citologia e genética intensiva. Mapeamento de questões sobre DNA, organelas e heredogramas.

Objetivo da aula
Compreender os conceitos centrais de citologia e genética intensiva e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(249, '[Vestibular] Biologia - Biotecnologia e Imunologia', 'Vacinas, soros, pcr e transgênicos nas provas atuais.', 'https://www.youtube.com/watch?v=Ijb2CVy_-y0', 'aula', '2026-11-10 20:00:00', 38, 'Este conteúdo apresenta biotecnologia e imunologia. Vacinas, soros, pcr e transgênicos nas provas atuais.

Objetivo da aula
Compreender os conceitos centrais de biotecnologia e imunologia e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(250, '[Vestibular] Física - Eletrodinâmica: O Assunto mais Cobrado', 'Consumo de energia, circuitos e disjuntores no ENEM.', 'https://www.youtube.com/watch?v=5eid5-U3Dvw', 'aula', '2026-11-10 20:00:00', 39, 'Este conteúdo apresenta eletrodinâmica: o assunto mais cobrado. Consumo de energia, circuitos e disjuntores no ENEM.

Objetivo da aula
Compreender os conceitos centrais de eletrodinâmica: o assunto mais cobrado e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(251, '[Vestibular] Física - Ondulatória e Fenômenos Físicos', 'Resolução de questões sobre acústica, refração e difração.', 'https://www.youtube.com/watch?v=hxciSW_B8Hw', 'aula', '2026-11-10 20:00:00', 39, 'Este conteúdo apresenta ondulatória e fenômenos físicos. Resolução de questões sobre acústica, refração e difração.

Objetivo da aula
Compreender os conceitos centrais de ondulatória e fenômenos físicos e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(252, '[Vestibular] Física - Mecânica e Conservação de Energia', 'Trabalho, energia potencial, cinética e leis de Newton.', 'https://www.youtube.com/watch?v=Sj3sCRwMc0Q', 'aula', '2026-11-10 20:00:00', 39, 'Este conteúdo apresenta mecânica e conservação de energia. Trabalho, energia potencial, cinética e leis de Newton.

Objetivo da aula
Compreender os conceitos centrais de mecânica e conservação de energia e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe os fenômenos e os seres envolvidos, identifique suas características e procure compreender como se relacionam. Use os conceitos científicos para explicar situações do cotidiano, diferencie observação de hipótese e organize as informações em etapas.

Atividade de fixação
Exemplo de estudo: registre uma observação relacionada ao tema, formule uma pergunta, proponha uma explicação e indique que evidência ajudaria a verificá-la.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(253, '[Vestibular] Geografia - Geografia do Brasil: Questões Agrárias e Urbanas', 'Uso da terra, agronegócio e mobilidade urbana.', 'https://www.youtube.com/watch?v=9E8ajFP0Iq0', 'aula', '2026-11-10 20:00:00', 40, 'Este conteúdo apresenta geografia do brasil: questões agrárias e urbanas. Uso da terra, agronegócio e mobilidade urbana.

Objetivo da aula
Compreender os conceitos centrais de geografia do brasil: questões agrárias e urbanas e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(254, '[Vestibular] Geografia - Climatologia e Impactos Ambientais Globalizados', 'Fenômenos climáticos e acordos globais de meio ambiente.', 'https://www.youtube.com/watch?v=nrzFMOq1k-w', 'aula', '2026-11-10 20:00:00', 40, 'Este conteúdo apresenta climatologia e impactos ambientais globalizados. Fenômenos climáticos e acordos globais de meio ambiente.

Objetivo da aula
Compreender os conceitos centrais de climatologia e impactos ambientais globalizados e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(255, '[Vestibular] Geografia - Geopolítica Contemporânea para Vestibulares', 'Análise de conflitos globais recentes e rotas comerciais.', 'https://www.youtube.com/live/YvH0XoPyANA', 'aula', '2026-11-10 20:00:00', 40, 'Este conteúdo apresenta geopolítica contemporânea para vestibulares. Análise de conflitos globais recentes e rotas comerciais.

Objetivo da aula
Compreender os conceitos centrais de geopolítica contemporânea para vestibulares e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Analise o fenômeno considerando sua localização, suas características naturais e a ação da sociedade no espaço. Observe mapas, imagens e exemplos do cotidiano; compare lugares e identifique relações entre ambiente, população, economia e organização territorial.

Atividade de fixação
Exemplo de estudo: escolha um lugar conhecido, descreva como o tema estudado aparece nele e represente as informações em um pequeno mapa, esquema ou tabela.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(256, '[Vestibular] Inglês - Estratégias de Skimming e Scanning', 'Técnicas de leitura dinâmica para responder questões em minutos.', 'https://www.youtube.com/watch?v=F5GGs1Rpt7I', 'aula', '2026-11-10 20:00:00', 41, 'Este conteúdo apresenta estratégias de skimming e scanning. Técnicas de leitura dinâmica para responder questões em minutos.

Objetivo da aula
Compreender os conceitos centrais de estratégias de skimming e scanning e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(257, '[Vestibular] Inglês - Resolução de Questões ENEM Anteriores', 'Análise de enunciados e pegadinhas recorrentes.', 'https://www.youtube.com/watch?v=LxuTxkHAXeQ', 'aula', '2026-11-10 20:00:00', 41, 'Este conteúdo apresenta resolução de questões enem anteriores. Análise de enunciados e pegadinhas recorrentes.

Objetivo da aula
Compreender os conceitos centrais de resolução de questões enem anteriores e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(258, '[Vestibular] Inglês - Conectivos e Vocabulário de Prova', 'Palavras de transição fundamentais para entender textos acadêmicos.', 'https://www.youtube.com/watch?v=8v_w8itTslc', 'aula', '2026-11-10 20:00:00', 41, 'Este conteúdo apresenta conectivos e vocabulário de prova. Palavras de transição fundamentais para entender textos acadêmicos.

Objetivo da aula
Compreender os conceitos centrais de conectivos e vocabulário de prova e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(259, '[Vestibular] Sociologia - Pensadores Clássicos no Vestibular', 'Comparativo rápido entre Durkheim, Marx e Weber.', 'https://www.youtube.com/watch?v=u0C3F1Fq32E', 'aula', '2026-11-10 20:00:00', 42, 'Este conteúdo apresenta pensadores clássicos no vestibular. Comparativo rápido entre Durkheim, Marx e Weber.

Objetivo da aula
Compreender os conceitos centrais de pensadores clássicos no vestibular e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(260, '[Vestibular] Sociologia - Direitos, Cidadania e Movimentos Sociais', 'Evolução dos direitos humanos e conceitos de minoria.', 'https://www.youtube.com/live/u4ZREcGwkF4', 'aula', '2026-11-10 20:00:00', 42, 'Este conteúdo apresenta direitos, cidadania e movimentos sociais. Evolução dos direitos humanos e conceitos de minoria.

Objetivo da aula
Compreender os conceitos centrais de direitos, cidadania e movimentos sociais e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(261, '[Vestibular] Sociologia - Cultura de Massa e Mídia', 'A influência dos meios de comunicação na sociedade moderna.', 'https://www.youtube.com/live/oxApmqaXlsM', 'aula', '2026-11-10 20:00:00', 42, 'Este conteúdo apresenta cultura de massa e mídia. A influência dos meios de comunicação na sociedade moderna.

Objetivo da aula
Compreender os conceitos centrais de cultura de massa e mídia e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(262, '[Vestibular] Filosofia - Filosofia Política nas Provas', 'Maquiavel, Hobbes, Locke, Rousseau e Hannah Arendt.', 'https://www.youtube.com/watch?v=UK6OKSsastQ', 'aula', '2026-11-10 20:00:00', 43, 'Este conteúdo apresenta filosofia política nas provas. Maquiavel, Hobbes, Locke, Rousseau e Hannah Arendt.

Objetivo da aula
Compreender os conceitos centrais de filosofia política nas provas e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(263, '[Vestibular] Filosofia - Ética e Epistemologia', 'Conceitos éticos clássicos e teoria do conhecimento.', 'https://www.youtube.com/watch?v=Y9_UovLgduo', 'aula', '2026-11-10 20:00:00', 43, 'Este conteúdo apresenta ética e epistemologia. Conceitos éticos clássicos e teoria do conhecimento.

Objetivo da aula
Compreender os conceitos centrais de ética e epistemologia e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(264, '[Vestibular] Filosofia - Filósofos da Modernidade e Pós-Modernidade', 'Nietzsche, Kant e Foucault no ENEM.', 'https://www.youtube.com/live/ZmKPQuJAq3s', 'aula', '2026-11-10 20:00:00', 43, 'Este conteúdo apresenta filósofos da modernidade e pós-modernidade. Nietzsche, Kant e Foucault no ENEM.

Objetivo da aula
Compreender os conceitos centrais de filósofos da modernidade e pós-modernidade e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(265, '[Vestibular] Redação - Projeto de Texto para Nota 1000', 'Passo a passo para estruturar a redação antes de escrever.', 'https://www.youtube.com/watch?v=VRQtqA3Fbeo', 'aula', '2026-11-10 20:00:00', 44, 'Este conteúdo apresenta projeto de texto para nota 1000. Passo a passo para estruturar a redação antes de escrever.

Objetivo da aula
Compreender os conceitos centrais de projeto de texto para nota 1000 e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(266, '[Vestibular] Redação - Repertórios Coringa para Qualquer Tema', 'Alusões históricas e filosóficas universais aplicáveis na prova.', 'https://www.youtube.com/watch?v=MeKHJVPNV30', 'aula', '2026-11-10 20:00:00', 44, 'Este conteúdo apresenta repertórios coringa para qualquer tema. Alusões históricas e filosóficas universais aplicáveis na prova.

Objetivo da aula
Compreender os conceitos centrais de repertórios coringa para qualquer tema e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.'),
(267, '[Vestibular] Redação - Como Garantir 200 Pontos na Proposta de Intervenção', 'Checklist prático dos 5 elementos obrigatórios da proposta.', 'https://www.youtube.com/watch?v=TuBKsV3lSQc', 'aula', '2026-11-10 20:00:00', 44, 'Este conteúdo apresenta como garantir 200 pontos na proposta de intervenção. Checklist prático dos 5 elementos obrigatórios da proposta.

Objetivo da aula
Compreender os conceitos centrais de como garantir 200 pontos na proposta de intervenção e reconhecer sua aplicação em situações do cotidiano e em atividades escolares.

Explicação
Observe como o tema aparece em palavras, frases e textos. Leia os exemplos com atenção, identifique a função dos elementos estudados e perceba como eles contribuem para a clareza e o sentido da comunicação. Na leitura, procure pistas no contexto; na escrita, revise a organização das ideias e a pontuação.

Atividade de fixação
Exemplo de estudo: selecione um pequeno texto, destaque ocorrências do assunto estudado e escreva uma frase explicando o efeito ou a função de cada uma.

Para revisar
1. Explique o conceito principal com suas próprias palavras.
2. Cite um exemplo relacionado ao tema.
3. Resuma o que aprendeu em duas ou três frases.');

CREATE TABLE `conteudo_categoria` (
  `id_conteudo` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `conteudo_categoria` (`id_conteudo`, `id_categoria`) VALUES
(1, 45);


CREATE TABLE `materias` (
  `id_materia` int(11) NOT NULL,
  `id_ano` int(11) NOT NULL,
  `materia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


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
(44, 4, 'Redação'),
-- Ensino Fundamental: 1º ao 9º ano
(45, 5, 'Matemática'),
(46, 5, 'Português'),
(47, 5, 'História'),
(48, 5, 'Geografia'),
(49, 5, 'Ciências'),
(50, 6, 'Matemática'),
(51, 6, 'Português'),
(52, 6, 'História'),
(53, 6, 'Geografia'),
(54, 6, 'Ciências'),
(55, 7, 'Matemática'),
(56, 7, 'Português'),
(57, 7, 'História'),
(58, 7, 'Geografia'),
(59, 7, 'Ciências'),
(60, 8, 'Matemática'),
(61, 8, 'Português'),
(62, 8, 'História'),
(63, 8, 'Geografia'),
(64, 8, 'Ciências'),
(65, 9, 'Matemática'),
(66, 9, 'Português'),
(67, 9, 'História'),
(68, 9, 'Geografia'),
(69, 9, 'Ciências'),
(70, 10, 'Matemática'),
(71, 10, 'Português'),
(72, 10, 'História'),
(73, 10, 'Geografia'),
(74, 10, 'Ciências'),
(75, 11, 'Matemática'),
(76, 11, 'Português'),
(77, 11, 'História'),
(78, 11, 'Geografia'),
(79, 11, 'Ciências'),
(80, 12, 'Matemática'),
(81, 12, 'Português'),
(82, 12, 'História'),
(83, 12, 'Geografia'),
(84, 12, 'Ciências'),
(85, 13, 'Matemática'),
(86, 13, 'Português'),
(87, 13, 'História'),
(88, 13, 'Geografia'),
(89, 13, 'Ciências');


CREATE TABLE `pessoas` (
  `id_pessoa` int(11) NOT NULL,
  `id_ano` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `email` varchar(150) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `criado_em` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


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


CREATE TABLE `planejamento` (
  `id_planejamento` int(11) NOT NULL,
  `id_pessoa` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `data_tarefa` date NOT NULL,
  `concluida` tinyint(1) NOT NULL DEFAULT 0,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



INSERT INTO `planejamento` (`id_planejamento`, `id_pessoa`, `titulo`, `data_tarefa`, `concluida`, `criado_em`) VALUES
(1, 18, 'matematica', '2026-11-16', 1, '2026-11-05 01:14:34'),
(2, 18, 'prova da roseli', '2026-12-02', 0, '2026-11-05 01:15:04'),
(3, 18, 'feriado, estudar prova de proxima semana', '2026-11-20', 0, '2026-11-05 01:27:31'),
(4, 18, 'chorar no enem', '2026-11-15', 0, '2026-11-05 01:27:49'),
(5, 18, 'me matar no enem', '2026-11-08', 1, '2026-11-05 01:28:02');


CREATE TABLE `progresso` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_atividade` int(11) DEFAULT NULL,
  `acertou` tinyint(1) DEFAULT NULL,
  `data` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `resumos` (
  `id` int(11) NOT NULL,
  `id_pessoa` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `conteudo` text NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `resumos` (`id`, `id_pessoa`, `id_materia`, `titulo`, `conteudo`, `criado_em`, `atualizado_em`) VALUES
(1, 10, 23, 'vai funcionar', 'sera', '2026-10-18 23:29:20', '2026-10-18 23:29:20'),
(2, 10, 23, 'ué', 'funcionou?', '2026-10-18 23:38:24', '2026-10-18 23:38:24'),
(5, 12, 31, 'eliana', 'fdrtvsvbcfgvbvuvgvdfcfgvggvfbmkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkcnftvbyhbcfgbvfrdbftbgff', '2026-10-27 11:37:57', '2026-10-27 11:38:17'),
(6, 14, 27, 'Suólen', 'genes sla oq\r\nhomozigoto sla oq\r\nmitose sla oq', '2026-11-05 00:12:10', '2026-11-05 00:13:45'),
(7, 18, 19, 'GCHGHGH', 'JHVHJK', '2026-11-05 01:33:08', '2026-11-05 01:33:08');


ALTER TABLE `alternativas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_atividade` (`id_atividade`);

ALTER TABLE `anos`
  ADD PRIMARY KEY (`id_ano`);

ALTER TABLE `atividades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_conteudo` (`id_materia`);

ALTER TABLE `conteudos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_conteudos_materias` (`id_materia`);

ALTER TABLE `conteudo_categoria`
  ADD PRIMARY KEY (`id_conteudo`,`id_categoria`),
  ADD KEY `id_categoria` (`id_categoria`);

ALTER TABLE `materias`
  ADD PRIMARY KEY (`id_materia`),
  ADD KEY `id_ano` (`id_ano`);

ALTER TABLE `pessoas`
  ADD PRIMARY KEY (`id_pessoa`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_ano` (`id_ano`);

ALTER TABLE `planejamento`
  ADD PRIMARY KEY (`id_planejamento`),
  ADD KEY `idx_pessoa_data` (`id_pessoa`,`data_tarefa`);

ALTER TABLE `progresso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_atividade` (`id_atividade`);

ALTER TABLE `resumos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pessoa` (`id_pessoa`),
  ADD KEY `id_materia` (`id_materia`);


ALTER TABLE `alternativas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `anos`
  MODIFY `id_ano` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;


ALTER TABLE `atividades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `conteudos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=268;


ALTER TABLE `materias`
  MODIFY `id_materia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

ALTER TABLE `pessoas`
  MODIFY `id_pessoa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

ALTER TABLE `planejamento`
  MODIFY `id_planejamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `progresso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `resumos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

ALTER TABLE `alternativas`
  ADD CONSTRAINT `alternativas_ibfk_1` FOREIGN KEY (`id_atividade`) REFERENCES `atividades` (`id`) ON DELETE CASCADE;

ALTER TABLE `conteudos`
  ADD CONSTRAINT `fk_conteudos_materias` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`);

ALTER TABLE `conteudo_categoria`
  ADD CONSTRAINT `conteudo_categoria_ibfk_1` FOREIGN KEY (`id_conteudo`) REFERENCES `conteudos` (`id`),
  ADD CONSTRAINT `conteudo_categoria_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `materias` (`id_materia`);

ALTER TABLE `materias`
  ADD CONSTRAINT `materias_ibfk_1` FOREIGN KEY (`id_ano`) REFERENCES `anos` (`id_ano`);

ALTER TABLE `pessoas`
  ADD CONSTRAINT `pessoas_ibfk_1` FOREIGN KEY (`id_ano`) REFERENCES `anos` (`id_ano`);

ALTER TABLE `planejamento`
  ADD CONSTRAINT `fk_planejamento_pessoas` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoas` (`id_pessoa`) ON DELETE CASCADE;

ALTER TABLE `progresso`
  ADD CONSTRAINT `progresso_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `pessoas` (`id_pessoa`) ON DELETE CASCADE,
  ADD CONSTRAINT `progresso_ibfk_2` FOREIGN KEY (`id_atividade`) REFERENCES `atividades` (`id`);

ALTER TABLE `resumos`
  ADD CONSTRAINT `resumos_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoas` (`id_pessoa`) ON DELETE CASCADE,
  ADD CONSTRAINT `resumos_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
