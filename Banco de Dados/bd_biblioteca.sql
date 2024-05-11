create database biblioteca;
use biblioteca;

create table livro (
     nr int(4) primary key not null,
     titulo varchar(20) not null,
     autor varchar(20) not null,
     preco decimal(6,2)
);

create table leitor (
     cod int(4) primary key not null,
     nome varchar(20) not null,
     cidade varchar(20) not null,
     cpostal varchar(20) not null
);

create table req (
     liv int(4),
     lei int(4),
     datar date,
     datae date,
     constraint fk_liv foreign key (liv) references livro(nr),
     constraint fk_lei foreign key (lei) references leitor(cod),
     constraint req_ck check ( datar <= datae),
     primary key (liv, lei, datar)
);

insert into livro (nr, titulo, autor, preco)
values (100, "Os Maias", "Eça de Queiroz", 1100);

insert into livro (nr, titulo, autor, preco)
values (110, "Os Lusíadas", "Luís de Camões", 4900);

update livro 
set preco = 490
where nr = 110;

insert into livro (nr, titulo, autor, preco)
values (120, "A selva", "Ferreira de Castro", 700);

insert into livro (nr, titulo, autor, preco)
values (130, "A Capital", "Eça de Queiroz", 1050);

update livro
set titulo = "A Selva"
where nr = 120;

insert into livro (nr, titulo, autor, preco)
values (140, "Terra Fria", "Ferreira de Castro", 850);

insert into livro (nr, titulo, autor, preco)
values (150, "A Relíquia", "Eça de Queiroz", 900);

alter table leitor 
modify cpostal int(4);

insert into leitor (cod, nome, cidade, cpostal)
values (1, "Antônio", "Lisboa", 1000);

insert into leitor (cod, nome, cidade, cpostal)
values (2, "Chico", "Porto", 4000);

insert into leitor (cod, nome, cidade, cpostal)
values (3, "Marina", "Lisboa", 1100);

insert into leitor (cod, nome, cidade, cpostal)
values (4, "Zeca", "Porto", 4100);

insert into leitor (cod, nome, cidade, cpostal)
values (5, "Manuel", "Gaia", 4400);

insert into leitor (cod, nome, cidade, cpostal)
values (6, "Mafalda", "Matosinhos", 44700);

insert into leitor (cod, nome, cidade, cpostal)
values (7, "Rui", "Lisboa", 1200);

update leitor 
set cpostal = 4470
where cod = 6;

insert into req (liv, lei, datar, datae)
values (100, 1, 95-01-01, 95-02-06);

delete from req 
where liv = 100;

insert into req (liv, lei, datar, datae)
values (100, 1, 1995-01-01, 1995-02-06);

delete from req 
where liv = 100;

insert into req (liv, lei, datar, datae)
values (100, 1, '1995-01-01', '1995-02-06');

update req
set datar = '95-01-01'
where liv = 100;

update req
set datae = '95-02-06'
where liv = 100;

insert into req (liv, lei, datar, datae)
values (110, 2, '95-01-05', '95-03-05');

insert into req (liv, lei, datar, datae)
values (120, 2, '95-02-15', '95-02-25');

insert into req (liv, lei, datar, datae)
value (100, 3, '95-03-10', '95-03-20');

insert into req (liv, lei, datar, datae)
values (130, 6, '95-06-15', null);

insert into req (liv, lei, datar, datae)
values (140, 5, '95-04-15', '95-05-02');

insert into req (liv, lei, datar, datae)
values (100, 1, '95-04-30', '95-05-08');

insert into req (liv, lei, datar, datae)
values (110, 4, '95-04-21', '95-04-26');

insert into req (liv, lei, datar, datae)
values (150, 6, '95-06-30', '95-07-08');

insert into req (liv, lei, datar, datae)
values (130, 5, '95-07-04', '95-07-12');

select * from livro;

select cod, nome from leitor
where cod < 5;

select nome, cidade from leitor
where nome like 'M%' and cod between 2 and 5;

select cidade from leitor
where cpostal > 2000;

select autor, titulo, preco, nr from livro
where (autor = 'Eça de Queiroz' and preco > 1000) or preco < 750;



select titulo, autor, preco from livro
order by preco desc;

select titulo, autor, preco from livro
order by autor desc;

SELECT 
    AVG(preco) AS preco_medio,
    SUM(preco) AS valor_total,
    COUNT(*) AS numero_de_livros,
    MAX(preco) AS preco_mais_caro,
    MIN(preco) AS preco_mais_barato
FROM 
    livro;
    
SELECT 
    autor,
    AVG(preco) AS preco_medio_por_autor
FROM 
    livro
GROUP BY 
    autor;
    
select autor, avg(preco) as preco_medio_autor from livro
group by autor having avg(preco) < 500;

select autor, titulo, preco from livro
where autor like 'E%';

select titulo from livro
where preco = (select max(preco) from livro
where preco < (select max(preco) from livro));

select titulo, datar from livro
where datar > '95-01-01';

select - 13

select (select count(*) from leitor
where nome = 'Antônio' and cidade =  'Lisboa') as antonio_lisboa,
(select count(*) from leitor 
where nome = 'Zeca' and cidade = 'Porto') as zeca_porto;

select distinct a.nome as pessoa1, b.nome as pessoa2, a.cidade
from leitor a, leitor b
where a.id < b. id and a.cidade = b.cidade;

select * from leitor
where nr not IN (select cod_leitor from req 
where nr_livro = 150);






