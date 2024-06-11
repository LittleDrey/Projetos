/*Andrey Henrique Rodrigues dos Santos - 35774215
Caio Vinícius Oliveira Duarte - 36054658
Juan Pablo Sousa Araújo dos Santos - 35628791
*/

create database lanchoneteSaborEDelicia
default character set utf8
default collate utf8_general_ci;

create table Cliente (
idCli int primary key not null auto_increment,
nomeCli varchar(45) not null,
emailCli varchar(45) not null,
telCli varchar(45) not null
);

create table EnderecoCli (
idEnderecoCli int primary key not null auto_increment,
idCli int,
ruaCli varchar(45) not null,
bairroCli varchar(45) not null,
cepCli varchar (8) not null,
foreign key (idCli) references Cliente(idCli)
);

create table Funcionario (
idFuncionario int primary key not null auto_increment,
nomeFunc varchar(45) not null,
cargoFunc varchar(45) not null,
dtContrato date not null,
salarioFunc decimal(6,2) not null,
dtNasc date,
sexo enum('M', 'F')
);

create table EnderecoFuncionario (
idEnderecoFuncionario int primary key not null auto_increment,
idFuncionario int,
ruaFunc varchar(45) not null,
bairroFunc varchar(45) not null,
numeroFunc int,
foreign key (idFuncionario) references Funcionario(idFuncionario)
);

create table Pedido (
nmrPedido int primary key not null auto_increment,
idCli int,
idFuncionario int,
dataPed date not null,
horaPed time not null,
estadoPed varchar(45),
foreign key (idCli) references Cliente(idCli),
foreign key (idFuncionario) references Funcionario(idFuncionario)
);

create table Pedido_ItemMenu (
idPedidoItem int primary key not null auto_increment,
nmrPedido int,
codItem int,
qntdItem int not null,
tempoPreparo time,
sttsEntrega varchar(20),
foreign key (nmrPedido) references Pedido(nmrPedido),
foreign key (codItem) references ItemMenu(codItem)
);

create table ItemMenu (
codItem int primary key not null auto_increment,
nomeItem varchar(45) not null,
descItem varchar(45) not null,
precoItem decimal(4,2) not null,
categoriaItem varchar(45)
);

create table Fornecedor (
idFornecedor int primary key not null auto_increment,
nomeEmpresa varchar(45) not null,
representante varchar(45) not null,
telFornecedor varchar(45) not null,
emailFornecedor varchar(45) not null,
listaIngredientes varchar(45) not null
);

create table EnderecoFornecedor (
idEnderecoFornecedor int primary key not null auto_increment,
idFornecedor int,
cepForne varchar(8) not null,
ruaForne varchar(45) not null,
numeroForne varchar(45) not null,
bairroForne varchar(45) not null,
cidadeForne varchar(45) not null,
estadoForne varchar(45) not null,
foreign key (idFornecedor) references Fornecedor(idFornecedor)
);

create table Ingredientes (
idIngrediente int primary key not null auto_increment,
idFornecedor int,
nomeIng varchar(45) not null,
estoqueDisponivel tinyint not null,
foreign key (idFornecedor) references Fornecedor(idFornecedor)
);

create table ItemMenu_Ingredientes (
idItemMenu_Ingredientes int primary key not null auto_increment,
codItem int,
idIngrediente int,
qntdIngredientes int,
foreign key (codItem) references ItemMenu(codItem),
foreign key (idIngrediente) references Ingredientes(idIngrediente)
);

create table Pedido_Ingredientes (
idPedido_Ingredientes int primary key not null auto_increment,
nmrPedido int,
idIngrediente int,
qntdPedido int,
foreign key (nmrPedido) references Pedido(nmrPedido),
foreign key (idIngrediente) references Ingredientes(idIngrediente)
);

insert into Cliente (nomeCli, emailCli, telCli) values 
('Gabriel Barbosa', 'gabrielvacilao@teste.com', '92345-6789'),
('Renato Augusto', 'renato061@teste.com', '98765-4321'),
('André de Bonifácio', 'bonifacio765@teste.com', '93439-6216'),
('Adriano Almeida', 'almeidaadrian@teste.com', '93668-4842'),
('Casemiro Miguel', 'cazetv@teste.com', '92637-1317');

insert into EnderecoCli (idCli, ruaCli, bairroCli, cepCli) values
('1', 'Avenida Afonso Pena', 'Boa Viagem', '30130005'),
('2', 'Tenente-Coronel Cardoso', 'Centro', '28035042'),
('3', 'Serra da Bragança', 'Vila Gomes Cardim', '03318000'),
('4', 'Crisitino Olsen', 'Jardim Sumaré', '16015244'),
('5', 'Avenida Tocantins', 'Vila Jardim Rio Claro', '75802095');

insert into Funcionario (nomeFunc, cargoFunc, dtContrato, salarioFunc, dtNasc, sexo) values
('Maria Santos', 'Atendente', '2024-02-05', '2150', '1997-05-03', 'F'),
('Tomás Araujo', 'Gerente', '2019-09-09', '2100', '1963-12-09', 'M'),
('Laura Barbosa', 'Cozinheira', '2021-05-07', '2000', '1996-12-26', 'F'),
('Murilo Ferreira', 'Auxiliar de Limpeza', '2022-09-17', '1900', '1986-10-26', 'M'),
('Júlia Castro', 'Auxiliar de Cozinha', '2022-12-23', '2000', '1982-11-29', 'F');

