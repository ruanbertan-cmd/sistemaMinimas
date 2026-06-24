-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Tempo de geração: 24/06/2026 às 19:47
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
  `ciclo_lancamento` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `responsavel_carga` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `SM_cadastros_itens_minimas`
--

INSERT INTO `SM_cadastros_itens_minimas` (`id`, `marca`, `categoria_pt_br`, `categoria_us`, `categoria_es`, `serie`, `tamanho_nominal`, `descricao`, `codigo_barras_cx`, `superficie_pt_br`, `superficie_us`, `superficie_es`, `junta_assentamento`, `abrasao_superficial`, `variacao_tonalidade`, `unidade_medida`, `pecas_caixa`, `m2_caixa`, `peso_caixa`, `coeficiente_atrito`, `espessura`, `grupo_absorcao`, `item_ativo`, `cor_pt_br`, `cor_us`, `cor_es`, `recomendado_uso`, `local_uso`, `retificado`, `polo`, `lancamento`, `estilo`, `estilo_us`, `estilo_es`, `relevo`, `rodape`, `numeros_face`, `tamanho_fabricacao`, `codigo_item`, `unidade_fabricacao`, `monocalibre`, `ciclo_lancamento`, `data_criacao`, `responsavel_carga`) VALUES
(1, 'DECORTILES', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'ARTEMI', '19,7X120', 'ARTEMI JEQUITIBA AC 3D', '7891291299197', 'ACETINADO', 'SATIN', 'SATINADO', 1, '3', 'V2', 'M2', 7, 1.65, 34.498, 'II', 9.5, 'BIA', 1, 'MARROM', 'BROWN', 'MARRON', 'PI', 'FMC#FWI#WWS#WFA', 1, 'SC', 1, 'MADEIRA', 'WOOD', 'MADERA', 1, 0, 36, '197X1200', '8068339', 'SC3', 0, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(2, 'DECORTILES', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'TERRAE', '30X30', 'TERRAE ARGAN AC', '7891291315637', 'ACETINADO', 'SATIN', 'SATINADO', 1, '3', 'V3', 'M2', 16, 1.43, 27.620, 'II', 8.5, 'BIA', 1, 'MARROM', 'BROWN', 'MARRON', 'PI', 'FMC#FWI#WWS#WFA', 1, 'SC', 1, 'ARGILA', 'CLAY', 'ARCILLA', 1, 0, 48, '299,5X299,5', '8069197', 'SC4', 1, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(3, 'DECORTILES', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'TERRAE', '30X30', 'TERRAE ARGILA AC', '7891291315576', 'ACETINADO', 'SATIN', 'SATINADO', 1, '2', 'V3', 'M2', 16, 1.43, 27.620, 'II', 8.5, 'BIA', 1, 'LARANJA', 'ORANGE', 'NARANJA', 'PI', 'FMC#FWI#WWS#WFA', 1, 'SC', 1, 'ARGILA', 'CLAY', 'ARCILLA', 1, 0, 48, '299,5X299,5', '8069195', 'SC4', 1, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(4, 'DECORTILES', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'TERRAE', '30X30', 'TERRAE CANYON AC', '7891291315606', 'ACETINADO', 'SATIN', 'SATINADO', 1, '2', 'V3', 'M2', 16, 1.43, 27.620, 'II', 8.5, 'BIA', 1, 'MARROM', 'BROWN', 'MARRON', 'PI', 'FMC#FWI#WWS#WFA', 1, 'SC', 1, 'ARGILA', 'CLAY', 'ARCILLA', 1, 0, 48, '299,5X299,5', '8069196', 'SC4', 1, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(5, 'DECORTILES', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'TERRAE', '30X30', 'TERRAE OSSO AC', '7891291315545', 'ACETINADO', 'SATIN', 'SATINADO', 1, '4', 'V3', 'M2', 16, 1.43, 27.620, 'II', 8.5, 'BIA', 1, 'BRANCO', 'WHITE', 'BLANCO', 'PI', 'FMC#FWI#WWS#WFA', 1, 'SC', 1, 'ARGILA', 'CLAY', 'ARCILLA', 1, 0, 48, '299,5X299,5', '8069194', 'SC4', 1, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(6, 'ELIANE', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'ORIS', '2,5X20', 'BORDA I ORIS PETRA CORDA EXT 3D', '7891291336816', 'RESISTENTE AO ESCORREGAMENTO', 'SLIP RESISTANT', 'ANTIRESBALANTE', 2, 'ND', 'V2', 'PC', 10, 0.10, 7.590, 'II', 7.4, 'BIA', 1, 'BRANCO', 'WHITE', 'BLANCO', 'PI', 'WWS#FMO', 1, 'SC', 1, 'PEDRA', 'STONES', 'PIEDRA', 1, 0, 1, '25X200', '8070036', 'SCINDOUT', 0, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(7, 'ELIANE', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'ORIS', '2,5X20', 'BORDA I ORIS PETRA GRIS EXT 3D', '7891291336847', 'RESISTENTE AO ESCORREGAMENTO', 'SLIP RESISTANT', 'ANTIRESBALANTE', 2, 'ND', 'V2', 'PC', 10, 0.10, 7.590, 'II', 7.4, 'BIA', 1, 'CINZA', 'GRAY', 'GRIS', 'PI', 'WWS#FMO', 1, 'SC', 1, 'PEDRA', 'STONES', 'PIEDRA', 1, 0, 1, '25X200', '8070037', 'SCINDOUT', 0, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(8, 'ELIANE', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'ORIS', '2,5X20', 'BORDA I ORIS PETRA BRUT EXT 3D', '7891291336878', 'RESISTENTE AO ESCORREGAMENTO', 'SLIP RESISTANT', 'ANTIRESBALANTE', 2, 'ND', 'V2', 'PC', 10, 0.10, 7.590, 'II', 7.4, 'BIA', 1, 'BEGE', 'BEIGE', 'BEIGE', 'PI', 'WWS#FMO', 1, 'SC', 1, 'PEDRA', 'STONES', 'PIEDRA', 1, 0, 1, '25X200', '8070038', 'SCINDOUT', 0, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(9, 'ELIANE', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'ORIS', '2,5X20', 'BORDA E ORIS PETRA CORDA EXT 3D', '7891291336908', 'RESISTENTE AO ESCORREGAMENTO', 'SLIP RESISTANT', 'ANTIRESBALANTE', 2, 'ND', 'V2', 'PC', 10, 0.10, 7.590, 'II', 7.4, 'BIA', 1, 'BRANCO', 'WHITE', 'BLANCO', 'PI', 'WWS#FMO', 1, 'SC', 1, 'PEDRA', 'STONES', 'PIEDRA', 1, 0, 1, '25X200', '8070039', 'SCINDOUT', 0, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(10, 'ELIANE', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'ORIS', '2,5X20', 'BORDA E ORIS PETRA GRIS EXT 3D', '7891291336939', 'RESISTENTE AO ESCORREGAMENTO', 'SLIP RESISTANT', 'ANTIRESBALANTE', 2, 'ND', 'V2', 'PC', 10, 0.10, 7.590, 'II', 7.4, 'BIA', 1, 'CINZA', 'GRAY', 'GRIS', 'PI', 'WWS#FMO', 1, 'SC', 1, 'PEDRA', 'STONES', 'PIEDRA', 1, 0, 1, '25X200', '8070040', 'SCINDOUT', 0, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(11, 'ELIANE', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'ORIS', '2,5X20', 'BORDA E ORIS PETRA BRUT EXT 3D', '7891291336960', 'RESISTENTE AO ESCORREGAMENTO', 'SLIP RESISTANT', 'ANTIRESBALANTE', 2, 'ND', 'V2', 'PC', 10, 0.10, 7.590, 'II', 7.4, 'BIA', 1, 'BEGE', 'BEIGE', 'BEIGE', 'PI', 'WWS#FMO', 1, 'SC', 1, 'PEDRA', 'STONES', 'PIEDRA', 1, 0, 1, '25X200', '8070041', 'SCINDOUT', 0, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(12, 'ELIZABETH', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'SANTUARIO', '60X60', 'SANTUARIO ESM ACET', '7908545821506', 'ACETINADO', 'SATIN', 'SATINADO', 1, 'ND', 'V3', 'M2', 6, 2.16, 37.475, 'II', 7.4, 'BIA', 1, 'BRANCO', 'WHITE', 'BLANCO', 'PI', 'FLC#FWI#WFA', 1, 'SC', 1, 'MARMORE', 'MARBLE', 'M', 0, 0, 4, '600X600', '8070129', 'SC5', 1, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(13, 'ELIZABETH', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'MADALENA', '60X60', 'MADALENA GEADA ESM ACET', '7908545821537', 'ACETINADO', 'SATIN', 'SATINADO', 1, 'ND', 'V3', 'M2', 6, 2.16, 37.475, 'II', 7.4, 'BIA', 1, 'CINZA', 'GRAY', 'GRIS', 'PI', 'FLC#FWI#WFA', 1, 'SC', 1, 'MARMORE', 'MARBLE', 'M', 0, 0, 4, '600X600', '8070130', 'SC5', 1, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(14, 'ELIZABETH', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'MADALENA', '60X60', 'MADALENA AREIA ESM ACET', '7908545821568', 'ACETINADO', 'SATIN', 'SATINADO', 1, 'ND', 'V3', 'M2', 6, 2.16, 37.475, 'II', 7.4, 'BIA', 1, 'BEGE', 'BEIGE', 'BEIGE', 'PI', 'FLC#FWI#WFA', 1, 'SC', 1, 'MARMORE', 'MARBLE', 'M', 0, 0, 4, '600X600', '8070131', 'SC5', 1, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(15, 'ELIZABETH', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'LE BLANC', '70X70', 'LE BLANC ESM ACET', '7899060666775', 'ACETINADO', 'SATIN', 'SATINADO', 1, '4', 'V3', 'M2', 5, 2.45, 40.442, 'II', 7.4, 'BIA', 1, 'BRANCO', 'WHITE', 'BLANCO', 'PI', 'FLC#FWI#WFA', 1, 'PB', 0, 'MARMORE', 'MARBLE', 'M', 0, 0, 5, '700X700', '8070132', 'PB1', 1, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(16, 'ELIZABETH', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'LE BLANC', '70X70', 'LE BLANC ESM POL', '7899060666805', 'POLIDO', 'POLISHED', 'PULIDO', 1, '4', 'V3', 'M2', 5, 2.45, 40.442, 'I', 7.4, 'BIA', 1, 'BRANCO', 'WHITE', 'BLANCO', 'PI', 'FLC#WFA', 1, 'PB', 0, 'MARMORE', 'MARBLE', 'M', 0, 0, 5, '700X700', '8070133', 'PB1', 1, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(17, 'ELIZABETH', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'LUXURY', '100X100', 'LUXURY GEADA ESM ACET', '7899060666836', 'ACETINADO', 'SATIN', 'SATINADO', 1, 'ND', 'V3', 'M2', 3, 3.00, 57.510, 'II', 8.5, 'BIA', 1, 'BEGE', 'BEIGE', 'BEIGE', 'PI', 'FMC#FWI#WFA', 1, 'PB', 1, 'MARMORE', 'MARBLE', 'M', 0, 0, 6, '1000X1000', '8070134', 'PB1', 1, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(18, 'ELIZABETH', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'CAPIM DOURADO', '100X100', 'CAPIM DOURADO ESM EXT MD', '7899060666867', 'RESISTENTE AO ESCORREGAMENTO', 'SLIP RESISTANT', 'ANTIRESBALANTE', 1, 'ND', 'V3', 'M2', 3, 3.00, 57.510, 'II', 8.5, 'BIA', 1, 'BEGE', 'BEIGE', 'BEIGE', 'PI', 'WWS#WFA#FMO', 1, 'PB', 0, 'MARMORE', 'MARBLE', 'M', 0, 0, 6, '1000X1000', '8070135', 'PB1', 1, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(19, 'ELIZABETH', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'LUXURY', '100X100', 'LUXURY GEADA ESM POL', '7899060666898', 'POLIDO', 'POLISHED', 'PULIDO', 1, 'ND', 'V3', 'M2', 3, 3.00, 57.510, 'I', 8.5, 'BIA', 1, 'BEGE', 'BEIGE', 'BEIGE', 'PI', 'FLC#WFA', 1, 'PB', 1, 'MARMORE', 'MARBLE', 'M', 0, 0, 6, '1000X1000', '8070136', 'PB1', 1, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(20, 'ELIZABETH', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'LUXURY', '84X84', 'LUXURY GEADA ESM ACET', '7899060666928', 'ACETINADO', 'SATIN', 'SATINADO', 1, 'ND', 'V3', 'M2', 3, 2.12, 38.804, 'II', 8.0, 'BIA', 1, 'BEGE', 'BEIGE', 'BEIGE', 'PI', 'FMC#FWI#WFA', 1, 'PB', 1, 'MARMORE', 'MARBLE', 'M', 0, 0, 6, '840X840', '8070137', 'PB1', 1, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(21, 'ELIZABETH', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'LUXURY', '84X84', 'LUXURY GEADA ESM POL', '7899060666959', 'POLIDO', 'POLISHED', 'PULIDO', 1, 'ND', 'V3', 'M2', 3, 2.12, 38.804, 'I', 8.0, 'BIA', 1, 'BEGE', 'BEIGE', 'BEIGE', 'PI', 'FLC#WFA', 1, 'PB', 1, 'MARMORE', 'MARBLE', 'M', 0, 0, 6, '840X840', '8070138', 'PB1', 1, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(22, 'ELIZABETH', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'LUXURY', '100X100', 'LUXURY GEADA ESM ACET', '7891291339183', 'ACETINADO', 'SATIN', 'SATINADO', 1, 'ND', 'V3', 'M2', 2, 2.00, 40.660, 'II', 9.0, 'BIA', 1, 'BEGE', 'BEIGE', 'BEIGE', 'PI', 'FMC#FWI#WFA', 1, 'SC', 1, 'MARMORE', 'MARBLE', 'M', 0, 0, 6, '1000X1000', '8070139', 'SC2', 1, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(23, 'ELIZABETH', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'LUXURY', '100X100', 'LUXURY GEADA ESM POL', '7891291339213', 'POLIDO', 'POLISHED', 'PULIDO', 1, 'ND', 'V3', 'M2', 2, 2.00, 40.660, 'I', 9.0, 'BIA', 1, 'BEGE', 'BEIGE', 'BEIGE', 'PI', 'FLC#WFA', 1, 'SC', 1, 'MARMORE', 'MARBLE', 'M', 0, 0, 8, '1000X1000', '8070140', 'SC2', 1, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(24, 'ELIZABETH', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'LUXURY', '100X100', 'CAPIM DOURADO ESM EXT MD', '7891291339244', 'RESISTENTE AO ESCORREGAMENTO', 'SLIP RESISTANT', 'ANTIRESBALANTE', 1, 'ND', 'V3', 'M2', 2, 2.00, 40.660, 'II', 9.0, 'BIA', 1, 'CINZA', 'GRAY', 'GRIS', 'PI', 'WWS#WFA#FMO', 1, 'SC', 0, 'MARMORE', 'MARBLE', 'M', 0, 0, 6, '1000X1000', '8070141', 'SC2', 1, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(25, 'ELIZABETH', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'LUXURY', '84X84', 'LUXURY GEADA ESM ACET', '7908545821599', 'ACETINADO', 'SATIN', 'SATINADO', 1, 'ND', 'V3', 'M2', 3, 2.12, 44.220, 'II', 9.0, 'BIA', 1, 'BEGE', 'BEIGE', 'BEIGE', 'PI', 'FMC#FWI#WFA', 1, 'SC', 1, 'MARMORE', 'MARBLE', 'M', 0, 0, 8, '840X840', '8070145', 'SC5', 1, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(26, 'ELIZABETH', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'ANHEMBI', '84X84', 'ANHEMBI AREIA ESM EXT', '7908545821629', 'RESISTENTE AO ESCORREGAMENTO', 'SLIP RESISTANT', 'ANTIRESBALANTE', 1, 'ND', 'V3', 'M2', 3, 2.12, 44.220, 'II', 9.0, 'BIA', 1, 'BEGE', 'BEIGE', 'BEIGE', 'PI', 'WWS#WFA#FMO', 1, 'SC', 1, 'CIMENTO', 'CEMENT', 'CEMENTO', 0, 0, 9, '840X840', '8070146', 'SC5', 1, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(27, 'ELIZABETH', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'LUXURY', '84X84', 'LUXURY GEADA ESM POL', '7908545821650', 'POLIDO', 'POLISHED', 'PULIDO', 1, 'ND', 'V3', 'M2', 3, 2.12, 45.276, 'I', 9.0, 'BIA', 1, 'BEGE', 'BEIGE', 'BEIGE', 'PI', 'FLC#WFA', 1, 'SC', 1, 'MARMORE', 'MARBLE', 'M', 0, 0, 6, '840X840', '8070147', 'SC5', 1, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(28, 'DECORTILES', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'MEKNES', '15X15', 'MEKNES AVE AC', '7891291293706', 'ACETINADO', 'SATIN', 'SATINADO', 2, '3', 'V3', 'M2', 28, 0.62, 12.196, 'I', 9.0, 'BIA', 1, 'BEGE', 'BEIGE', 'BEIGE', 'PI', 'FLC#WWS#WFA', 1, 'SC', 1, 'ARTESANAL', 'HANDMADE', 'HECHO A MANO', 1, 0, 36, '149X149', '8068128', 'SC1', 0, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(29, 'DECORTILES', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'MEKNES', '15X15', 'MEKNES JERI BR', '7891291341919', 'BRILHANTE', 'BRILLIANT', 'BRILHANTE', 2, '2', 'V3', 'M2', 28, 0.62, 12.196, 'I', 9.0, 'BIA', 1, 'BRANCO', 'WHITE', 'BLANCO', 'PI', 'FIR#WWS#WFA', 1, 'SC', 1, 'ZELLIGE', 'ZELLIGE', 'ZELLIGE', 1, 0, 36, '149X149', '8070426', 'SC1', 0, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(30, 'DECORTILES', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'MEKNES', '15X15', 'MEKNES AVE BR', '7891291341940', 'BRILHANTE', 'BRILLIANT', 'BRILHANTE', 2, 'ND', 'V3', 'M2', 28, 0.62, 12.196, 'I', 9.0, 'BIA', 1, 'BEGE', 'BEIGE', 'BEIGE', 'PI', 'FIR#WWS#WFA', 1, 'SC', 1, 'ZELLIGE', 'ZELLIGE', 'ZELLIGE', 1, 0, 36, '149X149', '8070427', 'SC1', 0, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante'),
(31, 'DECORTILES', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'MEKNES', '15X15', 'MEKNES CANYON AC', '7891291341971', 'ACETINADO', 'SATIN', 'SATINADO', 2, 'ND', 'V3', 'M2', 28, 0.62, 12.196, 'I', 9.0, 'BIA', 1, 'MARROM', 'BROWN', 'MARRON', 'PI', 'FLC#WWS#WFA', 1, 'SC', 1, 'ZELLIGE', 'ZELLIGE', 'ZELLIGE', 1, 0, 36, '149X149', '8070428', 'SC1', 0, '1_26', '2026-06-23 17:47:11', 'usuario Cadastrante');

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
(1, 14, 'qualidade', NULL, 'elizabeth-catharina-ice-esm-acet-84x84cm-01.jpg', '2026-06-23 17:12:53', 'usuarioSistema', 'validada', 'Ok, enviado peça substituta'),
(2, 2, 'qualidade', NULL, 'elizabeth-catharina-ice-esm-acet-84x84cm-01.jpg', '2026-06-23 17:18:53', 'usuarioSistema', 'validada', 'Ok, peças com defeito substituidas!'),
(3, 14, 'qtd_diferente', NULL, NULL, '2026-06-24 11:28:54', 'usuarioSistema', 'validada', 'Não temos produção por agora, pegar do estoque da amostra para substituir'),
(4, 2, 'qtd_diferente', NULL, NULL, '2026-06-24 11:33:19', 'usuarioSistema', 'validada', 'Ok, revisado. Peças pendentes enviadas.'),
(5, 2, 'identificacao', NULL, NULL, '2026-06-24 11:35:26', 'usuarioSistema', 'validada', 'Ok, revisado'),
(6, 2, 'qtd_diferente', NULL, NULL, '2026-06-24 11:39:13', 'usuarioSistema', 'validada', 'Ok, revisado. Peças pendentes enviadas.'),
(7, 2, 'qualidade', NULL, NULL, '2026-06-24 11:39:13', 'usuarioSistema', 'validada', 'Ok, peças com defeito substituidas!');

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
  `status` enum('pendente','aprovado','rejeitado','atualizar') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'pendente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `SM_item_imagens`
--

INSERT INTO `SM_item_imagens` (`id`, `item_id`, `pacote_id`, `caminho_arquivo`, `tipo`, `descricao`, `data_upload`, `usuario_upload`, `status`) VALUES
(1, 12, 1, 'elizabeth-catharina-ice-esm-acet-84x84cm-01.jpg', 'foto', NULL, '2026-06-24 14:50:19', NULL, 'aprovado'),
(2, 12, 1, 'elizabeth-catharina-ice-esm-acet-84x84cm-01.jpg', 'manipulada', NULL, '2026-06-24 13:52:43', NULL, 'aprovado'),
(3, 12, 1, 'eliane-munari-branco-ac-120x120cm-05.jpg', 'manipulada', NULL, '2026-06-24 16:34:51', NULL, 'aprovado');

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
(1, 1, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(2, 2, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(3, 3, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(4, 4, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(5, 5, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(6, 6, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(7, 7, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(8, 8, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(9, 9, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(10, 10, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(11, 11, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(12, 12, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(13, 13, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(14, 14, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(15, 15, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(16, 16, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(17, 17, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(18, 18, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(19, 19, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(20, 20, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(21, 21, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(22, 22, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(23, 23, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(24, 24, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(25, 25, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(26, 26, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(27, 27, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(28, 28, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(29, 29, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(30, 30, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(31, 31, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-06-23 17:47:11'),
(32, 1, 'comunicacao', 'detec', 'liberacao_etapa', 'usuarioSistema', '', '2026-06-23 15:01:57'),
(33, 1, 'detec', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-06-23 15:11:47'),
(34, 2, 'comunicacao', 'detec', 'liberacao_etapa', 'usuarioSistema', '', '2026-06-23 15:12:15'),
(35, 2, 'detec', 'amostra', 'liberacao_etapa', 'usuarioSistema', '', '2026-06-23 15:12:35'),
(36, 2, 'amostra', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-06-23 15:12:46'),
(37, 12, 'comunicacao', 'detec', 'liberacao_etapa', 'usuarioSistema', '', '2026-06-23 15:20:58'),
(38, 12, 'detec', 'amostra', 'liberacao_etapa', 'usuarioSistema', '', '2026-06-23 15:21:12'),
(39, 12, 'amostra', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-06-23 15:21:36'),
(40, 12, 'inteligencia_mercado', 'comunicacao', 'liberacao_etapa', 'usuarioSistema', '', '2026-06-23 15:24:11'),
(41, 14, 'comunicacao', 'detec', 'liberacao_etapa', 'usuarioSistema', '', '2026-06-23 17:03:41'),
(42, 14, 'detec', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-06-23 17:05:04'),
(43, 14, 'inteligencia_mercado', 'detec_retrabalho', 'liberacao_etapa', 'usuarioSistema', '', '2026-06-23 17:12:53'),
(44, 2, 'inteligencia_mercado', 'detec_retrabalho', 'liberacao_etapa', 'usuarioSistema', '', '2026-06-23 17:18:53'),
(45, 14, 'inteligencia_mercado', 'detec_retrabalho', 'liberacao_etapa', 'usuarioSistema', '', '2026-06-24 11:28:54'),
(46, 2, 'detec', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', '', '2026-06-24 11:33:00'),
(47, 2, 'inteligencia_mercado', 'detec_retrabalho', 'liberacao_etapa', 'usuarioSistema', '', '2026-06-24 11:33:19'),
(48, 2, 'inteligencia_mercado', 'detec_retrabalho', 'liberacao_etapa', 'usuarioSistema', '', '2026-06-24 11:35:26'),
(49, 2, 'inteligencia_mercado', 'detec_retrabalho', 'liberacao_etapa', 'usuarioSistema', '', '2026-06-24 11:39:13'),
(50, 12, 'comunicacao', 'fotografia', 'aprovar_envio_pecas', 'comunicacao', 'Aprovando envio das peças separadas na amostra', '2026-06-24 11:45:32'),
(51, 12, 'comunicacao', 'fotografia', 'agendar_fotografo', 'comunicacao', 'Agendamento realizado para Arlei em 2026-06-26T15:00', '2026-06-24 14:49:43'),
(52, 12, 'fotografia', 'amostra', 'envio_pecas', 'amostra', 'Peças enviadas', '2026-06-24 14:49:57'),
(53, 12, 'fotografia', 'design', 'upload_imagens', 'usuarioSistema', 'aguardando aprovação das imagens', '2026-06-24 11:50:19'),
(54, 12, 'design', 'sistema_imagem', 'aprovado_imagem', 'usuarioSistema', 'Imagem aprovada, aguardando processamento para sistema de imagem', '2026-06-24 13:32:27'),
(55, 12, 'fotografia', 'design', 'upload_imagens', 'usuarioSistema', 'aguardando aprovação das imagens', '2026-06-24 13:34:51'),
(56, 12, 'design', 'fotografia', 'rejeitado_imagem', 'usuarioSistema', 'Imagem reprovada, retornando para o fotógrafo', '2026-06-24 13:34:56'),
(57, 12, 'fotografia', 'designers', 'atualizar_imagem', 'usuarioSistema', 'Imagem atualizada, aguardando nova aprovação dos designers', '2026-06-24 13:38:27'),
(58, 12, 'designers', 'fotografia', 'rejeitado_imagem', 'usuarioSistema', 'Imagem reprovada, retornando para o fotógrafo', '2026-06-24 13:38:41'),
(59, 12, 'fotografia', 'designers', 'atualizar_imagem', 'usuarioSistema', 'Imagem atualizada, aguardando nova aprovação dos designers', '2026-06-24 13:38:56'),
(60, 12, 'designers', 'fotografia', 'rejeitado_imagem', 'usuarioSistema', 'Imagem reprovada, retornando para o fotógrafo', '2026-06-24 13:39:27'),
(61, 12, 'fotografia', 'designers', 'atualizar_imagem', 'usuarioSistema', 'Imagem atualizada, aguardando nova aprovação dos designers', '2026-06-24 13:39:34'),
(62, 12, 'designers', 'fotografia', 'rejeitado_imagem', 'usuarioSistema', 'Imagem reprovada, retornando para o fotógrafo', '2026-06-24 13:42:39'),
(63, 12, 'fotografia', 'designers', 'atualizar_imagem', 'usuarioSistema', 'Imagem atualizada, aguardando nova aprovação dos designers', '2026-06-24 13:45:40'),
(64, 12, 'designers', 'fotografia', 'rejeitado_imagem', 'usuarioSistema', 'Imagem reprovada, retornando para o fotógrafo', '2026-06-24 13:48:31'),
(65, 12, 'fotografia', 'designers', 'atualizar_imagem', 'usuarioSistema', 'Imagem atualizada, aguardando nova aprovação dos designers', '2026-06-24 13:48:40'),
(66, 12, 'designers', 'fotografia', 'rejeitado_imagem', 'usuarioSistema', 'Imagem reprovada, retornando para o fotógrafo', '2026-06-24 13:49:30'),
(67, 12, 'fotografia', 'designers', 'atualizar_imagem', 'usuarioSistema', 'Imagem atualizada, aguardando nova aprovação dos designers', '2026-06-24 13:49:35'),
(68, 12, 'designers', 'fotografia', 'rejeitado_imagem', 'usuarioSistema', 'Imagem reprovada, retornando para o fotógrafo', '2026-06-24 13:50:39'),
(69, 12, 'fotografia', 'designers', 'atualizar_imagem', 'usuarioSistema', 'Imagem atualizada, aguardando nova aprovação dos designers', '2026-06-24 13:52:43'),
(70, 12, 'designers', 'sistema_imagem', 'aprovado_imagem', 'usuarioSistema', 'Imagem aprovada, aguardando processamento para sistema de imagem', '2026-06-24 14:00:10'),
(71, 12, 'inteligencia_mercado', 'sistema_imagem', 'aprovado_imagem', 'usuarioSistema', 'Imagem aprovada, aguardando processamento para sistema de imagem', '2026-06-24 14:00:11');

-- --------------------------------------------------------

--
-- Estrutura para tabela `SM_itens_processos`
--

CREATE TABLE `SM_itens_processos` (
  `id` int NOT NULL,
  `item_id` int NOT NULL,
  `etapa_atual` varchar(100) NOT NULL DEFAULT 'comunicacao_analise',
  `status_geral` enum('pendente','em_andamento','finalizado','reprovado','cancelado','enviado','preparando_envio','aguardando_aprovacao_imagens','retrabalhando_pendencias','agendado','aguardando_imagem') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `iniciado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `finalizado_em` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `SM_itens_processos`
--

INSERT INTO `SM_itens_processos` (`id`, `item_id`, `etapa_atual`, `status_geral`, `iniciado_em`, `finalizado_em`) VALUES
(1, 1, 'amostra', 'em_andamento', '2026-06-23 17:47:11', NULL),
(2, 2, 'inteligencia_mercado', 'em_andamento', '2026-06-23 17:47:11', NULL),
(3, 3, 'comunicacao', 'em_andamento', '2026-06-23 17:47:11', NULL),
(4, 4, 'comunicacao', 'em_andamento', '2026-06-23 17:47:11', NULL),
(5, 5, 'comunicacao', 'em_andamento', '2026-06-23 17:47:11', NULL),
(6, 6, 'comunicacao', 'em_andamento', '2026-06-23 17:47:11', NULL),
(7, 7, 'comunicacao', 'em_andamento', '2026-06-23 17:47:11', NULL),
(8, 8, 'comunicacao', 'em_andamento', '2026-06-23 17:47:11', NULL),
(9, 9, 'comunicacao', 'em_andamento', '2026-06-23 17:47:11', NULL),
(10, 10, 'comunicacao', 'em_andamento', '2026-06-23 17:47:11', NULL),
(11, 11, 'comunicacao', 'em_andamento', '2026-06-23 17:47:11', NULL),
(12, 12, 'inteligencia_mercado', 'finalizado', '2026-06-23 17:47:11', '2026-06-24 14:49:57'),
(13, 13, 'comunicacao', 'em_andamento', '2026-06-23 17:47:11', NULL),
(14, 14, 'detec', 'em_andamento', '2026-06-23 17:47:11', NULL),
(15, 15, 'comunicacao', 'em_andamento', '2026-06-23 17:47:11', NULL),
(16, 16, 'comunicacao', 'em_andamento', '2026-06-23 17:47:11', NULL),
(17, 17, 'comunicacao', 'em_andamento', '2026-06-23 17:47:11', NULL),
(18, 18, 'comunicacao', 'em_andamento', '2026-06-23 17:47:11', NULL),
(19, 19, 'comunicacao', 'em_andamento', '2026-06-23 17:47:11', NULL),
(20, 20, 'comunicacao', 'em_andamento', '2026-06-23 17:47:11', NULL),
(21, 21, 'comunicacao', 'em_andamento', '2026-06-23 17:47:11', NULL),
(22, 22, 'comunicacao', 'em_andamento', '2026-06-23 17:47:11', NULL),
(23, 23, 'comunicacao', 'em_andamento', '2026-06-23 17:47:11', NULL),
(24, 24, 'comunicacao', 'em_andamento', '2026-06-23 17:47:11', NULL),
(25, 25, 'comunicacao', 'em_andamento', '2026-06-23 17:47:11', NULL),
(26, 26, 'comunicacao', 'em_andamento', '2026-06-23 17:47:11', NULL),
(27, 27, 'comunicacao', 'em_andamento', '2026-06-23 17:47:11', NULL),
(28, 28, 'comunicacao', 'em_andamento', '2026-06-23 17:47:11', NULL),
(29, 29, 'comunicacao', 'em_andamento', '2026-06-23 17:47:11', NULL),
(30, 30, 'comunicacao', 'em_andamento', '2026-06-23 17:47:11', NULL),
(31, 31, 'comunicacao', 'em_andamento', '2026-06-23 17:47:11', NULL);

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
(1, 'finalizado', '2026-06-23 18:24:11', '2026-06-24 14:45:32', 'comunicacao', NULL, '2026-06-26 15:00:00', 'Arlei', '2026-06-24 14:49:57');

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
(1, 1, 12, '2026-06-23 18:24:11');

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
(1, 2, 'pecasSeparadas', '', 'inteligencia_mercado', NULL, '2026-06-23 18:12:46'),
(2, 12, 'pecasSeparadas', '', 'inteligencia_mercado', NULL, '2026-06-23 18:21:36');

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
(1, 1, 'totalmenteFotografado', 1, 36, 0, '', 0, 1, 5, '', NULL, '2026-06-23 18:01:57'),
(2, 2, 'totalmenteManipulado', 0, 0, 1, 'Faces Aleatórias', 20, 0, 0, '', NULL, '2026-06-23 18:12:15'),
(3, 12, 'fotografadoManipulado', 1, 1, 1, 'Faces Aleatórias', 3, 1, 4, '', NULL, '2026-06-23 18:20:58'),
(4, 14, 'totalmenteFotografado', 1, 20, 0, '', 0, 0, 0, '', NULL, '2026-06-23 20:03:41');

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
(1, 1, 'separadoDetec', '', 'inteligencia_mercado', NULL, '2026-06-23 18:11:47'),
(2, 2, 'separadoAmostra', '', 'amostra', NULL, '2026-06-23 18:12:35'),
(3, 12, 'separadoAmostra', '', 'amostra', NULL, '2026-06-23 18:21:12'),
(4, 14, 'separadoDetec', '', 'inteligencia_mercado', NULL, '2026-06-23 20:05:04'),
(5, 2, 'separadoDetec', '', 'inteligencia_mercado', NULL, '2026-06-24 14:33:00');

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
(1, 12, 0, 0, 0, 0, '', 'fotografia', '2026-06-23 18:24:11'),
(2, 14, 0, 0, 1, 0, '', 'detec_retrabalho', '2026-06-23 20:12:53'),
(3, 2, 0, 0, 1, 0, '', 'detec_retrabalho', '2026-06-23 20:18:53'),
(4, 14, 0, 1, 0, 0, '', 'detec_retrabalho', '2026-06-24 14:28:54'),
(5, 2, 0, 1, 0, 0, '', 'detec_retrabalho', '2026-06-24 14:33:19'),
(6, 2, 0, 0, 0, 1, '', 'detec_retrabalho', '2026-06-24 14:35:26'),
(7, 2, 0, 1, 1, 0, '', 'detec_retrabalho', '2026-06-24 14:39:13');

-- --------------------------------------------------------

--
-- Estrutura para tabela `SM_sistema_imagens`
--

CREATE TABLE `SM_sistema_imagens` (
  `id` int NOT NULL,
  `item_id` int NOT NULL,
  `processo_id` int NOT NULL,
  `marca` varchar(80) DEFAULT NULL,
  `categoria_pt_br` varchar(80) DEFAULT NULL,
  `categoria_us` varchar(80) DEFAULT NULL,
  `categoria_es` varchar(80) DEFAULT NULL,
  `serie` varchar(80) DEFAULT NULL,
  `tamanho_nominal` varchar(80) DEFAULT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  `codigo_barras_cx` varchar(80) DEFAULT NULL,
  `superficie_pt_br` varchar(80) DEFAULT NULL,
  `superficie_us` varchar(80) DEFAULT NULL,
  `superficie_es` varchar(80) DEFAULT NULL,
  `junta_assentamento` varchar(80) DEFAULT NULL,
  `abrasao_superficial` varchar(80) DEFAULT NULL,
  `variacao_tonalidade` varchar(20) DEFAULT NULL,
  `unidade_medida` varchar(20) DEFAULT NULL,
  `pecas_caixa` int DEFAULT NULL,
  `m2_caixa` decimal(10,2) DEFAULT NULL,
  `peso_caixa` decimal(10,2) DEFAULT NULL,
  `coeficiente_atrito` varchar(80) DEFAULT NULL,
  `espessura` decimal(10,2) DEFAULT NULL,
  `grupo_absorcao` varchar(80) DEFAULT NULL,
  `item_ativo` tinyint(1) DEFAULT NULL,
  `cor_pt_br` varchar(80) DEFAULT NULL,
  `cor_us` varchar(80) DEFAULT NULL,
  `cor_es` varchar(80) DEFAULT NULL,
  `recomendado_uso` varchar(80) DEFAULT NULL,
  `local_uso` varchar(80) DEFAULT NULL,
  `retificado` tinyint(1) DEFAULT NULL,
  `polo` varchar(20) DEFAULT NULL,
  `lancamento` tinyint(1) DEFAULT NULL,
  `estilo` varchar(80) DEFAULT NULL,
  `estilo_us` varchar(80) DEFAULT NULL,
  `estilo_es` varchar(80) DEFAULT NULL,
  `relevo` tinyint(1) DEFAULT NULL,
  `rodape` tinyint(1) DEFAULT NULL,
  `numeros_face` tinyint(1) DEFAULT NULL,
  `tamanho_fabricacao` varchar(50) DEFAULT NULL,
  `codigo_item` varchar(80) DEFAULT NULL,
  `unidade_fabricacao` varchar(80) DEFAULT NULL,
  `monocalibre` varchar(80) DEFAULT NULL,
  `ciclo_lancamento` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tem_minimas` tinyint(1) DEFAULT '1',
  `status` tinyint(1) DEFAULT '1',
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `responsavel_carga` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `SM_sistema_imagens`
--

INSERT INTO `SM_sistema_imagens` (`id`, `item_id`, `processo_id`, `marca`, `categoria_pt_br`, `categoria_us`, `categoria_es`, `serie`, `tamanho_nominal`, `descricao`, `codigo_barras_cx`, `superficie_pt_br`, `superficie_us`, `superficie_es`, `junta_assentamento`, `abrasao_superficial`, `variacao_tonalidade`, `unidade_medida`, `pecas_caixa`, `m2_caixa`, `peso_caixa`, `coeficiente_atrito`, `espessura`, `grupo_absorcao`, `item_ativo`, `cor_pt_br`, `cor_us`, `cor_es`, `recomendado_uso`, `local_uso`, `retificado`, `polo`, `lancamento`, `estilo`, `estilo_us`, `estilo_es`, `relevo`, `rodape`, `numeros_face`, `tamanho_fabricacao`, `codigo_item`, `unidade_fabricacao`, `monocalibre`, `ciclo_lancamento`, `tem_minimas`, `status`, `data_criacao`, `responsavel_carga`) VALUES
(1, 12, 12, 'ELIZABETH', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'SANTUARIO', '60X60', 'SANTUARIO ESM ACET', '7908545821506', 'ACETINADO', 'SATIN', 'SATINADO', '1', 'ND', 'V3', 'M2', 6, 2.16, 37.48, 'II', 7.40, 'BIA', 1, 'BRANCO', 'WHITE', 'BLANCO', 'PI', 'FLC#FWI#WFA', 1, 'SC', 1, 'MARMORE', 'MARBLE', 'M', 0, 0, 4, '600X600', '8070129', 'SC5', '1', '1_26', 1, 1, '2026-06-24 16:32:27', NULL),
(2, 12, 12, 'ELIZABETH', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'SANTUARIO', '60X60', 'SANTUARIO ESM ACET', '7908545821506', 'ACETINADO', 'SATIN', 'SATINADO', '1', 'ND', 'V3', 'M2', 6, 2.16, 37.48, 'II', 7.40, 'BIA', 1, 'BRANCO', 'WHITE', 'BLANCO', 'PI', 'FLC#FWI#WFA', 1, 'SC', 1, 'MARMORE', 'MARBLE', 'M', 0, 0, 4, '600X600', '8070129', 'SC5', '1', '1_26', 1, 1, '2026-06-24 17:00:10', NULL),
(3, 12, 12, 'ELIZABETH', 'PORCELANATO GL', 'PORCELAIN TILES', 'PORCELLANATO', 'SANTUARIO', '60X60', 'SANTUARIO ESM ACET', '7908545821506', 'ACETINADO', 'SATIN', 'SATINADO', '1', 'ND', 'V3', 'M2', 6, 2.16, 37.48, 'II', 7.40, 'BIA', 1, 'BRANCO', 'WHITE', 'BLANCO', 'PI', 'FLC#FWI#WFA', 1, 'SC', 1, 'MARMORE', 'MARBLE', 'M', 0, 0, 4, '600X600', '8070129', 'SC5', '1', '1_26', 1, 1, '2026-06-24 17:00:11', NULL);

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
-- Índices de tabela `SM_sistema_imagens`
--
ALTER TABLE `SM_sistema_imagens`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `SM_cadastros_itens_minimas`
--
ALTER TABLE `SM_cadastros_itens_minimas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de tabela `SM_evidencias_inteligenciaMercado`
--
ALTER TABLE `SM_evidencias_inteligenciaMercado`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `SM_item_imagens`
--
ALTER TABLE `SM_item_imagens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `SM_itens_movimentacoes`
--
ALTER TABLE `SM_itens_movimentacoes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT de tabela `SM_itens_processos`
--
ALTER TABLE `SM_itens_processos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de tabela `SM_pacotes_envio`
--
ALTER TABLE `SM_pacotes_envio`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `SM_pacote_itens`
--
ALTER TABLE `SM_pacote_itens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `SM_processo_amostra`
--
ALTER TABLE `SM_processo_amostra`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `SM_processo_comunicacao`
--
ALTER TABLE `SM_processo_comunicacao`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `SM_processo_detec`
--
ALTER TABLE `SM_processo_detec`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `SM_processo_inteligenciaMercado`
--
ALTER TABLE `SM_processo_inteligenciaMercado`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `SM_sistema_imagens`
--
ALTER TABLE `SM_sistema_imagens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
