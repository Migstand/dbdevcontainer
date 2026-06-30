CREATE TABLE IF NOT EXISTS Pessoa(
    cpf CHAR(11) PRIMARY KEY,
    email VARCHAR(50) NOT NULL,
    nome VARCHAR(150) NOT NULL,
    data_nasc DATE NOT NULL,
    endereco VARCHAR(300) NOT NULL,
    telefone VARCHAR(15),
    CONSTRAINT Pessoa_UN UNIQUE(email, nome)
);

INSERT INTO Pessoa (nome, email, cpf, data_nasc, endereco, telefone)
VALUES
('Pedro I', 'pp@email.com', '002', '1479-01-10', 'R. Vasco', NULL),
('Pedro II', 'ps@email.com', '003', '1516-02-10', 'R. Flamengo', '5501'),
('D João VI', 'dj@email.com', '001', '1415-12-01', 'R. Portugal', NULL),
('JJ Xavier', 'jj@email.com', '004', '1746-11-12', 'R. Minas', '5502');

-- Atualizar a data de nascimento de D João VI
UPDATE Pessoa
SET data_nasc = '1416-12-01'
WHERE nome = 'D João VI';

-- Atualizar o telefone e o e-mail de Pedro I
UPDATE Pessoa
SET telefone = '5503',
    email = 'pf@email.com'
WHERE nome = 'Pedro I';

-- Adicionar o dígito 9 no início de todos os telefones
UPDATE Pessoa
SET telefone = CONCAT('9', telefone)
WHERE telefone IS NOT NULL;

SELECT
    nome,
    TO_CHAR(data_nasc, 'DD-MM-YYYY') AS data_nascimento
FROM Pessoa;


CREATE TABLE IF NOT EXISTS Paciente(
    cpf_pessoa CHAR(11) PRIMARY KEY REFERENCES Pessoa(cpf),
    senha varchar(20) not NULL,
    plano_saude boolean not NULL DEFAULT FALSE

);

INSERT INTO Paciente (cpf_pessoa, senha, plano_saude)
    values ('002','senha1', FALSE), ('003','senha2', TRUE);

--MINHA PARTE

CREATE TABLE IF NOT EXISTS Medico(
    crm varchar(10) UNIQUE NOT NULL,
    cpf_pessoa char(11) NOT NULL PRIMARY KEY,
    CONSTRAINT Medico_Pessoa_FK FOREIGN KEY(cpf_pessoa) REFERENCES Pessoa(CPF)
);

INSERT INTO Medico (cpf_pessoa, crm)
    VALUES ('001', '111'), ('004', '112');


CREATE TABLE IF NOT EXISTS Agendamento(
    dh_agenda timestamp NOT NULL,
    valor_consulta float NOT NULL,
    dh_consulta timestamp PRIMARY KEY,
    cpf_medico char(11) not null,
    cpf_paciente char(11) not null,
    CONSTRAINT Agendamento_Paciente_FK FOREIGN KEY(cpf_paciente) REFERENCES Paciente(cpf_pessoa),
    CONSTRAINT Agendamento_Medico_FK FOREIGN KEY(cpf_medico) REFERENCES Medico(cpf_pessoa) 
);

INSERT INTO Agendamento (cpf_paciente, cpf_medico, dh_consulta, dh_agenda, valor_consulta)
VALUES
('002', '001', '1782-04-14 16:00', '1782-03-14 10:04:45', 80.0),
('002', '004', '1782-04-15 10:00:00', '1782-03-14 10:04:45', 100.0),
('002', '004', '1783-05-17 08:00:00', '1783-05-10 16:32:00', 100.0),
('003', '001', '1783-05-17 08:30:00', '1783-05-09 09:05:56', 0.0);

UPDATE Agendamento
SET dh_consulta = '1783-05-19'::date + (dh_consulta - date_trunc('day', dh_consulta)),
    valor_consulta = 150.0
WHERE dh_consulta = '1783-05-17';

--Fim da minha parte

CREATE TABLE IF NOT EXISTS Especialidade(
    id SERIAL PRIMARY KEY,
    descricao varchar(300) NOT NULL
);

CREATE TABLE IF NOT EXISTS MedicoEspecialidade(
    cpf_medico char(11),
    id_especialidade int,
    CONSTRAINT MedicoEspecialidade_Medico_FK FOREIGN KEY(cpf_medico) REFERENCES Medico(cpf_pessoa),
    CONSTRAINT MedicoEspecialidade_Especialidade_FK FOREIGN KEY(id_especialidade) REFERENCES Especialidade(id)
);

INSERT INTO Especialidade (descricao)
    values ('Pediatra'), ('Cardiologista'), ('Ortopedista');

INSERT INTO MedicoEspecialidade(cpf_medico, id_especialidade)
    values ('001', 1), ('004', 2), ('004', 3);

DELETE FROM MedicoEspecialidade
WHERE cpf_medico = '004'
AND id_especialidade = 2;

INSERT INTO MedicoEspecialidade (cpf_medico, id_especialidade)
    values ('004', 1);

-- DELETANDO

DELETE FROM Agendamento
    WHERE cpf_paciente = '002' and dh_consulta = '1783-05-19'::date;

DELETE FROM Agendamento
    WHERE cpf_medico = '001' and valor_consulta = 0.0;

DELETE FROM Paciente 
    WHERE plano_saude = TRUE or cpf_pessoa IN (SELECT cpf FROM Pessoa WHERE telefone IS NULL);;    

DELETE FROM Medico
    WHERE cpf_pessoa = '004';