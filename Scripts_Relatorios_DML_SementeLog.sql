USE mydb;


-- 1. RELATÓRIO DE ESTOQUE ATUAL (Saldo Geral por Semente)
-- Somar a quantidade atual de todos os lotes
SELECT 
	s.CodSemente,
    s.Nome AS Produto,
    COALESCE(SUM(L.quantidadeAtual), 0) AS Saldo_Total_Kg,
    COUNT(L.idLote) AS Qtd_Lotes
    
FROM semente s 
JOIN Lote L ON s.idSemente = L.Semente_idSemente
GROUP BY s.CodSemente, s.Nome
ORDER BY Saldo_Total_Kg DESC;

-- 2. ALERTA DE REPOSIÇÃO (Produtos abaixo do Estoque Mínimo)
-- Listar as sementes que precisam de compra urgente.
SELECT 
    s.Nome AS Semente,
    s.EstoqueMinKg AS Minimo_Exigido,
    SUM(l.QuantidadeAtual) AS Estoque_Atual,
    (s.EstoqueMinKg - SUM(l.QuantidadeAtual)) AS Falta_Repor_Kg
FROM Semente s
JOIN Lote l ON s.idSemente = l.Semente_idSemente
GROUP BY s.idSemente, s.Nome, s.EstoqueMinKg
HAVING SUM(l.QuantidadeAtual) < s.EstoqueMinKg;

-- 3 VALIDADE (LOTES VENCENDO EM 12 MESES)
-- Com isso nosso sistema prioriza a distribuição antes que vença algum produto.
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
WHERE l.QuantidadeAtual > 0 
ORDER BY l.DataValidade ASC;

-- 4 DETALHES DE QUEM COMPROU E DE QUEM COMPROU.
-- Emitir relatorio de ordens de compra, mostrando Gestor e Fornecedor.
SELECT 
    oc.idOrdemCompra AS Pedido,
    DATE_FORMAT(oc.DataCompra, '%d/%m/%Y') AS Data,
    forn.RazaoSocial AS Fornecedor,
    func.Nome AS Gestor_Responsavel,
    CONCAT('R$ ', FORMAT(oc.ValorTotal, 2, 'de_DE')) AS Valor_Total,
    oc.Status
FROM OrdemCompra oc
JOIN Fornecedor forn ON oc.Fornecedor_idFornecedor = forn.idFornecedor
JOIN Funcionario func ON oc.Funcionario_idFuncionario = func.idFuncionario
ORDER BY oc.DataCompra DESC;

-- 5 ESSE RELATÓRIO VAI NOS FORNECER QUANTO TEMOS INVESTIDO NO ESTOQUE.
SELECT 
    s.Nome AS Semente,
    SUM(l.QuantidadeAtual) AS Qtd_Estoque,
    CONCAT('R$ ', FORMAT(SUM(l.QuantidadeAtual * ioc.ValorUnitario), 2, 'de_DE')) AS Valor_Investido
FROM Lote l
JOIN Semente s ON l.Semente_idSemente = s.idSemente
JOIN ItemOrdemCompra ioc ON l.OrdemCompra_idOrdemCompra = ioc.OrdemCompra_idOrdemCompra 
                        AND l.Semente_idSemente = ioc.Semente_idSemente
GROUP BY s.idSemente, s.Nome
ORDER BY SUM(l.QuantidadeAtual * ioc.ValorUnitario) DESC;

-- 6 SOLICITAÇÕES DE DISTRIBUIÇÕES AGUARDANDO APROVAÇÃO DO GESTOR
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

-- 7  VERIFICAR OS FORNECEDORES QUE MAIS RECEBERAM VERBAS.

SELECT 
    f.RazaoSocial AS Fornecedor,
    COUNT(oc.idOrdemCompra) AS Qtd_Pedidos,
    CONCAT('R$ ', FORMAT(SUM(oc.ValorTotal), 2, 'de_DE')) AS Total_Comprado
FROM Fornecedor f
JOIN OrdemCompra oc ON f.idFornecedor = oc.Fornecedor_idFornecedor
WHERE oc.Status = 'Concluído'
GROUP BY f.idFornecedor, f.RazaoSocial
ORDER BY SUM(oc.ValorTotal) DESC;

