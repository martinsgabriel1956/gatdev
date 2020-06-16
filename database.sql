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

-- Inserção de dados na tabela autores
INSERT INTO `autores` 
    (`id_autor`, `nome`, `apelido`,
    `foto`, `resumo`,`email`,
     `senha`,`nascimento`, `campo1`,
     `campo2`, `campo3`, `status`

) VALUE (
    1, 'Valdinei da Silva Junior', 'Junior',
    'https://picsum.photos/id/237/200/300', 'Doutor Verinário há 10 anos', 'silva77@junior.com',
    '12345','1977-06-18', NULL,
      NULL, NULL, 'ativo'
),

(
    2, 'Claudio Nascimento', 'Nascimento',
    'https://picsum.photos/id/237/199/300', 'Estudante de Medicina Veterinaria','claudio97@br.com',
    '54321','1997-12-29', NULL,
    NULL, NULL, 'ativo'
),

(
    3, 'Ana Lima', 'Aninha',
    'https://picsum.photos/id/237/200/301', 'Dona de Petshop e amante desses anjos','ani94nha@pets.com',
    '13542', '1994-04-16', NULL,
    NULL, NULL, 'ativo'
),

(
    4, 'Renata Martins', 'Re',
    'https://picsum.photos/id/237/201/301', 'Recepcionista de Petshop','cats02@re.com',
    '24531', '2002-01-07', NULL,
    NULL, NULL, 'ativo'
),

(
    5, 'Sandro Silva', 'Sandrin',
    'https://picsum.photos/id/237/199/299', 'Formado em Medicina Veterinário há um mês', 'silva@77sandrin.com',
    '41523', '1977-11-30', NULL,
    NULL, NULL, 'ativo'
    ),

(
    6, 'Simone Lacerda', 'Sisa',
    'https://picsum.photos/id/237/198/300', 'Cuidador de Pets', '85sisa@mone.com',
    '35241', '1985-03-01', NULL,
    NULL, NULL, 'ativo'
);

-- Cria a tabela categorias
CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(127) NOT NULL
);

-- Inserção de dados da tabela "categorias"
    INSERT INTO `categorias` (`id_categoria`,`nome`) VALUES (1, 'Raças'),(2, 'Pelagem'),(3, 'Curiosidades'),(4, 'Gênero'),(5, 'Tamanho'),(6, 'Peso');

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

-- Inserção de dados na tabela "artigos"
INSERT INTO `artigos` (
    `id_artigo`, `data`, `titulo`,
    `imagem`, `resumo`, `texto`,
    `autor_id`, `campo1`, `campo2`,
    `campo3`, `status`
) VALUES (
    1, '2020-06-15 20:01:0', 'Primeiro Artigo',
    'https://picsum.photos/200','Resumo do Primeiro Artigo', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur facilisis sapien vel ultrices molestie. Phasellus ut tellus feugiat, tincidunt orci in, lobortis urna. Morbi eu efficitur lectus. Nullam eleifend tellus quis consequat hendrerit. Vivamus nec hendrerit nibh. Nam auctor viverra lacus ut lobortis. In odio eros, semper a tellus eget, facilisis faucibus nulla.</p>\r\n<a href=\"http://luferat.net/\">Site do Fessô</a>\r\n<p lang=\"en\">Nullam scelerisque nisi est, a tincidunt nulla dictum vitae. Integer tincidunt felis lectus, eu sollicitudin mauris euismod vel. Aenean consectetur, arcu quis feugiat convallis, quam quam sollicitudin quam, in aliquet nulla ipsum et est. Donec in maximus magna, rutrum pretium augue. Donec quis pretium dui. Nulla tempor a velit eu finibus. Donec egestas ante vitae odio ultrices, vel egestas odio auctor. Nullam dictum lacus ut augue tempor ornare. Aenean vel nisl sit amet quam lobortis tempor. Ut id bibendum urna, at cursus justo. Quisque nisi risus, egestas in mi in, semper varius ipsum. Sed euismod bibendum pellentesque.</p>\r\n<img class=\"responsivo\" src=\"https://picsum.photos/400/300\" alt=\"Imagem aleatória\">\r\n<p>Donec efficitur posuere commodo. Nulla in metus eu risus suscipit dignissim. Donec purus velit, varius nec placerat quis, gravida id velit. Vestibulum eget sodales metus. Sed rhoncus tellus augue, sit amet ultricies erat convallis vitae.</p>\r\n<p>Sed tincidunt ipsum justo, quis tempus enim tempus sed. Proin nisi nisi, commodo vel sollicitudin quis, efficitur ut purus. In hac habitasse platea dictumst. Curabitur hendrerit justo dolor, ac consequat nisi imperdiet ut. Nam in diam vel dolor viverra ultricies vel vel metus. Etiam semper luctus augue ac pellentesque. Nulla mi nisl, eleifend et aliquam eu, mattis vitae ligula.</p>',
    1, NULL, NULL,
    NULL, 'ativo'
    ),
    
