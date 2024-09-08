CREATE DATABASE CRYPTO_DATABASE;
USE CRYPTO_DATABASE;

-- CRIA TABELAS E INDICES
CREATE TABLE Moeda (
    CodigoMoeda VARCHAR(3) PRIMARY KEY,
    Nome VARCHAR(255)
);
CREATE INDEX IDX_Moeda_CodigoMoeda ON Moeda(CodigoMoeda);

CREATE TABLE ParesMoedas (
    CodigoMoedaBase VARCHAR(3),
    CodigoMoedaCotacao VARCHAR(3),
    Valor FLOAT,
    PRIMARY KEY (CodigoMoedaBase, CodigoMoedaCotacao),
    FOREIGN KEY (CodigoMoedaBase) REFERENCES Moeda(CodigoMoeda),
    FOREIGN KEY (CodigoMoedaCotacao) REFERENCES Moeda(CodigoMoeda)
);
CREATE INDEX IDX_ParesMoedas_CodigoMoedaBase_CodigoMoedaCotacao ON ParesMoedas(CodigoMoedaBase, CodigoMoedaCotacao);

CREATE TABLE Corretora (
    CodigoCorretora INT PRIMARY KEY,
    Nome VARCHAR(255)
);
CREATE INDEX IDX_Corretora_CodigoCorretora ON Corretora(CodigoCorretora);

CREATE TABLE Cliente (
    CodigoCliente INT PRIMARY KEY,
    Nome VARCHAR(255),
    Email VARCHAR(255),
    Celular VARCHAR(20),
    PassHash VARCHAR(255),
    MoedaPrincipal VARCHAR(3),
    FOREIGN KEY (MoedaPrincipal) REFERENCES Moeda(CodigoMoeda)
);
CREATE INDEX IDX_Cliente_CodigoCliente ON Cliente(CodigoCliente);

CREATE TABLE Carteira (
    Endereco VARCHAR(255) PRIMARY KEY,
    CodigoCorretora INT,
    CodigoCliente INT,
    FOREIGN KEY (CodigoCorretora) REFERENCES Corretora(CodigoCorretora),
    FOREIGN KEY (CodigoCliente) REFERENCES Cliente(CodigoCliente)
);
CREATE INDEX IDX_Carteira_Endereco ON Carteira(Endereco);

CREATE TABLE ItemCarteira (
    CodigoItemCarteira INT PRIMARY KEY,
    Endereco VARCHAR(255),
    CodigoMoeda VARCHAR(3),
    Quantidade FLOAT,
    FOREIGN KEY (Endereco) REFERENCES Carteira(Endereco),
    FOREIGN KEY (CodigoMoeda) REFERENCES Moeda(CodigoMoeda)
);
CREATE INDEX IDX_ItemCarteira_CodigoItemCarteira ON ItemCarteira(CodigoItemCarteira);

-- INSERE DADOS NAS TABELAS
INSERT INTO Moeda (CodigoMoeda, Nome) VALUES ('BTC', 'Bitcoin');
INSERT INTO Moeda (CodigoMoeda, Nome) VALUES ('ETH', 'Ethereum');
INSERT INTO Moeda (CodigoMoeda, Nome) VALUES ('BRL', 'Brazilian Real');

INSERT INTO ParesMoedas (CodigoMoedaBase, CodigoMoedaCotacao, Valor) VALUES ('BTC', 'BRL', 322156.60);
INSERT INTO ParesMoedas (CodigoMoedaBase, CodigoMoedaCotacao, Valor) VALUES ('ETH', 'BRL', 13616.22);

INSERT INTO Corretora (CodigoCorretora, Nome) VALUES (1, 'Nuinvest');
INSERT INTO Corretora (CodigoCorretora, Nome) VALUES (2, 'Binance');
INSERT INTO Corretora (CodigoCorretora, Nome) VALUES (3, 'XP Investimentos');

INSERT INTO Cliente (CodigoCliente, Nome, Email, Celular, PassHash, MoedaPrincipal) 
VALUES (1, 'Vitor', 'vitor@example.com', '1234567890', HASHBYTES('MD5', 'senha123'), 'BTC');
INSERT INTO Cliente (CodigoCliente, Nome, Email, Celular, PassHash, MoedaPrincipal) 
VALUES (2, 'Icaro', 'icaro@example.com', '0987654321',  HASHBYTES('MD5', 'senha456'), 'ETH');
INSERT INTO Cliente (CodigoCliente, Nome, Email, Celular, PassHash, MoedaPrincipal) 
VALUES (3, 'Leonador', 'leo@example.com', '5555555555',  HASHBYTES('MD5', 'senha789'), 'BTC');
INSERT INTO Cliente (CodigoCliente, Nome, Email, Celular, PassHash, MoedaPrincipal) 
VALUES (4, 'Alexandre', 'leo@example.com', '5555555555',  HASHBYTES('MD5', 'senha789'), 'BTC');

INSERT INTO Carteira (Endereco, CodigoCorretora, CodigoCliente) 
VALUES ('vitor_carteira', 1, 1);
INSERT INTO Carteira (Endereco, CodigoCorretora, CodigoCliente) 
VALUES ('icaro_carteira', 2, 2);
INSERT INTO Carteira (Endereco, CodigoCorretora, CodigoCliente) 
VALUES ('leo_carteira', 3, 3);
INSERT INTO Carteira (Endereco, CodigoCorretora, CodigoCliente) 
VALUES ('alexandre_carteira', 3, 4);

INSERT INTO ItemCarteira (CodigoItemCarteira, Endereco, CodigoMoeda, Quantidade) 
VALUES (1, 'vitor_carteira', 'BTC', 1.5);
INSERT INTO ItemCarteira (CodigoItemCarteira, Endereco, CodigoMoeda, Quantidade) 
VALUES (2, 'icaro_carteira', 'ETH', 10.0);
INSERT INTO ItemCarteira (CodigoItemCarteira, Endereco, CodigoMoeda, Quantidade) 
VALUES (3, 'leo_carteira', 'BTC', 0.5);
INSERT INTO ItemCarteira (CodigoItemCarteira, Endereco, CodigoMoeda, Quantidade) 
VALUES (4, 'alexandre_carteira', 'BTC', 2.0);
