USE mydb;

USE mydb;

-- 8. PROCEDURE: REGISTRAR PEDIDO DE DISTRIBUIÇÃO (SAÍDA)
-- Objetivo: Cria o cabeçalho do pedido de saída com status 'Pendente'.

DELIMITER $$
CREATE PROCEDURE sp_CriarDistribuicao(
    IN p_CooperativaID INT,
    IN p_FuncionarioID INT, -- Técnico que solicitou
    IN p_DataPedido DATE,
    IN p_Obs TEXT
)
BEGIN
    INSERT INTO Distribuicao (DataDist, Obs, Funcionario_idFuncionario, Status, Cooperativa_idCooperativa)
    VALUES (p_DataPedido, p_Obs, p_FuncionarioID, 'Pendente', p_CooperativaID);
END$$
DELIMITER ;



-- 9. PROCEDURE: ADICIONAR ITEM NA DISTRIBUIÇÃO
-- Objetivo: Adiciona sementes ao pedido de saída.

DELIMITER $$
CREATE PROCEDURE sp_AdicionarItemDistribuicao(
    IN p_DistribuicaoID INT,
    IN p_LoteID INT,
    IN p_Qtd DECIMAL(10,2)
)
BEGIN
    INSERT INTO ItemDistribuicao (QuantidadeKG, Distribuicao_idDistribuicao, Lote_idLote)
    VALUES (p_Qtd, p_DistribuicaoID, p_LoteID);
END$$
DELIMITER ;


-- 10. PROCEDURE: APROVAR DISTRIBUIÇÃO E BAIXAR ESTOQUE
-- Objetivo: Crítico. Muda status para 'Concluído' e DESCONTA do Lote.

DELIMITER $$
CREATE PROCEDURE sp_AprovarDistribuicao(IN p_DistribuicaoID INT)
BEGIN
    -- 1. Atualiza o status
    UPDATE Distribuicao SET Status = 'Concluído' WHERE idDistribuicao = p_DistribuicaoID;
    
    -- 2. A baixa de estoque será feita automaticamente pela TRIGGER (que faremos a seguir).
    -- Isso mantém o código seguro e automático.
END$$
DELIMITER ;


-- 11. FUNÇÃO: CONTAR PEDIDOS PENDENTES DE UM GESTOR
-- Objetivo: Retorna quantos pedidos de compra aquele gestor iniciou e não terminou.

DELIMITER $$
CREATE FUNCTION fn_ContarPendenciasGestor(p_idGestor INT) RETURNS INT DETERMINISTIC
BEGIN
    DECLARE v_qtd INT;
    SELECT COUNT(*) INTO v_qtd 
    FROM OrdemCompra 
    WHERE Funcionario_idFuncionario = p_idGestor AND Status = 'Pendente';
    RETURN v_qtd;
END$$
DELIMITER ;


-- 12. PROCEDURE: REGISTRAR LOG DE AUDITORIA MANUAL
-- Objetivo: Permite criar um registro de auditoria personalizado se necessário.

DELIMITER $$
CREATE PROCEDURE sp_RegistrarAuditoria(
    IN p_FuncionarioID INT,
    IN p_Acao VARCHAR(200),
    IN p_Descricao TEXT
)
BEGIN
    INSERT INTO Auditoria (DataHora, Acao, Descricao, Funcionario_idFuncionario)
    VALUES (NOW(), p_Acao, p_Descricao, p_FuncionarioID);
END$$
DELIMITER ;


-- 13. FUNÇÃO: CALCULAR DIAS PARA VENCER LOTE
-- Objetivo: Retorna quantos dias faltam para um lote específico vencer.

DELIMITER $$
CREATE FUNCTION fn_DiasVencimento(p_idLote INT) RETURNS INT DETERMINISTIC
BEGIN
    DECLARE v_dias INT;
    SELECT DATEDIFF(DataValidade, CURDATE()) INTO v_dias
    FROM Lote
    WHERE idLote = p_idLote;
    RETURN v_dias;
END$$
DELIMITER ;


-- 14. PROCEDURE: ATUALIZAR ESTOQUE MÍNIMO DA SEMENTE
-- Objetivo: Permite ao gestor mudar a regra de reposição.

DELIMITER $$
CREATE PROCEDURE sp_AtualizarEstoqueMinimo(
    IN p_SementeID INT,
    IN p_NovoMinimo DECIMAL(10,2)
)
BEGIN
    UPDATE Semente 
    SET EstoqueMinKg = p_NovoMinimo 
    WHERE idSemente = p_SementeID;
END$$
DELIMITER ;