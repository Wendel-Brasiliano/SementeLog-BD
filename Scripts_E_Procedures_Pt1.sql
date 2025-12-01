USE mydb;

-- 1. FUNÇÃO: CALCULAR SALDO ATUAL DE UMA SEMENTE
-- Ideia é receber o ID da semente e retornar quantos KGs existem no total

DELIMITER $$
CREATE FUNCTION fn_GetSaldoSemente(p_idSemente INT) RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN
    DECLARE v_saldo DECIMAL(10,2);
    SELECT COALESCE(SUM(QuantidadeAtual), 0) INTO v_saldo
    FROM Lote
    WHERE Semente_idSemente = p_idSemente;
    RETURN v_saldo;
END$$
DELIMITER ;

-- 2. PROCEDURE: CADASTRAR NOVO FUNCIONÁRIO
-- O Objetivo do item é Facilitar o INSERT na Tabela Funcionário.

DELIMITER $$
CREATE PROCEDURE sp_CadastrarFuncionario(
    IN p_Nome VARCHAR(255),
    IN p_Matricula VARCHAR(45),
    IN p_Cargo VARCHAR(45),
    IN p_Usuario VARCHAR(100),
    IN p_Senha VARCHAR(50)
)
BEGIN
    INSERT INTO Funcionario (Nome, Matricula, Cargo, Usuario, Senha)
    VALUES (p_Nome, p_Matricula, p_Cargo, p_Usuario, p_Senha);
END$$
DELIMITER ;

-- 3. PROCEDURE: CRIAR ORDEM DE COMPRA
-- Objetivo é iniciar um pedido de compra que esteja com o status "Pendente"

DELIMITER $$
CREATE PROCEDURE sp_CriarOrdemCompra(
    IN p_FornecedorID INT,
    IN p_FuncionarioID INT,
    IN p_DataCompra DATE
)
BEGIN
    INSERT INTO OrdemCompra (DataCompra, ValorTotal, Status, Fornecedor_idFornecedor, Funcionario_idFuncionario)
    VALUES (p_DataCompra, 0.00, 'Pendente', p_FornecedorID, p_FuncionarioID);
END$$
DELIMITER ;


-- 4. PROCEDURE: ADICIONAR ITEM NA ORDEM DE COMPRA
-- Irá inserir o item e atualualizar automaticamente o valor total do pedido principal.

DELIMITER $$
CREATE PROCEDURE sp_AdicionarItemCompra(
    IN p_OrdemID INT,
    IN p_SementeID INT,
    IN p_Qtd DECIMAL(10,2),
    IN p_ValorUnit DECIMAL(10,2)
)
BEGIN
    -- 1. Insere o item
    INSERT INTO ItemOrdemCompra (OrdemCompra_idOrdemCompra, Semente_idSemente, QuantidadeKg, ValorUnitario)
    VALUES (p_OrdemID, p_SementeID, p_Qtd, p_ValorUnit);
    
    -- 2. Atualiza o valor total da Ordem de Compra
    UPDATE OrdemCompra 
    SET ValorTotal = ValorTotal + (p_Qtd * p_ValorUnit)
    WHERE idOrdemCompra = p_OrdemID;
END$$
DELIMITER ;


-- 5. FUNÇÃO: VERIFICAR SE SEMENTE PRECISA DE REPOSIÇÃO
-- Tem como objetivo Retornar "SIM" ou "NÃO" se o estoque estiver abaixo do mínimo.

DELIMITER $$
CREATE FUNCTION fn_VerificarReposicao(p_idSemente INT) RETURNS VARCHAR(3) DETERMINISTIC
BEGIN
    DECLARE v_atual DECIMAL(10,2);
    DECLARE v_minimo DECIMAL(10,2);
    
    -- Pega o saldo atual usando a função que criamos no passo 1
    SET v_atual = fn_GetSaldoSemente(p_idSemente);
    
    -- Pega o mínimo cadastrado
    SELECT EstoqueMinKg INTO v_minimo FROM Semente WHERE idSemente = p_idSemente;
    
    IF v_atual < v_minimo THEN
        RETURN 'SIM';
    ELSE
        RETURN 'NAO';
    END IF;
END$$
DELIMITER ;


-- 6. PROCEDURE: RECEBER LOTE (ENTRADA DE ESTOQUE)
-- Aqui irá transformar um item comprado em um lote físico no estoque.

DELIMITER $$
CREATE PROCEDURE sp_ReceberLote(
    IN p_OrdemID INT,
    IN p_SementeID INT,
    IN p_EstoqueID INT,
    IN p_Qtd DECIMAL(10,2),
    IN p_Validade DATE
)
BEGIN
    INSERT INTO Lote (DataEntrada, DataValidade, QuantidadeEntrada, QuantidadeAtual, OrdemCompra_idOrdemCompra, Semente_idSemente, Estoque_idEstoque)
    VALUES (CURDATE(), p_Validade, p_Qtd, p_Qtd, p_OrdemID, p_SementeID, p_EstoqueID);
END$$
DELIMITER ;


-- 7. PROCEDURE: APROVAR ORDEM DE COMPRA
-- Muda o status de "Pendente" para "Concluído".

DELIMITER $$
CREATE PROCEDURE sp_AprovarCompra(IN p_OrdemID INT)
BEGIN
    UPDATE OrdemCompra SET Status = 'Concluído' WHERE idOrdemCompra = p_OrdemID;
END$$
DELIMITER ;
