-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Funcionario` (
  `idFuncionario` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(255) NOT NULL,
  `Matricula` VARCHAR(45) NOT NULL,
  `Cargo` VARCHAR(45) NULL,
  `Usuario` VARCHAR(100) NOT NULL,
  `Senha` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idFuncionario`),
  UNIQUE INDEX `Matricula_UNIQUE` (`Matricula` ASC) VISIBLE,
  UNIQUE INDEX `Usuario_UNIQUE` (`Usuario` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Semente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Semente` (
  `idSemente` INT NOT NULL AUTO_INCREMENT,
  `CodSemente` VARCHAR(45) NOT NULL,
  `Nome` VARCHAR(100) NOT NULL,
  `EstoqueMinKg` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idSemente`),
  UNIQUE INDEX `CodSemente_UNIQUE` (`CodSemente` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fornecedor` (
  `idFornecedor` INT NOT NULL AUTO_INCREMENT,
  `RazaoSocial` VARCHAR(255) NOT NULL,
  `CNPJ` VARCHAR(18) NOT NULL,
  `Endereco` VARCHAR(100) NULL,
  PRIMARY KEY (`idFornecedor`),
  UNIQUE INDEX `CNPJ_UNIQUE` (`CNPJ` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`OrdemCompra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OrdemCompra` (
  `idOrdemCompra` INT NOT NULL AUTO_INCREMENT,
  `DataCompra` DATE NOT NULL,
  `ValorTotal` DECIMAL(10,2) NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  `Fornecedor_idFornecedor` INT NOT NULL,
  `Funcionario_idFuncionario` INT NOT NULL,
  PRIMARY KEY (`idOrdemCompra`),
  INDEX `fk_OrdemCompra_Fornecedor_idx` (`Fornecedor_idFornecedor` ASC) VISIBLE,
  INDEX `fk_OrdemCompra_Funcionario1_idx` (`Funcionario_idFuncionario` ASC) VISIBLE,
  CONSTRAINT `fk_OrdemCompra_Fornecedor`
    FOREIGN KEY (`Fornecedor_idFornecedor`)
    REFERENCES `mydb`.`Fornecedor` (`idFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdemCompra_Funcionario1`
    FOREIGN KEY (`Funcionario_idFuncionario`)
    REFERENCES `mydb`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estoque` (
  `idEstoque` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NOT NULL,
  `Endereco` VARCHAR(100) NULL,
  PRIMARY KEY (`idEstoque`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Lote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Lote` (
  `idLote` INT NOT NULL AUTO_INCREMENT,
  `DataEntrada` DATE NOT NULL,
  `DataValidade` DATE NOT NULL,
  `QuantidadeEntrada` DECIMAL(10,2) NOT NULL,
  `QuantidadeAtual` DECIMAL(10,2) NOT NULL,
  `OrdemCompra_idOrdemCompra` INT NOT NULL,
  `Semente_idSemente` INT NOT NULL,
  `Estoque_idEstoque` INT NOT NULL,
  PRIMARY KEY (`idLote`),
  INDEX `fk_Lote_OrdemCompra1_idx` (`OrdemCompra_idOrdemCompra` ASC) VISIBLE,
  INDEX `fk_Lote_Semente1_idx` (`Semente_idSemente` ASC) VISIBLE,
  INDEX `fk_Lote_Estoque1_idx` (`Estoque_idEstoque` ASC) VISIBLE,
  CONSTRAINT `fk_Lote_OrdemCompra1`
    FOREIGN KEY (`OrdemCompra_idOrdemCompra`)
    REFERENCES `mydb`.`OrdemCompra` (`idOrdemCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lote_Semente1`
    FOREIGN KEY (`Semente_idSemente`)
    REFERENCES `mydb`.`Semente` (`idSemente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lote_Estoque1`
    FOREIGN KEY (`Estoque_idEstoque`)
    REFERENCES `mydb`.`Estoque` (`idEstoque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Logistica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Logistica` (
  `idLogistica` INT NOT NULL AUTO_INCREMENT,
  `Status` VARCHAR(45) NOT NULL,
  `DataPrevista` DATE NULL,
  `DataEntrega` DATE NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Lote_idLote` INT NOT NULL,
  PRIMARY KEY (`idLogistica`),
  INDEX `fk_Logistica_Lote1_idx` (`Lote_idLote` ASC) VISIBLE,
  CONSTRAINT `fk_Logistica_Lote1`
    FOREIGN KEY (`Lote_idLote`)
    REFERENCES `mydb`.`Lote` (`idLote`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cooperativa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cooperativa` (
  `idCooperativa` INT NOT NULL AUTO_INCREMENT,
  `RazaoSocial` VARCHAR(100) NOT NULL,
  `CNPJ` VARCHAR(18) NOT NULL,
  `Endereco` VARCHAR(100) NULL,
  PRIMARY KEY (`idCooperativa`),
  UNIQUE INDEX `CPF_UNIQUE` (`CNPJ` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Distribuicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Distribuicao` (
  `idDistribuicao` INT NOT NULL AUTO_INCREMENT,
  `DataDist` DATE NOT NULL,
  `Obs` TEXT NULL,
  `Funcionario_idFuncionario` INT NOT NULL,
  `Status` VARCHAR(45) NULL,
  `Cooperativa_idCooperativa` INT NOT NULL,
  PRIMARY KEY (`idDistribuicao`),
  INDEX `fk_Distribuicao_Funcionario1_idx` (`Funcionario_idFuncionario` ASC) VISIBLE,
  INDEX `fk_Distribuicao_Cooperativa1_idx` (`Cooperativa_idCooperativa` ASC) VISIBLE,
  CONSTRAINT `fk_Distribuicao_Funcionario1`
    FOREIGN KEY (`Funcionario_idFuncionario`)
    REFERENCES `mydb`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Distribuicao_Cooperativa1`
    FOREIGN KEY (`Cooperativa_idCooperativa`)
    REFERENCES `mydb`.`Cooperativa` (`idCooperativa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ItemDistribuicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ItemDistribuicao` (
  `QuantidadeKG` DECIMAL(10,2) NOT NULL,
  `Distribuicao_idDistribuicao` INT NOT NULL,
  `Lote_idLote` INT NOT NULL,
  INDEX `fk_ItemDistribuicao_Distribuicao1_idx` (`Distribuicao_idDistribuicao` ASC) VISIBLE,
  INDEX `fk_ItemDistribuicao_Lote1_idx` (`Lote_idLote` ASC) VISIBLE,
  PRIMARY KEY (`Distribuicao_idDistribuicao`, `Lote_idLote`),
  CONSTRAINT `fk_ItemDistribuicao_Distribuicao1`
    FOREIGN KEY (`Distribuicao_idDistribuicao`)
    REFERENCES `mydb`.`Distribuicao` (`idDistribuicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ItemDistribuicao_Lote1`
    FOREIGN KEY (`Lote_idLote`)
    REFERENCES `mydb`.`Lote` (`idLote`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Auditoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Auditoria` (
  `idAuditoria` INT NOT NULL AUTO_INCREMENT,
  `DataHora` DATETIME NOT NULL,
  `Acao` VARCHAR(200) NOT NULL,
  `Descricao` TEXT NULL,
  `Funcionario_idFuncionario` INT NOT NULL,
  PRIMARY KEY (`idAuditoria`),
  INDEX `fk_Auditoria_Funcionario1_idx` (`Funcionario_idFuncionario` ASC) VISIBLE,
  CONSTRAINT `fk_Auditoria_Funcionario1`
    FOREIGN KEY (`Funcionario_idFuncionario`)
    REFERENCES `mydb`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ItemOrdemCompra`
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Table `mydb`.`ItemOrdemCompra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ItemOrdemCompra` (
  `Semente_idSemente` INT NOT NULL,
  `OrdemCompra_idOrdemCompra` INT NOT NULL,
  `QuantidadeKg` DECIMAL(10,2) NOT NULL,    -- RECOMENDAÇÃO: Mudar de NULL para NOT NULL
  `ValorUnitario` DECIMAL(10,2) NOT NULL, -- RECOMENDAÇÃO: Mudar de NULL para NOT NULL
  
  -- CORREÇÃO OBRIGATÓRIA:
  PRIMARY KEY (`Semente_idSemente`, `OrdemCompra_idOrdemCompra`), 
  
  INDEX `fk_ItemOrdeCompra_Semente1_idx` (`Semente_idSemente` ASC) VISIBLE,
  INDEX `fk_ItemOrdemCompra_OrdemCompra1_idx` (`OrdemCompra_idOrdemCompra` ASC) VISIBLE,
  CONSTRAINT `fk_ItemOrdeCompra_Semente1`
    FOREIGN KEY (`Semente_idSemente`)
    REFERENCES `mydb`.`Semente` (`idSemente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ItemOrdemCompra_OrdemCompra1`
    FOREIGN KEY (`OrdemCompra_idOrdemCompra`)
    REFERENCES `mydb`.`OrdemCompra` (`idOrdemCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