(
    2, '2019-05-30 17:50:6', 'Aprenda a cuidar do seu gato',
    'https://picsum.photos/199', 'Resumo do artigo Aprenda a cuidar do seu gato', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur facilisis sapien vel ultrices molestie. Phasellus ut tellus feugiat, tincidunt orci in, lobortis urna. Morbi eu efficitur lectus. Nullam eleifend tellus quis consequat hendrerit. Vivamus nec hendrerit nibh. Nam auctor viverra lacus ut lobortis. In odio eros, semper a tellus eget, facilisis faucibus nulla.</p>\r\n<a href=\"http://luferat.net/\">Site do Fessô</a>\r\n<p lang=\"en\">Nullam scelerisque nisi est, a tincidunt nulla dictum vitae. Integer tincidunt felis lectus, eu sollicitudin mauris euismod vel. Aenean consectetur, arcu quis feugiat convallis, quam quam sollicitudin quam, in aliquet nulla ipsum et est. Donec in maximus magna, rutrum pretium augue. Donec quis pretium dui. Nulla tempor a velit eu finibus. Donec egestas ante vitae odio ultrices, vel egestas odio auctor. Nullam dictum lacus ut augue tempor ornare. Aenean vel nisl sit amet quam lobortis tempor. Ut id bibendum urna, at cursus justo. Quisque nisi risus, egestas in mi in, semper varius ipsum. Sed euismod bibendum pellentesque.</p>\r\n<img class=\"responsivo\" src=\"https://picsum.photos/400/300\" alt=\"Imagem aleatória\">\r\n<p>Donec efficitur posuere commodo. Nulla in metus eu risus suscipit dignissim. Donec purus velit, varius nec placerat quis, gravida id velit. Vestibulum eget sodales metus. Sed rhoncus tellus augue, sit amet ultricies erat convallis vitae.</p>\r\n<p>Sed tincidunt ipsum justo, quis tempus enim tempus sed. Proin nisi nisi, commodo vel sollicitudin quis, efficitur ut purus. In hac habitasse platea dictumst. Curabitur hendrerit justo dolor, ac consequat nisi imperdiet ut. Nam in diam vel dolor viverra ultricies vel vel metus. Etiam semper luctus augue ac pellentesque. Nulla mi nisl, eleifend et aliquam eu, mattis vitae ligula.</p>',
    2, NULL, NULL,
    NULL, 'ativo' 
    ),

(
    3, '2020-04-18 04:30:4', 'Gatos são mais espertos do que aparentam',
    'https://picsum.photos/198', 'Resumo do artigo Gatos são mais espertos do que aparentam','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur facilisis sapien vel ultrices molestie. Phasellus ut tellus feugiat, tincidunt orci in, lobortis urna. Morbi eu efficitur lectus. Nullam eleifend tellus quis consequat hendrerit. Vivamus nec hendrerit nibh. Nam auctor viverra lacus ut lobortis. In odio eros, semper a tellus eget, facilisis faucibus nulla.</p>\r\n<a href=\"http://luferat.net/\">Site do Fessô</a>\r\n<p lang=\"en\">Nullam scelerisque nisi est, a tincidunt nulla dictum vitae. Integer tincidunt felis lectus, eu sollicitudin mauris euismod vel. Aenean consectetur, arcu quis feugiat convallis, quam quam sollicitudin quam, in aliquet nulla ipsum et est. Donec in maximus magna, rutrum pretium augue. Donec quis pretium dui. Nulla tempor a velit eu finibus. Donec egestas ante vitae odio ultrices, vel egestas odio auctor. Nullam dictum lacus ut augue tempor ornare. Aenean vel nisl sit amet quam lobortis tempor. Ut id bibendum urna, at cursus justo. Quisque nisi risus, egestas in mi in, semper varius ipsum. Sed euismod bibendum pellentesque.</p>\r\n<img class=\"responsivo\" src=\"https://picsum.photos/400/300\" alt=\"Imagem aleatória\">\r\n<p>Donec efficitur posuere commodo. Nulla in metus eu risus suscipit dignissim. Donec purus velit, varius nec placerat quis, gravida id velit. Vestibulum eget sodales metus. Sed rhoncus tellus augue, sit amet ultricies erat convallis vitae.</p>\r\n<p>Sed tincidunt ipsum justo, quis tempus enim tempus sed. Proin nisi nisi, commodo vel sollicitudin quis, efficitur ut purus. In hac habitasse platea dictumst. Curabitur hendrerit justo dolor, ac consequat nisi imperdiet ut. Nam in diam vel dolor viverra ultricies vel vel metus. Etiam semper luctus augue ac pellentesque. Nulla mi nisl, eleifend et aliquam eu, mattis vitae ligula.</p>',
    3, NULL, NULL,
    NULL, 'ativo'
    ),
    
