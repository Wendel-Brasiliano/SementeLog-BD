USE mydb;

INSERT INTO funcionario(idFuncionario, Nome, Matricula, Cargo, Usuario, Senha)
VALUES
(1, 'Laís Nayara', 'F1001', 'Gestora', 'lais.nayara', 'senha123'),
(2, 'Marcelo Barbosa', 'F1002', 'Técnico', 'marcelo.barbosa', 'senha123'),
(3, 'Lucas Mendes', 'F1003', 'Técnico', 'lucas.mendes', 'senha123'),
(4, 'Ana Oliveira', 'F1004', 'Gestor', 'ana.oliveira', 'senha123'),
(5, 'Paulo Mendes', 'F1005', 'Técnico', 'paulo.mendes', 'senha123'),
(6, 'Lucas Ximenes', 'F1006', 'Técnico', 'lucas.ximenes', 'senha1006'),
(7, 'Anderson Careca', 'F1007', 'Técnico', 'anderson.careca', 'senha1007'),
(8, 'Wendell Santos', 'F1008', 'Técnico', 'wendell.santos', 'senha1008'),
(9, 'Danielle Lima', 'F1009', 'Gestor', 'danielle.lima', 'senha1009'),
(10, 'Rafael Mottu', 'F1010', 'Técnico', 'rafael.mottu', 'senha1010'),
(11, 'Alambique Silva', 'F1011', 'Técnico', 'alambique.silva', 'senha1011'),
(12, 'Marcos Portugal', 'F1012', 'Gestor', 'marcos.portugal', 'senha1012'),
(13, 'Beatriz Costa', 'F1013', 'Técnico', 'beatriz.costa', 'senha1013'),
(14, 'Thiago Almeida', 'F1014', 'Técnico', 'thiago.almeida', 'senha1014'),
(15, 'Juliana Lima', 'F1015', 'Técnico', 'juliana.lima', 'senha1015'),
(16, 'Bruno Rocha', 'F1016', 'Gestor', 'bruno.rocha', 'senha1016'),
(17, 'Fernanda Dias', 'F1017', 'Técnico', 'fernanda.dias', 'senha1017'),
(18, 'Rodrigo Alves', 'F1018', 'Técnico', 'rodrigo.alves', 'senha1018'),
(19, 'Camila Santos', 'F1019', 'Técnico', 'camila.santos', 'senha1019'),
(20, 'Gustavo Ferreira', 'F1020', 'Gestor', 'gustavo.ferreira', 'senha1F20');

INSERT INTO semente(idSemente, CodSemente, Nome, EstoqueMinKg)
VALUES
(1, 'S001', 'Milho IPA Sertanejo', 1000.00),
(2, 'S002', 'Feijão Carioca', 800.00),
(3, 'S003', 'Feijão de Corda (Vigna)', 800.00),
(4, 'S004', 'Fava Crioula', 400.00),
(5, 'S005', 'Arroz Vermelho', 300.00),
(6, 'S006', 'Sorgo Forrageiro', 1500.00),
(7, 'S007', 'Milheto (Capim-italiano)', 500.00),
(8, 'S008', 'Capim Buffel', 400.00),
(9, 'S009', 'Capim Sudão', 400.00),
(10, 'S010', 'Leucena (Leguminosa forrageira)', 200.00),
(11, 'S011', 'Girassol', 300.00),
(12, 'S012', 'Gergelim', 200.00),
(13, 'S013', 'Mamona', 500.00),
(14, 'S014', 'Amendoim', 200.00),
(15, 'S015', 'Algodão Mocó (Crioulo)', 600.00),
(16, 'S016', 'Abóbora (Jerimum) Moranga', 150.00),
(17, 'S017', 'Melancia Crimson Sweet', 100.00),
(18, 'S018', 'Melão Amarelo', 100.00),
(19, 'S019', 'Quiabo Santa Cruz', 50.00),
(20, 'S020', 'Maxixe', 50.00);

