-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13-Maio-2021 às 03:37
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `financeiro`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `bancarias`
--

CREATE TABLE `bancarias` (
  `id` int(11) NOT NULL,
  `banco` varchar(25) NOT NULL,
  `agencia` varchar(20) NOT NULL,
  `conta` varchar(20) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `pessoa` varchar(15) NOT NULL,
  `doc` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `bancarias`
--

INSERT INTO `bancarias` (`id`, `banco`, `agencia`, `conta`, `tipo`, `pessoa`, `doc`) VALUES
(1, 'Banco do Brasil', '0125-7', '55889-7', 'Corrente', 'Física', '255.455.555-55'),
(2, 'Nubank', '0125-8', '55819-1', 'Corrente', 'Jurídica', '25.485.555/5555-55'),
(5, 'Santander', '1558-9', '44255-5', 'Corrente', 'Física', '125.555.555-55');

-- --------------------------------------------------------

--
-- Estrutura da tabela `bancos`
--

CREATE TABLE `bancos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `bancos`
--

INSERT INTO `bancos` (`id`, `nome`) VALUES
(1, 'Bradesco'),
(2, 'Itaú'),
(3, 'Banco do Brasil'),
(4, 'Santander'),
(5, 'Caixa Econômica'),
(6, 'Nubank');

-- --------------------------------------------------------

--
-- Estrutura da tabela `caixa`
--

CREATE TABLE `caixa` (
  `id` int(11) NOT NULL,
  `data_ab` date NOT NULL,
  `valor_ab` decimal(8,2) DEFAULT NULL,
  `usuario_ab` int(11) NOT NULL,
  `data_fec` date DEFAULT NULL,
  `usuario_fec` int(11) NOT NULL,
  `saldo` decimal(8,2) DEFAULT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `caixa`
--

INSERT INTO `caixa` (`id`, `data_ab`, `valor_ab`, `usuario_ab`, `data_fec`, `usuario_fec`, `saldo`, `status`) VALUES
(7, '2021-04-20', '600.00', 1, NULL, 0, NULL, 'Aberto');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cat_despesas`
--

CREATE TABLE `cat_despesas` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cat_despesas`
--

INSERT INTO `cat_despesas` (`id`, `nome`) VALUES
(2, 'Empresa'),
(3, 'Residência'),
(6, 'Despesa Pessoal');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cat_produtos`
--

CREATE TABLE `cat_produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cat_produtos`
--

INSERT INTO `cat_produtos` (`id`, `nome`) VALUES
(1, 'Sapatos'),
(2, 'Bermudas'),
(3, 'Calças'),
(4, 'Sungas'),
(7, 'Biquines'),
(8, 'Camisas'),
(9, 'Camisetas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `pessoa` varchar(15) NOT NULL,
  `doc` varchar(20) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `ativo` varchar(5) NOT NULL,
  `obs` varchar(100) DEFAULT NULL,
  `data` date NOT NULL,
  `banco` varchar(40) DEFAULT NULL,
  `agencia` varchar(10) DEFAULT NULL,
  `conta` varchar(25) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `pessoa`, `doc`, `telefone`, `endereco`, `ativo`, `obs`, `data`, `banco`, `agencia`, `conta`, `email`) VALUES
(1, 'Diversos', 'Física', '000.000.000-50', '', NULL, 'Sim', NULL, '2021-05-10', NULL, NULL, NULL, 'cliente@cliente.com'),
(2, 'Marcos Freitas', 'Física', '485.555.555-55', '(59) 22522-2222', 'Rua C', 'Não', '', '2021-04-13', '', '', '', 'marcos@hotmail.com'),
(3, 'Empresa A', 'Jurídica', '44.455.555/5555-52', '(55) 88888-8888', 'Rua D', 'Sim', 'Nenhuma', '2021-04-13', 'Nubank', '0125-7', '55889-7', 'empresax@hotmail.com'),
(5, 'Marina Silva', 'Física', '454.885.555-57', '(58) 65555-5555', 'Rua C', 'Sim', 'Rua C', '2021-04-19', '', '', '', 'marina@hotmail.com'),
(6, 'Karolina Souza', 'Física', '648.525.555-55', '(54) 55555-55', 'Rua D', 'Sim', '', '2021-04-19', '', '', '', 'karol@hotmail.com'),
(7, 'Empresa BC', 'Jurídica', '55.415.555/5555-75', '(84) 55555-5555', 'Rua D', 'Sim', '', '2021-04-19', '', '', '', 'empresabc@hotmail.com'),
(8, 'Marlone Silva', 'Física', '548.555.444-55', '(64) 55555-5555', 'Rua D', 'Sim', '', '2021-04-19', '', '', '', 'marlone'),
(9, 'Paula Campos', 'Física', '458.555.555-55', '(45) 55555-5555', 'Rua A', 'Sim', 'Nenhuma', '2021-04-13', 'Banco do Brasil', '', '', 'paula@hotmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `usuario` int(11) NOT NULL,
  `pagamento` varchar(50) NOT NULL,
  `lancamento` varchar(50) NOT NULL,
  `data_lanc` date NOT NULL,
  `data_pgto` date NOT NULL,
  `parcelas` int(11) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `compras`
--

INSERT INTO `compras` (`id`, `valor`, `usuario`, `pagamento`, `lancamento`, `data_lanc`, `data_pgto`, `parcelas`, `status`, `cliente`) VALUES
(3, '264.99', 1, 'Dinheiro', 'Caixa', '2021-05-11', '2021-05-11', 1, 'Concluída', 1),
(4, '55.00', 1, 'Dinheiro', 'Caixa', '2021-05-11', '2021-05-11', 1, 'Concluída', 6),
(6, '94.99', 1, 'Dinheiro', 'Caixa', '2021-05-11', '2021-06-11', 1, 'Concluída', 5),
(7, '55.00', 1, 'Dinheiro', 'Caixa', '2021-05-11', '2021-07-11', 2, 'Concluída', 4),
(8, '474.96', 1, 'Dinheiro', 'Caixa', '2021-05-11', '2021-07-11', 1, 'Pendente', 5),
(9, '50.00', 1, 'Dinheiro', 'Caixa', '2021-05-11', '2021-05-11', 1, 'Cancelada', 4),
(10, '180.00', 4, 'Dinheiro', 'Caixa', '2021-05-11', '2021-05-11', 1, 'Concluída', 6),
(11, '55.00', 4, 'Dinheiro', 'Caixa', '2021-05-11', '2021-05-11', 1, 'Concluída', 6),
(12, '139.99', 4, 'Dinheiro', 'Caixa', '2021-05-11', '2021-05-11', 1, 'Concluída', 6),
(13, '60.00', 4, 'Dinheiro', 'Caixa', '2021-05-11', '2021-05-11', 1, 'Concluída', 6),
(14, '100.00', 4, 'Dinheiro', 'Caixa', '2021-05-12', '2021-06-12', 1, 'Concluída', 1),
(15, '55.00', 4, 'Dinheiro', 'Caixa', '2021-05-12', '2021-06-12', 1, 'Pendente', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `contas_despesa`
--

CREATE TABLE `contas_despesa` (
  `id` int(11) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `data` date NOT NULL,
  `usuario` int(11) NOT NULL,
  `lancamento` varchar(50) NOT NULL,
  `documento` varchar(35) DEFAULT NULL,
  `plano_conta` varchar(50) DEFAULT NULL,
  `fornecedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `contas_despesa`
--

INSERT INTO `contas_despesa` (`id`, `descricao`, `valor`, `data`, `usuario`, `lancamento`, `documento`, `plano_conta`, `fornecedor`) VALUES
(11, 'Paula Marta', '700.00', '2021-04-22', 1, 'Caixa', 'Dinheiro', 'Aluguel - Despesa Pessoal', 2),
(12, 'Matheus Silva', '50.00', '2021-04-22', 1, 'Caixa', 'Boleto', 'Aluguel - Despesa Pessoal', 3),
(13, 'Teste', '49.00', '2021-04-26', 1, 'Caixa', 'Boleto', 'Aluguel - Despesa Pessoal', 3),
(14, 'Paula Marta', '50.00', '2021-04-26', 1, 'Bradesco', 'Boleto', 'Aluguel - Despesa Pessoal', 2),
(15, 'Kamila Silva', '200.00', '2021-04-26', 1, 'Caixa Econômica', 'Boleto', 'Aluguel - Despesa Pessoal', 1),
(16, 'aaddfa', '190.00', '2021-04-26', 1, 'Itaú', 'Boleto', 'Aluguel - Despesa Pessoal', 1),
(17, 'Paula Marta', '45.00', '2021-04-26', 1, 'Nubank', 'Boleto', 'Aluguel - Despesa Pessoal', 2),
(18, 'Despesa Tesete', '289.00', '2021-04-26', 1, 'Caixa', 'Dinheiro', 'Aluguel - Despesa Pessoal', 1),
(19, 'Teste', '300.00', '2021-04-26', 1, 'Santander', 'Boleto', 'Aluguel - Despesa Pessoal', 2),
(20, 'Netflix', '35.00', '2021-04-26', 1, 'Santander', 'Boleto', 'Aluguel - Despesa Pessoal', 2),
(21, 'Matheus Silva', '50.00', '2021-04-26', 4, 'Caixa', 'Boleto', 'Aluguel - Despesa Pessoal', 3),
(22, 'asasdf', '50.00', '2021-04-26', 4, 'Banco do Brasil', 'Boleto', 'Aluguel - Despesa Pessoal', 3),
(23, 'asas', '50.00', '2021-04-26', 4, 'Banco do Brasil', 'Boleto', 'Aluguel - Despesa Pessoal', 2),
(24, 'asdsfa', '40.00', '2021-04-26', 4, 'Banco do Brasil', 'Boleto', 'Aluguel - Despesa Pessoal', 1),
(25, 'Matheus Silva', '600.00', '2021-04-26', 4, 'Caixa', 'Boleto', 'Aluguel - Despesa Pessoal', 3),
(26, 'Matheus Silva', '60.00', '2021-04-26', 4, 'Caixa', 'Boleto', 'Aluguel - Despesa Pessoal', 3),
(27, 'fadfas', '60.00', '2021-04-26', 4, 'Caixa', 'Boleto', 'Aluguel - Despesa Pessoal', 2),
(28, 'Matheus Silva', '500.00', '2021-04-27', 1, 'Banco do Brasil', 'Boleto', 'Aluguel - Despesa Pessoal', 3),
(29, 'Fármacia', '250.00', '2021-04-27', 1, 'Caixa', 'Dinheiro', 'Compras - Despesa Pessoal', 4),
(30, 'Fármacia', '30.00', '2021-04-27', 1, 'Caixa', 'Boleto', 'Aluguel - Despesa Pessoal', 4),
(31, 'Paula Marta', '50.00', '2021-04-27', 1, 'Caixa', 'Boleto', 'Aluguel - Despesa Pessoal', 2),
(32, 'Fármacia', '50.00', '2021-04-27', 1, 'Caixa', 'Boleto', 'Aluguel - Despesa Pessoal', 4),
(33, 'Teste', '45.00', '2021-05-12', 4, 'Caixa', 'Boleto', 'Aluguel - Despesa Pessoal', 0),
(34, 'Kamila Silva', '60.00', '2021-05-12', 1, 'Caixa', 'Transferência', 'Água - Residência', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `contas_pagar`
--

CREATE TABLE `contas_pagar` (
  `id` int(11) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `cliente` int(11) DEFAULT NULL,
  `saida` varchar(50) DEFAULT NULL,
  `documento` varchar(50) DEFAULT NULL,
  `plano_conta` varchar(50) NOT NULL,
  `data_emissao` date NOT NULL,
  `vencimento` date NOT NULL,
  `frequencia` varchar(50) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `usuario_lanc` int(11) NOT NULL,
  `usuario_baixa` int(11) DEFAULT NULL,
  `status` varchar(30) NOT NULL,
  `data_recor` date DEFAULT NULL,
  `juros` decimal(8,2) DEFAULT NULL,
  `multa` decimal(8,2) DEFAULT NULL,
  `desconto` decimal(8,2) DEFAULT NULL,
  `subtotal` decimal(8,2) DEFAULT NULL,
  `data_baixa` date DEFAULT NULL,
  `id_compra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `contas_pagar`
--

INSERT INTO `contas_pagar` (`id`, `descricao`, `cliente`, `saida`, `documento`, `plano_conta`, `data_emissao`, `vencimento`, `frequencia`, `valor`, `usuario_lanc`, `usuario_baixa`, `status`, `data_recor`, `juros`, `multa`, `desconto`, `subtotal`, `data_baixa`, `id_compra`) VALUES
(130, 'Compra', 2, 'Caixa', 'Conta Corrente', 'Aluguel - Despesa Pessoal', '2021-04-21', '2021-04-23', 'Uma Vez', '560.00', 1, NULL, 'Pendente', '2021-04-21', NULL, NULL, NULL, NULL, NULL, 0),
(131, 'Compra', 3, 'Caixa', 'Conta Corrente', 'Aluguel - Despesa Pessoal', '2021-04-21', '2021-04-23', 'Uma Vez', '880.00', 1, NULL, 'Pendente', '2021-04-21', NULL, NULL, NULL, NULL, NULL, 0),
(133, 'Aluguel - Parcela 2', 0, 'Caixa', 'Dinheiro', 'Aluguel - Despesa Pessoal', '2021-04-21', '2021-05-21', 'Uma Vez', '225.00', 1, 1, 'Paga', '2021-04-21', '0.00', '0.00', '0.00', '225.00', '2021-04-21', 0),
(134, 'Aluguel - Parcela 3', 0, 'Caixa', 'Dinheiro', 'Aluguel - Despesa Pessoal', '2021-04-21', '2021-06-21', 'Uma Vez', '225.00', 1, NULL, 'Pendente', '2021-04-21', NULL, NULL, NULL, NULL, NULL, 0),
(135, 'Aluguel - Parcela 4', 0, 'Caixa', 'Dinheiro', 'Aluguel - Despesa Pessoal', '2021-04-21', '2021-07-21', 'Uma Vez', '225.00', 1, NULL, 'Pendente', '2021-04-21', NULL, NULL, NULL, NULL, NULL, 0),
(136, 'Pagamento', 3, 'Caixa', 'Dinheiro', 'Aluguel - Despesa Pessoal', '2021-04-21', '2021-04-19', 'Diária', '160.00', 1, NULL, 'Pendente', '0000-00-00', NULL, NULL, NULL, NULL, NULL, 0),
(139, 'Conta Diaria', 2, 'Caixa', 'Dinheiro', 'Aluguel - Despesa Pessoal', '2021-04-21', '2021-04-23', 'Diária', '350.00', 1, NULL, 'Pendente', '0000-00-00', NULL, NULL, NULL, NULL, NULL, 0),
(141, 'Conta Mensal - Parcela 1', 0, 'Caixa', 'Dinheiro', 'Aluguel - Despesa Pessoal', '2021-04-21', '2021-04-23', 'Mensal', '100.00', 1, NULL, 'Pendente', '2021-05-21', NULL, NULL, NULL, NULL, NULL, 0),
(142, 'Conta Mensal - Parcela 2', 0, 'Caixa', 'Dinheiro', 'Aluguel - Despesa Pessoal', '2021-04-21', '2021-05-23', 'Mensal', '100.00', 1, NULL, 'Pendente', '2021-05-21', NULL, NULL, NULL, NULL, NULL, 0),
(143, 'Conta Mensal - Parcela 3', 0, 'Caixa', 'Dinheiro', 'Aluguel - Despesa Pessoal', '2021-04-21', '2021-06-23', 'Mensal', '100.00', 1, NULL, 'Pendente', '2021-05-21', NULL, NULL, NULL, NULL, NULL, 0),
(144, 'Conta Mensal - Parcela 4', 0, 'Caixa', 'Dinheiro', 'Aluguel - Despesa Pessoal', '2021-04-21', '2021-07-23', 'Mensal', '80.00', 1, 1, 'Pendente', '2021-05-21', '0.00', '0.00', '0.00', '20.00', '2021-04-21', 0),
(263, 'Fornecedor - Matheus Silva', NULL, 'Caixa', 'Dinheiro', 'Compra de Produtos - Empresa', '2021-04-21', '2021-04-21', 'Uma Vez', '50.00', 1, NULL, 'Pendente', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(264, 'Fornecedor - Matheus Silva', NULL, 'Caixa', 'Dinheiro', 'Compra de Produtos - Empresa', '2021-04-21', '2021-04-21', 'Uma Vez', '100.00', 1, NULL, 'Pendente', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(265, 'Fornecedor - Matheus Silva', NULL, 'Caixa', 'Dinheiro', 'Compra de Produtos - Empresa', '2021-04-21', '2021-04-21', 'Uma Vez', '100.00', 1, NULL, 'Pendente', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(266, 'Fornecedor - Fármacia', NULL, 'Caixa', 'Dinheiro', 'Compra de Produtos - Empresa', '2021-04-21', '2021-04-21', 'Uma Vez', '100.00', 1, NULL, 'Pendente', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(267, 'Fornecedor - Fármacia', NULL, 'Caixa', 'Dinheiro', 'Compra de Produtos - Empresa', '2021-04-21', '2021-04-21', 'Uma Vez', '120.00', 1, NULL, 'Pendente', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(268, 'Fornecedor - Fármacia', NULL, 'Caixa', 'Dinheiro', 'Compra de Produtos - Empresa', '2021-04-21', '2021-04-21', 'Uma Vez', '120.00', 1, NULL, 'Pendente', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(269, 'Fornecedor - Fármacia', NULL, 'Caixa', 'Dinheiro', 'Compra de Produtos - Empresa', '2021-04-21', '2021-04-21', 'Uma Vez', '150.00', 1, NULL, 'Pendente', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(270, 'Fornecedor - Fármacia', NULL, 'Caixa', 'Dinheiro', 'Compra de Produtos - Empresa', '2021-04-21', '2021-04-21', 'Uma Vez', '150.00', 1, NULL, 'Pendente', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(271, 'Fornecedor - Fármacia', NULL, 'Caixa', 'Dinheiro', 'Compra de Produtos - Empresa', '2021-04-21', '2021-04-21', 'Uma Vez', '150.00', 1, NULL, 'Pendente', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(272, 'Fornecedor - Fármacia', NULL, 'Caixa', 'Dinheiro', 'Compra de Produtos - Empresa', '2021-04-21', '2021-04-21', 'Uma Vez', '150.00', 1, NULL, 'Pendente', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(273, 'Fornecedor - Fármacia', NULL, 'Caixa', 'Dinheiro', 'Compra de Produtos - Empresa', '2021-04-21', '2021-04-21', 'Uma Vez', '150.00', 1, NULL, 'Pendente', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(274, 'Fornecedor - Fármacia', NULL, 'Caixa', 'Dinheiro', 'Compra de Produtos - Empresa', '2021-04-21', '2021-04-21', 'Uma Vez', '150.00', 1, NULL, 'Pendente', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(275, 'Fornecedor - Fármacia', NULL, 'Caixa', 'Dinheiro', 'Compra de Produtos - Empresa', '2021-04-21', '2021-04-21', 'Uma Vez', '150.00', 1, NULL, 'Pendente', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(276, 'Fornecedor - Fármacia', NULL, 'Caixa', 'Dinheiro', 'Compra de Produtos - Empresa', '2021-04-21', '2021-04-21', 'Uma Vez', '150.00', 1, NULL, 'Pendente', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(277, 'Fornecedor - Fármacia', NULL, 'Caixa', 'Dinheiro', 'Compra de Produtos - Empresa', '2021-04-21', '2021-04-21', 'Uma Vez', '150.00', 1, NULL, 'Pendente', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(278, 'Fornecedor - Fármacia', NULL, 'Caixa', 'Dinheiro', 'Compra de Produtos - Empresa', '2021-04-21', '2021-04-21', 'Uma Vez', '150.00', 1, NULL, 'Pendente', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(279, 'Fornecedor - Fármacia', NULL, 'Caixa', 'Dinheiro', 'Compra de Produtos - Empresa', '2021-04-21', '2021-04-21', 'Uma Vez', '150.00', 1, NULL, 'Pendente', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(280, 'Fornecedor - Fármacia', NULL, 'Caixa', 'Dinheiro', 'Compra de Produtos - Empresa', '2021-04-21', '2021-04-21', 'Uma Vez', '150.00', 1, 1, 'Paga', NULL, '0.00', '0.00', '0.00', '150.00', '2021-04-26', 0),
(281, 'Fornecedor - Fármacia', NULL, 'Caixa', 'Dinheiro', 'Compra de Produtos - Empresa', '2021-04-21', '2021-04-21', 'Uma Vez', '150.00', 1, NULL, 'Pendente', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(282, 'Fornecedor - Fármacia', NULL, 'Caixa', 'Dinheiro', 'Compra de Produtos - Empresa', '2021-04-21', '2021-04-21', 'Uma Vez', '150.00', 1, NULL, 'Pendente', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(283, 'Fornecedor - Fármacia', NULL, 'Caixa', 'Dinheiro', 'Compra de Produtos - Empresa', '2021-04-21', '2021-04-21', 'Uma Vez', '5.00', 1, NULL, 'Pendente', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(284, 'Fornecedor - Fármacia', NULL, 'Caixa', 'Dinheiro', 'Compra de Produtos - Empresa', '2021-04-21', '2021-04-21', 'Uma Vez', '150.00', 1, 1, 'Paga', NULL, '0.00', '0.00', '0.00', '150.00', '2021-04-26', 0),
(285, 'Fornecedor - Fármacia', NULL, 'Caixa', 'Dinheiro', 'Compra de Produtos - Empresa', '2021-04-21', '2021-04-21', 'Uma Vez', '150.00', 1, 1, 'Paga', NULL, '0.00', '0.00', '0.00', '150.00', '2021-04-22', 0),
(298, 'Conta Diaria', 2, 'Caixa', 'Dinheiro', 'Aluguel - Despesa Pessoal', '2021-04-22', '2021-04-24', 'Diária', '350.00', 1, 1, 'Paga', '2021-04-23', '0.00', '0.00', '0.00', '350.00', '2021-04-22', 0),
(299, 'Pagamento', 3, 'Caixa', 'Dinheiro', 'Aluguel - Despesa Pessoal', '2021-04-22', '2021-04-20', 'Diária', '130.00', 1, 1, 'Paga', '0000-00-00', '0.00', '0.00', '0.00', '130.00', '2021-05-10', 0),
(300, '', 3, 'Caixa', 'Dinheiro', 'Aluguel - Despesa Pessoal', '2021-04-22', '2021-04-22', 'Uma Vez', '25.00', 1, 1, 'Paga', '2021-04-22', '0.00', '0.00', '0.00', '25.00', '2021-05-10', 0),
(301, 'Teste', 3, 'Caixa', 'Dinheiro', 'Aluguel - Despesa Pessoal', '2021-04-26', '2021-04-26', 'Uma Vez', '50.00', 4, 4, 'Paga', '2021-04-26', '0.00', '0.00', '0.00', '50.00', '2021-04-26', 0),
(302, 'Aluguel AP x', 3, 'Banco do Brasil', 'Transferência', 'Aluguel - Despesa Pessoal', '2021-04-26', '2021-04-30', 'Mensal', '950.00', 1, 1, 'Paga', '0000-00-00', '0.00', '0.00', '0.00', '950.00', '2021-04-26', 0),
(305, 'Aluguel AP XXX', 1, 'Banco do Brasil', 'Transferência', 'Aluguel - Despesa Pessoal', '2021-04-26', '2021-04-30', 'Mensal', '980.00', 1, 1, 'Paga', '0000-00-00', '0.00', '0.00', '0.00', '980.00', '2021-04-26', 0),
(306, 'Aluguel AP XXX', 1, 'Banco do Brasil', 'Transferência', 'Aluguel - Despesa Pessoal', '2021-04-26', '2021-05-30', 'Mensal', '980.00', 1, 1, 'Paga', '0000-00-00', '0.00', '0.00', '0.00', '980.00', '2021-04-26', 0),
(307, 'Aluguel AP XXX', 1, 'Banco do Brasil', 'Transferência', 'Aluguel - Despesa Pessoal', '2021-04-26', '2021-06-30', 'Mensal', '980.00', 1, NULL, 'Pendente', '2021-06-26', NULL, NULL, NULL, NULL, NULL, 0),
(308, 'Teste', 2, 'Caixa', 'Dinheiro', 'Aluguel - Despesa Pessoal', '2021-04-26', '2021-04-27', 'Diária', '80.00', 1, 1, 'Paga', '0000-00-00', '0.00', '0.00', '0.00', '80.00', '2021-04-26', 0),
(311, '', 3, 'Caixa', 'Dinheiro', 'Aluguel - Despesa Pessoal', '2021-04-26', '2021-04-27', 'Diária', '85.00', 1, 1, 'Paga', '0000-00-00', '0.00', '0.00', '0.00', '85.00', '2021-04-26', 0),
(312, '', 3, 'Caixa', 'Dinheiro', 'Aluguel - Despesa Pessoal', '2021-04-26', '2021-04-28', 'Diária', '85.00', 1, 1, 'Paga', '0000-00-00', '0.00', '0.00', '0.00', '85.00', '2021-04-26', 0),
(313, '', 3, 'Caixa', 'Dinheiro', 'Aluguel - Despesa Pessoal', '2021-04-26', '2021-04-29', 'Diária', '85.00', 1, 1, 'Paga', '0000-00-00', '0.00', '0.00', '0.00', '85.00', '2021-05-10', 0),
(314, '', 2, 'Itaú', 'Dinheiro', 'Viagem - Despesa Pessoal', '2021-04-27', '2021-04-30', 'Mensal', '200.00', 1, 1, 'Paga', '0000-00-00', '0.00', '0.00', '0.00', '200.00', '2021-04-27', 0),
(316, ' - Parcela 1', 2, 'Itaú', 'Dinheiro', 'Viagem - Despesa Pessoal', '2021-04-27', '2021-05-30', 'Mensal', '40.00', 1, 1, 'Paga', '0000-00-00', '0.00', '0.00', '0.00', '40.00', '2021-05-10', 0),
(317, ' - Parcela 2', 2, 'Itaú', 'Dinheiro', 'Viagem - Despesa Pessoal', '2021-04-27', '2021-06-30', 'Mensal', '40.00', 1, NULL, 'Pendente', '2021-04-27', NULL, NULL, NULL, NULL, NULL, 0),
(318, ' - Parcela 3', 2, 'Itaú', 'Dinheiro', 'Viagem - Despesa Pessoal', '2021-04-27', '2021-07-30', 'Mensal', '40.00', 1, 1, 'Paga', '0000-00-00', '0.00', '0.00', '0.00', '40.00', '2021-05-10', 0),
(319, ' - Parcela 4', 2, 'Itaú', 'Dinheiro', 'Viagem - Despesa Pessoal', '2021-04-27', '2021-08-30', 'Mensal', '40.00', 1, 1, 'Paga', '0000-00-00', '0.00', '0.00', '0.00', '40.00', '2021-05-10', 0),
(320, ' - Parcela 5', 2, 'Itaú', 'Dinheiro', 'Viagem - Despesa Pessoal', '2021-04-27', '2021-09-30', 'Mensal', '40.00', 1, 1, 'Paga', '0000-00-00', '0.00', '0.00', '0.00', '40.00', '2021-04-27', 0),
(321, ' - Parcela 5', 2, 'Itaú', 'Dinheiro', 'Viagem - Despesa Pessoal', '2021-04-27', '2021-10-30', 'Mensal', '40.00', 1, 1, 'Paga', '0000-00-00', '0.00', '0.00', '0.00', '40.00', '2021-05-10', 0),
(322, ' - Parcela 5', 2, 'Itaú', 'Dinheiro', 'Viagem - Despesa Pessoal', '2021-05-10', '2021-11-30', 'Mensal', '40.00', 1, 1, 'Paga', '0000-00-00', '0.00', '0.00', '0.00', '40.00', '2021-05-10', 0),
(323, ' - Parcela 5', 2, 'Itaú', 'Dinheiro', 'Viagem - Despesa Pessoal', '2021-05-10', '2021-12-30', 'Mensal', '40.00', 1, 1, 'Paga', '0000-00-00', '0.00', '0.00', '0.00', '40.00', '2021-05-10', 0),
(325, '', 3, 'Caixa', 'Dinheiro', 'Aluguel - Despesa Pessoal', '2021-05-10', '2021-04-30', 'Diária', '85.00', 1, NULL, 'Pendente', '2021-05-11', NULL, NULL, NULL, NULL, NULL, 0),
(326, ' - Parcela 4', 2, 'Itaú', 'Dinheiro', 'Viagem - Despesa Pessoal', '2021-05-10', '2021-09-30', 'Mensal', '40.00', 1, NULL, 'Pendente', '2021-05-27', NULL, NULL, NULL, NULL, NULL, 0),
(327, ' - Parcela 3', 2, 'Itaú', 'Dinheiro', 'Viagem - Despesa Pessoal', '2021-05-10', '2021-08-30', 'Mensal', '40.00', 1, NULL, 'Pendente', '2021-05-27', NULL, NULL, NULL, NULL, NULL, 0),
(328, ' - Parcela 1', 2, 'Itaú', 'Dinheiro', 'Viagem - Despesa Pessoal', '2021-05-10', '2021-06-30', 'Mensal', '40.00', 1, NULL, 'Pendente', '2021-05-27', NULL, NULL, NULL, NULL, NULL, 0),
(329, 'Pagamento', 3, 'Caixa', 'Dinheiro', 'Aluguel - Despesa Pessoal', '2021-05-10', '2021-04-21', 'Diária', '130.00', 1, NULL, 'Pendente', '2021-05-11', NULL, NULL, NULL, NULL, NULL, 0),
(331, 'Compra - Supermercado', 5, 'Caixa', 'Dinheiro', 'Compra de Produtos', '2021-05-11', '2021-06-11', 'Uma Vez', '94.99', 1, 4, 'Paga', '2021-05-11', '0.00', '0.00', '0.00', '94.99', '2021-05-11', 6),
(334, 'Parcela 1', 4, 'Caixa', 'Dinheiro', 'Compra de Produtos', '2021-05-11', '2021-07-11', 'Uma Vez', '27.50', 1, 4, 'Paga', '2021-05-11', '0.00', '0.00', '0.00', '27.50', '2021-05-11', 7),
(335, 'Parcela 2', 4, 'Caixa', 'Dinheiro', 'Compra de Produtos', '2021-05-11', '2021-08-11', 'Uma Vez', '27.50', 1, 4, 'Paga', '2021-05-11', '0.00', '0.00', '0.00', '27.50', '2021-05-11', 7),
(336, 'Compra - Supermercado', 5, 'Caixa', 'Dinheiro', 'Compra de Produtos', '2021-05-11', '2021-07-11', 'Uma Vez', '474.96', 1, NULL, 'Pendente', '2021-05-11', NULL, NULL, NULL, NULL, NULL, 8),
(337, '', 5, 'Caixa', 'Dinheiro', 'Luz - Empresa', '2021-05-12', '2021-05-12', 'Uma Vez', '600.00', 4, 4, 'Paga', '2021-05-12', '0.00', '0.00', '0.00', '600.00', '2021-05-12', 0),
(338, '', 4, 'Caixa', 'Dinheiro', 'Compras - Despesa Pessoal', '2021-05-12', '2021-05-12', 'Uma Vez', '260.00', 4, 4, 'Paga', '2021-05-12', '0.00', '0.00', '0.00', '260.00', '2021-05-12', 0),
(339, '', 3, 'Caixa', 'Dinheiro', 'Compras - Despesa Pessoal', '2021-05-12', '2021-05-12', 'Uma Vez', '200.00', 4, 4, 'Paga', '2021-05-12', '0.00', '0.00', '0.00', '200.00', '2021-05-12', 0),
(340, '', 2, 'Caixa', 'Dinheiro', 'Compras - Despesa Pessoal', '2021-05-12', '2021-05-12', 'Uma Vez', '150.00', 4, 4, 'Paga', '2021-05-12', '0.00', '0.00', '0.00', '150.00', '2021-05-12', 0),
(341, 'Compra - Diversos', 1, 'Caixa', 'Dinheiro', 'Compra de Produtos - Empresa', '2021-05-12', '2021-06-12', 'Uma Vez', '100.00', 4, 4, 'Paga', '2021-05-12', '0.00', '0.00', '0.00', '100.00', '2021-05-12', 14),
(342, 'Compra - Supermercado', 5, 'Caixa', 'Dinheiro', 'Compra de Produtos - Empresa', '2021-05-12', '2021-06-12', 'Uma Vez', '55.00', 4, NULL, 'Pendente', '2021-05-12', NULL, NULL, NULL, NULL, NULL, 15),
(343, '', 6, 'Caixa', 'Dinheiro', 'Aluguel - Despesa Pessoal', '2021-05-12', '2021-05-12', 'Uma Vez', '150.00', 1, 1, 'Paga', '2021-05-12', '0.00', '0.00', '0.00', '150.00', '2021-05-12', 0),
(344, '', 6, 'Bradesco', 'Dinheiro', 'Luz - Empresa', '2021-05-12', '2021-05-14', 'Uma Vez', '200.00', 1, NULL, 'Pendente', '2021-05-12', NULL, NULL, NULL, NULL, NULL, 0),
(345, '', 5, 'Caixa', 'Dinheiro', 'Luz - Empresa', '2021-05-12', '2021-05-14', 'Mensal', '250.00', 1, 1, 'Paga', '0000-00-00', '0.00', '0.00', '0.00', '250.00', '2021-05-12', 0),
(347, ' - Parcela 1', 5, 'Caixa', 'Dinheiro', 'Luz - Empresa', '2021-05-12', '2021-06-14', 'Mensal', '50.00', 1, NULL, 'Pendente', '2021-05-12', NULL, NULL, NULL, NULL, NULL, 0),
(348, ' - Parcela 2', 5, 'Caixa', 'Dinheiro', 'Luz - Empresa', '2021-05-12', '2021-07-14', 'Mensal', '50.00', 1, NULL, 'Pendente', '2021-05-12', NULL, NULL, NULL, NULL, NULL, 0),
(349, ' - Parcela 3', 5, 'Caixa', 'Dinheiro', 'Luz - Empresa', '2021-05-12', '2021-08-14', 'Mensal', '50.00', 1, NULL, 'Pendente', '2021-05-12', NULL, NULL, NULL, NULL, NULL, 0),
(350, ' - Parcela 4', 5, 'Caixa', 'Dinheiro', 'Luz - Empresa', '2021-05-12', '2021-09-14', 'Mensal', '50.00', 1, NULL, 'Pendente', '2021-05-12', NULL, NULL, NULL, NULL, NULL, 0),
(351, ' - Parcela 5', 5, 'Caixa', 'Dinheiro', 'Luz - Empresa', '2021-05-12', '2021-10-14', 'Mensal', '50.00', 1, NULL, 'Pendente', '2021-05-12', NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `contas_receber`
--

CREATE TABLE `contas_receber` (
  `id` int(11) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `cliente` int(11) DEFAULT NULL,
  `entrada` varchar(50) DEFAULT NULL,
  `documento` varchar(50) DEFAULT NULL,
  `plano_conta` varchar(50) NOT NULL,
  `data_emissao` date NOT NULL,
  `vencimento` date NOT NULL,
  `frequencia` varchar(50) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `usuario_lanc` int(11) NOT NULL,
  `usuario_baixa` int(11) DEFAULT NULL,
  `status` varchar(30) NOT NULL,
  `data_recor` date DEFAULT NULL,
  `juros` decimal(8,2) DEFAULT NULL,
  `multa` decimal(8,2) DEFAULT NULL,
  `desconto` decimal(8,2) DEFAULT NULL,
  `subtotal` decimal(8,2) DEFAULT NULL,
  `data_baixa` date DEFAULT NULL,
  `id_venda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `contas_receber`
--

INSERT INTO `contas_receber` (`id`, `descricao`, `cliente`, `entrada`, `documento`, `plano_conta`, `data_emissao`, `vencimento`, `frequencia`, `valor`, `usuario_lanc`, `usuario_baixa`, `status`, `data_recor`, `juros`, `multa`, `desconto`, `subtotal`, `data_baixa`, `id_venda`) VALUES
(5, 'Pagamento Serviço - Parcela 1', 7, 'Caixa', 'Dinheiro', 'Venda', '2021-04-22', '2021-04-14', 'Uma Vez', '150.00', 1, 1, 'Paga', '2021-04-22', '2.92', '3.00', '0.00', '155.92', '2021-04-27', 0),
(6, 'Pagamento Serviço - Parcela 2', 7, 'Caixa', 'Dinheiro', 'Venda', '2021-04-22', '2021-04-15', 'Uma Vez', '150.00', 1, 1, 'Paga', '2021-04-22', '2.48', '3.00', '0.00', '155.48', '2021-04-26', 0),
(7, 'Pagamento Serviço - Parcela 3', 7, 'Caixa', 'Dinheiro', 'Venda', '2021-04-22', '2021-04-17', 'Uma Vez', '150.00', 1, 1, 'Paga', '2021-04-22', '1.13', '3.00', '0.00', '154.13', '2021-04-22', 0),
(431, 'Conta Teste', 7, 'Caixa', 'Dinheiro', 'Venda', '2021-05-11', '2021-05-11', 'Uma Vez', '500.00', 1, NULL, 'Pendente', '2021-05-11', NULL, NULL, NULL, NULL, NULL, 0),
(432, 'Conta 2', 0, 'Caixa', 'Dinheiro', 'Venda', '2021-05-11', '2021-05-11', 'Uma Vez', '50.00', 1, NULL, 'Pendente', '2021-05-11', NULL, NULL, NULL, NULL, NULL, 0),
(434, ' - Parcela 1', 8, 'Caixa', 'Dinheiro', 'Venda', '2021-05-11', '2021-05-11', 'Uma Vez', '133.33', 1, NULL, 'Pendente', '2021-05-11', NULL, NULL, NULL, NULL, NULL, 0),
(435, ' - Parcela 2', 8, 'Caixa', 'Dinheiro', 'Venda', '2021-05-11', '2021-06-11', 'Uma Vez', '133.33', 1, NULL, 'Pendente', '2021-05-11', NULL, NULL, NULL, NULL, NULL, 0),
(436, ' - Parcela 3', 8, 'Caixa', 'Dinheiro', 'Venda', '2021-05-11', '2021-07-11', 'Uma Vez', '133.33', 1, NULL, 'Pendente', '2021-05-11', NULL, NULL, NULL, NULL, NULL, 0),
(438, 'Teste - Parcela 1', 7, 'Caixa', 'Dinheiro', 'Venda', '2021-05-11', '2021-05-11', 'Uma Vez', '100.00', 1, NULL, 'Pendente', '2021-05-11', NULL, NULL, NULL, NULL, NULL, 0),
(439, 'Teste - Parcela 2', 7, 'Caixa', 'Dinheiro', 'Venda', '2021-05-11', '2021-06-11', 'Uma Vez', '100.00', 1, NULL, 'Pendente', '2021-05-11', NULL, NULL, NULL, NULL, NULL, 0),
(440, 'Venda - Marlone Silva', 8, 'Caixa', 'Dinheiro', 'Venda', '2021-05-11', '2021-06-11', 'Uma Vez', '50.00', 1, 4, 'Paga', '2021-05-11', '0.00', '0.00', '0.00', '50.00', '2021-05-11', 23),
(444, 'Parcela 1', 6, 'Caixa', 'Dinheiro', 'Venda', '2021-05-11', '2021-06-11', 'Uma Vez', '25.00', 1, 1, 'Paga', '2021-05-11', '0.00', '0.00', '0.00', '25.00', '2021-05-11', 24),
(445, 'Parcela 2', 6, 'Caixa', 'Dinheiro', 'Venda', '2021-05-11', '2021-07-11', 'Uma Vez', '25.00', 1, NULL, 'Pendente', '2021-05-11', NULL, NULL, NULL, NULL, NULL, 24),
(446, 'Parcela 3', 6, 'Caixa', 'Dinheiro', 'Venda', '2021-05-11', '2021-08-11', 'Uma Vez', '25.00', 1, NULL, 'Pendente', '2021-05-11', NULL, NULL, NULL, NULL, NULL, 24),
(447, 'Conta Teste', 0, 'Caixa', 'Dinheiro', 'Venda', '2021-05-11', '2021-05-11', 'Uma Vez', '35.00', 1, 1, 'Paga', '2021-05-11', '0.05', '0.70', '0.00', '35.75', '2021-05-12', 0),
(453, 'Parcela 1', 7, 'Caixa', 'Dinheiro', 'Venda', '2021-05-11', '2021-05-11', 'Uma Vez', '30.00', 1, NULL, 'Pendente', '2021-05-11', NULL, NULL, NULL, NULL, NULL, 0),
(454, 'Parcela 2', 7, 'Caixa', 'Dinheiro', 'Venda', '2021-05-11', '2021-06-11', 'Uma Vez', '30.00', 1, NULL, 'Pendente', '2021-05-11', NULL, NULL, NULL, NULL, NULL, 0),
(456, 'Parcela 1', 9, 'Caixa', 'Dinheiro', 'Venda', '2021-05-11', '2021-05-11', 'Uma Vez', '75.00', 1, 1, 'Paga', '2021-05-11', '0.00', '0.00', '0.00', '75.00', '2021-05-11', 27),
(457, 'Parcela 2', 9, 'Caixa', 'Dinheiro', 'Venda', '2021-05-11', '2021-06-11', 'Uma Vez', '75.00', 1, 1, 'Paga', '2021-05-11', '0.00', '0.00', '0.00', '75.00', '2021-05-11', 27),
(458, 'Parcela 3', 9, 'Caixa', 'Dinheiro', 'Venda', '2021-05-11', '2021-07-11', 'Uma Vez', '75.00', 1, 1, 'Paga', '2021-05-11', '0.00', '0.00', '0.00', '75.00', '2021-05-11', 27),
(462, 'Venda - Marlone Silva', 8, 'Caixa', 'Dinheiro', 'Venda', '2021-05-11', '2021-06-11', 'Uma Vez', '134.99', 4, 4, 'Paga', '2021-05-11', '0.00', '0.00', '0.00', '134.99', '2021-05-11', 30),
(463, 'Parcela 1', 8, 'Caixa', 'Dinheiro', 'Venda', '2021-05-11', '2021-05-11', 'Uma Vez', '86.66', 4, 4, 'Paga', '2021-05-11', '0.00', '0.00', '0.00', '86.66', '2021-05-11', 31),
(464, 'Parcela 2', 8, 'Caixa', 'Dinheiro', 'Venda', '2021-05-11', '2021-06-11', 'Uma Vez', '86.66', 4, 4, 'Paga', '2021-05-11', '0.00', '0.00', '0.00', '86.66', '2021-05-11', 31),
(465, 'Parcela 3', 8, 'Caixa', 'Dinheiro', 'Venda', '2021-05-11', '2021-07-11', 'Uma Vez', '86.66', 4, 4, 'Paga', '2021-05-11', '0.00', '0.00', '0.00', '86.66', '2021-05-11', 31),
(469, 'Parcela 1', 8, 'Caixa', 'Dinheiro', 'Venda', '2021-05-11', '2021-08-11', 'Uma Vez', '71.67', 1, 1, 'Paga', '2021-05-11', '0.00', '0.00', '0.00', '71.67', '2021-05-11', 32),
(470, 'Parcela 2', 8, 'Caixa', 'Dinheiro', 'Venda', '2021-05-11', '2021-09-11', 'Uma Vez', '71.67', 1, 1, 'Paga', '2021-05-11', '0.00', '0.00', '0.00', '71.67', '2021-05-11', 32),
(471, 'Parcela 3', 8, 'Caixa', 'Dinheiro', 'Venda', '2021-05-11', '2021-10-11', 'Uma Vez', '71.67', 1, 1, 'Paga', '2021-05-11', '0.00', '0.00', '0.00', '71.67', '2021-05-11', 32),
(472, 'Venda - Empresa BC', 7, 'Caixa', 'Dinheiro', 'Venda', '2021-05-12', '2021-06-12', 'Uma Vez', '175.00', 4, 4, 'Paga', '2021-05-12', '0.00', '0.00', '0.00', '175.00', '2021-05-12', 39),
(479, 'Parcela 1', 9, 'Caixa', 'Dinheiro', 'Venda', '2021-05-12', '2021-06-12', 'Uma Vez', '41.67', 4, NULL, 'Pendente', '2021-05-12', NULL, NULL, NULL, NULL, NULL, 3),
(480, 'Parcela 2', 9, 'Caixa', 'Dinheiro', 'Venda', '2021-05-12', '2021-07-12', 'Uma Vez', '41.67', 4, NULL, 'Pendente', '2021-05-12', NULL, NULL, NULL, NULL, NULL, 3),
(481, 'Parcela 3', 9, 'Caixa', 'Dinheiro', 'Venda', '2021-05-12', '2021-08-12', 'Uma Vez', '41.67', 4, NULL, 'Pendente', '2021-05-12', NULL, NULL, NULL, NULL, NULL, 3),
(482, 'Venda - Marlone Silva', 8, 'Caixa', 'Dinheiro', 'Venda', '2021-05-12', '2021-06-12', 'Uma Vez', '285.00', 1, NULL, 'Pendente', '2021-05-12', NULL, NULL, NULL, NULL, NULL, 9),
(494, 'Parcela 1', 9, 'Cartão de Débito', 'Dinheiro', 'Venda', '2021-05-12', '2021-07-12', 'Uma Vez', '200.00', 1, 1, 'Paga', '2021-05-12', '0.00', '0.00', '0.00', '200.00', '2021-05-12', 10),
(495, 'Parcela 2', 9, 'Cartão de Débito', 'Dinheiro', 'Venda', '2021-05-12', '2021-08-12', 'Uma Vez', '200.00', 1, NULL, 'Pendente', '2021-05-12', NULL, NULL, NULL, NULL, NULL, 10),
(496, 'Parcela 3', 9, 'Cartão de Débito', 'Dinheiro', 'Venda', '2021-05-12', '2021-09-12', 'Uma Vez', '200.00', 1, NULL, 'Pendente', '2021-05-12', NULL, NULL, NULL, NULL, NULL, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `despesas`
--

CREATE TABLE `despesas` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cat_despesa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `despesas`
--

INSERT INTO `despesas` (`id`, `nome`, `cat_despesa`) VALUES
(1, 'Luz', 2),
(2, 'Água', 2),
(3, 'Telefone', 2),
(6, 'Internet', 3),
(10, 'Água', 3),
(12, 'Aluguel', 6),
(13, 'Compras', 6),
(14, 'Supermercado', 6),
(15, 'Outra', 6),
(16, 'Viagem', 6),
(17, 'Folha de Pagamento', 2),
(18, 'Compra de Produtos', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `formas_pgtos`
--

CREATE TABLE `formas_pgtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `formas_pgtos`
--

INSERT INTO `formas_pgtos` (`id`, `nome`) VALUES
(1, 'Boleto'),
(2, 'Carnê'),
(3, 'Cartão de Débito'),
(4, 'Cartão de Crédito'),
(5, 'Cheque'),
(6, 'Dinheiro'),
(7, 'Transferência'),
(8, 'Pix');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `pessoa` varchar(15) NOT NULL,
  `doc` varchar(20) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `ativo` varchar(5) NOT NULL,
  `obs` varchar(100) DEFAULT NULL,
  `data` date NOT NULL,
  `banco` varchar(40) DEFAULT NULL,
  `agencia` varchar(10) DEFAULT NULL,
  `conta` varchar(25) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `fornecedores`
--

INSERT INTO `fornecedores` (`id`, `nome`, `pessoa`, `doc`, `telefone`, `endereco`, `ativo`, `obs`, `data`, `banco`, `agencia`, `conta`, `email`) VALUES
(1, 'Diversos', 'Física', '000.000.000-60', NULL, NULL, 'Sim', NULL, '2021-05-11', NULL, NULL, NULL, 'fornecedor@fornecedor.com'),
(2, 'Paula Marta', 'Jurídica', '66.455.555/5555-55', '(15) 54555-5555', 'Rua 6', 'Sim', '', '2021-04-14', '', '', '', 'paula@hotmail.com'),
(3, 'Matheus Silva', 'Física', '151.555.555-55', '(15) 45555-5555', 'Rua A', 'Sim', '', '2021-04-14', '', '', '', 'mateus@hotmail.com'),
(4, 'Fármacia', 'Física', '', '', '', 'Sim', '', '2021-04-21', '', '', '', ''),
(5, 'Supermercado', 'Física', '', '', '', 'Sim', '', '2021-04-21', '', '', '', ''),
(6, 'Kamila Silva', 'Física', '455.555.555-55', '(48) 81222-2222', 'Rua DDDDD', 'Sim', 'Nenhuma', '2021-04-14', 'Caixa Econômica', '0554', '12222-6', 'kamila@hotmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `frequencias`
--

CREATE TABLE `frequencias` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `dias` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `frequencias`
--

INSERT INTO `frequencias` (`id`, `nome`, `dias`) VALUES
(1, 'Uma Vez', 0),
(2, 'Diária', 1),
(3, 'Semanal', 7),
(4, 'Mensal', 30),
(5, 'Trimestral', 90),
(6, 'Semestral', 180),
(7, 'Anual', 365);

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens_compra`
--

CREATE TABLE `itens_compra` (
  `id` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `produto` int(11) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `itens_compra`
--

INSERT INTO `itens_compra` (`id`, `id_compra`, `produto`, `valor`, `quantidade`, `total`, `usuario`) VALUES
(1, 3, 14, '50.00', 1, '50.00', 1),
(2, 3, 13, '5.00', 1, '5.00', 1),
(3, 3, 12, '89.99', 1, '89.99', 1),
(4, 3, 11, '120.00', 1, '120.00', 1),
(5, 4, 14, '50.00', 1, '50.00', 1),
(6, 4, 13, '5.00', 1, '5.00', 1),
(7, 6, 13, '5.00', 1, '5.00', 1),
(8, 6, 12, '89.99', 1, '89.99', 1),
(9, 7, 14, '50.00', 1, '50.00', 1),
(10, 7, 13, '5.00', 1, '5.00', 1),
(13, 8, 12, '89.99', 1, '89.99', 1),
(15, 8, 14, '50.00', 1, '50.00', 1),
(16, 8, 13, '5.00', 1, '5.00', 1),
(17, 8, 12, '89.99', 3, '269.97', 1),
(18, 8, 15, '50.00', 1, '50.00', 1),
(19, 8, 13, '5.00', 1, '5.00', 1),
(20, 8, 13, '5.00', 1, '5.00', 1),
(21, 9, 14, '50.00', 1, '50.00', 1),
(22, 10, 14, '50.00', 1, '50.00', 4),
(23, 10, 15, '50.00', 1, '50.00', 4),
(24, 10, 12, '89.99', 1, '89.99', 4),
(25, 11, 14, '50.00', 1, '50.00', 4),
(26, 11, 13, '5.00', 1, '5.00', 4),
(27, 12, 12, '89.99', 1, '89.99', 4),
(28, 12, 14, '50.00', 1, '50.00', 4),
(29, 13, 14, '50.00', 1, '50.00', 4),
(30, 13, 13, '5.00', 1, '5.00', 4),
(31, 13, 13, '5.00', 1, '5.00', 4),
(32, 14, 15, '50.00', 1, '50.00', 4),
(33, 14, 14, '50.00', 1, '50.00', 4),
(34, 15, 13, '5.00', 1, '5.00', 4),
(35, 15, 14, '50.00', 1, '50.00', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens_venda`
--

CREATE TABLE `itens_venda` (
  `id` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  `produto` int(11) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `usuario` int(11) NOT NULL,
  `valor_custo` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `itens_venda`
--

INSERT INTO `itens_venda` (`id`, `id_venda`, `produto`, `valor`, `quantidade`, `total`, `usuario`, `valor_custo`) VALUES
(1, 1, 15, '210.00', 1, '210.00', 4, '50.00'),
(2, 1, 14, '75.00', 1, '75.00', 4, '50.00'),
(3, 1, 12, '134.99', 1, '134.99', 4, '89.99'),
(4, 2, 14, '75.00', 2, '150.00', 4, '50.00'),
(5, 2, 13, '50.00', 1, '50.00', 4, '5.00'),
(6, 2, 12, '134.99', 1, '134.99', 4, '89.99'),
(7, 3, 14, '75.00', 1, '75.00', 4, '50.00'),
(8, 3, 13, '50.00', 1, '50.00', 4, '5.00'),
(9, 4, 15, '210.00', 1, '210.00', 1, '50.00'),
(10, 4, 14, '75.00', 1, '75.00', 1, '50.00'),
(11, 4, 14, '75.00', 1, '75.00', 1, '50.00'),
(12, 5, 14, '75.00', 1, '75.00', 1, '50.00'),
(13, 6, 11, '192.00', 1, '192.00', 1, '120.00'),
(14, 6, 12, '134.99', 1, '134.99', 1, '89.99'),
(15, 7, 15, '210.00', 1, '210.00', 1, '50.00'),
(16, 7, 14, '75.00', 1, '75.00', 1, '50.00'),
(17, 8, 15, '210.00', 3, '630.00', 1, '50.00'),
(18, 8, 14, '75.00', 1, '75.00', 1, '50.00'),
(19, 8, 13, '50.00', 1, '50.00', 1, '5.00'),
(20, 9, 15, '210.00', 1, '210.00', 1, '50.00'),
(21, 9, 14, '75.00', 1, '75.00', 1, '50.00'),
(22, 10, 15, '210.00', 3, '630.00', 1, '50.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `movimentacoes`
--

CREATE TABLE `movimentacoes` (
  `id` int(11) NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `movimento` varchar(50) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `usuario` int(11) NOT NULL,
  `data` date NOT NULL,
  `lancamento` varchar(35) DEFAULT NULL,
  `plano_conta` varchar(35) DEFAULT NULL,
  `documento` varchar(35) DEFAULT NULL,
  `caixa_periodo` int(11) DEFAULT NULL,
  `id_mov` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `movimentacoes`
--

INSERT INTO `movimentacoes` (`id`, `tipo`, `movimento`, `descricao`, `valor`, `usuario`, `data`, `lancamento`, `plano_conta`, `documento`, `caixa_periodo`, `id_mov`) VALUES
(7, 'Saída', 'Conta à Pagar', 'Testee - Parcela 2 - Paula Marta', '50.00', 1, '2021-04-21', 'Caixa', 'Aluguel - Despesa Pessoal', 'Dinheiro', 7, NULL),
(24, 'Entrada', 'Conta à Receber', 'Diaria - Marlone Silva', '250.00', 1, '2021-04-23', 'Caixa', 'Venda', 'Dinheiro', 7, NULL),
(25, 'Entrada', 'Conta à Receber', 'Diaria - Marlone Silva', '50.00', 1, '2021-04-22', 'Caixa', 'Venda', 'Dinheiro', 7, NULL),
(26, 'Entrada', 'Conta à Receber', 'Diaria - Marlone Silva', '40.00', 1, '2021-04-22', 'Bradesco', 'Venda', 'Dinheiro', 7, NULL),
(27, 'Saída', 'Conta à Pagar', 'Pagamento - Matheus Silva', '30.00', 1, '2021-04-22', 'Caixa', 'Aluguel - Despesa Pessoal', 'Dinheiro', 7, NULL),
(28, 'Entrada', 'Conta à Receber', ' - Parcela 4 - Marlone Silva', '200.00', 1, '2021-04-22', 'Banco do Brasil', 'Venda', 'Boleto', 7, NULL),
(29, 'Entrada', 'Conta à Receber', ' - Parcela 3 - Marlone Silva', '50.00', 1, '2021-04-22', 'Banco do Brasil', 'Venda', 'Boleto', 7, NULL),
(30, 'Entrada', 'Conta à Receber', '(Resíduo) -  - Parcela 1 - Marlone Silva', '100.00', 1, '2021-04-22', 'Banco do Brasil', 'Venda', 'Boleto', 7, NULL),
(31, 'Saída', 'Conta à Pagar', 'Fornecedor - Fármacia', '150.00', 1, '2021-04-22', 'Caixa', 'Compra de Produtos - Empresa', 'Dinheiro', 7, NULL),
(32, 'Saída', 'Conta à Pagar', 'Conta Diaria - Paula Marta', '350.00', 1, '2021-04-22', 'Caixa', 'Aluguel - Despesa Pessoal', 'Dinheiro', 7, NULL),
(33, 'Entrada', 'Conta à Receber', ' - Empresa BC', '1015.00', 1, '2021-04-22', 'Caixa', 'Venda', 'Dinheiro', 7, NULL),
(34, 'Entrada', 'Conta à Receber', ' - Parcela 3 - Marlone Silva', '145.00', 1, '2021-04-22', 'Banco do Brasil', 'Venda', 'Boleto', 7, NULL),
(35, 'Entrada', 'Conta à Receber', 'Pagamento Serviço - Parcela 3 - Empresa BC', '154.13', 1, '2021-04-22', 'Caixa', 'Venda', 'Dinheiro', 7, NULL),
(36, 'Saída', 'Despesa', 'Fios de Luz', '450.00', 1, '2021-04-22', 'Caixa', 'Despesa', 'Boleto', 7, NULL),
(37, 'Saída', 'Despesa', 'dsssdsd', '50.00', 1, '2021-04-22', 'Caixa', 'Despesa', 'Boleto', 7, NULL),
(41, 'Saída', 'Despesa', 'Paula Marta', '700.00', 1, '2021-04-22', 'Caixa', 'Aluguel - Despesa Pessoal', 'Dinheiro', 7, 11),
(42, 'Entrada', 'Conta à Receber', 'Conta Exemplo', '550.00', 1, '2021-04-22', 'Cartão de Débito', 'Venda', 'Dinheiro', 7, NULL),
(43, 'Entrada', 'Conta à Receber', ' - Karolina Souza', '200.00', 1, '2021-04-22', 'Cartão de Crédito', 'Venda', 'Dinheiro', 7, NULL),
(44, 'Entrada', 'Conta à Receber', '(Resíduo)  - Parcela 1 - Empresa BC', '50.00', 1, '2021-04-22', 'Cartão de Débito', 'Venda', 'Dinheiro', 7, NULL),
(45, 'Entrada', 'Conta à Receber', ' - Parcela 1 - Empresa BC', '16.67', 1, '2021-04-22', 'Cartão de Débito', 'Venda', 'Dinheiro', 7, NULL),
(46, 'Saída', 'Despesa', 'Matheus Silva', '50.00', 1, '2021-04-22', 'Caixa', 'Aluguel - Despesa Pessoal', 'Boleto', 7, 12),
(47, 'Saída', 'Conta à Pagar', 'Fornecedor - Fármacia', '150.00', 1, '2021-04-26', 'Caixa', 'Compra de Produtos - Empresa', 'Dinheiro', 7, NULL),
(48, 'Saída', 'Conta à Pagar', 'Fornecedor - Fármacia', '150.00', 1, '2021-04-26', 'Caixa', 'Compra de Produtos - Empresa', 'Dinheiro', 7, NULL),
(49, 'Entrada', 'Conta à Receber', 'Diaria - Marlone Silva', '164.40', 1, '2021-04-26', 'Bradesco', 'Venda', 'Dinheiro', 7, NULL),
(50, 'Entrada', 'Conta à Receber', ' - Parcela 1 - Marlone Silva', '102.60', 1, '2021-04-26', 'Banco do Brasil', 'Venda', 'Boleto', 7, NULL),
(51, 'Entrada', 'Conta à Receber', 'Pagamento Serviço - Parcela 2 - Empresa BC', '155.48', 1, '2021-04-26', 'Caixa', 'Venda', 'Dinheiro', 7, NULL),
(52, 'Entrada', 'Conta à Receber', ' - Parcela 2 - Empresa BC', '66.67', 1, '2021-04-26', 'Cartão de Débito', 'Venda', 'Dinheiro', 7, NULL),
(53, 'Saída', 'Despesa', 'Teste', '49.00', 1, '2021-04-26', 'Caixa', 'Aluguel - Despesa Pessoal', 'Boleto', 7, 13),
(54, 'Saída', 'Despesa', 'Paula Marta', '50.00', 1, '2021-04-26', 'Bradesco', 'Aluguel - Despesa Pessoal', 'Boleto', 7, 14),
(55, 'Saída', 'Despesa', 'Kamila Silva', '200.00', 1, '2021-04-26', 'Caixa Econômica', 'Aluguel - Despesa Pessoal', 'Boleto', 7, 15),
(56, 'Saída', 'Despesa', 'aaddfa', '190.00', 1, '2021-04-26', 'Itaú', 'Aluguel - Despesa Pessoal', 'Boleto', 7, 16),
(57, 'Saída', 'Despesa', 'Paula Marta', '45.00', 1, '2021-04-26', 'Nubank', 'Aluguel - Despesa Pessoal', 'Boleto', 7, 17),
(60, 'Saída', 'Despesa', 'Netflix', '35.00', 1, '2021-04-26', 'Santander', 'Aluguel - Despesa Pessoal', 'Boleto', 7, 20),
(62, 'Saída', 'Despesa', 'asasdf', '50.00', 4, '2021-04-26', 'Banco do Brasil', 'Aluguel - Despesa Pessoal', 'Boleto', 7, 22),
(64, 'Saída', 'Despesa', 'asdsfa', '40.00', 4, '2021-04-26', 'Banco do Brasil', 'Aluguel - Despesa Pessoal', 'Boleto', 7, 24),
(65, 'Saída', 'Despesa', 'Matheus Silva', '600.00', 4, '2021-04-26', 'Caixa', 'Aluguel - Despesa Pessoal', 'Boleto', 7, 25),
(66, 'Saída', 'Conta à Pagar', 'Teste - Matheus Silva', '50.00', 4, '2021-04-26', 'Caixa', 'Aluguel - Despesa Pessoal', 'Dinheiro', 7, NULL),
(67, 'Saída', 'Despesa', 'Matheus Silva D', '70.00', 1, '2021-04-26', 'Caixa', 'Aluguel - Despesa Pessoal', 'Dinheiro', 7, 26),
(68, 'Saída', 'Despesa', 'aaaaaa', '60.00', 4, '2021-04-26', 'Nubank', 'Aluguel - Despesa Pessoal', 'Dinheiro', 7, 27),
(69, 'Saída', 'Transferência', 'Transferência', '50.00', 1, '2021-04-26', 'Caixa', 'Transferência', 'Dinheiro', NULL, NULL),
(70, 'Entrada', 'Transferência', 'Transferência', '50.00', 1, '2021-04-26', 'Banco do Brasil', 'Transferência', 'Dinheiro', NULL, NULL),
(71, 'Saída', 'Transferência', 'Transferência', '10.00', 1, '2021-04-26', 'Caixa', 'Transferência', 'Dinheiro', NULL, NULL),
(72, 'Entrada', 'Transferência', 'Transferência', '10.00', 1, '2021-04-26', 'Banco do Brasil', 'Transferência', 'Dinheiro', NULL, NULL),
(73, 'Saída', 'Transferência', 'Transferência', '10.00', 1, '2021-04-26', 'Caixa', 'Transferência', 'Dinheiro', NULL, NULL),
(74, 'Entrada', 'Transferência', 'Transferência', '10.00', 1, '2021-04-26', 'Banco do Brasil', 'Transferência', 'Dinheiro', NULL, NULL),
(75, 'Saída', 'Conta à Pagar', 'Aluguel AP x - Matheus Silva', '950.00', 1, '2021-04-26', 'Banco do Brasil', 'Aluguel - Despesa Pessoal', 'Transferência', 7, NULL),
(76, 'Saída', 'Conta à Pagar', 'Aluguel AP x - Matheus Silva', '950.00', 1, '2021-04-26', 'Banco do Brasil', 'Aluguel - Despesa Pessoal', 'Transferência', 7, NULL),
(77, 'Saída', 'Conta à Pagar', 'Aluguel AP XXX - Kamila Silva', '980.00', 1, '2021-04-26', 'Banco do Brasil', 'Aluguel - Despesa Pessoal', 'Transferência', 7, NULL),
(78, 'Saída', 'Conta à Pagar', 'Aluguel AP XXX - Kamila Silva', '980.00', 1, '2021-04-26', 'Banco do Brasil', 'Aluguel - Despesa Pessoal', 'Transferência', 7, NULL),
(79, 'Saída', 'Conta à Pagar', 'Teste - Paula Marta', '80.00', 1, '2021-04-26', 'Caixa', 'Aluguel - Despesa Pessoal', 'Dinheiro', 7, NULL),
(80, 'Saída', 'Conta à Pagar', 'Teste - Paula Marta', '80.00', 1, '2021-04-26', 'Caixa', 'Aluguel - Despesa Pessoal', 'Dinheiro', 7, NULL),
(81, 'Saída', 'Conta à Pagar', ' - Matheus Silva', '85.00', 1, '2021-04-26', 'Caixa', 'Aluguel - Despesa Pessoal', 'Dinheiro', 7, NULL),
(82, 'Saída', 'Conta à Pagar', ' - Matheus Silva', '85.00', 1, '2021-04-26', 'Caixa', 'Aluguel - Despesa Pessoal', 'Dinheiro', 7, NULL),
(83, 'Entrada', 'Conta à Receber', ' - Empresa BC', '140.00', 1, '2021-04-26', 'Caixa', 'Venda', 'Dinheiro', 7, NULL),
(84, 'Entrada', 'Conta à Receber', ' - Empresa BC', '140.00', 1, '2021-04-26', 'Caixa', 'Venda', 'Dinheiro', 7, NULL),
(85, 'Entrada', 'Conta à Receber', '(Resíduo)  - Empresa BC', '60.00', 1, '2021-04-26', 'Caixa', 'Venda', 'Dinheiro', 7, NULL),
(86, 'Entrada', 'Conta à Receber', ' - Empresa BC', '100.00', 1, '2021-04-26', 'Caixa', 'Venda', 'Dinheiro', 7, NULL),
(87, 'Saída', 'Despesa', 'Matheus Silva', '500.00', 1, '2021-04-27', 'Banco do Brasil', 'Aluguel - Despesa Pessoal', 'Boleto', 7, 28),
(88, 'Saída', 'Despesa', 'Fármacia', '250.00', 1, '2021-04-27', 'Caixa', 'Compras - Despesa Pessoal', 'Dinheiro', 7, 29),
(90, 'Entrada', 'Conta à Receber', ' - Empresa BC', '100.00', 1, '2021-04-27', 'Caixa', 'Venda', 'Dinheiro', 7, NULL),
(91, 'Saída', 'Conta à Pagar', '(Resíduo)  - Paula Marta', '50.00', 1, '2021-04-27', 'Itaú', 'Viagem - Despesa Pessoal', 'Dinheiro', 7, NULL),
(92, 'Saída', 'Conta à Pagar', ' - Paula Marta', '200.00', 1, '2021-04-27', 'Itaú', 'Viagem - Despesa Pessoal', 'Dinheiro', 7, NULL),
(93, 'Saída', 'Conta à Pagar', ' - Parcela 5 - Paula Marta', '40.00', 1, '2021-04-27', 'Itaú', 'Viagem - Despesa Pessoal', 'Dinheiro', 7, NULL),
(94, 'Entrada', 'Conta à Receber', ' - Parcela 2 - Marlone Silva', '205.20', 1, '2021-04-27', 'Banco do Brasil', 'Venda', 'Boleto', 7, NULL),
(95, 'Entrada', 'Conta à Receber', 'Pagamento Serviço - Parcela 1 - Empresa BC', '155.92', 1, '2021-04-27', 'Caixa', 'Venda', 'Dinheiro', 7, NULL),
(96, 'Saída', 'Despesa', 'Fármacia', '30.00', 1, '2021-04-27', 'Caixa', 'Aluguel - Despesa Pessoal', 'Boleto', 7, 30),
(97, 'Saída', 'Despesa', 'Paula Marta', '50.00', 1, '2021-04-27', 'Caixa', 'Aluguel - Despesa Pessoal', 'Boleto', 7, 31),
(98, 'Saída', 'Despesa', 'Fármacia', '50.00', 1, '2021-04-27', 'Caixa', 'Aluguel - Despesa Pessoal', 'Boleto', 7, 32),
(99, 'Saída', 'Conta à Pagar', ' - Parcela 5 - Paula Marta', '40.00', 1, '2021-05-10', 'Itaú', 'Viagem - Despesa Pessoal', 'Dinheiro', 7, NULL),
(100, 'Entrada', 'Conta à Receber', ' - Empresa BC', '100.00', 1, '2021-05-10', 'Caixa', 'Venda', 'Dinheiro', 7, NULL),
(101, 'Entrada', 'Conta à Receber', ' - Empresa BC', '100.00', 1, '2021-05-10', 'Caixa', 'Venda', 'Dinheiro', 7, NULL),
(102, 'Saída', 'Conta à Pagar', ' - Parcela 5 - Paula Marta', '40.00', 1, '2021-05-10', 'Itaú', 'Viagem - Despesa Pessoal', 'Dinheiro', 7, NULL),
(103, 'Saída', 'Conta à Pagar', ' - Parcela 5 - Paula Marta', '40.00', 1, '2021-05-10', 'Itaú', 'Viagem - Despesa Pessoal', 'Dinheiro', 7, NULL),
(104, 'Saída', 'Conta à Pagar', ' - Matheus Silva', '85.00', 1, '2021-05-10', 'Caixa', 'Aluguel - Despesa Pessoal', 'Dinheiro', 7, NULL),
(105, 'Saída', 'Conta à Pagar', ' - Parcela 4 - Paula Marta', '40.00', 1, '2021-05-10', 'Itaú', 'Viagem - Despesa Pessoal', 'Dinheiro', 7, NULL),
(106, 'Saída', 'Conta à Pagar', ' - Parcela 3 - Paula Marta', '40.00', 1, '2021-05-10', 'Itaú', 'Viagem - Despesa Pessoal', 'Dinheiro', 7, NULL),
(107, 'Saída', 'Conta à Pagar', ' - Matheus Silva', '25.00', 1, '2021-05-10', 'Caixa', 'Aluguel - Despesa Pessoal', 'Dinheiro', 7, NULL),
(108, 'Saída', 'Conta à Pagar', ' - Parcela 1 - Paula Marta', '40.00', 1, '2021-05-10', 'Itaú', 'Viagem - Despesa Pessoal', 'Dinheiro', 7, NULL),
(109, 'Entrada', 'Receita', 'Marlone Silva', '35.00', 1, '0000-00-00', 'Caixa', 'Receita', 'Dinheiro', 7, NULL),
(110, 'Entrada', 'Receita', 'Empresa BC', '35.00', 1, '2021-05-10', 'Caixa', 'Receita', 'Transferência', 7, NULL),
(111, 'Entrada', 'Conta à Receber', ' - Empresa BC', '2000.00', 1, '2021-05-10', 'Caixa', 'Venda', 'Dinheiro', 7, NULL),
(112, 'Entrada', 'Conta à Receber', ' - Empresa BC', '100.00', 1, '2021-05-10', 'Caixa', 'Venda', 'Dinheiro', 7, NULL),
(113, 'Entrada', 'Conta à Receber', ' - Empresa BC', '100.00', 1, '2021-05-10', 'Caixa', 'Venda', 'Dinheiro', 7, NULL),
(114, 'Saída', 'Conta à Pagar', 'Pagamento - Matheus Silva', '130.00', 1, '2021-05-10', 'Caixa', 'Aluguel - Despesa Pessoal', 'Dinheiro', 7, NULL),
(115, 'Entrada', 'Conta à Receber', ' - Empresa BC', '100.00', 1, '2021-05-10', 'Caixa', 'Venda', 'Dinheiro', 7, NULL),
(116, 'Entrada', 'Conta à Receber', ' - Empresa BC', '100.00', 1, '2021-05-10', 'Caixa', 'Venda', 'Dinheiro', 7, NULL),
(117, 'Saída', 'Transferência', 'Transferência', '2000.00', 1, '2021-05-10', '', 'Transferência', 'Dinheiro', NULL, NULL),
(118, 'Entrada', 'Transferência', 'Transferência', '2000.00', 1, '2021-05-10', '', 'Transferência', 'Dinheiro', NULL, NULL),
(119, 'Saída', 'Fechamento', 'Retirada', '20.00', 1, '2021-05-10', 'Caixa', 'Fechamento', 'Dinheiro', NULL, NULL),
(120, 'Saída', 'Fechamento', 'Retirada', '50.00', 1, '2021-05-10', 'Caixa', 'Fechamento', 'Dinheiro', NULL, NULL),
(121, 'Saída', 'Fechamento', 'Retirada', '683.00', 1, '2021-05-10', 'Cartão de Débito', 'Fechamento', 'Cartão de Débito', NULL, NULL),
(123, 'Saída', 'Fechamento', 'Retirada', '0.34', 1, '2021-05-10', 'Cartão de Débito', 'Fechamento', 'Cartão de Débito', NULL, NULL),
(124, 'Entrada', 'Conta à Receber', ' - Parcela 36 - Empresa BC', '2.80', 1, '2021-05-10', 'Caixa', 'Venda', 'Dinheiro', 7, NULL),
(125, 'Entrada', 'Conta à Receber', ' - Parcela 37 - Empresa BC', '2.80', 1, '2021-05-10', 'Caixa', 'Venda', 'Dinheiro', 7, NULL),
(126, 'Entrada', 'Conta à Receber', ' - Parcela 21 - Empresa BC', '2.80', 1, '2021-05-10', 'Caixa', 'Venda', 'Dinheiro', 7, NULL),
(127, 'Entrada', 'Conta à Receber', ' - Parcela 37 - Empresa BC', '2.80', 1, '2021-05-10', 'Cartão de Débito', 'Venda', 'Dinheiro', 7, NULL),
(128, 'Entrada', 'Conta à Receber', ' - Parcela 36 - Empresa BC', '2.80', 1, '2021-05-10', 'Cartão de Crédito', 'Venda', 'Dinheiro', 7, NULL),
(129, 'Saída', 'Fechamento', 'Retirada', '202.80', 1, '2021-05-10', 'Cartão de Crédito', 'Fechamento', 'Cartão de Crédito', NULL, NULL),
(130, 'Entrada', 'Venda', '', '209.99', 1, '2021-05-10', '', '', '', 0, NULL),
(131, 'Entrada', 'Venda', 'Venda - Empresa BC', '199.99', 1, '2021-05-10', 'Caixa', 'Venda', 'Dinheiro', 7, 12),
(132, 'Entrada', 'Venda', 'Venda - Karolina Souza', '110.00', 1, '2021-05-10', 'Caixa', 'Venda', 'Dinheiro', 7, 16),
(133, 'Saída', 'Compra', 'Compra - Diversos', '264.99', 1, '2021-05-11', 'Caixa', 'Compra de Produtos', 'Dinheiro', 7, 1),
(134, 'Saída', 'Compra', 'Compra - Diversos', '264.99', 1, '2021-05-11', 'Caixa', 'Compra de Produtos', 'Dinheiro', 7, 2),
(135, 'Saída', 'Compra', 'Compra - Diversos', '264.99', 1, '2021-05-11', 'Caixa', 'Compra de Produtos', 'Dinheiro', 7, 3),
(136, 'Saída', 'Compra', 'Compra - Kamila Silva', '55.00', 1, '2021-05-11', 'Caixa', 'Compra de Produtos', 'Dinheiro', 7, 4),
(137, 'Entrada', 'Conta à Receber', 'Parcela 1 - Karolina Souza', '25.00', 1, '2021-05-11', 'Caixa', 'Venda', 'Dinheiro', 7, NULL),
(138, 'Entrada', 'Venda', 'Venda - Paula Campos', '359.99', 1, '2021-05-11', 'Caixa', 'Venda', 'Dinheiro', 7, 25),
(139, 'Entrada', 'Conta à Receber', 'Parcela 1 - Paula Campos', '75.00', 1, '2021-05-11', 'Caixa', 'Venda', 'Dinheiro', 7, NULL),
(140, 'Entrada', 'Conta à Receber', 'Parcela 2 - Paula Campos', '75.00', 1, '2021-05-11', 'Caixa', 'Venda', 'Dinheiro', 7, 457),
(141, 'Entrada', 'Conta à Receber', 'Parcela 3 - Paula Campos', '75.00', 1, '2021-05-11', 'Caixa', 'Venda', 'Dinheiro', 7, 27),
(143, 'Entrada', 'Conta à Receber', 'Venda - Marlone Silva - Marlone Silva', '50.00', 4, '2021-05-11', 'Caixa', 'Venda', 'Dinheiro', 7, 23),
(144, 'Entrada', 'Venda', 'Venda - Paula Campos', '210.00', 4, '2021-05-11', 'Caixa', 'Venda', 'Dinheiro', 7, 29),
(145, 'Entrada', 'Conta à Receber', 'Venda - Marlone Silva - Marlone Silva', '134.99', 4, '2021-05-11', 'Caixa', 'Venda', 'Dinheiro', 7, 30),
(146, 'Entrada', 'Conta à Receber', 'Parcela 1 - Marlone Silva', '86.66', 4, '2021-05-11', 'Caixa', 'Venda', 'Dinheiro', 7, 31),
(147, 'Entrada', 'Conta à Receber', 'Parcela 2 - Marlone Silva', '86.66', 4, '2021-05-11', 'Caixa', 'Venda', 'Dinheiro', 7, 31),
(148, 'Entrada', 'Conta à Receber', 'Parcela 3 - Marlone Silva', '86.66', 4, '2021-05-11', 'Caixa', 'Venda', 'Dinheiro', 7, 31),
(149, 'Saída', 'Conta à Pagar', 'Parcela 1 - Fármacia', '27.50', 4, '2021-05-11', 'Caixa', 'Compra de Produtos', 'Dinheiro', 7, 7),
(150, 'Saída', 'Conta à Pagar', 'Parcela 2 - Fármacia', '27.50', 4, '2021-05-11', 'Caixa', 'Compra de Produtos', 'Dinheiro', 7, 7),
(151, 'Saída', 'Conta à Pagar', 'Parcela 2 - Fármacia', '27.50', 4, '2021-05-11', 'Caixa', 'Compra de Produtos', 'Dinheiro', 7, 7),
(152, 'Saída', 'Conta à Pagar', 'Compra - Supermercado - Supermercado', '94.99', 4, '2021-05-11', 'Caixa', 'Compra de Produtos', 'Dinheiro', 7, 6),
(153, 'Entrada', 'Conta à Receber', 'Parcela 1 - Marlone Silva', '71.67', 1, '2021-05-11', 'Caixa', 'Venda', 'Dinheiro', 7, 32),
(154, 'Entrada', 'Conta à Receber', 'Parcela 2 - Marlone Silva', '71.67', 1, '2021-05-11', 'Caixa', 'Venda', 'Dinheiro', 7, 32),
(155, 'Entrada', 'Conta à Receber', 'Parcela 3 - Marlone Silva', '71.67', 1, '2021-05-11', 'Caixa', 'Venda', 'Dinheiro', 7, 32),
(157, 'Saída', 'Compra', 'Compra - Kamila Silva', '180.00', 4, '2021-05-11', 'Caixa', 'Compra de Produtos', 'Dinheiro', 7, 10),
(158, 'Entrada', 'Venda', 'Venda - Diversos', '125.00', 4, '2021-05-11', 'Caixa', 'Venda', 'Dinheiro', 7, 33),
(159, 'Entrada', 'Venda', 'Venda - Marlone Silva', '285.00', 4, '2021-05-11', 'Caixa', 'Venda', 'Dinheiro', 7, 34),
(160, 'Entrada', 'Venda', 'Venda - Paula Campos', '125.00', 4, '2021-05-11', 'Caixa', 'Venda', 'Dinheiro', 7, 35),
(161, 'Entrada', 'Venda', 'Venda - Empresa BC', '50.00', 4, '2021-05-11', 'Caixa', 'Venda', 'Dinheiro', 7, 36),
(162, 'Entrada', 'Venda', 'Venda - Diversos', '125.00', 4, '2021-05-11', 'Caixa', 'Venda', 'Dinheiro', 7, 37),
(163, 'Entrada', 'Venda', 'Venda - Marlone Silva', '209.99', 4, '2021-05-11', 'Caixa', 'Venda', 'Dinheiro', 7, 38),
(164, 'Saída', 'Compra', 'Compra - Kamila Silva', '55.00', 4, '2021-05-11', 'Caixa', 'Compra de Produtos', 'Dinheiro', 7, 11),
(165, 'Saída', 'Compra', 'Compra - Kamila Silva', '139.99', 4, '2021-05-11', 'Caixa', 'Compra de Produtos', 'Dinheiro', 7, 12),
(166, 'Saída', 'Compra', 'Compra - Kamila Silva', '60.00', 4, '2021-05-11', 'Caixa', 'Compra de Produtos', 'Dinheiro', 7, 13),
(167, 'Entrada', 'Receita', 'Teste', '50.00', 4, '2021-05-12', 'Caixa', 'Receita', 'Boleto', 7, NULL),
(168, 'Saída', 'Conta à Pagar', ' - Fármacia', '260.00', 4, '2021-05-12', 'Caixa', 'Compras - Despesa Pessoal', 'Dinheiro', 7, 0),
(169, 'Saída', 'Conta à Pagar', ' - Supermercado', '600.00', 4, '2021-05-12', 'Caixa', 'Luz - Empresa', 'Dinheiro', 7, 0),
(170, 'Saída', 'Conta à Pagar', ' - Matheus Silva', '200.00', 4, '2021-05-12', 'Caixa', 'Compras - Despesa Pessoal', 'Dinheiro', 7, 0),
(171, 'Saída', 'Conta à Pagar', ' - Paula Marta', '150.00', 4, '2021-05-12', 'Caixa', 'Compras - Despesa Pessoal', 'Dinheiro', 7, 0),
(172, 'Saída', 'Conta à Pagar', 'Compra - Diversos - Diversos', '100.00', 4, '2021-05-12', 'Caixa', 'Compra de Produtos - Empresa', 'Dinheiro', 7, 14),
(173, 'Saída', 'Transferência', 'Transferência', '50.00', 4, '2021-05-12', 'Caixa', 'Transferência', 'Dinheiro', NULL, NULL),
(174, 'Entrada', 'Transferência', 'Transferência', '50.00', 4, '2021-05-12', 'Itaú', 'Transferência', 'Dinheiro', NULL, NULL),
(175, 'Entrada', 'Receita', 'Paula Campos', '500.00', 4, '2021-05-12', 'Caixa', 'Receita', 'Dinheiro', 7, NULL),
(176, 'Saída', 'Despesa', 'Teste', '45.00', 4, '2021-05-12', 'Caixa', 'Aluguel - Despesa Pessoal', 'Boleto', 7, 33),
(177, 'Entrada', 'Conta à Receber', 'Venda - Empresa BC - Empresa BC', '175.00', 4, '2021-05-12', 'Caixa', 'Venda', 'Dinheiro', 7, 39),
(178, 'Entrada', 'Venda', 'Venda - Diversos', '419.99', 4, '2021-05-12', 'Caixa', 'Venda', 'Dinheiro', 7, 1),
(179, 'Entrada', 'Venda', 'Venda - Paula Campos', '329.99', 4, '2021-05-12', 'Caixa', 'Venda', 'Dinheiro', 7, 2),
(180, 'Entrada', 'Venda', 'Venda - Paula Campos', '350.00', 1, '2021-05-12', 'Caixa', 'Venda', 'Dinheiro', 7, 4),
(181, 'Entrada', 'Venda', 'Venda - Empresa BC', '75.00', 1, '2021-05-12', 'Caixa', 'Venda', 'Dinheiro', 7, 5),
(182, 'Entrada', 'Venda', 'Venda - Marlone Silva', '326.99', 1, '2021-05-12', 'Caixa', 'Venda', 'Dinheiro', 7, 6),
(184, 'Saída', 'Despesa', 'Kamila Silva', '60.00', 1, '2021-05-12', 'Caixa', 'Água - Residência', 'Transferência', 7, 34),
(185, 'Entrada', 'Receita', 'Paula Campos', '250.00', 1, '2021-05-12', 'Banco do Brasil', 'Receita', 'Boleto', 7, NULL),
(186, 'Saída', 'Conta à Pagar', ' - Supermercado', '250.00', 1, '2021-05-12', 'Caixa', 'Luz - Empresa', 'Dinheiro', 7, 0),
(187, 'Saída', 'Conta à Pagar', '(Resíduo)  - Kamila Silva', '200.00', 1, '2021-05-12', 'Caixa', 'Aluguel - Despesa Pessoal', 'Dinheiro', 7, 0),
(188, 'Saída', 'Conta à Pagar', ' - Kamila Silva', '150.00', 1, '2021-05-12', 'Caixa', 'Aluguel - Despesa Pessoal', 'Dinheiro', 7, 0),
(189, 'Entrada', 'Conta à Receber', 'Conta Teste', '35.75', 1, '2021-05-12', 'Caixa', 'Venda', 'Dinheiro', 7, 0),
(191, 'Entrada', 'Conta à Receber', 'Parcela 1 - Paula Campos', '200.00', 1, '2021-05-12', 'Cartão de Débito', 'Venda', 'Dinheiro', 7, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `niveis`
--

CREATE TABLE `niveis` (
  `id` int(11) NOT NULL,
  `nivel` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `niveis`
--

INSERT INTO `niveis` (`id`, `nivel`) VALUES
(1, 'Administrador'),
(2, 'Comum');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  `estoque` int(11) NOT NULL,
  `valor_compra` decimal(10,2) NOT NULL,
  `valor_venda` decimal(10,2) NOT NULL,
  `fornecedor` int(11) NOT NULL,
  `categoria` int(11) NOT NULL,
  `foto` varchar(150) DEFAULT NULL,
  `ativo` varchar(5) NOT NULL,
  `lucro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `codigo`, `nome`, `descricao`, `estoque`, `valor_compra`, `valor_venda`, `fornecedor`, `categoria`, `foto`, `ativo`, `lucro`) VALUES
(6, '123', 'Bermuda Jeans', 'Bermuda xxxxxxxx', 0, '0.00', '69.99', 0, 2, '14-04-2021-13-19-01-bermuda.jpg', 'Sim', NULL),
(7, '12345', 'Sapato Social', 'Sapato Social de Couro', 14, '100.00', '150.00', 3, 1, '14-04-2021-13-19-18-cat-6.jpg', 'Sim', 50),
(10, '0236', 'Camisa Polo', 'Camisa Polo Diversos Tamanhos', 125, '25.00', '49.99', 1, 8, '14-04-2021-13-20-29-camisa-masc.jpg', 'Sim', NULL),
(11, '589222', 'Calça Masculina', 'Calça Masculina Jeans', 32, '120.00', '192.00', 3, 3, '14-04-2021-13-21-06-calca-masc.jpg', 'Sim', 60),
(12, '4586223', 'Camisa Feminina', 'Camisa Feminina ', 41, '89.99', '134.99', 3, 8, '14-04-2021-13-24-18-camisa-femin.jpg', 'Sim', 50),
(13, '58555', 'Regata Masculina', 'Camiseta Regata Masculina', 23, '5.00', '50.00', 1, 9, '14-04-2021-13-27-09-regata-masculina.jpg', 'Sim', NULL),
(14, '5855589', 'Regata Feminina', 'Camiseta Feminina', 25, '50.00', '75.00', 1, 9, '14-04-2021-13-28-27-regata-feminina.jpg', 'Sim', 50),
(15, '688955566', 'Sapato Feminino', 'Sapato', 108, '50.00', '210.00', 4, 1, '14-04-2021-13-29-25-sapato-feminino.jpg', 'Sim', 40);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(25) NOT NULL,
  `nivel` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `nivel`) VALUES
(1, 'Hugo Vasconcelos', 'contato@hugocursos.com.br', '123', 'Administrador'),
(4, 'Marcos Silva', 'marcos@hotmail.com', '123', 'Comum'),
(7, 'Admin', 'admin@hotmail.com', '123', 'Administrador');

-- --------------------------------------------------------

--
-- Estrutura da tabela `valor_parcial`
--

CREATE TABLE `valor_parcial` (
  `id` int(11) NOT NULL,
  `id_conta` int(11) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `data` date NOT NULL,
  `usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `valor_parcial`
--

INSERT INTO `valor_parcial` (`id`, `id_conta`, `tipo`, `valor`, `data`, `usuario`) VALUES
(16, 132, 'Pagar', '25.00', '2021-04-21', 1),
(17, 132, 'Pagar', '50.00', '2021-04-21', 1),
(18, 132, 'Pagar', '30.00', '2021-04-21', 1),
(19, 147, 'Pagar', '50.00', '2021-04-21', 1),
(20, 145, 'Pagar', '30.00', '2021-04-21', 1),
(21, 145, 'Pagar', '30.00', '2021-04-21', 1),
(22, 176, 'Pagar', '10.00', '2021-04-21', 1),
(23, 175, 'Pagar', '10.00', '2021-04-21', 1),
(24, 182, 'Pagar', '60.00', '2021-04-21', 1),
(25, 182, 'Pagar', '15.00', '2021-04-21', 1),
(26, 188, 'Pagar', '50.00', '2021-04-21', 1),
(27, 204, 'Pagar', '20.00', '2021-04-21', 1),
(28, 217, 'Pagar', '10.00', '2021-04-21', 1),
(29, 218, 'Pagar', '60.00', '2021-04-21', 1),
(30, 221, 'Pagar', '20.00', '2021-04-21', 1),
(31, 222, 'Pagar', '50.00', '2021-04-21', 1),
(32, 225, 'Pagar', '10.00', '2021-04-21', 1),
(33, 225, 'Pagar', '5.00', '2021-04-21', 1),
(34, 144, 'Pagar', '20.00', '2021-04-21', 1),
(35, 14, 'Pagar', '50.00', '2021-04-22', 1),
(36, 14, 'Pagar', '40.00', '2021-04-22', 1),
(37, 299, 'Pagar', '30.00', '2021-04-22', 1),
(38, 11, 'Pagar', '50.00', '2021-04-22', 1),
(39, 9, 'Pagar', '100.00', '2021-04-22', 1),
(40, 22, 'Pagar', '50.00', '2021-04-22', 1),
(41, 128, 'Pagar', '60.00', '2021-04-26', 1),
(42, 314, 'Pagar', '50.00', '2021-04-27', 1),
(43, 343, 'Pagar', '200.00', '2021-05-12', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `id` int(11) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `usuario` int(11) NOT NULL,
  `pagamento` varchar(50) NOT NULL,
  `lancamento` varchar(50) NOT NULL,
  `data_lanc` date NOT NULL,
  `data_pgto` date NOT NULL,
  `desconto` decimal(8,2) DEFAULT NULL,
  `acrescimo` decimal(8,2) DEFAULT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  `parcelas` int(11) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `cliente` int(11) NOT NULL,
  `valor_custo` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`id`, `valor`, `usuario`, `pagamento`, `lancamento`, `data_lanc`, `data_pgto`, `desconto`, `acrescimo`, `subtotal`, `parcelas`, `status`, `cliente`, `valor_custo`) VALUES
(1, '419.99', 4, 'Dinheiro', 'Caixa', '2021-05-12', '2021-05-12', '0.00', '0.00', '419.99', 1, 'Concluída', 1, '189.99'),
(2, '334.99', 4, 'Dinheiro', 'Caixa', '2021-05-12', '2021-05-12', '10.00', '5.00', '329.99', 1, 'Concluída', 9, '144.99'),
(3, '125.00', 4, 'Dinheiro', 'Caixa', '2021-05-12', '2021-06-12', '0.00', '0.00', '125.00', 3, 'Pendente', 9, '55.00'),
(4, '360.00', 1, 'Dinheiro', 'Caixa', '2021-04-12', '2021-04-12', '10.00', '0.00', '350.00', 1, 'Concluída', 9, '150.00'),
(5, '75.00', 1, 'Dinheiro', 'Caixa', '2021-03-12', '2021-03-12', '0.00', '0.00', '75.00', 1, 'Concluída', 7, '50.00'),
(6, '326.99', 1, 'Dinheiro', 'Caixa', '2021-03-12', '2021-03-12', '0.00', '0.00', '326.99', 1, 'Concluída', 8, '209.99'),
(7, '285.00', 4, 'Dinheiro', 'Caixa', '2021-05-12', '2021-05-12', '0.00', '0.00', '285.00', 1, 'Cancelada', 9, '100.00'),
(8, '755.00', 1, 'Dinheiro', 'Caixa', '2021-05-12', '2021-05-12', '10.00', '0.00', '745.00', 1, 'Cancelada', 9, '105.00'),
(9, '285.00', 1, 'Dinheiro', 'Caixa', '2021-05-12', '2021-06-12', '0.00', '0.00', '285.00', 1, 'Pendente', 8, '100.00'),
(10, '630.00', 1, 'Dinheiro', 'Cartão de Débito', '2021-05-12', '2021-07-12', '30.00', '0.00', '600.00', 3, 'Pendente', 9, '50.00');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `bancarias`
--
ALTER TABLE `bancarias`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `bancos`
--
ALTER TABLE `bancos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `caixa`
--
ALTER TABLE `caixa`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cat_despesas`
--
ALTER TABLE `cat_despesas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cat_produtos`
--
ALTER TABLE `cat_produtos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `contas_despesa`
--
ALTER TABLE `contas_despesa`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `contas_pagar`
--
ALTER TABLE `contas_pagar`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `contas_receber`
--
ALTER TABLE `contas_receber`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `despesas`
--
ALTER TABLE `despesas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `formas_pgtos`
--
ALTER TABLE `formas_pgtos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `frequencias`
--
ALTER TABLE `frequencias`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `itens_compra`
--
ALTER TABLE `itens_compra`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `itens_venda`
--
ALTER TABLE `itens_venda`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `movimentacoes`
--
ALTER TABLE `movimentacoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `niveis`
--
ALTER TABLE `niveis`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `valor_parcial`
--
ALTER TABLE `valor_parcial`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `bancarias`
--
ALTER TABLE `bancarias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `bancos`
--
ALTER TABLE `bancos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `caixa`
--
ALTER TABLE `caixa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `cat_despesas`
--
ALTER TABLE `cat_despesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `cat_produtos`
--
ALTER TABLE `cat_produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `contas_despesa`
--
ALTER TABLE `contas_despesa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de tabela `contas_pagar`
--
ALTER TABLE `contas_pagar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=352;

--
-- AUTO_INCREMENT de tabela `contas_receber`
--
ALTER TABLE `contas_receber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=497;

--
-- AUTO_INCREMENT de tabela `despesas`
--
ALTER TABLE `despesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `formas_pgtos`
--
ALTER TABLE `formas_pgtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `frequencias`
--
ALTER TABLE `frequencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `itens_compra`
--
ALTER TABLE `itens_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de tabela `itens_venda`
--
ALTER TABLE `itens_venda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `movimentacoes`
--
ALTER TABLE `movimentacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT de tabela `niveis`
--
ALTER TABLE `niveis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `valor_parcial`
--
ALTER TABLE `valor_parcial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
