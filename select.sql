USE CRYPTO_DATABASE;

-- OBS: Cada view deve ser criada individualmente. A sintaxe do SQL Server não permite que diversos "Create View" sejam executados na mesma execução, mas é possível usar o comando 'GO' que possibilita criar as 3 views em uma única execução. Neste caso, optamos em executar cada uma individualmente.

-- Select de cada tabela.
SELECT * FROM Moeda;
SELECT * FROM ParesMoedas;
SELECT * FROM Corretora;
SELECT * FROM Cliente;
SELECT * FROM Carteira; 
SELECT * FROM ItemCarteira;

-- Carteira de cada cliente, mostrando o endereço da carteira e sua corretora.
CREATE VIEW CarteirasDosClientes AS
SELECT cli.Nome AS ClienteNome, cli.Email, car.Endereco, cor.Nome AS CorretoraNome
FROM Cliente AS cli
LEFT JOIN Carteira AS car
    ON car.CodigoCliente = cli.CodigoCliente
LEFT JOIN Corretora AS cor
    ON cor.CodigoCorretora = car.CodigoCorretora;

-- Quantidade de crypto que cada cliente possui (saldo atual)
CREATE VIEW QuantidadeDeMoedasDosClientes AS
SELECT cli.Nome, icar.CodigoMoeda, SUM(icar.Quantidade) AS qtd_cyptomoedas,  SUM(icar.Quantidade * pr.Valor) AS valor_em_reais
FROM Cliente AS Cli 
LEFT JOIN Carteira AS car
	ON car.CodigoCliente = cli.CodigoCliente
LEFT JOIN ItemCarteira icar 
	ON icar.Endereco = car.Endereco
LEFT JOIN ParesMoedas AS pr
    ON pr.CodigoMoedaBase = icar.CodigoMoeda 	
GROUP BY cli.Nome, icar.CodigoMoeda;

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

-- Select das views
SELECT * FROM CarteirasDosClientes;
SELECT * FROM QuantidadeDeMoedasDosClientes;
SELECT * FROM ValorTotalNaCarteira;

-- Deleta as views
DROP VIEW CarteirasDosClientes, QuantidadeDeMoedasDosClientes, ValorTotalNaCarteira;

