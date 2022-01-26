-- public.categoria definition

-- Drop table

-- DROP TABLE public.categoria;

CREATE TABLE public.categoria (
	id int8 NOT NULL,
	nome varchar NOT NULL,
	status bool NOT NULL DEFAULT true,
	CONSTRAINT categoria_pk PRIMARY KEY (id)
);


-- public.regra definition

-- Drop table

-- DROP TABLE public.regra;

CREATE TABLE public.regra (
	id int8 NOT NULL,
	nome varchar NOT NULL,
	status bool NOT NULL DEFAULT true,
	CONSTRAINT regra_pk PRIMARY KEY (id)
);


-- public.servico definition

-- Drop table

-- DROP TABLE public.servico;

CREATE TABLE public.servico (
	id int8 NOT NULL,
	nome varchar NOT NULL,
	status bool NOT NULL DEFAULT true,
	CONSTRAINT servico_pk PRIMARY KEY (id)
);


-- public.usuario definition

-- Drop table

-- DROP TABLE public.usuario;

CREATE TABLE public.usuario (
	id int8 NOT NULL,
	nome varchar NOT NULL,
	telefone varchar NULL,
	email text NOT NULL,
	status bool NOT NULL DEFAULT true,
	endereco varchar NULL,
	bairro varchar NULL,
	cidade varchar NULL,
	cep varchar NOT NULL,
	uf varchar NULL,
	logista bool NOT NULL,
	categoria_id int8 NOT NULL,
	taxa numeric NULL,
	latitude int8 NULL,
	longitude int8 NULL,
	CONSTRAINT usuario_pk PRIMARY KEY (id),
	CONSTRAINT usuario_fk FOREIGN KEY (categoria_id) REFERENCES public.categoria(id)
);


-- public.usuario_regra definition

-- Drop table

-- DROP TABLE public.usuario_regra;

CREATE TABLE public.usuario_regra (
	usuario_id int8 NOT NULL,
	regra_id int8 NOT NULL,
	CONSTRAINT usuario_regra_pk PRIMARY KEY (usuario_id, regra_id),
	CONSTRAINT usuario_regra_fk FOREIGN KEY (regra_id) REFERENCES public.regra(id),
	CONSTRAINT usuario_regra_fk_1 FOREIGN KEY (usuario_id) REFERENCES public.usuario(id)
);


-- public.usuario_servico definition

-- Drop table

-- DROP TABLE public.usuario_servico;

CREATE TABLE public.usuario_servico (
	usuario_id int8 NOT NULL,
	servico_id int8 NOT NULL,
	CONSTRAINT usuario_servico_pk PRIMARY KEY (servico_id, usuario_id),
	CONSTRAINT usuario_servico_fk FOREIGN KEY (servico_id) REFERENCES public.usuario(id),
	CONSTRAINT usuario_servico_fk_1 FOREIGN KEY (servico_id) REFERENCES public.servico(id)
);