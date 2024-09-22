CREATE DATABASE CRYPTO_DATABASE;
GO

USE CRYPTO_DATABASE;
GO

-- Create tables and indexes
CREATE TABLE Moeda (
    CodigoMoeda VARCHAR(3) PRIMARY KEY,
    Nome VARCHAR(255)
);
GO

CREATE INDEX IDX_Moeda_CodigoMoeda ON Moeda(CodigoMoeda);
GO

CREATE TABLE ParesMoedas (
    CodigoMoedaBase VARCHAR(3),
    CodigoMoedaCotacao VARCHAR(3),
    Valor FLOAT,
    PRIMARY KEY (CodigoMoedaBase, CodigoMoedaCotacao),
    FOREIGN KEY (CodigoMoedaBase) REFERENCES Moeda(CodigoMoeda),
    FOREIGN KEY (CodigoMoedaCotacao) REFERENCES Moeda(CodigoMoeda)
);
GO

CREATE INDEX IDX_ParesMoedas_CodigoMoedaBase_CodigoMoedaCotacao ON ParesMoedas(CodigoMoedaBase, CodigoMoedaCotacao);
GO

CREATE TABLE Corretora (
    CodigoCorretora INT PRIMARY KEY,
    Nome VARCHAR(255)
);
GO

CREATE INDEX IDX_Corretora_CodigoCorretora ON Corretora(CodigoCorretora);
GO

CREATE TABLE Cliente (
    CodigoCliente INT PRIMARY KEY,
    Nome VARCHAR(255),
    Email VARCHAR(255),
    Celular VARCHAR(20),
    PassHash VARCHAR(255),
    MoedaPrincipal VARCHAR(3),
    FOREIGN KEY (MoedaPrincipal) REFERENCES Moeda(CodigoMoeda)
);
GO

CREATE INDEX IDX_Cliente_CodigoCliente ON Cliente(CodigoCliente);
GO

CREATE TABLE Carteira (
    Endereco VARCHAR(255) PRIMARY KEY,
    CodigoCorretora INT,
    CodigoCliente INT,
    FOREIGN KEY (CodigoCorretora) REFERENCES Corretora(CodigoCorretora),
    FOREIGN KEY (CodigoCliente) REFERENCES Cliente(CodigoCliente)
);
GO

CREATE INDEX IDX_Carteira_Endereco ON Carteira(Endereco);
GO

CREATE TABLE ItemCarteira (
    CodigoItemCarteira INT PRIMARY KEY,
    Endereco VARCHAR(255),
    CodigoMoeda VARCHAR(3),
    Quantidade FLOAT,
    FOREIGN KEY (Endereco) REFERENCES Carteira(Endereco),
    FOREIGN KEY (CodigoMoeda) REFERENCES Moeda(CodigoMoeda)
);
GO

CREATE INDEX IDX_ItemCarteira_CodigoItemCarteira ON ItemCarteira(CodigoItemCarteira);
GO