INSERT INTO fornecedor(idFornecedor, RazaoSocial, CNPJ, Endereco)
VALUES
(1, 'Bayer S.A (Divisão Agrícola)', '18.459.628/0001-15', 'Av. Conselheiro Aguiar, 4500 - Recife'),
(2, 'Syngenta Proteção de Cultivos Ltda', '61.306.498/0001-08', 'Av. Dantas Barreto, 1000 - Recife'),
(3, 'Corteva Agriscience do Brasil S/A', '32.761.610/0001-05', 'Rua da Guia, 150 - Bairro do Recife'),
(4, 'Yara Brasil Fertilizantes S.A.', '92.660.604/0001-82', 'Av. Mascarenhas de Morais, 585 - Recife'),
(5, 'AgroNorte Insumos Pernambuco Ltda', '10.111.222/0001-33', 'Av. Gen. San Martin, 1371 - Recife'),
(6, 'Recife Sementes e Defensivos', '10.222.333/0001-44', 'Av. Caxangá, 2500 - Recife'),
(7, 'Casa do Campo Comércio Agrícola', '10.333.444/0001-55', 'Rua da Concórdia, 300 - Recife'),
(8, 'Agreste Grãos e Sementes Ltda', '20.111.222/0001-10', 'Rodovia BR-232, Km 130 - Caruaru'),
(9, 'Caruaru Insumos Agrícolas', '20.222.333/0001-20', 'Av. Agamenon Magalhães, 800 - Caruaru'),
(10, 'Forrageiras Agreste Comércio', '20.333.444/0001-30', 'Rua Duque de Caxias, 500 - Caruaru'),
(11, 'Sementes Sete Colinas Ltda', '30.111.222/0001-40', 'Av. Rui Barbosa, 900 - Garanhuns'),
(12, 'Garanhuns Agropecuária', '30.222.333/0001-50', 'Av. Santo Antônio, 150 - Garanhuns'),
(13, 'Vale Sementes do São Francisco', '40.111.222/0001-60', 'Av. da Integração, 1500 - Petrolina'),
(14, 'Petrolina Agro Sementes', '40.222.333/0001-70', 'Rodovia BR-407, Km 5 - Petrolina'),
(15, 'Sertão Irrigado Insumos', '40.333.444/0001-80', 'Av. Nilo Coelho, 300 - Petrolina'),
(16, 'Serra Talhada Sementes Ltda', '50.111.222/0001-90', 'Rua Enock Inácio de Oliveira, 1000 - Serra Talhada'),
(17, 'Arcoverde Casa do Agricultor', '60.111.222/0001-10', 'Av. Cel. Japiassu, 450 - Arcoverde'),
(18, 'Salgueiro Insumos Agro', '70.111.222/0001-20', 'Rua Major Juvino, 30 - Salgueiro'),
(19, 'Vitória Insumos Agrícolas Ltda', '80.111.222/0001-30', 'Av. Mariana Amália, 100 - Vitória de Santo Antão'),
(20, 'Goiana Agro Comércio', '90.111.222/0001-40', 'Rua da Matriz, 50 - Goiana');

INSERT INTO cooperativa(idCooperativa, RazaoSocial, CNPJ, Endereco)
VALUES
(1, 'Cooperativa dos Agricultores de Garanhuns (CODEAGRO)', '10.123.456/0001-01', 'Av. Santo Antônio, 500 - Garanhuns'),
(2, 'COOPAGRO - Cooperativa do Agreste de Caruaru', '10.234.567/0001-02', 'Av. Agamenon Magalhães, 1000 - Caruaru'),
(3, 'Cooperativa dos Produtores Rurais de Petrolina (COOPVALE)', '10.345.678/0001-03', 'Av. da Integração, 200 - Petrolina'),
(4, 'Cooperativa Agropecuária de Serra Talhada (COOPAST)', '10.456.789/0001-04', 'Rua Enock Inácio de Oliveira, 1500 - Serra Talhada'),
(5, 'Cooperativa dos Produtores de Leite de Pesqueira', '10.567.890/0001-05', 'Av. Ézio Araújo, 200 - Pesqueira'),
(6, 'Cooperativa de Ovinocaprinocultores de Ouricuri (COOVI)', '10.678.901/0001-06', 'Rodovia BR-122, Km 30 - Ouricuri'),
(7, 'Cooperativa Agroindustrial de Salgueiro (COOPAGIS)', '10.789.012/0001-07', 'Rua Joaquim Sampaio, 150 - Salgueiro'),
(8, 'Cooperativa Mista de Agricultores de Arcoverde (COOPAR)', '10.890.123/0001-08', 'Av. Cel. Japiassu, 700 - Arcoverde'),
(9, 'Associação dos Produtores de Belo Jardim (AGROBEL)', '10.901.234/0001-09', 'Rua da Conceição, 300 - Belo Jardim'),
(10, 'Cooperativa dos Irrigantes do Vale do São Francisco (COOPIRRIGA)', '11.012.345/0001-10', 'Av. Nilo Coelho, 800 - Petrolina'),
(11, 'Cooperativa de Apicultores do Pajeú (COOPAMEL)', '11.123.456/0001-11', 'Av. Manoel Borba, 50 - Afogados da Ingazeira'),
(12, 'Cooperativa de Fruticultores de Petrolândia', '11.234.567/0001-12', 'Av. Auspício Valgueiro Barros, 400 - Petrolândia'),
(13, 'Cooperativa de Agricultores de Buíque (COOPAB)', '11.345.678/0001-13', 'Rua das Flores, 10 - Buíque'),
(14, 'Central das Cooperativas do Agreste (AGRESTECOOP)', '11.456.789/0001-14', 'Rua 15 de Novembro, 20 - Caruaru'),
(15, 'Cooperativa de Produção de Sementes do Sertão (SERTÃOSEED)', '11.567.890/0001-15', 'Av. Central, 10 - Serra Talhada'),
(16, 'Cooperativa dos Produtores de Hortaliças de Garanhuns', '11.678.901/0001-16', 'Rua Barão do Rio Branco, 30 - Garanhuns'),
(17, 'Cooperativa dos Produtores de Algodão de Surubim', '11.789.012/0001-17', 'Praça da Matriz, 50 - Surubim'),
(18, 'Cooperativa Agropecuária da Zona da Mata (COOPMATA)', '11.890.123/0001-18', 'Av. Mário Lira, 100 - Vitória de Santo Antão'),
(19, 'Cooperativa de Grãos de Santa Maria da Boa Vista', '11.901.234/0001-19', 'Av. da Uva e do Vinho, 200 - Santa Maria da Boa Vista'),
(20, 'Cooperativa Central do IPA (COOPIPA)', '12.012.345/0001-20', 'Av. Gen. San Martin, 1371 - Recife');

