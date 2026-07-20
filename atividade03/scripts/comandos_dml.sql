-- Comando B1. Comando INSERT para inserir 5 registros nas tabelas do modelo
INSERT INTO Pagamento_pix (id, QRcode, codigo) VALUES 
(1, '00020126580014br.gov.bcb.pix0136a1b2c3d4...', 'E12345678202607191200ABCD'), 
(2, '00020126580014br.gov.bcb.pix0136f5e6d7c8...', 'E87654321202607191430WXYZ'),
(3, '00020126580014br.gov.bcb.pix013699998888...', 'E11112222202607200915LMNO'), 
(4, '00020126580014br.gov.bcb.pix013677776666...', 'E33334444202607211045PQRS'),
(5, '00020126580014br.gov.bcb.pix013611110000...', 'E55556666202607221620TUVW');

INSERT INTO Pagamento_cartao (id, numero_cartao, nome_titular, vencimento, codigo_cobraca, agencia) VALUES 
(1, '4111222233334444', 'MIGUEL R S HORA', '2028-11-01', '892', 'Nubank - 0001'), 
(2, '5555666677778888', 'RAQUEL M F PIRES', '2030-05-01', '124', 'Itaú - Ag. 1532'),
(3, '4222333344445555', 'GUSTAVO D LIMA', '2027-09-01', '777', 'Bradesco - Ag. 0451'), 
(4, '5111222233334444', 'ARTHUR S FONTENELE', '2029-01-01', '405', 'Nubank - 0001'),
(5, '4555666677778888', 'AGROFLORES NATAL', '2031-12-01', '019', 'Banco do Brasil - Ag. 3321');

INSERT INTO Pagamento_linha_credito (id, parcelas, agencia) VALUES 
(1, 12, 'Itaú - Ag. 1532'), 
(2, 6, 'Nubank - 0001'), 
(3, 24, 'Caixa Econômica - Ag. 0001'), 
(4, 10, 'Itaú - Ag. 1532'), 
(5, 5, 'Banco do Brasil - Ag. 3321');

INSERT INTO Localizacao (cep, cidade, estado, endereco, bairro) VALUES 
('59020-000', 'Natal', 'RN', 'Av. Hermes da Fonseca, 1000', 'Tirol'),
('59090-000', 'Natal', 'RN', 'Av. Engenheiro Roberto Freire, 200', 'Ponta Negra'),
('01311-200', 'São Paulo', 'SP', 'Av. Paulista, 1578', 'Bela Vista'),
('80020-000', 'Curitiba', 'PR', 'Rua XV de Novembro, 500', 'Centro'),
('59078-360', 'Natal', 'RN', 'Rua Dr. Orlando de Azevedo', 'Capim Macio');

INSERT INTO Valor (id, subtotal, total) VALUES 
(1, 85.00, 110.00),  -- R$ 85 da orquídea + R$ 25 de frete
(2, 250.00, 250.00), -- Frete grátis
(3, 45.50, 60.50), 
(4, 320.00, 360.00), 
(5, 120.00, 145.00);

INSERT INTO DescricaoProduto (id, descricao, envio, subtotal_valor) VALUES 
(1, 'Muda de Orquídea Cattleya Walkeriana', 'Correios PAC', 1), 
(2, 'Orquídea Vanda Azul (Adulta/Florida)', 'Transportadora JadLog', 2),
(3, 'Substrato Casca de Pinus 5 Litros', 'Correios PAC', 3), 
(4, 'Kit de Adubos Premium Peters (Manutenção/Floração)', 'Correios SEDEX', 4),
(5, 'Orquídea Phalaenopsis Cascata Branca', 'Retirada na Loja', 5);

