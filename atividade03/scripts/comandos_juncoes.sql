-- D1. Comando para listar o nome do cliente, CPF e o tipo de pagamento realizado.
-- Utiliza INNER JOIN entre as tabelas Pagamento e Localizacao.

SELECT
    Pagamento.nome,
    Pagamento.cpf,
    Pagamento.tipo_pagamento,
    Localizacao.cidade,
    Localizacao.estado

FROM Pagamento

INNER JOIN Localizacao
ON Pagamento.id_endereco = Localizacao.cep;

-- D2. Comando para listar o nome do cliente, a descrição do produto adquirido e o valor total da compra.
-- Utiliza INNER JOIN entre as tabelas Pagamento, DescricaoProduto e Valor.

SELECT
    Pagamento.nome,
    DescricaoProduto.descricao,
    Valor.total

FROM Pagamento

INNER JOIN DescricaoProduto
ON Pagamento.id_produto = DescricaoProduto.id

INNER JOIN Valor
ON DescricaoProduto.subtotal_valor = Valor.id;

-- D3. Comando para listar todos os clientes e, quando existir,
-- os dados do pagamento em boleto.
-- Utiliza LEFT OUTER JOIN.

SELECT
    Pagamento.nome,
    Pagamento.tipo_pagamento,
    Pagamento_boleto.numero,
    Pagamento_boleto.complemento

FROM Pagamento

LEFT OUTER JOIN Pagamento_boleto
ON Pagamento.id_boleto = Pagamento_boleto.id;

-- D4. Comando para listar os pagamentos e os dados do cartão,
-- exibindo todos os registros das duas tabelas.
-- Utiliza FULL OUTER JOIN.

SELECT
    Pagamento.nome,
    Pagamento.tipo_pagamento,
    Pagamento_cartao.numero_cartao,
    Pagamento_cartao.nome_titular

FROM Pagamento

FULL OUTER JOIN Pagamento_cartao
ON Pagamento.id_pagamento_cartao = Pagamento_cartao.id;