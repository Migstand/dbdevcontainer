-- ** PARTE DE MIGUEL **
SELECT * FROM Pessoa; --Coleta todos os dados da tabela pessoa
SELECT nome, email, data_nasc 
    FROM Pessoa; -- Lista todos os nome, emails e datas de nascimento

SELECT nome, email, data_nasc FROM Pessoa LIMIT 6 OFFSET 2; --Pega os primeiros dados a partir do 3 até o oitavo. OBS: PRECISO SABER O QUE O ORDER BY FAZ

SELECT nome, email, EXTRACT(YEAR FROM AGE(CURRENT_DATE, data_nasc)) FROM Pessoa; -- Seleciona os nomes, os emails e as idades das pessoas

SELECT COUNT(*)  FROM Agendamento ; -- Seleciona a quantidade de tabelas de agendamento

-- ** PARTE DE FONTENELE **

-- QUESTÃO 6 Listar a data/hora das consultas e os respectivos valores com desconto de 5%. Os valores devem ser precedidos com "R$". Por exemplo: R$ 150.00.

SELECT
    dh_consulta,
    CONCAT('R$ ', valor_consulta * 0.95) AS valor_com_desconto /* CONCAT junta o "R$" com o "valor * 0.95" que aplica o desconto; AS dá um nome ao resultado da operação */
FROM Agendamento; -- Os dados serão obtidos da tabela Agendamento.

-- QUESTÃO 7 Listar nome, cpf e e-mail dos pacientes que não possuem plano de saúde.
 
SELECT nome, cpf, email
    FROM Pessoa

    JOIN Paciente
    ON Pessoa.cpf = Paciente.cpf_pessoa

    WHERE Paciente.plano_saude = false

-- SELECT
--     nome,
--     cpf,
--     email
    
-- FROM Paciente -- De Paciente
-- WHERE plano_saude IS NULL; -- onde plano_saude é nulo

-- QUESTÃO 8 Listar os dados dos agendamentos registrados para o mesmo o mês da consulta.

SELECT * -- Seleciona todas as colunas da tabela Agendamento.

FROM Agendamento 

WHERE EXTRACT(MONTH FROM dh_agendamento) = EXTRACT(MONTH FROM dh_consulta); /* EXTRACT(MONTH FROM ...) extrai apenas o mês da data. Apenas os agendamentos em que o mês do registro é igual ao mês da consulta serão exibidos. */

-- QUESTÃO 9 Lista cpf, nome e e-mail dos pacientes que não possuem telefone.

SELECT   
    cpf,
    nome,
    email

FROM Paciente 

WHERE telefone IS NULL; -- Filtra apenas os pacientes cujo telefone não foi informado.

-- QUESTÃO 10 Listar a data das consultas cujo valor está entre R$ 50,00 e R$ 100,00.

SELECT dh_consulta

FROM Agendamento

WHERE valor_consulta BETWEEN 50.00 AND 100.00; -- BETWEEN verifica se um valor está dentro de um intervalo. Apenas retornando nesse caso apenas consultas maiores que 50,00 e menores ou iguais a 100,00.

-- Parte de Gustavo

SELECT cpf, nome, email
FROM Paciente
WHERE cidade = 'Natal'; --Lista o cpf, nome e email dos pacientes que moram em Natal 

SELECT cpf, nome, email, data_nascimento
FROM paciente
ORDER BY data_nascimento; -- Seleciona o nome, email e data_nascimento ordenado pela data de nascimento

SELECT COUNT(*) AS quantidade_pacientes
FROM Paciente
WHERE plano_saude IS NULL; -- Conta quantos pacientes existem e quais possuem o plano de saúde vazio

SELECT data_consulta,
       MAX(valor) AS maior_valor,
       MIN(valor) AS menor_valor
FROM consulta
GROUP BY data_consulta; 



-- ** PARTE DE RAQUEL **

-- Questão 15
SELECT AVG(valor_consulta) AS media_valores -- Calcula a média dos valores das consultas
    FROM Agendamento -- Utiliza a tabela de agendamentos, onde estão os valores das consultas

    -- Filtra apenas os agendamentos realizados no mês de dezembro
    WHERE EXTRACT(MONTH FROM dh_agenda) = 12;


-- Questão 16
SELECT nome, email, data_nasc -- Seleciona o nome, e-mail e data de nascimento da pessoa
    FROM Pessoa -- Começa pela tabela Pessoa

    JOIN Paciente -- Relaciona a pessoa com o cadastro de paciente
    ON Pessoa.cpf = Paciente.cpf_pessoa

    JOIN Agendamento -- Relaciona o paciente aos seus agendamentos
    ON Paciente.cpf_pessoa = Agendamento.cpf_paciente

    -- Compara o dia e o mês do nascimento com o dia e o mês da consulta
    WHERE EXTRACT(DAY FROM Pessoa.data_nasc) = EXTRACT(DAY FROM Agendamento.dh_consulta)
    AND EXTRACT(MONTH FROM Pessoa.data_nasc) = EXTRACT(MONTH FROM Agendamento.dh_consulta);


-- Questão 17
SELECT nome, email, cpf, descricao -- Seleciona o nome, e-mail, CPF e a descrição da especialidade
    FROM Pessoa

    JOIN Medico -- Relaciona a pessoa com o cadastro de médico
    ON Pessoa.cpf = Medico.cpf_pessoa

    JOIN MedicoEspecialidade -- Relaciona o médico às especialidades cadastradas
    ON Medico.cpf_pessoa = MedicoEspecialidade.cpf_medico

    JOIN Especialidade -- Relaciona o ID da especialidade para obter sua descrição
    ON MedicoEspecialidade.id_especialidade = Especialidade.id;


-- Questão 18
SELECT Pessoa.nome, -- Nome do médico
    COUNT(Agendamento.dh_consulta) AS quantidade_consultas -- Conta quantas consultas esse médico possui
    
    FROM Pessoa

    JOIN Medico -- Relaciona a pessoa com o cadastro de médico
    ON Pessoa.cpf = Medico.cpf_pessoa

    JOIN Agendamento -- Relaciona o médico às consultas agendadas
    ON Medico.cpf_pessoa = Agendamento.cpf_medico

    GROUP BY Pessoa.nome;