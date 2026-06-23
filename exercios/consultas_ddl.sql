CREATE TABLE IF NOT EXISTS Medico(
    crm varchar(10) NOT NULL,
    CONSTRAINT cpf_pessoa char(11) FOREIGN KEY(cpf) REFERENCES Pessoa
);
    

CREATE TABLE IF NOT EXISTS Agendamento(
    dh_agenda timestamp NOT NULL,
    valor_consulta float NOT NULL DEFAULT(0.0),
    dh_consulta timestamp PRIMARY KEY,
    CONSTRAINT cpf_paciente char(11) FOREIGN KEY(cpf_pessoa) REFERENCES Paciente,
    CONSTRAINT cpf_medico char(11) FOREIGN KEY(cpf_pessoa) REFERENCES Medico  
);