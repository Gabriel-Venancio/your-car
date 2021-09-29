create table avaliacao (
	cod_avaliacao INT PRIMARY KEY,
	nota INT,
	classificacao VARCHAR(9)
);
insert into avaliacao (cod_avaliacao, nota, classificacao) values (1, 1, 'Ruim');
insert into avaliacao (cod_avaliacao, nota, classificacao) values (2, 2, 'Regular');
insert into avaliacao (cod_avaliacao, nota, classificacao) values (3, 3, 'Bom');
insert into avaliacao (cod_avaliacao, nota, classificacao) values (4, 4, 'Ótimo');
insert into avaliacao (cod_avaliacao, nota, classificacao) values (5, 5, 'Excelente');
