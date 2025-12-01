USE mydb;

-- TESTE DAS TRIGGERS 

-- 1. Testando Trigger 1 (Novo Funcionário)
INSERT INTO Funcionario (Nome, Matricula, Cargo, Usuario, Senha) 
VALUES ('Teste Trigger', 'T9999', 'Auditor', 'teste.trigger', '123');

-- 2. Testando Trigger 2 (Update Funcionário)
UPDATE Funcionario SET Cargo = 'Auditor Senior' WHERE Usuario = 'teste.trigger';

-- 3. Testando Trigger 6 (Novo Fornecedor)
INSERT INTO Fornecedor (RazaoSocial, CNPJ, Endereco) 
VALUES ('Fornecedor Teste Ltda', '99.999.999/0001-99', 'Rua Teste');

-- 4. Testando Trigger 9 (Mudança Status Compra)
-- Vamos pegar a Compra ID 5 (que estava 'Pendente') e mudar para 'Em Analise'
UPDATE OrdemCompra SET Status = 'Em Analise' WHERE idOrdemCompra = 5;

-- 5. Testando Trigger 11 (Alerta Estoque Crítico)
-- Vamos pegar o Lote 1 e simular uma baixa drástica para ver se gera alerta
UPDATE Lote SET QuantidadeAtual = 50.00 WHERE idLote = 1;


-- TESTES DAS TRIGGERS
SELECT * FROM Auditoria ORDER BY idAuditoria DESC LIMIT 10;