INSERT INTO Pagamento_boleto (id, cpf, numero, complemento, cep_localizacao) VALUES 
(1, '10120230344', '341910900800000', 'Apto 402, Bloco B', '59020-000'), 
(2, '50560670788', '001905009540144', 'Casa de esquina', '59090-000'),
(3, '90980870766', '104910004150000', 'Sala Comercial 105', '01311-200'), 
(4, '11122233344', '237933812860000', 'Portaria 24h', '80020-000'),
(5, '55544433322', '033993276650000', 'Loja Agroflores', '59078-360');

INSERT INTO Pagamento (id, nome, tipo_pessoa, cpf, telefone, email, observacoes, sobrenome, numero, tipo_pagamento, pais, id_pix, id_pagamento_cartao, id_linha_credito, id_produto, id_boleto, id_endereco) VALUES 
(1, 'Miguel', 'Física', '10120230344', '84999991111', 'miguel@email.com', 'Deixar com o porteiro', 'Spínola', '15A', 'Cartão de Crédito', 'Brasil', 1, 1, 1, 1, 1, '59020-000'),
(2, 'Raquel', 'Física', '50560670788', '84988882222', 'raquel@email.com', 'Cuidado, planta frágil', 'Pires', '200', 'PIX', 'Brasil', 2, 2, 2, 2, 2, '59090-000'),
(3, 'Gustavo', 'Física', '90980870766', '11977773333', 'gustavo@email.com', 'Presente de aniversário', 'Lima', '1578', 'Boleto Bancário', 'Brasil', 3, 3, 3, 3, 3, '01311-200'),
(4, 'Arthur', 'Física', '11122233344', '41966664444', 'arthur@email.com', '', 'Fontenele', '500', 'PIX', 'Brasil', 4, 4, 4, 4, 4, '80020-000'),
(5, 'Agroflores', 'Jurídica', '55544433322', '8436050513', 'contato@agroflores.com.br', 'Compra de mudas no atacado', 'Natal', '2116', 'Linha de Crédito', 'Brasil', 5, 5, 5, 5, 5, '59078-360');

-- Comando B2. Comando UPDATE para atualizar um campo de todos os registros (Reajuste geral na taxa de entrega da transportadora)
UPDATE Valor SET total = total + 15.00;

-- Comando B3. Comando UPDATE para atualizar um campo dos registros (Condição simples)
UPDATE Localizacao SET estado = 'SP' WHERE cidade = 'São Paulo';

-- Comando B4. Comando UPDATE para atualizar um campo dos registros (Condição composta)
UPDATE Pagamento_linha_credito SET parcelas = 24 WHERE parcelas = 12 AND agencia = 'Itaú - Ag. 1532';

-- Comando B5. Comando UPDATE para atualizar dois campos dos registros (Condição simples - Pix expirado)
UPDATE Pagamento_pix SET codigo = 'CANCELADO', QRcode = 'INATIVO' WHERE id = 5;

-- Comando B6. Comando UPDATE para atualizar usando o antigo valor do campo (Aplicando 5% de desconto promocional nas plantas)
UPDATE Valor SET subtotal = subtotal * 0.95;

-- Comando B7. Comando UPDATE para atualizar usando uma função do PostgreSQL (Padronizando o método de envio para letras maiúsculas)
UPDATE DescricaoProduto SET envio = UPPER(envio);

-- Comando B8. Comando DELETE para remover todos os registros de uma tabela
-- A tabela "Pagamento" é deletada primeiro para liberar as restrições de chaves estrangeiras (FK) no banco
DELETE FROM Pagamento;

-- Comando B9. Comando DELETE para remover os registros (Condição simples)
DELETE FROM Pagamento_pix WHERE codigo = 'CANCELADO';

-- Comando B10. Comando DELETE para remover os registros (Condição composta)
DELETE FROM Pagamento_linha_credito WHERE parcelas > 20 AND agencia = 'Caixa Econômica - Ag. 0001';

-- Comando B11. Comando DELETE para remover registros utilizando uma função (Apagando registros onde o CPF/CNPJ possui mais de 11 caracteres)
DELETE FROM Pagamento_boleto WHERE LENGTH(cpf) > 11;