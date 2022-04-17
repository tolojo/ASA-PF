insert into pessoa(pessoa_macaddress) values ('08002b0102030405');
insert into pessoa(pessoa_macaddress) values ('08092b0102030405');

insert into cidadao(cidadao_nome, cidadao_idade, cidadao_localidade, cidadao_genero, cidadao_email, cidadao_telemovel, cidadao_username, cidadao_password, cidadao_pessoa_id) values ('Manuel',20,'Setubal','M','abc@gmail.com','923456789','user1','user1',1);
insert into cidadao(cidadao_nome, cidadao_idade, cidadao_localidade, cidadao_genero, cidadao_email, cidadao_telemovel, cidadao_username, cidadao_password, cidadao_pessoa_id) values ('Ana',18,'Santos','F','cba@gmail.com','987654321','user2','user2',2);

insert into organizacao(organizacao_nome, organizacao_descricao, organizacao_localidade, organizacao_contacto) VALUES ('CASA','Centro de apoio aos sem abrigo','Lisboa','567123897');
insert into organizacao(organizacao_nome, organizacao_descricao, organizacao_localidade, organizacao_contacto) VALUES ('Banco alimentar','Banco alimentar contra a fome','Lisboa','389712345');

insert into voluntario(voluntario_ocupacao, voluntario_org_id, voluntario_cid_id) VALUES ('Estudante',1,1);

insert into psa(psa_nome_provisorio) values ('Humberto');
insert into psa(psa_nome_provisorio) values ('Fabio');

insert into tipo_caracteristicas(tc_nome) values ('Cor dos olhos');
insert into tipo_caracteristicas(tc_nome) values ('Estatura');
insert into tipo_caracteristicas(tc_nome) values ('Cor do cabelo');
insert into tipo_caracteristicas(tc_nome) values ('Idade aparente');
insert into tipo_caracteristicas(tc_nome) values ('Adereços');
insert into tipo_caracteristicas(tc_nome) values ('Tom de pele');

insert into caracteristicas(caracteristicas_caracteristica, caracteristicas_tc_id) values ('Azul', 1);
insert into caracteristicas(caracteristicas_caracteristica, caracteristicas_tc_id) values ('Castanho', 1);
insert into caracteristicas(caracteristicas_caracteristica, caracteristicas_tc_id) values ('Alto', 2);
insert into caracteristicas(caracteristicas_caracteristica, caracteristicas_tc_id) values ('Média', 2);
insert into caracteristicas(caracteristicas_caracteristica, caracteristicas_tc_id) values ('Loiro', 3);
insert into caracteristicas(caracteristicas_caracteristica, caracteristicas_tc_id) values ('Preto', 3);
insert into caracteristicas(caracteristicas_caracteristica, caracteristicas_tc_id) values ('Adulto', 4);
insert into caracteristicas(caracteristicas_caracteristica, caracteristicas_tc_id) values ('Idoso', 4);
insert into caracteristicas(caracteristicas_caracteristica, caracteristicas_tc_id) values ('Mochila', 5);
insert into caracteristicas(caracteristicas_caracteristica, caracteristicas_tc_id) values ('Carrinho de Compras', 5);
insert into caracteristicas(caracteristicas_caracteristica, caracteristicas_tc_id) values ('Caucasiano', 6);
insert into caracteristicas(caracteristicas_caracteristica, caracteristicas_tc_id) values ('Negro', 6);

insert into caracteristicas_psa(caracteristicas_psa_caracteristicas_id, caracteristicas_psa_psa_id) VALUES (1, 1);
insert into caracteristicas_psa(caracteristicas_psa_caracteristicas_id, caracteristicas_psa_psa_id) VALUES (3, 1);
insert into caracteristicas_psa(caracteristicas_psa_caracteristicas_id, caracteristicas_psa_psa_id) VALUES (5, 1);
insert into caracteristicas_psa(caracteristicas_psa_caracteristicas_id, caracteristicas_psa_psa_id) VALUES (7, 1);
insert into caracteristicas_psa(caracteristicas_psa_caracteristicas_id, caracteristicas_psa_psa_id) VALUES (9, 1);
insert into caracteristicas_psa(caracteristicas_psa_caracteristicas_id, caracteristicas_psa_psa_id) VALUES (11, 1);

insert into caracteristicas_psa(caracteristicas_psa_caracteristicas_id, caracteristicas_psa_psa_id) VALUES (2, 2);
insert into caracteristicas_psa(caracteristicas_psa_caracteristicas_id, caracteristicas_psa_psa_id) VALUES (4, 2);
insert into caracteristicas_psa(caracteristicas_psa_caracteristicas_id, caracteristicas_psa_psa_id) VALUES (6, 2);
insert into caracteristicas_psa(caracteristicas_psa_caracteristicas_id, caracteristicas_psa_psa_id) VALUES (8, 2);
insert into caracteristicas_psa(caracteristicas_psa_caracteristicas_id, caracteristicas_psa_psa_id) VALUES (10, 2);
insert into caracteristicas_psa(caracteristicas_psa_caracteristicas_id, caracteristicas_psa_psa_id) VALUES (12, 2);

insert into zona(zona_area_geografica, zona_nome) VALUES (CIRCLE(Point(38.7173115,-9.1680233),5),'Campo de Our');
--insert into zona(zona_area_geografica, zona_nome) VALUES (((38.7091073,-9.1667920),5),'Estrela');

insert into localidade( local_localizacao, local_nome) VALUES ('38.7173115, -9.1680233', 'Rua Azedo Gneco');
insert into localidade(local_localizacao, local_nome) VALUES ('38.7091073, -9.1667920', 'Aven Santo');

insert into tipo_alerta(ta_descricao, ta_urgencia) VALUES ('Pouco Urgente',1);
insert into tipo_alerta(ta_descricao, ta_urgencia) VALUES ('Urgente',2);
insert into tipo_alerta(ta_descricao, ta_urgencia) VALUES ('Muito Urgente',3);
insert into tipo_alerta(ta_descricao, ta_urgencia) VALUES ('Urgencia Médica',4);

insert into alerta(alerta_nome, alerta_descricao, alerta_localizacao, alerta_pessoa_id, alerta_ta_id) VALUES ('Falta de comida','Sem abrigo na zona de Campo de Ourique encontra-se neste momento sem comida','38.7173115, -9.1680233',1,1);
insert into alerta(alerta_nome, alerta_descricao, alerta_localizacao, alerta_pessoa_id, alerta_ta_id) VALUES ('Falta de roupa','Sem abrigo na estrela esta com falat de roupa para o inverno','38.7173115, -9.1680233',1,1);

insert into caracteristicas_alerta(caracteristicas_alerta_alerta_id, caracteristicas_alerta_caracteristicas_id) VALUES (1,1);
insert into caracteristicas_alerta(caracteristicas_alerta_alerta_id, caracteristicas_alerta_caracteristicas_id) VALUES (1,3);
insert into caracteristicas_alerta(caracteristicas_alerta_alerta_id, caracteristicas_alerta_caracteristicas_id) VALUES (1,5);
insert into caracteristicas_alerta(caracteristicas_alerta_alerta_id, caracteristicas_alerta_caracteristicas_id) VALUES (1,7);
insert into caracteristicas_alerta(caracteristicas_alerta_alerta_id, caracteristicas_alerta_caracteristicas_id) VALUES (1,9);
insert into caracteristicas_alerta(caracteristicas_alerta_alerta_id, caracteristicas_alerta_caracteristicas_id) VALUES (1,11);