insert into EnderecoFuncionario (idFuncionario, ruaFunc, bairroFunc, numeroFunc) values
('1', 'Avenida Rio Branco', 'Centro', '171'),
('2', 'Domingo Olímpio', 'Centro', '37'),
('3', 'Governador José Mourão', 'Nazaré', '413'),
('4', 'Avenida São João', 'Vila Joana', '177'),
('5', 'da Imprensa', 'Monte Castelo', '777');

insert into Pedido (idCli, idFuncionario, dataPed, horaPed, estadoPed) values
('1', '3', '2024-05-26', '17:30:00', 'Pendente'),
('2', '3', '2024-05-27', '18:00:00', 'Em preparo'),
('3', '5', '2024-05-15', '14:27:00', 'Pronto'),
('4', '5', '2024-05-11', '21:13:00', 'Em preparo'),
('5', '5', '2024-05-09', '22:22:22', 'Pendente');

insert into ItemMenu (nomeItem, descItem, precoItem, categoriaItem) values
('Bravo01', 'Pão tradicional, hambúrguer 250g, cheddar, bacon, alface e tomate', '19.50', 'Hambúrguer'),
('Gourmet', 'Pão de leite, 2 hambúrguer 250g, cebola caramelizada, bacon', '21.50', 'Hambúrguer'),
('Mousse de Maracujá', 'Mousse delicioso e cremoso de maracujá', '15.00', 'Sobremesa'),
('Pudim', 'bolo de leite condesado cremoso', '17.00', 'Sobremesa'),
('Salada Tropical', 'mix de folhas, leguminosas e proteínas', '10.00', 'Salada');

insert into Pedido_ItemMenu (idPedidoItem, nmrPedido, codItem, qntdItem, tempoPreparo, sttsEntrega) values
('1', '1', '1', '2', '50:00', 'Pendente-Delivery'),
('2', '2', '2', '3', '55:00', 'Em preparo-Delivery'),
('3', '3', '3', '1', '25:00', 'Pronto-Retirada'),
('4', '4', '4', '2', '30:00', 'Em preparo-Delivery'),
('5', '5', '5', '4', '40:00', 'Pendente-Retirada');

insert into Fornecedor (nomeEmpresa, representante, telFornecedor, emailFornecedor, listaIngredientes) values
('AsA - Alimentos e Seguros', 'Davi Silva Pereira', '93519-4480', 'alimentos@asa.com.br', 'Pães, queijo e bacon'),
('Ingredientes - LTDA', 'Giovanna Alves Santos', '93095-6838', 'ltdaingredientes@ltda.com.br', 'Alface, tomate, maracujá e leite condensado'),
('Nossa Kasa - Alimentos', 'Mariana Alves Silva', '97946-6276', 'nossaksa@.gmail.com', 'Cebola e carne');

insert into EnderecoFornecedor (idFornecedor, cepForne, ruaForne, numeroForne, bairroForne, cidadeForne, estadoForne) values
('1', '70305908', 'SCS Quadra 5 Bloco C Lote 15/16', '229', 'Asa Sul', 'Brasília', 'DF'),
('2', '08450360', 'Lombilho', '469', 'Lajeado', 'São Paulo', 'SP'),
('3', '19907240', 'Crsitovão Colombo', '893', 'Vila Sá', 'Ourinhos', 'SP');

insert into Ingredientes (idFornecedor, nomeIng, EstoqueDisponivel) values 
('1', 'Pão', '300'),
('1', 'Queijo', '250'),
('1', 'Bacon', '100'),
('2', 'Alface', '313'),
('2', 'Tomate', '276'),
('2', 'Maracujá', '139'),
('2', 'Leite Condensado', '93'),
('3', 'Cebola', '106'),
('3', 'Carne', '73');

insert into pedido_ingredientes (nmrPedido, idIngrediente, qntdPedido) values
('1', '1', '2'),
('2', '2', '3'),
('3', '3', '1'),
('4', '4', '2'),
('5', '5', '4');

insert into ItemMenu_Ingredientes (codItem, idIngrediente, qntdIngredientes) values
('1', '1', '6'),
('2', '9', '4'),
('3', '6', '4'),
('4', '7', '4'),
('5', '4', '2');

select * from Funcionario;
select * from Cliente;
select * from Fornecedor;

select * from Funcionario where salarioFunc > 1900;
select * from Funcionario where sexo = 'F';
select * from ItemMenu where precoItem >= 15;
select idCli, nomeCli from Cliente where nomeCli like 'A%';

DELIMITER $$

create procedure verificar_estoque(out estoque int)
begin
set estoque = estoque;
select count(*) into estoque from ingredientes;
end $$

call verificar_estoque(@total);
select @total;

show procedure status;

alter table ItemMenu modify column descItem varchar(250);
delete from Ingredientes where idIngrediente = 19;
update ItemMenu set codItem = 5 where codItem = 15;
alter table Ingredientes modify column EstoqueDisponivel int;
delete from pedido_itemmenu where idPedidoItem = 0;
delete from pedido_ingredientes where nmrPedido = 1;
drop procedure verificar_estadoPed_pedido;





