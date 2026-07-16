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
ON Medico.crm = MedicoEspecialidade.crm_medico -- Relaciona cada médico às suas especialidades.


INNER JOIN Especialidade
ON MedicoEspecialidade.id_especialidade = Especialidade.id_especialidade -- Relaciona o código da especialidade à tabela Especialidade.

WHERE Especialidade.descricao = 'Cardiologia'; -- Filtra apenas os médicos cuja especialidade é Cardiologia.

-- QUESTÃO 5 Listar o nome, CPF, CRM e senha dos pacientes que também são médicos.

SELECT
    Pessoa.nome,
    Pessoa.cpf,
    Medico.crm,
    Paciente.senha

FROM Pessoa

INNER JOIN Paciente
ON Pessoa.cpf = Paciente.cpf -- Relaciona a pessoa com seus dados de paciente.

INNER JOIN Medico
ON Pessoa.cpf = Medico.cpf -- Relaciona a mesma pessoa com seus dados de médico.

-- QUESTÃO 6 Listar o nome dos médicos e as respectivas quantidades de consultas agendadas.

SELECT
    Pessoa.nome,
    COUNT(Agendamento.dh_consulta) AS quantidade_consultas -- Exibe o nome do médico e conta quantas consultas ele possui.

FROM Medico

INNER JOIN Pessoa
ON Medico.cpf = Pessoa.cpf -- Obtém o nome de cada médico.

LEFT JOIN Agendamento
ON Medico.cpf = Agendamento.cpf_medico -- O LEFT JOIN garante que médicos sem consultas também apareçam. Relaciona o médico aos agendamentos.

GROUP BY Pessoa.nome; -- Agrupa os registros por médico para que o COUNT conte as consultas de cada um.



-- ** Parte de Miguel **

SELECT c.*, m.*
    FROM dbo.Especialidade as c, dbo.Medico as m.,
    where c.nome = m.crem; -- Seleciona todos os médico que fam parte daquela especialidade

SELECT 

-- Parte de Gustavo