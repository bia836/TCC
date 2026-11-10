-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10/11/2026 às 18:20
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
(1, '1? ano do Ensino M?dio'),
(2, '2 ano do Ensino M?dio'),
(3, '3? ano do Ensino M?dio');

-- --------------------------------------------------------

--
-- Estrutura para tabela `atividades`
--

CREATE TABLE `atividades` (
  `id` int(11) NOT NULL,
  `pergunta` text NOT NULL,
  `resposta_correta` text NOT NULL,
  `id_conteudo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`) VALUES
(1, 'Matem?tica');

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
(1, 'História - Como estudar História para o Vestibular', 'Introdução e principais temas cobrados', 'https://youtube.com/watch?v=F5GGs1Rpt7I', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(2, 'História - Aula 2', 'Descrição do conteúdo da aula', 'https://youtube.com/watch?v=LxuTxkHAXeQ', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(3, 'História - Aula 3', 'Descrição do conteúdo da aula', 'https://youtube.com/watch?v=8v_w8itTslc', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(4, 'Geografia - O que mais cai na UERJ', 'Análise dos conteúdos cobrados', 'https://youtube.com/watch?v=9E8ajFP0Iq0', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(5, 'Geografia - Aula 2', 'Descrição do conteúdo da aula', 'https://youtube.com/watch?v=nrzFMOq1k-w', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(6, 'Geografia - Aula 3', 'Descrição do conteúdo da aula', 'https://youtube.com/live/YvH0XoPyANA', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(7, 'Biologia do Zero - Mapa Mental e Introdução', 'Visão geral e tópicos introdutórios', 'https://youtube.com/watch?v=bMwEgGaB1ZQ', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(8, 'Biologia - Aula 2', 'Descrição do conteúdo da aula', 'https://youtube.com/watch?v=6H_8eFmx-g0', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(9, 'Biologia - Aula 3', 'Descrição do conteúdo da aula', 'https://youtube.com/watch?v=Ijb2CVy_-y0', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(10, 'Introdução à História da Arte', 'História da Arte para o ENEM e vestibulares', 'https://youtube.com/watch?v=oqn1IfHRdNg', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(11, 'Arte - Aula 2', 'Descrição do conteúdo da aula', 'https://youtube.com/watch?v=8jRs5CZwbQM', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(12, 'Arte - Aula 3', 'Descrição do conteúdo da aula', 'https://youtube.com/live/38cIFkeWgcs', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(13, 'Português - Aula 1', 'Descrição do conteúdo da aula', 'https://youtube.com/watch?v=LMaE0gAsI04', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(14, 'Português - Aula 2', 'Descrição do conteúdo da aula', 'https://youtube.com/watch?v=X61lboe5_pM', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(15, 'Português - Aula 3', 'Descrição do conteúdo da aula', 'https://youtube.com/watch?v=XsN0e_xPyNI', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(16, 'Matemática - Aula 1', 'Descrição do conteúdo da aula', 'https://youtube.com/watch?v=MSZdhDBoXe0', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(17, 'Matemática - Aula 2', 'Descrição do conteúdo da aula', 'https://youtube.com/watch?v=ddZHkCUcYRM', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(18, 'Matemática - Aula 3', 'Descrição do conteúdo da aula', 'https://youtube.com/watch?v=0HXlohthSoY', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(19, 'Química - Aula 1', 'Descrição do conteúdo da aula', 'https://youtube.com/watch?v=7kluWpnlVPU', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(20, 'Química - Aula 2', 'Descrição do conteúdo da aula', 'https://youtube.com/live/7Ad9IHTXmw0', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(21, 'Química - Aula 3', 'Descrição do conteúdo da aula', 'https://youtube.com/live/qfBCDMX3Yy4', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(22, 'Física - Aula 1', 'Descrição do conteúdo da aula', 'https://youtube.com/watch?v=5eid5-U3Dvw', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(23, 'Física - Aula 2', 'Descrição do conteúdo da aula', 'https://youtube.com/watch?v=hxciSW_B8Hw', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(24, 'Física - Aula 3', 'Descrição do conteúdo da aula', 'https://youtube.com/watch?v=Sj3sCRwMc0Q', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(25, 'Filosofia - Aula 1', 'Descrição do conteúdo da aula', 'https://youtube.com/watch?v=UK6OKSsastQ', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(26, 'Filosofia - Aula 2', 'Descrição do conteúdo da aula', 'https://youtube.com/watch?v=Y9_UovLgduo', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(27, 'Filosofia - Aula 3', 'Descrição do conteúdo da aula', 'https://youtube.com/live/ZmKPQuJAq3s', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(28, 'Sociologia - Aula 1', 'Descrição do conteúdo da aula', 'https://youtube.com/watch?v=u0C3F1Fq32E', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(29, 'Sociologia - Aula 2', 'Descrição do conteúdo da aula', 'https://youtube.com/live/u4ZREcGwkF4', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(30, 'Sociologia - Aula 3', 'Descrição do conteúdo da aula', 'https://youtube.com/live/oxApmqaXlsM', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(31, 'Redação - Aula 1', 'Descrição do conteúdo da aula', 'https://youtube.com/watch?v=VRQtqA3Fbeo', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(32, 'Redação - Aula 2', 'Descrição do conteúdo da aula', 'https://youtube.com/watch?v=MeKHJVPNV30', 'aula', '2026-10-14 13:38:52', NULL, NULL),
(33, 'Redação - Aula 3', 'Descrição do conteúdo da aula', 'https://youtube.com/watch?v=TuBKsV3lSQc', 'aula', '2026-10-14 13:38:52', NULL, NULL);

-- --------------------------------------------------------

--
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
(33, 3, 'Redação');

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

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `id_pessoa` int(11) NOT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

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
  ADD KEY `id_conteudo` (`id_conteudo`);

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

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
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pessoa` (`id_pessoa`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `anos`
--
ALTER TABLE `anos`
  MODIFY `id_ano` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `atividades`
--
ALTER TABLE `atividades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `conteudos`
--
ALTER TABLE `conteudos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `materias`
--
ALTER TABLE `materias`
  MODIFY `id_materia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de tabela `pessoas`
--
ALTER TABLE `pessoas`
  MODIFY `id_pessoa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `planejamento`
--
ALTER TABLE `planejamento`
  MODIFY `id_planejamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `progresso`
--
ALTER TABLE `progresso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `resumos`
--
ALTER TABLE `resumos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `atividades`
--
ALTER TABLE `atividades`
  ADD CONSTRAINT `atividades_ibfk_1` FOREIGN KEY (`id_conteudo`) REFERENCES `conteudos` (`id`);

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
  ADD CONSTRAINT `conteudo_categoria_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);

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
-- Restrições para tabelas `progresso`
--
ALTER TABLE `progresso`
  ADD CONSTRAINT `progresso_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `progresso_ibfk_2` FOREIGN KEY (`id_atividade`) REFERENCES `atividades` (`id`);

--
-- Restrições para tabelas `resumos`
--
ALTER TABLE `resumos`
  ADD CONSTRAINT `resumos_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoas` (`id_pessoa`),
  ADD CONSTRAINT `resumos_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`);

--
-- Restrições para tabelas `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoas` (`id_pessoa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