INSERT INTO estoque(idEstoque, Nome, Endereco) VALUES
(1, 'Galpão Zona da Mata', 'Hub Logístico - Vitória de Santo Antão'),
(2, 'Galpão Agreste', 'Hub Logístico - Caruaru'),
(3, 'Galpão Sertão (Petrolina)', 'Hub Logístico - Petrolina'),
(4, 'Galpão Sertão (Salgueiro)', 'Hub Logístico - Salgueiro');


-- FLUXO Compra (Milho e Sorgo) p/ Agreste - Gestora Laís
-- -----------------------------------------------------

INSERT INTO OrdemCompra (idOrdemCompra, DataCompra, ValorTotal, `Status`, Fornecedor_idFornecedor, Funcionario_idFuncionario) 
VALUES
(1, '2025-10-01', 13000.00, 'Concluído', 1, 1);

INSERT INTO ItemOrdemCompra (Semente_idSemente, OrdemCompra_idOrdemCompra, QuantidadeKg, ValorUnitario) 
VALUES
(1, 1, 2000.00, 5.00),
(6, 1, 1000.00, 3.00);

INSERT INTO Lote (idLote, DataEntrada, DataValidade, QuantidadeEntrada, QuantidadeAtual, OrdemCompra_idOrdemCompra, Semente_idSemente, Estoque_idEstoque) 
VALUES
(1, '2025-10-10', '2026-10-10', 2000.00, 2000.00, 1, 1, 2),
(2, '2025-10-10', '2026-08-01', 1000.00, 1000.00, 1, 6, 2);

INSERT INTO OrdemCompra (idOrdemCompra, DataCompra, ValorTotal, `Status`, Fornecedor_idFornecedor, Funcionario_idFuncionario) 
VALUES
(2, '2025-10-05', 16000.00, 'Concluído', 8, 4);

INSERT INTO ItemOrdemCompra (Semente_idSemente, OrdemCompra_idOrdemCompra, QuantidadeKg, ValorUnitario) 
VALUES
(3, 2, 2000.00, 8.00);

INSERT INTO Lote (idLote, DataEntrada, DataValidade, QuantidadeEntrada, QuantidadeAtual, OrdemCompra_idOrdemCompra, Semente_idSemente, Estoque_idEstoque) 
VALUES
(3, '2025-10-15', '2026-10-15', 2000.00, 2000.00, 2, 3, 2);

INSERT INTO OrdemCompra (idOrdemCompra, DataCompra, ValorTotal, `Status`, Fornecedor_idFornecedor, Funcionario_idFuncionario) 
VALUES
(3, '2025-10-10', 7500.00, 'Concluído', 13, 9);

INSERT INTO ItemOrdemCompra (Semente_idSemente, OrdemCompra_idOrdemCompra, QuantidadeKg, ValorUnitario) 
VALUES
(17, 3, 300.00, 15.00),
(18, 3, 200.00, 15.00);

INSERT INTO Lote (idLote, DataEntrada, DataValidade, QuantidadeEntrada, QuantidadeAtual, OrdemCompra_idOrdemCompra, Semente_idSemente, Estoque_idEstoque) 
VALUES
(4, '2025-10-20', '2026-04-20', 300.00, 300.00, 3, 17, 3),
(5, '2025-10-20', '2026-04-20', 200.00, 200.00, 3, 18, 3);

INSERT INTO OrdemCompra (idOrdemCompra, DataCompra, ValorTotal, `Status`, Fornecedor_idFornecedor, Funcionario_idFuncionario) 
VALUES
(4, '2025-10-15', 4000.00, 'Concluído', 5, 1);

INSERT INTO ItemOrdemCompra (Semente_idSemente, OrdemCompra_idOrdemCompra, QuantidadeKg, ValorUnitario) 
VALUES
(13, 4, 1000.00, 4.00);

INSERT INTO Lote (idLote, DataEntrada, DataValidade, QuantidadeEntrada, QuantidadeAtual, OrdemCompra_idOrdemCompra, Semente_idSemente, Estoque_idEstoque) 
VALUES
(6, '2025-10-25', '2026-10-25', 1000.00, 1000.00, 4, 13, 4);

INSERT INTO OrdemCompra (idOrdemCompra, DataCompra, ValorTotal, `Status`, Fornecedor_idFornecedor, Funcionario_idFuncionario) 
VALUES
(5, '2025-11-10', 3000.00, 'Pendente', 16, 12);

