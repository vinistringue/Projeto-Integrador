/*	ATIVIDADE 3 - PROJETO INTEGRADOR	*/


/* EXERCICIO 1 - Ajuste questões de segurança, incluindo usuários, papéis e permissões.*/

/* CRIANDO 3 USUÁRIOS "VENDEDORES" */
create user 'bento'@'localhost' identified by '4321';
create user 'elisa'@'localhost' identified by '4321';
create user 'luan'@'localhost' identified by '4321';

/* CRIANDO 2 USUÁRIOS "FINANCEIRO" */
create user 'iago'@'localhost' identified by '4321';
create user 'kamilly'@'localhost' identified by '4321';

/* CRIANDO USUÁRIO "GERENTE" */
create user 'vinicius'@'localhost' identified by '1234';

/* CRIANDO ROLE/PAPEL PARA "VENDEDORES", ATRIBUINDO PERMISSÕES E ATRIBUINDO ROLE PARA USUÁRIOS */
create role 'vendedores';
grant select, insert, update, delete on mercado.clientes to 'vendedores';
grant select, insert, update, delete on mercado.produtos to 'vendedores';
grant 'vendedores' to 'bento'@'localhost';
grant 'vendedores' to 'elisa'@'localhost';
grant 'vendedores' to 'luan'@'localhost';
flush privileges;

/* CRIANDO ROLE/PAPEL PARA "FINANCEIRO", ATRIBUINDO PERMISSÕES E ATRIBUINDO ROLE PARA USUÁRIOS */
create role 'financeiro';
grant select on mercado.venda to 'financeiro';
grant select on mercado.produtos to 'financeiro';
grant select on mercado.fornecedor to 'financeiro';
grant select on mercado.clientes to ' financeiro';
grant 'financeiro' to 'iago'@'localhost';
grant 'financeiro' to 'kamilly'@'localhost';
flush privileges;

/* CRIANDO ROLE/PAPEL PARA "GERENTE", ATRIBUINDO PERMISSÕES E ATRIBUINDO ROLE PARA USUÁRIOS */
create role 'gerente';
grant all privileges on mercado.* to 'gerente';
grant 'gerente' to 'vinicius'@'localhost';
flush privileges;




/*EXERCICIO 2 - Crie visões no banco de dados para consultas mais frequentes.*/

/* CRIANDO "VIEW" PRA CONSULTAR "ID_VENDA", "NOME_FUNCIONÁRIO", "PRODUTO_VENDIDO", "QNTD_VENDIDA" */
create view consulta_venda as select v.idVenda, f.nome as 'nome_funcionario', p.nome as 'nome_produto', v.qntd_vendida as 'qntd_vendida'

from funcionarios as f
join venda as v on f.idFuncionario = v.funcionario_id
join produtos as p on v.produto_id = p.idProduto

order by f.idFuncionario;



/* CRIANDO "VIEW" PRA CONSULTAR "ID_VENDA", "FUNCIONÁRIO", "NOME CLIENTE", "NOME PRODUTO", "QNTD_VENDIDA" */
create view consulta_venda_cliente as select v.idVenda as 'idVenda', f.nome as 'funcionario', c.nome as 'nome cliente', 
p.nome as 'nome_produto', v.qntd_vendida as 'qntd_vendida'

from funcionarios as f
join venda as v on f.idFuncionario = v.funcionario_id
join produtos as p on v.produto_id = p.idProduto
join clientes as c on v.cliente_id = c.idCliente

order by v.idVenda;




/* EXERCICIO 3 - Crie ao menos uma stored function, um stored procedure ou um trigger para o banco de dados, selecionando uma 
funcionalidade que seja adequada para tanto. */

DELIMITER $$
create procedure consultar_funcionario (idFuncionario int)

begin
		select f.idFuncionario as Id, f.nome as nome, f.cpf as cpf, f.cargo_id as cargo
        
        from funcionarios as f 
		join cargo as c on f.cargo_id = c.idCargo
        
        
        order by f.idFuncionario;

end 
$$

call mercado.consultar_funcionario(4);

/* EXERCICIO 4 - Crie ao menos um índice composto para uma das tabelas. */

create index nomeCliente on clientes(nome);
create index cpf_cliente on clientes(cpf);
create index nome_funcionario on funcionarios(nome);
create index nome_fornecedor on fornecedor(nome);
create index cnpj_fornecedor on fornecedor(cnpj);




/* EXERCICIO 5 - Está no arquivo de texto, um plano regular de backup que será utilizado */









