USE mydb;

-- VIEW DE ESTOQUE ATUAL POR PRODUTO
CREATE VIEW vw_EstoqueAtual AS
SELECT 
    s.CodSemente,
    s.Nome AS Produto,
    COALESCE(SUM(l.QuantidadeAtual), 0) AS Saldo_Total_Kg,
    COUNT(l.idLote) AS Qtd_Lotes_Ativos
FROM Semente s
LEFT JOIN Lote l ON s.idSemente = l.Semente_idSemente
GROUP BY s.CodSemente, s.Nome;

-- 2. VIEW DE ALERTA DE REPOSIÇÃO
CREATE VIEW vw_AlertaReposicao AS
SELECT 
    s.Nome AS Semente,
    s.EstoqueMinKg AS Minimo_Exigido,
    SUM(l.QuantidadeAtual) AS Estoque_Atual,
    (s.EstoqueMinKg - SUM(l.QuantidadeAtual)) AS Deficit_Kg
FROM Semente s
JOIN Lote l ON s.idSemente = l.Semente_idSemente
GROUP BY s.idSemente, s.Nome, s.EstoqueMinKg
HAVING SUM(l.QuantidadeAtual) < s.EstoqueMinKg;

-- 3. VIEW DE RISCO DE PERDAS POR VENCIMENTO
CREATE VIEW vw_LotesRiscoVencimento AS
SELECT 
    l.idLote,
    s.Nome AS Semente,
    DATE_FORMAT(l.DataValidade, '%d/%m/%Y') AS Validade,
    DATEDIFF(l.DataValidade, CURDATE()) AS Dias_Restantes,
    l.QuantidadeAtual AS Saldo_Kg,
    e.Nome AS Galpao
FROM Lote l
JOIN Semente s ON l.Semente_idSemente = s.idSemente
JOIN Estoque e ON l.Estoque_idEstoque = e.idEstoque
WHERE l.QuantidadeAtual > 0 AND DATEDIFF(l.DataValidade, CURDATE()) <= 365 -- 12 meses
ORDER BY l.DataValidade ASC;

-- 4. VIEW DE VALOR FINANCEIRO EM ESTOQUE
CREATE VIEW vw_ValorEstoqueAtual AS
SELECT 
    s.Nome AS Semente,
    CONCAT('R$ ', FORMAT(SUM(l.QuantidadeAtual * ioc.ValorUnitario), 2, 'de_DE')) AS Valor_Total_Investido
FROM Lote l
JOIN Semente s ON l.Semente_idSemente = s.idSemente
JOIN ItemOrdemCompra ioc ON l.OrdemCompra_idOrdemCompra = ioc.OrdemCompra_idOrdemCompra 
                        AND l.Semente_idSemente = ioc.Semente_idSemente
GROUP BY s.idSemente, s.Nome;

-- 5. VIEW DE DISTRIBUIÇÕES PENDENTES
CREATE VIEW vw_DistribuicoesPendentes AS
SELECT 
    d.idDistribuicao AS ID_Saida,
    DATE_FORMAT(d.DataDist, '%d/%m/%Y') AS Data_Pedido,
    c.RazaoSocial AS Cooperativa_Destino,
    func.Nome AS Tecnico_Solicitante,
    d.Status
FROM Distribuicao d
JOIN Cooperativa c ON d.Cooperativa_idCooperativa = c.idCooperativa
JOIN Funcionario func ON d.Funcionario_idFuncionario = func.idFuncionario
WHERE d.Status = 'Pendente';

-- 6. VIEW DE RANKING DE FORNECEDORES
CREATE VIEW vw_RankingFornecedores AS
SELECT 
    f.RazaoSocial AS Fornecedor,
    COUNT(oc.idOrdemCompra) AS Qtd_Pedidos,
    CONCAT('R$ ', FORMAT(SUM(oc.ValorTotal), 2, 'de_DE')) AS Total_Comprado
FROM Fornecedor f
JOIN OrdemCompra oc ON f.idFornecedor = oc.Fornecedor_idFornecedor
WHERE oc.Status = 'Concluído'
GROUP BY f.idFornecedor, f.RazaoSocial
ORDER BY SUM(oc.ValorTotal) DESC;

-- 7. VIEW DE PRODUTIVIDADE DE FUNCIONÁRIOS
CREATE VIEW vw_ProdutividadeFuncionarios AS
SELECT 
    f.Nome AS Funcionario,
    f.Cargo,
    COUNT(a.idAuditoria) AS Total_Acoes,
    MAX(a.DataHora) AS Ultimo_Acesso
FROM Funcionario f
JOIN Auditoria a ON f.idFuncionario = a.Funcionario_idFuncionario
GROUP BY f.idFuncionario, f.Nome, f.Cargo;

-- 8. VIEW DE ESTOQUE POR GALPÃO
CREATE VIEW vw_EstoquePorGalpao AS
SELECT 
    e.Nome AS Galpao,
    s.Nome AS Semente,
    SUM(l.QuantidadeAtual) AS Total_Armazenado_Kg
FROM Estoque e
JOIN Lote l ON e.idEstoque = l.Estoque_idEstoque
JOIN Semente s ON l.Semente_idSemente = s.idSemente
GROUP BY e.Nome, s.Nome
ORDER BY e.Nome, Total_Armazenado_Kg DESC;

-- 9. VIEW DE COOPERATIVAS INATIVAS
CREATE VIEW vw_CooperativasInativas AS
SELECT 
    c.RazaoSocial AS Cooperativa, c.CNPJ, c.Endereco
FROM Cooperativa c
LEFT JOIN Distribuicao d ON c.idCooperativa = d.Cooperativa_idCooperativa
WHERE d.idDistribuicao IS NULL;

-- 10. VIEW DE PRODUTOS MAIS DEMANDADOS	
CREATE VIEW vw_RankingSaidaProdutos AS
SELECT 
    s.Nome AS Semente,
    SUM(id.QuantidadeKG) AS Total_Distribuido_Kg
FROM ItemDistribuicao id
JOIN Lote l ON id.Lote_idLote = l.idLote
JOIN Semente s ON l.Semente_idSemente = s.idSemente
GROUP BY s.idSemente, s.Nome
ORDER BY Total_Distribuido_Kg DESC;