-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Tempo de geração: 11/03/2026 às 23:18
-- Versão do servidor: 8.0.43
-- Versão do PHP: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sistema_minimas`
--
CREATE DATABASE IF NOT EXISTS `sistema_minimas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `sistema_minimas`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cadastros_itens_minimas`
--

CREATE TABLE `cadastros_itens_minimas` (
  `id` int NOT NULL,
  `marca` varchar(60) NOT NULL,
  `categoria_pt_br` varchar(100) NOT NULL,
  `categoria_us` varchar(100) NOT NULL,
  `categoria_es` varchar(100) NOT NULL,
  `serie` varchar(60) NOT NULL,
  `tamanho_nominal` varchar(30) NOT NULL,
  `descricao` varchar(150) NOT NULL,
  `codigo_barras_cx` varchar(30) NOT NULL,
  `superficie_pt_br` varchar(60) NOT NULL,
  `superficie_us` varchar(60) NOT NULL,
  `superficie_es` varchar(60) NOT NULL,
  `junta_assentamento` double DEFAULT NULL,
  `abrasao_superficial` int DEFAULT NULL,
  `variacao_tonalidade` varchar(20) DEFAULT NULL,
  `unidade_medida` varchar(20) NOT NULL,
  `pecas_caixa` int NOT NULL,
  `m2_caixa` decimal(10,3) NOT NULL,
  `peso_caixa` decimal(10,3) NOT NULL,
  `coeficiente_atrito` varchar(10) DEFAULT NULL,
  `espessura` decimal(10,3) NOT NULL,
  `grupo_absorcao` varchar(20) DEFAULT NULL,
  `item_ativo` tinyint(1) NOT NULL DEFAULT '1',
  `cor_pt_br` varchar(80) NOT NULL,
  `cor_us` varchar(80) NOT NULL,
  `cor_es` varchar(80) NOT NULL,
  `recomendado_uso` varchar(30) NOT NULL,
  `local_uso` varchar(120) DEFAULT NULL,
  `retificado` tinyint(1) NOT NULL DEFAULT '0',
  `polo` varchar(20) NOT NULL,
  `lancamento` tinyint(1) NOT NULL DEFAULT '0',
  `estilo` varchar(80) NOT NULL,
  `estilo_us` varchar(80) NOT NULL,
  `estilo_es` varchar(80) NOT NULL,
  `relevo` tinyint(1) NOT NULL DEFAULT '0',
  `rodape` tinyint(1) NOT NULL DEFAULT '0',
  `numeros_face` int NOT NULL,
  `tamanho_fabricacao` varchar(50) NOT NULL,
  `codigo_item` varchar(40) NOT NULL,
  `unidade_fabricacao` varchar(60) NOT NULL,
  `monocalibre` tinyint(1) NOT NULL DEFAULT '0',
  `CicloLancamento` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `responsavel_carga` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `cadastros_itens_minimas`
--

INSERT INTO `cadastros_itens_minimas` (`id`, `marca`, `categoria_pt_br`, `categoria_us`, `categoria_es`, `serie`, `tamanho_nominal`, `descricao`, `codigo_barras_cx`, `superficie_pt_br`, `superficie_us`, `superficie_es`, `junta_assentamento`, `abrasao_superficial`, `variacao_tonalidade`, `unidade_medida`, `pecas_caixa`, `m2_caixa`, `peso_caixa`, `coeficiente_atrito`, `espessura`, `grupo_absorcao`, `item_ativo`, `cor_pt_br`, `cor_us`, `cor_es`, `recomendado_uso`, `local_uso`, `retificado`, `polo`, `lancamento`, `estilo`, `estilo_us`, `estilo_es`, `relevo`, `rodape`, `numeros_face`, `tamanho_fabricacao`, `codigo_item`, `unidade_fabricacao`, `monocalibre`, `CicloLancamento`, `data_criacao`, `responsavel_carga`) VALUES
(4, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'MUNARI', '90X90', 'MUNARI BRANCO AC', '80820020552', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.310, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8070241', 'SC2', 1, '1/26', '2026-03-03 01:07:20', '2026-02-25 02:42:34'),
(5, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'MINIMUM', '120X120', 'MUNARI BRANCO AC', '80820020552', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.310, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8070234', 'SC2', 1, '1/26', '2026-03-03 01:07:20', '2026-02-25 02:42:34'),
(6, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'URBANO', '90X90', 'MUNARI BRANCO AC', '80820020552', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.310, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8070235', 'SC2', 1, '1/26', '2026-03-03 01:07:20', '2026-02-25 02:42:34'),
(7, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'TURCO', '120X120', 'MUNARI BRANCO AC', '80820020551', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.310, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8070236', 'SC2', 1, '1/26', '2026-03-03 01:07:20', '2026-02-25 02:42:34'),
(8, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'MACARRI', '120X120', 'MUNARI BRANCO AC', '80820020552', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.310, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8070237', 'SC2', 1, '1/26', '2026-03-03 01:07:20', '2026-02-25 02:42:34'),
(9, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'LAMESCO', '120X120', 'MUNARI BRANCO AC', '80820020552', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.310, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8070238', 'SC2', 1, '1/26', '2026-03-03 01:07:20', '2026-02-25 02:42:34'),
(10, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'TILAPIA', '120X120', 'MUNARI BRANCO AC', '80820020552', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.310, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8070239', 'SC2', 1, '1/26', '2026-03-03 01:07:20', '2026-02-25 02:42:34'),
(11, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'TAMANDAI', '90X90', 'MUNARI BRANCO AC', '80820020552', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.310, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8070240', 'SC2', 1, '1/26', '2026-03-03 01:07:20', '2026-02-25 02:42:34');

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens_movimentacoes`
--

