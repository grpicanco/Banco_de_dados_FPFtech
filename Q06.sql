-- Baseado no banco de dados de crime, vamos fazer uma algumas questões:
-- Criar um banco de dados
create database crime;

-- Criar o DDL para a estrutura das tabelas
create table pessoa(
    id serial primary key  not null,
    nome varchar(104) not null,
    cpf varchar(11) not null,
    telefone varchar(11) not null,
    data_nascimento date not null,
    endereco varchar(256) not null,
    ativo boolean not null default true,
    criado_em timestamp default now() not null,
    modificado_em timestamp default now() not null
);
create table tipo_crime(
    id serial primary key  not null,
    nome varchar(104) not null,
    tempo_minimo_prisao smallint,
    tempo_maximo_prisao smallint,
    tempo_prescricao smallint,
    ativo boolean not null default true,
    criado_em timestamp default now(),
    modificado timestamp
);
create table crime(
    id serial primary key  not null,
    id_tipo_crime integer not null,
    data timestamp not null,
    local varchar not null ,
    observacao text,
    ativo boolean not null default true,
    criado_em timestamp not null default now(),
    modificado_em timestamp not null default now(),
    foreign key (id_tipo_crime) references tipo_crime(id)
);
create table  crime_pessoa(
    id serial primary key not null,
    id_pessoa integer not null,
    id_crime integer not null,
    tipo varchar(1) not null,
    ativo boolean not null default true,
    criado_em timestamp not null default now(),
    modificado_em timestamp not null default now(),
    foreign key (id_pessoa) references pessoa(id),
    foreign key (id_crime) references crime(id)
);
create table arma(
    id serial primary key not null,
    numero_serie varchar(104),
    descricao varchar(256) not null,
    tipo varchar(1) not null,
    ativo boolean not null default true,
    criado_em timestamp not null default now(),
    modificado_em timestamp not null default now()
);
create table crime_arma(
    id serial primary key not null,
    id_arma integer not null,
    id_crime integer not null,
    ativo boolean not null  default true,
    criado_em timestamp not null default now(),
    modificado_em timestamp not null default now(),
    foreign key (id_arma) references arma(id),
    foreign key (id_crime) references crime(id)
);
