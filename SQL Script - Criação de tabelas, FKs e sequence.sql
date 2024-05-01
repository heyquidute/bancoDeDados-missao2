-- Criação das tabelas
CREATE TABLE Usuarios (
	id_usuario int PRIMARY KEY NOT NULL,
	login_usuario varchar (15) NOT NULL,
	senha varchar (15) NOT NULL
);

CREATE TABLE Pessoas (
	id_pessoa int default next value for seq_pessoa PRIMARY KEY NOT NULL,
	nome varchar (200) NOT NULL,
	logradouro varchar (200) NOT NULL,
	cidade varchar (200) NOT NULL,
	estado char (2) NOT NULL,
	telefone varchar (11) NOT NULL,
	email varchar (200) NOT NULL
);

CREATE TABLE Pessoas_Fisicas (
	id_pFisica int PRIMARY KEY NOT NULL,
	id_pessoa int NOT NULL,
	cpf varchar (11)
);

CREATE TABLE Pessoas_Juridicas (
	id_pJuridica int PRIMARY KEY NOT NULL,
	id_pessoa int NOT NULL,
	cnpj varchar (14)
);

CREATE TABLE Produtos (
	id_produto int PRIMARY KEY NOT NULL,
	nome_produto varchar (200) NOT NULL,
	quantidade_produto int NOT NULL,
	valor_produto numeric(10,2) NOT NULL
);

CREATE TABLE Movimentos (
	id_movimento int PRIMARY KEY NOT NULL,
	id_usuario int NOT NULL,
	id_pessoa int NOT NULL,
	id_produto int NOT NULL,
	quantidade int NOT NULL,
	tipo char (1) NOT NULL,
	valor_unidade numeric(10,2) NOT NULL
)

-- Definir uma sequence para geração dos identificadores de pessoa, dado o relacionamento 1x1 com pessoa física ou jurídica.
CREATE SEQUENCE seq_pessoa AS INT
	START WITH 1
	INCREMENT BY 1;

-- (FK) P. Físicas x Pessoas
ALTER TABLE Pessoas_Fisicas
	ADD CONSTRAINT fk_PPFisica FOREIGN KEY (id_pessoa) REFERENCES Pessoas (id_pessoa);

-- (FK) P. Jurídica x Pessoas
ALTER TABLE Pessoas_Juridicas
	ADD CONSTRAINT fk_PPJuridica FOREIGN KEY (id_pessoa) REFERENCES Pessoas (id_pessoa);

-- (FK) Movimentos x Usuarios
ALTER TABLE Movimentos
	ADD CONSTRAINT fk_MovUsuario FOREIGN KEY (id_usuario) REFERENCES Usuarios (id_usuario);

-- (FK) Movimentos x Pessoas
ALTER TABLE Movimentos
	ADD CONSTRAINT fk_MovPessoa FOREIGN KEY (id_pessoa) REFERENCES Pessoas (id_pessoa);

-- (FK) Movimentos x Produto
ALTER TABLE Movimentos
	ADD CONSTRAINT fk_MovProduto FOREIGN KEY (id_produto) REFERENCES Produtos (id_produto);

-- ALIMENTANDO A BASE

-- Tb. Usuarios
INSERT INTO Usuarios (id_usuario, login_usuario, senha)
	VALUES (1, 'op1', 'op1');
INSERT INTO Usuarios (id_usuario, login_usuario, senha)
	VALUES (2, 'op2', 'op2');
INSERT INTO Usuarios (id_usuario, login_usuario, senha)
	VALUES (3, 'op3', 'op3');

-- Tb. Produtos
INSERT INTO Produtos (id_produto, nome_produto, quantidade_produto, valor_produto)
	VALUES (1, 'Banana', 100, 5)
INSERT INTO Produtos(id_produto, nome_produto, quantidade_produto, valor_produto)
	VALUES (3, 'Laranja', 500, 2)
INSERT INTO Produtos(id_produto, nome_produto, quantidade_produto, valor_produto)
	VALUES (4, 'Manga', 800, 4)

-- Tb. Pessoas
INSERT INTO Pessoas (nome, logradouro, cidade, estado, telefone, email)
	VALUES ('Joao', 'Rua 12, casa 3, Quitanda', 'Riacho do Sul', 'PA', '1111-1111', 'joao@riacho.com')
INSERT INTO Pessoas (nome, logradouro, cidade, estado, telefone, email)
	VALUES ('JCC', 'Rua 11, Centro', 'Riacho do Norte', 'PA', '1212-1212', 'jcc@riacho.com')

-- Tb. Pessoas_Fisicas
INSERT INTO Pessoas_Fisicas (id_pFisica, id_pessoa, cpf)
	VALUES ('1','1','11111111111')

-- Tb. Pessoas_Juridicas
INSERT INTO Pessoas_Juridicas(id_pJuridica, id_pessoa, cnpj)
	VALUES ('1','2','22222222222222')

-- Tb. Movimentos
INSERT INTO Movimentos (id_movimento, id_usuario, id_pessoa, id_produto, quantidade, tipo, valor_unidade)
	VALUES (1,1,1,1,20,'S',4)
INSERT INTO Movimentos (id_movimento, id_usuario, id_pessoa, id_produto, quantidade, tipo, valor_unidade)
	VALUES (4,1,1,3,15,'S',2)
INSERT INTO Movimentos (id_movimento, id_usuario, id_pessoa, id_produto, quantidade, tipo, valor_unidade)
	VALUES (5,2,1,3,10,'S',3)
INSERT INTO Movimentos (id_movimento, id_usuario, id_pessoa, id_produto, quantidade, tipo, valor_unidade)
	VALUES (7,1,2,3,15,'E',5)
INSERT INTO Movimentos (id_movimento, id_usuario, id_pessoa, id_produto, quantidade, tipo, valor_unidade)
	VALUES (8,1,2,4,20,'E',4)




select * from Pessoas
select * from Pessoas_Fisicas
select * from Pessoas_Juridicas
select * from Movimentos
select * from Produtos
select * from Usuarios