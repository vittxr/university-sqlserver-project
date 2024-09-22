USE CRYPTO_DATABASE;
GO

-- Seleciona dados de todas as tabelas
SELECT * FROM Moeda;
SELECT * FROM ParesMoedas;
SELECT * FROM Corretora;
SELECT * FROM Cliente;
SELECT * FROM Carteira; 
SELECT * FROM ItemCarteira;
GO

-- Carteira de cada cliente, mostrando o endereço da carteira e sua corretora
CREATE VIEW CarteirasDosClientes AS
SELECT cli.Nome AS ClienteNome, cli.Email, car.Endereco, cor.Nome AS CorretoraNome
FROM Cliente AS cli
LEFT JOIN Carteira AS car
    ON car.CodigoCliente = cli.CodigoCliente
LEFT JOIN Corretora AS cor
    ON cor.CodigoCorretora = car.CodigoCorretora;
GO

-- Quantidade de crypto que cada cliente possui (saldo atual)
CREATE VIEW QuantidadeDeMoedasDosClientes AS
SELECT cli.Nome, icar.CodigoMoeda, SUM(icar.Quantidade) AS qtd_cyptomoedas, SUM(icar.Quantidade * pr.Valor) AS valor_em_reais
FROM Cliente AS cli
LEFT JOIN Carteira AS car
    ON car.CodigoCliente = cli.CodigoCliente
LEFT JOIN ItemCarteira icar 
    ON icar.Endereco = car.Endereco
LEFT JOIN ParesMoedas AS pr
    ON pr.CodigoMoedaBase = icar.CodigoMoeda
GROUP BY cli.Nome, icar.CodigoMoeda;
GO

-- Total em reais que cada cliente possui
CREATE VIEW ValorTotalNaCarteira AS
SELECT cli.Nome, SUM(icar.Quantidade * pr.Valor) AS total
FROM Cliente AS cli
LEFT JOIN Carteira AS car
    ON car.CodigoCliente = cli.CodigoCliente
LEFT JOIN ItemCarteira icar
    ON icar.Endereco = car.Endereco
LEFT JOIN ParesMoedas AS pr
    ON pr.CodigoMoedaBase = icar.CodigoMoeda
GROUP BY cli.Nome;
GO

-- Seleciona dados das views criadas
SELECT * FROM CarteirasDosClientes;
GO

SELECT * FROM QuantidadeDeMoedasDosClientes;
GO

SELECT * FROM ValorTotalNaCarteira;
GO

-- Para deletar as views, use o seguinte comando:
-- DROP VIEW CarteirasDosClientes, QuantidadeDeMoedasDosClientes, ValorTotalNaCarteira;