INSERT INTO ItemOrdemCompra (Semente_idSemente, OrdemCompra_idOrdemCompra, QuantidadeKg, ValorUnitario) 
VALUES
(4, 5, 500.00, 6.00);
INSERT INTO OrdemCompra (idOrdemCompra, DataCompra, ValorTotal, `Status`, Fornecedor_idFornecedor, Funcionario_idFuncionario) 
VALUES
(6, '2025-10-20', 5000.00, 'Concluído', 9, 4);

INSERT INTO ItemOrdemCompra (Semente_idSemente, OrdemCompra_idOrdemCompra, QuantidadeKg, ValorUnitario) 
VALUES
(15, 6, 500.00, 10.00);

INSERT INTO Lote (idLote, DataEntrada, DataValidade, QuantidadeEntrada, QuantidadeAtual, OrdemCompra_idOrdemCompra, Semente_idSemente, Estoque_idEstoque) 
VALUES
(7, '2025-10-28', '2026-10-28', 500.00, 500.00, 6, 15, 2);

INSERT INTO OrdemCompra (idOrdemCompra, DataCompra, ValorTotal, `Status`, Fornecedor_idFornecedor, Funcionario_idFuncionario) 
VALUES
(7, '2025-10-21', 7000.00, 'Concluído', 13, 12);

INSERT INTO ItemOrdemCompra (Semente_idSemente, OrdemCompra_idOrdemCompra, QuantidadeKg, ValorUnitario) 
VALUES
(6, 7, 2000.00, 3.50);

INSERT INTO Lote (idLote, DataEntrada, DataValidade, QuantidadeEntrada, QuantidadeAtual, OrdemCompra_idOrdemCompra, Semente_idSemente, Estoque_idEstoque)
VALUES
(8, '2025-10-29', '2026-09-15', 2000.00, 2000.00, 7, 6, 3);

INSERT INTO OrdemCompra (idOrdemCompra, DataCompra, ValorTotal, `Status`, Fornecedor_idFornecedor, Funcionario_idFuncionario) 
VALUES
(8, '2025-10-22', 13000.00, 'Concluído', 11, 1);

INSERT INTO ItemOrdemCompra (Semente_idSemente, OrdemCompra_idOrdemCompra, QuantidadeKg, ValorUnitario) 
VALUES
(1, 8, 1000.00, 5.00),
(3, 8, 1000.00, 8.00);

INSERT INTO Lote (idLote, DataEntrada, DataValidade, QuantidadeEntrada, QuantidadeAtual, OrdemCompra_idOrdemCompra, Semente_idSemente, Estoque_idEstoque) 
VALUES
(9, '2025-10-30', '2026-10-30', 1000.00, 1000.00, 8, 1, 2),
(10, '2025-10-30', '2026-10-30', 1000.00, 1000.00, 8, 3, 2);

INSERT INTO OrdemCompra (idOrdemCompra, DataCompra, ValorTotal, `Status`, Fornecedor_idFornecedor, Funcionario_idFuncionario) 
VALUES
(9, '2025-10-24', 6000.00, 'Concluído', 18, 16);

INSERT INTO ItemOrdemCompra (Semente_idSemente, OrdemCompra_idOrdemCompra, QuantidadeKg, ValorUnitario) 
VALUES
(8, 9, 3000.00, 2.00);

INSERT INTO Lote (idLote, DataEntrada, DataValidade, QuantidadeEntrada, QuantidadeAtual, OrdemCompra_idOrdemCompra, Semente_idSemente, Estoque_idEstoque) 
VALUES
(11, '2025-11-01', '2026-11-01', 3000.00, 3000.00, 9, 8, 4);

INSERT INTO OrdemCompra (idOrdemCompra, DataCompra, ValorTotal, `Status`, Fornecedor_idFornecedor, Funcionario_idFuncionario) 
VALUES
(10, '2025-10-25', 7500.00, 'Concluído', 13, 9);

INSERT INTO ItemOrdemCompra (Semente_idSemente, OrdemCompra_idOrdemCompra, QuantidadeKg, ValorUnitario) 
VALUES
(18, 10, 500.00, 15.00);

INSERT INTO Lote (idLote, DataEntrada, DataValidade, QuantidadeEntrada, QuantidadeAtual, OrdemCompra_idOrdemCompra, Semente_idSemente, Estoque_idEstoque) 
VALUES
(12, '2025-11-02', '2026-05-01', 500.00, 500.00, 10, 18, 3);

INSERT INTO OrdemCompra (idOrdemCompra, DataCompra, ValorTotal, `Status`, Fornecedor_idFornecedor, Funcionario_idFuncionario) 
VALUES
(11, '2025-10-26', 7000.00, 'Concluído', 16, 20);

INSERT INTO ItemOrdemCompra (Semente_idSemente, OrdemCompra_idOrdemCompra, QuantidadeKg, ValorUnitario) 
VALUES
(12, 11, 1000.00, 7.00);

INSERT INTO Lote (idLote, DataEntrada, DataValidade, QuantidadeEntrada, QuantidadeAtual, OrdemCompra_idOrdemCompra, Semente_idSemente, Estoque_idEstoque) 
VALUES
(13, '2025-11-03', '2026-11-03', 1000.00, 1000.00, 11, 12, 4);

