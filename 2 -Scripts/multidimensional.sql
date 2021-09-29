
CREATE SEQUENCE public.dim_carro_sk_carro_seq;

CREATE TABLE public.dim_carro (
                sk_carro INTEGER NOT NULL DEFAULT nextval('public.dim_carro_sk_carro_seq'),
                nk_carro INTEGER NOT NULL,
                modelo VARCHAR(50) NOT NULL,
                preco NUMERIC(10,2) NOT NULL,
                CONSTRAINT sk_carro PRIMARY KEY (sk_carro)
);


ALTER SEQUENCE public.dim_carro_sk_carro_seq OWNED BY public.dim_carro.sk_carro;

CREATE SEQUENCE public.dim_data_sk_data_seq;

CREATE TABLE public.dim_data (
                sk_data INTEGER NOT NULL DEFAULT nextval('public.dim_data_sk_data_seq'),
                nk_data DATE NOT NULL,
                dia INTEGER NOT NULL,
                mes INTEGER NOT NULL,
                ano INTEGER NOT NULL,
                CONSTRAINT sk_data PRIMARY KEY (sk_data)
);


ALTER SEQUENCE public.dim_data_sk_data_seq OWNED BY public.dim_data.sk_data;

CREATE SEQUENCE public.dim_avaliacao_sk_avaliacao_seq;

CREATE TABLE public.dim_avaliacao (
                sk_avaliacao INTEGER NOT NULL DEFAULT nextval('public.dim_avaliacao_sk_avaliacao_seq'),
                nk_avaliacao INTEGER NOT NULL,
                nota INTEGER NOT NULL,
                classificacao VARCHAR(10) NOT NULL,
                CONSTRAINT sk_avaliacao PRIMARY KEY (sk_avaliacao)
);


ALTER SEQUENCE public.dim_avaliacao_sk_avaliacao_seq OWNED BY public.dim_avaliacao.sk_avaliacao;

CREATE SEQUENCE public.dim_cliente_sk_cliente_seq;

CREATE TABLE public.dim_cliente (
                sk_cliente INTEGER NOT NULL DEFAULT nextval('public.dim_cliente_sk_cliente_seq'),
                nk_cliente INTEGER NOT NULL,
                nm_cliente VARCHAR(50) NOT NULL,
                sexo VARCHAR(10) NOT NULL,
                dt_nascimento DATE NOT NULL,
                bairro VARCHAR(50) NOT NULL,
                CONSTRAINT sk_cliente PRIMARY KEY (sk_cliente)
);


ALTER SEQUENCE public.dim_cliente_sk_cliente_seq OWNED BY public.dim_cliente.sk_cliente;

CREATE TABLE public.ft_locacao (
                sk_carro INTEGER NOT NULL,
                sk_cliente INTEGER NOT NULL,
                sk_avaliacao INTEGER NOT NULL,
                sk_data INTEGER NOT NULL,
                dd_codpedido INTEGER NOT NULL,
                dd_hora_pedido TIME NOT NULL,
                md_qtd INTEGER NOT NULL,
                md_desconto INTEGER NOT NULL,
                md_valor_total REAL NOT NULL
);


ALTER TABLE public.ft_locacao ADD CONSTRAINT dim_carro_ft_locacao_fk
FOREIGN KEY (sk_carro)
REFERENCES public.dim_carro (sk_carro)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_locacao ADD CONSTRAINT dim_data_ft_locacao_fk
FOREIGN KEY (sk_data)
REFERENCES public.dim_data (sk_data)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_locacao ADD CONSTRAINT dim_avaliacao_ft_locacao_fk
FOREIGN KEY (sk_avaliacao)
REFERENCES public.dim_avaliacao (sk_avaliacao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_locacao ADD CONSTRAINT dim_cliente_ft_locacao_fk
FOREIGN KEY (sk_cliente)
REFERENCES public.dim_cliente (sk_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;