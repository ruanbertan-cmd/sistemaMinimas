-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Tempo de geração: 06/05/2026 às 21:35
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
(11, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'TAMANDAI', '90X90', 'MUNARI BRANCO AC', '80820020552', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.310, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8070240', 'SC2', 1, '1/26', '2026-03-03 01:07:20', '2026-02-25 02:42:34'),
(13, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'MUNARI', '90X90', 'ATINS OFF WHITE AC', '7,89129E+12', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.320, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8070124', 'SC2', 1, 'jan/26', '2026-05-06 16:47:56', 'usuario Cadastrante'),
(14, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'MUNARI', '120X120', 'ATINS OFF WHITE AC', '7,89129E+12', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.320, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8070122', 'SC2', 1, 'jan/26', '2026-05-06 16:47:56', 'usuario Cadastrante'),
(15, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'MUNARI', '120X120', 'ATINS FENDI AC', '7,89129E+12', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.320, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8070123', 'SC2', 1, 'jan/26', '2026-05-06 16:47:56', 'usuario Cadastrante'),
(16, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'MUNARI', '90X90', 'ATINS FENDI AC', '7,89129E+12', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.320, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8070127', 'SC2', 1, 'jan/26', '2026-05-06 16:47:56', 'usuario Cadastrante'),
(17, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'MUNARI', '90X90', 'MUBE CONCRETO AC', '7,89129E+12', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.320, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8070128', 'SC2', 1, 'jan/26', '2026-05-06 16:47:56', 'usuario Cadastrante'),
(18, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'MUNARI', '7X26', 'MUNARI BRANCO AC', '7,89129E+12', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.320, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8070130', 'SC2', 1, 'jan/26', '2026-05-06 16:47:56', 'usuario Cadastrante'),
(20, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'MUNARI', '90X90', 'ATINS OFF WHITE AC', '7,89E+12', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.320, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8069120', 'SC2', 1, 'jan/26', '2026-05-06 17:52:27', 'usuario Cadastrante'),
(21, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'MUNARI', '120X120', 'ATINS OFF WHITE AC', '7,89E+12', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.320, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8069122', 'SC2', 1, 'jan/26', '2026-05-06 17:52:27', 'usuario Cadastrante'),
(22, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'MUNARI', '120X120', 'ATINS FENDI AC', '7,89E+12', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.320, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8069124', 'SC2', 1, 'jan/26', '2026-05-06 17:52:27', 'usuario Cadastrante'),
(23, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'MUNARI', '90X90', 'ATINS FENDI AC', '7,89E+12', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.320, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8069126', 'SC2', 1, 'jan/26', '2026-05-06 17:52:27', 'usuario Cadastrante'),
(24, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'MUNARI', '90X90', 'MUBE CONCRETO AC', '7,89E+12', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.320, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8069128', 'SC2', 1, 'jan/26', '2026-05-06 17:52:27', 'usuario Cadastrante'),
(25, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'MUNARI', '7X26', 'MUNARI BRANCO AC', '7,89E+12', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.320, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8069130', 'SC2', 1, 'jan/26', '2026-05-06 17:52:27', 'usuario Cadastrante'),
(26, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'MUNARI', '90X90', 'ATINS OFF WHITE AC', '7,89E+12', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.320, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8068120', 'SC2', 1, 'jan/26', '2026-05-06 17:59:16', 'usuario Cadastrante'),
(27, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'MUNARI', '120X120', 'ATINS OFF WHITE AC', '7,89E+12', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.320, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8068122', 'SC2', 1, 'jan/26', '2026-05-06 17:59:16', 'usuario Cadastrante'),
(28, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'MUNARI', '120X120', 'ATINS FENDI AC', '7,89E+12', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.320, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8068124', 'SC2', 1, 'jan/26', '2026-05-06 17:59:16', 'usuario Cadastrante'),
(29, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'MUNARI', '90X90', 'ATINS FENDI AC', '7,89E+12', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.320, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8068126', 'SC2', 1, 'jan/26', '2026-05-06 17:59:16', 'usuario Cadastrante'),
(30, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'MUNARI', '90X90', 'MUBE CONCRETO AC', '7,89E+12', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.320, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8068128', 'SC2', 1, 'jan/26', '2026-05-06 17:59:16', 'usuario Cadastrante'),
(31, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'MUNARI', '7X26', 'MUNARI BRANCO AC', '7,89E+12', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.320, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8068130', 'SC2', 1, 'jan/26', '2026-05-06 17:59:16', 'usuario Cadastrante'),
(32, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'MUNARI', '90X90', 'ATINS OFF WHITE AC', '7,89E+12', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.320, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8067120', 'SC2', 1, 'jan/26', '2026-05-06 18:13:44', 'usuario Cadastrante'),
(33, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'MUNARI', '120X120', 'ATINS OFF WHITE AC', '7,89E+12', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.320, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8067122', 'SC2', 1, 'jan/26', '2026-05-06 18:13:44', 'usuario Cadastrante'),
(34, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'MUNARI', '120X120', 'ATINS FENDI AC', '7,89E+12', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.320, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8067124', 'SC2', 1, 'jan/26', '2026-05-06 18:13:44', 'usuario Cadastrante'),
(35, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'MUNARI', '90X90', 'ATINS FENDI AC', '7,89E+12', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.320, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8067126', 'SC2', 1, 'jan/26', '2026-05-06 18:13:44', 'usuario Cadastrante'),
(36, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'MUNARI', '90X90', 'MUBE CONCRETO AC', '7,89E+12', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.320, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8067128', 'SC2', 1, 'jan/26', '2026-05-06 18:13:44', 'usuario Cadastrante'),
(37, 'ELIANE', 'PORCELANATO', 'PORCELANATO', 'PORCELANATO', 'MUNARI', '7X26', 'MUNARI BRANCO AC', '7,89E+12', 'ACETINADO', 'ACETINADO', 'ACETINADO', 1, 2, 'V2', 'm2', 2, 2.120, 12.320, 'I', 10.000, 'BIII', 1, 'BRANCO', 'WHITE', 'WHITE', 'PI', 'WWS#QWR', 1, 'SC', 1, 'CIMENTO', 'CIMENTO', 'CIMENTO', 1, 0, 10, '900X900', '8067130', 'SC2', 1, 'jan/26', '2026-05-06 18:13:44', 'usuario Cadastrante');

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
(8, 9, 'sistema', '', 'processo_iniciado', 'upload_csv', NULL, '2026-03-03 01:07:20'),
(9, 7, 'comunicacao', 'detec', 'liberacao_etapa', 'usuarioSistema', 'Peças serão enviadas todas para o Arlei Fotogrado', '2026-03-18 20:25:54'),
(10, 5, 'comunicacao', 'detec', 'liberacao_etapa', 'usuarioSistema', '', '2026-03-19 19:33:49'),
(11, 4, 'comunicacao', 'detec', 'liberacao_etapa', 'usuarioSistema', '', '2026-03-21 15:35:55'),
(12, 6, 'comunicacao', 'detec', 'liberacao_etapa', 'usuarioSistema', '', '2026-03-21 15:57:55'),
(13, 9, 'detec', 'amostra', 'liberacao_etapa', 'usuarioSistema', '', '2026-04-21 23:40:39'),
(14, 8, 'detec', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', 'Ok, peças separadas e identificadas', '2026-04-23 00:07:33'),
(15, 7, 'detec', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', 'Ok, peças separadas e identificadas', '2026-04-25 00:49:59'),
(16, 5, 'detec', 'amostra', 'liberacao_etapa', 'usuarioSistema', 'Peças podem ser separadas pelo estoque do Depto. Amostra', '2026-04-25 01:09:44'),
(17, 3, 'comunicacao', 'detec', 'liberacao_etapa', 'usuarioSistema', 'Precisamos dar prioridade', '2026-04-25 15:44:32'),
(18, 6, 'detec', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', 'Ok, peças separadas', '2026-04-25 21:31:11'),
(19, 3, 'detec', 'amostra', 'liberacao_etapa', 'usuarioSistema', 'Retirar peçcas do estoque', '2026-04-25 21:31:37'),
(20, 9, 'amostra', 'inteligencia_mercado', 'liberacao_etapa', 'usuarioSistema', 'Seguir com conferencia', '2026-04-27 10:50:08'),
(21, 9, 'inteligencia_mercado', 'amostra', 'retrocesso_etapa', 'usuarioSistema', 'Voltando etapa por revisão', '2026-05-02 00:11:28'),
(22, 8, 'inteligencia_mercado', 'amostra', 'retrocesso_etapa', 'usuarioSistema', 'Voltando etapa por revisão', '2026-05-02 00:11:46'),
(23, 8, 'amostra', 'detec', 'retrocesso_etapa', 'usuarioSistema', 'Voltando etapa por revisão', '2026-05-02 00:11:49'),
(24, 7, 'inteligencia_mercado', 'amostra', 'retrocesso_etapa', 'usuarioSistema', 'Voltando etapa por revisão', '2026-05-03 00:53:58'),
(25, 7, 'amostra', 'detec', 'retrocesso_etapa', 'usuarioSistema', 'Voltando etapa por revisão', '2026-05-03 00:54:06'),
(26, 6, 'inteligencia_mercado', 'fotografia', 'liberacao_etapa', 'usuarioSistema', '', '2026-05-06 00:55:42'),
(27, 10, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-05-06 16:47:56'),
(28, 11, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-05-06 16:47:56'),
(29, 12, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-05-06 16:47:56'),
(30, 13, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-05-06 16:47:56'),
(31, 14, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-05-06 16:47:56'),
(32, 15, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', '2026-05-06 16:47:56'),
(33, 16, 'sistema', 'inteligencia_mercado', 'processo_iniciado', 'usuario', '', '2026-05-06 17:52:27'),
(34, 17, 'sistema', 'inteligencia_mercado', 'processo_iniciado', 'usuario', '', '2026-05-06 17:52:27'),
(35, 18, 'sistema', 'inteligencia_mercado', 'processo_iniciado', 'usuario', '', '2026-05-06 17:52:27'),
(36, 19, 'sistema', 'inteligencia_mercado', 'processo_iniciado', 'usuario', '', '2026-05-06 17:52:27'),
(37, 20, 'sistema', 'inteligencia_mercado', 'processo_iniciado', 'usuario', '', '2026-05-06 17:52:27'),
(38, 21, 'sistema', 'inteligencia_mercado', 'processo_iniciado', 'usuario', '', '2026-05-06 17:52:27'),
(39, 22, 'sistema', 'inteligencia_mercado', 'processo_iniciado', 'usuario', 'cadastro inicial do item via CSV', '2026-05-06 17:59:16'),
(40, 23, 'sistema', 'inteligencia_mercado', 'processo_iniciado', 'usuario', 'cadastro inicial do item via CSV', '2026-05-06 17:59:16'),
(41, 24, 'sistema', 'inteligencia_mercado', 'processo_iniciado', 'usuario', 'cadastro inicial do item via CSV', '2026-05-06 17:59:16'),
(42, 25, 'sistema', 'inteligencia_mercado', 'processo_iniciado', 'usuario', 'cadastro inicial do item via CSV', '2026-05-06 17:59:16'),
(43, 26, 'sistema', 'inteligencia_mercado', 'processo_iniciado', 'usuario', 'cadastro inicial do item via CSV', '2026-05-06 17:59:16'),
(44, 27, 'sistema', 'inteligencia_mercado', 'processo_iniciado', 'usuario', 'cadastro inicial do item via CSV', '2026-05-06 17:59:16'),
(45, 28, 'comunicacao', 'inteligencia_mercado', 'processo_iniciado', 'usuario', 'cadastro inicial do item via CSV', '2026-05-06 18:13:44'),
(46, 29, 'comunicacao', 'inteligencia_mercado', 'processo_iniciado', 'usuario', 'cadastro inicial do item via CSV', '2026-05-06 18:13:44'),
(47, 30, 'comunicacao', 'inteligencia_mercado', 'processo_iniciado', 'usuario', 'cadastro inicial do item via CSV', '2026-05-06 18:13:44'),
(48, 31, 'comunicacao', 'inteligencia_mercado', 'processo_iniciado', 'usuario', 'cadastro inicial do item via CSV', '2026-05-06 18:13:44'),
(49, 32, 'comunicacao', 'inteligencia_mercado', 'processo_iniciado', 'usuario', 'cadastro inicial do item via CSV', '2026-05-06 18:13:44'),
(50, 33, 'comunicacao', 'inteligencia_mercado', 'processo_iniciado', 'usuario', 'cadastro inicial do item via CSV', '2026-05-06 18:13:44');

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
(3, 5, 'amostra', 'em_andamento', '2026-03-03 01:07:20', NULL),
(4, 6, 'detec', 'em_andamento', '2026-03-03 01:07:20', NULL),
(5, 7, 'amostra', 'em_andamento', '2026-03-03 01:07:20', NULL),
(6, 8, 'fotografia', 'em_andamento', '2026-03-03 01:07:20', NULL),
(7, 9, 'detec', 'em_andamento', '2026-03-03 01:07:20', NULL),
(8, 10, 'detec', 'em_andamento', '2026-03-03 01:07:20', NULL),
(9, 11, 'amostra', 'em_andamento', '2026-03-03 01:07:20', NULL),
(10, 13, 'comunicacao', 'em_andamento', '2026-05-06 16:47:56', NULL),
(11, 14, 'comunicacao', 'em_andamento', '2026-05-06 16:47:56', NULL),
(12, 15, 'comunicacao', 'em_andamento', '2026-05-06 16:47:56', NULL),
(13, 16, 'comunicacao', 'em_andamento', '2026-05-06 16:47:56', NULL),
(14, 17, 'comunicacao', 'em_andamento', '2026-05-06 16:47:56', NULL),
(15, 18, 'comunicacao', 'em_andamento', '2026-05-06 16:47:56', NULL),
(16, 20, 'comunicacao', 'em_andamento', '2026-05-06 17:52:27', NULL),
(17, 21, 'comunicacao', 'em_andamento', '2026-05-06 17:52:27', NULL),
(18, 22, 'comunicacao', 'em_andamento', '2026-05-06 17:52:27', NULL),
(19, 23, 'comunicacao', 'em_andamento', '2026-05-06 17:52:27', NULL),
(20, 24, 'comunicacao', 'em_andamento', '2026-05-06 17:52:27', NULL),
(21, 25, 'comunicacao', 'em_andamento', '2026-05-06 17:52:27', NULL),
(22, 26, 'comunicacao', 'em_andamento', '2026-05-06 17:59:16', NULL),
(23, 27, 'comunicacao', 'em_andamento', '2026-05-06 17:59:16', NULL),
(24, 28, 'comunicacao', 'em_andamento', '2026-05-06 17:59:16', NULL),
(25, 29, 'comunicacao', 'em_andamento', '2026-05-06 17:59:16', NULL),
(26, 30, 'comunicacao', 'em_andamento', '2026-05-06 17:59:16', NULL),
(27, 31, 'comunicacao', 'em_andamento', '2026-05-06 17:59:16', NULL),
(28, 32, 'comunicacao', 'em_andamento', '2026-05-06 18:13:44', NULL),
(29, 33, 'comunicacao', 'em_andamento', '2026-05-06 18:13:44', NULL),
(30, 34, 'comunicacao', 'em_andamento', '2026-05-06 18:13:44', NULL),
(31, 35, 'comunicacao', 'em_andamento', '2026-05-06 18:13:44', NULL),
(32, 36, 'comunicacao', 'em_andamento', '2026-05-06 18:13:44', NULL),
(33, 37, 'comunicacao', 'em_andamento', '2026-05-06 18:13:44', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `processo_amostra`
--

CREATE TABLE `processo_amostra` (
  `id` int NOT NULL,
  `processo_id` int NOT NULL,
  `metodo_amostra` varchar(100) NOT NULL,
  `observacao_amostra` text,
  `proxima_etapa` varchar(40) NOT NULL,
  `aprovado_por` varchar(50) DEFAULT NULL,
  `data_aprovacao` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `processo_amostra`
--

INSERT INTO `processo_amostra` (`id`, `processo_id`, `metodo_amostra`, `observacao_amostra`, `proxima_etapa`, `aprovado_por`, `data_aprovacao`) VALUES
(1, 9, 'separadoPecas', 'Seguir com conferencia', 'inteligencia_mercado', NULL, '2026-04-27 10:50:08');

-- --------------------------------------------------------

--
-- Estrutura para tabela `processo_comunicacao`
--

CREATE TABLE `processo_comunicacao` (
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
-- Despejando dados para a tabela `processo_comunicacao`
--

INSERT INTO `processo_comunicacao` (`id`, `processo_id`, `metodo_imagem`, `precisa_foto`, `qtd_pecas_foto`, `precisa_manipulacao`, `detalhe_manipulacao`, `qtd_pecas_manipulacao`, `precisa_video`, `qtd_pecas_video`, `observacao`, `aprovado_por`, `data_aprovacao`) VALUES
(6, 7, 'fotografadoManipulado', 1, 3, 1, 'Faces Aleatórias', 10, 1, 1, 'Peças serão enviadas todas para o Arlei Fotogrado', NULL, '2026-03-18 20:25:54'),
(7, 5, 'totalmenteFotografado', 1, 5, 0, '', 0, 0, 0, '', NULL, '2026-03-19 19:33:49'),
(8, 4, 'totalmenteManipulado', 1, 10, 1, 'Faces Aleatórias', 2, 1, 10, '', NULL, '2026-03-21 15:35:55'),
(9, 6, 'totalmenteFotografado', 1, 10, 0, 'Faces Distintas', 0, 0, 0, '', NULL, '2026-03-21 15:57:55'),
(10, 3, 'fotografadoManipulado', 1, 1, 1, 'Faces Aleatórias', 10, 1, 1, 'Precisamos dar prioridade', NULL, '2026-04-25 15:44:32');

-- --------------------------------------------------------

--
-- Estrutura para tabela `processo_detec`
--

CREATE TABLE `processo_detec` (
  `id` int NOT NULL,
  `processo_id` int NOT NULL,
  `metodo_detec` varchar(100) NOT NULL,
  `observacao_detec` text,
  `proxima_etapa` varchar(40) NOT NULL,
  `aprovado_por` varchar(50) DEFAULT NULL,
  `data_aprovacao` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `processo_detec`
--

INSERT INTO `processo_detec` (`id`, `processo_id`, `metodo_detec`, `observacao_detec`, `proxima_etapa`, `aprovado_por`, `data_aprovacao`) VALUES
(1, 9, 'separadoAmostra', '', 'amostra', NULL, '2026-04-21 23:40:39'),
(2, 8, 'separadoDetec', 'Ok, peças separadas e identificadas', 'inteligencia_mercado', NULL, '2026-04-23 00:07:33'),
(3, 7, 'separadoDetec', 'Ok, peças separadas e identificadas', 'inteligencia_mercado', NULL, '2026-04-25 00:49:59'),
(4, 5, 'separadoAmostra', 'Peças podem ser separadas pelo estoque do Depto. Amostra', 'amostra', NULL, '2026-04-25 01:09:44'),
(5, 6, 'separadoDetec', 'Ok, peças separadas', 'inteligencia_mercado', NULL, '2026-04-25 21:31:11'),
(6, 3, 'separadoAmostra', 'Retirar peçcas do estoque', 'amostra', NULL, '2026-04-25 21:31:37');

-- --------------------------------------------------------

--
-- Estrutura para tabela `processo_inteligenciaMercado`
--

CREATE TABLE `processo_inteligenciaMercado` (
  `id` int NOT NULL,
  `processo_id` int NOT NULL,
  `pecas_separadas` varchar(50) DEFAULT NULL,
  `qtd_de_acordo` varchar(50) DEFAULT NULL,
  `qualidade` varchar(100) DEFAULT NULL,
  `identificacao` varchar(100) DEFAULT NULL,
  `observacao_inteligenciaMercado` text,
  `proxima_etapa` varchar(50) DEFAULT NULL,
  `data_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `processo_inteligenciaMercado`
--

INSERT INTO `processo_inteligenciaMercado` (`id`, `processo_id`, `pecas_separadas`, `qtd_de_acordo`, `qualidade`, `identificacao`, `observacao_inteligenciaMercado`, `proxima_etapa`, `data_registro`) VALUES
(1, 6, '1', '1', '1', '1', '', 'fotografia', '2026-05-06 00:55:42');

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
-- Índices de tabela `processo_amostra`
--
ALTER TABLE `processo_amostra`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `processo_comunicacao`
--
ALTER TABLE `processo_comunicacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `processo_id` (`processo_id`);

--
-- Índices de tabela `processo_detec`
--
ALTER TABLE `processo_detec`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `processo_inteligenciaMercado`
--
ALTER TABLE `processo_inteligenciaMercado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_processo_inteligenciaMercado` (`processo_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cadastros_itens_minimas`
--
ALTER TABLE `cadastros_itens_minimas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de tabela `itens_movimentacoes`
--
ALTER TABLE `itens_movimentacoes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de tabela `itens_processos`
--
ALTER TABLE `itens_processos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `processo_amostra`
--
ALTER TABLE `processo_amostra`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `processo_comunicacao`
--
ALTER TABLE `processo_comunicacao`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `processo_detec`
--
ALTER TABLE `processo_detec`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `processo_inteligenciaMercado`
--
ALTER TABLE `processo_inteligenciaMercado`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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

--
-- Restrições para tabelas `processo_inteligenciaMercado`
--
ALTER TABLE `processo_inteligenciaMercado`
  ADD CONSTRAINT `fk_processo_inteligenciaMercado` FOREIGN KEY (`processo_id`) REFERENCES `itens_processos` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
