-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Tempo de geração: 29/05/2026 às 14:11
-- Versão do servidor: 8.0.45
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

-- --------------------------------------------------------

--
-- Estrutura para tabela `SM_cadastros_itens_minimas`
--

CREATE TABLE `SM_cadastros_itens_minimas` (
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
  `abrasao_superficial` varchar(10) DEFAULT NULL,
  `variacao_tonalidade` varchar(20) DEFAULT NULL,
  `unidade_medida` varchar(20) NOT NULL,
  `pecas_caixa` int NOT NULL,
  `m2_caixa` decimal(10,2) NOT NULL,
  `peso_caixa` decimal(10,3) NOT NULL,
  `coeficiente_atrito` varchar(10) DEFAULT NULL,
  `espessura` decimal(10,1) NOT NULL,
  `grupo_absorcao` varchar(20) DEFAULT NULL,
  `item_ativo` tinyint(1) NOT NULL,
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
  `relevo` tinyint(1) NOT NULL,
  `rodape` tinyint(1) NOT NULL DEFAULT '0',
  `numeros_face` int NOT NULL,
  `tamanho_fabricacao` varchar(50) NOT NULL,
  `codigo_item` varchar(40) NOT NULL,
  `unidade_fabricacao` varchar(60) NOT NULL,
  `monocalibre` tinyint(1) DEFAULT NULL,
  `CicloLancamento` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `responsavel_carga` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `SM_cadastros_itens_minimas`
--

INSERT INTO `SM_cadastros_itens_minimas` (`id`, `marca`, `categoria_pt_br`, `categoria_us`, `categoria_es`, `serie`, `tamanho_nominal`, `descricao`, `codigo_barras_cx`, `superficie_pt_br`, `superficie_us`, `superficie_es`, `junta_assentamento`, `abrasao_superficial`, `variacao_tonalidade`, `unidade_medida`, `pecas_caixa`, `m2_caixa`, `peso_caixa`, `coeficiente_atrito`, `espessura`, `grupo_absorcao`, `item_ativo`, `cor_pt_br`, `cor_us`, `cor_es`, `recomendado_uso`, `local_uso`, `retificado`, `polo`, `lancamento`, `estilo`, `estilo_us`, `estilo_es`, `relevo`, `rodape`, `numeros_face`, `tamanho_fabricacao`, `codigo_item`, `unidade_fabricacao`, `monocalibre`, `CicloLancamento`, `data_criacao`, `responsavel_carga`) VALUES
(1, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'MUNARI', '90X90', 'ATINS OFF WHITE AC', '7892142142141', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, '2', 'V2', 'm2', 2, 2.12, 12.320, 'I', 10.0, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8067140', 'SC2', 1, '1/26', '2026-05-08 12:48:36', 'usuario Cadastrante'),
(24, 'DECORTILES', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'ARTEMI', '19,7X120', 'ARTEMI JEQUITIBA AC 3D', '7891291299197', 'ACETINADO', 'SATIN', 'SATINADO', 1, '3', 'V2', 'm2', 7, 1.65, 34.498, 'II', 9.5, 'BIa', 1, 'MARROM', 'BROWN', 'MARRON', 'PI', 'FMC#FWI#WWS#WFA', 1, 'SC', 1, 'Madeira', 'Wood', 'Madera', 1, 0, 36, '197x1200', '8068339', 'SC 3', 0, '1/26', '2026-05-08 16:02:47', 'usuario Cadastrante'),
(25, 'DECORTILES', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'TERRAE', '30X30', 'TERRAE ARGAN AC', '7891291315637', 'ACETINADO', 'SATIN', 'SATINADO', 1, '3', 'V3', 'm2', 16, 1.43, 27.620, 'II', 8.5, 'BIa', 1, 'MARROM', 'BROWN', 'MARRON', 'PI', 'FMC#FWI#WWS#WFA', 1, 'SC', 1, 'Argila', 'Clay', 'Arcilla', 1, 0, 1, '299,5x299,5', '8069197', 'SC 4', 1, '1/26', '2026-05-08 16:02:47', 'usuario Cadastrante'),
(26, 'DECORTILES', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'TERRAE', '30X30', 'TERRAE ARGILA AC', '7891291315576', 'ACETINADO', 'SATIN', 'SATINADO', 1, '2', 'V3', 'm2', 16, 1.43, 27.620, 'II', 8.5, 'BIa', 1, 'LARANJA', 'ORANGE', 'NARANJA', 'PI', 'FMC#FWI#WWS#WFA', 1, 'SC', 1, 'Argila', 'Clay', 'Arcilla', 1, 0, 1, '299,5x299,5', '8069195', 'SC 4', 1, '1/26', '2026-05-08 16:02:47', 'usuario Cadastrante'),
(27, 'DECORTILES', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'TERRAE', '30X30', 'TERRAE CANYON AC', '7891291315606', 'ACETINADO', 'SATIN', 'SATINADO', 1, '2', 'V3', 'm2', 16, 1.43, 27.620, 'II', 8.5, 'BIa', 1, 'MARROM', 'BROWN', 'MARRON', 'PI', 'FMC#FWI#WWS#WFA', 1, 'SC', 1, 'Argila', 'Clay', 'Arcilla', 1, 0, 1, '299,5x299,5', '8069196', 'SC 4', 1, '1/26', '2026-05-08 16:02:47', 'usuario Cadastrante'),
(28, 'DECORTILES', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'TERRAE', '30X30', 'TERRAE OSSO AC', '7891291315545', 'ACETINADO', 'SATIN', 'SATINADO', 1, '4', 'V3', 'm2', 16, 1.43, 27.620, 'II', 8.5, 'BIa', 1, 'BRANCO', 'WHITE', 'BLANCO', 'PI', 'FMC#FWI#WWS#WFA', 1, 'SC', 1, 'Argila', 'Clay', 'Arcilla', 1, 0, 1, '299,5x299,5', '8069194', 'SC 4', 1, '1/26', '2026-05-08 16:02:47', 'usuario Cadastrante'),
(29, 'ELIANE', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'ORIS', '2,5X20', 'BORDA I ORIS PETRA CORDA EXT 3D', '7891291336816', 'RESISTENTE AO ESCORREGAMENTO', 'SLIP RESISTANT', 'ANTIRESBALANTE', 2, '', 'V2', 'pc', 10, 0.10, 7.590, 'II', 7.4, 'BIa', 1, 'BRANCO', 'WHITE', 'BLANCO', 'PI', 'WWS#FMO', 1, 'SC', 1, 'Pedra', 'Stones', 'Piedra', 1, 0, 1, '25x200', '8070036', 'SC Ind Out', 0, '1/26', '2026-05-08 16:02:47', 'usuario Cadastrante'),
(30, 'ELIANE', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'ORIS', '2,5X20', 'BORDA I ORIS PETRA GRIS EXT 3D', '7891291336847', 'RESISTENTE AO ESCORREGAMENTO', 'SLIP RESISTANT', 'ANTIRESBALANTE', 2, '', 'V2', 'pc', 10, 0.10, 7.590, 'II', 7.4, 'BIa', 1, 'CINZA', 'GRAY', 'GRIS', 'PI', 'WWS#FMO', 1, 'SC', 1, 'Pedra', 'Stones', 'Piedra', 1, 0, 1, '25x200', '8070037', 'SC Ind Out', 0, '1/26', '2026-05-08 16:02:47', 'usuario Cadastrante'),
(31, 'ELIANE', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'ORIS', '2,5X20', 'BORDA I ORIS PETRA BRUT EXT 3D', '7891291336878', 'RESISTENTE AO ESCORREGAMENTO', 'SLIP RESISTANT', 'ANTIRESBALANTE', 2, '', 'V2', 'pc', 10, 0.10, 7.590, 'II', 7.4, 'BIa', 1, 'BEGE', 'BEIGE', 'BEIGE', 'PI', 'WWS#FMO', 1, 'SC', 1, 'Pedra', 'Stones', 'Piedra', 1, 0, 1, '25x200', '8070038', 'SC Ind Out', 0, '1/26', '2026-05-08 16:02:47', 'usuario Cadastrante'),
(32, 'ELIANE', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'ORIS', '2,5X20', 'BORDA E ORIS PETRA CORDA EXT 3D', '7891291336908', 'RESISTENTE AO ESCORREGAMENTO', 'SLIP RESISTANT', 'ANTIRESBALANTE', 2, '', 'V2', 'pc', 10, 0.10, 7.590, 'II', 7.4, 'BIa', 1, 'BRANCO', 'WHITE', 'BLANCO', 'PI', 'WWS#FMO', 1, 'SC', 1, 'Pedra', 'Stones', 'Piedra', 1, 0, 1, '25x200', '8070039', 'SC Ind Out', 0, '1/26', '2026-05-08 16:02:47', 'usuario Cadastrante'),
(33, 'ELIANE', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'ORIS', '2,5X20', 'BORDA E ORIS PETRA GRIS EXT 3D', '7891291336939', 'RESISTENTE AO ESCORREGAMENTO', 'SLIP RESISTANT', 'ANTIRESBALANTE', 2, '', 'V2', 'pc', 10, 0.10, 7.590, 'II', 7.4, 'BIa', 1, 'CINZA', 'GRAY', 'GRIS', 'PI', 'WWS#FMO', 1, 'SC', 1, 'Pedra', 'Stones', 'Piedra', 1, 0, 1, '25x200', '8070040', 'SC Ind Out', 0, '1/26', '2026-05-08 16:02:47', 'usuario Cadastrante'),
(34, 'ELIANE', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'ORIS', '2,5X20', 'BORDA E ORIS PETRA BRUT EXT 3D', '7891291336960', 'RESISTENTE AO ESCORREGAMENTO', 'SLIP RESISTANT', 'ANTIRESBALANTE', 2, '', 'V2', 'pc', 10, 0.10, 7.590, 'II', 7.4, 'BIa', 1, 'BEGE', 'BEIGE', 'BEIGE', 'PI', 'WWS#FMO', 1, 'SC', 1, 'Pedra', 'Stones', 'Piedra', 1, 0, 1, '25x200', '8070041', 'SC Ind Out', 0, '1/26', '2026-05-08 16:02:47', 'usuario Cadastrante'),
(35, 'ELIZABETH', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'SANTUARIO', '60X60', 'SANTUARIO ESM ACET', '7908545821506', 'ACETINADO', 'SATIN', 'SATINADO', 1, '', 'V3', 'M2', 6, 2.16, 37.475, 'II', 7.4, 'BIa', 1, 'BRANCO', 'WHITE', 'BLANCO', 'PI', 'FLC#FWI#WFA', 1, 'SC', 1, 'Marmore', 'Marble', 'Marmol', 0, 0, 4, '600x600', '8070129', 'SC 5', 1, '1/26', '2026-05-08 16:02:47', 'usuario Cadastrante'),
(36, 'ELIZABETH', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'MADALENA', '60X60', 'MADALENA GEADA ESM ACET', '7908545821537', 'ACETINADO', 'SATIN', 'SATINADO', 1, '', 'V3', 'M2', 6, 2.16, 37.475, 'II', 7.4, 'BIa', 1, 'CINZA', 'GRAY', 'GRIS', 'PI', 'FLC#FWI#WFA', 1, 'SC', 1, 'Marmore', 'Marble', 'Marmol', 0, 0, 4, '600x600', '8070130', 'SC 5', 1, '1/26', '2026-05-08 16:02:47', 'usuario Cadastrante'),
(37, 'ELIZABETH', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'MADALENA', '60X60', 'MADALENA AREIA ESM ACET', '7908545821568', 'ACETINADO', 'SATIN', 'SATINADO', 1, '', 'V3', 'M2', 6, 2.16, 37.475, 'II', 7.4, 'BIa', 1, 'BEGE', 'BEIGE', 'BEIGE', 'PI', 'FLC#FWI#WFA', 1, 'SC', 1, 'Marmore', 'Marble', 'Marmol', 0, 0, 4, '600x600', '8070131', 'SC 5', 1, '1/26', '2026-05-08 16:02:47', 'usuario Cadastrante'),
(38, 'ELIZABETH', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'LE BLANC', '70X70', 'LE BLANC ESM ACET', '7899060666775', 'ACETINADO', 'SATIN', 'SATINADO', 1, '4', 'V3', 'm2', 5, 2.45, 40.442, 'II', 7.4, 'BIa', 1, 'BRANCO', 'WHITE', 'BLANCO', 'PI', 'FLC#FWI#WFA', 1, 'SC', 1, 'Marmore', 'Marble', 'Marmol', 0, 0, 5, '700x700', '8070132', 'PB 1', 1, '1/26', '2026-05-08 16:02:47', 'usuario Cadastrante'),
(39, 'ELIZABETH', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'LE BLANC', '70X70', 'LE BLANC ESM POL', '7899060666805', 'POLIDO', 'POLISHED', 'PULIDO', 1, '4', 'V3', 'M2', 5, 2.45, 40.442, 'I', 7.4, 'BIa', 1, 'BRANCO', 'WHITE', 'BLANCO', 'PI', 'FLC#WFA', 1, 'SC', 1, 'Marmore', 'Marble', 'Marmol', 0, 0, 5, '700x700', '8070133', 'PB 1', 1, '1/26', '2026-05-08 16:02:47', 'usuario Cadastrante'),
(40, 'ELIZABETH', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'LUXURY', '100X100', 'LUXURY GEADA ESM ACET', '7899060666836', 'ACETINADO', 'SATIN', 'SATINADO', 1, '', 'V3', 'M2', 3, 3.00, 57.510, 'II', 8.5, 'BIa', 1, 'BEGE', 'BEIGE', 'BEIGE', 'PI', 'FMC#FWI#WFA', 1, 'SC', 1, 'Marmore', 'Marble', 'Marmol', 0, 0, 6, '1000x1000', '8070134', 'PB 1', 1, '1/26', '2026-05-08 16:02:47', 'usuario Cadastrante'),
(42, 'DECORTILES', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'MEDEIRA', '90X90', 'MADEIRA DO NORTE AC', '7891291315576', 'ACETINADO', 'SATIN', 'SATINADO', 1, '2', 'V2', 'M2', 16, 1.43, 27.620, 'II', 8.5, 'BIA', 1, 'LARANJA', 'ORANGE', 'NARANJA', 'PI', 'FMC#FWI#WWS#WFA', 1, 'SC', 1, 'ARGILA', 'CLAY', 'ARCILLA', 1, 0, 1, '299,5X299,5', '8071122', 'SC4', 1, '1/26', '2026-05-27 16:28:55', 'usuario Cadastrante'),
(43, 'ELIANE', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'PILAR', '90X90', 'PILAR DE FERRO EXT', '7891291336816', 'RESISTENTE AO ESCORREGAMENTO', 'SLIP RESISTE', 'ANTIRESBALANTE', 2, '', 'V2', 'PC', 10, 0.10, 7.590, 'II', 7.4, 'BIA', 1, 'BRANCO', 'WHITE', 'BLANCO', 'PI', 'WWS#FMO', 1, 'SC', 1, 'PEDRA', 'STONES', 'PIEDRA', 1, 0, 1, '25X200', '8071123', 'SCINDOUT', 0, '1/26', '2026-05-27 16:28:55', 'usuario Cadastrante'),
(44, 'ELIZABETH', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'MADALENA', '90X90', 'POLENTA AMARELA ESM ACET', '7908545821568', 'ACETINADO', 'SATIN', 'SATINADO', 1, '', 'V3', 'M2', 6, 2.16, 37.475, 'II', 7.4, 'BIA', 1, 'BEGE', 'BEIGE', 'BEIGE', 'PI', 'FLC#FWI#WFA', 1, 'SC', 1, 'MARMORE', 'MARBLE', 'MARMOL', 0, 0, 4, '600X600', '8071124', 'SC5', 1, '1/26', '2026-05-27 16:28:55', 'usuario Cadastrante');

-- --------------------------------------------------------

--
-- Estrutura para tabela `SM_evidencias_inteligenciaMercado`
--

CREATE TABLE `SM_evidencias_inteligenciaMercado` (
  `id` int NOT NULL,
  `processo_id` int NOT NULL,
  `tipo_pendencia` enum('pecas_separadas','qtd_diferente','qualidade','identificacao') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `descricao` text,
  `caminho_arquivo` varchar(255) DEFAULT NULL,
  `data_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `registrado_por` varchar(100) DEFAULT NULL,
  `status_evidencia` enum('pendente','validada','rejeitada') DEFAULT 'pendente',
  `comentario_validacao` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `SM_evidencias_inteligenciaMercado`
--

INSERT INTO `SM_evidencias_inteligenciaMercado` (`id`, `processo_id`, `tipo_pendencia`, `descricao`, `caminho_arquivo`, `data_registro`, `registrado_por`, `status_evidencia`, `comentario_validacao`) VALUES
(1, 33, 'qualidade', NULL, NULL, '2026-05-28 23:16:00', 'usuario', 'pendente', NULL),
(2, 41, 'qtd_diferente', NULL, NULL, '2026-05-29 00:35:26', 'usuarioSistema', 'pendente', NULL),
(7, 40, 'qtd_diferente', NULL, NULL, '2026-05-29 01:11:43', 'usuarioSistema', 'pendente', NULL),
(13, 40, 'qualidade', NULL, NULL, '2026-05-29 01:17:46', 'usuarioSistema', 'pendente', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `SM_item_imagens`
--

CREATE TABLE `SM_item_imagens` (
  `id` int NOT NULL,
  `item_id` int NOT NULL,
  `pacote_id` int NOT NULL,
  `caminho_arquivo` varchar(255) NOT NULL,
  `tipo` enum('foto','video','manipulada') DEFAULT 'foto',
  `descricao` varchar(455) DEFAULT NULL,
  `data_upload` datetime DEFAULT CURRENT_TIMESTAMP,
  `usuario_upload` varchar(100) DEFAULT NULL,
  `status` enum('pendente','aprovado','rejeitado') DEFAULT 'pendente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `SM_item_imagens`
--

INSERT INTO `SM_item_imagens` (`id`, `item_id`, `pacote_id`, `caminho_arquivo`, `tipo`, `descricao`, `data_upload`, `usuario_upload`, `status`) VALUES
(5, 25, 1, 'eliane-munari-branco-ac-120x120cm-04.jpg', 'foto', NULL, '2026-05-20 20:04:28', NULL, 'aprovado'),
(6, 25, 1, 'eliane-munari-branco-ac-120x120cm-03.jpg', 'foto', NULL, '2026-05-20 20:04:28', NULL, 'aprovado'),
(7, 25, 1, 'eliane-munari-branco-ac-120x120cm-02.jpg', 'foto', NULL, '2026-05-20 20:04:28', NULL, 'pendente'),
(8, 25, 1, 'eliane-munari-branco-ac-120x120cm-01.jpg', 'foto', NULL, '2026-05-20 20:04:28', NULL, 'pendente'),
(9, 25, 1, 'eliane-munari-branco-ac-120x120cm-05.jpg', 'foto', NULL, '2026-05-22 21:33:06', NULL, 'pendente'),
(10, 25, 1, 'Canvas.mp4', 'video', NULL, '2026-05-23 14:41:58', NULL, 'pendente'),
(11, 25, 1, 'eliane-munari-branco-ac-120x120cm-06.jpg', 'foto', NULL, '2026-05-27 16:56:01', NULL, 'pendente'),
(12, 25, 1, 'eliane-munari-branco-ac-120x120cm-06.jpg', 'manipulada', NULL, '2026-05-27 16:59:41', NULL, 'pendente');

-- --------------------------------------------------------

--
-- Estrutura para tabela `SM_itens_movimentacoes`
--

CREATE TABLE `SM_itens_movimentacoes` (
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
-- Despejando dados para a tabela `SM_itens_movimentacoes`
--

INSERT INTO `SM_itens_movimentacoes` (`id`, `processo_id`, `area_origem`, `area_destino`, `acao`, `usuario`, `observacao`, `data_acao`) VALUES
(1, 1, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-05-08 12:48:36'),
(23, 23, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-05-08 16:02:47'),
(24, 24, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-05-08 16:02:47'),
(25, 25, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-05-08 16:02:47'),
(26, 26, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-05-08 16:02:47'),
(27, 27, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-05-08 16:02:47'),
(28, 28, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-05-08 16:02:47'),
(29, 29, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-05-08 16:02:47'),
(30, 30, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-05-08 16:02:47'),
(31, 31, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-05-08 16:02:47'),
(32, 32, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-05-08 16:02:47'),
(33, 33, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-05-08 16:02:47'),
(34, 34, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-05-08 16:02:47'),
(35, 35, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-05-08 16:02:47'),
(36, 36, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-05-08 16:02:47'),
(37, 37, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-05-08 16:02:47'),
(38, 38, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-05-08 16:02:47'),
(39, 39, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-05-08 16:02:47'),
(40, 1, 'comunicacao', 'detec', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-08 16:03:22'),
(41, 1, 'detec', 'amostra', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-08 16:03:39'),
(42, 1, 'amostra', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-08 16:03:46'),
(43, 1, 'inteligencia_mercado', 'fotografo', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-08 16:04:03'),
(44, 23, 'comunicacao', 'detec', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-08 16:22:31'),
(45, 23, 'detec', 'amostra', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-08 16:22:48'),
(46, 23, 'amostra', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-08 16:22:58'),
(47, 1, 'sistema', 'cancelado', 'processo_cancelado', 'sistema', 'Processo cancelado manualmente via tela de fases', '2026-05-12 13:04:56'),
(48, 23, 'inteligencia_mercado', 'fotografo', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-12 13:05:41'),
(49, 24, 'comunicacao', 'detec', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-12 13:12:12'),
(50, 23, 'sistema', 'cancelado', 'processo_cancelado', 'sistema', 'Processo cancelado manualmente via tela de fases', '2026-05-12 13:12:15'),
(51, 24, 'detec', 'amostra', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-12 13:12:20'),
(52, 24, 'amostra', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-12 13:12:28'),
(53, 24, 'inteligencia_mercado', 'fotografo', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-12 13:12:39'),
(54, 24, 'inteligencia_mercado', 'fotografo', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-12 13:20:16'),
(55, 25, 'comunicacao', 'detec', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-12 13:51:09'),
(56, 25, 'detec', 'amostra', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-12 13:51:16'),
(57, 25, 'amostra', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-12 13:51:24'),
(58, 25, 'inteligencia_mercado', 'fotografo', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-12 13:51:35'),
(59, 24, 'fotografia', 'amostra', 'envio_pecas', 'amostra', 'Peças enviadas', '2026-05-12 14:20:09'),
(60, 25, 'fotografia', 'amostra', 'envio_pecas', 'amostra', 'Peças enviadas', '2026-05-12 14:20:09'),
(62, 26, 'comunicacao', 'detec', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-12 20:34:33'),
(63, 26, 'detec', 'amostra', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-12 20:34:40'),
(64, 26, 'amostra', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-12 20:34:47'),
(65, 26, 'inteligencia_mercado', 'fotografo', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-12 20:36:46'),
(67, 27, 'comunicacao', 'detec', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-12 21:44:23'),
(68, 27, 'detec', 'amostra', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-12 21:44:29'),
(69, 27, 'amostra', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-12 18:44:39'),
(70, 27, 'inteligencia_mercado', 'fotografo', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-12 19:09:48'),
(71, 28, 'comunicacao', 'detec', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-12 19:26:37'),
(72, 28, 'detec', 'amostra', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-12 19:26:52'),
(73, 28, 'amostra', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-12 19:27:06'),
(74, 28, 'inteligencia_mercado', 'fotografo', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-12 19:27:21'),
(75, 29, 'comunicacao', 'detec', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-13 09:44:08'),
(76, 29, 'detec', 'amostra', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-13 09:44:13'),
(77, 29, 'amostra', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-13 09:44:19'),
(78, 29, 'inteligencia_mercado', 'fotografo', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-13 09:44:38'),
(79, 30, 'comunicacao', 'detec', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-15 13:35:35'),
(80, 30, 'detec', 'amostra', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-15 13:36:08'),
(81, 30, 'amostra', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-15 13:36:20'),
(82, 30, 'inteligencia_mercado', 'fotografo', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-15 13:37:19'),
(83, 32, 'comunicacao', 'detec', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-15 14:02:12'),
(84, 32, 'detec', 'amostra', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-15 14:02:40'),
(85, 32, 'amostra', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-15 14:02:58'),
(86, 32, 'inteligencia_mercado', 'fotografia', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-15 14:03:48'),
(87, 31, 'comunicacao', 'detec', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-17 00:23:39'),
(88, 26, 'fotografo', 'amostra', 'aprovar_envio_pecas', 'usuarioSistema', 'Aprovando envio das peças separadas na amostra', '2026-05-17 01:06:29'),
(89, 27, 'fotografo', 'amostra', 'aprovar_envio_pecas', 'usuarioSistema', 'Aprovando envio das peças separadas na amostra', '2026-05-17 01:06:29'),
(90, 28, 'fotografo', 'amostra', 'aprovar_envio_pecas', 'usuarioSistema', 'Aprovando envio das peças separadas na amostra', '2026-05-17 01:06:29'),
(91, 29, 'fotografo', 'amostra', 'aprovar_envio_pecas', 'usuarioSistema', 'Aprovando envio das peças separadas na amostra', '2026-05-17 01:06:29'),
(92, 30, 'fotografo', 'amostra', 'aprovar_envio_pecas', 'usuarioSistema', 'Aprovando envio das peças separadas na amostra', '2026-05-17 01:06:29'),
(93, 32, 'fotografo', 'amostra', 'aprovar_envio_pecas', 'usuarioSistema', 'Aprovando envio das peças separadas na amostra', '2026-05-17 01:06:29'),
(94, 24, 'fotografo', 'design', 'upload_imagens', 'usuarioSistema', 'aguardando aprovação das imagens', '2026-05-22 18:29:28'),
(95, 24, 'design', 'design', 'upload_imagens', 'usuarioSistema', 'aguardando aprovação das imagens', '2026-05-22 18:31:33'),
(96, 24, 'design', 'design', 'upload_imagens', 'usuarioSistema', 'aguardando aprovação das imagens', '2026-05-22 18:32:18'),
(97, 24, 'design', 'design', 'upload_imagens', 'usuarioSistema', 'aguardando aprovação das imagens', '2026-05-22 18:33:06'),
(98, 24, 'design', 'design', 'upload_imagens', 'usuarioSistema', 'aguardando aprovação das imagens', '2026-05-22 18:34:12'),
(99, 24, 'design', 'design', 'upload_imagens', 'usuarioSistema', 'aguardando aprovação das imagens', '2026-05-22 18:35:18'),
(100, 24, 'design', 'design', 'upload_imagens', 'usuarioSistema', 'aguardando aprovação das imagens', '2026-05-22 18:41:01'),
(101, 24, 'design', 'design', 'upload_imagens', 'usuarioSistema', 'aguardando aprovação das imagens', '2026-05-22 18:58:43'),
(102, 24, 'design', 'design', 'upload_imagens', 'usuarioSistema', 'aguardando aprovação das imagens', '2026-05-22 18:59:17'),
(103, 24, 'fotografo', 'design', 'upload_imagens', 'usuarioSistema', 'aguardando aprovação das imagens', '2026-05-23 11:16:32'),
(104, 24, 'fotografo', 'design', 'upload_imagens', 'usuarioSistema', 'aguardando aprovação das imagens', '2026-05-23 11:41:58'),
(105, 40, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-05-27 16:28:55'),
(106, 41, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-05-27 16:28:55'),
(107, 42, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-05-27 16:28:55'),
(108, 24, 'fotografo', 'design', 'upload_imagens', 'usuarioSistema', 'aguardando aprovação das imagens', '2026-05-27 13:59:41'),
(109, 31, 'detec', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-28 11:17:40'),
(110, 31, 'inteligencia_mercado', 'detec', 'liberacao_etapa', 'usuarioSistema', 'Produto nao foi localizado no Departamento de amostra', '2026-05-28 16:37:42'),
(111, 33, 'comunicacao', 'detec', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-28 16:51:35'),
(112, 33, 'detec', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-28 16:51:41'),
(113, 33, 'inteligencia_mercado', 'detec', 'liberacao_etapa', 'usuarioSistema', 'Tivemos um total de 11 faces, mas o produto tem 12. Precisamos a face faltante pra completar o painel e enviarmos ao fotografo.', '2026-05-28 16:56:24'),
(114, 34, 'comunicacao', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-28 22:13:25'),
(115, 34, 'inteligencia_mercado', 'detec', 'liberacao_etapa', 'usuarioSistema', 'Tivemos um total de 11 faces, mas o produto tem 12. Precisamos a face faltante pra completar o painel e enviarmos ao fotografo.', '2026-05-28 22:13:47'),
(116, 34, 'detec', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-28 22:26:37'),
(117, 34, 'inteligencia_mercado', 'detec', 'liberacao_etapa', 'usuarioSistema', 'Tivemos um total de 11 faces, mas o produto tem 12. Precisamos a face faltante pra completar o painel e enviarmos ao fotografo.', '2026-05-28 22:26:52'),
(118, 34, 'detec', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-28 22:29:54'),
(119, 34, 'inteligencia_mercado', 'detec', 'liberacao_etapa', 'usuarioSistema', 'Tivemos um total de 11 faces, mas o produto tem 12. Precisamos a face faltante pra completar o painel e enviarmos ao fotografo.', '2026-05-28 22:30:06'),
(120, 34, 'detec', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-28 22:33:11'),
(121, 34, 'inteligencia_mercado', 'detec', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-28 22:33:18'),
(122, 35, 'comunicacao', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-28 22:44:52'),
(123, 35, 'inteligencia_mercado', 'pendencias', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-28 22:58:14'),
(124, 34, 'detec', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-28 23:01:26'),
(125, 34, 'inteligencia_mercado', 'pendencias', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-28 23:01:32'),
(126, 36, 'comunicacao', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-28 23:07:35'),
(127, 36, 'inteligencia_mercado', 'pendencias', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-28 23:07:43'),
(128, 37, 'comunicacao', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-28 23:14:30'),
(129, 37, 'inteligencia_mercado', 'pendencias', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-28 23:34:26'),
(130, 39, 'comunicacao', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-28 23:38:25'),
(131, 39, 'inteligencia_mercado', 'pendencias', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-28 23:49:34'),
(132, 38, 'comunicacao', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-28 23:51:33'),
(133, 38, 'inteligencia_mercado', 'pendencias', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-28 23:51:41'),
(134, 40, 'comunicacao', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-28 23:56:48'),
(135, 40, 'inteligencia_mercado', 'pendencias', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-28 23:56:59'),
(136, 41, 'comunicacao', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-29 00:01:45'),
(143, 41, 'inteligencia_mercado', 'pendencias', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-29 00:48:18'),
(144, 41, 'detec', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-29 00:52:03'),
(146, 40, 'inteligencia_mercado', 'pendencias', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-29 01:11:43'),
(147, 40, 'detec', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-29 01:15:33'),
(148, 40, 'inteligencia_mercado', 'pendencias', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-29 01:17:46');

-- --------------------------------------------------------

--
-- Estrutura para tabela `SM_itens_processos`
--

CREATE TABLE `SM_itens_processos` (
  `id` int NOT NULL,
  `item_id` int NOT NULL,
  `etapa_atual` varchar(100) NOT NULL DEFAULT 'comunicacao_analise',
  `status_geral` enum('pendente','em_andamento','finalizado','reprovado','cancelado','enviado','preparando_envio','aguardando_aprovacao_imagens','retrabalhando_pendencias') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `iniciado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `finalizado_em` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `SM_itens_processos`
--

INSERT INTO `SM_itens_processos` (`id`, `item_id`, `etapa_atual`, `status_geral`, `iniciado_em`, `finalizado_em`) VALUES
(1, 1, 'fotografo', 'cancelado', '2026-05-08 12:48:36', NULL),
(23, 24, 'inteligencia_mercado', 'cancelado', '2026-05-08 16:02:47', NULL),
(24, 25, 'design', 'aguardando_aprovacao_imagens', '2026-05-08 16:02:47', NULL),
(25, 26, 'fotografo', 'enviado', '2026-05-08 16:02:47', NULL),
(26, 27, 'amostra', 'preparando_envio', '2026-05-08 16:02:47', NULL),
(27, 28, 'amostra', 'preparando_envio', '2026-05-08 16:02:47', NULL),
(28, 29, 'amostra', 'preparando_envio', '2026-05-08 16:02:47', NULL),
(29, 30, 'amostra', 'preparando_envio', '2026-05-08 16:02:47', NULL),
(30, 31, 'amostra', 'preparando_envio', '2026-05-08 16:02:47', NULL),
(31, 32, 'detec', 'em_andamento', '2026-05-08 16:02:47', NULL),
(32, 33, 'amostra', 'preparando_envio', '2026-05-08 16:02:47', NULL),
(33, 34, 'detec_retrabalho', 'em_andamento', '2026-05-08 16:02:47', NULL),
(34, 35, 'detec_retrabalho', 'em_andamento', '2026-05-08 16:02:47', NULL),
(35, 36, 'detec_retrabalho', 'em_andamento', '2026-05-08 16:02:47', NULL),
(36, 37, 'detec_retrabalho', 'em_andamento', '2026-05-08 16:02:47', NULL),
(37, 38, 'detec_retrabalho', 'em_andamento', '2026-05-08 16:02:47', NULL),
(38, 39, 'detec_retrabalho', 'em_andamento', '2026-05-08 16:02:47', NULL),
(39, 40, 'detec_retrabalho', 'em_andamento', '2026-05-08 16:02:47', NULL),
(40, 42, 'detec_retrabalho', 'em_andamento', '2026-05-27 16:28:55', NULL),
(41, 43, 'detec_retrabalho', 'em_andamento', '2026-05-27 16:28:55', NULL),
(42, 44, 'comunicacao', 'em_andamento', '2026-05-27 16:28:55', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `SM_pacotes_envio`
--

CREATE TABLE `SM_pacotes_envio` (
  `id` int NOT NULL,
  `status` enum('aberto','finalizado') DEFAULT 'aberto',
  `data_criacao` datetime DEFAULT CURRENT_TIMESTAMP,
  `data_fechamento` datetime DEFAULT NULL,
  `aprovado_por` varchar(100) DEFAULT NULL,
  `observacao` text,
  `data_agendamento` datetime DEFAULT NULL,
  `responsavel_fotografia` varchar(100) DEFAULT NULL,
  `data_envio` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `SM_pacotes_envio`
--

INSERT INTO `SM_pacotes_envio` (`id`, `status`, `data_criacao`, `data_fechamento`, `aprovado_por`, `observacao`, `data_agendamento`, `responsavel_fotografia`, `data_envio`) VALUES
(1, 'finalizado', '2026-05-12 13:20:16', '2026-05-12 11:59:36', 'comunicacao', NULL, '2026-05-15 14:00:00', 'Arlei', '2026-05-12 14:20:09'),
(2, 'finalizado', '2026-05-12 20:36:46', '2026-05-15 17:04:44', 'comunicacao', NULL, '2027-05-18 13:00:00', 'Arlei', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `SM_pacote_itens`
--

CREATE TABLE `SM_pacote_itens` (
  `id` int NOT NULL,
  `pacote_id` int NOT NULL,
  `processo_id` int NOT NULL,
  `data_inclusao` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `SM_pacote_itens`
--

INSERT INTO `SM_pacote_itens` (`id`, `pacote_id`, `processo_id`, `data_inclusao`) VALUES
(1, 1, 24, '2026-05-12 13:20:16'),
(2, 1, 25, '2026-05-12 13:51:35'),
(3, 2, 26, '2026-05-12 20:36:46'),
(4, 2, 27, '2026-05-12 22:09:48'),
(5, 2, 28, '2026-05-12 22:27:21'),
(6, 2, 29, '2026-05-13 12:44:38'),
(7, 2, 30, '2026-05-15 16:37:19'),
(8, 2, 32, '2026-05-15 17:03:48');

-- --------------------------------------------------------

--
-- Estrutura para tabela `SM_processo_amostra`
--

CREATE TABLE `SM_processo_amostra` (
  `id` int NOT NULL,
  `processo_id` int NOT NULL,
  `metodo_amostra` varchar(100) NOT NULL,
  `observacao_amostra` text,
  `proxima_etapa` varchar(40) NOT NULL,
  `aprovado_por` varchar(50) DEFAULT NULL,
  `data_aprovacao` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `SM_processo_amostra`
--

INSERT INTO `SM_processo_amostra` (`id`, `processo_id`, `metodo_amostra`, `observacao_amostra`, `proxima_etapa`, `aprovado_por`, `data_aprovacao`) VALUES
(1, 1, 'pecasRecebidas', '', 'inteligencia_mercado', NULL, '2026-05-08 16:03:46'),
(2, 23, 'pecasRecebidas', '', 'inteligencia_mercado', NULL, '2026-05-08 16:22:58'),
(4, 25, 'pecasRecebidas', '', 'inteligencia_mercado', NULL, '2026-05-12 13:51:24'),
(5, 26, 'pecasSeparadas', '', 'inteligencia_mercado', NULL, '2026-05-12 20:34:47'),
(6, 27, 'pecasRecebidas', '', 'inteligencia_mercado', NULL, '2026-05-12 21:44:39'),
(7, 28, 'pecasRecebidas', '', 'inteligencia_mercado', NULL, '2026-05-12 22:27:06'),
(8, 29, 'pecasRecebidas', '', 'inteligencia_mercado', NULL, '2026-05-13 12:44:19'),
(9, 30, 'pecasRecebidas', '', 'inteligencia_mercado', NULL, '2026-05-15 16:36:20'),
(10, 32, 'pecasRecebidas', '', 'inteligencia_mercado', NULL, '2026-05-15 17:02:58');

-- --------------------------------------------------------

--
-- Estrutura para tabela `SM_processo_comunicacao`
--

CREATE TABLE `SM_processo_comunicacao` (
  `id` int NOT NULL,
  `processo_id` int NOT NULL,
  `metodo_imagem` varchar(60) NOT NULL,
  `precisa_foto` tinyint(1) DEFAULT '0',
  `qtd_pecas_foto` int DEFAULT NULL,
  `precisa_manipulacao` tinyint(1) DEFAULT '0',
  `detalhe_manipulacao` varchar(60) NOT NULL,
  `qtd_pecas_manipulacao` int DEFAULT NULL,
  `precisa_video` tinyint(1) DEFAULT '0',
  `qtd_pecas_video` int DEFAULT NULL,
  `observacao` text,
  `aprovado_por` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `data_aprovacao` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `SM_processo_comunicacao`
--

INSERT INTO `SM_processo_comunicacao` (`id`, `processo_id`, `metodo_imagem`, `precisa_foto`, `qtd_pecas_foto`, `precisa_manipulacao`, `detalhe_manipulacao`, `qtd_pecas_manipulacao`, `precisa_video`, `qtd_pecas_video`, `observacao`, `aprovado_por`, `data_aprovacao`) VALUES
(1, 1, 'totalmenteFotografado', 1, 10, 0, '', 0, 1, 30, '', NULL, '2026-05-08 16:03:22'),
(2, 23, 'fotografadoManipulado', 1, 36, 1, 'Faces Aleatórias', 1, 1, 5, '', NULL, '2026-05-08 16:22:31'),
(3, 24, 'totalmenteFotografado', 1, 10, 0, '', 0, 1, 30, '', NULL, '2026-05-12 13:12:12'),
(4, 25, 'fotografadoManipulado', 1, 11, 1, 'Faces Aleatórias', 1, 1, 30, '', NULL, '2026-05-12 13:51:09'),
(5, 26, 'totalmenteFotografado', 1, 19, 0, '', 0, 1, 20, '', NULL, '2026-05-12 20:34:33'),
(6, 27, 'totalmenteFotografado', 1, 1, 0, '', 0, 1, 20, '', NULL, '2026-05-12 21:44:23'),
(7, 28, 'totalmenteFotografado', 1, 10, 0, '', 0, 1, 20, '', NULL, '2026-05-12 22:26:37'),
(8, 29, 'fotografadoManipulado', 1, 10, 1, 'Faces Distintas', 10, 1, 5, '', NULL, '2026-05-13 12:44:08'),
(9, 30, 'totalmenteManipulado', 1, 1, 1, 'Faces Distintas', 3, 1, 10, '', NULL, '2026-05-15 16:35:35'),
(10, 32, 'totalmenteFotografado', 1, 10, 0, '', 0, 1, 20, '', NULL, '2026-05-15 17:02:12'),
(11, 31, 'fotografadoManipulado', 1, 10, 1, 'Faces Aleatórias', 1, 1, 5, '', NULL, '2026-05-17 03:23:39'),
(12, 33, 'totalmenteFotografado', 1, 10, 0, '', 0, 1, 15, '', NULL, '2026-05-28 19:51:35'),
(13, 34, 'totalmenteFotografado', 1, 20, 0, '', 0, 0, 0, '', NULL, '2026-05-29 01:13:25'),
(14, 35, 'totalmenteFotografado', 1, 10, 0, '', 0, 0, 0, '', NULL, '2026-05-29 01:44:52'),
(15, 36, 'totalmenteFotografado', 1, 10, 0, '', 0, 0, 0, '', NULL, '2026-05-29 02:07:35'),
(16, 37, 'totalmenteFotografado', 1, 1, 0, '', 0, 0, 0, '', NULL, '2026-05-29 02:14:30'),
(17, 39, 'totalmenteFotografado', 1, 10, 0, '', 0, 0, 0, '', NULL, '2026-05-29 02:38:25'),
(18, 38, 'totalmenteFotografado', 1, 10, 0, '', 0, 0, 0, '', NULL, '2026-05-29 02:51:33'),
(19, 40, 'totalmenteFotografado', 1, 10, 0, '', 0, 0, 0, '', NULL, '2026-05-29 02:56:48'),
(20, 41, 'totalmenteFotografado', 1, 10, 0, '', 0, 0, 0, '', NULL, '2026-05-29 03:01:45');

-- --------------------------------------------------------

--
-- Estrutura para tabela `SM_processo_detec`
--

CREATE TABLE `SM_processo_detec` (
  `id` int NOT NULL,
  `processo_id` int NOT NULL,
  `metodo_detec` varchar(100) NOT NULL,
  `observacao_detec` text,
  `proxima_etapa` varchar(40) NOT NULL,
  `aprovado_por` varchar(50) DEFAULT NULL,
  `data_aprovacao` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `SM_processo_detec`
--

INSERT INTO `SM_processo_detec` (`id`, `processo_id`, `metodo_detec`, `observacao_detec`, `proxima_etapa`, `aprovado_por`, `data_aprovacao`) VALUES
(1, 1, 'separadoDetec', '', 'amostra', NULL, '2026-05-08 16:03:39'),
(2, 23, 'separadoDetec', '', 'amostra', NULL, '2026-05-08 16:22:48'),
(3, 24, 'separadoDetec', '', 'amostra', NULL, '2026-05-12 13:12:20'),
(4, 25, 'separadoDetec', '', 'amostra', NULL, '2026-05-12 13:51:16'),
(5, 26, 'separadoDetec', '', 'amostra', NULL, '2026-05-12 20:34:40'),
(6, 27, 'separadoDetec', '', 'amostra', NULL, '2026-05-12 21:44:29'),
(7, 28, 'separadoDetec', '', 'amostra', NULL, '2026-05-12 22:26:52'),
(8, 29, 'separadoDetec', '', 'amostra', NULL, '2026-05-13 12:44:13'),
(9, 30, 'separadoDetec', '', 'amostra', NULL, '2026-05-15 16:36:08'),
(10, 32, 'separadoDetec', '', 'amostra', NULL, '2026-05-15 17:02:40'),
(11, 31, 'separadoDetec', '', 'inteligencia_mercado', NULL, '2026-05-28 14:17:40'),
(12, 33, 'separadoDetec', '', 'inteligencia_mercado', NULL, '2026-05-28 19:51:41'),
(13, 34, 'separadoDetec', '', 'inteligencia_mercado', NULL, '2026-05-29 01:26:37'),
(14, 34, 'separadoDetec', '', 'inteligencia_mercado', NULL, '2026-05-29 01:29:54'),
(15, 34, 'separadoDetec', '', 'inteligencia_mercado', NULL, '2026-05-29 01:33:11'),
(16, 34, 'separadoDetec', '', 'inteligencia_mercado', NULL, '2026-05-29 02:01:26'),
(17, 41, 'separadoDetec', '', 'inteligencia_mercado', NULL, '2026-05-29 03:52:03'),
(18, 40, 'separadoDetec', '', 'inteligencia_mercado', NULL, '2026-05-29 04:15:33');

-- --------------------------------------------------------

--
-- Estrutura para tabela `SM_processo_inteligenciaMercado`
--

CREATE TABLE `SM_processo_inteligenciaMercado` (
  `id` int NOT NULL,
  `processo_id` int NOT NULL,
  `pecas_separadas` int DEFAULT '0',
  `qtd_diferente` int DEFAULT '0',
  `qualidade` int DEFAULT '0',
  `identificacao` int DEFAULT '0',
  `observacao_inteligenciaMercado` text,
  `proxima_etapa` varchar(50) DEFAULT NULL,
  `data_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `SM_processo_inteligenciaMercado`
--

INSERT INTO `SM_processo_inteligenciaMercado` (`id`, `processo_id`, `pecas_separadas`, `qtd_diferente`, `qualidade`, `identificacao`, `observacao_inteligenciaMercado`, `proxima_etapa`, `data_registro`) VALUES
(1, 1, 0, 0, 0, 0, '', 'fotografia', '2026-05-08 16:04:03'),
(2, 23, 0, 0, 0, 0, '', 'fotografia', '2026-05-12 13:05:41'),
(4, 24, 0, 0, 0, 0, '', 'fotografia', '2026-05-12 13:20:16'),
(5, 25, 0, 0, 0, 0, '', 'fotografia', '2026-05-12 13:51:35'),
(6, 26, 0, 0, 0, 0, '', 'fotografia', '2026-05-12 20:36:46'),
(7, 27, 0, 0, 0, 0, '', 'fotografia', '2026-05-12 22:09:48'),
(8, 28, 0, 0, 0, 0, '', 'fotografia', '2026-05-12 22:27:21'),
(9, 29, 0, 0, 0, 0, '', 'fotografia', '2026-05-13 12:44:38'),
(10, 30, 0, 0, 0, 0, '', 'fotografia', '2026-05-15 16:37:19'),
(11, 32, 0, 0, 0, 0, '', 'fotografia', '2026-05-15 17:03:48'),
(12, 31, 1, 0, 0, 0, 'Produto nao foi localizado no Departamento de amostra', 'detec', '2026-05-28 19:37:42'),
(13, 33, 0, 1, 0, 0, 'Tivemos um total de 11 faces, mas o produto tem 12. Precisamos a face faltante pra completar o painel e enviarmos ao fotografo.', 'pendencias', '2026-05-28 19:56:24'),
(14, 34, 1, 0, 0, 0, 'Tivemos um total de 11 faces, mas o produto tem 12. Precisamos a face faltante pra completar o painel e enviarmos ao fotografo.', 'detec', '2026-05-29 01:13:47'),
(15, 34, 1, 0, 0, 0, 'Tivemos um total de 11 faces, mas o produto tem 12. Precisamos a face faltante pra completar o painel e enviarmos ao fotografo.', 'detec', '2026-05-29 01:26:52'),
(16, 34, 1, 0, 0, 0, 'Tivemos um total de 11 faces, mas o produto tem 12. Precisamos a face faltante pra completar o painel e enviarmos ao fotografo.', 'detec', '2026-05-29 01:30:06'),
(17, 34, 1, 0, 0, 0, '', 'detec', '2026-05-29 01:33:18'),
(18, 35, 1, 0, 0, 0, '', 'pendencias', '2026-05-29 01:58:14'),
(19, 34, 1, 0, 0, 0, '', 'pendencias', '2026-05-29 02:01:32'),
(20, 36, 1, 0, 0, 0, '', 'pendencias', '2026-05-29 02:07:43'),
(21, 37, 1, 0, 0, 0, '', 'pendencias', '2026-05-29 02:34:26'),
(22, 39, 1, 0, 0, 0, '', 'pendencias', '2026-05-29 02:49:34'),
(23, 38, 1, 0, 0, 0, '', 'pendencias', '2026-05-29 02:51:41'),
(24, 40, 1, 1, 0, 0, '', 'pendencias', '2026-05-29 02:56:59'),
(25, 41, 0, 1, 0, 0, '', 'pendencias', '2026-05-29 03:01:55'),
(26, 41, 1, 1, 1, 1, '', 'pendencias', '2026-05-29 03:12:58'),
(27, 41, 0, 0, 0, 0, '', 'pendencias', '2026-05-29 03:13:27'),
(28, 41, 0, 1, 0, 0, '', 'pendencias', '2026-05-29 03:17:50'),
(29, 41, 0, 1, 0, 0, '', 'pendencias', '2026-05-29 03:31:19'),
(30, 41, 0, 1, 0, 0, '', 'pendencias', '2026-05-29 03:35:26'),
(32, 41, 0, 1, 0, 0, '', 'pendencias', '2026-05-29 03:48:18'),
(33, 41, 0, 1, 1, 0, '', 'pendencias', '2026-05-29 03:52:10'),
(34, 40, 0, 1, 0, 0, '', 'pendencias', '2026-05-29 04:11:43'),
(40, 40, 0, 0, 1, 0, '', 'pendencias', '2026-05-29 04:17:46');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `SM_cadastros_itens_minimas`
--
ALTER TABLE `SM_cadastros_itens_minimas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_codigo_item` (`codigo_item`),
  ADD KEY `idx_marca` (`marca`),
  ADD KEY `idx_unidade_fabril` (`unidade_fabricacao`),
  ADD KEY `idx_data_criacao` (`data_criacao`);

--
-- Índices de tabela `SM_evidencias_inteligenciaMercado`
--
ALTER TABLE `SM_evidencias_inteligenciaMercado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `processo_id` (`processo_id`);

--
-- Índices de tabela `SM_item_imagens`
--
ALTER TABLE `SM_item_imagens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `pacote_id` (`pacote_id`);

--
-- Índices de tabela `SM_itens_movimentacoes`
--
ALTER TABLE `SM_itens_movimentacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_processo` (`processo_id`),
  ADD KEY `idx_area` (`area_origem`),
  ADD KEY `idx_data` (`data_acao`);

--
-- Índices de tabela `SM_itens_processos`
--
ALTER TABLE `SM_itens_processos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_item` (`item_id`),
  ADD KEY `idx_etapa` (`etapa_atual`),
  ADD KEY `idx_status` (`status_geral`),
  ADD KEY `idx_iniciado` (`iniciado_em`);

--
-- Índices de tabela `SM_pacotes_envio`
--
ALTER TABLE `SM_pacotes_envio`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `SM_pacote_itens`
--
ALTER TABLE `SM_pacote_itens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pacote_id` (`pacote_id`),
  ADD KEY `processo_id` (`processo_id`);

--
-- Índices de tabela `SM_processo_amostra`
--
ALTER TABLE `SM_processo_amostra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_processo_amostra` (`processo_id`);

--
-- Índices de tabela `SM_processo_comunicacao`
--
ALTER TABLE `SM_processo_comunicacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `processo_id` (`processo_id`);

--
-- Índices de tabela `SM_processo_detec`
--
ALTER TABLE `SM_processo_detec`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_processo_detec` (`processo_id`);

--
-- Índices de tabela `SM_processo_inteligenciaMercado`
--
ALTER TABLE `SM_processo_inteligenciaMercado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_processo_inteligenciaMercado` (`processo_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `SM_cadastros_itens_minimas`
--
ALTER TABLE `SM_cadastros_itens_minimas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de tabela `SM_evidencias_inteligenciaMercado`
--
ALTER TABLE `SM_evidencias_inteligenciaMercado`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `SM_item_imagens`
--
ALTER TABLE `SM_item_imagens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `SM_itens_movimentacoes`
--
ALTER TABLE `SM_itens_movimentacoes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT de tabela `SM_itens_processos`
--
ALTER TABLE `SM_itens_processos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de tabela `SM_pacotes_envio`
--
ALTER TABLE `SM_pacotes_envio`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `SM_pacote_itens`
--
ALTER TABLE `SM_pacote_itens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `SM_processo_amostra`
--
ALTER TABLE `SM_processo_amostra`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `SM_processo_comunicacao`
--
ALTER TABLE `SM_processo_comunicacao`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `SM_processo_detec`
--
ALTER TABLE `SM_processo_detec`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `SM_processo_inteligenciaMercado`
--
ALTER TABLE `SM_processo_inteligenciaMercado`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `SM_evidencias_inteligenciaMercado`
--
ALTER TABLE `SM_evidencias_inteligenciaMercado`
  ADD CONSTRAINT `SM_evidencias_inteligenciaMercado_ibfk_1` FOREIGN KEY (`processo_id`) REFERENCES `SM_itens_processos` (`id`);

--
-- Restrições para tabelas `SM_item_imagens`
--
ALTER TABLE `SM_item_imagens`
  ADD CONSTRAINT `SM_item_imagens_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `SM_cadastros_itens_minimas` (`id`),
  ADD CONSTRAINT `SM_item_imagens_ibfk_2` FOREIGN KEY (`pacote_id`) REFERENCES `SM_pacotes_envio` (`id`);

--
-- Restrições para tabelas `SM_itens_movimentacoes`
--
ALTER TABLE `SM_itens_movimentacoes`
  ADD CONSTRAINT `fk_movimentacao_processo` FOREIGN KEY (`processo_id`) REFERENCES `SM_itens_processos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `SM_itens_processos`
--
ALTER TABLE `SM_itens_processos`
  ADD CONSTRAINT `fk_processo_item` FOREIGN KEY (`item_id`) REFERENCES `SM_cadastros_itens_minimas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `SM_pacote_itens`
--
ALTER TABLE `SM_pacote_itens`
  ADD CONSTRAINT `SM_pacote_itens_ibfk_1` FOREIGN KEY (`pacote_id`) REFERENCES `SM_pacotes_envio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SM_pacote_itens_ibfk_2` FOREIGN KEY (`processo_id`) REFERENCES `SM_itens_processos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `SM_processo_amostra`
--
ALTER TABLE `SM_processo_amostra`
  ADD CONSTRAINT `fk_processo_amostra` FOREIGN KEY (`processo_id`) REFERENCES `SM_itens_processos` (`id`);

--
-- Restrições para tabelas `SM_processo_comunicacao`
--
ALTER TABLE `SM_processo_comunicacao`
  ADD CONSTRAINT `SM_processo_comunicacao_ibfk_1` FOREIGN KEY (`processo_id`) REFERENCES `SM_itens_processos` (`id`);

--
-- Restrições para tabelas `SM_processo_detec`
--
ALTER TABLE `SM_processo_detec`
  ADD CONSTRAINT `fk_processo_detec` FOREIGN KEY (`processo_id`) REFERENCES `SM_itens_processos` (`id`);

--
-- Restrições para tabelas `SM_processo_inteligenciaMercado`
--
ALTER TABLE `SM_processo_inteligenciaMercado`
  ADD CONSTRAINT `fk_processo_inteligenciaMercado` FOREIGN KEY (`processo_id`) REFERENCES `SM_itens_processos` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
