/*PROJETO INTEGRADOR - ATIVIDADE 2 (SCRIPT)*/


/*CRIANDO E USANDO O BANCO DE DADOS*/
create database Mercado;
use mercado;



/*CRIANDO TABELA "FORNECEDOR' NO BANCO DE DADOS*/
create table fornecedor (
idFornecedor int not null auto_increment,
nome varchar (200) not null, 
cnpj varchar (20) not null,
data_fundacao date not null,
primary key(idFornecedor));



/*CRIANDO TABELA "PRODUTO" NO BANCO DE DADOS*/
create table produtos (
idProduto int not null auto_increment,
nome varchar (255) not null,
categoria varchar (150) not null, 
valor double (9,2) not null, 
qntd_disponivel int not null, 
fornecedor_id int not null, 
primary key (idProduto), 
foreign key (fornecedor_id) references fornecedor(idFornecedor) on delete cascade);



/*CRIANDO TABELA "CARGO' NO BANCO DE DADOS*/
create table cargo (
idCargo int not null auto_increment, 
cargo varchar (100) not null,
primary key(idCargo));



/*CRIANDO TABELA "FUNCIONARIOS" NO BANCO DE DADOS*/	
create table funcionarios (
idFuncionario int not null auto_increment, 
nome varchar (200) not null, 
cpf varchar (20) not null unique,
salario decimal (9,2),
login varchar (100) not null, 
senha varchar (150) not null,
cargo_id int not null,
primary key (idFuncionario), 
foreign key(cargo_id) references cargo(idCargo)on delete cascade);


/*CRIANDO TABELA "CLIENTES" NO BANCO DE DADOS*/
create table clientes (
idCliente int not null auto_increment, 
nome varchar (255) not null, 
cpf varchar (20) not null unique, 
telefone varchar (20) not null, 
email varchar (150) not null, 
primary key (idCliente));



/*CRIANDO TABELA "VENDA" NO BANCO DE DADOS*/
create table venda (
idVenda int not null auto_increment,
qntd_vendida int not null, 
valor_vendido double(9,2) not null, 
data_venda datetime not null, 
produto_id int not null, 
funcionario_id int not null,
cliente_id int not null,
primary key(idVenda), 
foreign key(produto_id) references produtos(idProduto) on delete cascade, 
foreign key(funcionario_id) references funcionarios(idFuncionario) on delete cascade,
foreign key(cliente_id) references clientes(idCliente) on delete cascade);



/*INSERINDO DADOS NA TABELA "CLIENTES"*/
insert into clientes values 
(default, 'Manuela Isabelle Lopes', '843.823.061-08', '(11)93482-0194', 'manuela_isa@arecocomercial.com.br'),
(default, 'Sophia Alana Malu Galvão', '349.322.022-70', '(11)93483-0485', 'sophia.alana.galvao@estagiarios.com'),
(default, 'Nicolas Benício Mário Nascimento', '068.960.900-06', '(11)97374-1793', 'nicolasbenicionascimento@transmazza.com.br'),
(default, 'Lívia Emanuelly Jaqueline Gomes', '385.615.652-68', '(11)93849-0284', 'livia-gomes72@edepbr.com.br');



/*INSERINDO DADOS NA TABELA "CARGO"*/
insert into cargo values 
(default, 'Vendedor'), 
(default, 'Financeiro'),
(default, 'Gerente');



/*INSERINDO DADOS NA TABELA "FUNCIONARIOS"*/
insert into funcionarios values 
(default, 'Bento Fábio Barros', '059.128.884-28', 'bento', sha1(1234), 1),
(default, 'Elisa Giovana Moreira', '369.991.199-37', 'elisa', sha1(4321), 1),
(default, 'Luan Edson da Mota', '446.651.867-07', 'luan', sha1('luan1234'), 1),
(default, 'Iago Pedro Martins', '696.516.993-10', 'iago', sha1('iago1234'), 2),
(default, 'Kamilly Raquel Almada', '915.466.759-30', 'kamilly', sha1('kamilly123'), 2),
(default, 'Vinicius Stringue', '982.387.179-57', 'vinicius', sha1('vinicius123'), 3);



/*INSERINDO DADOS NA TABELA "FORNECEDOR"*/
insert into fornecedor values 
(default, 'Camil', '32.151.979/0001-95', '1963-03-10'),
(default, 'Knorr', '65.521.562/0001-26', '1938-10-03'),
(default, 'Coca-Cola', '76.418.664/0001-37', '1892-01-29'),
(default, 'Dolly', '49.253.802/0001-00', '1987-01-20'),
(default, 'Dove', '76.756.337/0001-95', '1957-10-22'),
(default, 'Colgate', '07.164.932/0001-19', '1806-02-15'), 
(default, 'Omo', '87.907.454/0001-29', '1905-03-18'), 
(default, 'Mister Musculo', '93.160.375/0001-08', '1978-04-19');



/*INSERINDO DADOS NA TABELA "PRODUTOS"*/
insert into produtos values 
(default, 'Arroz', 'Grãos', '20.00', 250, 1),
(default, 'Feijão', 'Grãos', '15.00', 300, 1),
(default, 'Feijão', 'Grãos', '18.00', 400, 2),
(default, 'Arroz', 'Grãos', '17.00', 200, 2),
(default, 'Coca-Cola', 'Bebidas', 4050,'10.00', 3),
(default, 'Sabão em pó', 'Limpeza', 350, '13.00', 7),
(default, 'Pasta de dente', 'Higiene', 200,  '9.00', 6),
(default, 'Escova de dente', 'Higiene', 150, '7.00', 6), 
(default, 'Refrigerante Dolly', 'Bebidas', 500, '5.00', 4);



/*INSERINDO DADOS NA TABELA "VENDA"*/
insert into venda (idVenda, qntd_vendida, valor_vendido, data_venda, produto_id, funcionario_id, cliente_id) values
(default, 2, '40.00', '2020-10-02', 1, 1, 2), 
(default, 1, '15.00', '2020-10-03', 2, 3, 1),
(default, 1, '17.00', '2021-02-10', 4, 2, 2), 
(default, 10, '10.00', '2021-03-09', 5, 3, 4), 
(default, 5, '5.00', '2021-10-02', 7, 1, 4);