-- 8 VERIFICAR EXATAMENTE QUAIS SEMENTES POSSUÍMOS EM ESTOQUE E OS PREÇOS QUE CADA UMA COMPÕE.
SELECT 
    ioc.OrdemCompra_idOrdemCompra AS Num_Pedido,
    s.Nome AS Semente,
    ioc.QuantidadeKg,
    CONCAT('R$ ', FORMAT(ioc.ValorUnitario, 2, 'de_DE')) AS Valor_Unitario
FROM ItemOrdemCompra ioc
JOIN Semente s ON ioc.Semente_idSemente = s.idSemente
ORDER BY ioc.OrdemCompra_idOrdemCompra;

--  9 AUDITORIA DE PRODUTIVIDADE DE CADA FUNCIONÁRIO 
SELECT 
    f.Nome AS Funcionario,
    f.Cargo,
    COUNT(a.idAuditoria) AS Total_Acoes,
    MAX(a.DataHora) AS Ultimo_Acesso
FROM Funcionario f
JOIN Auditoria a ON f.idFuncionario = a.Funcionario_idFuncionario
GROUP BY f.idFuncionario, f.Nome, f.Cargo
ORDER BY Total_Acoes DESC;

-- 10 CONTROLE DE RASTREABILIDADE DE UM CERTO PRODUTO 
SELECT 
    s.Nome AS Produto,
    c.RazaoSocial AS Destino,
    DATE_FORMAT(d.DataDist, '%d/%m/%Y') AS Data_Saida,
    id.QuantidadeKG
FROM ItemDistribuicao id
JOIN Distribuicao d ON id.Distribuicao_idDistribuicao = d.idDistribuicao
JOIN Lote l ON id.Lote_idLote = l.idLote
JOIN Semente s ON l.Semente_idSemente = s.idSemente
JOIN Cooperativa c ON d.Cooperativa_idCooperativa = c.idCooperativa
WHERE s.Nome LIKE '%Milho%' AND d.Status = 'Concluído'
ORDER BY d.DataDist DESC;

-- 11 A IDEIA NO RELATÓRIO ABAIXO, É CONSULTAR OS LOTES QUE NUNCA TIVERAM BAIXA.

SELECT 
    l.idLote,
    s.Nome AS Semente,
    DATE_FORMAT(l.DataEntrada, '%d/%m/%Y') AS Data_Entrada,
    l.QuantidadeAtual,
    e.Nome AS Local_Estoque
FROM Lote l
JOIN Semente s ON l.Semente_idSemente = s.idSemente
JOIN Estoque e ON l.Estoque_idEstoque = e.idEstoque
WHERE l.idLote NOT IN (SELECT DISTINCT Lote_idLote FROM ItemDistribuicao)
ORDER BY l.DataEntrada ASC;

-- 12 RELATÓRIO DE COMPRA PARA OS GESTORES, EM CASOS DE VALORES REPASSADOS.
-- PODERÁ AJUDAR COM A AUDITORIA, VERIFICAR QUEM GASTA MAIS, ASSIM MANTENDO O CONTROLE.
SELECT
	f.Nome AS Gestor,
    COUNT(oc.idOrdemCompra) AS Qtd_Pedidos_Feitos,
    CONCAT('R$ ', FORMAT(SUM(oc.ValorTotal), 2, 'de_DE')) AS Total_Gasto
FROM Funcionario f
JOIN OrdemCompra oc ON f.idFuncionario = oc.Funcionario_idFuncionario
WHERE f.Cargo LIKE '%Gestor%'
GROUP BY f.idFuncionario, f.Nome
ORDER BY SUM(oc.ValorTotal) DESC;

-- 13 VERIFICAR A DISPONIBILIDADE DE DE CADA PRODUTO E SUAS QUANTIDADES POR ARMAZEM/GALPÃO.
SELECT 
    e.Nome AS Galpao,
    s.Nome AS Semente,
    SUM(l.QuantidadeAtual) AS Total_Armazenado_Kg
FROM Estoque e
JOIN Lote l ON e.idEstoque = l.Estoque_idEstoque
JOIN Semente s ON l.Semente_idSemente = s.idSemente
GROUP BY e.Nome, s.Nome
ORDER BY e.Nome;

-- 14 RANQUEAR OS CUSTOS DE CADA SEMENTE
-- Identificar quais sementes têm o custo de aquisição mais alto (média).
SELECT 
    s.Nome AS Semente,
    CONCAT('R$ ', FORMAT(AVG(ioc.ValorUnitario), 2, 'de_DE')) AS Custo_Medio_Por_Kg
