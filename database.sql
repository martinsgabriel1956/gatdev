-- -------------------------------- --
-- Base de dados do site Gatolândia --
-- -------------------------------- --

-- Apaga o banco de dados caso ele exista
-- ALERTA!!! REMOVA ESTA LINHA APÓS O BANCO ESTAR PRONTO
DROP DATABASE IF EXISTS gatolandia;

-- Cria a base de dados
CREATE DATABASE gatolandia CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Seleciona o banco de dados
USE gatolandia;

-- Cria a tabela contatos
CREATE TABLE contatos (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    data TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    nome VARCHAR(255) NOT NULL, 
    email VARCHAR(255) NOT NULL,
    assunto VARCHAR(255) NOT NULL,
    mensagem TEXT NOT NULL,
    campo1 TEXT COMMENT 'Reservado para uso futuro',
    campo2 TEXT COMMENT 'Reservado para uso futuro',
    status ENUM ('recebido', 'lido', 'respondido', 'apagado') DEFAULT 'recebido'
);

--  Cria a tabela autores
CREATE TABLE autores (
    id_autor INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    apelido VARCHAR(127) NOT NULL COMMENT 'Nome que aparece no artigo.',
    foto VARCHAR(255) COMMENT 'URL da foto',
    resumo TEXT COMMENT 'Um mini currículo',
    email VARCHAR(127) NOT NULL,
    senha VARCHAR(63) NOT NULL COMMENT 'Senha de acesso ao dashboard.',
    nascimento DATE,
    campo1 TEXT COMMENT 'Reservado para uso futuro',
    campo2 TEXT COMMENT 'Reservado para uso futuro',
    campo3 TEXT COMMENT 'Reservado para uso futuro',
    status ENUM ('inativo', 'ativo') DEFAULT 'ativo'
);

-- Cria a tabela categorias
CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(127) NOT NULL
);

-- Cria a tabela de ligação artigos <-> categorias
CREATE TABLE art_cat (
    id_art_cat INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    artigo_id INT NOT NULL,
    categoria_id INT NOT NULL    
);

-- Cria a tabela artigos
CREATE TABLE artigos (
    id_artigo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    titulo VARCHAR(255) NOT NULL,
    imagem VARCHAR(255) COMMENT 'URL da imagem - thumbnail',
    resumo VARCHAR(255) NOT NULL COMMENT 'Resumo do artigo',
    texto LONGTEXT NOT NULL COMMENT 'Texto (HTML) do artigo completo',
    autor_id INT NOT NULL,
    campo1 TEXT COMMENT 'Reservado para uso futuro',
    campo2 TEXT COMMENT 'Reservado para uso futuro',
    campo3 TEXT COMMENT 'Reservado para uso futuro',
    status ENUM ('inativo', 'ativo') DEFAULT 'ativo'
);