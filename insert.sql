USE CRYPTO_DATABASE;

-- INSERE DADOS NAS TABELAS
BEGIN TRANSACTION;

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
VALUES (2, 'vitor_carteira', 'ETH', 0.5);
INSERT INTO ItemCarteira (CodigoItemCarteira, Endereco, CodigoMoeda, Quantidade) 
VALUES (3, 'vitor_carteira', 'BTC', 2);
INSERT INTO ItemCarteira (CodigoItemCarteira, Endereco, CodigoMoeda, Quantidade) 
VALUES (4, 'icaro_carteira', 'BTC', 1.0);
INSERT INTO ItemCarteira (CodigoItemCarteira, Endereco, CodigoMoeda, Quantidade) 
VALUES (5, 'icaro_carteira', 'ETH', 10.0);
INSERT INTO ItemCarteira (CodigoItemCarteira, Endereco, CodigoMoeda, Quantidade) 
VALUES (6, 'leo_carteira', 'BTC', 0.5);
INSERT INTO ItemCarteira (CodigoItemCarteira, Endereco, CodigoMoeda, Quantidade) 
VALUES (7, 'alexandre_carteira', 'BTC', 2.0);

-- Confirme as alterações usando COMMIT ou as defaça usando ROLLBACK
COMMIT 
-- ROLLBACK