INSERT INTO OrdemCompra (idOrdemCompra, DataCompra, ValorTotal, `Status`, Fornecedor_idFornecedor, Funcionario_idFuncionario) 
VALUES
(12, '2025-10-28', 1600.00, 'Concluído', 9, 1);

INSERT INTO ItemOrdemCompra (Semente_idSemente, OrdemCompra_idOrdemCompra, QuantidadeKg, ValorUnitario) 
VALUES
(16, 12, 400.00, 4.00);

INSERT INTO Lote (idLote, DataEntrada, DataValidade, QuantidadeEntrada, QuantidadeAtual, OrdemCompra_idOrdemCompra, Semente_idSemente, Estoque_idEstoque) 
VALUES
(14, '2025-11-04', '2026-05-04', 400.00, 400.00, 12, 16, 2);

INSERT INTO OrdemCompra (idOrdemCompra, DataCompra, ValorTotal, `Status`, Fornecedor_idFornecedor, Funcionario_idFuncionario) 
VALUES
(13, '2025-10-30', 25000.00, 'Concluído', 1, 4);

INSERT INTO ItemOrdemCompra (Semente_idSemente, OrdemCompra_idOrdemCompra, QuantidadeKg, ValorUnitario) 
VALUES
(1, 13, 5000.00, 5.00);

INSERT INTO Lote (idLote, DataEntrada, DataValidade, QuantidadeEntrada, QuantidadeAtual, OrdemCompra_idOrdemCompra, Semente_idSemente, Estoque_idEstoque) 
VALUES
(15, '2025-11-05', '2026-11-05', 5000.00, 5000.00, 13, 1, 1);

INSERT INTO OrdemCompra (idOrdemCompra, DataCompra, ValorTotal, `Status`, Fornecedor_idFornecedor, Funcionario_idFuncionario) 
VALUES
(14, '2025-11-01', 14000.00, 'Concluído', 8, 12);

INSERT INTO ItemOrdemCompra (Semente_idSemente, OrdemCompra_idOrdemCompra, QuantidadeKg, ValorUnitario) 
VALUES
(6, 14, 4000.00, 3.50);

INSERT INTO Lote (idLote, DataEntrada, DataValidade, QuantidadeEntrada, QuantidadeAtual, OrdemCompra_idOrdemCompra, Semente_idSemente, Estoque_idEstoque) 
VALUES
(16, '2025-11-06', '2026-09-20', 4000.00, 4000.00, 14, 6, 2);

INSERT INTO OrdemCompra (idOrdemCompra, DataCompra, ValorTotal, `Status`, Fornecedor_idFornecedor, Funcionario_idFuncionario) 
VALUES
(15, '2025-11-02', 12000.00, 'Concluído', 5, 9);

INSERT INTO ItemOrdemCompra (Semente_idSemente, OrdemCompra_idOrdemCompra, QuantidadeKg, ValorUnitario) 
VALUES
(3, 15, 1500.00, 8.00);

INSERT INTO Lote (idLote, DataEntrada, DataValidade, QuantidadeEntrada, QuantidadeAtual, OrdemCompra_idOrdemCompra, Semente_idSemente, Estoque_idEstoque) 
VALUES
(17, '2025-11-07', '2026-11-07', 1500.00, 1500.00, 15, 3, 1);

INSERT INTO OrdemCompra (idOrdemCompra, DataCompra, ValorTotal, `Status`, Fornecedor_idFornecedor, Funcionario_idFuncionario) 
VALUES
(16, '2025-11-05', 2500.00, 'Pendente', 11, 1);

INSERT INTO ItemOrdemCompra (Semente_idSemente, OrdemCompra_idOrdemCompra, QuantidadeKg, ValorUnitario) 
VALUES
(7, 16, 1000.00, 2.50);

INSERT INTO OrdemCompra (idOrdemCompra, DataCompra, ValorTotal, `Status`, Fornecedor_idFornecedor, Funcionario_idFuncionario) 
VALUES
(17, '2025-11-06', 4800.00, 'Pendente', 16, 16);

INSERT INTO ItemOrdemCompra (Semente_idSemente, OrdemCompra_idOrdemCompra, QuantidadeKg, ValorUnitario) 
VALUES
(4, 17, 800.00, 6.00);

INSERT INTO OrdemCompra (idOrdemCompra, DataCompra, ValorTotal, `Status`, Fornecedor_idFornecedor, Funcionario_idFuncionario) 
VALUES
(18, '2025-11-08', 20000.00, 'Em Andamento', 2, 4);

INSERT INTO ItemOrdemCompra (Semente_idSemente, OrdemCompra_idOrdemCompra, QuantidadeKg, ValorUnitario) 
VALUES
(15, 18, 2000.00, 10.00);

INSERT INTO OrdemCompra (idOrdemCompra, DataCompra, ValorTotal, `Status`, Fornecedor_idFornecedor, Funcionario_idFuncionario) 
VALUES
(19, '2025-11-10', 26100.00, 'Concluído', 1, 12);

INSERT INTO ItemOrdemCompra (Semente_idSemente, OrdemCompra_idOrdemCompra, QuantidadeKg, ValorUnitario) 
VALUES
(1, 19, 3000.00, 5.10),
(6, 19, 3000.00, 3.60);

