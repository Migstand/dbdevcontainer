-- Parte de Raquel

-- Questão 1
SELECT nome, email, crm -- Seleciona o nome e e-mail da pessoa e o CRM do médico
FROM Pessoa -- Começa pela tabela Pessoa, onde estão nome e email

JOIN Medico -- Relaciona a pessoa com o cadastro de médico
ON Pessoa.cpf = Medico.cpf_pessoa;



-- Questão 2
SELECT nome, email, senha -- Seleciona o nome e e-mail da pessoa e a senha do paciente
FROM Pessoa -- Começa pela tabela Pessoa, onde estão nome e email

JOIN Paciente -- Relaciona a pessoa com o cadastro de paciente
ON Pessoa.cpf = Paciente.cpf_pessoa;



-- Questão 3
SELECT crm, descricao -- Seleciona o CRM do médico e a descrição da especialidade
FROM Medico -- Começa pela tabela Médico, onde está o CRM

JOIN MedicoEspecialidade -- Relaciona o médico com as especialidades cadastradas
ON Medico.cpf_pessoa = MedicoEspecialidade.cpf_medico

JOIN Especialidade -- Busca a descrição da especialidade pelo seu ID
ON MedicoEspecialidade.id_especialidade = Especialidade.id;

-- Parte de Fontenele
-- QUESTÃO 4 Listar o CRM de todos os médicos cardiologistas.

SELECT Medico.crm -- Seleciona apenas a coluna CRM dos médicos.

FROM Medico

INNER JOIN MedicoEspecialidade
ON Medico.cpf_pessoa = MedicoEspecialidade.cpf_medico -- Relaciona cada médico às suas especialidades.


INNER JOIN Especialidade
ON MedicoEspecialidade.id_especialidade = Especialidade.id -- Relaciona o código da especialidade à tabela Especialidade.

WHERE Especialidade.descricao = 'Cardiologia'; -- Filtra apenas os médicos cuja especialidade é Cardiologia.

-- QUESTÃO 5 Listar o nome, CPF, CRM e senha dos pacientes que também são médicos.

SELECT
    Pessoa.nome,
    Pessoa.cpf,
    Medico.crm,
    Paciente.senha

FROM Pessoa

INNER JOIN Paciente
ON Pessoa.cpf = Paciente.cpf_pessoa -- Relaciona a pessoa com seus dados de paciente.

INNER JOIN Medico
ON Pessoa.cpf = Medico.cpf_pessoa; -- Relaciona a mesma pessoa com seus dados de médico.

-- QUESTÃO 6 Listar o nome dos médicos e as respectivas quantidades de consultas agendadas.

SELECT
    Pessoa.nome,
    COUNT(Agendamento.dh_consulta) AS quantidade_consultas -- Exibe o nome do médico e conta quantas consultas ele possui.

FROM Medico

INNER JOIN Pessoa
ON Medico.cpf_pessoa = Pessoa.cpf -- Obtém o nome de cada médico.

LEFT JOIN Agendamento
ON Medico.cpf_pessoa = Agendamento.cpf_medico -- O LEFT JOIN garante que médicos sem consultas também apareçam. Relaciona o médico aos agendamentos.

GROUP BY Pessoa.nome; -- Agrupa os registros por médico para que o COUNT conte as consultas de cada um.



-- ** Parte de Miguel **
--falta terminar

SELECT COUNT(*) 
    FROM Medico

    JOIN Medicoespecialidade
    ON Medico.cpf_pessoa = Medicoespecialidade.cpf_medico
    
    JOIN Especialidade
    ON Medicoespecialidade.id_especialidade = Especialidade.id; -- Seleciona todos os médico que fam parte daquela especialidade

SELECT Pessoa.nome, Pessoa.email, 
    Agendamento.dh_consulta, Agendamento.valor_consulta, 
    Medico.crm

    FROM Agendamento
    
    INNER JOIN Paciente
    ON Paciente.cpf_pessoa = Agendamento.cpf_paciente

    JOIN Medico
    ON Medico.cpf_pessoa = Agendamento.cpf_medico

    JOIN Pessoa
    ON Medico.cpf_pessoa = Pessoa.cpf OR Paciente.cpf_pessoa = Pessoa.cpf;



-- -- -- Parte de Gustavo
SELECT Agendamento.dh_consulta -- Seleciona a data e hora das consultas agendadas.

FROM Agendamento -- Começa pela tabela de agendamentos.

JOIN Medico -- Relaciona cada consulta ao médico responsável.
ON Agendamento.cpf_medico = Medico.cpf_pessoa

JOIN MedicoEspecialidade -- Relaciona o médico às suas especialidades.
ON Medico.cpf_pessoa = MedicoEspecialidade.cpf_medico

JOIN Especialidade -- Obtém a descrição da especialidade de cada médico.
ON MedicoEspecialidade.id_especialidade = Especialidade.id

WHERE Especialidade.descricao = 'Cardiologista'; -- Filtra apenas os médicos cuja especialidade é Cardiologista.

-- ==============================

SELECT
    Pessoa.nome, -- Seleciona o nome do médico.
    Medico.crm, -- Seleciona o CRM do médico.
    AVG(Agendamento.valor_consulta) AS media_consultas -- Calcula a média do valor das consultas do médico.

FROM Medico -- Começa pela tabela de médicos.

JOIN Pessoa -- Relaciona o médico aos seus dados pessoais.
ON Medico.cpf_pessoa = Pessoa.cpf

JOIN Agendamento -- Relaciona cada médico às consultas agendadas.
ON Medico.cpf_pessoa = Agendamento.cpf_medico

WHERE EXTRACT(MONTH FROM Agendamento.dh_consulta) = 12 -- Filtra apenas consultas realizadas no mês de dezembro.
AND EXTRACT(YEAR FROM Agendamento.dh_consulta) = 2020 -- Filtra apenas consultas realizadas no ano de 2020.

GROUP BY Pessoa.nome, Medico.crm; -- Agrupa os resultados por nome e CRM para calcular a média de cada médico.