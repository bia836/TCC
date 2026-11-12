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



INSERT INTO materias (id_ano, materia)
SELECT 4, base.materia
FROM (SELECT DISTINCT materia FROM materias WHERE id_ano = 1) AS base
WHERE NOT EXISTS (
    SELECT 1 FROM materias x WHERE x.id_ano = 4 AND x.materia = base.materia
);


START TRANSACTION;

-- ===================== 1º ANO DO ENSINO MÉDIO =====================

-- 1º ano do Ensino Médio | Matemática
INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual é o valor de f(3) na função f(x) = 2x + 5?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Matemática'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '13', 0),
    (@id_atividade, '16', 0),
    (@id_atividade, '8', 0),
    (@id_atividade, '11', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Em uma progressão aritmética de primeiro termo 3 e razão 4, qual é o 10º termo?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Matemática'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '39', 1),
    (@id_atividade, '40', 0),
    (@id_atividade, '36', 0),
    (@id_atividade, '43', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Sendo A = {1, 2, 3, 4} e B = {3, 4, 5, 6}, quantos elementos tem o conjunto A ∩ B?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Matemática'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '2', 1),
    (@id_atividade, '1', 0),
    (@id_atividade, '4', 0),
    (@id_atividade, '6', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Um produto que custava R$ 80,00 recebeu um desconto de 25%. Qual é o novo preço?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Matemática'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'R$ 20,00', 0),
    (@id_atividade, 'R$ 65,00', 0),
    (@id_atividade, 'R$ 60,00', 1),
    (@id_atividade, 'R$ 55,00', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Quais são as raízes da equação x² − 5x + 6 = 0?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Matemática'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '−2 e −3', 0),
    (@id_atividade, '−1 e 6', 0),
    (@id_atividade, '1 e 6', 0),
    (@id_atividade, '2 e 3', 1);


-- 1º ano do Ensino Médio | Português
INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual figura de linguagem aparece em “Seus olhos são duas estrelas”?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Português'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Hipérbole', 0),
    (@id_atividade, 'Ironia', 0),
    (@id_atividade, 'Metáfora', 1),
    (@id_atividade, 'Onomatopeia', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual é a classe gramatical da palavra destacada em: “Os alunos estudaram MUITO para a prova”?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Português'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Pronome', 0),
    (@id_atividade, 'Adjetivo', 0),
    (@id_atividade, 'Advérbio', 1),
    (@id_atividade, 'Substantivo', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual característica é típica do Barroco?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Português'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'O contraste entre fé e razão, espírito e matéria', 1),
    (@id_atividade, 'A descrição científica e impessoal da realidade', 0),
    (@id_atividade, 'O culto à vida simples no campo', 0),
    (@id_atividade, 'O subjetivismo e a idealização da mulher amada', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual gênero textual tem como finalidade relatar fatos reais e recentes de interesse público?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Português'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Editorial', 0),
    (@id_atividade, 'Notícia', 1),
    (@id_atividade, 'Conto', 0),
    (@id_atividade, 'Poema', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Em qual das frases a concordância verbal está correta?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Português'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Existe muitas pessoas na fila.', 0),
    (@id_atividade, 'Fazem dois anos que me mudei.', 0),
    (@id_atividade, 'Faz dois anos que me mudei.', 1),
    (@id_atividade, 'Houveram muitos problemas na reunião.', 0);


-- 1º ano do Ensino Médio | História
INSERT INTO atividades (pergunta, id_materia) VALUES ('Em qual cidade-Estado da Grécia Antiga surgiu a democracia?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'História'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Corinto', 0),
    (@id_atividade, 'Atenas', 1),
    (@id_atividade, 'Esparta', 0),
    (@id_atividade, 'Tebas', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual era a base da economia na Europa feudal?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'História'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'A extração de petróleo', 0),
    (@id_atividade, 'A indústria têxtil nas grandes cidades', 0),
    (@id_atividade, 'A agricultura de subsistência, com trabalho servil nos feudos', 1),
    (@id_atividade, 'O comércio marítimo com as colônias americanas', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual movimento cultural, nascido na Itália entre os séculos XIV e XVI, valorizou o humanismo e o antropocentrismo?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'História'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Renascimento', 1),
    (@id_atividade, 'Reforma Protestante', 0),
    (@id_atividade, 'Iluminismo', 0),
    (@id_atividade, 'Barroco', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Quem iniciou a Reforma Protestante, em 1517, ao divulgar as 95 teses?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'História'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Erasmo de Roterdã', 0),
    (@id_atividade, 'Henrique VIII', 0),
    (@id_atividade, 'João Calvino', 0),
    (@id_atividade, 'Martinho Lutero', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual foi o sistema de colonização adotado pelos portugueses no Brasil em 1534, dividindo o território em grandes faixas de terra?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'História'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Plantation', 0),
    (@id_atividade, 'Bandeirantismo', 0),
    (@id_atividade, 'Governo-Geral', 0),
    (@id_atividade, 'Capitanias hereditárias', 1);


-- 1º ano do Ensino Médio | Química
INSERT INTO atividades (pergunta, id_materia) VALUES ('O número atômico (Z) de um elemento indica a quantidade de:', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Química'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Prótons no núcleo', 1),
    (@id_atividade, 'Nêutrons no núcleo', 0),
    (@id_atividade, 'Prótons mais nêutrons', 0),
    (@id_atividade, 'Elétrons da camada de valência', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual é o tipo de ligação química entre o sódio (Na) e o cloro (Cl) no sal de cozinha (NaCl)?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Química'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Iônica', 1),
    (@id_atividade, 'Covalente', 0),
    (@id_atividade, 'Metálica', 0),
    (@id_atividade, 'Ponte de hidrogênio', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual modelo atômico propôs um núcleo pequeno, denso e positivo, com os elétrons girando ao redor?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Química'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Modelo de Dalton', 0),
    (@id_atividade, 'Modelo de Bohr', 0),
    (@id_atividade, 'Modelo de Thomson', 0),
    (@id_atividade, 'Modelo de Rutherford', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual das opções representa uma substância simples?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Química'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'NaCl (sal de cozinha)', 0),
    (@id_atividade, 'CO₂ (gás carbônico)', 0),
    (@id_atividade, 'O₂ (gás oxigênio)', 1),
    (@id_atividade, 'H₂O (água)', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Elementos químicos que ficam na mesma coluna (grupo) da tabela periódica têm em comum:', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Química'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'O mesmo número de camadas eletrônicas', 0),
    (@id_atividade, 'O mesmo número de elétrons na camada de valência', 1),
    (@id_atividade, 'O mesmo número de prótons', 0),
    (@id_atividade, 'A mesma massa atômica', 0);


-- 1º ano do Ensino Médio | Biologia
INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual organela celular é responsável pela respiração celular e pela produção da maior parte do ATP?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Biologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Ribossomo', 0),
    (@id_atividade, 'Complexo golgiense', 0),
    (@id_atividade, 'Mitocôndria', 1),
    (@id_atividade, 'Lisossomo', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual organela das células vegetais realiza a fotossíntese?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Biologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Cloroplasto', 1),
    (@id_atividade, 'Mitocôndria', 0),
    (@id_atividade, 'Núcleo', 0),
    (@id_atividade, 'Centríolo', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual molécula armazena a informação genética dos seres vivos?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Biologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'DNA', 1),
    (@id_atividade, 'Glicose', 0),
    (@id_atividade, 'Água', 0),
    (@id_atividade, 'Colesterol', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Em qual fase da mitose os cromossomos se alinham no plano equatorial da célula?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Biologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Metáfase', 1),
    (@id_atividade, 'Prófase', 0),
    (@id_atividade, 'Telófase', 0),
    (@id_atividade, 'Anáfase', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Como se chama a passagem de água através de uma membrana semipermeável, do meio menos concentrado para o mais concentrado?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Biologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Pinocitose', 0),
    (@id_atividade, 'Osmose', 1),
    (@id_atividade, 'Fagocitose', 0),
    (@id_atividade, 'Transporte ativo', 0);


-- 1º ano do Ensino Médio | Física
INSERT INTO atividades (pergunta, id_materia) VALUES ('Um carro percorre 150 km em 2 horas. Qual é a sua velocidade média?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Física'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '50 km/h', 0),
    (@id_atividade, '75 km/h', 1),
    (@id_atividade, '300 km/h', 0),
    (@id_atividade, '150 km/h', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual é a unidade de medida de força no Sistema Internacional?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Física'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Watt (W)', 0),
    (@id_atividade, 'Joule (J)', 0),
    (@id_atividade, 'Pascal (Pa)', 0),
    (@id_atividade, 'Newton (N)', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual lei física explica por que os passageiros são lançados para a frente quando o ônibus freia bruscamente?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Física'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Princípio Fundamental da Dinâmica', 0),
    (@id_atividade, 'Lei da Inércia (1ª lei de Newton)', 1),
    (@id_atividade, 'Lei da Ação e Reação', 0),
    (@id_atividade, 'Lei da Gravitação Universal', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Um corpo parte do repouso com aceleração constante de 3 m/s². Qual é a sua velocidade após 4 s?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Física'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '12 m/s', 1),
    (@id_atividade, '7 m/s', 0),
    (@id_atividade, '0,75 m/s', 0),
    (@id_atividade, '24 m/s', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Desprezando a resistência do ar e adotando g = 10 m/s², qual é a altura de queda de um objeto que cai do repouso durante 3 s?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Física'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '45 m', 1),
    (@id_atividade, '30 m', 0),
    (@id_atividade, '90 m', 0),
    (@id_atividade, '15 m', 0);


-- 1º ano do Ensino Médio | Geografia
INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual linha imaginária divide a Terra nos hemisférios Norte e Sul?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Geografia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Meridiano de Greenwich', 0),
    (@id_atividade, 'Linha do Equador', 1),
    (@id_atividade, 'Trópico de Capricórnio', 0),
    (@id_atividade, 'Trópico de Câncer', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Quando é meio-dia (12h) em Greenwich, que horas são em Brasília (fuso UTC−3)?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Geografia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '9h', 1),
    (@id_atividade, '12h', 0),
    (@id_atividade, '15h', 0),
    (@id_atividade, '3h', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Em um mapa com escala 1:100.000, 1 cm no papel corresponde a quanto na realidade?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Geografia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '100 m', 0),
    (@id_atividade, '100 km', 0),
    (@id_atividade, '10 km', 0),
    (@id_atividade, '1 km', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Em qual camada da Terra estão as placas tectônicas?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Geografia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Atmosfera', 0),
    (@id_atividade, 'Núcleo interno', 0),
    (@id_atividade, 'Litosfera', 1),
    (@id_atividade, 'Hidrosfera', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual bioma brasileiro é conhecido como a “savana brasileira”, com árvores de troncos retorcidos e solo ácido?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Geografia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Pampa', 0),
    (@id_atividade, 'Caatinga', 0),
    (@id_atividade, 'Cerrado', 1),
    (@id_atividade, 'Mata Atlântica', 0);


-- 1º ano do Ensino Médio | Inglês
INSERT INTO atividades (pergunta, id_materia) VALUES ('Complete: “She ___ a student.”', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Inglês'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'am', 0),
    (@id_atividade, 'is', 1),
    (@id_atividade, 'are', 0),
    (@id_atividade, 'be', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Complete: “He ___ to school every day.”', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Inglês'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'goes', 1),
    (@id_atividade, 'gone', 0),
    (@id_atividade, 'going', 0),
    (@id_atividade, 'go', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual é o antônimo (opposite) de “hot”?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Inglês'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'fast', 0),
    (@id_atividade, 'cold', 1),
    (@id_atividade, 'late', 0),
    (@id_atividade, 'big', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Como se traduz “Where do you live?”', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Inglês'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Quem é você?', 0),
    (@id_atividade, 'Quando você chega?', 0),
    (@id_atividade, 'Por que você vive?', 0),
    (@id_atividade, 'Onde você mora?', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual é o plural de “child”?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Inglês'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'childs', 0),
    (@id_atividade, 'childrens', 0),
    (@id_atividade, 'childes', 0),
    (@id_atividade, 'children', 1);


-- 1º ano do Ensino Médio | Sociologia
INSERT INTO atividades (pergunta, id_materia) VALUES ('Quem criou o termo “sociologia” e propôs o positivismo?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Sociologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Max Weber', 0),
    (@id_atividade, 'Karl Marx', 0),
    (@id_atividade, 'Auguste Comte', 1),
    (@id_atividade, 'Émile Durkheim', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Segundo Émile Durkheim, os fatos sociais são maneiras de agir, pensar e sentir que são:', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Sociologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Exteriores ao indivíduo, gerais e coercitivas', 1),
    (@id_atividade, 'Escolhidas livremente por cada pessoa', 0),
    (@id_atividade, 'Ações com sentido subjetivo para quem as pratica', 0),
    (@id_atividade, 'Exclusivamente de origem biológica', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual atitude representa o etnocentrismo?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Sociologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Valorizar a diversidade cultural', 0),
    (@id_atividade, 'Estudar as culturas sem preconceitos', 0),
    (@id_atividade, 'Julgar outras culturas pelos valores da própria, considerando-a superior', 1),
    (@id_atividade, 'Respeitar as diferenças entre os povos', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('O que é socialização?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Sociologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'A divisão desigual da riqueza entre as classes', 0),
    (@id_atividade, 'O processo pelo qual o indivíduo aprende normas, valores e costumes da sociedade', 1),
    (@id_atividade, 'O isolamento voluntário de uma pessoa', 0),
    (@id_atividade, 'Um processo exclusivamente biológico', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Segundo Karl Marx, a sociedade capitalista se divide fundamentalmente em quais classes?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Sociologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Patrícios e plebeus', 0),
    (@id_atividade, 'Burguesia e proletariado', 1),
    (@id_atividade, 'Brâmanes e párias', 0),
    (@id_atividade, 'Clero e nobreza', 0);


-- 1º ano do Ensino Médio | Filosofia
INSERT INTO atividades (pergunta, id_materia) VALUES ('Para Tales de Mileto, qual era o princípio (arché) de todas as coisas?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Filosofia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Os números', 0),
    (@id_atividade, 'O fogo', 0),
    (@id_atividade, 'A água', 1),
    (@id_atividade, 'O ar', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Como se chama o método de Sócrates, que conduz o interlocutor a “dar à luz” o conhecimento por meio de perguntas?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Filosofia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Imperativo categórico', 0),
    (@id_atividade, 'Indução experimental', 0),
    (@id_atividade, 'Maiêutica', 1),
    (@id_atividade, 'Dúvida metódica', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('No Mito da Caverna, de Platão, a saída do prisioneiro da caverna simboliza:', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Filosofia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'O fim da vida humana', 0),
    (@id_atividade, 'A passagem da ignorância (aparência) para o conhecimento verdadeiro', 1),
    (@id_atividade, 'A fuga de um crime cometido', 0),
    (@id_atividade, 'A vitória do mundo sensível sobre o mundo das ideias', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Quem afirmou que “o ser humano é, por natureza, um animal político”?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Filosofia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Sócrates', 0),
    (@id_atividade, 'Aristóteles', 1),
    (@id_atividade, 'Epicuro', 0),
    (@id_atividade, 'Platão', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('O que caracteriza a passagem do mito ao logos na Grécia Antiga?', (SELECT id_materia FROM materias WHERE id_ano = 1 AND materia = 'Filosofia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'O uso exclusivo de instrumentos de laboratório', 0),
    (@id_atividade, 'A invenção da escrita alfabética', 0),
    (@id_atividade, 'O abandono total das crenças religiosas gregas', 0),
    (@id_atividade, 'A substituição de explicações sobrenaturais por explicações racionais e argumentadas', 1);


-- ===================== 2º ANO DO ENSINO MÉDIO =====================

-- 2º ano do Ensino Médio | Matemática
INSERT INTO atividades (pergunta, id_materia) VALUES ('Quantos anagramas tem a palavra AMOR?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Matemática'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '8', 0),
    (@id_atividade, '16', 0),
    (@id_atividade, '12', 0),
    (@id_atividade, '24', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Ao lançar um dado honesto de 6 faces, qual é a probabilidade de sair um número par?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Matemática'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '1/6', 0),
    (@id_atividade, '1/3', 0),
    (@id_atividade, '2/3', 0),
    (@id_atividade, '1/2', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual é o volume de um cilindro com raio da base de 3 cm e altura de 5 cm?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Matemática'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '45π cm³', 1),
    (@id_atividade, '15π cm³', 0),
    (@id_atividade, '90π cm³', 0),
    (@id_atividade, '30π cm³', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual é o determinante da matriz [[2, 3], [1, 4]] (linhas separadas por vírgula)?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Matemática'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '8', 0),
    (@id_atividade, '5', 1),
    (@id_atividade, '11', 0),
    (@id_atividade, '−5', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual é o valor de log₂ 32?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Matemática'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '6', 0),
    (@id_atividade, '5', 1),
    (@id_atividade, '4', 0),
    (@id_atividade, '16', 0);


-- 2º ano do Ensino Médio | Português
INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual característica pertence ao Romantismo?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Português'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Experimentação vanguardista com a linguagem', 0),
    (@id_atividade, 'Subjetivismo, idealização e valorização dos sentimentos e da natureza', 1),
    (@id_atividade, 'Culto à forma e impassibilidade diante do tema', 0),
    (@id_atividade, 'Racionalismo e objetividade científica', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Quem é o autor do romance “Dom Casmurro”?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Português'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Machado de Assis', 1),
    (@id_atividade, 'José de Alencar', 0),
    (@id_atividade, 'Aluísio Azevedo', 0),
    (@id_atividade, 'Lima Barreto', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('A obra “O Cortiço”, de Aluísio Azevedo, pertence a qual estilo de época?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Português'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Romantismo', 0),
    (@id_atividade, 'Naturalismo', 1),
    (@id_atividade, 'Parnasianismo', 0),
    (@id_atividade, 'Simbolismo', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Na oração “Choveu muito ontem.”, qual é o sujeito?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Português'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Sujeito indeterminado', 0),
    (@id_atividade, 'Sujeito simples: a chuva', 0),
    (@id_atividade, 'Sujeito oculto: ela', 0),
    (@id_atividade, 'Não há sujeito (oração sem sujeito)', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('O Parnasianismo caracteriza-se principalmente por:', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Português'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Fuga para o passado medieval e nacionalismo ufanista', 0),
    (@id_atividade, 'Musicalidade vaga e misticismo', 0),
    (@id_atividade, 'Crítica social direta com linguagem coloquial', 0),
    (@id_atividade, 'Culto à forma, perfeição métrica e “arte pela arte”', 1);


-- 2º ano do Ensino Médio | História
INSERT INTO atividades (pergunta, id_materia) VALUES ('Em que ano começou a Revolução Francesa, com a queda da Bastilha?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'História'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '1776', 0),
    (@id_atividade, '1815', 0),
    (@id_atividade, '1804', 0),
    (@id_atividade, '1789', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Em qual país teve início a Revolução Industrial?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'História'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'França', 0),
    (@id_atividade, 'Inglaterra', 1),
    (@id_atividade, 'Alemanha', 0),
    (@id_atividade, 'Estados Unidos', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Quem proclamou a Independência do Brasil, em 7 de setembro de 1822?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'História'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Dom João VI', 0),
    (@id_atividade, 'Dom Pedro I', 1),
    (@id_atividade, 'José Bonifácio', 0),
    (@id_atividade, 'Tiradentes', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual lei, assinada em 1888 pela Princesa Isabel, aboliu a escravidão no Brasil?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'História'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Lei Eusébio de Queirós', 0),
    (@id_atividade, 'Lei Áurea', 1),
    (@id_atividade, 'Lei dos Sexagenários', 0),
    (@id_atividade, 'Lei do Ventre Livre', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual pensador iluminista defendeu a separação dos poderes em Executivo, Legislativo e Judiciário?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'História'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Locke', 0),
    (@id_atividade, 'Voltaire', 0),
    (@id_atividade, 'Montesquieu', 1),
    (@id_atividade, 'Rousseau', 0);


-- 2º ano do Ensino Médio | Química
INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual é a massa molar da água (H₂O)? (Dados: H = 1 u; O = 16 u)', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Química'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '18 g/mol', 1),
    (@id_atividade, '20 g/mol', 0),
    (@id_atividade, '17 g/mol', 0),
    (@id_atividade, '34 g/mol', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Uma solução com pH igual a 3 é classificada como:', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Química'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Neutra', 0),
    (@id_atividade, 'Básica', 0),
    (@id_atividade, 'Ácida', 1),
    (@id_atividade, 'Indeterminada', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('O hidróxido de sódio (NaOH) pertence a qual função inorgânica?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Química'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Óxido', 0),
    (@id_atividade, 'Ácido', 0),
    (@id_atividade, 'Base', 1),
    (@id_atividade, 'Sal', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Na reação 2 H₂ + O₂ → 2 H₂O, quantos mols de água são formados a partir de 3 mol de O₂?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Química'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '6 mol', 1),
    (@id_atividade, '4 mol', 0),
    (@id_atividade, '9 mol', 0),
    (@id_atividade, '3 mol', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Uma reação exotérmica é aquela que:', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Química'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Libera calor para o ambiente, com ΔH < 0', 1),
    (@id_atividade, 'Não troca calor com o ambiente', 0),
    (@id_atividade, 'Absorve calor do ambiente, com ΔH > 0', 0),
    (@id_atividade, 'Só ocorre abaixo de 0 °C', 0);


-- 2º ano do Ensino Médio | Biologia
INSERT INTO atividades (pergunta, id_materia) VALUES ('O nome científico de uma espécie, segundo a nomenclatura binomial de Lineu, é formado por:', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Biologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Reino e filo', 0),
    (@id_atividade, 'Família e ordem', 0),
    (@id_atividade, 'Gênero e epíteto específico', 1),
    (@id_atividade, 'Classe e ordem', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Os vírus são classificados como:', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Biologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Seres autótrofos fotossintetizantes', 0),
    (@id_atividade, 'Parasitas intracelulares obrigatórios', 1),
    (@id_atividade, 'Organismos procariontes unicelulares', 0),
    (@id_atividade, 'Células eucariontes de vida livre', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual gás as plantas absorvem do ambiente para realizar a fotossíntese?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Biologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Oxigênio (O₂)', 0),
    (@id_atividade, 'Hidrogênio (H₂)', 0),
    (@id_atividade, 'Gás carbônico (CO₂)', 1),
    (@id_atividade, 'Nitrogênio (N₂)', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual câmara do coração humano bombeia o sangue oxigenado para todo o corpo?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Biologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Átrio esquerdo', 0),
    (@id_atividade, 'Ventrículo direito', 0),
    (@id_atividade, 'Ventrículo esquerdo', 1),
    (@id_atividade, 'Átrio direito', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual das doenças abaixo é causada por bactéria?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Biologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Tuberculose', 1),
    (@id_atividade, 'Gripe', 0),
    (@id_atividade, 'Dengue', 0),
    (@id_atividade, 'Malária', 0);


-- 2º ano do Ensino Médio | Física
INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual é a força resultante que atua em um corpo de massa 5 kg com aceleração de 4 m/s²?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Física'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '9 N', 0),
    (@id_atividade, '20 N', 1),
    (@id_atividade, '1,25 N', 0),
    (@id_atividade, '40 N', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual é a energia cinética de um corpo de massa 2 kg que se move a 3 m/s?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Física'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '18 J', 0),
    (@id_atividade, '3 J', 0),
    (@id_atividade, '6 J', 0),
    (@id_atividade, '9 J', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('A temperatura de 100 °C equivale a quantos kelvins (K)?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Física'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '273 K', 0),
    (@id_atividade, '373 K', 1),
    (@id_atividade, '100 K', 0),
    (@id_atividade, '212 K', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual fenômeno óptico explica a formação de imagens em um espelho plano?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Física'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Dispersão da luz', 0),
    (@id_atividade, 'Refração da luz', 0),
    (@id_atividade, 'Difração da luz', 0),
    (@id_atividade, 'Reflexão da luz', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Uma onda tem frequência de 50 Hz e comprimento de onda de 2 m. Qual é a sua velocidade de propagação?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Física'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '100 m/s', 1),
    (@id_atividade, '0,04 m/s', 0),
    (@id_atividade, '52 m/s', 0),
    (@id_atividade, '25 m/s', 0);


-- 2º ano do Ensino Médio | Geografia
INSERT INTO atividades (pergunta, id_materia) VALUES ('Quais países lideraram os dois blocos da Guerra Fria?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Geografia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Alemanha e Japão', 0),
    (@id_atividade, 'Estados Unidos e União Soviética', 1),
    (@id_atividade, 'França e Reino Unido', 0),
    (@id_atividade, 'China e Índia', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual bloco econômico foi fundado por Brasil, Argentina, Paraguai e Uruguai?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Geografia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Nafta', 0),
    (@id_atividade, 'Asean', 0),
    (@id_atividade, 'União Europeia', 0),
    (@id_atividade, 'Mercosul', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Uma pirâmide etária de base estreita e topo largo indica uma população:', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Geografia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Muito jovem, com alta natalidade', 0),
    (@id_atividade, 'Em rápido crescimento', 0),
    (@id_atividade, 'Envelhecida, com baixa natalidade', 1),
    (@id_atividade, 'Formada apenas por adultos', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Como se chama o processo em que o crescimento de cidades vizinhas faz com que elas se unam em uma única mancha urbana?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Geografia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Êxodo rural', 0),
    (@id_atividade, 'Desertificação', 0),
    (@id_atividade, 'Gentrificação', 0),
    (@id_atividade, 'Conurbação', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual região brasileira concentra a maior parte do parque industrial do país?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Geografia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Sul', 0),
    (@id_atividade, 'Nordeste', 0),
    (@id_atividade, 'Norte', 0),
    (@id_atividade, 'Sudeste', 1);


-- 2º ano do Ensino Médio | Inglês
INSERT INTO atividades (pergunta, id_materia) VALUES ('Complete: “Yesterday, I ___ to the cinema.”', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Inglês'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'go', 0),
    (@id_atividade, 'went', 1),
    (@id_atividade, 'gone', 0),
    (@id_atividade, 'goes', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Complete: “This book is ___ than that one.”', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Inglês'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'interestinger', 0),
    (@id_atividade, 'more interesting', 1),
    (@id_atividade, 'interesting', 0),
    (@id_atividade, 'most interesting', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Complete: “You ___ wear a seat belt. It’s the law.”', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Inglês'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'could', 0),
    (@id_atividade, 'must', 1),
    (@id_atividade, 'might', 0),
    (@id_atividade, 'may', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Complete: “I think it ___ rain tomorrow.”', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Inglês'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'was', 0),
    (@id_atividade, 'has', 0),
    (@id_atividade, 'did', 0),
    (@id_atividade, 'will', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('O que significa o verbo “borrow”?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Inglês'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Emprestar', 0),
    (@id_atividade, 'Comprar', 0),
    (@id_atividade, 'Pegar emprestado', 1),
    (@id_atividade, 'Devolver', 0);


-- 2º ano do Ensino Médio | Sociologia
INSERT INTO atividades (pergunta, id_materia) VALUES ('Em qual sistema de estratificação a posição social é definida pelo nascimento e quase não permite mobilidade?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Sociologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Sociedade de classes', 0),
    (@id_atividade, 'Meritocracia', 0),
    (@id_atividade, 'Mobilidade ascendente', 0),
    (@id_atividade, 'Sistema de castas', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Segundo Max Weber, o Estado moderno detém o monopólio do uso legítimo da:', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Sociologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Produção industrial', 0),
    (@id_atividade, 'Cultura', 0),
    (@id_atividade, 'Força física (violência)', 1),
    (@id_atividade, 'Religião', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Segundo T. H. Marshall, a cidadania é formada por direitos:', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Sociologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Civis, políticos e sociais', 1),
    (@id_atividade, 'Individuais, privados e comerciais', 0),
    (@id_atividade, 'Econômicos, religiosos e militares', 0),
    (@id_atividade, 'Naturais, divinos e morais', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('O conceito de indústria cultural, da Escola de Frankfurt, critica:', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Sociologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'A criação de museus públicos', 0),
    (@id_atividade, 'O desaparecimento das indústrias tradicionais', 0),
    (@id_atividade, 'A proibição de qualquer forma de arte', 0),
    (@id_atividade, 'A transformação da cultura em mercadoria padronizada para o consumo de massa', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('O Movimento dos Trabalhadores Rurais Sem Terra (MST) tem como principal bandeira:', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Sociologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'A reforma agrária', 1),
    (@id_atividade, 'A abolição da escravatura', 0),
    (@id_atividade, 'O direito ao voto feminino', 0),
    (@id_atividade, 'A reforma tributária', 0);


-- 2º ano do Ensino Médio | Filosofia
INSERT INTO atividades (pergunta, id_materia) VALUES ('Quem formulou a frase “Penso, logo existo”?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Filosofia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Kant', 0),
    (@id_atividade, 'Descartes', 1),
    (@id_atividade, 'Hume', 0),
    (@id_atividade, 'Locke', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Para os empiristas, como John Locke, a origem do conhecimento está:', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Filosofia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Na experiência sensível', 1),
    (@id_atividade, 'Em ideias inatas', 0),
    (@id_atividade, 'No raciocínio puro, sem qualquer experiência', 0),
    (@id_atividade, 'Na revelação divina', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual obra de Maquiavel trata da conquista e da manutenção do poder político?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Filosofia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'O Príncipe', 1),
    (@id_atividade, 'Utopia', 0),
    (@id_atividade, 'Leviatã', 0),
    (@id_atividade, 'A República', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual filósofo afirmou que, no estado de natureza, haveria uma “guerra de todos contra todos”?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Filosofia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Montesquieu', 0),
    (@id_atividade, 'Jean-Jacques Rousseau', 0),
    (@id_atividade, 'John Locke', 0),
    (@id_atividade, 'Thomas Hobbes', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual conceito de Kant orienta que devemos agir de modo que nossa ação possa se tornar uma lei universal?', (SELECT id_materia FROM materias WHERE id_ano = 2 AND materia = 'Filosofia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Vontade de potência', 0),
    (@id_atividade, 'Maiêutica', 0),
    (@id_atividade, 'Cogito', 0),
    (@id_atividade, 'Imperativo categórico', 1);

-- 3º ano do Ensino Médio | Matemática
INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual é a distância entre os pontos A(1, 2) e B(4, 6) no plano cartesiano?', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Matemática'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '7', 0),
    (@id_atividade, '5', 1),
    (@id_atividade, '3', 0),
    (@id_atividade, '25', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual é o resultado de (2 + 3i) + (1 − i)?', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Matemática'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '3 + 2i', 1),
    (@id_atividade, '2 + 3i', 0),
    (@id_atividade, '3 + 4i', 0),
    (@id_atividade, '1 + 4i', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Um capital de R$ 1.000,00 é aplicado a juros simples, à taxa de 5% ao mês, durante 3 meses. Qual é o valor dos juros?', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Matemática'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'R$ 50,00', 0),
    (@id_atividade, 'R$ 157,63', 0),
    (@id_atividade, 'R$ 15,00', 0),
    (@id_atividade, 'R$ 150,00', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual é a mediana do conjunto de dados 2, 9, 4, 7, 12?', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Matemática'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '4', 0),
    (@id_atividade, '7', 1),
    (@id_atividade, '9', 0),
    (@id_atividade, '6,8', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual é o volume de uma esfera de raio 3 cm?', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Matemática'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '12π cm³', 0),
    (@id_atividade, '27π cm³', 0),
    (@id_atividade, '108π cm³', 0),
    (@id_atividade, '36π cm³', 1);


-- 3º ano do Ensino Médio | Português
INSERT INTO atividades (pergunta, id_materia) VALUES ('Em que ano aconteceu a Semana de Arte Moderna, marco inicial do Modernismo brasileiro?', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Português'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '1889', 0),
    (@id_atividade, '1930', 0),
    (@id_atividade, '1945', 0),
    (@id_atividade, '1922', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Quem é o autor do romance “Vidas Secas”?', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Português'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Graciliano Ramos', 1),
    (@id_atividade, 'Guimarães Rosa', 0),
    (@id_atividade, 'José Lins do Rego', 0),
    (@id_atividade, 'Jorge Amado', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('As diferenças de pronúncia e de vocabulário entre falantes de regiões distintas do país são exemplos de variação:', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Português'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Social (diastrática)', 0),
    (@id_atividade, 'Situacional (diafásica)', 0),
    (@id_atividade, 'Histórica (diacrônica)', 0),
    (@id_atividade, 'Regional (diatópica)', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Em “Estudei muito; portanto, fui aprovado”, a palavra “portanto” expressa ideia de:', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Português'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Conclusão', 1),
    (@id_atividade, 'Adição', 0),
    (@id_atividade, 'Oposição', 0),
    (@id_atividade, 'Causa', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Quem escreveu a obra “Macunaíma”, marco do Modernismo brasileiro?', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Português'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Manuel Bandeira', 0),
    (@id_atividade, 'Oswald de Andrade', 0),
    (@id_atividade, 'Mário de Andrade', 1),
    (@id_atividade, 'Monteiro Lobato', 0);


-- 3º ano do Ensino Médio | História
INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual evento é considerado o estopim da Primeira Guerra Mundial?', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'História'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'A queda do Muro de Berlim', 0),
    (@id_atividade, 'O ataque japonês a Pearl Harbor', 0),
    (@id_atividade, 'O assassinato do arquiduque Francisco Ferdinando, em Sarajevo', 1),
    (@id_atividade, 'A invasão da Polônia pela Alemanha', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Em 1937, Getúlio Vargas implantou qual regime no Brasil?', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'História'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Política do Café com Leite', 0),
    (@id_atividade, 'Governo Provisório', 0),
    (@id_atividade, 'Regime Militar', 0),
    (@id_atividade, 'Estado Novo', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Em que ano terminou a Segunda Guerra Mundial?', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'História'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '1939', 0),
    (@id_atividade, '1949', 0),
    (@id_atividade, '1945', 1),
    (@id_atividade, '1941', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('O Ato Institucional nº 5 (AI-5), de 1968, significou:', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'História'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'A convocação de uma Assembleia Constituinte', 0),
    (@id_atividade, 'A volta das eleições diretas para presidente', 0),
    (@id_atividade, 'A concessão da anistia política', 0),
    (@id_atividade, 'O endurecimento da ditadura, com suspensão de direitos e fechamento do Congresso', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Em que ano caiu o Muro de Berlim?', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'História'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '1989', 1),
    (@id_atividade, '1975', 0),
    (@id_atividade, '1961', 0),
    (@id_atividade, '1991', 0);


-- 3º ano do Ensino Médio | Química
INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual é o grupo funcional característico dos álcoois?', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Química'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Carbonila (C=O)', 0),
    (@id_atividade, 'Amino (–NH₂)', 0),
    (@id_atividade, 'Hidroxila (–OH)', 1),
    (@id_atividade, 'Carboxila (–COOH)', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Como são chamados os hidrocarbonetos de cadeia aberta que possuem uma ligação dupla entre carbonos?', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Química'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Aromáticos', 0),
    (@id_atividade, 'Alcenos', 1),
    (@id_atividade, 'Alcinos', 0),
    (@id_atividade, 'Alcanos', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Em uma pilha, o eletrodo em que ocorre a oxidação é chamado de:', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Química'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Ânodo', 1),
    (@id_atividade, 'Eletrólito', 0),
    (@id_atividade, 'Cátodo', 0),
    (@id_atividade, 'Ponte salina', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('A partícula alfa (α) emitida na radioatividade é constituída por:', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Química'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Um elétron de alta velocidade', 0),
    (@id_atividade, 'Um próton isolado', 0),
    (@id_atividade, 'Uma onda eletromagnética de alta energia', 0),
    (@id_atividade, '2 prótons e 2 nêutrons (núcleo de hélio)', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('O etanol (C₂H₆O) e o éter dimetílico (C₂H₆O) são exemplos de:', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Química'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Isômeros de posição', 0),
    (@id_atividade, 'Isômeros de função', 1),
    (@id_atividade, 'Isótopos', 0),
    (@id_atividade, 'Isômeros de cadeia', 0);


-- 3º ano do Ensino Médio | Biologia
INSERT INTO atividades (pergunta, id_materia) VALUES ('No cruzamento Aa × Aa, qual é a probabilidade de nascer um descendente aa?', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Biologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '0', 0),
    (@id_atividade, '1/4', 1),
    (@id_atividade, '3/4', 0),
    (@id_atividade, '1/2', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('A seleção natural, proposta por Charles Darwin, afirma que:', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Biologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Indivíduos mais adaptados ao ambiente tendem a sobreviver e a se reproduzir mais', 1),
    (@id_atividade, 'Características adquiridas pelo uso são transmitidas aos descendentes', 0),
    (@id_atividade, 'O ambiente provoca mutações dirigidas conforme a necessidade', 0),
    (@id_atividade, 'Todos os indivíduos têm a mesma chance de sobreviver, independentemente de suas características', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Em uma cadeia alimentar, quem ocupa o primeiro nível trófico?', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Biologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Os produtores (plantas e algas)', 1),
    (@id_atividade, 'Os decompositores', 0),
    (@id_atividade, 'Os consumidores secundários', 0),
    (@id_atividade, 'Os consumidores primários', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Na molécula de DNA, como se pareiam as bases nitrogenadas?', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Biologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Adenina com guanina e citosina com timina', 0),
    (@id_atividade, 'Adenina com citosina e timina com guanina', 0),
    (@id_atividade, 'Adenina com timina e citosina com guanina', 1),
    (@id_atividade, 'Adenina com uracila e citosina com guanina', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Um organismo transgênico é aquele que:', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Biologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Recebeu em seu genoma um gene de outra espécie', 1),
    (@id_atividade, 'Sofreu uma mutação espontânea', 0),
    (@id_atividade, 'Nasceu por reprodução assexuada', 0),
    (@id_atividade, 'Resultou de cruzamento natural entre duas variedades', 0);


-- 3º ano do Ensino Médio | Física
INSERT INTO atividades (pergunta, id_materia) VALUES ('Um resistor de 10 Ω é percorrido por uma corrente de 2 A. Qual é a tensão elétrica entre seus terminais?', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Física'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '20 V', 1),
    (@id_atividade, '5 V', 0),
    (@id_atividade, '12 V', 0),
    (@id_atividade, '0,2 V', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Um aparelho ligado a 220 V é percorrido por uma corrente de 5 A. Qual é a sua potência elétrica?', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Física'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '225 W', 0),
    (@id_atividade, '110 W', 0),
    (@id_atividade, '1.100 W', 1),
    (@id_atividade, '44 W', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Quem descobriu, em 1820, que uma corrente elétrica produz campo magnético?', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Física'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Isaac Newton', 0),
    (@id_atividade, 'Hans Christian Oersted', 1),
    (@id_atividade, 'Galileu Galilei', 0),
    (@id_atividade, 'Michael Faraday', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('O efeito fotoelétrico foi explicado por Einstein ao admitir que a luz:', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Física'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'É formada por pacotes de energia chamados fótons', 1),
    (@id_atividade, 'É uma onda mecânica que precisa do éter para se propagar', 0),
    (@id_atividade, 'Não transporta energia', 0),
    (@id_atividade, 'Tem velocidade que depende da velocidade da fonte', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Duas cargas elétricas de mesmo sinal:', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Física'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Se atraem', 0),
    (@id_atividade, 'Se neutralizam', 0),
    (@id_atividade, 'Não interagem', 0),
    (@id_atividade, 'Se repelem', 1);


-- 3º ano do Ensino Médio | Geografia
INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual gás de efeito estufa está mais associado à queima de combustíveis fósseis?', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Geografia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Hélio (He)', 0),
    (@id_atividade, 'Nitrogênio (N₂)', 0),
    (@id_atividade, 'Oxigênio (O₂)', 0),
    (@id_atividade, 'Dióxido de carbono (CO₂)', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual é a principal fonte de geração de energia elétrica no Brasil?', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Geografia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Nuclear', 0),
    (@id_atividade, 'Eólica', 0),
    (@id_atividade, 'Hidrelétrica', 1),
    (@id_atividade, 'Carvão mineral', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual sistema agrícola se caracteriza por grandes propriedades, monocultura e produção voltada à exportação?', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Geografia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Agricultura de subsistência', 0),
    (@id_atividade, 'Extrativismo vegetal', 0),
    (@id_atividade, 'Policultura familiar', 0),
    (@id_atividade, 'Plantation', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('A sigla BRICS reúne países emergentes como:', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Geografia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Bélgica, Rússia, Itália, Chile e Suécia', 0),
    (@id_atividade, 'Brasil, Rússia, Índia, China e África do Sul', 1),
    (@id_atividade, 'Japão, Alemanha, Canadá, França e Itália', 0),
    (@id_atividade, 'Bolívia, Romênia, Cuba, Chile e Síria', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual fenômeno de aquecimento anormal das águas do Pacífico provoca secas no Norte e no Nordeste do Brasil?', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Geografia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Chuva ácida', 0),
    (@id_atividade, 'El Niño', 1),
    (@id_atividade, 'Inversão térmica', 0),
    (@id_atividade, 'Maré vermelha', 0);


-- 3º ano do Ensino Médio | Inglês
INSERT INTO atividades (pergunta, id_materia) VALUES ('Complete: “If it rains tomorrow, we ___ at home.”', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Inglês'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'would stay', 0),
    (@id_atividade, 'stayed', 0),
    (@id_atividade, 'had stayed', 0),
    (@id_atividade, 'will stay', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Complete: “The Mona Lisa ___ by Leonardo da Vinci.”', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Inglês'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'was painted', 1),
    (@id_atividade, 'paints', 0),
    (@id_atividade, 'painted', 0),
    (@id_atividade, 'has painting', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Complete: “The woman ___ lives next door is a doctor.”', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Inglês'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'which', 0),
    (@id_atividade, 'where', 0),
    (@id_atividade, 'who', 1),
    (@id_atividade, 'whose', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('O que significa o phrasal verb “give up”?', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Inglês'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Desistir', 1),
    (@id_atividade, 'Dar um presente', 0),
    (@id_atividade, 'Levantar', 0),
    (@id_atividade, 'Ganhar', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Leia: “Tom wakes up at 6 a.m., has coffee and goes to work by bike. He never drives because he wants to protect the environment.” Por que Tom não dirige até o trabalho?', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Inglês'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Because he lives far from work', 0),
    (@id_atividade, 'Because he wants to protect the environment', 1),
    (@id_atividade, 'Because he doesn’t have a car', 0),
    (@id_atividade, 'Because he likes coffee', 0);


-- 3º ano do Ensino Médio | Sociologia
INSERT INTO atividades (pergunta, id_materia) VALUES ('O conceito de capital cultural, de Pierre Bourdieu, refere-se a:', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Sociologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Dinheiro acumulado em contas bancárias', 0),
    (@id_atividade, 'Máquinas e equipamentos industriais', 0),
    (@id_atividade, 'Conhecimentos, habilidades e bens culturais que geram vantagem social', 1),
    (@id_atividade, 'Prédios históricos tombados', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Para Michel Foucault, instituições como escolas, prisões e hospitais exercem:', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Sociologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Poder disciplinar sobre os corpos e comportamentos', 1),
    (@id_atividade, 'Poder apenas econômico', 0),
    (@id_atividade, 'Poder exclusivamente divino', 0),
    (@id_atividade, 'Nenhum tipo de poder', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual efeito é frequentemente associado à globalização?', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Sociologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'O isolamento econômico das nações', 0),
    (@id_atividade, 'A intensificação do fluxo de informações, mercadorias e capitais entre os países', 1),
    (@id_atividade, 'O desaparecimento do comércio internacional', 0),
    (@id_atividade, 'O fim das desigualdades sociais', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('O conceito de racismo estrutural indica que:', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Sociologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'O racismo tem justificativa biológica comprovada', 0),
    (@id_atividade, 'As desigualdades raciais são reproduzidas pela organização da sociedade e de suas instituições', 1),
    (@id_atividade, 'O racismo deixou de existir após a abolição da escravatura', 0),
    (@id_atividade, 'O racismo é apenas uma atitude isolada de alguns indivíduos', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Quem formulou o conceito de “modernidade líquida”?', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Sociologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Auguste Comte', 0),
    (@id_atividade, 'Karl Marx', 0),
    (@id_atividade, 'Zygmunt Bauman', 1),
    (@id_atividade, 'Émile Durkheim', 0);

-- 3º ano do Ensino Médio | Filosofia
INSERT INTO atividades (pergunta, id_materia) VALUES ('A expressão “Deus está morto”, de Nietzsche, significa principalmente que:', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Filosofia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'A ciência provou que nenhuma cultura acreditou em Deus', 0),
    (@id_atividade, 'O filósofo defendia o uso da violência', 0),
    (@id_atividade, 'Deus morreu fisicamente em algum momento da história', 0),
    (@id_atividade, 'Os valores tradicionais perderam sua força na modernidade', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('A frase “a existência precede a essência” está associada a qual corrente filosófica?', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Filosofia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Estoicismo', 0),
    (@id_atividade, 'Existencialismo (Sartre)', 1),
    (@id_atividade, 'Positivismo', 0),
    (@id_atividade, 'Idealismo platônico', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Hannah Arendt cunhou a expressão “banalidade do mal” ao analisar:', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Filosofia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'A queda do Muro de Berlim', 0),
    (@id_atividade, 'O julgamento de Adolf Eichmann', 1),
    (@id_atividade, 'A Revolução Francesa', 0),
    (@id_atividade, 'O julgamento de Sócrates', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Para Karl Popper, uma teoria é científica quando:', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Filosofia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'É aceita por toda a comunidade sem questionamento', 0),
    (@id_atividade, 'Baseia-se na tradição', 0),
    (@id_atividade, 'Pode ser testada e potencialmente refutada (falseável)', 1),
    (@id_atividade, 'Pode ser comprovada definitivamente', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Na ética utilitarista de Bentham e Stuart Mill, uma ação é correta quando:', (SELECT id_materia FROM materias WHERE id_ano = 3 AND materia = 'Filosofia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Segue um dever universal, independentemente das consequências', 0),
    (@id_atividade, 'Agrada a uma divindade', 0),
    (@id_atividade, 'Produz a maior felicidade possível para o maior número de pessoas', 1),
    (@id_atividade, 'Beneficia somente quem a pratica', 0);


-- ===================== VESTIBULAR =====================

-- Vestibular | Matemática
INSERT INTO atividades (pergunta, id_materia) VALUES ('Um preço sofre um aumento de 10% e, em seguida, um desconto de 10%. Em relação ao preço original, o preço final:', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Matemática'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Diminui 1%', 1),
    (@id_atividade, 'Aumenta 1%', 0),
    (@id_atividade, 'É igual', 0),
    (@id_atividade, 'Diminui 10%', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Uma urna tem 3 bolas vermelhas e 2 azuis. Retirando duas bolas, sem reposição, qual é a probabilidade de ambas serem vermelhas?', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Matemática'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '1/10', 0),
    (@id_atividade, '3/5', 0),
    (@id_atividade, '9/25', 0),
    (@id_atividade, '3/10', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('A altura (em metros) de uma bola lançada é dada por h(t) = −t² + 6t, com t em segundos. Qual é a altura máxima atingida?', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Matemática'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '6 m', 0),
    (@id_atividade, '18 m', 0),
    (@id_atividade, '9 m', 1),
    (@id_atividade, '3 m', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Uma torneira enche um tanque em 6 horas e outra enche o mesmo tanque em 3 horas. Funcionando juntas, em quanto tempo o enchem?', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Matemática'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '2 horas', 1),
    (@id_atividade, '4,5 horas', 0),
    (@id_atividade, '9 horas', 0),
    (@id_atividade, '3 horas', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual é a soma dos infinitos termos da progressão geométrica 8, 4, 2, 1, ...?', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Matemática'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '15', 0),
    (@id_atividade, '32', 0),
    (@id_atividade, '16', 1),
    (@id_atividade, '12', 0);


-- Vestibular | Português
INSERT INTO atividades (pergunta, id_materia) VALUES ('Em um poema em que predomina a expressão das emoções do eu lírico, qual é a função da linguagem predominante?', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Português'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Metalinguística', 0),
    (@id_atividade, 'Conativa', 0),
    (@id_atividade, 'Referencial', 0),
    (@id_atividade, 'Emotiva (expressiva)', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Dizer “Ele nos deixou” no lugar de “Ele morreu” é um exemplo de:', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Português'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Hipérbole', 0),
    (@id_atividade, 'Eufemismo', 1),
    (@id_atividade, 'Pleonasmo', 0),
    (@id_atividade, 'Antítese', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Quando um texto retoma, cita ou dialoga com outro texto, ocorre:', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Português'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Intertextualidade', 1),
    (@id_atividade, 'Polissemia', 0),
    (@id_atividade, 'Denotação', 0),
    (@id_atividade, 'Coesão referencial', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Em qual frase o uso da crase está correto?', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Português'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Fui à escola ontem.', 1),
    (@id_atividade, 'Comprei o livro à ela.', 0),
    (@id_atividade, 'Estou disposto à ajudar.', 0),
    (@id_atividade, 'Ele chegou à pé.', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('No romance “Memórias Póstumas de Brás Cubas”, de Machado de Assis, o narrador é:', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Português'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Um narrador neutro e impessoal, sem opinião', 0),
    (@id_atividade, 'Um defunto-autor, que conta sua vida depois de morto', 1),
    (@id_atividade, 'Uma criança que narra suas aventuras', 0),
    (@id_atividade, 'Uma testemunha anônima dos fatos', 0);


-- Vestibular | História
INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual era o lema da Revolução Francesa?', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'História'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Deus, Pátria e Família', 0),
    (@id_atividade, 'Liberdade, Igualdade e Fraternidade', 1),
    (@id_atividade, 'Paz, Terra e Pão', 0),
    (@id_atividade, 'Ordem e Progresso', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('A política do “café com leite”, na República Velha, baseava-se na alternância no poder entre as oligarquias de:', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'História'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'São Paulo e Minas Gerais', 1),
    (@id_atividade, 'Rio de Janeiro e Paraná', 0),
    (@id_atividade, 'Rio Grande do Sul e Bahia', 0),
    (@id_atividade, 'Pernambuco e Pará', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('A Conferência de Berlim (1884–1885) tratou:', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'História'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Da divisão da Alemanha após a guerra', 0),
    (@id_atividade, 'Do fim da escravidão no Brasil', 0),
    (@id_atividade, 'Da partilha da África entre as potências europeias', 1),
    (@id_atividade, 'Da criação da ONU', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('A Constituição brasileira de 1988 ficou conhecida como:', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'História'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Constituição Polaca', 0),
    (@id_atividade, 'Constituição Cidadã', 1),
    (@id_atividade, 'Constituição Imperial', 0),
    (@id_atividade, 'Constituição Republicana de 1891', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('A Crise dos Mísseis, de 1962, envolveu:', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'História'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Estados Unidos e União Soviética, por causa de mísseis soviéticos instalados em Cuba', 1),
    (@id_atividade, 'Reino Unido e Argentina, por causa das Ilhas Malvinas', 0),
    (@id_atividade, 'China e Japão, por causa de disputas marítimas', 0),
    (@id_atividade, 'Estados Unidos e Coreia do Norte, por causa de armas químicas', 0);

-- Vestibular | Química
INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual poluente atmosférico está diretamente associado à formação da chuva ácida?', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Química'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Argônio (Ar)', 0),
    (@id_atividade, 'Nitrogênio (N₂)', 0),
    (@id_atividade, 'Oxigênio (O₂)', 0),
    (@id_atividade, 'Dióxido de enxofre (SO₂)', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Foram dissolvidos 40 g de NaOH em água, formando 2 L de solução. Qual é a concentração comum dessa solução?', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Química'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '80 g/L', 0),
    (@id_atividade, '20 g/L', 1),
    (@id_atividade, '40 g/L', 0),
    (@id_atividade, '0,05 g/L', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Em um sistema em equilíbrio químico, ao aumentar a concentração de um reagente, o equilíbrio:', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Química'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'É totalmente destruído', 0),
    (@id_atividade, 'Desloca-se no sentido de formar mais reagentes', 0),
    (@id_atividade, 'Desloca-se no sentido de formar mais produtos', 1),
    (@id_atividade, 'Permanece inalterado', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual é o principal componente do gás natural?', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Química'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Acetileno (C₂H₂)', 0),
    (@id_atividade, 'Metano (CH₄)', 1),
    (@id_atividade, 'Butano (C₄H₁₀)', 0),
    (@id_atividade, 'Etanol (C₂H₆O)', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual é o número de oxidação (NOX) do manganês no permanganato de potássio (KMnO₄)?', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Química'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '+7', 1),
    (@id_atividade, '+2', 0),
    (@id_atividade, '+5', 0),
    (@id_atividade, '+4', 0);


-- Vestibular | Biologia
INSERT INTO atividades (pergunta, id_materia) VALUES ('A eutrofização de lagos e rios é causada principalmente por:', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Biologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Excesso de oxigênio dissolvido na água', 0),
    (@id_atividade, 'Excesso de nutrientes, como fósforo e nitrogênio, vindos de esgoto e fertilizantes', 1),
    (@id_atividade, 'Falta de luz solar na superfície', 0),
    (@id_atividade, 'Ausência total de microrganismos', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('No sistema ABO, uma pessoa do tipo O pode receber sangue de quais tipos?', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Biologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Somente do tipo O', 1),
    (@id_atividade, 'Dos tipos A, B e AB', 0),
    (@id_atividade, 'De qualquer tipo', 0),
    (@id_atividade, 'Somente do tipo AB', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual hormônio, produzido pelo pâncreas, reduz a concentração de glicose no sangue?', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Biologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Testosterona', 0),
    (@id_atividade, 'Adrenalina', 0),
    (@id_atividade, 'Insulina', 1),
    (@id_atividade, 'Glucagon', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('O uso inadequado de antibióticos favorece o surgimento de bactérias resistentes porque:', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Biologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Elimina as bactérias sensíveis e seleciona as já resistentes, que se multiplicam', 1),
    (@id_atividade, 'Os antibióticos transformam vírus em bactérias', 0),
    (@id_atividade, 'O corpo humano deixa de produzir anticorpos', 0),
    (@id_atividade, 'As bactérias criam resistência por necessidade durante a vida do paciente', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual é a principal função da camada de ozônio?', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Biologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Impedir a entrada de meteoros', 0),
    (@id_atividade, 'Reter o calor irradiado pela superfície terrestre', 0),
    (@id_atividade, 'Absorver grande parte da radiação ultravioleta do Sol', 1),
    (@id_atividade, 'Fornecer oxigênio para a respiração', 0);


-- Vestibular | Física
INSERT INTO atividades (pergunta, id_materia) VALUES ('Que transformação de energia ocorre em uma usina hidrelétrica?', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Física'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Energia química do carvão → energia elétrica', 0),
    (@id_atividade, 'Energia solar → energia térmica → energia elétrica', 0),
    (@id_atividade, 'Energia potencial da água → energia cinética → energia elétrica', 1),
    (@id_atividade, 'Energia nuclear → energia térmica → energia elétrica', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Um chuveiro de 5.000 W é usado 30 minutos por dia durante 30 dias. Qual é o consumo de energia no período?', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Física'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '25 kWh', 0),
    (@id_atividade, '150 kWh', 0),
    (@id_atividade, '75 kWh', 1),
    (@id_atividade, '2,5 kWh', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Um objeto totalmente imerso em um líquido recebe uma força vertical para cima (empuxo) de módulo igual ao:', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Física'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Peso do volume de líquido deslocado', 1),
    (@id_atividade, 'Volume do líquido do recipiente', 0),
    (@id_atividade, 'Peso do próprio objeto, em qualquer situação', 0),
    (@id_atividade, 'Produto da massa do objeto pela sua velocidade', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual é a quantidade de calor necessária para aquecer 200 g de água de 20 °C até 70 °C? (Dado: c = 1 cal/g·°C)', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Física'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '4.000 cal', 0),
    (@id_atividade, '50 cal', 0),
    (@id_atividade, '10.000 cal', 1),
    (@id_atividade, '14.000 cal', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('O som se propaga no ar a cerca de 340 m/s. Um trovão é ouvido 3 s após o relâmpago. A que distância, aproximadamente, caiu o raio?', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Física'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '3.400 m', 0),
    (@id_atividade, '1.020 m', 1),
    (@id_atividade, '340 m', 0),
    (@id_atividade, '113 m', 0);


-- Vestibular | Geografia
INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual tipo de clima predomina no interior do Nordeste brasileiro, com chuvas escassas e irregulares?', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Geografia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Tropical de altitude', 0),
    (@id_atividade, 'Semiárido', 1),
    (@id_atividade, 'Equatorial', 0),
    (@id_atividade, 'Subtropical', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual fenômeno dificulta a dispersão de poluentes nas grandes cidades, principalmente no inverno?', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Geografia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Inversão térmica', 1),
    (@id_atividade, 'Chuva orográfica', 0),
    (@id_atividade, 'Chuva ácida', 0),
    (@id_atividade, 'Efeito estufa', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual país NÃO é membro permanente do Conselho de Segurança da ONU?', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Geografia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'França', 0),
    (@id_atividade, 'Reino Unido', 0),
    (@id_atividade, 'Alemanha', 1),
    (@id_atividade, 'China', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('O êxodo rural no Brasil, mais intenso a partir de 1950, esteve associado:', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Geografia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'À descoberta de ouro no Centro-Oeste', 0),
    (@id_atividade, 'À criação de reservas indígenas', 0),
    (@id_atividade, 'À abolição da escravatura', 0),
    (@id_atividade, 'À industrialização e à mecanização do campo', 1);

INSERT INTO atividades (pergunta, id_materia) VALUES ('O Aquífero Guarani estende-se por quais países?', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Geografia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Argentina, Chile, Uruguai e Paraguai, sem o Brasil', 0),
    (@id_atividade, 'Brasil, Chile, Peru e Bolívia', 0),
    (@id_atividade, 'Brasil, Argentina, Paraguai e Uruguai', 1),
    (@id_atividade, 'Brasil, Colômbia, Venezuela e Equador', 0);


-- Vestibular | Inglês
INSERT INTO atividades (pergunta, id_materia) VALUES ('Leia: “Solar panels convert sunlight into electricity. They produce no air pollution while operating.” Segundo o texto, os painéis solares:', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Inglês'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Funcionam apenas à noite', 0),
    (@id_atividade, 'Produzem eletricidade sem poluir o ar enquanto funcionam', 1),
    (@id_atividade, 'Poluem o ar durante a operação', 0),
    (@id_atividade, 'Usam combustíveis fósseis', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Que ideia a palavra “although” expressa?', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Inglês'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Tempo', 0),
    (@id_atividade, 'Adição', 0),
    (@id_atividade, 'Contraste (concessão)', 1),
    (@id_atividade, 'Causa', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Complete: “She has lived here ___ 2015.”', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Inglês'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'ago', 0),
    (@id_atividade, 'during', 0),
    (@id_atividade, 'since', 1),
    (@id_atividade, 'for', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Complete: “I’m looking forward ___ meeting you.”', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Inglês'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'with', 0),
    (@id_atividade, 'to', 1),
    (@id_atividade, 'for', 0),
    (@id_atividade, 'at', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Complete: “By the time we arrived, the movie ___.”', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Inglês'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'was already start', 0),
    (@id_atividade, 'had already started', 1),
    (@id_atividade, 'already starts', 0),
    (@id_atividade, 'has already started', 0);


-- Vestibular | Sociologia
INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual índice é usado para medir a desigualdade de renda em um país?', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Sociologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Coeficiente de Gini', 1),
    (@id_atividade, 'PIB per capita', 0),
    (@id_atividade, 'IDH', 0),
    (@id_atividade, 'Taxa de câmbio', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('O relativismo cultural é a postura de:', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Sociologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Compreender cada cultura a partir de seus próprios valores e contexto', 1),
    (@id_atividade, 'Impor os costumes de um povo aos outros', 0),
    (@id_atividade, 'Considerar uma cultura superior às demais', 0),
    (@id_atividade, 'Rejeitar todas as manifestações culturais', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('O fordismo caracteriza-se por:', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Sociologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Produção em série em linha de montagem', 1),
    (@id_atividade, 'Produção sob demanda, com estoque mínimo (just in time)', 0),
    (@id_atividade, 'Produção artesanal e individual', 0),
    (@id_atividade, 'Economia de subsistência', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Em que ano foi proclamada a Declaração Universal dos Direitos Humanos, pela ONU?', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Sociologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, '1988', 0),
    (@id_atividade, '1948', 1),
    (@id_atividade, '1789', 0),
    (@id_atividade, '1919', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Segundo Max Weber, a dominação baseada em leis e regras impessoais, típica da burocracia moderna, é a:', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Sociologia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Carismática', 0),
    (@id_atividade, 'Tradicional', 0),
    (@id_atividade, 'Legal-racional', 1),
    (@id_atividade, 'Teocrática', 0);


-- Vestibular | Filosofia
INSERT INTO atividades (pergunta, id_materia) VALUES ('Para Aristóteles, a virtude ética consiste em:', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Filosofia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Um meio-termo entre o excesso e a falta', 1),
    (@id_atividade, 'Buscar o máximo prazer a qualquer custo', 0),
    (@id_atividade, 'Obedecer cegamente às leis', 0),
    (@id_atividade, 'Renunciar a todos os desejos', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Em “O Contrato Social”, Rousseau defende que a soberania pertence:', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Filosofia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Aos mais ricos da sociedade', 0),
    (@id_atividade, 'Ao monarca, por direito divino', 0),
    (@id_atividade, 'Ao povo, expressa na vontade geral', 1),
    (@id_atividade, 'A um governante absoluto', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Qual filósofo buscou conciliar o racionalismo e o empirismo?', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Filosofia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Immanuel Kant', 1),
    (@id_atividade, 'René Descartes', 0),
    (@id_atividade, 'Francis Bacon', 0),
    (@id_atividade, 'David Hume', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('A frase “Não se nasce mulher: torna-se mulher” é de:', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Filosofia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'Hannah Arendt', 0),
    (@id_atividade, 'Simone Weil', 0),
    (@id_atividade, 'Simone de Beauvoir', 1),
    (@id_atividade, 'Marilena Chauí', 0);

INSERT INTO atividades (pergunta, id_materia) VALUES ('Em “A Sociedade do Espetáculo”, Guy Debord critica:', (SELECT id_materia FROM materias WHERE id_ano = 4 AND materia = 'Filosofia'));
SET @id_atividade = LAST_INSERT_ID();
INSERT INTO alternativas (id_atividade, texto, correta) VALUES
    (@id_atividade, 'A proibição do cinema', 0),
    (@id_atividade, 'O fim das artes visuais', 0),
    (@id_atividade, 'A transformação das relações sociais em imagens e mercadorias consumidas', 1),
    (@id_atividade, 'O excesso de livros publicados', 0);


COMMIT;



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
