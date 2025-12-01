USE mydb;


-- GRUPO 1 E AUDITORIA DE FUNCIONÁRIOS

-- 1 Logar novo funcionário cadastrado

DELIMITER $$
CREATE TRIGGER tr_Audit_Funcionario_Insert AFTER INSERT ON Funcionario
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria (DataHora, Acao, Descricao, Funcionario_idFuncionario)
    VALUES (NOW(), 'INSERT', CONCAT('Novo funcionário cadastrado: ', NEW.Nome), NEW.idFuncionario);
END$$
DELIMITER ;

-- 2. Trigger: Logar alteração de dados de funcionário

DELIMITER $$
CREATE TRIGGER tr_Audit_Funcionario_Update AFTER UPDATE ON Funcionario
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria (DataHora, Acao, Descricao, Funcionario_idFuncionario)
    VALUES (NOW(), 'UPDATE', CONCAT('Dados alterados do funcionário: ', NEW.Nome), NEW.idFuncionario);
END$$
DELIMITER ;

-- 3. Trigger: Logar demissão/remoção de funcionário
-- (Obs: Salvamos o log no nome do usuário ADM padrão ID 1, pois o func foi deletado)

DELIMITER $$
CREATE TRIGGER tr_Audit_Funcionario_Delete AFTER DELETE ON Funcionario
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria (DataHora, Acao, Descricao, Funcionario_idFuncionario)
    VALUES (NOW(), 'DELETE', CONCAT('Funcionário removido: ', OLD.Nome), 1);
END$$
DELIMITER ;

-- GRUPO 2: SEGURANÇA E VALIDAÇÃO DE DADOS

-- 4 Validar Datas do Lote (Validade não pode ser menor que Entrada)

DELIMITER $$
CREATE TRIGGER tr_Valida_Lote_Datas BEFORE INSERT ON Lote
FOR EACH ROW
BEGIN
    IF NEW.DataValidade < NEW.DataEntrada THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: A Data de Validade não pode ser anterior à Data de Entrada.';
    END IF;
END$$
DELIMITER ;

-- 5. Trigger: Impedir exclusão de Ordem de Compra Concluída (Segurança)

DELIMITER $$
CREATE TRIGGER tr_Seguranca_Delete_Compra BEFORE DELETE ON OrdemCompra
FOR EACH ROW
BEGIN
    IF OLD.Status = 'Concluído' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro de Segurança: Não é permitido deletar uma Compra já Concluída.';
    END IF;
END$$
DELIMITER ;

-- GRUPO 3: AUDITORIA DE OPERAÇÕES DE NEGÓCIO

-- 6 Logar Entrada de Novo Fornecedor

DELIMITER $$
CREATE TRIGGER tr_Audit_Fornecedor_Insert AFTER INSERT ON Fornecedor
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria (DataHora, Acao, Descricao, Funcionario_idFuncionario)
    VALUES (NOW(), 'CADASTRO', CONCAT('Novo Fornecedor: ', NEW.RazaoSocial), 1);
END$$
DELIMITER ;

-- 7 Logar Entrada de Nova Cooperativa

DELIMITER $$
CREATE TRIGGER tr_Audit_Cooperativa_Insert AFTER INSERT ON Cooperativa
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria (DataHora, Acao, Descricao, Funcionario_idFuncionario)
    VALUES (NOW(), 'CADASTRO', CONCAT('Nova Cooperativa: ', NEW.RazaoSocial), 1);
END$$
DELIMITER ;

-- 8. Logar Alteração em Semente (Ex: Mudança de Estoque Mínimo)

DELIMITER $$
CREATE TRIGGER tr_Audit_Semente_Update AFTER UPDATE ON Semente
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria (DataHora, Acao, Descricao, Funcionario_idFuncionario)
    VALUES (NOW(), 'ALTERACAO PRODUTO', CONCAT('Semente alterada: ', NEW.Nome), 1);
END$$
DELIMITER ;

-- 9 Logar Aprovação de Compra (Mudança de Status)

DELIMITER $$
CREATE TRIGGER tr_Log_Status_Compra AFTER UPDATE ON OrdemCompra
FOR EACH ROW
BEGIN
    IF NEW.Status <> OLD.Status THEN
        INSERT INTO Auditoria (DataHora, Acao, Descricao, Funcionario_idFuncionario)
        VALUES (NOW(), 'STATUS COMPRA', CONCAT('Compra ID ', NEW.idOrdemCompra, ' mudou de ', OLD.Status, ' para ', NEW.Status), NEW.Funcionario_idFuncionario);
    END IF;
END$$
DELIMITER ;

-- 10 Logar Aprovação de Distribuição (Mudança de Status)

DELIMITER $$
CREATE TRIGGER tr_Log_Status_Distribuicao AFTER UPDATE ON Distribuicao
FOR EACH ROW
BEGIN
    IF NEW.Status <> OLD.Status THEN
        INSERT INTO Auditoria (DataHora, Acao, Descricao, Funcionario_idFuncionario)
        VALUES (NOW(), 'STATUS SAIDA', CONCAT('Distribuição ID ', NEW.idDistribuicao, ' mudou de ', OLD.Status, ' para ', NEW.Status), NEW.Funcionario_idFuncionario);
    END IF;
END$$
DELIMITER ;


-- GRUPO 4: ALERTAS AUTOMÁTICOS

-- 11 Alerta de Estoque Baixo (Ao atualizar Lote)
-- Se a quantidade baixar de 100kg, gera um aviso na auditoria.

DELIMITER $$
CREATE TRIGGER tr_Alerta_Estoque_Critico AFTER UPDATE ON Lote
FOR EACH ROW
BEGIN
    IF NEW.QuantidadeAtual < 100 AND NEW.QuantidadeAtual < OLD.QuantidadeAtual THEN
        INSERT INTO Auditoria (DataHora, Acao, Descricao, Funcionario_idFuncionario)
        VALUES (NOW(), 'ALERTA ESTOQUE', CONCAT('Lote ', NEW.idLote, ' atingiu nível crítico: ', NEW.QuantidadeAtual, 'Kg'), 1);
    END IF;
END$$
DELIMITER ;

-- 12 Logar Adição de Item em Pedido

DELIMITER $$
CREATE TRIGGER tr_Log_Novo_Item_Pedido AFTER INSERT ON ItemOrdemCompra
FOR EACH ROW
BEGIN
     INSERT INTO Auditoria (DataHora, Acao, Descricao, Funcionario_idFuncionario)
     VALUES (NOW(), 'ITEM ADICIONADO', CONCAT('Novo item inserido na Compra ID ', NEW.OrdemCompra_idOrdemCompra), 1);
END$$
DELIMITER ;