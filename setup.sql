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