CREATE TABLE `itens_movimentacoes` (
  `id` int NOT NULL,
  `processo_id` int NOT NULL,
  `area_origem` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `area_destino` text NOT NULL,
  `acao` varchar(100) NOT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `observacao` text,
  `data_acao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `itens_movimentacoes`
--

INSERT INTO `itens_movimentacoes` (`id`, `processo_id`, `area_origem`, `area_destino`, `acao`, `usuario`, `observacao`, `data_acao`) VALUES
(1, 2, 'sistema', '', 'processo_iniciado', 'upload_csv', NULL, '2026-03-03 01:07:20'),
(2, 3, 'sistema', '', 'processo_iniciado', 'upload_csv', NULL, '2026-03-03 01:07:20'),
(3, 4, 'sistema', '', 'processo_iniciado', 'upload_csv', NULL, '2026-03-03 01:07:20'),
(4, 5, 'sistema', '', 'processo_iniciado', 'upload_csv', NULL, '2026-03-03 01:07:20'),
(5, 6, 'sistema', '', 'processo_iniciado', 'upload_csv', NULL, '2026-03-03 01:07:20'),
(6, 7, 'sistema', '', 'processo_iniciado', 'upload_csv', NULL, '2026-03-03 01:07:20'),
(7, 8, 'sistema', '', 'processo_iniciado', 'upload_csv', NULL, '2026-03-03 01:07:20'),
(8, 9, 'sistema', '', 'processo_iniciado', 'upload_csv', NULL, '2026-03-03 01:07:20');

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens_processos`
--

CREATE TABLE `itens_processos` (
  `id` int NOT NULL,
  `item_id` int NOT NULL,
  `etapa_atual` varchar(100) NOT NULL DEFAULT 'comunicacao_analise',
  `status_geral` enum('em_andamento','finalizado','reprovado') NOT NULL DEFAULT 'em_andamento',
  `iniciado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `finalizado_em` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `itens_processos`
--

INSERT INTO `itens_processos` (`id`, `item_id`, `etapa_atual`, `status_geral`, `iniciado_em`, `finalizado_em`) VALUES
(2, 4, 'comunicacao', 'em_andamento', '2026-03-03 01:07:20', NULL),
(3, 5, 'comunicacao', 'em_andamento', '2026-03-03 01:07:20', NULL),
(4, 6, 'comunicacao', 'em_andamento', '2026-03-03 01:07:20', NULL),
(5, 7, 'comunicacao', 'em_andamento', '2026-03-03 01:07:20', NULL),
(6, 8, 'comunicacao', 'em_andamento', '2026-03-03 01:07:20', NULL),
(7, 9, 'comunicacao', 'em_andamento', '2026-03-03 01:07:20', NULL),
(8, 10, 'detec', 'em_andamento', '2026-03-03 01:07:20', NULL),
(9, 11, 'detec', 'em_andamento', '2026-03-03 01:07:20', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `processo_comunicacao`
--

CREATE TABLE `processo_comunicacao` (
  `id` int NOT NULL,
  `processo_id` int NOT NULL,
  `precisa_foto` tinyint(1) NOT NULL,
  `qtd_pecas_foto` int DEFAULT NULL,
  `precisa_video` tinyint(1) NOT NULL,
  `qtd_pecas_video` int DEFAULT NULL,
  `observacao` text,
  `aprovado_por` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `data_aprovacao` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cadastros_itens_minimas`
--
ALTER TABLE `cadastros_itens_minimas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_codigo_item` (`codigo_item`),
  ADD KEY `idx_marca` (`marca`),
  ADD KEY `idx_unidade_fabril` (`unidade_fabricacao`),
  ADD KEY `idx_data_criacao` (`data_criacao`);

--
-- Índices de tabela `itens_movimentacoes`
--
ALTER TABLE `itens_movimentacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_processo` (`processo_id`),
  ADD KEY `idx_area` (`area_origem`),
  ADD KEY `idx_data` (`data_acao`);

--
-- Índices de tabela `itens_processos`
--
ALTER TABLE `itens_processos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_item` (`item_id`),
  ADD KEY `idx_etapa` (`etapa_atual`),
  ADD KEY `idx_status` (`status_geral`),
  ADD KEY `idx_iniciado` (`iniciado_em`);

--
-- Índices de tabela `processo_comunicacao`
--
ALTER TABLE `processo_comunicacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `processo_id` (`processo_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cadastros_itens_minimas`
--
ALTER TABLE `cadastros_itens_minimas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `itens_movimentacoes`
--
ALTER TABLE `itens_movimentacoes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `itens_processos`
--
ALTER TABLE `itens_processos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `processo_comunicacao`
--
ALTER TABLE `processo_comunicacao`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `itens_movimentacoes`
--
ALTER TABLE `itens_movimentacoes`
  ADD CONSTRAINT `fk_movimentacao_processo` FOREIGN KEY (`processo_id`) REFERENCES `itens_processos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `itens_processos`
--
ALTER TABLE `itens_processos`
  ADD CONSTRAINT `fk_processo_item` FOREIGN KEY (`item_id`) REFERENCES `cadastros_itens_minimas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `processo_comunicacao`
--
ALTER TABLE `processo_comunicacao`
  ADD CONSTRAINT `processo_comunicacao_ibfk_1` FOREIGN KEY (`processo_id`) REFERENCES `itens_processos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