(
    4, '2020-02-26 09:24:16', 'Comunicação com gatos', 
    'https://picsum.photos/201', 'Resumo do artigo Comunicação com gatos', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur facilisis sapien vel ultrices molestie. Phasellus ut tellus feugiat, tincidunt orci in, lobortis urna. Morbi eu efficitur lectus. Nullam eleifend tellus quis consequat hendrerit. Vivamus nec hendrerit nibh. Nam auctor viverra lacus ut lobortis. In odio eros, semper a tellus eget, facilisis faucibus nulla.</p>\r\n<a href=\"http://luferat.net/\">Site do Fessô</a>\r\n<p lang=\"en\">Nullam scelerisque nisi est, a tincidunt nulla dictum vitae. Integer tincidunt felis lectus, eu sollicitudin mauris euismod vel. Aenean consectetur, arcu quis feugiat convallis, quam quam sollicitudin quam, in aliquet nulla ipsum et est. Donec in maximus magna, rutrum pretium augue. Donec quis pretium dui. Nulla tempor a velit eu finibus. Donec egestas ante vitae odio ultrices, vel egestas odio auctor. Nullam dictum lacus ut augue tempor ornare. Aenean vel nisl sit amet quam lobortis tempor. Ut id bibendum urna, at cursus justo. Quisque nisi risus, egestas in mi in, semper varius ipsum. Sed euismod bibendum pellentesque.</p>\r\n<img class=\"responsivo\" src=\"https://picsum.photos/400/300\" alt=\"Imagem aleatória\">\r\n<p>Donec efficitur posuere commodo. Nulla in metus eu risus suscipit dignissim. Donec purus velit, varius nec placerat quis, gravida id velit. Vestibulum eget sodales metus. Sed rhoncus tellus augue, sit amet ultricies erat convallis vitae.</p>\r\n<p>Sed tincidunt ipsum justo, quis tempus enim tempus sed. Proin nisi nisi, commodo vel sollicitudin quis, efficitur ut purus. In hac habitasse platea dictumst. Curabitur hendrerit justo dolor, ac consequat nisi imperdiet ut. Nam in diam vel dolor viverra ultricies vel vel metus. Etiam semper luctus augue ac pellentesque. Nulla mi nisl, eleifend et aliquam eu, mattis vitae ligula.</p>',
    4, NULL, NULL,
    NULL, 'ativo'
    ),
    
