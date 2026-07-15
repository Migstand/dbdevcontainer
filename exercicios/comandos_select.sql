SELECT * FROM dbo.Pessoa; --Coleta todos os dados da tabela pessoa
SELECT nome, email, data_nasc 
    FROM dbo.Pessoa; -- Lista todos os nome, emails e datas de nascimento

SELECT nome, email, data_nasc FROM dbo.Pessoa ORDER BY id LIMIT 6 OFFSET 2; --Pega os primeiros dados a partir do 3 até o oitavo. OBS: PRECISO SABER O QUE O ORDER BY FAZ

SELECT nome, email, concat((data_nasc_max)-data_nasc) FROM dbo.Pessoa