INSERT INTO Lote (idLote, DataEntrada, DataValidade, QuantidadeEntrada, QuantidadeAtual, OrdemCompra_idOrdemCompra, Semente_idSemente, Estoque_idEstoque) 
VALUES
(18, '2025-11-12', '2026-11-12', 3000.00, 3000.00, 19, 1, 3),
(19, '2025-11-12', '2026-09-30', 3000.00, 3000.00, 19, 6, 3);

INSERT INTO OrdemCompra (idOrdemCompra, DataCompra, ValorTotal, `Status`, Fornecedor_idFornecedor, Funcionario_idFuncionario) 
VALUES
(20, '2025-11-11', 14500.00, 'Pendente', 13, 20);

INSERT INTO ItemOrdemCompra (Semente_idSemente, OrdemCompra_idOrdemCompra, QuantidadeKg, ValorUnitario) 
VALUES
(17, 20, 1000.00, 14.50);



INSERT INTO Distribuicao (idDistribuicao, DataDist, Obs, Funcionario_idFuncionario, Status, Cooperativa_idCooperativa) 
VALUES
(1, '2025-11-01', 'Saída de Milho', 2, 'Concluído', 1);

INSERT INTO ItemDistribuicao (QuantidadeKG, Distribuicao_idDistribuicao, Lote_idLote) 
VALUES
(500.00, 1, 1);

UPDATE Lote SET QuantidadeAtual = (QuantidadeAtual - 500.00) WHERE idLote = 1;

INSERT INTO Distribuicao (idDistribuicao, DataDist, Obs, Funcionario_idFuncionario, Status, Cooperativa_idCooperativa) 
VALUES
(2, '2025-11-02', 'Saída de Sorgo', 3, 'Concluído', 2);

INSERT INTO ItemDistribuicao (QuantidadeKG, Distribuicao_idDistribuicao, Lote_idLote) 
VALUES
(1000.00, 2, 2);

UPDATE Lote SET QuantidadeAtual = (QuantidadeAtual - 1000.00) WHERE idLote = 2;

INSERT INTO Distribuicao (idDistribuicao, DataDist, Obs, Funcionario_idFuncionario, Status, Cooperativa_idCooperativa) 
VALUES
(3, '2025-11-03', 'Pedido de Feijão pendente de aprovação', 2, 'Pendente', 2);

INSERT INTO ItemDistribuicao (QuantidadeKG, Distribuicao_idDistribuicao, Lote_idLote) 
VALUES
(1500.00, 3, 3);

INSERT INTO Distribuicao (idDistribuicao, DataDist, Obs, Funcionario_idFuncionario, Status, Cooperativa_idCooperativa) 
VALUES
(4, '2025-11-04', 'Saída de hortifruti p/ Vale', 5, 'Concluído', 3);

INSERT INTO ItemDistribuicao (QuantidadeKG, Distribuicao_idDistribuicao, Lote_idLote) 
VALUES
(100.00, 4, 4),
(50.00, 4, 5);

UPDATE Lote SET QuantidadeAtual = (QuantidadeAtual - 100.00) WHERE idLote = 4;
UPDATE Lote SET QuantidadeAtual = (QuantidadeAtual - 50.00) WHERE idLote = 5;

INSERT INTO Distribuicao (idDistribuicao, DataDist, Obs, Funcionario_idFuncionario, Status, Cooperativa_idCooperativa) 
VALUES
(5, '2025-11-05', 'Entrega Mamona Sertão', 2, 'Concluído', 7);

INSERT INTO ItemDistribuicao (QuantidadeKG, Distribuicao_idDistribuicao, Lote_idLote) 
VALUES
(300.00, 5, 6);

UPDATE Lote SET QuantidadeAtual = (QuantidadeAtual - 300.00) WHERE idLote = 6;

INSERT INTO Distribuicao (idDistribuicao, DataDist, Obs, Funcionario_idFuncionario, Status, Cooperativa_idCooperativa) 
VALUES
(6, '2025-11-06', 'Entrega grande Agreste', 3, 'Concluído', 1);

INSERT INTO ItemDistribuicao (QuantidadeKG, Distribuicao_idDistribuicao, Lote_idLote) 
VALUES
(1000.00, 6, 9),
(500.00, 6, 10);

UPDATE Lote SET QuantidadeAtual = (QuantidadeAtual - 1000.00) WHERE idLote = 9;
UPDATE Lote SET QuantidadeAtual = (QuantidadeAtual - 500.00) WHERE idLote = 10;

INSERT INTO Distribuicao (idDistribuicao, DataDist, Obs, Funcionario_idFuncionario, Status, Cooperativa_idCooperativa) 
VALUES
(7, '2025-11-07', 'Entrega ZM', 5, 'Concluído', 18);

INSERT INTO ItemDistribuicao (QuantidadeKG, Distribuicao_idDistribuicao, Lote_idLote) 
VALUES
(2000.00, 7, 15);

UPDATE Lote SET QuantidadeAtual = (QuantidadeAtual - 2000.00) WHERE idLote = 15;

