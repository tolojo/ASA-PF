create table pessoa(pessoa_id serial not null,
			  pessoa_macaddress macaddr8 not null,
			  primary key (pessoa_id));

create table cidadao(cidadao_id serial not null,
			   cidadao_nome varchar(20) not null,
			   cidadao_idade int not null,
			   cidadao_localidade varchar(20) not null,
			   cidadao_genero varchar(10),
			   cidadao_email varchar(20) not null,
			   cidadao_telemovel varchar(10),
			   cidadao_username varchar(15) not null,
			   cidadao_password varchar(15) not null,
			   cidadao_pessoa_id int not null,
			   primary key (cidadao_id));
			   
create table voluntario(voluntario_id serial not null,
				  voluntario_ocupacao varchar(15) not null,
				  voluntario_org_id int not null,
				  voluntario_cid_id int not null,
			      primary key (voluntario_id));

create table organizacao(organizacao_id serial not null,
				   organizacao_nome varchar(20) not null,
				   organizacao_descricao text,
				   organizacao_localidade varchar(25) not null,
				   organizacao_contacto varchar(10) not null,
				   primary key (organizacao_id));
			   
create table psa(psa_id serial not null,
		   psa_nome_provisorio varchar(20) not null,
		   primary key (psa_id));
		   
create table alerta(alerta_id serial not null,
			  alerta_nome varchar(20),
			  alerta_descricao text,
			  alerta_localizacao point not null,
			  alerta_pessoa_id int not null,
			  alerta_ta_id int not null,
			  primary key (alerta_id));
			  
create table tipo_alerta(ta_id serial not null,
				   ta_descricao text,
				   ta_urgencia varchar(10) not null,
				   primary key (ta_id));
				   
create table localidade(local_id serial not null,
				  local_localizacao point not null,
				  local_nome varchar(20) not null, /*rua*/
				  local_zona_id int not null,
			      primary key (local_id));
				   
create table zona(zona_id serial not null,
		    zona_area_geografica circle not null,
		    zona_nome varchar(15) not null,
		    primary key (zona_id));
			
create table caracteristicas(caracteristicas_id serial not null,
					   caracteristicas_caracteristica varchar(20) not null,
					   caracteristicas_tc_id int not null,
					   primary key (caracteristicas_id));
					   
create table tipo_caracteristicas(tc_id serial not null,
						    tc_nome varchar(20),
						    primary key (tc_id));
							
create table caracteristicas_psa(caracteristicas_psa_id serial not null,
						   caracteristicas_psa_caracteristicas_id int not null,
						   caracteristicas_psa_psa_id int not null,
						   primary key (caracteristicas_psa_id));
						   
create table local_psa(local_psa_id serial not null,
				 local_psa_psa_id int not null,
				 local_psa_local_id int not null,
				 local_psa_voluntario_id int not null,
				 primary key (local_psa_id));
				 
create table caracteristicas_alerta(caracteristicas_alerta_id serial not null,
							  caracteristicas_alerta_alerta_id int not null,
							  caracteristicas_alerta_caracteristicas_id int not null,
							  primary key (caracteristicas_alerta_id));
							  
create table psa_cidadao(psa_cidadao_id serial not null,
				   psa_cidadao_psa int not null,
				   psa_cidadao_cidadao int not null,
				   primary key (psa_cidadao_id));
				   
--Foreign Keys

alter table cidadao add constraint cidadao_fk_pessoa
            foreign key (cidadao_pessoa_id) references pessoa(pessoa_id)
			ON DELETE NO ACTION ON UPDATE NO ACTION;

alter table voluntario add constraint voluntario_fk_organizacao
            foreign key (voluntario_org_id) references organizacao(organizacao_id)
			ON DELETE NO ACTION ON UPDATE NO ACTION;

alter table voluntario add constraint voluntario_fk_cidadao
            foreign key (voluntario_cid_id) references cidadao(cidadao_id)
			ON DELETE NO ACTION ON UPDATE NO ACTION;
			
alter table alerta add constraint alerta_fk_pessoa
            foreign key (alerta_pessoa_id) references pessoa(pessoa_id)
			ON DELETE NO ACTION ON UPDATE NO ACTION;

alter table alerta add constraint alerta_fk_tipo_alerta
            foreign key (alerta_ta_id) references tipo_alerta(ta_id)
			ON DELETE NO ACTION ON UPDATE NO ACTION;
			
alter table localidade add constraint localidade_fk_zona
            foreign key (local_zona_id) references zona(zona_id)
			ON DELETE NO ACTION ON UPDATE NO ACTION;
						
alter table caracteristicas add constraint caracteristicas_fk_tipo_caracteristicas
            foreign key (caracteristicas_tc_id) references tipo_caracteristicas(tc_id)
			ON DELETE NO ACTION ON UPDATE NO ACTION;
									
alter table caracteristicas_psa add constraint caracteristicas_psa_fk_caracteristicas
            foreign key (caracteristicas_psa_caracteristicas_id) references caracteristicas(caracteristicas_id)
			ON DELETE NO ACTION ON UPDATE NO ACTION;
												
alter table caracteristicas_psa add constraint caracteristicas_psa_fk_psa
            foreign key (caracteristicas_psa_psa_id) references psa(psa_id)
			ON DELETE NO ACTION ON UPDATE NO ACTION;
												
alter table local_psa add constraint local_psa_fk_psa
            foreign key (local_psa_psa_id) references psa(psa_id)
			ON DELETE NO ACTION ON UPDATE NO ACTION;
												
alter table local_psa add constraint local_psa_fk_localidade
            foreign key (local_psa_local_id) references localidade(local_id)
			ON DELETE NO ACTION ON UPDATE NO ACTION;
															
alter table local_psa add constraint local_psa_fk_voluntario
            foreign key (local_psa_voluntario_id) references voluntario(voluntario_id) 
			ON DELETE NO ACTION ON UPDATE NO ACTION;
																		
alter table caracteristicas_alerta add constraint caracteristicas_alerta_fk_alerta
            foreign key (caracteristicas_alerta_alerta_id) references alerta(alerta_id) 
			ON DELETE NO ACTION ON UPDATE NO ACTION;
																					
alter table caracteristicas_alerta add constraint caracteristicas_alerta_fk_caracteristicas
            foreign key (caracteristicas_alerta_caracteristicas_id) references caracteristicas(caracteristicas_id) 
			ON DELETE NO ACTION ON UPDATE NO ACTION;
																					
alter table psa_cidadao add constraint psa_cidadao_fk_psa
            foreign key (psa_cidadao_psa) references psa(psa_id) 
			ON DELETE NO ACTION ON UPDATE NO ACTION;
																					
alter table psa_cidadao add constraint psa_cidadao_fk_cidadao
            foreign key (psa_cidadao_cidadao) references cidadao(cidadao_id) 
			ON DELETE NO ACTION ON UPDATE NO ACTION;