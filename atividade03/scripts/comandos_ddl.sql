CREATE TABLE IF NOT EXISTS Pagamento_pix(
    id INT PRIMARY KEY,
    QRcode VARCHAR (255) NOT NULL,
    codigo VARCHAR (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Pagamento_cartao(
    id INT PRIMARY KEY,
    numero_cartao VARCHAR (20) NOT NULL,
    nome_titular VARCHAR (255) NOT NULL,
    vencimento DATE NOT NULL,
    codigo_cobraca VARCHAR (255) NOT NULL,
    agencia VARCHAR (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Pagamento_linha_credito(
    id INT PRIMARY KEY,
    parcelas INT NOT NULL,
    agencia VARCHAR (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Localizacao(
    cep VARCHAR (10) PRIMARY KEY,
    cidade VARCHAR (255) NOT NULL,
    estado VARCHAR (255) NOT NULL,
    endereco VARCHAR (255) NOT NULL,
    bairro VARCHAR (255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Valor(
    id INT PRIMARY KEY,
    subtotal FLOAT NOT NULL,
    total FLOAT NOT NULL
);

CREATE TABLE IF NOT EXISTS DescricaoProduto(
    id INT PRIMARY KEY,
    descricao VARCHAR (255) NOT NULL,
    envio VARCHAR (255) NOT NULL,
    subtotal_valor INT NOT NULL,
    CONSTRAINT subtotal_valor_fk FOREIGN KEY(subtotal_valor) REFERENCES Valor(id)

);


CREATE TABLE IF NOT EXISTS Pagamento_boleto(
    id INT PRIMARY KEY,
    cpf VARCHAR (15) NOT NULL,
    numero VARCHAR (15) NOT NULL,
    complemento VARCHAR (255),
    cep_localizacao VARCHAR (10) NOT NULL,
    CONSTRAINT CEP_LOCALIZACAO_FK FOREIGN KEY(cep_localizacao) REFERENCES Localizacao(cep)
);

CREATE TABLE IF NOT EXISTS Pagamento(
    id INT PRIMARY KEY,
    nome VARCHAR (255) NOT NULL,
    tipo_pessoa VARCHAR (255) NOT NULL,
    cpf VARCHAR (15) NOT NULL,
    telefone VARCHAR (255) NOT NULL,
    email VARCHAR (255) NOT NULL,
    observacoes VARCHAR (255),
    sobrenome VARCHAR (255) NOT NULL,
    numero VARCHAR (20) NOT NULL,
    tipo_pagamento VARCHAR (50) NOT NULL,
    pais VARCHAR (255) NOT NULL,
    id_pix INT NOT NULL,
    id_pagamento_cartao INT NOT NULL,
    id_linha_credito INT NOT NULL,
    id_produto INT NOT NULL,
    id_boleto INT NOT NULL,
    id_endereco VARCHAR (10) NOT NULL,

    CONSTRAINT id_pix_fk FOREIGN KEY(id_pix) REFERENCES Pagamento_pix(id),
    CONSTRAINT id_pagamento_cartao_fk FOREIGN KEY(id_pagamento_cartao) REFERENCES Pagamento_cartao(id),
    CONSTRAINT id_linha_credito_fk FOREIGN KEY(id_linha_credito) REFERENCES Pagamento_linha_credito(id),
    CONSTRAINT id_produto_fk FOREIGN KEY(id_produto) REFERENCES DescricaoProduto(id),
    CONSTRAINT id_boleto_fk FOREIGN KEY(id_boleto) REFERENCES Pagamento_boleto(id),
    CONSTRAINT id_endereco_fk FOREIGN KEY(id_endereco) REFERENCES Localizacao(cep)
    

);