INSERT INTO Distribuicao (idDistribuicao, DataDist, Obs, Funcionario_idFuncionario, Status, Cooperativa_idCooperativa) 
VALUES
(8, '2025-11-08', 'Pedido grande Sorgo pendente', 2, 'Pendente', 2);

INSERT INTO ItemDistribuicao (QuantidadeKG, Distribuicao_idDistribuicao, Lote_idLote) 
VALUES
(4000.00, 8, 16);

INSERT INTO Distribuicao (idDistribuicao, DataDist, Obs, Funcionario_idFuncionario, Status, Cooperativa_idCooperativa) 
VALUES
(9, '2025-11-10', 'Entrega Vale', 3, 'Concluído', 3);

INSERT INTO ItemDistribuicao (QuantidadeKG, Distribuicao_idDistribuicao, Lote_idLote) 
VALUES
(1500.00, 9, 18);

UPDATE Lote SET QuantidadeAtual = (QuantidadeAtual - 1500.00) WHERE idLote = 18;

INSERT INTO Distribuicao (idDistribuicao, DataDist, Obs, Funcionario_idFuncionario, Status, Cooperativa_idCooperativa) 
VALUES
(10, '2025-11-11', 'Pedido pendente Serra Talhada', 5, 'Pendente', 4);

INSERT INTO ItemDistribuicao (QuantidadeKG, Distribuicao_idDistribuicao, Lote_idLote) 
VALUES
(100.00, 10, 1);

INSERT INTO Distribuicao (idDistribuicao, DataDist, Obs, Funcionario_idFuncionario, Status, Cooperativa_idCooperativa) 
VALUES
(11, '2025-11-12', 'Saída Algodão', 2, 'Concluído', 17);

INSERT INTO ItemDistribuicao (QuantidadeKG, Distribuicao_idDistribuicao, Lote_idLote) 
VALUES
(500.00, 11, 7);

UPDATE Lote SET QuantidadeAtual = (QuantidadeAtual - 500.00) WHERE idLote = 7;

INSERT INTO Distribuicao (idDistribuicao, DataDist, Obs, Funcionario_idFuncionario, Status, Cooperativa_idCooperativa) 
VALUES
(12, '2025-11-13', 'Saída Sorgo', 3, 'Concluído', 3);

INSERT INTO ItemDistribuicao (QuantidadeKG, Distribuicao_idDistribuicao, Lote_idLote) 
VALUES
(2000.00, 12, 8);

UPDATE Lote SET QuantidadeAtual = (QuantidadeAtual - 2000.00) WHERE idLote = 8;

INSERT INTO Distribuicao (idDistribuicao, DataDist, Obs, Funcionario_idFuncionario, Status, Cooperativa_idCooperativa) 
VALUES
(13, '2025-11-14', 'Saída Feijão', 5, 'Concluído', 1);

INSERT INTO ItemDistribuicao (QuantidadeKG, Distribuicao_idDistribuicao, Lote_idLote) 
VALUES
(500.00, 13, 10);

UPDATE Lote SET QuantidadeAtual = (QuantidadeAtual - 500.00) WHERE idLote = 10;

INSERT INTO Distribuicao (idDistribuicao, DataDist, Obs, Funcionario_idFuncionario, Status, Cooperativa_idCooperativa) 
VALUES
(14, '2025-11-15', 'Saída Capim Buffel', 2, 'Concluído', 4);

INSERT INTO ItemDistribuicao (QuantidadeKG, Distribuicao_idDistribuicao, Lote_idLote) 
VALUES
(3000.00, 14, 11);

UPDATE Lote SET QuantidadeAtual = (QuantidadeAtual - 3000.00) WHERE idLote = 11;

INSERT INTO Distribuicao (idDistribuicao, DataDist, Obs, Funcionario_idFuncionario, Status, Cooperativa_idCooperativa) 
VALUES
(15, '2025-11-16', 'Saída Melão', 3, 'Concluído', 3);

INSERT INTO ItemDistribuicao (QuantidadeKG, Distribuicao_idDistribuicao, Lote_idLote) 
VALUES
(500.00, 15, 12);

UPDATE Lote SET QuantidadeAtual = (QuantidadeAtual - 500.00) WHERE idLote = 12;

INSERT INTO Distribuicao (idDistribuicao, DataDist, Obs, Funcionario_idFuncionario, Status, Cooperativa_idCooperativa) 
VALUES
(16, '2025-11-17', 'Pedido Gergelim', 5, 'Pendente', 7);

INSERT INTO ItemDistribuicao (QuantidadeKG, Distribuicao_idDistribuicao, Lote_idLote) 
VALUES
(1000.00, 16, 13);

INSERT INTO Distribuicao (idDistribuicao, DataDist, Obs, Funcionario_idFuncionario, Status, Cooperativa_idCooperativa) 
VALUES
(17, '2025-11-18', 'Saída Abóbora', 2, 'Concluído', 14);

INSERT INTO ItemDistribuicao (QuantidadeKG, Distribuicao_idDistribuicao, Lote_idLote) 
VALUES
(400.00, 17, 14);

UPDATE Lote SET QuantidadeAtual = (QuantidadeAtual - 400.00) WHERE idLote = 14;

