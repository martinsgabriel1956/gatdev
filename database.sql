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

-- Inderção de dados na tabela autores
INSERT INTO autores 
    (nome, apelido,
    foto, resumo,
    email, senha,
    nascimento
) VALUE (
    "Valdinei da Silva Junior", "Junior",
    "https://picsum.photos/id/237/200/300", "Doutor Verinário há 10 anos",
    "silva77@junior.com", "12345",
    "1977-06-18"
);

-- Inserir no mínimo 2 autores:
INSERT INTO autores 
    (nome, apelido,
    foto, resumo,
    email, senha,
    nascimento
) VALUE (
    "Claudio Nascimento", "Nascimento",
    "https://picsum.photos/id/237/199/300", "Estudante de Medicina Veterinaria",
    "claudio97@br.com", "54321",
    "1997-12-29"
);

INSERT INTO autores 
    (nome, apelido,
    foto, resumo,
    email, senha,
    nascimento
) VALUE (
    "Ana Lima", "Aninha",
    "https://picsum.photos/id/237/200/301", "Dona de Petshop e amante desses anjos",
    "ani94nha@pets.com", "13542",
    "1994-04-16"
);

INSERT INTO autores 
    (nome, apelido,
    foto, resumo,
    email, senha,
    nascimento
) VALUE (
    "Renata Martins", "Re",
    "https://picsum.photos/id/237/201/301", "Recepcionista de Petshop",
    "cats02@re.com", "24531",
    "2002-01-07"
);

INSERT INTO autores 
    (nome, apelido,
    foto, resumo,
    email, senha,
    nascimento
) VALUE (
    "Sandro Silva", "Sandrin",
    "https://picsum.photos/id/237/199/299", "Formado em Medicina Veterinário há um mês",
    "silva@77sandrin.com", "41523",
    "1977-11-30"
);

INSERT INTO autores 
    (nome, apelido,
    foto, resumo,
    email, senha,
    nascimento
) VALUE (
    "Simone Lacerda", "Sisa",
    "https://picsum.photos/id/237/198/300", "Cuidador de Pets",
    "85sisa@mone.com", "35241",
    "1985-03-01"
);

-- Cria a tabela categorias
CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(127) NOT NULL
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
    status ENUM ('inativo', 'ativo') DEFAULT 'ativo',

-- Chave Estrangeira do Autor
    FOREIGN KEY (autor_id) REFERENCES autores (id_autor)
);

-- Cria a tabela de ligação artigos <-> categorias
CREATE TABLE art_cat (
    id_art_cat INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    artigo_id INT NOT NULL,
    categoria_id INT NOT NULL,

-- Chave Estrangeira do Artigo
    FOREIGN KEY (artigo_id) REFERENCES artigos (id_artigo),  
-- Chave Estrangeira da Categoria
    FOREIGN KEY (categoria_id) REFERENCES categorias (id_categoria)  
);