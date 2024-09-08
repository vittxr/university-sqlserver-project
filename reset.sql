-- RESET 
-- OBS: Para resetar o banco de dados, excluindo todas as tabelas, é preciso rodar o bloco abaixo TRÊS VEZES (porque há erro ao excluir algumas tabelas se tiver uma chave estrangeira referenciada, apenas após a exclusão da tabela onde essa chave estrangeira se encontra for excluída que é possível deletar a tabela)
DECLARE @sql NVARCHAR(MAX) = N'';
SET @sql = N'';
SELECT @sql += N'DROP TABLE [' + s.name + N'].[' + t.name + N'];' + CHAR(13)
FROM sys.tables t
JOIN sys.schemas s ON t.schema_id = s.schema_id;
EXEC sp_executesql @sql;