(
    5, '2020-01-11 22:04:9', 'Eles são mais carinhosos do que aparentam',
    'https://picsum.photos/202', 'Resumo do artigo Eles são mais carinhosos do que aparentam','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur facilisis sapien vel ultrices molestie. Phasellus ut tellus feugiat, tincidunt orci in, lobortis urna. Morbi eu efficitur lectus. Nullam eleifend tellus quis consequat hendrerit. Vivamus nec hendrerit nibh. Nam auctor viverra lacus ut lobortis. In odio eros, semper a tellus eget, facilisis faucibus nulla.</p>\r\n<a href=\"http://luferat.net/\">Site do Fessô</a>\r\n<p lang=\"en\">Nullam scelerisque nisi est, a tincidunt nulla dictum vitae. Integer tincidunt felis lectus, eu sollicitudin mauris euismod vel. Aenean consectetur, arcu quis feugiat convallis, quam quam sollicitudin quam, in aliquet nulla ipsum et est. Donec in maximus magna, rutrum pretium augue. Donec quis pretium dui. Nulla tempor a velit eu finibus. Donec egestas ante vitae odio ultrices, vel egestas odio auctor. Nullam dictum lacus ut augue tempor ornare. Aenean vel nisl sit amet quam lobortis tempor. Ut id bibendum urna, at cursus justo. Quisque nisi risus, egestas in mi in, semper varius ipsum. Sed euismod bibendum pellentesque.</p>\r\n<img class=\"responsivo\" src=\"https://picsum.photos/400/300\" alt=\"Imagem aleatória\">\r\n<p>Donec efficitur posuere commodo. Nulla in metus eu risus suscipit dignissim. Donec purus velit, varius nec placerat quis, gravida id velit. Vestibulum eget sodales metus. Sed rhoncus tellus augue, sit amet ultricies erat convallis vitae.</p>\r\n<p>Sed tincidunt ipsum justo, quis tempus enim tempus sed. Proin nisi nisi, commodo vel sollicitudin quis, efficitur ut purus. In hac habitasse platea dictumst. Curabitur hendrerit justo dolor, ac consequat nisi imperdiet ut. Nam in diam vel dolor viverra ultricies vel vel metus. Etiam semper luctus augue ac pellentesque. Nulla mi nisl, eleifend et aliquam eu, mattis vitae ligula.</p>',
    5, NULL, NULL,
    NULL, 'ativo' 
    ),
    
(
    6, '2020-03-15 23:59:59', '10 Segredos sobre gatos que provavelmente vocês não sabiam',
    'https://picsum.photos/200', 'Resumo do artigo 10 Segredos sobre gatos que provavelmente vocês não sabiam', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur facilisis sapien vel ultrices molestie. Phasellus ut tellus feugiat, tincidunt orci in, lobortis urna. Morbi eu efficitur lectus. Nullam eleifend tellus quis consequat hendrerit. Vivamus nec hendrerit nibh. Nam auctor viverra lacus ut lobortis. In odio eros, semper a tellus eget, facilisis faucibus nulla.</p>\r\n<a href=\"http://luferat.net/\">Site do Fessô</a>\r\n<p lang=\"en\">Nullam scelerisque nisi est, a tincidunt nulla dictum vitae. Integer tincidunt felis lectus, eu sollicitudin mauris euismod vel. Aenean consectetur, arcu quis feugiat convallis, quam quam sollicitudin quam, in aliquet nulla ipsum et est. Donec in maximus magna, rutrum pretium augue. Donec quis pretium dui. Nulla tempor a velit eu finibus. Donec egestas ante vitae odio ultrices, vel egestas odio auctor. Nullam dictum lacus ut augue tempor ornare. Aenean vel nisl sit amet quam lobortis tempor. Ut id bibendum urna, at cursus justo. Quisque nisi risus, egestas in mi in, semper varius ipsum. Sed euismod bibendum pellentesque.</p>\r\n<img class=\"responsivo\" src=\"https://picsum.photos/400/300\" alt=\"Imagem aleatória\">\r\n<p>Donec efficitur posuere commodo. Nulla in metus eu risus suscipit dignissim. Donec purus velit, varius nec placerat quis, gravida id velit. Vestibulum eget sodales metus. Sed rhoncus tellus augue, sit amet ultricies erat convallis vitae.</p>\r\n<p>Sed tincidunt ipsum justo, quis tempus enim tempus sed. Proin nisi nisi, commodo vel sollicitudin quis, efficitur ut purus. In hac habitasse platea dictumst. Curabitur hendrerit justo dolor, ac consequat nisi imperdiet ut. Nam in diam vel dolor viverra ultricies vel vel metus. Etiam semper luctus augue ac pellentesque. Nulla mi nisl, eleifend et aliquam eu, mattis vitae ligula.</p>',
    6, NULL, NULL,
    NULL, 'ativo'
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

-- Insere dados na tabela 'art_cat'
    INSERT INTO `art_cat` (`id_art_cat`,`artigo_id`, `categoria_id`) VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,2),(5,2,3),(6,2,4),(7,3,1),(8,3,3),(9,3,4),(10,4,1),(11,4,3),(12,5,1),(13,5,3),(14,5,4),(15,6,1),(16,6,3);