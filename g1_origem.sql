-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2020 at 02:31 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `g1_origem`
--

-- --------------------------------------------------------

--
-- Table structure for table `alerta`
--

CREATE TABLE `alerta` (
  `id` int(15) NOT NULL,
  `HorarioMedicao` timestamp NOT NULL DEFAULT current_timestamp(),
  `TipoSensor` varchar(15) NOT NULL,
  `ValorMedicao` decimal(8,2) NOT NULL,
  `Limite` decimal(8,2) DEFAULT NULL,
  `Descricao` varchar(200) DEFAULT NULL,
  `Extra` varchar(200) DEFAULT NULL,
  `Controlo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_alerta`
--

CREATE TABLE `log_alerta` (
  `id` int(15) NOT NULL,
  `HorarioMedicao` timestamp NOT NULL DEFAULT current_timestamp(),
  `TipoSensor` varchar(15) NOT NULL,
  `ValorMedicao` decimal(8,2) NOT NULL,
  `Limite` decimal(8,2) DEFAULT NULL,
  `Descricao` varchar(200) DEFAULT NULL,
  `Extra` varchar(200) DEFAULT NULL,
  `Controlo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_medicao_humidade`
--

CREATE TABLE `log_medicao_humidade` (
  `id` int(15) NOT NULL,
  `HorarioMedicao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ValorHumidade` decimal(4,2) NOT NULL,
  `Migrate` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_medicao_luminosidade`
--

CREATE TABLE `log_medicao_luminosidade` (
  `id` int(15) NOT NULL,
  `HorarioMedicao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ValorLuminosidade` decimal(4,2) NOT NULL,
  `Migrate` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_medicao_movimento`
--

CREATE TABLE `log_medicao_movimento` (
  `id` int(15) NOT NULL,
  `HorarioMedicao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ValorMovimento` decimal(4,2) NOT NULL,
  `Migrate` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_medicao_temperatura`
--

CREATE TABLE `log_medicao_temperatura` (
  `id` int(15) NOT NULL,
  `HorarioMedicao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ValorTemperatura` decimal(4,2) NOT NULL,
  `Migrate` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `log_ronda`
--

-- --------------------------------------------------------

CREATE TABLE `log_ronda` (
  `id` int(15) NOT NULL,
  `utilizador` varchar(45) NOT NULL,
  `operacao` varchar(5) NOT NULL,
  `data_operacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idUtilizador_atual` int(11) NOT NULL,
  `idUtilizador_ant` int(11) DEFAULT NULL,
  `dia_semana_atual` varchar(20) NOT NULL,
  `dia_semana_ant` varchar(20) DEFAULT NULL,
  `hora_ronda_atual` time NOT NULL,
  `hora_ronda_ant` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `log_ronda_extra`
--

CREATE TABLE `log_ronda_extra` (
  `id` int(15) NOT NULL,
  `utilizador` varchar(45) NOT NULL,
  `operacao` varchar(5) NOT NULL,
  `data_operacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idUtilizador_atual` int(11) NOT NULL,
  `idUtilizador_ant` int(11) DEFAULT NULL,
  `dia_semana_atual` varchar(20) NOT NULL,
  `dia_semana_ant` varchar(20) DEFAULT NULL,
  `hora_ronda_atual` time NOT NULL,
  `hora_ronda_ant` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `log_sistema`
--

CREATE TABLE `log_sistema` (
  `id` int(15) NOT NULL,
  `utilizador` varchar(45) NOT NULL,
  `operacao` varchar(5) NOT NULL,
  `data_operacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `lim_humi_atual` decimal(6,2) NOT NULL,
  `lim_humi_ant` decimal(6,2) DEFAULT NULL,
  `lim_temp_atual` decimal(6,2) NOT NULL,
  `lim_temp_ant` decimal(6,2) DEFAULT NULL,
  `lim_lumi_atual` decimal(6,2) NOT NULL,
  `lim_lumi_ant` decimal(6,2) DEFAULT NULL,
  `lim_mov_atual` tinyint(4) NOT NULL,
  `lim_movi_ant` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `log_utilizador`
--

CREATE TABLE `log_utilizador` (
  `id` int(15) NOT NULL,
  `utilizador` varchar(45) NOT NULL,
  `operacao` varchar(5) NOT NULL,
  `data_operacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `nome_atual` varchar(100) NOT NULL,
  `nome_ant` varchar(100) DEFAULT NULL,
  `email_atual` varchar(255) NOT NULL,
  `email_ant` varchar(255) DEFAULT NULL,
  `password_atual` varchar(32) NOT NULL,
  `password_ant` varchar(32) DEFAULT NULL,
  `tipo_atual` varchar(3) NOT NULL,
  `tipo_ant` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `medicaohumidade`
--

CREATE TABLE `medicaohumidade` (
  `id` int(15) NOT NULL,
  `HorarioMedicao` timestamp NOT NULL DEFAULT current_timestamp(),
  `ValorHumidade` decimal(4,2) NOT NULL,
  `Migrate` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `medicaoluminosidade`
--

CREATE TABLE `medicaoluminosidade` (
  `id` int(15) NOT NULL,
  `HorarioMedicao` timestamp NOT NULL DEFAULT current_timestamp(),
  `ValorLuminosidade` decimal(4,2) NOT NULL,
  `Migrate` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `medicaomovimento`
--

CREATE TABLE `medicaomovimento` (
  `id` int(15) NOT NULL,
  `HorarioMedicao` timestamp NOT NULL DEFAULT current_timestamp(),
  `ValorMovimento` int(1) NOT NULL,
  `Migrate` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `medicaotemperatura`
--

CREATE TABLE `medicaotemperatura` (
  `id` int(15) NOT NULL,
  `HorarioMedicao` timestamp NOT NULL DEFAULT current_timestamp(),
  `ValorTemperatura` decimal(4,2) NOT NULL,
  `Migrate` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ronda`
--

CREATE TABLE `ronda` (
  `idUtilizador` int(11) NOT NULL,
  `diaSemana` varchar(20) NOT NULL,
  `horaRonda` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rondaextra`
--

CREATE TABLE `rondaextra` (
  `idUtilizador` int(11) NOT NULL,
  `diaSemana` varchar(20) NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sistema`
--

CREATE TABLE `sistema` (
  `limHumidade` decimal(6,2) NOT NULL,
  `limTemperatura` decimal(6,2) NOT NULL,
  `limLuminosidade` decimal(6,2) NOT NULL,
  `limMovimentacao` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sistema`
--

INSERT INTO `sistema` (`limHumidade`, `limTemperatura`, `limLuminosidade`, `limMovimentacao`) VALUES
('70.00', '38.00', '25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `utilizador`
--

CREATE TABLE `utilizador` (
  `idUtilizador` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  `tipo` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alerta`
--
ALTER TABLE `alerta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_alerta`
--
ALTER TABLE `log_alerta`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `log_medicao_humidade`
--
ALTER TABLE `log_medicao_humidade`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `log_medicao_luminosidade`
--
ALTER TABLE `log_medicao_luminosidade`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `log_medicao_movimento`
--
ALTER TABLE `log_medicao_movimento`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `log_medicao_temperatura`
--
ALTER TABLE `log_medicao_temperatura`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_ronda`
--
ALTER TABLE `log_ronda`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_ronda_extra`
--
ALTER TABLE `log_ronda_extra`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_sistema`
--
ALTER TABLE `log_sistema`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_utilizador`
--
ALTER TABLE `log_utilizador`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicaohumidade`
--
ALTER TABLE `medicaohumidade`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicaoluminosidade`
--
ALTER TABLE `medicaoluminosidade`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicaomovimento`
--
ALTER TABLE `medicaomovimento`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicaotemperatura`
--
ALTER TABLE `medicaotemperatura`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ronda`
--
ALTER TABLE `ronda`
  ADD KEY `fk_idUtilizador_ronda` (`idUtilizador`);

--
-- Indexes for table `rondaextra`
--
ALTER TABLE `rondaextra`
  ADD KEY `fk_idUtilizador_rondaExtra` (`idUtilizador`) USING BTREE;

--
-- Indexes for table `utilizador`
--
ALTER TABLE `utilizador`
  ADD PRIMARY KEY (`idUtilizador`);
ALTER TABLE `utilizador` ADD FULLTEXT KEY `tipo` (`tipo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `utilizador`
--
ALTER TABLE `utilizador`
  MODIFY `idUtilizador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=994713707;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ronda`
--
ALTER TABLE `ronda`
  ADD CONSTRAINT `fk_idUtilizador_ronda` FOREIGN KEY (`idUtilizador`) REFERENCES `utilizador` (`idUtilizador`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rondaextra`
--
ALTER TABLE `rondaextra`
  ADD CONSTRAINT `fk_idUtilizador` FOREIGN KEY (`idUtilizador`) REFERENCES `utilizador` (`idUtilizador`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