FROM Semente s
JOIN ItemOrdemCompra ioc ON s.idSemente = ioc.Semente_idSemente
GROUP BY s.idSemente, s.Nome
ORDER BY AVG(ioc.ValorUnitario) DESC;

-- 15 IDENTIFICAR AS COOPERATIVAS CADASTRADAS, MAS SEM PEDIDOS (NUNCA RECEBERAM SEMENTES)
SELECT 
    c.RazaoSocial AS Cooperativa, c.CNPJ, c.Endereco
FROM
    Cooperativa c
        LEFT JOIN
    Distribuicao d ON c.idCooperativa = d.Cooperativa_idCooperativa
WHERE
    d.idDistribuicao IS NULL;
    
-- 16 MAIS UM RELATORIO DE AUDITORIA, ONDE É POSSÍVEL VERIFICAR A SAZONALIZADE E QUANTO DE SAÍDA DE SEMENTES EM CADA MÊS.
SELECT 
    YEAR(d.DataDist) AS Ano,
    MONTH(d.DataDist) AS Mes,
    COUNT(d.idDistribuicao) AS Qtd_Saidas,
    SUM(id.QuantidadeKG) AS Volume_Total_Kg_Distribuido
FROM Distribuicao d
JOIN ItemDistribuicao id ON d.idDistribuicao = id.Distribuicao_idDistribuicao
WHERE d.Status = 'Concluído'
GROUP BY YEAR(d.DataDist), MONTH(d.DataDist)
ORDER BY Ano, Mes;

-- 17 VERIFICAR O HISTORICO DE PREÇOS DE FORNECIMENTO POR DISTRIBUIDOR ESPECÍFICO 
SELECT 
    f.RazaoSocial AS Fornecedor,
    s.Nome AS Produto,
    DATE_FORMAT(oc.DataCompra, '%d/%m/%Y') AS Data_Compra,
    CONCAT('R$ ', FORMAT(ioc.ValorUnitario, 2, 'de_DE')) AS Preco_Cobrado
FROM Fornecedor f
JOIN OrdemCompra oc ON f.idFornecedor = oc.Fornecedor_idFornecedor
JOIN ItemOrdemCompra ioc ON oc.idOrdemCompra = ioc.OrdemCompra_idOrdemCompra
JOIN Semente s ON ioc.Semente_idSemente = s.idSemente
WHERE f.idFornecedor = 1 -- Exemplo: Filtrando pelo Fornecedor ID 1
ORDER BY oc.DataCompra DESC;

-- 18 VERIFICAR O PRODUTO QUE MAIS TEM SAÍDA
SELECT 
    s.Nome AS Semente,
    SUM(id.QuantidadeKG) AS Total_Distribuido_Kg
FROM ItemDistribuicao id
JOIN Lote l ON id.Lote_idLote = l.idLote
JOIN Semente s ON l.Semente_idSemente = s.idSemente
GROUP BY s.idSemente, s.Nome
ORDER BY Total_Distribuido_Kg DESC;

-- 19  VERICAR PEDIDOS PENDENTES HÁ MAIS DE 30 DIAS
SELECT 
    oc.idOrdemCompra,
    oc.DataCompra,
    f.Nome AS Gestor,
    oc.Status,
    DATEDIFF(NOW(), oc.DataCompra) AS Dias_Atraso
FROM OrdemCompra oc
JOIN Funcionario f ON oc.Funcionario_idFuncionario = f.idFuncionario
WHERE oc.Status = 'Pendente' 
AND DATEDIFF(NOW(), oc.DataCompra) > 30;

-- 20 RELATÓRIO GERAL, Uma consulta única que traz os totais gerais para o painel do diretor.
SELECT 
    (SELECT COUNT(*) FROM Funcionario) AS Total_Funcionarios,
    (SELECT COUNT(*) FROM Cooperativa) AS Total_Cooperativas,
    (SELECT COUNT(*) FROM Semente) AS Tipos_Sementes,
    (SELECT SUM(QuantidadeAtual) FROM Lote) AS Estoque_Total_Kg,
    (SELECT COUNT(*) FROM OrdemCompra WHERE Status = 'Pendente') AS Compras_Pendentes;