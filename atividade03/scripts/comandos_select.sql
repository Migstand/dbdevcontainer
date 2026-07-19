--C1 Listar todos

SELECT *
    FROM Pagamento_pix;


SELECT *
    FROM Pagamento_cartao;


SELECT *
    FROM Pagamento_linha_credito;


SELECT *
    FROM Valor;


SELECT *
    FROM DescricaoProduto;


SELECT *
    FROM Pagamento_boleto;
    

SELECT *
    FROM Pagamento;


-- C2 Listar alguns campos simples
SELECT estado
    FROM Localizacao

    WHERE estado = 'RN';


-- C3 Listar alguns campos composta
SELECT estado
    FROM Localizacao

    WHERE estado = 'RN'
    AND cidade = 'Natal';


-- C4 usando GROUP BY
SELECT tipo_pagamento, COUNT(*)
    FROM Pagamento
    GROUP BY tipo_pagamento;


--C5 outro select
SELECT cidade, estado, endereco
    FROM Localizacao
    WHERE cep IN (
        SELECT id_endereco
        FROM Pagamento
        WHERE tipo_pagamento = 'PIX'
    );