INSERT INTO Distribuicao (idDistribuicao, DataDist, Obs, Funcionario_idFuncionario, Status, Cooperativa_idCooperativa) 
VALUES
(18, '2025-11-19', 'Saída Feijão ZM', 3, 'Concluído', 18);

INSERT INTO ItemDistribuicao (QuantidadeKG, Distribuicao_idDistribuicao, Lote_idLote) 
VALUES
(1500.00, 18, 17);

UPDATE Lote SET QuantidadeAtual = (QuantidadeAtual - 1500.00) WHERE idLote = 17;

INSERT INTO Distribuicao (idDistribuicao, DataDist, Obs, Funcionario_idFuncionario, Status, Cooperativa_idCooperativa) 
VALUES
(19, '2025-11-20', 'Saída Sorgo', 5, 'Concluído', 3);

INSERT INTO ItemDistribuicao (QuantidadeKG, Distribuicao_idDistribuicao, Lote_idLote) 
VALUES
(3000.00, 19, 19);

UPDATE Lote SET QuantidadeAtual = (QuantidadeAtual - 3000.00) WHERE idLote = 19;

INSERT INTO Distribuicao (idDistribuicao, DataDist, Obs, Funcionario_idFuncionario, Status, Cooperativa_idCooperativa) 
VALUES
(20, '2025-11-21', 'Pedido Milho Extra', 2, 'Pendente', 1);

INSERT INTO ItemDistribuicao (QuantidadeKG, Distribuicao_idDistribuicao, Lote_idLote) 
VALUES
(1000.00, 20, 1);

INSERT INTO Auditoria (idAuditoria, DataHora, Acao, Descricao, Funcionario_idFuncionario) 
VALUES
(1, '2025-10-01 09:00:15', 'CRIAÇÃO DE COMPRA', 'Gestora criou a Ordem de Compra ID 1', 1),
(2, '2025-10-05 10:30:00', 'CRIAÇÃO DE COMPRA', 'Gestora criou a Ordem de Compra ID 2', 4),
(3, '2025-10-10 08:15:00', 'ENTRADA DE LOTE', 'Técnico deu entrada no Lote ID 1 (Milho)', 2),
(4, '2025-10-10 08:16:00', 'ENTRADA DE LOTE', 'Técnico deu entrada no Lote ID 2 (Sorgo)', 2),
(5, '2025-10-10 11:00:00', 'CRIAÇÃO DE COMPRA', 'Gestora criou a Ordem de Compra ID 3', 9),
(6, '2025-10-15 09:00:00', 'ENTRADA DE LOTE', 'Técnico deu entrada no Lote ID 3 (Feijão)', 3),
(7, '2025-10-20 14:00:00', 'ENTRADA DE LOTE', 'Técnico deu entrada no Lote ID 4 (Melancia)', 5),
(8, '2025-10-25 15:00:00', 'ENTRADA DE LOTE', 'Técnico deu entrada no Lote ID 6 (Mamona)', 5),
(9, '2025-11-01 09:30:00', 'SOLICITAÇÃO DE SAÍDA', 'Técnico criou Distribuição ID 1 (Pendente)', 2),
(10, '2025-11-01 09:35:00', 'APROVAÇÃO DE SAÍDA', 'Gestora (Laís) aprovou Distribuição ID 1 (Concluído)', 1),
(11, '2025-11-01 09:35:02', 'BAIXA DE ESTOQUE', 'Sistema deu baixa no Lote ID 1 (500kg) via Distr. 1', 1),
(12, '2025-11-02 10:00:00', 'SOLICITAÇÃO DE SAÍDA', 'Técnico criou Distribuição ID 2 (Pendente)', 3),
(13, '2025-11-02 10:05:00', 'APROVAÇÃO DE SAÍDA', 'Gestora (Ana) aprovou Distribuição ID 2 (Concluído)', 4),
(14, '2025-11-02 10:05:02', 'BAIXA DE ESTOQUE', 'Sistema deu baixa no Lote ID 2 (1000kg) via Distr. 2', 4),
(15, '2025-11-03 14:20:00', 'SOLICITAÇÃO DE SAÍDA', 'Técnico criou Distribuição ID 3 (Pendente)', 2),
(16, '2025-11-04 11:00:00', 'SOLICITAÇÃO DE SAÍDA', 'Técnico criou Distribuição ID 4 (Pendente)', 5),
(17, '2025-11-04 11:02:00', 'APROVAÇÃO DE SAÍDA', 'Gestora (Danielle) aprovou Distribuição ID 4 (Concluído)', 9),
(18, '2025-11-04 11:02:03', 'BAIXA DE ESTOQUE', 'Sistema deu baixa no Lote ID 4 (100kg) via Distr. 4', 9),
(19, '2025-11-04 11:02:04', 'BAIXA DE ESTOQUE', 'Sistema deu baixa no Lote ID 5 (50kg) via Distr. 4', 9),
(20, '2025-11-10 16:00:00', 'CRIAÇÃO DE COMPRA', 'Gestor criou a Ordem de Compra ID 20 (Pendente)', 20);