-- SELECT 
SELECT * FROM Moeda;
SELECT * FROM ParesMoedas;
SELECT * FROM Corretora;
SELECT * FROM Cliente;
SELECT * FROM Carteira; 
SELECT * FROM ItemCarteira;

-- Quantidade de moedas de cada cliente.
SELECT cli.nome, icar.CodigoMoeda, icar.quantidade
FROM Cliente as cli
LEFT JOIN Carteira as car
	ON car.CodigoCliente = cli.CodigoCliente
LEFT JOIN ItemCarteira as icar
	ON icar.Endereco = car.Endereco;