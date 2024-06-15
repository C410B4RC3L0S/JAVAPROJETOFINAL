-- a linha abaixo cria um banco de dados
create database dbprojetojava;
-- a linha abaixo escolhe o banco de dados a ser utilizado
use dbprojetojava;
-- o bloco de instruções abaixo cria uma tabela
create table tbusuarios(
iduser int primary key,
usuario varchar(50) not null,
fone varchar(15),
login varchar(15) not null unique,
senha varchar (15) not null
);

-- o comando abaixo descreve a tabela
describe tbusuarios;
-- a linha abaixo insere dados na tabela (CRUD)
-- Create -> insert
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(1,'Douglas Galdino','9999-9999','Doug', '12345');
-- a linha abaixo exibe os dados da tabela (CRUD)
-- Read -> select
select * from tbusuarios;

insert into tbusuarios(iduser,usuario,fone,login,senha)
values(2,'Administrador','9999-9999','admin', 'admin');
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(3,'Felipe Rodrigues','9999-9999','lipe', '12345');

-- a linha abaixo modifica dados na tabela (CRUD)
-- update --> update
update tbusuarios set fone='8888-8888' where iduser = 2;

-- a linha abaixo apaga um registro da tabela (CRUD)
-- delete -> delete
delete from tbusuarios where iduser=3;

create table tbclientes(
idcli int primary key auto_increment, 
nomecli varchar(50) not null,
endcli varchar(100) not null,
fonecli varchar(50) not null,
emailcli varchar(50),
cepcli varchar(11) not null
);

describe tbclientes;

insert into tbclientes(nomecli,endcli,fonecli,emailcli,cepcli)
values('Carol Quaresma', 'Rua Mantores, 500','9999-9999', 'carol@carol.com', '21391921');

select * from tbclientes;

create table tbos(
os int primary key auto_increment,
data_os timestamp default current_timestamp,
servico varchar (150),
valor decimal(10,2),
idcli int not null,
foreign key(idcli) references tbclientes(idcli)
);

describe tbos;		

insert into tbos (servico,valor,idcli)
values ('Pintura do banheiro',3000,1);

update tbos set valor=3.000 where os = 1;

select * from tbos;

-- o codigo abaixo traz informações de duas tabelas
select 
O.os,servico,valor,
C.nomecli,fonecli
from tbos as O
inner join tbclientes as C
on (O.idcli = C.idcli);

GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'Estacio@123' WITH GRANT OPTION;

use dbprojetojava;
-- a linha abaixo adiciona um campo a tabela
alter table tbusuarios add column perfil varchar(20) not null;
update tbusuarios set perfil='admin' where iduser=2;
insert into tbusuarios(iduser,usuario,fone,login,senha, perfil)
values(3,'Raphael Professor','9999-9999','raphael', '12345', 'user');

describe tbclientes;
select * from tbclientes;

select idcli as id, nomecli as nome, endcli as endereço, fonecli as telefone, emailcli as email, cepcli as cep from tbclientes;

-- a linha abaixo altera a tabela adicionando um campo em uma determinada posição
alter table tbos add tipo varchar(15) not null after data_os;
alter table tbos add situacao varchar(20) not null after tipo;
alter table tbos add observacao varchar(200) after valor;

select os,date_format(data_os,'%d/%m/%Y - %H:%i'), tipo, situacao, servico, valor, observacao, idcli from tbos where os=1;

GRANT ALL PRIVILEGES ON * . * TO 'root'@localhost;
GRANT ALL PRIVILEGES ON * . * TO 'root'@'%';

-- a instrucao abaixo seleciona e ordena por nome todos os clientes cadastrados
select * from tbclientes order by nomecli;
describe tbclientes;

-- o bloco de instrucoes abaixo faz a selecao e uniao de dados de duas tabelas
-- OSER é uma variavel que contem os campos desejados da tabela OS
-- CLI é outra variavel que contem os campos desejados da tabela clientes
select
Oser.os,data_os,tipo,situacao,servico,valor,observacao,
CLI.nomecli,fonecli
from tbos as OSER
inner join tbclientes as CLI
on (CLI.idcli = OSER.idcli);

select max(os) from tbos;
