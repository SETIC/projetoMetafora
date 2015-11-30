--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.16
-- Dumped by pg_dump version 9.3.5
-- Started on 2015-07-23 16:22:38

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 6 (class 2615 OID 24579)
-- Name: administracao_organizacao; Type: SCHEMA; Schema: -; Owner: admin_db_sr
--

CREATE SCHEMA administracao_organizacao;


ALTER SCHEMA administracao_organizacao OWNER TO admin_db_sr;

--
-- TOC entry 21 (class 2615 OID 30673)
-- Name: administracao_registro; Type: SCHEMA; Schema: -; Owner: admin_db_sr
--

CREATE SCHEMA administracao_registro;


ALTER SCHEMA administracao_registro OWNER TO admin_db_sr;

--
-- TOC entry 7 (class 2615 OID 24580)
-- Name: cadastro_unico_almoxarifado; Type: SCHEMA; Schema: -; Owner: admin_db_sr
--

CREATE SCHEMA cadastro_unico_almoxarifado;


ALTER SCHEMA cadastro_unico_almoxarifado OWNER TO admin_db_sr;

--
-- TOC entry 8 (class 2615 OID 24581)
-- Name: cadastro_unico_atendimento; Type: SCHEMA; Schema: -; Owner: admin_db_sr
--

CREATE SCHEMA cadastro_unico_atendimento;


ALTER SCHEMA cadastro_unico_atendimento OWNER TO admin_db_sr;

--
-- TOC entry 9 (class 2615 OID 24582)
-- Name: cadastro_unico_infraestrutura_basica; Type: SCHEMA; Schema: -; Owner: admin_db_sr
--

CREATE SCHEMA cadastro_unico_infraestrutura_basica;


ALTER SCHEMA cadastro_unico_infraestrutura_basica OWNER TO admin_db_sr;

--
-- TOC entry 10 (class 2615 OID 24583)
-- Name: cadastro_unico_localizacao; Type: SCHEMA; Schema: -; Owner: admin_db_sr
--

CREATE SCHEMA cadastro_unico_localizacao;


ALTER SCHEMA cadastro_unico_localizacao OWNER TO admin_db_sr;

--
-- TOC entry 11 (class 2615 OID 24584)
-- Name: cadastro_unico_patrimonio; Type: SCHEMA; Schema: -; Owner: admin_db_sr
--

CREATE SCHEMA cadastro_unico_patrimonio;


ALTER SCHEMA cadastro_unico_patrimonio OWNER TO admin_db_sr;

--
-- TOC entry 12 (class 2615 OID 24585)
-- Name: cadastro_unico_pessoal; Type: SCHEMA; Schema: -; Owner: admin_db_sr
--

CREATE SCHEMA cadastro_unico_pessoal;


ALTER SCHEMA cadastro_unico_pessoal OWNER TO admin_db_sr;

--
-- TOC entry 13 (class 2615 OID 24586)
-- Name: cadastro_unico_protocolo; Type: SCHEMA; Schema: -; Owner: admin_db_sr
--

CREATE SCHEMA cadastro_unico_protocolo;


ALTER SCHEMA cadastro_unico_protocolo OWNER TO admin_db_sr;

--
-- TOC entry 14 (class 2615 OID 24587)
-- Name: controle_de_acesso_a_dado; Type: SCHEMA; Schema: -; Owner: admin_db_sr
--

CREATE SCHEMA controle_de_acesso_a_dado;


ALTER SCHEMA controle_de_acesso_a_dado OWNER TO admin_db_sr;

--
-- TOC entry 4277 (class 0 OID 0)
-- Dependencies: 14
-- Name: SCHEMA controle_de_acesso_a_dado; Type: COMMENT; Schema: -; Owner: admin_db_sr
--

COMMENT ON SCHEMA controle_de_acesso_a_dado IS 'Esquema lógico. Utilizado para fazer o controle de acesso aos dados do sistema';


--
-- TOC entry 15 (class 2615 OID 24588)
-- Name: educacao_academico; Type: SCHEMA; Schema: -; Owner: admin_db_sr
--

CREATE SCHEMA educacao_academico;


ALTER SCHEMA educacao_academico OWNER TO admin_db_sr;

--
-- TOC entry 16 (class 2615 OID 24589)
-- Name: educacao_biblioteca; Type: SCHEMA; Schema: -; Owner: admin_db_sr
--

CREATE SCHEMA educacao_biblioteca;


ALTER SCHEMA educacao_biblioteca OWNER TO admin_db_sr;

--
-- TOC entry 17 (class 2615 OID 24590)
-- Name: energia; Type: SCHEMA; Schema: -; Owner: admin_db_sr
--

CREATE SCHEMA energia;


ALTER SCHEMA energia OWNER TO admin_db_sr;

--
-- TOC entry 18 (class 2615 OID 24591)
-- Name: login; Type: SCHEMA; Schema: -; Owner: admin_db_sr
--

CREATE SCHEMA login;


ALTER SCHEMA login OWNER TO admin_db_sr;

--
-- TOC entry 19 (class 2615 OID 24592)
-- Name: saude_procedimento; Type: SCHEMA; Schema: -; Owner: admin_db_sr
--

CREATE SCHEMA saude_procedimento;


ALTER SCHEMA saude_procedimento OWNER TO admin_db_sr;

--
-- TOC entry 508 (class 3079 OID 11645)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 4280 (class 0 OID 0)
-- Dependencies: 508
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = cadastro_unico_pessoal, pg_catalog;

--
-- TOC entry 520 (class 1255 OID 24593)
-- Name: altera_seq(); Type: FUNCTION; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

CREATE FUNCTION altera_seq() RETURNS trigger
    LANGUAGE plpgsql
    AS $$  BEGIN
 
perform setval('cadastro_unico_pessoal.aluno_id_seq', 
(currval('cadastro_unico_pessoal.pessoa_id_seq')),
false);

perform setval('cadastro_unico_pessoal.professor_id_seq', 
(currval('cadastro_unico_pessoal.pessoa_id_seq')),
false);

perform setval('cadastro_unico_pessoal.pessoa_fisica_id_seq', 
(currval('cadastro_unico_pessoal.pessoa_id_seq')),
false);

perform setval('cadastro_unico_pessoal.cidadao_id_seq', 
(currval('cadastro_unico_pessoal.pessoa_id_seq')),
false);

perform setval('cadastro_unico_pessoal.pessoa_juridica_id_seq', 
(currval('cadastro_unico_pessoal.pessoa_id_seq')),
false);

perform setval('cadastro_unico_pessoal.escola_id_seq', 
(currval('cadastro_unico_pessoal.pessoa_id_seq')),
false);

perform setval('cadastro_unico_pessoal.fornecedor_id_seq', 
(currval('cadastro_unico_pessoal.pessoa_id_seq')),
false);

perform setval('cadastro_unico_pessoal.funcionario_id_seq', 
(currval('cadastro_unico_pessoal.pessoa_id_seq')),
false);

perform setval('cadastro_unico_pessoal.motorista_id_seq', 
(currval('cadastro_unico_pessoal.pessoa_id_seq')),
false);

perform setval('cadastro_unico_pessoal.paciente_id_seq', 
(currval('cadastro_unico_pessoal.pessoa_id_seq')),
false);

perform setval('cadastro_unico_pessoal.prefeitura_id_seq', 
(currval('cadastro_unico_pessoal.pessoa_id_seq')),
false);
return null;

END;$$;


ALTER FUNCTION cadastro_unico_pessoal.altera_seq() OWNER TO admin_db_sr;

--
-- TOC entry 521 (class 1255 OID 24594)
-- Name: proc_teste(); Type: FUNCTION; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

CREATE FUNCTION proc_teste() RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$
BEGIN
RETURN QUERY SELECT p.id, p.nome FROM cadastro_unico_pessoal.pessoa as p; -- Acrescenta um conjunto de linhas ao retorno da função
RETURN ; -- Retorna as linhas
END;
$$;


ALTER FUNCTION cadastro_unico_pessoal.proc_teste() OWNER TO admin_db_sr;

SET search_path = public, pg_catalog;

--
-- TOC entry 522 (class 1255 OID 24595)
-- Name: get_id(character varying); Type: FUNCTION; Schema: public; Owner: admin_db_sr
--

CREATE FUNCTION get_id(character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
DECLARE
        variavel_id INTEGER;
BEGIN
        SELECT INTO variavel_id id FROM aluno WHERE numero_de_inscricao = $761;
        RETURN variavel_id;
END;
$_$;


ALTER FUNCTION public.get_id(character varying) OWNER TO admin_db_sr;

--
-- TOC entry 523 (class 1255 OID 24596)
-- Name: mudaid(); Type: FUNCTION; Schema: public; Owner: admin_db_sr
--

CREATE FUNCTION mudaid() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ begin
ALTER SEQUENCE cadastro_unico_pessoal.aluno_id RESTART WITH 105;
return null;
end; $$;


ALTER FUNCTION public.mudaid() OWNER TO admin_db_sr;

SET search_path = administracao_organizacao, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 176 (class 1259 OID 24597)
-- Name: assessoria; Type: TABLE; Schema: administracao_organizacao; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE assessoria (
    id bigint NOT NULL,
    organismo_id bigint NOT NULL,
    assessoria character varying NOT NULL,
    contato_telefonico character varying NOT NULL
);


ALTER TABLE administracao_organizacao.assessoria OWNER TO admin_db_sr;

--
-- TOC entry 177 (class 1259 OID 24603)
-- Name: assessoria_id_seq; Type: SEQUENCE; Schema: administracao_organizacao; Owner: admin_db_sr
--

CREATE SEQUENCE assessoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administracao_organizacao.assessoria_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4281 (class 0 OID 0)
-- Dependencies: 177
-- Name: assessoria_id_seq; Type: SEQUENCE OWNED BY; Schema: administracao_organizacao; Owner: admin_db_sr
--

ALTER SEQUENCE assessoria_id_seq OWNED BY assessoria.id;


--
-- TOC entry 178 (class 1259 OID 24605)
-- Name: cargo; Type: TABLE; Schema: administracao_organizacao; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE cargo (
    id bigint NOT NULL,
    celula_id bigint NOT NULL,
    cargo character varying NOT NULL,
    moeda_salario double precision
);


ALTER TABLE administracao_organizacao.cargo OWNER TO admin_db_sr;

--
-- TOC entry 179 (class 1259 OID 24611)
-- Name: cargo_id_seq; Type: SEQUENCE; Schema: administracao_organizacao; Owner: admin_db_sr
--

CREATE SEQUENCE cargo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administracao_organizacao.cargo_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4282 (class 0 OID 0)
-- Dependencies: 179
-- Name: cargo_id_seq; Type: SEQUENCE OWNED BY; Schema: administracao_organizacao; Owner: admin_db_sr
--

ALTER SEQUENCE cargo_id_seq OWNED BY cargo.id;


--
-- TOC entry 180 (class 1259 OID 24613)
-- Name: celula; Type: TABLE; Schema: administracao_organizacao; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE celula (
    id bigint NOT NULL,
    organismo_id bigint NOT NULL,
    celula character varying NOT NULL,
    contato_telefonico character varying NOT NULL
);


ALTER TABLE administracao_organizacao.celula OWNER TO admin_db_sr;

--
-- TOC entry 181 (class 1259 OID 24619)
-- Name: celula_id_seq; Type: SEQUENCE; Schema: administracao_organizacao; Owner: admin_db_sr
--

CREATE SEQUENCE celula_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administracao_organizacao.celula_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4283 (class 0 OID 0)
-- Dependencies: 181
-- Name: celula_id_seq; Type: SEQUENCE OWNED BY; Schema: administracao_organizacao; Owner: admin_db_sr
--

ALTER SEQUENCE celula_id_seq OWNED BY celula.id;


--
-- TOC entry 182 (class 1259 OID 24621)
-- Name: lotacao; Type: TABLE; Schema: administracao_organizacao; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE lotacao (
    id bigint NOT NULL,
    cargo_id bigint NOT NULL,
    funcionario_id bigint NOT NULL,
    data_inicio date NOT NULL,
    data_termino date,
    situacao character varying NOT NULL,
    funcao character varying(255) NOT NULL,
    vinculo character varying(255),
    turno character varying(255)
);


ALTER TABLE administracao_organizacao.lotacao OWNER TO admin_db_sr;

--
-- TOC entry 183 (class 1259 OID 24627)
-- Name: lotacao_id_seq; Type: SEQUENCE; Schema: administracao_organizacao; Owner: admin_db_sr
--

CREATE SEQUENCE lotacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administracao_organizacao.lotacao_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4284 (class 0 OID 0)
-- Dependencies: 183
-- Name: lotacao_id_seq; Type: SEQUENCE OWNED BY; Schema: administracao_organizacao; Owner: admin_db_sr
--

ALTER SEQUENCE lotacao_id_seq OWNED BY lotacao.id;


--
-- TOC entry 184 (class 1259 OID 24629)
-- Name: organismo; Type: TABLE; Schema: administracao_organizacao; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE organismo (
    id bigint NOT NULL,
    prefeitura_id bigint NOT NULL,
    contato_telefonico character varying NOT NULL,
    organismo character varying NOT NULL
);


ALTER TABLE administracao_organizacao.organismo OWNER TO admin_db_sr;

--
-- TOC entry 185 (class 1259 OID 24635)
-- Name: organismo_id_seq; Type: SEQUENCE; Schema: administracao_organizacao; Owner: admin_db_sr
--

CREATE SEQUENCE organismo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administracao_organizacao.organismo_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4285 (class 0 OID 0)
-- Dependencies: 185
-- Name: organismo_id_seq; Type: SEQUENCE OWNED BY; Schema: administracao_organizacao; Owner: admin_db_sr
--

ALTER SEQUENCE organismo_id_seq OWNED BY organismo.id;


SET search_path = administracao_registro, pg_catalog;

--
-- TOC entry 506 (class 1259 OID 30674)
-- Name: log; Type: TABLE; Schema: administracao_registro; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE log (
    tabela character varying(100),
    observacao character varying(1000),
    usuario_id integer,
    tipo character varying,
    id bigint NOT NULL
);


ALTER TABLE administracao_registro.log OWNER TO admin_db_sr;

--
-- TOC entry 507 (class 1259 OID 30685)
-- Name: log_id_seq; Type: SEQUENCE; Schema: administracao_registro; Owner: admin_db_sr
--

CREATE SEQUENCE log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administracao_registro.log_id_seq OWNER TO admin_db_sr;

SET search_path = cadastro_unico_almoxarifado, pg_catalog;

--
-- TOC entry 186 (class 1259 OID 24637)
-- Name: almoxarifado; Type: TABLE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE almoxarifado (
    id bigint NOT NULL,
    organismo_id bigint NOT NULL,
    almoxarifado character varying(255),
    almoxarifado_central character varying
);


ALTER TABLE cadastro_unico_almoxarifado.almoxarifado OWNER TO admin_db_sr;

--
-- TOC entry 187 (class 1259 OID 24643)
-- Name: almoxarifado_id_seq; Type: SEQUENCE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

CREATE SEQUENCE almoxarifado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_almoxarifado.almoxarifado_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4286 (class 0 OID 0)
-- Dependencies: 187
-- Name: almoxarifado_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER SEQUENCE almoxarifado_id_seq OWNED BY almoxarifado.id;


--
-- TOC entry 188 (class 1259 OID 24645)
-- Name: almoxarifado_lote; Type: TABLE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE almoxarifado_lote (
    id bigint NOT NULL,
    quantidade_disponivel double precision,
    lote_material_id bigint NOT NULL,
    almoxarifado_id bigint NOT NULL
);


ALTER TABLE cadastro_unico_almoxarifado.almoxarifado_lote OWNER TO admin_db_sr;

--
-- TOC entry 189 (class 1259 OID 24648)
-- Name: almoxarifado_lote_id_seq; Type: SEQUENCE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

CREATE SEQUENCE almoxarifado_lote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_almoxarifado.almoxarifado_lote_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4287 (class 0 OID 0)
-- Dependencies: 189
-- Name: almoxarifado_lote_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER SEQUENCE almoxarifado_lote_id_seq OWNED BY almoxarifado_lote.id;


--
-- TOC entry 190 (class 1259 OID 24650)
-- Name: composicao; Type: TABLE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE composicao (
    id bigint NOT NULL,
    medicamento_id bigint NOT NULL,
    substancia_id bigint NOT NULL,
    reservado character varying
);


ALTER TABLE cadastro_unico_almoxarifado.composicao OWNER TO admin_db_sr;

--
-- TOC entry 191 (class 1259 OID 24656)
-- Name: composicao_id_seq; Type: SEQUENCE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

CREATE SEQUENCE composicao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_almoxarifado.composicao_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4288 (class 0 OID 0)
-- Dependencies: 191
-- Name: composicao_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER SEQUENCE composicao_id_seq OWNED BY composicao.id;


--
-- TOC entry 192 (class 1259 OID 24658)
-- Name: forma_farmaceutica; Type: TABLE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE forma_farmaceutica (
    id bigint NOT NULL,
    forma character varying(100) NOT NULL
);


ALTER TABLE cadastro_unico_almoxarifado.forma_farmaceutica OWNER TO admin_db_sr;

--
-- TOC entry 193 (class 1259 OID 24661)
-- Name: forma_farmaceutica_id_seq; Type: SEQUENCE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

CREATE SEQUENCE forma_farmaceutica_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_almoxarifado.forma_farmaceutica_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4289 (class 0 OID 0)
-- Dependencies: 193
-- Name: forma_farmaceutica_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER SEQUENCE forma_farmaceutica_id_seq OWNED BY forma_farmaceutica.id;


--
-- TOC entry 194 (class 1259 OID 24663)
-- Name: forma_farmaceutica_medicamento; Type: TABLE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE forma_farmaceutica_medicamento (
    id bigint NOT NULL,
    reservado character varying(20),
    forma_farmaceutica_id bigint NOT NULL,
    medicamento_id bigint NOT NULL
);


ALTER TABLE cadastro_unico_almoxarifado.forma_farmaceutica_medicamento OWNER TO admin_db_sr;

--
-- TOC entry 195 (class 1259 OID 24666)
-- Name: forma_farmaceutica_medicamento_id_seq; Type: SEQUENCE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

CREATE SEQUENCE forma_farmaceutica_medicamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_almoxarifado.forma_farmaceutica_medicamento_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4290 (class 0 OID 0)
-- Dependencies: 195
-- Name: forma_farmaceutica_medicamento_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER SEQUENCE forma_farmaceutica_medicamento_id_seq OWNED BY forma_farmaceutica_medicamento.id;


--
-- TOC entry 196 (class 1259 OID 24668)
-- Name: foto_material; Type: TABLE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE foto_material (
    id bigint NOT NULL,
    material_id bigint NOT NULL,
    foto_material character varying
);


ALTER TABLE cadastro_unico_almoxarifado.foto_material OWNER TO admin_db_sr;

--
-- TOC entry 197 (class 1259 OID 24674)
-- Name: foto_material_id_seq; Type: SEQUENCE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

CREATE SEQUENCE foto_material_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_almoxarifado.foto_material_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4291 (class 0 OID 0)
-- Dependencies: 197
-- Name: foto_material_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER SEQUENCE foto_material_id_seq OWNED BY foto_material.id;


--
-- TOC entry 198 (class 1259 OID 24676)
-- Name: lote_material; Type: TABLE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE lote_material (
    id bigint NOT NULL,
    fabricante_id bigint,
    fornecedor_id bigint NOT NULL,
    data_de_fabricacao date NOT NULL,
    data_de_validade date NOT NULL,
    lote_material character varying NOT NULL,
    quantidade double precision NOT NULL,
    material_id bigint NOT NULL,
    nota_fiscal character varying,
    codigo_de_barra character varying,
    data_recebimento date,
    moeda_valor_unitario double precision
);


ALTER TABLE cadastro_unico_almoxarifado.lote_material OWNER TO admin_db_sr;

--
-- TOC entry 199 (class 1259 OID 24682)
-- Name: lote_material_id_seq; Type: SEQUENCE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

CREATE SEQUENCE lote_material_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_almoxarifado.lote_material_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4292 (class 0 OID 0)
-- Dependencies: 199
-- Name: lote_material_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER SEQUENCE lote_material_id_seq OWNED BY lote_material.id;


--
-- TOC entry 200 (class 1259 OID 24684)
-- Name: lote_medicamento; Type: TABLE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE lote_medicamento (
    reservado character varying,
    id bigint NOT NULL,
    ordem_de_adiantamento character varying NOT NULL
);


ALTER TABLE cadastro_unico_almoxarifado.lote_medicamento OWNER TO admin_db_sr;

--
-- TOC entry 201 (class 1259 OID 24690)
-- Name: lote_medicamento_id_seq; Type: SEQUENCE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

CREATE SEQUENCE lote_medicamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_almoxarifado.lote_medicamento_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4293 (class 0 OID 0)
-- Dependencies: 201
-- Name: lote_medicamento_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER SEQUENCE lote_medicamento_id_seq OWNED BY lote_medicamento.id;


--
-- TOC entry 202 (class 1259 OID 24692)
-- Name: material; Type: TABLE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE material (
    id bigint NOT NULL,
    tipo_material_id bigint,
    descricao_material character varying NOT NULL,
    nome character varying
);


ALTER TABLE cadastro_unico_almoxarifado.material OWNER TO admin_db_sr;

--
-- TOC entry 203 (class 1259 OID 24698)
-- Name: material_id_seq; Type: SEQUENCE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

CREATE SEQUENCE material_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_almoxarifado.material_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4294 (class 0 OID 0)
-- Dependencies: 203
-- Name: material_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER SEQUENCE material_id_seq OWNED BY material.id;


--
-- TOC entry 204 (class 1259 OID 24700)
-- Name: medicamento; Type: TABLE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE medicamento (
    id bigint NOT NULL,
    reservado character varying
);


ALTER TABLE cadastro_unico_almoxarifado.medicamento OWNER TO admin_db_sr;

--
-- TOC entry 205 (class 1259 OID 24706)
-- Name: medicamento_id_seq; Type: SEQUENCE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

CREATE SEQUENCE medicamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_almoxarifado.medicamento_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4295 (class 0 OID 0)
-- Dependencies: 205
-- Name: medicamento_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER SEQUENCE medicamento_id_seq OWNED BY medicamento.id;


--
-- TOC entry 206 (class 1259 OID 24708)
-- Name: principio_ativo; Type: TABLE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE principio_ativo (
    id bigint NOT NULL,
    principio character varying NOT NULL,
    quantidade_minima double precision NOT NULL,
    quantidade_ideal double precision NOT NULL,
    quantidade_maxima double precision,
    tipo_principio_ativo_id bigint NOT NULL,
    descricao_principio_ativo character varying NOT NULL
);


ALTER TABLE cadastro_unico_almoxarifado.principio_ativo OWNER TO admin_db_sr;

--
-- TOC entry 207 (class 1259 OID 24714)
-- Name: principio_ativo_id_seq; Type: SEQUENCE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

CREATE SEQUENCE principio_ativo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_almoxarifado.principio_ativo_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4296 (class 0 OID 0)
-- Dependencies: 207
-- Name: principio_ativo_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER SEQUENCE principio_ativo_id_seq OWNED BY principio_ativo.id;


--
-- TOC entry 208 (class 1259 OID 24716)
-- Name: principio_ativo_medicamento; Type: TABLE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE principio_ativo_medicamento (
    id bigint NOT NULL,
    principio_ativo_id bigint NOT NULL,
    medicamento_id bigint NOT NULL,
    reservado character varying(20)
);


ALTER TABLE cadastro_unico_almoxarifado.principio_ativo_medicamento OWNER TO admin_db_sr;

--
-- TOC entry 209 (class 1259 OID 24719)
-- Name: principio_ativo_medicamento_id_seq; Type: SEQUENCE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

CREATE SEQUENCE principio_ativo_medicamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_almoxarifado.principio_ativo_medicamento_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4297 (class 0 OID 0)
-- Dependencies: 209
-- Name: principio_ativo_medicamento_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER SEQUENCE principio_ativo_medicamento_id_seq OWNED BY principio_ativo_medicamento.id;


--
-- TOC entry 210 (class 1259 OID 24721)
-- Name: remessa; Type: TABLE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE remessa (
    id bigint NOT NULL,
    almoxarifado_origem_id bigint,
    cidadao_id bigint,
    lote_material_id bigint NOT NULL,
    data_de_entrega date NOT NULL,
    quantidade character varying NOT NULL,
    situacao character varying,
    almoxarifado_destino_id bigint,
    funcionario_id bigint
);


ALTER TABLE cadastro_unico_almoxarifado.remessa OWNER TO admin_db_sr;

--
-- TOC entry 211 (class 1259 OID 24727)
-- Name: remessa_id_seq; Type: SEQUENCE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

CREATE SEQUENCE remessa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_almoxarifado.remessa_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4298 (class 0 OID 0)
-- Dependencies: 211
-- Name: remessa_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER SEQUENCE remessa_id_seq OWNED BY remessa.id;


--
-- TOC entry 212 (class 1259 OID 24729)
-- Name: remessa_medicamento; Type: TABLE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE remessa_medicamento (
    id bigint NOT NULL,
    reservado character varying
);


ALTER TABLE cadastro_unico_almoxarifado.remessa_medicamento OWNER TO admin_db_sr;

--
-- TOC entry 213 (class 1259 OID 24735)
-- Name: remessa_medicamento_id_seq; Type: SEQUENCE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

CREATE SEQUENCE remessa_medicamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_almoxarifado.remessa_medicamento_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4299 (class 0 OID 0)
-- Dependencies: 213
-- Name: remessa_medicamento_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER SEQUENCE remessa_medicamento_id_seq OWNED BY remessa_medicamento.id;


--
-- TOC entry 214 (class 1259 OID 24737)
-- Name: substancia; Type: TABLE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE substancia (
    id bigint NOT NULL,
    substancia character varying NOT NULL
);


ALTER TABLE cadastro_unico_almoxarifado.substancia OWNER TO admin_db_sr;

--
-- TOC entry 215 (class 1259 OID 24743)
-- Name: substancia_id_seq; Type: SEQUENCE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

CREATE SEQUENCE substancia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_almoxarifado.substancia_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4300 (class 0 OID 0)
-- Dependencies: 215
-- Name: substancia_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER SEQUENCE substancia_id_seq OWNED BY substancia.id;


--
-- TOC entry 216 (class 1259 OID 24745)
-- Name: tipo_material; Type: TABLE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE tipo_material (
    id bigint NOT NULL,
    tipo_material character varying NOT NULL
);


ALTER TABLE cadastro_unico_almoxarifado.tipo_material OWNER TO admin_db_sr;

--
-- TOC entry 217 (class 1259 OID 24751)
-- Name: tipo_material_id_seq; Type: SEQUENCE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

CREATE SEQUENCE tipo_material_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_almoxarifado.tipo_material_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4301 (class 0 OID 0)
-- Dependencies: 217
-- Name: tipo_material_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER SEQUENCE tipo_material_id_seq OWNED BY tipo_material.id;


--
-- TOC entry 218 (class 1259 OID 24753)
-- Name: tipo_principio_ativo; Type: TABLE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE tipo_principio_ativo (
    id bigint NOT NULL,
    tipo_principio_ativo character varying
);


ALTER TABLE cadastro_unico_almoxarifado.tipo_principio_ativo OWNER TO admin_db_sr;

--
-- TOC entry 219 (class 1259 OID 24759)
-- Name: tipo_principio_ativo_id_seq; Type: SEQUENCE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

CREATE SEQUENCE tipo_principio_ativo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_almoxarifado.tipo_principio_ativo_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4302 (class 0 OID 0)
-- Dependencies: 219
-- Name: tipo_principio_ativo_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER SEQUENCE tipo_principio_ativo_id_seq OWNED BY tipo_principio_ativo.id;


--
-- TOC entry 220 (class 1259 OID 24761)
-- Name: unidade_de_saude; Type: TABLE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE unidade_de_saude (
    id bigint NOT NULL,
    reservado character varying,
    latitude character varying(100),
    longitude character varying(100)
);


ALTER TABLE cadastro_unico_almoxarifado.unidade_de_saude OWNER TO admin_db_sr;

--
-- TOC entry 221 (class 1259 OID 24767)
-- Name: unidade_de_saude_id_seq; Type: SEQUENCE; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

CREATE SEQUENCE unidade_de_saude_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_almoxarifado.unidade_de_saude_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4303 (class 0 OID 0)
-- Dependencies: 221
-- Name: unidade_de_saude_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER SEQUENCE unidade_de_saude_id_seq OWNED BY unidade_de_saude.id;


SET search_path = cadastro_unico_atendimento, pg_catalog;

--
-- TOC entry 222 (class 1259 OID 24769)
-- Name: atendimento; Type: TABLE; Schema: cadastro_unico_atendimento; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE atendimento (
    id bigint NOT NULL,
    balcao_id bigint NOT NULL,
    ticket_id bigint NOT NULL,
    data date NOT NULL,
    detalhamento character varying,
    situacao character varying NOT NULL
);


ALTER TABLE cadastro_unico_atendimento.atendimento OWNER TO admin_db_sr;

--
-- TOC entry 223 (class 1259 OID 24775)
-- Name: atendimento_id_seq; Type: SEQUENCE; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

CREATE SEQUENCE atendimento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_atendimento.atendimento_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4304 (class 0 OID 0)
-- Dependencies: 223
-- Name: atendimento_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

ALTER SEQUENCE atendimento_id_seq OWNED BY atendimento.id;


--
-- TOC entry 224 (class 1259 OID 24777)
-- Name: balcao; Type: TABLE; Schema: cadastro_unico_atendimento; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE balcao (
    id bigint NOT NULL,
    fila_id bigint NOT NULL,
    identificacao character varying NOT NULL
);


ALTER TABLE cadastro_unico_atendimento.balcao OWNER TO admin_db_sr;

--
-- TOC entry 225 (class 1259 OID 24783)
-- Name: balcao_id_seq; Type: SEQUENCE; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

CREATE SEQUENCE balcao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_atendimento.balcao_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4305 (class 0 OID 0)
-- Dependencies: 225
-- Name: balcao_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

ALTER SEQUENCE balcao_id_seq OWNED BY balcao.id;


--
-- TOC entry 226 (class 1259 OID 24785)
-- Name: fila; Type: TABLE; Schema: cadastro_unico_atendimento; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE fila (
    id bigint NOT NULL,
    assunto character varying NOT NULL
);


ALTER TABLE cadastro_unico_atendimento.fila OWNER TO admin_db_sr;

--
-- TOC entry 227 (class 1259 OID 24791)
-- Name: fila_id_seq; Type: SEQUENCE; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

CREATE SEQUENCE fila_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_atendimento.fila_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4306 (class 0 OID 0)
-- Dependencies: 227
-- Name: fila_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

ALTER SEQUENCE fila_id_seq OWNED BY fila.id;


--
-- TOC entry 228 (class 1259 OID 24793)
-- Name: lotacao_balconista; Type: TABLE; Schema: cadastro_unico_atendimento; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE lotacao_balconista (
    id bigint NOT NULL,
    balcao_id bigint NOT NULL,
    funcionario_id bigint NOT NULL,
    data date NOT NULL,
    situacao character varying
);


ALTER TABLE cadastro_unico_atendimento.lotacao_balconista OWNER TO admin_db_sr;

--
-- TOC entry 229 (class 1259 OID 24799)
-- Name: lotacao_balconista_id_seq; Type: SEQUENCE; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

CREATE SEQUENCE lotacao_balconista_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_atendimento.lotacao_balconista_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4307 (class 0 OID 0)
-- Dependencies: 229
-- Name: lotacao_balconista_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

ALTER SEQUENCE lotacao_balconista_id_seq OWNED BY lotacao_balconista.id;


--
-- TOC entry 230 (class 1259 OID 24801)
-- Name: lotacao_gerente; Type: TABLE; Schema: cadastro_unico_atendimento; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE lotacao_gerente (
    id bigint NOT NULL,
    fila_id bigint NOT NULL,
    funcionario_id bigint NOT NULL,
    data date NOT NULL,
    situacao character varying
);


ALTER TABLE cadastro_unico_atendimento.lotacao_gerente OWNER TO admin_db_sr;

--
-- TOC entry 231 (class 1259 OID 24807)
-- Name: lotacao_gerente_id_seq; Type: SEQUENCE; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

CREATE SEQUENCE lotacao_gerente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_atendimento.lotacao_gerente_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4308 (class 0 OID 0)
-- Dependencies: 231
-- Name: lotacao_gerente_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

ALTER SEQUENCE lotacao_gerente_id_seq OWNED BY lotacao_gerente.id;


--
-- TOC entry 232 (class 1259 OID 24809)
-- Name: ticket; Type: TABLE; Schema: cadastro_unico_atendimento; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE ticket (
    id bigint NOT NULL,
    cidadao_id bigint NOT NULL,
    tipo_ticket_id bigint NOT NULL,
    data date NOT NULL,
    identificador character varying NOT NULL,
    situacao character varying NOT NULL
);


ALTER TABLE cadastro_unico_atendimento.ticket OWNER TO admin_db_sr;

--
-- TOC entry 233 (class 1259 OID 24815)
-- Name: ticket_id_seq; Type: SEQUENCE; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

CREATE SEQUENCE ticket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_atendimento.ticket_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4309 (class 0 OID 0)
-- Dependencies: 233
-- Name: ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

ALTER SEQUENCE ticket_id_seq OWNED BY ticket.id;


--
-- TOC entry 234 (class 1259 OID 24817)
-- Name: tipo_ticket; Type: TABLE; Schema: cadastro_unico_atendimento; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE tipo_ticket (
    id bigint NOT NULL,
    tipo_ticket character varying NOT NULL
);


ALTER TABLE cadastro_unico_atendimento.tipo_ticket OWNER TO admin_db_sr;

--
-- TOC entry 235 (class 1259 OID 24823)
-- Name: tipo_ticket_id_seq; Type: SEQUENCE; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

CREATE SEQUENCE tipo_ticket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_atendimento.tipo_ticket_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4310 (class 0 OID 0)
-- Dependencies: 235
-- Name: tipo_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

ALTER SEQUENCE tipo_ticket_id_seq OWNED BY tipo_ticket.id;


SET search_path = cadastro_unico_infraestrutura_basica, pg_catalog;

--
-- TOC entry 236 (class 1259 OID 24825)
-- Name: arborizacao; Type: TABLE; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE arborizacao (
    id bigint NOT NULL,
    possui character varying NOT NULL,
    tipo_arborizacao character varying NOT NULL
);


ALTER TABLE cadastro_unico_infraestrutura_basica.arborizacao OWNER TO admin_db_sr;

--
-- TOC entry 237 (class 1259 OID 24831)
-- Name: arborizacao_id_seq; Type: SEQUENCE; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

CREATE SEQUENCE arborizacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_infraestrutura_basica.arborizacao_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4311 (class 0 OID 0)
-- Dependencies: 237
-- Name: arborizacao_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER SEQUENCE arborizacao_id_seq OWNED BY arborizacao.id;


--
-- TOC entry 238 (class 1259 OID 24833)
-- Name: coleta_de_lixo; Type: TABLE; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE coleta_de_lixo (
    id bigint NOT NULL,
    frequencia character varying NOT NULL,
    possui character varying NOT NULL,
    seletiva character varying NOT NULL
);


ALTER TABLE cadastro_unico_infraestrutura_basica.coleta_de_lixo OWNER TO admin_db_sr;

--
-- TOC entry 239 (class 1259 OID 24839)
-- Name: coleta_de_lixo_id_seq; Type: SEQUENCE; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

CREATE SEQUENCE coleta_de_lixo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_infraestrutura_basica.coleta_de_lixo_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4312 (class 0 OID 0)
-- Dependencies: 239
-- Name: coleta_de_lixo_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER SEQUENCE coleta_de_lixo_id_seq OWNED BY coleta_de_lixo.id;


--
-- TOC entry 240 (class 1259 OID 24841)
-- Name: galeria_pluvial; Type: TABLE; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE galeria_pluvial (
    id bigint NOT NULL,
    possui character varying NOT NULL
);


ALTER TABLE cadastro_unico_infraestrutura_basica.galeria_pluvial OWNER TO admin_db_sr;

--
-- TOC entry 241 (class 1259 OID 24847)
-- Name: galeria_pluvial_id_seq; Type: SEQUENCE; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

CREATE SEQUENCE galeria_pluvial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_infraestrutura_basica.galeria_pluvial_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4313 (class 0 OID 0)
-- Dependencies: 241
-- Name: galeria_pluvial_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER SEQUENCE galeria_pluvial_id_seq OWNED BY galeria_pluvial.id;


--
-- TOC entry 242 (class 1259 OID 24849)
-- Name: guias_sargetas; Type: TABLE; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE guias_sargetas (
    id bigint NOT NULL,
    possui character varying NOT NULL
);


ALTER TABLE cadastro_unico_infraestrutura_basica.guias_sargetas OWNER TO admin_db_sr;

--
-- TOC entry 243 (class 1259 OID 24855)
-- Name: guias_sargetas_id_seq; Type: SEQUENCE; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

CREATE SEQUENCE guias_sargetas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_infraestrutura_basica.guias_sargetas_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4314 (class 0 OID 0)
-- Dependencies: 243
-- Name: guias_sargetas_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER SEQUENCE guias_sargetas_id_seq OWNED BY guias_sargetas.id;


--
-- TOC entry 244 (class 1259 OID 24857)
-- Name: iluminacao; Type: TABLE; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE iluminacao (
    id bigint NOT NULL,
    possui character varying NOT NULL
);


ALTER TABLE cadastro_unico_infraestrutura_basica.iluminacao OWNER TO admin_db_sr;

--
-- TOC entry 245 (class 1259 OID 24863)
-- Name: iluminacao_id_seq; Type: SEQUENCE; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

CREATE SEQUENCE iluminacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_infraestrutura_basica.iluminacao_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4315 (class 0 OID 0)
-- Dependencies: 245
-- Name: iluminacao_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER SEQUENCE iluminacao_id_seq OWNED BY iluminacao.id;


--
-- TOC entry 246 (class 1259 OID 24865)
-- Name: infra_estrutura; Type: TABLE; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE infra_estrutura (
    id bigint NOT NULL,
    arborizacao_id bigint NOT NULL,
    coleta_de_lixo_id bigint NOT NULL,
    galeria_pluvial_id bigint NOT NULL,
    guias_sargetas_id bigint NOT NULL,
    iluminacao_id bigint NOT NULL,
    limpeza_id bigint NOT NULL,
    pavimentacao_id bigint NOT NULL,
    rede_de_agua_id bigint NOT NULL,
    rede_de_esgoto_id bigint NOT NULL,
    rede_de_telefone_id bigint NOT NULL,
    trecho_de_logradouro_id bigint NOT NULL,
    reservado character varying
);


ALTER TABLE cadastro_unico_infraestrutura_basica.infra_estrutura OWNER TO admin_db_sr;

--
-- TOC entry 247 (class 1259 OID 24871)
-- Name: infra_estrutura_id_seq; Type: SEQUENCE; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

CREATE SEQUENCE infra_estrutura_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_infraestrutura_basica.infra_estrutura_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4316 (class 0 OID 0)
-- Dependencies: 247
-- Name: infra_estrutura_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER SEQUENCE infra_estrutura_id_seq OWNED BY infra_estrutura.id;


--
-- TOC entry 248 (class 1259 OID 24873)
-- Name: limpeza; Type: TABLE; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE limpeza (
    id bigint NOT NULL,
    frequencia character varying NOT NULL,
    possui character varying NOT NULL
);


ALTER TABLE cadastro_unico_infraestrutura_basica.limpeza OWNER TO admin_db_sr;

--
-- TOC entry 249 (class 1259 OID 24879)
-- Name: limpeza_id_seq; Type: SEQUENCE; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

CREATE SEQUENCE limpeza_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_infraestrutura_basica.limpeza_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4317 (class 0 OID 0)
-- Dependencies: 249
-- Name: limpeza_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER SEQUENCE limpeza_id_seq OWNED BY limpeza.id;


--
-- TOC entry 250 (class 1259 OID 24881)
-- Name: pavimentacao; Type: TABLE; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE pavimentacao (
    id bigint NOT NULL,
    possui character varying NOT NULL,
    tipo_pavimentacao character varying NOT NULL
);


ALTER TABLE cadastro_unico_infraestrutura_basica.pavimentacao OWNER TO admin_db_sr;

--
-- TOC entry 251 (class 1259 OID 24887)
-- Name: pavimentacao_id_seq; Type: SEQUENCE; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

CREATE SEQUENCE pavimentacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_infraestrutura_basica.pavimentacao_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4318 (class 0 OID 0)
-- Dependencies: 251
-- Name: pavimentacao_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER SEQUENCE pavimentacao_id_seq OWNED BY pavimentacao.id;


--
-- TOC entry 252 (class 1259 OID 24889)
-- Name: rede_de_agua; Type: TABLE; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE rede_de_agua (
    id bigint NOT NULL,
    possui character varying NOT NULL,
    tratada character varying NOT NULL
);


ALTER TABLE cadastro_unico_infraestrutura_basica.rede_de_agua OWNER TO admin_db_sr;

--
-- TOC entry 253 (class 1259 OID 24895)
-- Name: rede_de_agua_id_seq; Type: SEQUENCE; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

CREATE SEQUENCE rede_de_agua_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_infraestrutura_basica.rede_de_agua_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4319 (class 0 OID 0)
-- Dependencies: 253
-- Name: rede_de_agua_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER SEQUENCE rede_de_agua_id_seq OWNED BY rede_de_agua.id;


--
-- TOC entry 254 (class 1259 OID 24897)
-- Name: rede_de_esgoto; Type: TABLE; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE rede_de_esgoto (
    id bigint NOT NULL,
    possui character varying NOT NULL
);


ALTER TABLE cadastro_unico_infraestrutura_basica.rede_de_esgoto OWNER TO admin_db_sr;

--
-- TOC entry 255 (class 1259 OID 24903)
-- Name: rede_de_esgoto_id_seq; Type: SEQUENCE; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

CREATE SEQUENCE rede_de_esgoto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_infraestrutura_basica.rede_de_esgoto_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4320 (class 0 OID 0)
-- Dependencies: 255
-- Name: rede_de_esgoto_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER SEQUENCE rede_de_esgoto_id_seq OWNED BY rede_de_esgoto.id;


--
-- TOC entry 256 (class 1259 OID 24905)
-- Name: rede_de_telefone; Type: TABLE; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE rede_de_telefone (
    id bigint NOT NULL,
    possui character varying NOT NULL
);


ALTER TABLE cadastro_unico_infraestrutura_basica.rede_de_telefone OWNER TO admin_db_sr;

--
-- TOC entry 257 (class 1259 OID 24911)
-- Name: rede_de_telefone_id_seq; Type: SEQUENCE; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

CREATE SEQUENCE rede_de_telefone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_infraestrutura_basica.rede_de_telefone_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4321 (class 0 OID 0)
-- Dependencies: 257
-- Name: rede_de_telefone_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER SEQUENCE rede_de_telefone_id_seq OWNED BY rede_de_telefone.id;


SET search_path = cadastro_unico_localizacao, pg_catalog;

--
-- TOC entry 258 (class 1259 OID 24913)
-- Name: bairro; Type: TABLE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE bairro (
    id bigint NOT NULL,
    bairro character varying NOT NULL,
    municipio_id bigint
);


ALTER TABLE cadastro_unico_localizacao.bairro OWNER TO admin_db_sr;

--
-- TOC entry 259 (class 1259 OID 24919)
-- Name: bairro_id_seq; Type: SEQUENCE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

CREATE SEQUENCE bairro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_localizacao.bairro_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4322 (class 0 OID 0)
-- Dependencies: 259
-- Name: bairro_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER SEQUENCE bairro_id_seq OWNED BY bairro.id;


--
-- TOC entry 260 (class 1259 OID 24921)
-- Name: comercial; Type: TABLE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE comercial (
    id bigint NOT NULL,
    reservado character varying
);


ALTER TABLE cadastro_unico_localizacao.comercial OWNER TO admin_db_sr;

--
-- TOC entry 261 (class 1259 OID 24927)
-- Name: comercial_id_seq; Type: SEQUENCE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

CREATE SEQUENCE comercial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_localizacao.comercial_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4323 (class 0 OID 0)
-- Dependencies: 261
-- Name: comercial_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER SEQUENCE comercial_id_seq OWNED BY comercial.id;


--
-- TOC entry 262 (class 1259 OID 24929)
-- Name: cruzamento; Type: TABLE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE cruzamento (
    id bigint NOT NULL,
    intersecao_dois_id bigint NOT NULL,
    intersecao_um_id bigint NOT NULL,
    identificacao character varying NOT NULL
);


ALTER TABLE cadastro_unico_localizacao.cruzamento OWNER TO admin_db_sr;

--
-- TOC entry 263 (class 1259 OID 24935)
-- Name: cruzamento_id_seq; Type: SEQUENCE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

CREATE SEQUENCE cruzamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_localizacao.cruzamento_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4324 (class 0 OID 0)
-- Dependencies: 263
-- Name: cruzamento_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER SEQUENCE cruzamento_id_seq OWNED BY cruzamento.id;


--
-- TOC entry 264 (class 1259 OID 24937)
-- Name: distrito; Type: TABLE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE distrito (
    id bigint NOT NULL,
    distrito character varying NOT NULL
);


ALTER TABLE cadastro_unico_localizacao.distrito OWNER TO admin_db_sr;

--
-- TOC entry 265 (class 1259 OID 24943)
-- Name: distrito_id_seq; Type: SEQUENCE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

CREATE SEQUENCE distrito_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_localizacao.distrito_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4325 (class 0 OID 0)
-- Dependencies: 265
-- Name: distrito_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER SEQUENCE distrito_id_seq OWNED BY distrito.id;


--
-- TOC entry 266 (class 1259 OID 24945)
-- Name: divisao_admininstrativa_id_seq; Type: SEQUENCE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

CREATE SEQUENCE divisao_admininstrativa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_localizacao.divisao_admininstrativa_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 267 (class 1259 OID 24947)
-- Name: divisao_administrativa; Type: TABLE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE divisao_administrativa (
    id bigint NOT NULL,
    municipio_id bigint NOT NULL,
    nome character varying NOT NULL
);


ALTER TABLE cadastro_unico_localizacao.divisao_administrativa OWNER TO admin_db_sr;

--
-- TOC entry 268 (class 1259 OID 24953)
-- Name: divisao_administrativa_id_seq; Type: SEQUENCE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

CREATE SEQUENCE divisao_administrativa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_localizacao.divisao_administrativa_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4326 (class 0 OID 0)
-- Dependencies: 268
-- Name: divisao_administrativa_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER SEQUENCE divisao_administrativa_id_seq OWNED BY divisao_administrativa.id;


--
-- TOC entry 269 (class 1259 OID 24955)
-- Name: estado; Type: TABLE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE estado (
    id bigint NOT NULL,
    abreviacao character varying NOT NULL,
    estado character varying NOT NULL
);


ALTER TABLE cadastro_unico_localizacao.estado OWNER TO admin_db_sr;

--
-- TOC entry 270 (class 1259 OID 24961)
-- Name: estado_id_seq; Type: SEQUENCE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

CREATE SEQUENCE estado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_localizacao.estado_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4327 (class 0 OID 0)
-- Dependencies: 270
-- Name: estado_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER SEQUENCE estado_id_seq OWNED BY estado.id;


--
-- TOC entry 271 (class 1259 OID 24963)
-- Name: estado_municipio; Type: TABLE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE estado_municipio (
    estado_municipio_id bigint,
    municipio_id bigint
);


ALTER TABLE cadastro_unico_localizacao.estado_municipio OWNER TO admin_db_sr;

--
-- TOC entry 272 (class 1259 OID 24966)
-- Name: face_da_quadra; Type: TABLE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE face_da_quadra (
    id bigint NOT NULL,
    quadra_id bigint NOT NULL,
    face_da_quadra character varying
);


ALTER TABLE cadastro_unico_localizacao.face_da_quadra OWNER TO admin_db_sr;

--
-- TOC entry 273 (class 1259 OID 24972)
-- Name: face_da_quadra_id_seq; Type: SEQUENCE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

CREATE SEQUENCE face_da_quadra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_localizacao.face_da_quadra_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4328 (class 0 OID 0)
-- Dependencies: 273
-- Name: face_da_quadra_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER SEQUENCE face_da_quadra_id_seq OWNED BY face_da_quadra.id;


--
-- TOC entry 274 (class 1259 OID 24974)
-- Name: foto_lote; Type: TABLE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE foto_lote (
    id bigint NOT NULL,
    lote_id bigint NOT NULL,
    foto character varying NOT NULL
);


ALTER TABLE cadastro_unico_localizacao.foto_lote OWNER TO admin_db_sr;

--
-- TOC entry 275 (class 1259 OID 24980)
-- Name: foto_lote_id_seq; Type: SEQUENCE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

CREATE SEQUENCE foto_lote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_localizacao.foto_lote_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4329 (class 0 OID 0)
-- Dependencies: 275
-- Name: foto_lote_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER SEQUENCE foto_lote_id_seq OWNED BY foto_lote.id;


--
-- TOC entry 276 (class 1259 OID 24982)
-- Name: foto_unidade_edificada; Type: TABLE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE foto_unidade_edificada (
    id bigint NOT NULL,
    unidade_edificada_id bigint NOT NULL,
    foto character varying NOT NULL
);


ALTER TABLE cadastro_unico_localizacao.foto_unidade_edificada OWNER TO admin_db_sr;

--
-- TOC entry 277 (class 1259 OID 24988)
-- Name: foto_unidade_edificada_id_seq; Type: SEQUENCE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

CREATE SEQUENCE foto_unidade_edificada_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_localizacao.foto_unidade_edificada_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4330 (class 0 OID 0)
-- Dependencies: 277
-- Name: foto_unidade_edificada_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER SEQUENCE foto_unidade_edificada_id_seq OWNED BY foto_unidade_edificada.id;


--
-- TOC entry 278 (class 1259 OID 24990)
-- Name: industrial; Type: TABLE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE industrial (
    id bigint NOT NULL,
    reservado character varying
);


ALTER TABLE cadastro_unico_localizacao.industrial OWNER TO admin_db_sr;

--
-- TOC entry 279 (class 1259 OID 24996)
-- Name: industrial_id_seq; Type: SEQUENCE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

CREATE SEQUENCE industrial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_localizacao.industrial_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4331 (class 0 OID 0)
-- Dependencies: 279
-- Name: industrial_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER SEQUENCE industrial_id_seq OWNED BY industrial.id;


--
-- TOC entry 280 (class 1259 OID 24998)
-- Name: logradouro; Type: TABLE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE logradouro (
    id bigint NOT NULL,
    tipo_logradouro_id bigint NOT NULL,
    logradouro character varying NOT NULL
);


ALTER TABLE cadastro_unico_localizacao.logradouro OWNER TO admin_db_sr;

--
-- TOC entry 281 (class 1259 OID 25004)
-- Name: logradouro_id_seq; Type: SEQUENCE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

CREATE SEQUENCE logradouro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_localizacao.logradouro_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4332 (class 0 OID 0)
-- Dependencies: 281
-- Name: logradouro_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER SEQUENCE logradouro_id_seq OWNED BY logradouro.id;


--
-- TOC entry 282 (class 1259 OID 25006)
-- Name: lote; Type: TABLE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE lote (
    id bigint NOT NULL,
    bairro_id bigint NOT NULL,
    area_lote double precision NOT NULL,
    delimitacao_frontal character varying NOT NULL,
    pedologia character varying NOT NULL,
    situacao character varying NOT NULL,
    topografia character varying NOT NULL,
    valor_venal double precision NOT NULL,
    zeragem_de_quadrra character varying NOT NULL,
    identificacao character varying(50)
);


ALTER TABLE cadastro_unico_localizacao.lote OWNER TO admin_db_sr;

--
-- TOC entry 283 (class 1259 OID 25012)
-- Name: lote_id_seq; Type: SEQUENCE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

CREATE SEQUENCE lote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_localizacao.lote_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4333 (class 0 OID 0)
-- Dependencies: 283
-- Name: lote_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER SEQUENCE lote_id_seq OWNED BY lote.id;


--
-- TOC entry 284 (class 1259 OID 25014)
-- Name: municipio; Type: TABLE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE municipio (
    id bigint NOT NULL,
    estado_id bigint NOT NULL,
    municipio character varying NOT NULL
);


ALTER TABLE cadastro_unico_localizacao.municipio OWNER TO admin_db_sr;

--
-- TOC entry 285 (class 1259 OID 25020)
-- Name: municipio_id_seq; Type: SEQUENCE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

CREATE SEQUENCE municipio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_localizacao.municipio_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4334 (class 0 OID 0)
-- Dependencies: 285
-- Name: municipio_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER SEQUENCE municipio_id_seq OWNED BY municipio.id;


--
-- TOC entry 286 (class 1259 OID 25022)
-- Name: quadra; Type: TABLE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE quadra (
    id bigint NOT NULL,
    setor_id bigint NOT NULL,
    quadra character varying
);


ALTER TABLE cadastro_unico_localizacao.quadra OWNER TO admin_db_sr;

--
-- TOC entry 287 (class 1259 OID 25028)
-- Name: quadra_id_seq; Type: SEQUENCE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

CREATE SEQUENCE quadra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_localizacao.quadra_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4335 (class 0 OID 0)
-- Dependencies: 287
-- Name: quadra_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER SEQUENCE quadra_id_seq OWNED BY quadra.id;


--
-- TOC entry 288 (class 1259 OID 25030)
-- Name: residencial; Type: TABLE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE residencial (
    id bigint NOT NULL,
    reservado character varying
);


ALTER TABLE cadastro_unico_localizacao.residencial OWNER TO admin_db_sr;

--
-- TOC entry 289 (class 1259 OID 25036)
-- Name: residencial_id_seq; Type: SEQUENCE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

CREATE SEQUENCE residencial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_localizacao.residencial_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4336 (class 0 OID 0)
-- Dependencies: 289
-- Name: residencial_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER SEQUENCE residencial_id_seq OWNED BY residencial.id;


--
-- TOC entry 290 (class 1259 OID 25038)
-- Name: setor; Type: TABLE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE setor (
    id bigint NOT NULL,
    distrito_id bigint NOT NULL,
    setor character varying
);


ALTER TABLE cadastro_unico_localizacao.setor OWNER TO admin_db_sr;

--
-- TOC entry 291 (class 1259 OID 25044)
-- Name: setor_id_seq; Type: SEQUENCE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

CREATE SEQUENCE setor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_localizacao.setor_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4337 (class 0 OID 0)
-- Dependencies: 291
-- Name: setor_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER SEQUENCE setor_id_seq OWNED BY setor.id;


--
-- TOC entry 292 (class 1259 OID 25046)
-- Name: testada; Type: TABLE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE testada (
    id bigint NOT NULL,
    face_de_quadra_id bigint NOT NULL,
    lote_id bigint NOT NULL,
    trecho_de_logradouro_id bigint NOT NULL,
    testada character varying
);


ALTER TABLE cadastro_unico_localizacao.testada OWNER TO admin_db_sr;

--
-- TOC entry 293 (class 1259 OID 25052)
-- Name: testada_id_seq; Type: SEQUENCE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

CREATE SEQUENCE testada_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_localizacao.testada_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4338 (class 0 OID 0)
-- Dependencies: 293
-- Name: testada_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER SEQUENCE testada_id_seq OWNED BY testada.id;


--
-- TOC entry 294 (class 1259 OID 25054)
-- Name: tipo_logradouro; Type: TABLE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE tipo_logradouro (
    id bigint NOT NULL,
    tipo_logradouro character varying NOT NULL
);


ALTER TABLE cadastro_unico_localizacao.tipo_logradouro OWNER TO admin_db_sr;

--
-- TOC entry 295 (class 1259 OID 25060)
-- Name: tipo_logradouro_id_seq; Type: SEQUENCE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

CREATE SEQUENCE tipo_logradouro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_localizacao.tipo_logradouro_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4339 (class 0 OID 0)
-- Dependencies: 295
-- Name: tipo_logradouro_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER SEQUENCE tipo_logradouro_id_seq OWNED BY tipo_logradouro.id;


--
-- TOC entry 296 (class 1259 OID 25062)
-- Name: tipo_logradouro_logradouro; Type: TABLE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE tipo_logradouro_logradouro (
    tipo_logradouro_logradouro_id bigint,
    logradouro_id bigint
);


ALTER TABLE cadastro_unico_localizacao.tipo_logradouro_logradouro OWNER TO admin_db_sr;

--
-- TOC entry 297 (class 1259 OID 25065)
-- Name: trecho_de_logradouro; Type: TABLE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE trecho_de_logradouro (
    id bigint NOT NULL,
    cruzamento_id bigint NOT NULL,
    logradouro_id bigint NOT NULL,
    cep character varying NOT NULL
);


ALTER TABLE cadastro_unico_localizacao.trecho_de_logradouro OWNER TO admin_db_sr;

--
-- TOC entry 298 (class 1259 OID 25071)
-- Name: trecho_de_logradouro_id_seq; Type: SEQUENCE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

CREATE SEQUENCE trecho_de_logradouro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_localizacao.trecho_de_logradouro_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4340 (class 0 OID 0)
-- Dependencies: 298
-- Name: trecho_de_logradouro_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER SEQUENCE trecho_de_logradouro_id_seq OWNED BY trecho_de_logradouro.id;


--
-- TOC entry 299 (class 1259 OID 25073)
-- Name: unidade_edificada; Type: TABLE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE unidade_edificada (
    id bigint NOT NULL,
    lote_id bigint NOT NULL,
    area_edificada double precision NOT NULL,
    area_total_construida double precision NOT NULL,
    identificacao character varying(50)
);


ALTER TABLE cadastro_unico_localizacao.unidade_edificada OWNER TO admin_db_sr;

--
-- TOC entry 300 (class 1259 OID 25076)
-- Name: unidade_edificada_id_seq; Type: SEQUENCE; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

CREATE SEQUENCE unidade_edificada_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_localizacao.unidade_edificada_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4341 (class 0 OID 0)
-- Dependencies: 300
-- Name: unidade_edificada_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER SEQUENCE unidade_edificada_id_seq OWNED BY unidade_edificada.id;


SET search_path = cadastro_unico_patrimonio, pg_catalog;

--
-- TOC entry 301 (class 1259 OID 25078)
-- Name: abastecimento; Type: TABLE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE abastecimento (
    id bigint NOT NULL,
    quilometragem character varying NOT NULL,
    combustivel character varying,
    numero_do_talao character varying,
    quantidade_de_litros double precision NOT NULL,
    consumo_medio double precision NOT NULL
);


ALTER TABLE cadastro_unico_patrimonio.abastecimento OWNER TO admin_db_sr;

--
-- TOC entry 302 (class 1259 OID 25084)
-- Name: abastecimento_id_seq; Type: SEQUENCE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

CREATE SEQUENCE abastecimento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_patrimonio.abastecimento_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4342 (class 0 OID 0)
-- Dependencies: 302
-- Name: abastecimento_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER SEQUENCE abastecimento_id_seq OWNED BY abastecimento.id;


--
-- TOC entry 303 (class 1259 OID 25086)
-- Name: ambulancia; Type: TABLE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE ambulancia (
    id bigint NOT NULL,
    reservado character varying
);


ALTER TABLE cadastro_unico_patrimonio.ambulancia OWNER TO admin_db_sr;

--
-- TOC entry 304 (class 1259 OID 25092)
-- Name: ambulancia_id_seq; Type: SEQUENCE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

CREATE SEQUENCE ambulancia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_patrimonio.ambulancia_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4343 (class 0 OID 0)
-- Dependencies: 304
-- Name: ambulancia_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER SEQUENCE ambulancia_id_seq OWNED BY ambulancia.id;


--
-- TOC entry 305 (class 1259 OID 25094)
-- Name: bem; Type: TABLE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE bem (
    id bigint NOT NULL,
    bem character varying NOT NULL,
    data_aquisicao date,
    estado_fisico character varying,
    marca character varying NOT NULL,
    modelo character varying NOT NULL,
    nota_fiscal character varying,
    serie character varying,
    tombo character varying NOT NULL,
    moeda_valor_unitario double precision,
    tipo_bem character varying
);


ALTER TABLE cadastro_unico_patrimonio.bem OWNER TO admin_db_sr;

--
-- TOC entry 306 (class 1259 OID 25100)
-- Name: bem_id_seq; Type: SEQUENCE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

CREATE SEQUENCE bem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_patrimonio.bem_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4344 (class 0 OID 0)
-- Dependencies: 306
-- Name: bem_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER SEQUENCE bem_id_seq OWNED BY bem.id;


--
-- TOC entry 307 (class 1259 OID 25102)
-- Name: caminhao; Type: TABLE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE caminhao (
    id bigint NOT NULL,
    reservado character varying
);


ALTER TABLE cadastro_unico_patrimonio.caminhao OWNER TO admin_db_sr;

--
-- TOC entry 308 (class 1259 OID 25108)
-- Name: caminhao_id_seq; Type: SEQUENCE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

CREATE SEQUENCE caminhao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_patrimonio.caminhao_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4345 (class 0 OID 0)
-- Dependencies: 308
-- Name: caminhao_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER SEQUENCE caminhao_id_seq OWNED BY caminhao.id;


--
-- TOC entry 309 (class 1259 OID 25110)
-- Name: carro; Type: TABLE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE carro (
    id bigint NOT NULL,
    reservado character varying
);


ALTER TABLE cadastro_unico_patrimonio.carro OWNER TO admin_db_sr;

--
-- TOC entry 310 (class 1259 OID 25116)
-- Name: carro_id_seq; Type: SEQUENCE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

CREATE SEQUENCE carro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_patrimonio.carro_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4346 (class 0 OID 0)
-- Dependencies: 310
-- Name: carro_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER SEQUENCE carro_id_seq OWNED BY carro.id;


--
-- TOC entry 311 (class 1259 OID 25118)
-- Name: garagem; Type: TABLE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE garagem (
    id bigint NOT NULL,
    garagem character varying NOT NULL
);


ALTER TABLE cadastro_unico_patrimonio.garagem OWNER TO admin_db_sr;

--
-- TOC entry 312 (class 1259 OID 25124)
-- Name: garagem_id_seq; Type: SEQUENCE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

CREATE SEQUENCE garagem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_patrimonio.garagem_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4347 (class 0 OID 0)
-- Dependencies: 312
-- Name: garagem_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER SEQUENCE garagem_id_seq OWNED BY garagem.id;


--
-- TOC entry 313 (class 1259 OID 25126)
-- Name: locacao; Type: TABLE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE locacao (
    id bigint NOT NULL,
    reservado character varying
);


ALTER TABLE cadastro_unico_patrimonio.locacao OWNER TO admin_db_sr;

--
-- TOC entry 314 (class 1259 OID 25132)
-- Name: locacao_id_seq; Type: SEQUENCE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

CREATE SEQUENCE locacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_patrimonio.locacao_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4348 (class 0 OID 0)
-- Dependencies: 314
-- Name: locacao_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER SEQUENCE locacao_id_seq OWNED BY locacao.id;


--
-- TOC entry 315 (class 1259 OID 25134)
-- Name: lotacao; Type: TABLE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE lotacao (
    id bigint NOT NULL,
    bem_id bigint NOT NULL,
    organismo_id bigint NOT NULL,
    reservado character varying
);


ALTER TABLE cadastro_unico_patrimonio.lotacao OWNER TO admin_db_sr;

--
-- TOC entry 316 (class 1259 OID 25140)
-- Name: lotacao_id_seq; Type: SEQUENCE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

CREATE SEQUENCE lotacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_patrimonio.lotacao_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4349 (class 0 OID 0)
-- Dependencies: 316
-- Name: lotacao_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER SEQUENCE lotacao_id_seq OWNED BY lotacao.id;


--
-- TOC entry 317 (class 1259 OID 25142)
-- Name: manutencao; Type: TABLE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE manutencao (
    id bigint NOT NULL,
    reservado character varying NOT NULL,
    tipo_de_manutencao character varying
);


ALTER TABLE cadastro_unico_patrimonio.manutencao OWNER TO admin_db_sr;

--
-- TOC entry 318 (class 1259 OID 25148)
-- Name: manutencao_id_seq; Type: SEQUENCE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

CREATE SEQUENCE manutencao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_patrimonio.manutencao_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4350 (class 0 OID 0)
-- Dependencies: 318
-- Name: manutencao_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER SEQUENCE manutencao_id_seq OWNED BY manutencao.id;


--
-- TOC entry 319 (class 1259 OID 25150)
-- Name: moto; Type: TABLE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE moto (
    id bigint NOT NULL,
    reservado character varying
);


ALTER TABLE cadastro_unico_patrimonio.moto OWNER TO admin_db_sr;

--
-- TOC entry 320 (class 1259 OID 25156)
-- Name: moto_id_seq; Type: SEQUENCE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

CREATE SEQUENCE moto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_patrimonio.moto_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4351 (class 0 OID 0)
-- Dependencies: 320
-- Name: moto_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER SEQUENCE moto_id_seq OWNED BY moto.id;


--
-- TOC entry 321 (class 1259 OID 25158)
-- Name: multas; Type: TABLE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE multas (
    id bigint NOT NULL,
    uso_id bigint NOT NULL,
    data_da_multa date NOT NULL,
    infracao character varying NOT NULL,
    local character varying NOT NULL,
    moeda_valor double precision NOT NULL,
    hora time with time zone NOT NULL
);


ALTER TABLE cadastro_unico_patrimonio.multas OWNER TO admin_db_sr;

--
-- TOC entry 322 (class 1259 OID 25164)
-- Name: multas_id_seq; Type: SEQUENCE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

CREATE SEQUENCE multas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_patrimonio.multas_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4352 (class 0 OID 0)
-- Dependencies: 322
-- Name: multas_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER SEQUENCE multas_id_seq OWNED BY multas.id;


--
-- TOC entry 323 (class 1259 OID 25166)
-- Name: onibus; Type: TABLE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE onibus (
    id bigint NOT NULL,
    reservado character varying
);


ALTER TABLE cadastro_unico_patrimonio.onibus OWNER TO admin_db_sr;

--
-- TOC entry 324 (class 1259 OID 25172)
-- Name: onibus_id_seq; Type: SEQUENCE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

CREATE SEQUENCE onibus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_patrimonio.onibus_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4353 (class 0 OID 0)
-- Dependencies: 324
-- Name: onibus_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER SEQUENCE onibus_id_seq OWNED BY onibus.id;


--
-- TOC entry 325 (class 1259 OID 25174)
-- Name: propriedade_de; Type: TABLE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE propriedade_de (
    id bigint NOT NULL,
    bem_id bigint NOT NULL,
    pessoa_id bigint NOT NULL,
    responsavel character varying NOT NULL
);


ALTER TABLE cadastro_unico_patrimonio.propriedade_de OWNER TO admin_db_sr;

--
-- TOC entry 326 (class 1259 OID 25180)
-- Name: propriedade_de_id_seq; Type: SEQUENCE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

CREATE SEQUENCE propriedade_de_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_patrimonio.propriedade_de_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4354 (class 0 OID 0)
-- Dependencies: 326
-- Name: propriedade_de_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER SEQUENCE propriedade_de_id_seq OWNED BY propriedade_de.id;


--
-- TOC entry 327 (class 1259 OID 25182)
-- Name: servico; Type: TABLE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE servico (
    id bigint NOT NULL,
    contrato_id bigint NOT NULL,
    veiculo_id bigint NOT NULL,
    data_da_nota date NOT NULL,
    nota_fiscal character varying NOT NULL,
    moeda_valor double precision NOT NULL,
    data_inicio date NOT NULL,
    data_fim date
);


ALTER TABLE cadastro_unico_patrimonio.servico OWNER TO admin_db_sr;

--
-- TOC entry 328 (class 1259 OID 25188)
-- Name: servico_id_seq; Type: SEQUENCE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

CREATE SEQUENCE servico_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_patrimonio.servico_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4355 (class 0 OID 0)
-- Dependencies: 328
-- Name: servico_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER SEQUENCE servico_id_seq OWNED BY servico.id;


--
-- TOC entry 329 (class 1259 OID 25190)
-- Name: trator; Type: TABLE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE trator (
    id bigint NOT NULL,
    reservado character varying
);


ALTER TABLE cadastro_unico_patrimonio.trator OWNER TO admin_db_sr;

--
-- TOC entry 330 (class 1259 OID 25196)
-- Name: trator_id_seq; Type: SEQUENCE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

CREATE SEQUENCE trator_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_patrimonio.trator_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4356 (class 0 OID 0)
-- Dependencies: 330
-- Name: trator_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER SEQUENCE trator_id_seq OWNED BY trator.id;


--
-- TOC entry 331 (class 1259 OID 25198)
-- Name: uso; Type: TABLE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE uso (
    id bigint NOT NULL,
    garagem_id bigint NOT NULL,
    motorista_id bigint NOT NULL,
    veiculo_id bigint NOT NULL,
    data date NOT NULL
);


ALTER TABLE cadastro_unico_patrimonio.uso OWNER TO admin_db_sr;

--
-- TOC entry 332 (class 1259 OID 25201)
-- Name: uso_id_seq; Type: SEQUENCE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

CREATE SEQUENCE uso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_patrimonio.uso_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4357 (class 0 OID 0)
-- Dependencies: 332
-- Name: uso_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER SEQUENCE uso_id_seq OWNED BY uso.id;


--
-- TOC entry 333 (class 1259 OID 25203)
-- Name: veiculo; Type: TABLE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE veiculo (
    id bigint NOT NULL,
    chassi character varying,
    combustivel character varying NOT NULL,
    cor character varying,
    placa character varying NOT NULL,
    quilometragem character varying,
    renavam character varying,
    ano_fabricacao character varying,
    ano_modelo character varying
);


ALTER TABLE cadastro_unico_patrimonio.veiculo OWNER TO admin_db_sr;

--
-- TOC entry 334 (class 1259 OID 25209)
-- Name: veiculo_id_seq; Type: SEQUENCE; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

CREATE SEQUENCE veiculo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_patrimonio.veiculo_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4358 (class 0 OID 0)
-- Dependencies: 334
-- Name: veiculo_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER SEQUENCE veiculo_id_seq OWNED BY veiculo.id;


SET search_path = cadastro_unico_pessoal, pg_catalog;

--
-- TOC entry 335 (class 1259 OID 25211)
-- Name: aditivo; Type: TABLE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE aditivo (
    id bigint NOT NULL,
    contrato_id bigint NOT NULL,
    numero_contrato character varying NOT NULL,
    vigencia_contrato character varying,
    data_inicio date NOT NULL,
    data_termino date NOT NULL,
    valor_limite double precision NOT NULL,
    produto character varying NOT NULL,
    saldo_restante double precision
);


ALTER TABLE cadastro_unico_pessoal.aditivo OWNER TO admin_db_sr;

--
-- TOC entry 336 (class 1259 OID 25217)
-- Name: aditivo_id_seq; Type: SEQUENCE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

CREATE SEQUENCE aditivo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_pessoal.aditivo_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4359 (class 0 OID 0)
-- Dependencies: 336
-- Name: aditivo_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER SEQUENCE aditivo_id_seq OWNED BY aditivo.id;


--
-- TOC entry 337 (class 1259 OID 25219)
-- Name: aluno; Type: TABLE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE aluno (
    id bigint NOT NULL,
    numero_de_inscricao character varying
);


ALTER TABLE cadastro_unico_pessoal.aluno OWNER TO admin_db_sr;

--
-- TOC entry 338 (class 1259 OID 25225)
-- Name: aluno_id_seq; Type: SEQUENCE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

CREATE SEQUENCE aluno_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_pessoal.aluno_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4360 (class 0 OID 0)
-- Dependencies: 338
-- Name: aluno_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER SEQUENCE aluno_id_seq OWNED BY aluno.id;


--
-- TOC entry 339 (class 1259 OID 25227)
-- Name: cidadao; Type: TABLE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE cidadao (
    id bigint NOT NULL,
    cm_categoria character varying,
    cm_data_de_emissao date,
    cm_numero character varying,
    ct_data_de_emissao date,
    ct_numero character varying,
    ct_serie character varying,
    estado_civil character varying NOT NULL,
    nacionalidade character varying,
    naturalidade character varying,
    profissao character varying,
    rg_data_de_emissao date,
    rg_numero character varying,
    rg_orgao_expeditor character varying,
    te_numero character varying,
    te_secao character varying,
    te_zona character varying
);


ALTER TABLE cadastro_unico_pessoal.cidadao OWNER TO admin_db_sr;

--
-- TOC entry 340 (class 1259 OID 25233)
-- Name: cidadao_id_seq; Type: SEQUENCE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

CREATE SEQUENCE cidadao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_pessoal.cidadao_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4361 (class 0 OID 0)
-- Dependencies: 340
-- Name: cidadao_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER SEQUENCE cidadao_id_seq OWNED BY cidadao.id;


--
-- TOC entry 341 (class 1259 OID 25235)
-- Name: contato; Type: TABLE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE contato (
    id bigint NOT NULL,
    pessoa_id bigint NOT NULL,
    tipo_contato_id bigint NOT NULL,
    contato character varying NOT NULL
);


ALTER TABLE cadastro_unico_pessoal.contato OWNER TO admin_db_sr;

--
-- TOC entry 342 (class 1259 OID 25241)
-- Name: contato_id_seq; Type: SEQUENCE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

CREATE SEQUENCE contato_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_pessoal.contato_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4362 (class 0 OID 0)
-- Dependencies: 342
-- Name: contato_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER SEQUENCE contato_id_seq OWNED BY contato.id;


--
-- TOC entry 343 (class 1259 OID 25243)
-- Name: contrato; Type: TABLE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE contrato (
    id bigint NOT NULL,
    organismo_id bigint NOT NULL,
    fornecedor_id bigint NOT NULL,
    numero_contrato character varying NOT NULL,
    vigencia_contrato character varying,
    data_inicio date NOT NULL,
    data_termino date NOT NULL,
    valor_limite double precision NOT NULL,
    produto character varying NOT NULL,
    saldo_restante double precision,
    aditivo_vigente character varying NOT NULL
);


ALTER TABLE cadastro_unico_pessoal.contrato OWNER TO admin_db_sr;

--
-- TOC entry 344 (class 1259 OID 25249)
-- Name: contrato_id_seq; Type: SEQUENCE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

CREATE SEQUENCE contrato_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_pessoal.contrato_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4363 (class 0 OID 0)
-- Dependencies: 344
-- Name: contrato_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER SEQUENCE contrato_id_seq OWNED BY contrato.id;


--
-- TOC entry 345 (class 1259 OID 25251)
-- Name: dados_bancarios; Type: TABLE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE dados_bancarios (
    id bigint NOT NULL,
    pessoa_id bigint NOT NULL,
    banco_agencia character varying NOT NULL,
    banco_conta character varying NOT NULL,
    banco_nome character varying NOT NULL,
    banco_operacao character varying
);


ALTER TABLE cadastro_unico_pessoal.dados_bancarios OWNER TO admin_db_sr;

--
-- TOC entry 346 (class 1259 OID 25257)
-- Name: dados_bancarios_id_seq; Type: SEQUENCE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

CREATE SEQUENCE dados_bancarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_pessoal.dados_bancarios_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4364 (class 0 OID 0)
-- Dependencies: 346
-- Name: dados_bancarios_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER SEQUENCE dados_bancarios_id_seq OWNED BY dados_bancarios.id;


--
-- TOC entry 347 (class 1259 OID 25259)
-- Name: detem_propriedade; Type: TABLE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE detem_propriedade (
    id bigint NOT NULL,
    cidadao_id bigint NOT NULL,
    unidade_edificada_id bigint NOT NULL,
    data_inicio date NOT NULL,
    data_termino date
);


ALTER TABLE cadastro_unico_pessoal.detem_propriedade OWNER TO admin_db_sr;

--
-- TOC entry 348 (class 1259 OID 25262)
-- Name: detem_propriedade_id_seq; Type: SEQUENCE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

CREATE SEQUENCE detem_propriedade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_pessoal.detem_propriedade_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4365 (class 0 OID 0)
-- Dependencies: 348
-- Name: detem_propriedade_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER SEQUENCE detem_propriedade_id_seq OWNED BY detem_propriedade.id;


--
-- TOC entry 349 (class 1259 OID 25264)
-- Name: editora; Type: TABLE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE editora (
    id bigint NOT NULL,
    reservado character varying
);


ALTER TABLE cadastro_unico_pessoal.editora OWNER TO admin_db_sr;

--
-- TOC entry 350 (class 1259 OID 25270)
-- Name: editora_id_seq; Type: SEQUENCE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

CREATE SEQUENCE editora_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_pessoal.editora_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4366 (class 0 OID 0)
-- Dependencies: 350
-- Name: editora_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER SEQUENCE editora_id_seq OWNED BY editora.id;


--
-- TOC entry 351 (class 1259 OID 25272)
-- Name: escola; Type: TABLE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE escola (
    id bigint NOT NULL,
    inep_da_escola character varying NOT NULL,
    latitude character varying,
    longitude character varying
);


ALTER TABLE cadastro_unico_pessoal.escola OWNER TO admin_db_sr;

--
-- TOC entry 352 (class 1259 OID 25278)
-- Name: escola_id_seq; Type: SEQUENCE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

CREATE SEQUENCE escola_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_pessoal.escola_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4367 (class 0 OID 0)
-- Dependencies: 352
-- Name: escola_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER SEQUENCE escola_id_seq OWNED BY escola.id;


--
-- TOC entry 353 (class 1259 OID 25280)
-- Name: fornecedor; Type: TABLE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE fornecedor (
    id bigint NOT NULL,
    reservado character varying
);


ALTER TABLE cadastro_unico_pessoal.fornecedor OWNER TO admin_db_sr;

--
-- TOC entry 354 (class 1259 OID 25286)
-- Name: fornecedor_id_seq; Type: SEQUENCE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

CREATE SEQUENCE fornecedor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_pessoal.fornecedor_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 355 (class 1259 OID 25288)
-- Name: funcionario; Type: TABLE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE funcionario (
    id bigint NOT NULL,
    carga_horaria character varying NOT NULL,
    data_de_admissao date,
    data_de_demissao date,
    inss character varying,
    matricula character varying NOT NULL,
    ativo character varying
);


ALTER TABLE cadastro_unico_pessoal.funcionario OWNER TO admin_db_sr;

--
-- TOC entry 356 (class 1259 OID 25294)
-- Name: funcionario_id_seq; Type: SEQUENCE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

CREATE SEQUENCE funcionario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_pessoal.funcionario_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4368 (class 0 OID 0)
-- Dependencies: 356
-- Name: funcionario_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER SEQUENCE funcionario_id_seq OWNED BY funcionario.id;


--
-- TOC entry 357 (class 1259 OID 25296)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_pessoal.hibernate_sequence OWNER TO admin_db_sr;

--
-- TOC entry 358 (class 1259 OID 25298)
-- Name: identificacaoAluno; Type: SEQUENCE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

CREATE SEQUENCE "identificacaoAluno"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_pessoal."identificacaoAluno" OWNER TO admin_db_sr;

--
-- TOC entry 359 (class 1259 OID 25300)
-- Name: motorista; Type: TABLE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE motorista (
    id bigint NOT NULL,
    categoria character varying NOT NULL,
    cnh character varying NOT NULL,
    cnh_validade date NOT NULL,
    data_de_emissao date NOT NULL
);


ALTER TABLE cadastro_unico_pessoal.motorista OWNER TO admin_db_sr;

--
-- TOC entry 360 (class 1259 OID 25306)
-- Name: motorista_id_seq; Type: SEQUENCE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

CREATE SEQUENCE motorista_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_pessoal.motorista_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4369 (class 0 OID 0)
-- Dependencies: 360
-- Name: motorista_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER SEQUENCE motorista_id_seq OWNED BY motorista.id;


--
-- TOC entry 361 (class 1259 OID 25308)
-- Name: paciente; Type: TABLE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE paciente (
    id bigint NOT NULL,
    prontuario character varying NOT NULL
);


ALTER TABLE cadastro_unico_pessoal.paciente OWNER TO admin_db_sr;

--
-- TOC entry 362 (class 1259 OID 25314)
-- Name: paciente_id_seq; Type: SEQUENCE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

CREATE SEQUENCE paciente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_pessoal.paciente_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4370 (class 0 OID 0)
-- Dependencies: 362
-- Name: paciente_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER SEQUENCE paciente_id_seq OWNED BY paciente.id;


--
-- TOC entry 363 (class 1259 OID 25316)
-- Name: parentesco; Type: TABLE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE parentesco (
    id bigint NOT NULL,
    pessoa_fisica_id bigint NOT NULL,
    parentesco character varying,
    pessoa_id bigint NOT NULL
);


ALTER TABLE cadastro_unico_pessoal.parentesco OWNER TO admin_db_sr;

--
-- TOC entry 364 (class 1259 OID 25322)
-- Name: parentesco_id_seq; Type: SEQUENCE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

CREATE SEQUENCE parentesco_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_pessoal.parentesco_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4371 (class 0 OID 0)
-- Dependencies: 364
-- Name: parentesco_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER SEQUENCE parentesco_id_seq OWNED BY parentesco.id;


--
-- TOC entry 365 (class 1259 OID 25324)
-- Name: pessoa; Type: TABLE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE pessoa (
    id bigint NOT NULL,
    data_de_nascimento date,
    nome character varying NOT NULL,
    cpf_cnpj character varying(30),
    escid integer,
    status character varying(255) DEFAULT 'Ativo'::character varying NOT NULL,
    esc_id_destino integer
);


ALTER TABLE cadastro_unico_pessoal.pessoa OWNER TO admin_db_sr;

--
-- TOC entry 366 (class 1259 OID 25331)
-- Name: pessoa_fisica; Type: TABLE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE pessoa_fisica (
    id bigint NOT NULL,
    cor character varying,
    foto character varying,
    grau_de_instrucao character varying,
    necessidades_especiais character varying,
    rc_data_do_registro date,
    rc_folha_do_livro character varying,
    rc_nome_do_cartorio character varying,
    rc_nome_do_livro character varying,
    rc_numero character varying,
    religiao character varying,
    sexo character varying NOT NULL,
    tipo_sanguineo character varying
);


ALTER TABLE cadastro_unico_pessoal.pessoa_fisica OWNER TO admin_db_sr;

--
-- TOC entry 367 (class 1259 OID 25337)
-- Name: pessoa_fisica_id_seq; Type: SEQUENCE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

CREATE SEQUENCE pessoa_fisica_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_pessoal.pessoa_fisica_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4372 (class 0 OID 0)
-- Dependencies: 367
-- Name: pessoa_fisica_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER SEQUENCE pessoa_fisica_id_seq OWNED BY pessoa_fisica.id;


--
-- TOC entry 368 (class 1259 OID 25339)
-- Name: pessoa_id_seq; Type: SEQUENCE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

CREATE SEQUENCE pessoa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_pessoal.pessoa_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4373 (class 0 OID 0)
-- Dependencies: 368
-- Name: pessoa_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER SEQUENCE pessoa_id_seq OWNED BY pessoa.id;


--
-- TOC entry 369 (class 1259 OID 25341)
-- Name: pessoa_juridica; Type: TABLE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE pessoa_juridica (
    id bigint NOT NULL,
    inscricao_estadual character varying,
    razao_social character varying NOT NULL
);


ALTER TABLE cadastro_unico_pessoal.pessoa_juridica OWNER TO admin_db_sr;

--
-- TOC entry 370 (class 1259 OID 25347)
-- Name: pessoa_juridica_id_seq; Type: SEQUENCE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

CREATE SEQUENCE pessoa_juridica_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_pessoal.pessoa_juridica_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4374 (class 0 OID 0)
-- Dependencies: 370
-- Name: pessoa_juridica_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER SEQUENCE pessoa_juridica_id_seq OWNED BY pessoa_juridica.id;


--
-- TOC entry 371 (class 1259 OID 25349)
-- Name: prefeitura; Type: TABLE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE prefeitura (
    id bigint NOT NULL,
    brasao character varying
);


ALTER TABLE cadastro_unico_pessoal.prefeitura OWNER TO admin_db_sr;

--
-- TOC entry 372 (class 1259 OID 25355)
-- Name: prefeitura_id_seq; Type: SEQUENCE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

CREATE SEQUENCE prefeitura_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_pessoal.prefeitura_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4375 (class 0 OID 0)
-- Dependencies: 372
-- Name: prefeitura_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER SEQUENCE prefeitura_id_seq OWNED BY prefeitura.id;


--
-- TOC entry 373 (class 1259 OID 25357)
-- Name: professor; Type: TABLE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE professor (
    id bigint NOT NULL,
    identificacao character varying
);


ALTER TABLE cadastro_unico_pessoal.professor OWNER TO admin_db_sr;

--
-- TOC entry 374 (class 1259 OID 25363)
-- Name: professor_id_seq; Type: SEQUENCE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

CREATE SEQUENCE professor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_pessoal.professor_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4376 (class 0 OID 0)
-- Dependencies: 374
-- Name: professor_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER SEQUENCE professor_id_seq OWNED BY professor.id;


--
-- TOC entry 375 (class 1259 OID 25365)
-- Name: reside; Type: TABLE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE reside (
    id bigint NOT NULL,
    bairro_id bigint NOT NULL,
    logradouro_id bigint NOT NULL,
    pessoa_id bigint NOT NULL,
    numero character varying(20),
    complemento character varying(300),
    cep character varying(9)
);


ALTER TABLE cadastro_unico_pessoal.reside OWNER TO admin_db_sr;

--
-- TOC entry 376 (class 1259 OID 25371)
-- Name: reside_id_seq; Type: SEQUENCE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

CREATE SEQUENCE reside_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_pessoal.reside_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4377 (class 0 OID 0)
-- Dependencies: 376
-- Name: reside_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER SEQUENCE reside_id_seq OWNED BY reside.id;


--
-- TOC entry 377 (class 1259 OID 25373)
-- Name: tipo_contato; Type: TABLE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE tipo_contato (
    id bigint NOT NULL,
    tipo_contato character varying NOT NULL
);


ALTER TABLE cadastro_unico_pessoal.tipo_contato OWNER TO admin_db_sr;

--
-- TOC entry 378 (class 1259 OID 25379)
-- Name: tipo_contato_id_seq; Type: SEQUENCE; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

CREATE SEQUENCE tipo_contato_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_pessoal.tipo_contato_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4378 (class 0 OID 0)
-- Dependencies: 378
-- Name: tipo_contato_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER SEQUENCE tipo_contato_id_seq OWNED BY tipo_contato.id;


SET search_path = cadastro_unico_protocolo, pg_catalog;

--
-- TOC entry 379 (class 1259 OID 25381)
-- Name: item; Type: TABLE; Schema: cadastro_unico_protocolo; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE item (
    id bigint NOT NULL,
    lote_item_id bigint NOT NULL,
    nome character varying NOT NULL
);


ALTER TABLE cadastro_unico_protocolo.item OWNER TO admin_db_sr;

--
-- TOC entry 380 (class 1259 OID 25387)
-- Name: item_id_seq; Type: SEQUENCE; Schema: cadastro_unico_protocolo; Owner: admin_db_sr
--

CREATE SEQUENCE item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_protocolo.item_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4379 (class 0 OID 0)
-- Dependencies: 380
-- Name: item_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_protocolo; Owner: admin_db_sr
--

ALTER SEQUENCE item_id_seq OWNED BY item.id;


--
-- TOC entry 381 (class 1259 OID 25389)
-- Name: lote_item; Type: TABLE; Schema: cadastro_unico_protocolo; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE lote_item (
    id bigint NOT NULL,
    lote character varying NOT NULL
);


ALTER TABLE cadastro_unico_protocolo.lote_item OWNER TO admin_db_sr;

--
-- TOC entry 382 (class 1259 OID 25395)
-- Name: lote_item_id_seq; Type: SEQUENCE; Schema: cadastro_unico_protocolo; Owner: admin_db_sr
--

CREATE SEQUENCE lote_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_protocolo.lote_item_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4380 (class 0 OID 0)
-- Dependencies: 382
-- Name: lote_item_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_protocolo; Owner: admin_db_sr
--

ALTER SEQUENCE lote_item_id_seq OWNED BY lote_item.id;


--
-- TOC entry 383 (class 1259 OID 25397)
-- Name: movimentacao; Type: TABLE; Schema: cadastro_unico_protocolo; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE movimentacao (
    id bigint NOT NULL,
    destino_id bigint NOT NULL,
    lote_item_id bigint NOT NULL,
    origem_id bigint NOT NULL,
    tratamento_id bigint NOT NULL,
    data_de_envio date NOT NULL,
    data_de_recebimento date
);


ALTER TABLE cadastro_unico_protocolo.movimentacao OWNER TO admin_db_sr;

--
-- TOC entry 384 (class 1259 OID 25400)
-- Name: movimentacao_id_seq; Type: SEQUENCE; Schema: cadastro_unico_protocolo; Owner: admin_db_sr
--

CREATE SEQUENCE movimentacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_protocolo.movimentacao_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4381 (class 0 OID 0)
-- Dependencies: 384
-- Name: movimentacao_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_protocolo; Owner: admin_db_sr
--

ALTER SEQUENCE movimentacao_id_seq OWNED BY movimentacao.id;


--
-- TOC entry 385 (class 1259 OID 25402)
-- Name: tratamento; Type: TABLE; Schema: cadastro_unico_protocolo; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE tratamento (
    id bigint NOT NULL,
    tratamento character varying NOT NULL
);


ALTER TABLE cadastro_unico_protocolo.tratamento OWNER TO admin_db_sr;

--
-- TOC entry 386 (class 1259 OID 25408)
-- Name: tratamento_id_seq; Type: SEQUENCE; Schema: cadastro_unico_protocolo; Owner: admin_db_sr
--

CREATE SEQUENCE tratamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cadastro_unico_protocolo.tratamento_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4382 (class 0 OID 0)
-- Dependencies: 386
-- Name: tratamento_id_seq; Type: SEQUENCE OWNED BY; Schema: cadastro_unico_protocolo; Owner: admin_db_sr
--

ALTER SEQUENCE tratamento_id_seq OWNED BY tratamento.id;


SET search_path = controle_de_acesso_a_dado, pg_catalog;

--
-- TOC entry 387 (class 1259 OID 25410)
-- Name: mapa_de_acesso; Type: TABLE; Schema: controle_de_acesso_a_dado; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE mapa_de_acesso (
    id bigint NOT NULL,
    pessoa_id bigint NOT NULL,
    cargos character varying,
    celulas character varying,
    organismos character varying,
    denominacao character varying,
    cargo_id bigint[],
    celula_id bigint[],
    organismo_id bigint[],
    restrito boolean
);


ALTER TABLE controle_de_acesso_a_dado.mapa_de_acesso OWNER TO admin_db_sr;

--
-- TOC entry 4383 (class 0 OID 0)
-- Dependencies: 387
-- Name: TABLE mapa_de_acesso; Type: COMMENT; Schema: controle_de_acesso_a_dado; Owner: admin_db_sr
--

COMMENT ON TABLE mapa_de_acesso IS 'Através deste mapa é feito o controle de acesso a dados. 
<funcionario, conjunto de cargos, conjunto de células, conjunto de organismos>';


--
-- TOC entry 4384 (class 0 OID 0)
-- Dependencies: 387
-- Name: COLUMN mapa_de_acesso.restrito; Type: COMMENT; Schema: controle_de_acesso_a_dado; Owner: admin_db_sr
--

COMMENT ON COLUMN mapa_de_acesso.restrito IS 'Restrição indica o mais baixo nivel hieraquico em que pode-se ver somente os registros que foram cadastrado pelo funcionario em questao. 
true - ver somente seus proprios registros
';


--
-- TOC entry 388 (class 1259 OID 25416)
-- Name: mapa_de_acesso_id_seq; Type: SEQUENCE; Schema: controle_de_acesso_a_dado; Owner: admin_db_sr
--

CREATE SEQUENCE mapa_de_acesso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE controle_de_acesso_a_dado.mapa_de_acesso_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4385 (class 0 OID 0)
-- Dependencies: 388
-- Name: mapa_de_acesso_id_seq; Type: SEQUENCE OWNED BY; Schema: controle_de_acesso_a_dado; Owner: admin_db_sr
--

ALTER SEQUENCE mapa_de_acesso_id_seq OWNED BY mapa_de_acesso.id;


--
-- TOC entry 389 (class 1259 OID 25418)
-- Name: vinculo_acesso; Type: TABLE; Schema: controle_de_acesso_a_dado; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE vinculo_acesso (
    id bigint NOT NULL,
    esquema character varying(255) NOT NULL,
    idescola integer NOT NULL,
    tabela character varying(255) NOT NULL,
    idtabela integer NOT NULL
);


ALTER TABLE controle_de_acesso_a_dado.vinculo_acesso OWNER TO admin_db_sr;

--
-- TOC entry 390 (class 1259 OID 25424)
-- Name: vinculo_acesso_id_seq; Type: SEQUENCE; Schema: controle_de_acesso_a_dado; Owner: admin_db_sr
--

CREATE SEQUENCE vinculo_acesso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE controle_de_acesso_a_dado.vinculo_acesso_id_seq OWNER TO admin_db_sr;

SET search_path = educacao_academico, pg_catalog;

--
-- TOC entry 391 (class 1259 OID 25426)
-- Name: atividade; Type: TABLE; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE atividade (
    id bigint NOT NULL,
    descricao_atividade character varying(255) NOT NULL,
    nome_atividade character varying(255) NOT NULL,
    nota_maxima real NOT NULL,
    peso_atividade integer NOT NULL,
    turma_disciplina_id bigint NOT NULL,
    data_fim timestamp without time zone NOT NULL,
    data_inicio timestamp without time zone NOT NULL,
    bimestre character varying(255) NOT NULL,
    tipo_atividade character varying(255) NOT NULL
);


ALTER TABLE educacao_academico.atividade OWNER TO admin_db_sr;

--
-- TOC entry 392 (class 1259 OID 25432)
-- Name: atividade_id_seq; Type: SEQUENCE; Schema: educacao_academico; Owner: admin_db_sr
--

CREATE SEQUENCE atividade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educacao_academico.atividade_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 393 (class 1259 OID 25434)
-- Name: aula; Type: TABLE; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE aula (
    id bigint NOT NULL,
    conteudo character varying(255),
    data_aula timestamp without time zone NOT NULL,
    quant_horarios integer NOT NULL,
    tipo_aula_id bigint NOT NULL,
    titulo character varying(255),
    turma_disciplina_id bigint NOT NULL
);


ALTER TABLE educacao_academico.aula OWNER TO admin_db_sr;

--
-- TOC entry 394 (class 1259 OID 25440)
-- Name: aula_id_seq; Type: SEQUENCE; Schema: educacao_academico; Owner: admin_db_sr
--

CREATE SEQUENCE aula_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educacao_academico.aula_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 395 (class 1259 OID 25442)
-- Name: conteudo_da_disciplina; Type: TABLE; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE conteudo_da_disciplina (
    id bigint NOT NULL,
    disciplina_id bigint NOT NULL,
    conteudo_da_disciplina character varying NOT NULL
);


ALTER TABLE educacao_academico.conteudo_da_disciplina OWNER TO admin_db_sr;

--
-- TOC entry 396 (class 1259 OID 25448)
-- Name: conteudo_da_disciplina_id_seq; Type: SEQUENCE; Schema: educacao_academico; Owner: admin_db_sr
--

CREATE SEQUENCE conteudo_da_disciplina_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educacao_academico.conteudo_da_disciplina_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4386 (class 0 OID 0)
-- Dependencies: 396
-- Name: conteudo_da_disciplina_id_seq; Type: SEQUENCE OWNED BY; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER SEQUENCE conteudo_da_disciplina_id_seq OWNED BY conteudo_da_disciplina.id;


--
-- TOC entry 397 (class 1259 OID 25450)
-- Name: disciplina; Type: TABLE; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE disciplina (
    id bigint NOT NULL,
    carga_horaria character varying NOT NULL,
    disciplina character varying NOT NULL
);


ALTER TABLE educacao_academico.disciplina OWNER TO admin_db_sr;

--
-- TOC entry 398 (class 1259 OID 25456)
-- Name: disciplina_id_seq; Type: SEQUENCE; Schema: educacao_academico; Owner: admin_db_sr
--

CREATE SEQUENCE disciplina_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educacao_academico.disciplina_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4387 (class 0 OID 0)
-- Dependencies: 398
-- Name: disciplina_id_seq; Type: SEQUENCE OWNED BY; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER SEQUENCE disciplina_id_seq OWNED BY disciplina.id;


--
-- TOC entry 399 (class 1259 OID 25458)
-- Name: disciplina_lecionada_por_professor; Type: TABLE; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE disciplina_lecionada_por_professor (
    id bigint NOT NULL,
    disciplina_id bigint NOT NULL,
    professor_id bigint NOT NULL,
    data date NOT NULL,
    situacao character varying NOT NULL
);


ALTER TABLE educacao_academico.disciplina_lecionada_por_professor OWNER TO admin_db_sr;

--
-- TOC entry 400 (class 1259 OID 25464)
-- Name: disciplina_lecionada_por_professor_id_seq; Type: SEQUENCE; Schema: educacao_academico; Owner: admin_db_sr
--

CREATE SEQUENCE disciplina_lecionada_por_professor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educacao_academico.disciplina_lecionada_por_professor_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4388 (class 0 OID 0)
-- Dependencies: 400
-- Name: disciplina_lecionada_por_professor_id_seq; Type: SEQUENCE OWNED BY; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER SEQUENCE disciplina_lecionada_por_professor_id_seq OWNED BY disciplina_lecionada_por_professor.id;


--
-- TOC entry 401 (class 1259 OID 25466)
-- Name: frequencia; Type: TABLE; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE frequencia (
    id bigint NOT NULL,
    aula_id bigint NOT NULL,
    matricula_id bigint NOT NULL,
    quant_faltas integer NOT NULL
);


ALTER TABLE educacao_academico.frequencia OWNER TO admin_db_sr;

--
-- TOC entry 402 (class 1259 OID 25469)
-- Name: frequencia_id_seq; Type: SEQUENCE; Schema: educacao_academico; Owner: admin_db_sr
--

CREATE SEQUENCE frequencia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educacao_academico.frequencia_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 403 (class 1259 OID 25471)
-- Name: horario; Type: TABLE; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE horario (
    id bigint NOT NULL,
    sala_id bigint NOT NULL,
    horario character varying NOT NULL,
    turma_disciplina_id bigint NOT NULL
);


ALTER TABLE educacao_academico.horario OWNER TO admin_db_sr;

--
-- TOC entry 404 (class 1259 OID 25477)
-- Name: horario_id_seq; Type: SEQUENCE; Schema: educacao_academico; Owner: admin_db_sr
--

CREATE SEQUENCE horario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educacao_academico.horario_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4389 (class 0 OID 0)
-- Dependencies: 404
-- Name: horario_id_seq; Type: SEQUENCE OWNED BY; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER SEQUENCE horario_id_seq OWNED BY horario.id;


--
-- TOC entry 405 (class 1259 OID 25479)
-- Name: matricula; Type: TABLE; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE matricula (
    id bigint NOT NULL,
    aluno_id bigint NOT NULL,
    turma_id bigint NOT NULL,
    data_da_matricula date NOT NULL,
    matricula character varying,
    status character varying(255) DEFAULT 'Ativo'::character varying
);


ALTER TABLE educacao_academico.matricula OWNER TO admin_db_sr;

--
-- TOC entry 406 (class 1259 OID 25486)
-- Name: matricula_id_seq; Type: SEQUENCE; Schema: educacao_academico; Owner: admin_db_sr
--

CREATE SEQUENCE matricula_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educacao_academico.matricula_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4390 (class 0 OID 0)
-- Dependencies: 406
-- Name: matricula_id_seq; Type: SEQUENCE OWNED BY; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER SEQUENCE matricula_id_seq OWNED BY matricula.id;


--
-- TOC entry 407 (class 1259 OID 25488)
-- Name: matricula_nota; Type: TABLE; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE matricula_nota (
    matricula_nota_id bigint,
    nota_id bigint
);


ALTER TABLE educacao_academico.matricula_nota OWNER TO admin_db_sr;

--
-- TOC entry 408 (class 1259 OID 25491)
-- Name: nota; Type: TABLE; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE nota (
    id bigint NOT NULL,
    atividade_id bigint NOT NULL,
    matricula_id bigint NOT NULL,
    observacao character varying(255),
    pontuacao real NOT NULL
);


ALTER TABLE educacao_academico.nota OWNER TO admin_db_sr;

--
-- TOC entry 409 (class 1259 OID 25494)
-- Name: nota_id_seq; Type: SEQUENCE; Schema: educacao_academico; Owner: admin_db_sr
--

CREATE SEQUENCE nota_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educacao_academico.nota_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4391 (class 0 OID 0)
-- Dependencies: 409
-- Name: nota_id_seq; Type: SEQUENCE OWNED BY; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER SEQUENCE nota_id_seq OWNED BY nota.id;


--
-- TOC entry 410 (class 1259 OID 25496)
-- Name: sala; Type: TABLE; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE sala (
    id bigint NOT NULL,
    escola_id bigint NOT NULL,
    sala character varying NOT NULL,
    vagas integer
);


ALTER TABLE educacao_academico.sala OWNER TO admin_db_sr;

--
-- TOC entry 411 (class 1259 OID 25502)
-- Name: sala_id_seq; Type: SEQUENCE; Schema: educacao_academico; Owner: admin_db_sr
--

CREATE SEQUENCE sala_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educacao_academico.sala_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4392 (class 0 OID 0)
-- Dependencies: 411
-- Name: sala_id_seq; Type: SEQUENCE OWNED BY; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER SEQUENCE sala_id_seq OWNED BY sala.id;


--
-- TOC entry 412 (class 1259 OID 25504)
-- Name: serie; Type: TABLE; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE serie (
    id bigint NOT NULL,
    data_de_inicio date NOT NULL,
    data_de_termino date NOT NULL,
    numero_de_vagas bigint NOT NULL,
    serie character varying NOT NULL
);


ALTER TABLE educacao_academico.serie OWNER TO admin_db_sr;

--
-- TOC entry 413 (class 1259 OID 25510)
-- Name: serie_id_seq; Type: SEQUENCE; Schema: educacao_academico; Owner: admin_db_sr
--

CREATE SEQUENCE serie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educacao_academico.serie_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4393 (class 0 OID 0)
-- Dependencies: 413
-- Name: serie_id_seq; Type: SEQUENCE OWNED BY; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER SEQUENCE serie_id_seq OWNED BY serie.id;


--
-- TOC entry 414 (class 1259 OID 25512)
-- Name: tipo_aula_id_seq; Type: SEQUENCE; Schema: educacao_academico; Owner: admin_db_sr
--

CREATE SEQUENCE tipo_aula_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educacao_academico.tipo_aula_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 415 (class 1259 OID 25514)
-- Name: tipo_aula; Type: TABLE; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE tipo_aula (
    id bigint DEFAULT nextval('tipo_aula_id_seq'::regclass) NOT NULL,
    tipo_de_aula character varying NOT NULL
);


ALTER TABLE educacao_academico.tipo_aula OWNER TO admin_db_sr;

--
-- TOC entry 416 (class 1259 OID 25521)
-- Name: tipoaula; Type: TABLE; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE tipoaula (
    id bigint NOT NULL,
    tipo_de_aula character varying(255) NOT NULL
);


ALTER TABLE educacao_academico.tipoaula OWNER TO admin_db_sr;

--
-- TOC entry 417 (class 1259 OID 25524)
-- Name: tipoaula_id_seq; Type: SEQUENCE; Schema: educacao_academico; Owner: admin_db_sr
--

CREATE SEQUENCE tipoaula_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educacao_academico.tipoaula_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 418 (class 1259 OID 25526)
-- Name: turma; Type: TABLE; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE turma (
    id bigint NOT NULL,
    serie_id bigint NOT NULL,
    turma character varying NOT NULL,
    vagas integer NOT NULL,
    escola_id bigint,
    ano_letivo bigint,
    turno character varying
);


ALTER TABLE educacao_academico.turma OWNER TO admin_db_sr;

--
-- TOC entry 4394 (class 0 OID 0)
-- Dependencies: 418
-- Name: COLUMN turma.escola_id; Type: COMMENT; Schema: educacao_academico; Owner: admin_db_sr
--

COMMENT ON COLUMN turma.escola_id IS '
';


--
-- TOC entry 419 (class 1259 OID 25532)
-- Name: turma_disciplina; Type: TABLE; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE turma_disciplina (
    id bigint NOT NULL,
    turma_id bigint NOT NULL,
    data_inicio date NOT NULL,
    data_termino date NOT NULL,
    identificacao character varying NOT NULL,
    disciplina_lecionada_por_professor_id bigint NOT NULL
);


ALTER TABLE educacao_academico.turma_disciplina OWNER TO admin_db_sr;

--
-- TOC entry 420 (class 1259 OID 25538)
-- Name: turma_disciplina_id_seq; Type: SEQUENCE; Schema: educacao_academico; Owner: admin_db_sr
--

CREATE SEQUENCE turma_disciplina_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educacao_academico.turma_disciplina_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4395 (class 0 OID 0)
-- Dependencies: 420
-- Name: turma_disciplina_id_seq; Type: SEQUENCE OWNED BY; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER SEQUENCE turma_disciplina_id_seq OWNED BY turma_disciplina.id;


--
-- TOC entry 421 (class 1259 OID 25540)
-- Name: turma_id_seq; Type: SEQUENCE; Schema: educacao_academico; Owner: admin_db_sr
--

CREATE SEQUENCE turma_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educacao_academico.turma_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4396 (class 0 OID 0)
-- Dependencies: 421
-- Name: turma_id_seq; Type: SEQUENCE OWNED BY; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER SEQUENCE turma_id_seq OWNED BY turma.id;


SET search_path = educacao_biblioteca, pg_catalog;

--
-- TOC entry 422 (class 1259 OID 25542)
-- Name: acervo; Type: TABLE; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE acervo (
    id bigint NOT NULL,
    escola_id bigint NOT NULL,
    nome character varying NOT NULL
);


ALTER TABLE educacao_biblioteca.acervo OWNER TO admin_db_sr;

--
-- TOC entry 423 (class 1259 OID 25548)
-- Name: acervo_id_seq; Type: SEQUENCE; Schema: educacao_biblioteca; Owner: admin_db_sr
--

CREATE SEQUENCE acervo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educacao_biblioteca.acervo_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4397 (class 0 OID 0)
-- Dependencies: 423
-- Name: acervo_id_seq; Type: SEQUENCE OWNED BY; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER SEQUENCE acervo_id_seq OWNED BY acervo.id;


--
-- TOC entry 424 (class 1259 OID 25550)
-- Name: autor; Type: TABLE; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE autor (
    id bigint NOT NULL,
    nome character varying NOT NULL
);


ALTER TABLE educacao_biblioteca.autor OWNER TO admin_db_sr;

--
-- TOC entry 425 (class 1259 OID 25556)
-- Name: autor_id_seq; Type: SEQUENCE; Schema: educacao_biblioteca; Owner: admin_db_sr
--

CREATE SEQUENCE autor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educacao_biblioteca.autor_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4398 (class 0 OID 0)
-- Dependencies: 425
-- Name: autor_id_seq; Type: SEQUENCE OWNED BY; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER SEQUENCE autor_id_seq OWNED BY autor.id;


--
-- TOC entry 426 (class 1259 OID 25558)
-- Name: conteudo; Type: TABLE; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE conteudo (
    id bigint NOT NULL,
    conteudo character varying NOT NULL
);


ALTER TABLE educacao_biblioteca.conteudo OWNER TO admin_db_sr;

--
-- TOC entry 427 (class 1259 OID 25564)
-- Name: conteudo_didatica; Type: TABLE; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE conteudo_didatica (
    id bigint NOT NULL,
    conteudo_id bigint NOT NULL,
    didatica_id bigint NOT NULL,
    reservado character varying
);


ALTER TABLE educacao_biblioteca.conteudo_didatica OWNER TO admin_db_sr;

--
-- TOC entry 428 (class 1259 OID 25570)
-- Name: conteudo_didatica_id_seq; Type: SEQUENCE; Schema: educacao_biblioteca; Owner: admin_db_sr
--

CREATE SEQUENCE conteudo_didatica_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educacao_biblioteca.conteudo_didatica_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4399 (class 0 OID 0)
-- Dependencies: 428
-- Name: conteudo_didatica_id_seq; Type: SEQUENCE OWNED BY; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER SEQUENCE conteudo_didatica_id_seq OWNED BY conteudo_didatica.id;


--
-- TOC entry 429 (class 1259 OID 25572)
-- Name: conteudo_id_seq; Type: SEQUENCE; Schema: educacao_biblioteca; Owner: admin_db_sr
--

CREATE SEQUENCE conteudo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educacao_biblioteca.conteudo_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4400 (class 0 OID 0)
-- Dependencies: 429
-- Name: conteudo_id_seq; Type: SEQUENCE OWNED BY; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER SEQUENCE conteudo_id_seq OWNED BY conteudo.id;


--
-- TOC entry 430 (class 1259 OID 25574)
-- Name: didatica; Type: TABLE; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE didatica (
    id bigint NOT NULL,
    reservado character varying
);


ALTER TABLE educacao_biblioteca.didatica OWNER TO admin_db_sr;

--
-- TOC entry 431 (class 1259 OID 25580)
-- Name: didatica_id_seq; Type: SEQUENCE; Schema: educacao_biblioteca; Owner: admin_db_sr
--

CREATE SEQUENCE didatica_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educacao_biblioteca.didatica_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4401 (class 0 OID 0)
-- Dependencies: 431
-- Name: didatica_id_seq; Type: SEQUENCE OWNED BY; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER SEQUENCE didatica_id_seq OWNED BY didatica.id;


--
-- TOC entry 432 (class 1259 OID 25582)
-- Name: edicao; Type: TABLE; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE edicao (
    id bigint NOT NULL,
    obra_id bigint NOT NULL,
    edicao character varying NOT NULL,
    isbn character varying NOT NULL,
    ano character varying NOT NULL
);


ALTER TABLE educacao_biblioteca.edicao OWNER TO admin_db_sr;

--
-- TOC entry 433 (class 1259 OID 25588)
-- Name: edicao_id_seq; Type: SEQUENCE; Schema: educacao_biblioteca; Owner: admin_db_sr
--

CREATE SEQUENCE edicao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educacao_biblioteca.edicao_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4402 (class 0 OID 0)
-- Dependencies: 433
-- Name: edicao_id_seq; Type: SEQUENCE OWNED BY; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER SEQUENCE edicao_id_seq OWNED BY edicao.id;


--
-- TOC entry 434 (class 1259 OID 25590)
-- Name: emprestimo; Type: TABLE; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE emprestimo (
    id bigint NOT NULL,
    cidadao_id bigint NOT NULL,
    exemplar_id bigint NOT NULL,
    funcionario_id bigint NOT NULL,
    data_devolucao date,
    data_prevista date NOT NULL,
    data_retirada date NOT NULL,
    situacao character varying NOT NULL
);


ALTER TABLE educacao_biblioteca.emprestimo OWNER TO admin_db_sr;

--
-- TOC entry 435 (class 1259 OID 25596)
-- Name: emprestimo_id_seq; Type: SEQUENCE; Schema: educacao_biblioteca; Owner: admin_db_sr
--

CREATE SEQUENCE emprestimo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educacao_biblioteca.emprestimo_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4403 (class 0 OID 0)
-- Dependencies: 435
-- Name: emprestimo_id_seq; Type: SEQUENCE OWNED BY; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER SEQUENCE emprestimo_id_seq OWNED BY emprestimo.id;


--
-- TOC entry 436 (class 1259 OID 25598)
-- Name: estante; Type: TABLE; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE estante (
    id bigint NOT NULL,
    acervo_id bigint NOT NULL,
    estante character varying NOT NULL
);


ALTER TABLE educacao_biblioteca.estante OWNER TO admin_db_sr;

--
-- TOC entry 437 (class 1259 OID 25604)
-- Name: estante_id_seq; Type: SEQUENCE; Schema: educacao_biblioteca; Owner: admin_db_sr
--

CREATE SEQUENCE estante_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educacao_biblioteca.estante_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4404 (class 0 OID 0)
-- Dependencies: 437
-- Name: estante_id_seq; Type: SEQUENCE OWNED BY; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER SEQUENCE estante_id_seq OWNED BY estante.id;


--
-- TOC entry 438 (class 1259 OID 25606)
-- Name: exemplar; Type: TABLE; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE exemplar (
    id bigint NOT NULL,
    obra_id bigint NOT NULL,
    prateleira_id bigint NOT NULL,
    codigo character varying NOT NULL
);


ALTER TABLE educacao_biblioteca.exemplar OWNER TO admin_db_sr;

--
-- TOC entry 439 (class 1259 OID 25612)
-- Name: exemplar_id_seq; Type: SEQUENCE; Schema: educacao_biblioteca; Owner: admin_db_sr
--

CREATE SEQUENCE exemplar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educacao_biblioteca.exemplar_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4405 (class 0 OID 0)
-- Dependencies: 439
-- Name: exemplar_id_seq; Type: SEQUENCE OWNED BY; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER SEQUENCE exemplar_id_seq OWNED BY exemplar.id;


--
-- TOC entry 440 (class 1259 OID 25614)
-- Name: literaria; Type: TABLE; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE literaria (
    id bigint NOT NULL,
    resumo character varying NOT NULL
);


ALTER TABLE educacao_biblioteca.literaria OWNER TO admin_db_sr;

--
-- TOC entry 441 (class 1259 OID 25620)
-- Name: literaria_id_seq; Type: SEQUENCE; Schema: educacao_biblioteca; Owner: admin_db_sr
--

CREATE SEQUENCE literaria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educacao_biblioteca.literaria_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4406 (class 0 OID 0)
-- Dependencies: 441
-- Name: literaria_id_seq; Type: SEQUENCE OWNED BY; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER SEQUENCE literaria_id_seq OWNED BY literaria.id;


--
-- TOC entry 442 (class 1259 OID 25622)
-- Name: obra; Type: TABLE; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE obra (
    id bigint NOT NULL,
    editora_id bigint NOT NULL,
    tipo_obra_id bigint NOT NULL,
    autor_principal character varying NOT NULL,
    obra character varying NOT NULL
);


ALTER TABLE educacao_biblioteca.obra OWNER TO admin_db_sr;

--
-- TOC entry 443 (class 1259 OID 25628)
-- Name: obra_autor; Type: TABLE; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE obra_autor (
    id bigint NOT NULL,
    autor_id bigint NOT NULL,
    obra_id bigint NOT NULL,
    reservado character varying
);


ALTER TABLE educacao_biblioteca.obra_autor OWNER TO admin_db_sr;

--
-- TOC entry 444 (class 1259 OID 25634)
-- Name: obra_autor_id_seq; Type: SEQUENCE; Schema: educacao_biblioteca; Owner: admin_db_sr
--

CREATE SEQUENCE obra_autor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educacao_biblioteca.obra_autor_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4407 (class 0 OID 0)
-- Dependencies: 444
-- Name: obra_autor_id_seq; Type: SEQUENCE OWNED BY; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER SEQUENCE obra_autor_id_seq OWNED BY obra_autor.id;


--
-- TOC entry 445 (class 1259 OID 25636)
-- Name: obra_id_seq; Type: SEQUENCE; Schema: educacao_biblioteca; Owner: admin_db_sr
--

CREATE SEQUENCE obra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educacao_biblioteca.obra_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4408 (class 0 OID 0)
-- Dependencies: 445
-- Name: obra_id_seq; Type: SEQUENCE OWNED BY; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER SEQUENCE obra_id_seq OWNED BY obra.id;


--
-- TOC entry 446 (class 1259 OID 25638)
-- Name: prateleira; Type: TABLE; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE prateleira (
    id bigint NOT NULL,
    estante_id bigint NOT NULL,
    prateleira character varying NOT NULL
);


ALTER TABLE educacao_biblioteca.prateleira OWNER TO admin_db_sr;

--
-- TOC entry 447 (class 1259 OID 25644)
-- Name: prateleira_id_seq; Type: SEQUENCE; Schema: educacao_biblioteca; Owner: admin_db_sr
--

CREATE SEQUENCE prateleira_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educacao_biblioteca.prateleira_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4409 (class 0 OID 0)
-- Dependencies: 447
-- Name: prateleira_id_seq; Type: SEQUENCE OWNED BY; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER SEQUENCE prateleira_id_seq OWNED BY prateleira.id;


--
-- TOC entry 448 (class 1259 OID 25646)
-- Name: tipo_obra; Type: TABLE; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE tipo_obra (
    id bigint NOT NULL,
    tipo_obra character varying NOT NULL
);


ALTER TABLE educacao_biblioteca.tipo_obra OWNER TO admin_db_sr;

--
-- TOC entry 449 (class 1259 OID 25652)
-- Name: tipo_obra_id_seq; Type: SEQUENCE; Schema: educacao_biblioteca; Owner: admin_db_sr
--

CREATE SEQUENCE tipo_obra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE educacao_biblioteca.tipo_obra_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4410 (class 0 OID 0)
-- Dependencies: 449
-- Name: tipo_obra_id_seq; Type: SEQUENCE OWNED BY; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER SEQUENCE tipo_obra_id_seq OWNED BY tipo_obra.id;


SET search_path = energia, pg_catalog;

--
-- TOC entry 450 (class 1259 OID 25654)
-- Name: classe_unidade; Type: TABLE; Schema: energia; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE classe_unidade (
    descricao character(100),
    idclasseunidade bigint NOT NULL,
    ativo "char"
);


ALTER TABLE energia.classe_unidade OWNER TO admin_db_sr;

--
-- TOC entry 451 (class 1259 OID 25657)
-- Name: classe_unidade_idclasseunidade_seq; Type: SEQUENCE; Schema: energia; Owner: admin_db_sr
--

CREATE SEQUENCE classe_unidade_idclasseunidade_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energia.classe_unidade_idclasseunidade_seq OWNER TO admin_db_sr;

--
-- TOC entry 4411 (class 0 OID 0)
-- Dependencies: 451
-- Name: classe_unidade_idclasseunidade_seq; Type: SEQUENCE OWNED BY; Schema: energia; Owner: admin_db_sr
--

ALTER SEQUENCE classe_unidade_idclasseunidade_seq OWNED BY classe_unidade.idclasseunidade;


--
-- TOC entry 452 (class 1259 OID 25659)
-- Name: conta; Type: TABLE; Schema: energia; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE conta (
    competencia date,
    taxakwh real,
    consumoativo real,
    outrastaxas real,
    valorfatura real,
    idcontatariva bigint,
    idunidade bigint,
    idconta bigint NOT NULL,
    ativo "char",
    idtaxa bigint
);


ALTER TABLE energia.conta OWNER TO admin_db_sr;

--
-- TOC entry 453 (class 1259 OID 25662)
-- Name: conta_idconta_seq; Type: SEQUENCE; Schema: energia; Owner: admin_db_sr
--

CREATE SEQUENCE conta_idconta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energia.conta_idconta_seq OWNER TO admin_db_sr;

--
-- TOC entry 4412 (class 0 OID 0)
-- Dependencies: 453
-- Name: conta_idconta_seq; Type: SEQUENCE OWNED BY; Schema: energia; Owner: admin_db_sr
--

ALTER SEQUENCE conta_idconta_seq OWNED BY conta.idconta;


--
-- TOC entry 454 (class 1259 OID 25664)
-- Name: contatarifa; Type: TABLE; Schema: energia; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE contatarifa (
    idcontatarifa bigint NOT NULL,
    idconta bigint NOT NULL,
    idtarifa bigint NOT NULL
);


ALTER TABLE energia.contatarifa OWNER TO admin_db_sr;

--
-- TOC entry 455 (class 1259 OID 25667)
-- Name: contatarifa_idcontatarifa_seq; Type: SEQUENCE; Schema: energia; Owner: admin_db_sr
--

CREATE SEQUENCE contatarifa_idcontatarifa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energia.contatarifa_idcontatarifa_seq OWNER TO admin_db_sr;

--
-- TOC entry 4413 (class 0 OID 0)
-- Dependencies: 455
-- Name: contatarifa_idcontatarifa_seq; Type: SEQUENCE OWNED BY; Schema: energia; Owner: admin_db_sr
--

ALTER SEQUENCE contatarifa_idcontatarifa_seq OWNED BY contatarifa.idcontatarifa;


--
-- TOC entry 456 (class 1259 OID 25669)
-- Name: seq_classe_unidade; Type: SEQUENCE; Schema: energia; Owner: admin_db_sr
--

CREATE SEQUENCE seq_classe_unidade
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energia.seq_classe_unidade OWNER TO admin_db_sr;

--
-- TOC entry 457 (class 1259 OID 25671)
-- Name: seq_conta; Type: SEQUENCE; Schema: energia; Owner: admin_db_sr
--

CREATE SEQUENCE seq_conta
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energia.seq_conta OWNER TO admin_db_sr;

--
-- TOC entry 458 (class 1259 OID 25673)
-- Name: seq_tarifa; Type: SEQUENCE; Schema: energia; Owner: admin_db_sr
--

CREATE SEQUENCE seq_tarifa
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energia.seq_tarifa OWNER TO admin_db_sr;

--
-- TOC entry 459 (class 1259 OID 25675)
-- Name: seq_unidade; Type: SEQUENCE; Schema: energia; Owner: admin_db_sr
--

CREATE SEQUENCE seq_unidade
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energia.seq_unidade OWNER TO admin_db_sr;

--
-- TOC entry 460 (class 1259 OID 25677)
-- Name: tarifa; Type: TABLE; Schema: energia; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE tarifa (
    descricao character(100),
    valor numeric,
    idtarifa bigint NOT NULL,
    ativo "char"
);


ALTER TABLE energia.tarifa OWNER TO admin_db_sr;

--
-- TOC entry 461 (class 1259 OID 25683)
-- Name: tarifa_idtarifa_seq; Type: SEQUENCE; Schema: energia; Owner: admin_db_sr
--

CREATE SEQUENCE tarifa_idtarifa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energia.tarifa_idtarifa_seq OWNER TO admin_db_sr;

--
-- TOC entry 4414 (class 0 OID 0)
-- Dependencies: 461
-- Name: tarifa_idtarifa_seq; Type: SEQUENCE OWNED BY; Schema: energia; Owner: admin_db_sr
--

ALTER SEQUENCE tarifa_idtarifa_seq OWNED BY tarifa.idtarifa;


--
-- TOC entry 462 (class 1259 OID 25685)
-- Name: taxa; Type: TABLE; Schema: energia; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE taxa (
    idtaxa bigint NOT NULL,
    descricao character(100),
    valor numeric,
    ativo "char"
);


ALTER TABLE energia.taxa OWNER TO admin_db_sr;

--
-- TOC entry 463 (class 1259 OID 25691)
-- Name: taxa_idtaxa_seq; Type: SEQUENCE; Schema: energia; Owner: admin_db_sr
--

CREATE SEQUENCE taxa_idtaxa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energia.taxa_idtaxa_seq OWNER TO admin_db_sr;

--
-- TOC entry 4415 (class 0 OID 0)
-- Dependencies: 463
-- Name: taxa_idtaxa_seq; Type: SEQUENCE OWNED BY; Schema: energia; Owner: admin_db_sr
--

ALTER SEQUENCE taxa_idtaxa_seq OWNED BY taxa.idtaxa;


--
-- TOC entry 464 (class 1259 OID 25693)
-- Name: unidade; Type: TABLE; Schema: energia; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE unidade (
    nome character(300),
    endereco character(600),
    bairro character(200),
    area character(50),
    numcontrato bigint,
    nummedidor bigint,
    idunidade bigint NOT NULL,
    ativo "char",
    idclasseunidade bigint
);


ALTER TABLE energia.unidade OWNER TO admin_db_sr;

--
-- TOC entry 465 (class 1259 OID 25699)
-- Name: unidade_idunidade_seq; Type: SEQUENCE; Schema: energia; Owner: admin_db_sr
--

CREATE SEQUENCE unidade_idunidade_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE energia.unidade_idunidade_seq OWNER TO admin_db_sr;

--
-- TOC entry 4416 (class 0 OID 0)
-- Dependencies: 465
-- Name: unidade_idunidade_seq; Type: SEQUENCE OWNED BY; Schema: energia; Owner: admin_db_sr
--

ALTER SEQUENCE unidade_idunidade_seq OWNED BY unidade.idunidade;


SET search_path = login, pg_catalog;

--
-- TOC entry 466 (class 1259 OID 25701)
-- Name: grupo; Type: TABLE; Schema: login; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE grupo (
    id bigint NOT NULL,
    descricao character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    master boolean
);


ALTER TABLE login.grupo OWNER TO admin_db_sr;

--
-- TOC entry 467 (class 1259 OID 25707)
-- Name: grupo_id_seq; Type: SEQUENCE; Schema: login; Owner: admin_db_sr
--

CREATE SEQUENCE grupo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE login.grupo_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 468 (class 1259 OID 25709)
-- Name: grupo_usuario; Type: TABLE; Schema: login; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE grupo_usuario (
    id bigint NOT NULL,
    grupo_id bigint NOT NULL,
    usuario_id bigint NOT NULL
);


ALTER TABLE login.grupo_usuario OWNER TO admin_db_sr;

--
-- TOC entry 469 (class 1259 OID 25712)
-- Name: grupo_usuario_id_seq; Type: SEQUENCE; Schema: login; Owner: admin_db_sr
--

CREATE SEQUENCE grupo_usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE login.grupo_usuario_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 470 (class 1259 OID 25714)
-- Name: permissao; Type: TABLE; Schema: login; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE permissao (
    id bigint NOT NULL,
    esquema character varying(255) NOT NULL,
    grupo_id bigint NOT NULL,
    permissao character varying(255) NOT NULL,
    tabela character varying(255) NOT NULL
);


ALTER TABLE login.permissao OWNER TO admin_db_sr;

--
-- TOC entry 471 (class 1259 OID 25720)
-- Name: permissao_id_seq; Type: SEQUENCE; Schema: login; Owner: admin_db_sr
--

CREATE SEQUENCE permissao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE login.permissao_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 472 (class 1259 OID 25722)
-- Name: usuario; Type: TABLE; Schema: login; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE usuario (
    id bigint NOT NULL,
    senha character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    pessoa_id bigint
);


ALTER TABLE login.usuario OWNER TO admin_db_sr;

--
-- TOC entry 473 (class 1259 OID 25728)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: login; Owner: admin_db_sr
--

CREATE SEQUENCE usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE login.usuario_id_seq OWNER TO admin_db_sr;

SET search_path = public, pg_catalog;

--
-- TOC entry 474 (class 1259 OID 25730)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: admin_db_sr
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO admin_db_sr;

--
-- TOC entry 475 (class 1259 OID 25732)
-- Name: layout; Type: TABLE; Schema: public; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE layout (
    id bigint NOT NULL,
    version bigint NOT NULL
);


ALTER TABLE public.layout OWNER TO admin_db_sr;

--
-- TOC entry 476 (class 1259 OID 25735)
-- Name: nota_aluno; Type: TABLE; Schema: public; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE nota_aluno (
    nota_aluno_id_id bigint,
    aluno_id bigint
);


ALTER TABLE public.nota_aluno OWNER TO admin_db_sr;

--
-- TOC entry 477 (class 1259 OID 25738)
-- Name: nota_disciplina_lecionada_por_professor; Type: TABLE; Schema: public; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE nota_disciplina_lecionada_por_professor (
    nota_disciplina_lecionada_por_professor_id_id bigint,
    disciplina_lecionada_por_professor_id bigint
);


ALTER TABLE public.nota_disciplina_lecionada_por_professor OWNER TO admin_db_sr;

--
-- TOC entry 478 (class 1259 OID 25741)
-- Name: nota_turma; Type: TABLE; Schema: public; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE nota_turma (
    nota_turma_id_id bigint,
    turma_id bigint
);


ALTER TABLE public.nota_turma OWNER TO admin_db_sr;

--
-- TOC entry 479 (class 1259 OID 25744)
-- Name: sequence_definition; Type: TABLE; Schema: public; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE sequence_definition (
    id bigint NOT NULL,
    version bigint NOT NULL,
    format character varying(100),
    name character varying(100) NOT NULL,
    tenant_id bigint
);


ALTER TABLE public.sequence_definition OWNER TO admin_db_sr;

--
-- TOC entry 480 (class 1259 OID 25747)
-- Name: sequence_number; Type: TABLE; Schema: public; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE sequence_number (
    id bigint NOT NULL,
    version bigint NOT NULL,
    definition_id bigint NOT NULL,
    sequence_group character varying(40),
    number bigint NOT NULL
);


ALTER TABLE public.sequence_number OWNER TO admin_db_sr;

--
-- TOC entry 481 (class 1259 OID 25750)
-- Name: tabela; Type: TABLE; Schema: public; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE tabela (
    id bigint NOT NULL,
    version bigint NOT NULL,
    permissao character varying(255) NOT NULL,
    schema character varying(255) NOT NULL,
    tabela character varying(255) NOT NULL,
    schema_name character varying(255) NOT NULL
);


ALTER TABLE public.tabela OWNER TO admin_db_sr;

SET search_path = saude_procedimento, pg_catalog;

--
-- TOC entry 482 (class 1259 OID 25756)
-- Name: cbo; Type: TABLE; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE cbo (
    id bigint NOT NULL,
    cbo character varying NOT NULL,
    nome character varying NOT NULL
);


ALTER TABLE saude_procedimento.cbo OWNER TO admin_db_sr;

--
-- TOC entry 483 (class 1259 OID 25762)
-- Name: cbo_id_seq; Type: SEQUENCE; Schema: saude_procedimento; Owner: admin_db_sr
--

CREATE SEQUENCE cbo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE saude_procedimento.cbo_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4417 (class 0 OID 0)
-- Dependencies: 483
-- Name: cbo_id_seq; Type: SEQUENCE OWNED BY; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER SEQUENCE cbo_id_seq OWNED BY cbo.id;


--
-- TOC entry 484 (class 1259 OID 25764)
-- Name: cbo_numero_procedimento; Type: TABLE; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE cbo_numero_procedimento (
    id bigint NOT NULL,
    cbo_id bigint NOT NULL,
    numero_procedimento_id bigint NOT NULL,
    reservado character varying
);


ALTER TABLE saude_procedimento.cbo_numero_procedimento OWNER TO admin_db_sr;

--
-- TOC entry 485 (class 1259 OID 25770)
-- Name: cbo_numero_procedimento_id_seq; Type: SEQUENCE; Schema: saude_procedimento; Owner: admin_db_sr
--

CREATE SEQUENCE cbo_numero_procedimento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE saude_procedimento.cbo_numero_procedimento_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4418 (class 0 OID 0)
-- Dependencies: 485
-- Name: cbo_numero_procedimento_id_seq; Type: SEQUENCE OWNED BY; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER SEQUENCE cbo_numero_procedimento_id_seq OWNED BY cbo_numero_procedimento.id;


--
-- TOC entry 486 (class 1259 OID 25772)
-- Name: executor; Type: TABLE; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE executor (
    id bigint NOT NULL,
    funcionario_id bigint NOT NULL,
    procedimento_id bigint NOT NULL,
    situacao character varying NOT NULL
);


ALTER TABLE saude_procedimento.executor OWNER TO admin_db_sr;

--
-- TOC entry 487 (class 1259 OID 25778)
-- Name: executor_id_seq; Type: SEQUENCE; Schema: saude_procedimento; Owner: admin_db_sr
--

CREATE SEQUENCE executor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE saude_procedimento.executor_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4419 (class 0 OID 0)
-- Dependencies: 487
-- Name: executor_id_seq; Type: SEQUENCE OWNED BY; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER SEQUENCE executor_id_seq OWNED BY executor.id;


--
-- TOC entry 488 (class 1259 OID 25780)
-- Name: forma_de_organizacao; Type: TABLE; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE forma_de_organizacao (
    id bigint NOT NULL,
    sub_grupo_id bigint NOT NULL,
    codigo character varying NOT NULL,
    nome character varying NOT NULL
);


ALTER TABLE saude_procedimento.forma_de_organizacao OWNER TO admin_db_sr;

--
-- TOC entry 489 (class 1259 OID 25786)
-- Name: forma_de_organizacao_id_seq; Type: SEQUENCE; Schema: saude_procedimento; Owner: admin_db_sr
--

CREATE SEQUENCE forma_de_organizacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE saude_procedimento.forma_de_organizacao_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4420 (class 0 OID 0)
-- Dependencies: 489
-- Name: forma_de_organizacao_id_seq; Type: SEQUENCE OWNED BY; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER SEQUENCE forma_de_organizacao_id_seq OWNED BY forma_de_organizacao.id;


--
-- TOC entry 490 (class 1259 OID 25788)
-- Name: grupo; Type: TABLE; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE grupo (
    id bigint NOT NULL,
    codigo character varying NOT NULL,
    nome character varying NOT NULL
);


ALTER TABLE saude_procedimento.grupo OWNER TO admin_db_sr;

--
-- TOC entry 491 (class 1259 OID 25794)
-- Name: grupo_id_seq; Type: SEQUENCE; Schema: saude_procedimento; Owner: admin_db_sr
--

CREATE SEQUENCE grupo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE saude_procedimento.grupo_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4421 (class 0 OID 0)
-- Dependencies: 491
-- Name: grupo_id_seq; Type: SEQUENCE OWNED BY; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER SEQUENCE grupo_id_seq OWNED BY grupo.id;


--
-- TOC entry 492 (class 1259 OID 25796)
-- Name: lugar; Type: TABLE; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE lugar (
    id bigint NOT NULL,
    lugar character varying(200) NOT NULL
);


ALTER TABLE saude_procedimento.lugar OWNER TO admin_db_sr;

--
-- TOC entry 493 (class 1259 OID 25799)
-- Name: lugar_id_seq; Type: SEQUENCE; Schema: saude_procedimento; Owner: admin_db_sr
--

CREATE SEQUENCE lugar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE saude_procedimento.lugar_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4422 (class 0 OID 0)
-- Dependencies: 493
-- Name: lugar_id_seq; Type: SEQUENCE OWNED BY; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER SEQUENCE lugar_id_seq OWNED BY lugar.id;


--
-- TOC entry 494 (class 1259 OID 25801)
-- Name: material_procedimento; Type: TABLE; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE material_procedimento (
    id bigint NOT NULL,
    material_id bigint NOT NULL,
    procedimento_id bigint NOT NULL,
    reservado character varying
);


ALTER TABLE saude_procedimento.material_procedimento OWNER TO admin_db_sr;

--
-- TOC entry 495 (class 1259 OID 25807)
-- Name: material_procedimento_id_seq; Type: SEQUENCE; Schema: saude_procedimento; Owner: admin_db_sr
--

CREATE SEQUENCE material_procedimento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE saude_procedimento.material_procedimento_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4423 (class 0 OID 0)
-- Dependencies: 495
-- Name: material_procedimento_id_seq; Type: SEQUENCE OWNED BY; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER SEQUENCE material_procedimento_id_seq OWNED BY material_procedimento.id;


--
-- TOC entry 496 (class 1259 OID 25809)
-- Name: numero_procedimento; Type: TABLE; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE numero_procedimento (
    id bigint NOT NULL,
    forma_de_organizacao_id bigint NOT NULL,
    codigo character varying NOT NULL,
    nome character varying NOT NULL
);


ALTER TABLE saude_procedimento.numero_procedimento OWNER TO admin_db_sr;

--
-- TOC entry 497 (class 1259 OID 25815)
-- Name: numero_procedimento_id_seq; Type: SEQUENCE; Schema: saude_procedimento; Owner: admin_db_sr
--

CREATE SEQUENCE numero_procedimento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE saude_procedimento.numero_procedimento_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4424 (class 0 OID 0)
-- Dependencies: 497
-- Name: numero_procedimento_id_seq; Type: SEQUENCE OWNED BY; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER SEQUENCE numero_procedimento_id_seq OWNED BY numero_procedimento.id;


--
-- TOC entry 498 (class 1259 OID 25817)
-- Name: procedimento; Type: TABLE; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE procedimento (
    id bigint NOT NULL,
    numero_procedimento_id bigint NOT NULL,
    procedimento_id bigint,
    tipo_procedimento_id bigint NOT NULL,
    data_de_marcacao date NOT NULL,
    data_do_procedimento date,
    descricao character varying NOT NULL,
    status character varying NOT NULL,
    lugar_id bigint NOT NULL
);


ALTER TABLE saude_procedimento.procedimento OWNER TO admin_db_sr;

--
-- TOC entry 499 (class 1259 OID 25823)
-- Name: procedimento_id_seq; Type: SEQUENCE; Schema: saude_procedimento; Owner: admin_db_sr
--

CREATE SEQUENCE procedimento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE saude_procedimento.procedimento_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4425 (class 0 OID 0)
-- Dependencies: 499
-- Name: procedimento_id_seq; Type: SEQUENCE OWNED BY; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER SEQUENCE procedimento_id_seq OWNED BY procedimento.id;


--
-- TOC entry 500 (class 1259 OID 25825)
-- Name: procedimento_paciente; Type: TABLE; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE procedimento_paciente (
    id bigint NOT NULL,
    paciente_id bigint NOT NULL,
    procedimento_id bigint NOT NULL,
    reservado character varying
);


ALTER TABLE saude_procedimento.procedimento_paciente OWNER TO admin_db_sr;

--
-- TOC entry 501 (class 1259 OID 25831)
-- Name: procedimento_paciente_id_seq; Type: SEQUENCE; Schema: saude_procedimento; Owner: admin_db_sr
--

CREATE SEQUENCE procedimento_paciente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE saude_procedimento.procedimento_paciente_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4426 (class 0 OID 0)
-- Dependencies: 501
-- Name: procedimento_paciente_id_seq; Type: SEQUENCE OWNED BY; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER SEQUENCE procedimento_paciente_id_seq OWNED BY procedimento_paciente.id;


--
-- TOC entry 502 (class 1259 OID 25833)
-- Name: sub_grupo; Type: TABLE; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE sub_grupo (
    id bigint NOT NULL,
    grupo_id bigint NOT NULL,
    codigo character varying NOT NULL,
    nome character varying NOT NULL
);


ALTER TABLE saude_procedimento.sub_grupo OWNER TO admin_db_sr;

--
-- TOC entry 503 (class 1259 OID 25839)
-- Name: sub_grupo_id_seq; Type: SEQUENCE; Schema: saude_procedimento; Owner: admin_db_sr
--

CREATE SEQUENCE sub_grupo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE saude_procedimento.sub_grupo_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4427 (class 0 OID 0)
-- Dependencies: 503
-- Name: sub_grupo_id_seq; Type: SEQUENCE OWNED BY; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER SEQUENCE sub_grupo_id_seq OWNED BY sub_grupo.id;


--
-- TOC entry 504 (class 1259 OID 25841)
-- Name: tipo_procedimento; Type: TABLE; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

CREATE TABLE tipo_procedimento (
    id bigint NOT NULL,
    tipo_procedimento character varying NOT NULL
);


ALTER TABLE saude_procedimento.tipo_procedimento OWNER TO admin_db_sr;

--
-- TOC entry 505 (class 1259 OID 25847)
-- Name: tipo_procedimento_id_seq; Type: SEQUENCE; Schema: saude_procedimento; Owner: admin_db_sr
--

CREATE SEQUENCE tipo_procedimento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE saude_procedimento.tipo_procedimento_id_seq OWNER TO admin_db_sr;

--
-- TOC entry 4428 (class 0 OID 0)
-- Dependencies: 505
-- Name: tipo_procedimento_id_seq; Type: SEQUENCE OWNED BY; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER SEQUENCE tipo_procedimento_id_seq OWNED BY tipo_procedimento.id;


SET search_path = administracao_organizacao, pg_catalog;

--
-- TOC entry 2904 (class 2604 OID 25849)
-- Name: id; Type: DEFAULT; Schema: administracao_organizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY assessoria ALTER COLUMN id SET DEFAULT nextval('assessoria_id_seq'::regclass);


--
-- TOC entry 2905 (class 2604 OID 25850)
-- Name: id; Type: DEFAULT; Schema: administracao_organizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY cargo ALTER COLUMN id SET DEFAULT nextval('cargo_id_seq'::regclass);


--
-- TOC entry 2906 (class 2604 OID 25851)
-- Name: id; Type: DEFAULT; Schema: administracao_organizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY celula ALTER COLUMN id SET DEFAULT nextval('celula_id_seq'::regclass);


--
-- TOC entry 2907 (class 2604 OID 25852)
-- Name: id; Type: DEFAULT; Schema: administracao_organizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY lotacao ALTER COLUMN id SET DEFAULT nextval('lotacao_id_seq'::regclass);


--
-- TOC entry 2908 (class 2604 OID 25853)
-- Name: id; Type: DEFAULT; Schema: administracao_organizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY organismo ALTER COLUMN id SET DEFAULT nextval('organismo_id_seq'::regclass);


SET search_path = cadastro_unico_almoxarifado, pg_catalog;

--
-- TOC entry 2909 (class 2604 OID 25854)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY almoxarifado ALTER COLUMN id SET DEFAULT nextval('almoxarifado_id_seq'::regclass);


--
-- TOC entry 2910 (class 2604 OID 25855)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY almoxarifado_lote ALTER COLUMN id SET DEFAULT nextval('almoxarifado_lote_id_seq'::regclass);


--
-- TOC entry 2911 (class 2604 OID 25856)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY composicao ALTER COLUMN id SET DEFAULT nextval('composicao_id_seq'::regclass);


--
-- TOC entry 2912 (class 2604 OID 25857)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY forma_farmaceutica ALTER COLUMN id SET DEFAULT nextval('forma_farmaceutica_id_seq'::regclass);


--
-- TOC entry 2913 (class 2604 OID 25858)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY forma_farmaceutica_medicamento ALTER COLUMN id SET DEFAULT nextval('forma_farmaceutica_medicamento_id_seq'::regclass);


--
-- TOC entry 2914 (class 2604 OID 25859)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY foto_material ALTER COLUMN id SET DEFAULT nextval('foto_material_id_seq'::regclass);


--
-- TOC entry 2915 (class 2604 OID 25860)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY lote_material ALTER COLUMN id SET DEFAULT nextval('lote_material_id_seq'::regclass);


--
-- TOC entry 2916 (class 2604 OID 25861)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY lote_medicamento ALTER COLUMN id SET DEFAULT nextval('lote_medicamento_id_seq'::regclass);


--
-- TOC entry 2917 (class 2604 OID 25862)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY material ALTER COLUMN id SET DEFAULT nextval('material_id_seq'::regclass);


--
-- TOC entry 2918 (class 2604 OID 25863)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY medicamento ALTER COLUMN id SET DEFAULT nextval('medicamento_id_seq'::regclass);


--
-- TOC entry 2919 (class 2604 OID 25864)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY principio_ativo ALTER COLUMN id SET DEFAULT nextval('principio_ativo_id_seq'::regclass);


--
-- TOC entry 2920 (class 2604 OID 25865)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY principio_ativo_medicamento ALTER COLUMN id SET DEFAULT nextval('principio_ativo_medicamento_id_seq'::regclass);


--
-- TOC entry 2921 (class 2604 OID 25866)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY remessa ALTER COLUMN id SET DEFAULT nextval('remessa_id_seq'::regclass);


--
-- TOC entry 2922 (class 2604 OID 25867)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY remessa_medicamento ALTER COLUMN id SET DEFAULT nextval('remessa_medicamento_id_seq'::regclass);


--
-- TOC entry 2923 (class 2604 OID 25868)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY substancia ALTER COLUMN id SET DEFAULT nextval('substancia_id_seq'::regclass);


--
-- TOC entry 2924 (class 2604 OID 25869)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY tipo_material ALTER COLUMN id SET DEFAULT nextval('tipo_material_id_seq'::regclass);


--
-- TOC entry 2925 (class 2604 OID 25870)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY tipo_principio_ativo ALTER COLUMN id SET DEFAULT nextval('tipo_principio_ativo_id_seq'::regclass);


--
-- TOC entry 2926 (class 2604 OID 25871)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY unidade_de_saude ALTER COLUMN id SET DEFAULT nextval('unidade_de_saude_id_seq'::regclass);


SET search_path = cadastro_unico_atendimento, pg_catalog;

--
-- TOC entry 2927 (class 2604 OID 25872)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

ALTER TABLE ONLY atendimento ALTER COLUMN id SET DEFAULT nextval('atendimento_id_seq'::regclass);


--
-- TOC entry 2928 (class 2604 OID 25873)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

ALTER TABLE ONLY balcao ALTER COLUMN id SET DEFAULT nextval('balcao_id_seq'::regclass);


--
-- TOC entry 2929 (class 2604 OID 25874)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

ALTER TABLE ONLY fila ALTER COLUMN id SET DEFAULT nextval('fila_id_seq'::regclass);


--
-- TOC entry 2930 (class 2604 OID 25875)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

ALTER TABLE ONLY lotacao_balconista ALTER COLUMN id SET DEFAULT nextval('lotacao_balconista_id_seq'::regclass);


--
-- TOC entry 2931 (class 2604 OID 25876)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

ALTER TABLE ONLY lotacao_gerente ALTER COLUMN id SET DEFAULT nextval('lotacao_gerente_id_seq'::regclass);


--
-- TOC entry 2932 (class 2604 OID 25877)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

ALTER TABLE ONLY ticket ALTER COLUMN id SET DEFAULT nextval('ticket_id_seq'::regclass);


--
-- TOC entry 2933 (class 2604 OID 25878)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

ALTER TABLE ONLY tipo_ticket ALTER COLUMN id SET DEFAULT nextval('tipo_ticket_id_seq'::regclass);


SET search_path = cadastro_unico_infraestrutura_basica, pg_catalog;

--
-- TOC entry 2934 (class 2604 OID 25879)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER TABLE ONLY arborizacao ALTER COLUMN id SET DEFAULT nextval('arborizacao_id_seq'::regclass);


--
-- TOC entry 2935 (class 2604 OID 25880)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER TABLE ONLY coleta_de_lixo ALTER COLUMN id SET DEFAULT nextval('coleta_de_lixo_id_seq'::regclass);


--
-- TOC entry 2936 (class 2604 OID 25881)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER TABLE ONLY galeria_pluvial ALTER COLUMN id SET DEFAULT nextval('galeria_pluvial_id_seq'::regclass);


--
-- TOC entry 2937 (class 2604 OID 25882)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER TABLE ONLY guias_sargetas ALTER COLUMN id SET DEFAULT nextval('guias_sargetas_id_seq'::regclass);


--
-- TOC entry 2938 (class 2604 OID 25883)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER TABLE ONLY iluminacao ALTER COLUMN id SET DEFAULT nextval('iluminacao_id_seq'::regclass);


--
-- TOC entry 2939 (class 2604 OID 25884)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER TABLE ONLY infra_estrutura ALTER COLUMN id SET DEFAULT nextval('infra_estrutura_id_seq'::regclass);


--
-- TOC entry 2940 (class 2604 OID 25885)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER TABLE ONLY limpeza ALTER COLUMN id SET DEFAULT nextval('limpeza_id_seq'::regclass);


--
-- TOC entry 2941 (class 2604 OID 25886)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER TABLE ONLY pavimentacao ALTER COLUMN id SET DEFAULT nextval('pavimentacao_id_seq'::regclass);


--
-- TOC entry 2942 (class 2604 OID 25887)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER TABLE ONLY rede_de_agua ALTER COLUMN id SET DEFAULT nextval('rede_de_agua_id_seq'::regclass);


--
-- TOC entry 2943 (class 2604 OID 25888)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER TABLE ONLY rede_de_esgoto ALTER COLUMN id SET DEFAULT nextval('rede_de_esgoto_id_seq'::regclass);


--
-- TOC entry 2944 (class 2604 OID 25889)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER TABLE ONLY rede_de_telefone ALTER COLUMN id SET DEFAULT nextval('rede_de_telefone_id_seq'::regclass);


SET search_path = cadastro_unico_localizacao, pg_catalog;

--
-- TOC entry 2945 (class 2604 OID 25890)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY bairro ALTER COLUMN id SET DEFAULT nextval('bairro_id_seq'::regclass);


--
-- TOC entry 2946 (class 2604 OID 25891)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY comercial ALTER COLUMN id SET DEFAULT nextval('comercial_id_seq'::regclass);


--
-- TOC entry 2947 (class 2604 OID 25892)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY cruzamento ALTER COLUMN id SET DEFAULT nextval('cruzamento_id_seq'::regclass);


--
-- TOC entry 2948 (class 2604 OID 25893)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY distrito ALTER COLUMN id SET DEFAULT nextval('distrito_id_seq'::regclass);


--
-- TOC entry 2949 (class 2604 OID 25894)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY divisao_administrativa ALTER COLUMN id SET DEFAULT nextval('divisao_administrativa_id_seq'::regclass);


--
-- TOC entry 2950 (class 2604 OID 25895)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY estado ALTER COLUMN id SET DEFAULT nextval('estado_id_seq'::regclass);


--
-- TOC entry 2951 (class 2604 OID 25896)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY face_da_quadra ALTER COLUMN id SET DEFAULT nextval('face_da_quadra_id_seq'::regclass);


--
-- TOC entry 2952 (class 2604 OID 25897)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY foto_lote ALTER COLUMN id SET DEFAULT nextval('foto_lote_id_seq'::regclass);


--
-- TOC entry 2953 (class 2604 OID 25898)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY foto_unidade_edificada ALTER COLUMN id SET DEFAULT nextval('foto_unidade_edificada_id_seq'::regclass);


--
-- TOC entry 2954 (class 2604 OID 25899)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY industrial ALTER COLUMN id SET DEFAULT nextval('industrial_id_seq'::regclass);


--
-- TOC entry 2955 (class 2604 OID 25900)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY logradouro ALTER COLUMN id SET DEFAULT nextval('logradouro_id_seq'::regclass);


--
-- TOC entry 2956 (class 2604 OID 25901)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY lote ALTER COLUMN id SET DEFAULT nextval('lote_id_seq'::regclass);


--
-- TOC entry 2957 (class 2604 OID 25902)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY municipio ALTER COLUMN id SET DEFAULT nextval('municipio_id_seq'::regclass);


--
-- TOC entry 2958 (class 2604 OID 25903)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY quadra ALTER COLUMN id SET DEFAULT nextval('quadra_id_seq'::regclass);


--
-- TOC entry 2959 (class 2604 OID 25904)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY residencial ALTER COLUMN id SET DEFAULT nextval('residencial_id_seq'::regclass);


--
-- TOC entry 2960 (class 2604 OID 25905)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY setor ALTER COLUMN id SET DEFAULT nextval('setor_id_seq'::regclass);


--
-- TOC entry 2961 (class 2604 OID 25906)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY testada ALTER COLUMN id SET DEFAULT nextval('testada_id_seq'::regclass);


--
-- TOC entry 2962 (class 2604 OID 25907)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY tipo_logradouro ALTER COLUMN id SET DEFAULT nextval('tipo_logradouro_id_seq'::regclass);


--
-- TOC entry 2963 (class 2604 OID 25908)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY trecho_de_logradouro ALTER COLUMN id SET DEFAULT nextval('trecho_de_logradouro_id_seq'::regclass);


--
-- TOC entry 2964 (class 2604 OID 25909)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY unidade_edificada ALTER COLUMN id SET DEFAULT nextval('unidade_edificada_id_seq'::regclass);


SET search_path = cadastro_unico_patrimonio, pg_catalog;

--
-- TOC entry 2965 (class 2604 OID 25910)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY abastecimento ALTER COLUMN id SET DEFAULT nextval('abastecimento_id_seq'::regclass);


--
-- TOC entry 2966 (class 2604 OID 25911)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY ambulancia ALTER COLUMN id SET DEFAULT nextval('ambulancia_id_seq'::regclass);


--
-- TOC entry 2967 (class 2604 OID 25912)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY bem ALTER COLUMN id SET DEFAULT nextval('bem_id_seq'::regclass);


--
-- TOC entry 2968 (class 2604 OID 25913)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY caminhao ALTER COLUMN id SET DEFAULT nextval('caminhao_id_seq'::regclass);


--
-- TOC entry 2969 (class 2604 OID 25914)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY carro ALTER COLUMN id SET DEFAULT nextval('carro_id_seq'::regclass);


--
-- TOC entry 2970 (class 2604 OID 25915)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY garagem ALTER COLUMN id SET DEFAULT nextval('garagem_id_seq'::regclass);


--
-- TOC entry 2971 (class 2604 OID 25916)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY locacao ALTER COLUMN id SET DEFAULT nextval('locacao_id_seq'::regclass);


--
-- TOC entry 2972 (class 2604 OID 25917)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY lotacao ALTER COLUMN id SET DEFAULT nextval('lotacao_id_seq'::regclass);


--
-- TOC entry 2973 (class 2604 OID 25918)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY manutencao ALTER COLUMN id SET DEFAULT nextval('manutencao_id_seq'::regclass);


--
-- TOC entry 2974 (class 2604 OID 25919)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY moto ALTER COLUMN id SET DEFAULT nextval('moto_id_seq'::regclass);


--
-- TOC entry 2975 (class 2604 OID 25920)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY multas ALTER COLUMN id SET DEFAULT nextval('multas_id_seq'::regclass);


--
-- TOC entry 2976 (class 2604 OID 25921)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY onibus ALTER COLUMN id SET DEFAULT nextval('onibus_id_seq'::regclass);


--
-- TOC entry 2977 (class 2604 OID 25922)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY propriedade_de ALTER COLUMN id SET DEFAULT nextval('propriedade_de_id_seq'::regclass);


--
-- TOC entry 2978 (class 2604 OID 25923)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY servico ALTER COLUMN id SET DEFAULT nextval('servico_id_seq'::regclass);


--
-- TOC entry 2979 (class 2604 OID 25924)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY trator ALTER COLUMN id SET DEFAULT nextval('trator_id_seq'::regclass);


--
-- TOC entry 2980 (class 2604 OID 25925)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY uso ALTER COLUMN id SET DEFAULT nextval('uso_id_seq'::regclass);


--
-- TOC entry 2981 (class 2604 OID 25926)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY veiculo ALTER COLUMN id SET DEFAULT nextval('veiculo_id_seq'::regclass);


SET search_path = cadastro_unico_pessoal, pg_catalog;

--
-- TOC entry 2982 (class 2604 OID 25927)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY aditivo ALTER COLUMN id SET DEFAULT nextval('aditivo_id_seq'::regclass);


--
-- TOC entry 2983 (class 2604 OID 25928)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY aluno ALTER COLUMN id SET DEFAULT nextval('aluno_id_seq'::regclass);


--
-- TOC entry 2984 (class 2604 OID 25929)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY cidadao ALTER COLUMN id SET DEFAULT nextval('cidadao_id_seq'::regclass);


--
-- TOC entry 2985 (class 2604 OID 25930)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY contato ALTER COLUMN id SET DEFAULT nextval('contato_id_seq'::regclass);


--
-- TOC entry 2986 (class 2604 OID 25931)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY contrato ALTER COLUMN id SET DEFAULT nextval('contrato_id_seq'::regclass);


--
-- TOC entry 2987 (class 2604 OID 25932)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY dados_bancarios ALTER COLUMN id SET DEFAULT nextval('dados_bancarios_id_seq'::regclass);


--
-- TOC entry 2988 (class 2604 OID 25933)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY detem_propriedade ALTER COLUMN id SET DEFAULT nextval('detem_propriedade_id_seq'::regclass);


--
-- TOC entry 2989 (class 2604 OID 25934)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY editora ALTER COLUMN id SET DEFAULT nextval('editora_id_seq'::regclass);


--
-- TOC entry 2990 (class 2604 OID 25935)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY escola ALTER COLUMN id SET DEFAULT nextval('escola_id_seq'::regclass);


--
-- TOC entry 2991 (class 2604 OID 25936)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY funcionario ALTER COLUMN id SET DEFAULT nextval('funcionario_id_seq'::regclass);


--
-- TOC entry 2992 (class 2604 OID 25937)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY motorista ALTER COLUMN id SET DEFAULT nextval('motorista_id_seq'::regclass);


--
-- TOC entry 2993 (class 2604 OID 25938)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY paciente ALTER COLUMN id SET DEFAULT nextval('paciente_id_seq'::regclass);


--
-- TOC entry 2994 (class 2604 OID 25939)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY parentesco ALTER COLUMN id SET DEFAULT nextval('parentesco_id_seq'::regclass);


--
-- TOC entry 2996 (class 2604 OID 25940)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY pessoa ALTER COLUMN id SET DEFAULT nextval('pessoa_id_seq'::regclass);


--
-- TOC entry 2997 (class 2604 OID 25941)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY pessoa_fisica ALTER COLUMN id SET DEFAULT nextval('pessoa_fisica_id_seq'::regclass);


--
-- TOC entry 2998 (class 2604 OID 25942)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY pessoa_juridica ALTER COLUMN id SET DEFAULT nextval('pessoa_juridica_id_seq'::regclass);


--
-- TOC entry 2999 (class 2604 OID 25943)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY prefeitura ALTER COLUMN id SET DEFAULT nextval('prefeitura_id_seq'::regclass);


--
-- TOC entry 3000 (class 2604 OID 25944)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY professor ALTER COLUMN id SET DEFAULT nextval('professor_id_seq'::regclass);


--
-- TOC entry 3001 (class 2604 OID 25945)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY reside ALTER COLUMN id SET DEFAULT nextval('reside_id_seq'::regclass);


--
-- TOC entry 3002 (class 2604 OID 25946)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY tipo_contato ALTER COLUMN id SET DEFAULT nextval('tipo_contato_id_seq'::regclass);


SET search_path = cadastro_unico_protocolo, pg_catalog;

--
-- TOC entry 3003 (class 2604 OID 25947)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_protocolo; Owner: admin_db_sr
--

ALTER TABLE ONLY item ALTER COLUMN id SET DEFAULT nextval('item_id_seq'::regclass);


--
-- TOC entry 3004 (class 2604 OID 25948)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_protocolo; Owner: admin_db_sr
--

ALTER TABLE ONLY lote_item ALTER COLUMN id SET DEFAULT nextval('lote_item_id_seq'::regclass);


--
-- TOC entry 3005 (class 2604 OID 25949)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_protocolo; Owner: admin_db_sr
--

ALTER TABLE ONLY movimentacao ALTER COLUMN id SET DEFAULT nextval('movimentacao_id_seq'::regclass);


--
-- TOC entry 3006 (class 2604 OID 25950)
-- Name: id; Type: DEFAULT; Schema: cadastro_unico_protocolo; Owner: admin_db_sr
--

ALTER TABLE ONLY tratamento ALTER COLUMN id SET DEFAULT nextval('tratamento_id_seq'::regclass);


SET search_path = controle_de_acesso_a_dado, pg_catalog;

--
-- TOC entry 3007 (class 2604 OID 25951)
-- Name: id; Type: DEFAULT; Schema: controle_de_acesso_a_dado; Owner: admin_db_sr
--

ALTER TABLE ONLY mapa_de_acesso ALTER COLUMN id SET DEFAULT nextval('mapa_de_acesso_id_seq'::regclass);


SET search_path = educacao_academico, pg_catalog;

--
-- TOC entry 3008 (class 2604 OID 25952)
-- Name: id; Type: DEFAULT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY conteudo_da_disciplina ALTER COLUMN id SET DEFAULT nextval('conteudo_da_disciplina_id_seq'::regclass);


--
-- TOC entry 3009 (class 2604 OID 25953)
-- Name: id; Type: DEFAULT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY disciplina ALTER COLUMN id SET DEFAULT nextval('disciplina_id_seq'::regclass);


--
-- TOC entry 3010 (class 2604 OID 25954)
-- Name: id; Type: DEFAULT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY disciplina_lecionada_por_professor ALTER COLUMN id SET DEFAULT nextval('disciplina_lecionada_por_professor_id_seq'::regclass);


--
-- TOC entry 3011 (class 2604 OID 25955)
-- Name: id; Type: DEFAULT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY horario ALTER COLUMN id SET DEFAULT nextval('horario_id_seq'::regclass);


--
-- TOC entry 3013 (class 2604 OID 25956)
-- Name: id; Type: DEFAULT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY matricula ALTER COLUMN id SET DEFAULT nextval('matricula_id_seq'::regclass);


--
-- TOC entry 3014 (class 2604 OID 25957)
-- Name: id; Type: DEFAULT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY nota ALTER COLUMN id SET DEFAULT nextval('nota_id_seq'::regclass);


--
-- TOC entry 3015 (class 2604 OID 25958)
-- Name: id; Type: DEFAULT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY sala ALTER COLUMN id SET DEFAULT nextval('sala_id_seq'::regclass);


--
-- TOC entry 3016 (class 2604 OID 25959)
-- Name: id; Type: DEFAULT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY serie ALTER COLUMN id SET DEFAULT nextval('serie_id_seq'::regclass);


--
-- TOC entry 3018 (class 2604 OID 25960)
-- Name: id; Type: DEFAULT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY turma ALTER COLUMN id SET DEFAULT nextval('turma_id_seq'::regclass);


--
-- TOC entry 3019 (class 2604 OID 25961)
-- Name: id; Type: DEFAULT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY turma_disciplina ALTER COLUMN id SET DEFAULT nextval('turma_disciplina_id_seq'::regclass);


SET search_path = educacao_biblioteca, pg_catalog;

--
-- TOC entry 3020 (class 2604 OID 25962)
-- Name: id; Type: DEFAULT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY acervo ALTER COLUMN id SET DEFAULT nextval('acervo_id_seq'::regclass);


--
-- TOC entry 3021 (class 2604 OID 25963)
-- Name: id; Type: DEFAULT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY autor ALTER COLUMN id SET DEFAULT nextval('autor_id_seq'::regclass);


--
-- TOC entry 3022 (class 2604 OID 25964)
-- Name: id; Type: DEFAULT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY conteudo ALTER COLUMN id SET DEFAULT nextval('conteudo_id_seq'::regclass);


--
-- TOC entry 3023 (class 2604 OID 25965)
-- Name: id; Type: DEFAULT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY conteudo_didatica ALTER COLUMN id SET DEFAULT nextval('conteudo_didatica_id_seq'::regclass);


--
-- TOC entry 3024 (class 2604 OID 25966)
-- Name: id; Type: DEFAULT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY didatica ALTER COLUMN id SET DEFAULT nextval('didatica_id_seq'::regclass);


--
-- TOC entry 3025 (class 2604 OID 25967)
-- Name: id; Type: DEFAULT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY edicao ALTER COLUMN id SET DEFAULT nextval('edicao_id_seq'::regclass);


--
-- TOC entry 3026 (class 2604 OID 25968)
-- Name: id; Type: DEFAULT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY emprestimo ALTER COLUMN id SET DEFAULT nextval('emprestimo_id_seq'::regclass);


--
-- TOC entry 3027 (class 2604 OID 25969)
-- Name: id; Type: DEFAULT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY estante ALTER COLUMN id SET DEFAULT nextval('estante_id_seq'::regclass);


--
-- TOC entry 3028 (class 2604 OID 25970)
-- Name: id; Type: DEFAULT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY exemplar ALTER COLUMN id SET DEFAULT nextval('exemplar_id_seq'::regclass);


--
-- TOC entry 3029 (class 2604 OID 25971)
-- Name: id; Type: DEFAULT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY literaria ALTER COLUMN id SET DEFAULT nextval('literaria_id_seq'::regclass);


--
-- TOC entry 3030 (class 2604 OID 25972)
-- Name: id; Type: DEFAULT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY obra ALTER COLUMN id SET DEFAULT nextval('obra_id_seq'::regclass);


--
-- TOC entry 3031 (class 2604 OID 25973)
-- Name: id; Type: DEFAULT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY obra_autor ALTER COLUMN id SET DEFAULT nextval('obra_autor_id_seq'::regclass);


--
-- TOC entry 3032 (class 2604 OID 25974)
-- Name: id; Type: DEFAULT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY prateleira ALTER COLUMN id SET DEFAULT nextval('prateleira_id_seq'::regclass);


--
-- TOC entry 3033 (class 2604 OID 25975)
-- Name: id; Type: DEFAULT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY tipo_obra ALTER COLUMN id SET DEFAULT nextval('tipo_obra_id_seq'::regclass);


SET search_path = energia, pg_catalog;

--
-- TOC entry 3034 (class 2604 OID 25976)
-- Name: idclasseunidade; Type: DEFAULT; Schema: energia; Owner: admin_db_sr
--

ALTER TABLE ONLY classe_unidade ALTER COLUMN idclasseunidade SET DEFAULT nextval('classe_unidade_idclasseunidade_seq'::regclass);


--
-- TOC entry 3035 (class 2604 OID 25977)
-- Name: idconta; Type: DEFAULT; Schema: energia; Owner: admin_db_sr
--

ALTER TABLE ONLY conta ALTER COLUMN idconta SET DEFAULT nextval('conta_idconta_seq'::regclass);


--
-- TOC entry 3036 (class 2604 OID 25978)
-- Name: idcontatarifa; Type: DEFAULT; Schema: energia; Owner: admin_db_sr
--

ALTER TABLE ONLY contatarifa ALTER COLUMN idcontatarifa SET DEFAULT nextval('contatarifa_idcontatarifa_seq'::regclass);


--
-- TOC entry 3037 (class 2604 OID 25979)
-- Name: idtarifa; Type: DEFAULT; Schema: energia; Owner: admin_db_sr
--

ALTER TABLE ONLY tarifa ALTER COLUMN idtarifa SET DEFAULT nextval('tarifa_idtarifa_seq'::regclass);


--
-- TOC entry 3038 (class 2604 OID 25980)
-- Name: idtaxa; Type: DEFAULT; Schema: energia; Owner: admin_db_sr
--

ALTER TABLE ONLY taxa ALTER COLUMN idtaxa SET DEFAULT nextval('taxa_idtaxa_seq'::regclass);


--
-- TOC entry 3039 (class 2604 OID 25981)
-- Name: idunidade; Type: DEFAULT; Schema: energia; Owner: admin_db_sr
--

ALTER TABLE ONLY unidade ALTER COLUMN idunidade SET DEFAULT nextval('unidade_idunidade_seq'::regclass);


SET search_path = saude_procedimento, pg_catalog;

--
-- TOC entry 3040 (class 2604 OID 25982)
-- Name: id; Type: DEFAULT; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER TABLE ONLY cbo ALTER COLUMN id SET DEFAULT nextval('cbo_id_seq'::regclass);


--
-- TOC entry 3041 (class 2604 OID 25983)
-- Name: id; Type: DEFAULT; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER TABLE ONLY cbo_numero_procedimento ALTER COLUMN id SET DEFAULT nextval('cbo_numero_procedimento_id_seq'::regclass);


--
-- TOC entry 3042 (class 2604 OID 25984)
-- Name: id; Type: DEFAULT; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER TABLE ONLY executor ALTER COLUMN id SET DEFAULT nextval('executor_id_seq'::regclass);


--
-- TOC entry 3043 (class 2604 OID 25985)
-- Name: id; Type: DEFAULT; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER TABLE ONLY forma_de_organizacao ALTER COLUMN id SET DEFAULT nextval('forma_de_organizacao_id_seq'::regclass);


--
-- TOC entry 3044 (class 2604 OID 25986)
-- Name: id; Type: DEFAULT; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER TABLE ONLY grupo ALTER COLUMN id SET DEFAULT nextval('grupo_id_seq'::regclass);


--
-- TOC entry 3045 (class 2604 OID 25987)
-- Name: id; Type: DEFAULT; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER TABLE ONLY lugar ALTER COLUMN id SET DEFAULT nextval('lugar_id_seq'::regclass);


--
-- TOC entry 3046 (class 2604 OID 25988)
-- Name: id; Type: DEFAULT; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER TABLE ONLY material_procedimento ALTER COLUMN id SET DEFAULT nextval('material_procedimento_id_seq'::regclass);


--
-- TOC entry 3047 (class 2604 OID 25989)
-- Name: id; Type: DEFAULT; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER TABLE ONLY numero_procedimento ALTER COLUMN id SET DEFAULT nextval('numero_procedimento_id_seq'::regclass);


--
-- TOC entry 3048 (class 2604 OID 25990)
-- Name: id; Type: DEFAULT; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER TABLE ONLY procedimento ALTER COLUMN id SET DEFAULT nextval('procedimento_id_seq'::regclass);


--
-- TOC entry 3049 (class 2604 OID 25991)
-- Name: id; Type: DEFAULT; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER TABLE ONLY procedimento_paciente ALTER COLUMN id SET DEFAULT nextval('procedimento_paciente_id_seq'::regclass);


--
-- TOC entry 3050 (class 2604 OID 25992)
-- Name: id; Type: DEFAULT; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER TABLE ONLY sub_grupo ALTER COLUMN id SET DEFAULT nextval('sub_grupo_id_seq'::regclass);


--
-- TOC entry 3051 (class 2604 OID 25993)
-- Name: id; Type: DEFAULT; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER TABLE ONLY tipo_procedimento ALTER COLUMN id SET DEFAULT nextval('tipo_procedimento_id_seq'::regclass);


SET search_path = administracao_organizacao, pg_catalog;

--
-- TOC entry 3940 (class 0 OID 24597)
-- Dependencies: 176
-- Data for Name: assessoria; Type: TABLE DATA; Schema: administracao_organizacao; Owner: admin_db_sr
--

COPY assessoria (id, organismo_id, assessoria, contato_telefonico) FROM stdin;
\.


--
-- TOC entry 4429 (class 0 OID 0)
-- Dependencies: 177
-- Name: assessoria_id_seq; Type: SEQUENCE SET; Schema: administracao_organizacao; Owner: admin_db_sr
--

SELECT pg_catalog.setval('assessoria_id_seq', 1, false);


--
-- TOC entry 3942 (class 0 OID 24605)
-- Dependencies: 178
-- Data for Name: cargo; Type: TABLE DATA; Schema: administracao_organizacao; Owner: admin_db_sr
--

COPY cargo (id, celula_id, cargo, moeda_salario) FROM stdin;
1	1	ASG	111111
2	1	PROFESSOR	222222
3	1	PROFESSOR PI G	223333
9	1	ESTAGIARIO	0
10	1	PORTEIRO	0
13	1	MERENDEIRA	0
14	1	DIRETOR(A)	0
17	1	VICE-DIRETOR(A)	0
18	1	VIGIA	0
19	1	COORDENADOR PEDAGIGICO	0
20	1	COORDENADOR DISCIPLINAR	0
21	1	SECRETARIO(A)	0
22	1	BIBLIOTECARIO	0
23	1	ASSISTENTE ADMINISTRATIVO 	0
29	1	SUPERVISAO	0
\.


--
-- TOC entry 4430 (class 0 OID 0)
-- Dependencies: 179
-- Name: cargo_id_seq; Type: SEQUENCE SET; Schema: administracao_organizacao; Owner: admin_db_sr
--

SELECT pg_catalog.setval('cargo_id_seq', 29, true);


--
-- TOC entry 3944 (class 0 OID 24613)
-- Dependencies: 180
-- Data for Name: celula; Type: TABLE DATA; Schema: administracao_organizacao; Owner: admin_db_sr
--

COPY celula (id, organismo_id, celula, contato_telefonico) FROM stdin;
1	1	pmsga	1111
\.


--
-- TOC entry 4431 (class 0 OID 0)
-- Dependencies: 181
-- Name: celula_id_seq; Type: SEQUENCE SET; Schema: administracao_organizacao; Owner: admin_db_sr
--

SELECT pg_catalog.setval('celula_id_seq', 2, true);


--
-- TOC entry 3946 (class 0 OID 24621)
-- Dependencies: 182
-- Data for Name: lotacao; Type: TABLE DATA; Schema: administracao_organizacao; Owner: admin_db_sr
--

COPY lotacao (id, cargo_id, funcionario_id, data_inicio, data_termino, situacao, funcao, vinculo, turno) FROM stdin;
11	1	3262	2015-07-14	2015-07-14	Ativo	lololo	EFETIVO	MTN
12	1	3263	2015-07-14	2015-07-14	Ativo	ytytyt	EFETIVO	T
13	1	3264	2015-07-14	2015-07-14	Ativo	popopo	EFETIVO	N
16	2	3269	2015-07-15	2015-07-15	Ativo	encanador	TERCEIRIZADO	MN
10	1	3260	2015-07-14	2015-07-14	Ativo	rrrrrrr	COMISSIONADO	MT
15	2	2305	2015-07-15	2015-07-15	ATIVO	TESTE	EFETIVO	MTN
17	18	3358	2015-07-23	2015-07-23	Ativo	marinheiro	EFETIVO	MN
18	29	3359	2015-07-23	2015-07-23	Ativo	programador	EFETIVO	MN
\.


--
-- TOC entry 4432 (class 0 OID 0)
-- Dependencies: 183
-- Name: lotacao_id_seq; Type: SEQUENCE SET; Schema: administracao_organizacao; Owner: admin_db_sr
--

SELECT pg_catalog.setval('lotacao_id_seq', 18, true);


--
-- TOC entry 3948 (class 0 OID 24629)
-- Dependencies: 184
-- Data for Name: organismo; Type: TABLE DATA; Schema: administracao_organizacao; Owner: admin_db_sr
--

COPY organismo (id, prefeitura_id, contato_telefonico, organismo) FROM stdin;
1	7	11111111	pmsga
\.


--
-- TOC entry 4433 (class 0 OID 0)
-- Dependencies: 185
-- Name: organismo_id_seq; Type: SEQUENCE SET; Schema: administracao_organizacao; Owner: admin_db_sr
--

SELECT pg_catalog.setval('organismo_id_seq', 21, true);


SET search_path = administracao_registro, pg_catalog;

--
-- TOC entry 4270 (class 0 OID 30674)
-- Dependencies: 506
-- Data for Name: log; Type: TABLE DATA; Schema: administracao_registro; Owner: admin_db_sr
--

COPY log (tabela, observacao, usuario_id, tipo, id) FROM stdin;
Sala	Teste de observação	2	Select	1
Sala	Teste de observação	2	Select	2
Sala	Teste de observação 01	2	Select	3
Sala	Teste de observação 01	2	Select	4
\.


--
-- TOC entry 4434 (class 0 OID 0)
-- Dependencies: 507
-- Name: log_id_seq; Type: SEQUENCE SET; Schema: administracao_registro; Owner: admin_db_sr
--

SELECT pg_catalog.setval('log_id_seq', 4, true);


SET search_path = cadastro_unico_almoxarifado, pg_catalog;

--
-- TOC entry 3950 (class 0 OID 24637)
-- Dependencies: 186
-- Data for Name: almoxarifado; Type: TABLE DATA; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

COPY almoxarifado (id, organismo_id, almoxarifado, almoxarifado_central) FROM stdin;
\.


--
-- TOC entry 4435 (class 0 OID 0)
-- Dependencies: 187
-- Name: almoxarifado_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

SELECT pg_catalog.setval('almoxarifado_id_seq', 1, false);


--
-- TOC entry 3952 (class 0 OID 24645)
-- Dependencies: 188
-- Data for Name: almoxarifado_lote; Type: TABLE DATA; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

COPY almoxarifado_lote (id, quantidade_disponivel, lote_material_id, almoxarifado_id) FROM stdin;
\.


--
-- TOC entry 4436 (class 0 OID 0)
-- Dependencies: 189
-- Name: almoxarifado_lote_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

SELECT pg_catalog.setval('almoxarifado_lote_id_seq', 1, false);


--
-- TOC entry 3954 (class 0 OID 24650)
-- Dependencies: 190
-- Data for Name: composicao; Type: TABLE DATA; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

COPY composicao (id, medicamento_id, substancia_id, reservado) FROM stdin;
\.


--
-- TOC entry 4437 (class 0 OID 0)
-- Dependencies: 191
-- Name: composicao_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

SELECT pg_catalog.setval('composicao_id_seq', 1, false);


--
-- TOC entry 3956 (class 0 OID 24658)
-- Dependencies: 192
-- Data for Name: forma_farmaceutica; Type: TABLE DATA; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

COPY forma_farmaceutica (id, forma) FROM stdin;
\.


--
-- TOC entry 4438 (class 0 OID 0)
-- Dependencies: 193
-- Name: forma_farmaceutica_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

SELECT pg_catalog.setval('forma_farmaceutica_id_seq', 1, false);


--
-- TOC entry 3958 (class 0 OID 24663)
-- Dependencies: 194
-- Data for Name: forma_farmaceutica_medicamento; Type: TABLE DATA; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

COPY forma_farmaceutica_medicamento (id, reservado, forma_farmaceutica_id, medicamento_id) FROM stdin;
\.


--
-- TOC entry 4439 (class 0 OID 0)
-- Dependencies: 195
-- Name: forma_farmaceutica_medicamento_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

SELECT pg_catalog.setval('forma_farmaceutica_medicamento_id_seq', 1, false);


--
-- TOC entry 3960 (class 0 OID 24668)
-- Dependencies: 196
-- Data for Name: foto_material; Type: TABLE DATA; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

COPY foto_material (id, material_id, foto_material) FROM stdin;
\.


--
-- TOC entry 4440 (class 0 OID 0)
-- Dependencies: 197
-- Name: foto_material_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

SELECT pg_catalog.setval('foto_material_id_seq', 1, false);


--
-- TOC entry 3962 (class 0 OID 24676)
-- Dependencies: 198
-- Data for Name: lote_material; Type: TABLE DATA; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

COPY lote_material (id, fabricante_id, fornecedor_id, data_de_fabricacao, data_de_validade, lote_material, quantidade, material_id, nota_fiscal, codigo_de_barra, data_recebimento, moeda_valor_unitario) FROM stdin;
\.


--
-- TOC entry 4441 (class 0 OID 0)
-- Dependencies: 199
-- Name: lote_material_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

SELECT pg_catalog.setval('lote_material_id_seq', 1, false);


--
-- TOC entry 3964 (class 0 OID 24684)
-- Dependencies: 200
-- Data for Name: lote_medicamento; Type: TABLE DATA; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

COPY lote_medicamento (reservado, id, ordem_de_adiantamento) FROM stdin;
\.


--
-- TOC entry 4442 (class 0 OID 0)
-- Dependencies: 201
-- Name: lote_medicamento_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

SELECT pg_catalog.setval('lote_medicamento_id_seq', 1, false);


--
-- TOC entry 3966 (class 0 OID 24692)
-- Dependencies: 202
-- Data for Name: material; Type: TABLE DATA; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

COPY material (id, tipo_material_id, descricao_material, nome) FROM stdin;
\.


--
-- TOC entry 4443 (class 0 OID 0)
-- Dependencies: 203
-- Name: material_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

SELECT pg_catalog.setval('material_id_seq', 1, false);


--
-- TOC entry 3968 (class 0 OID 24700)
-- Dependencies: 204
-- Data for Name: medicamento; Type: TABLE DATA; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

COPY medicamento (id, reservado) FROM stdin;
\.


--
-- TOC entry 4444 (class 0 OID 0)
-- Dependencies: 205
-- Name: medicamento_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

SELECT pg_catalog.setval('medicamento_id_seq', 1, false);


--
-- TOC entry 3970 (class 0 OID 24708)
-- Dependencies: 206
-- Data for Name: principio_ativo; Type: TABLE DATA; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

COPY principio_ativo (id, principio, quantidade_minima, quantidade_ideal, quantidade_maxima, tipo_principio_ativo_id, descricao_principio_ativo) FROM stdin;
\.


--
-- TOC entry 4445 (class 0 OID 0)
-- Dependencies: 207
-- Name: principio_ativo_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

SELECT pg_catalog.setval('principio_ativo_id_seq', 1, false);


--
-- TOC entry 3972 (class 0 OID 24716)
-- Dependencies: 208
-- Data for Name: principio_ativo_medicamento; Type: TABLE DATA; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

COPY principio_ativo_medicamento (id, principio_ativo_id, medicamento_id, reservado) FROM stdin;
\.


--
-- TOC entry 4446 (class 0 OID 0)
-- Dependencies: 209
-- Name: principio_ativo_medicamento_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

SELECT pg_catalog.setval('principio_ativo_medicamento_id_seq', 1, false);


--
-- TOC entry 3974 (class 0 OID 24721)
-- Dependencies: 210
-- Data for Name: remessa; Type: TABLE DATA; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

COPY remessa (id, almoxarifado_origem_id, cidadao_id, lote_material_id, data_de_entrega, quantidade, situacao, almoxarifado_destino_id, funcionario_id) FROM stdin;
\.


--
-- TOC entry 4447 (class 0 OID 0)
-- Dependencies: 211
-- Name: remessa_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

SELECT pg_catalog.setval('remessa_id_seq', 1, false);


--
-- TOC entry 3976 (class 0 OID 24729)
-- Dependencies: 212
-- Data for Name: remessa_medicamento; Type: TABLE DATA; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

COPY remessa_medicamento (id, reservado) FROM stdin;
\.


--
-- TOC entry 4448 (class 0 OID 0)
-- Dependencies: 213
-- Name: remessa_medicamento_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

SELECT pg_catalog.setval('remessa_medicamento_id_seq', 1, false);


--
-- TOC entry 3978 (class 0 OID 24737)
-- Dependencies: 214
-- Data for Name: substancia; Type: TABLE DATA; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

COPY substancia (id, substancia) FROM stdin;
\.


--
-- TOC entry 4449 (class 0 OID 0)
-- Dependencies: 215
-- Name: substancia_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

SELECT pg_catalog.setval('substancia_id_seq', 1, false);


--
-- TOC entry 3980 (class 0 OID 24745)
-- Dependencies: 216
-- Data for Name: tipo_material; Type: TABLE DATA; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

COPY tipo_material (id, tipo_material) FROM stdin;
\.


--
-- TOC entry 4450 (class 0 OID 0)
-- Dependencies: 217
-- Name: tipo_material_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

SELECT pg_catalog.setval('tipo_material_id_seq', 1, false);


--
-- TOC entry 3982 (class 0 OID 24753)
-- Dependencies: 218
-- Data for Name: tipo_principio_ativo; Type: TABLE DATA; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

COPY tipo_principio_ativo (id, tipo_principio_ativo) FROM stdin;
\.


--
-- TOC entry 4451 (class 0 OID 0)
-- Dependencies: 219
-- Name: tipo_principio_ativo_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

SELECT pg_catalog.setval('tipo_principio_ativo_id_seq', 1, false);


--
-- TOC entry 3984 (class 0 OID 24761)
-- Dependencies: 220
-- Data for Name: unidade_de_saude; Type: TABLE DATA; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

COPY unidade_de_saude (id, reservado, latitude, longitude) FROM stdin;
\.


--
-- TOC entry 4452 (class 0 OID 0)
-- Dependencies: 221
-- Name: unidade_de_saude_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

SELECT pg_catalog.setval('unidade_de_saude_id_seq', 1, false);


SET search_path = cadastro_unico_atendimento, pg_catalog;

--
-- TOC entry 3986 (class 0 OID 24769)
-- Dependencies: 222
-- Data for Name: atendimento; Type: TABLE DATA; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

COPY atendimento (id, balcao_id, ticket_id, data, detalhamento, situacao) FROM stdin;
\.


--
-- TOC entry 4453 (class 0 OID 0)
-- Dependencies: 223
-- Name: atendimento_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

SELECT pg_catalog.setval('atendimento_id_seq', 1, false);


--
-- TOC entry 3988 (class 0 OID 24777)
-- Dependencies: 224
-- Data for Name: balcao; Type: TABLE DATA; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

COPY balcao (id, fila_id, identificacao) FROM stdin;
\.


--
-- TOC entry 4454 (class 0 OID 0)
-- Dependencies: 225
-- Name: balcao_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

SELECT pg_catalog.setval('balcao_id_seq', 1, false);


--
-- TOC entry 3990 (class 0 OID 24785)
-- Dependencies: 226
-- Data for Name: fila; Type: TABLE DATA; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

COPY fila (id, assunto) FROM stdin;
\.


--
-- TOC entry 4455 (class 0 OID 0)
-- Dependencies: 227
-- Name: fila_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

SELECT pg_catalog.setval('fila_id_seq', 1, false);


--
-- TOC entry 3992 (class 0 OID 24793)
-- Dependencies: 228
-- Data for Name: lotacao_balconista; Type: TABLE DATA; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

COPY lotacao_balconista (id, balcao_id, funcionario_id, data, situacao) FROM stdin;
\.


--
-- TOC entry 4456 (class 0 OID 0)
-- Dependencies: 229
-- Name: lotacao_balconista_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

SELECT pg_catalog.setval('lotacao_balconista_id_seq', 1, false);


--
-- TOC entry 3994 (class 0 OID 24801)
-- Dependencies: 230
-- Data for Name: lotacao_gerente; Type: TABLE DATA; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

COPY lotacao_gerente (id, fila_id, funcionario_id, data, situacao) FROM stdin;
\.


--
-- TOC entry 4457 (class 0 OID 0)
-- Dependencies: 231
-- Name: lotacao_gerente_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

SELECT pg_catalog.setval('lotacao_gerente_id_seq', 1, false);


--
-- TOC entry 3996 (class 0 OID 24809)
-- Dependencies: 232
-- Data for Name: ticket; Type: TABLE DATA; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

COPY ticket (id, cidadao_id, tipo_ticket_id, data, identificador, situacao) FROM stdin;
\.


--
-- TOC entry 4458 (class 0 OID 0)
-- Dependencies: 233
-- Name: ticket_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

SELECT pg_catalog.setval('ticket_id_seq', 1, false);


--
-- TOC entry 3998 (class 0 OID 24817)
-- Dependencies: 234
-- Data for Name: tipo_ticket; Type: TABLE DATA; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

COPY tipo_ticket (id, tipo_ticket) FROM stdin;
\.


--
-- TOC entry 4459 (class 0 OID 0)
-- Dependencies: 235
-- Name: tipo_ticket_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

SELECT pg_catalog.setval('tipo_ticket_id_seq', 1, false);


SET search_path = cadastro_unico_infraestrutura_basica, pg_catalog;

--
-- TOC entry 4000 (class 0 OID 24825)
-- Dependencies: 236
-- Data for Name: arborizacao; Type: TABLE DATA; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

COPY arborizacao (id, possui, tipo_arborizacao) FROM stdin;
\.


--
-- TOC entry 4460 (class 0 OID 0)
-- Dependencies: 237
-- Name: arborizacao_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

SELECT pg_catalog.setval('arborizacao_id_seq', 1, false);


--
-- TOC entry 4002 (class 0 OID 24833)
-- Dependencies: 238
-- Data for Name: coleta_de_lixo; Type: TABLE DATA; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

COPY coleta_de_lixo (id, frequencia, possui, seletiva) FROM stdin;
\.


--
-- TOC entry 4461 (class 0 OID 0)
-- Dependencies: 239
-- Name: coleta_de_lixo_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

SELECT pg_catalog.setval('coleta_de_lixo_id_seq', 1, false);


--
-- TOC entry 4004 (class 0 OID 24841)
-- Dependencies: 240
-- Data for Name: galeria_pluvial; Type: TABLE DATA; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

COPY galeria_pluvial (id, possui) FROM stdin;
\.


--
-- TOC entry 4462 (class 0 OID 0)
-- Dependencies: 241
-- Name: galeria_pluvial_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

SELECT pg_catalog.setval('galeria_pluvial_id_seq', 1, false);


--
-- TOC entry 4006 (class 0 OID 24849)
-- Dependencies: 242
-- Data for Name: guias_sargetas; Type: TABLE DATA; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

COPY guias_sargetas (id, possui) FROM stdin;
\.


--
-- TOC entry 4463 (class 0 OID 0)
-- Dependencies: 243
-- Name: guias_sargetas_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

SELECT pg_catalog.setval('guias_sargetas_id_seq', 1, false);


--
-- TOC entry 4008 (class 0 OID 24857)
-- Dependencies: 244
-- Data for Name: iluminacao; Type: TABLE DATA; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

COPY iluminacao (id, possui) FROM stdin;
\.


--
-- TOC entry 4464 (class 0 OID 0)
-- Dependencies: 245
-- Name: iluminacao_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

SELECT pg_catalog.setval('iluminacao_id_seq', 1, false);


--
-- TOC entry 4010 (class 0 OID 24865)
-- Dependencies: 246
-- Data for Name: infra_estrutura; Type: TABLE DATA; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

COPY infra_estrutura (id, arborizacao_id, coleta_de_lixo_id, galeria_pluvial_id, guias_sargetas_id, iluminacao_id, limpeza_id, pavimentacao_id, rede_de_agua_id, rede_de_esgoto_id, rede_de_telefone_id, trecho_de_logradouro_id, reservado) FROM stdin;
\.


--
-- TOC entry 4465 (class 0 OID 0)
-- Dependencies: 247
-- Name: infra_estrutura_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

SELECT pg_catalog.setval('infra_estrutura_id_seq', 1, false);


--
-- TOC entry 4012 (class 0 OID 24873)
-- Dependencies: 248
-- Data for Name: limpeza; Type: TABLE DATA; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

COPY limpeza (id, frequencia, possui) FROM stdin;
\.


--
-- TOC entry 4466 (class 0 OID 0)
-- Dependencies: 249
-- Name: limpeza_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

SELECT pg_catalog.setval('limpeza_id_seq', 1, false);


--
-- TOC entry 4014 (class 0 OID 24881)
-- Dependencies: 250
-- Data for Name: pavimentacao; Type: TABLE DATA; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

COPY pavimentacao (id, possui, tipo_pavimentacao) FROM stdin;
\.


--
-- TOC entry 4467 (class 0 OID 0)
-- Dependencies: 251
-- Name: pavimentacao_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

SELECT pg_catalog.setval('pavimentacao_id_seq', 1, false);


--
-- TOC entry 4016 (class 0 OID 24889)
-- Dependencies: 252
-- Data for Name: rede_de_agua; Type: TABLE DATA; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

COPY rede_de_agua (id, possui, tratada) FROM stdin;
\.


--
-- TOC entry 4468 (class 0 OID 0)
-- Dependencies: 253
-- Name: rede_de_agua_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

SELECT pg_catalog.setval('rede_de_agua_id_seq', 1, false);


--
-- TOC entry 4018 (class 0 OID 24897)
-- Dependencies: 254
-- Data for Name: rede_de_esgoto; Type: TABLE DATA; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

COPY rede_de_esgoto (id, possui) FROM stdin;
\.


--
-- TOC entry 4469 (class 0 OID 0)
-- Dependencies: 255
-- Name: rede_de_esgoto_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

SELECT pg_catalog.setval('rede_de_esgoto_id_seq', 1, false);


--
-- TOC entry 4020 (class 0 OID 24905)
-- Dependencies: 256
-- Data for Name: rede_de_telefone; Type: TABLE DATA; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

COPY rede_de_telefone (id, possui) FROM stdin;
\.


--
-- TOC entry 4470 (class 0 OID 0)
-- Dependencies: 257
-- Name: rede_de_telefone_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

SELECT pg_catalog.setval('rede_de_telefone_id_seq', 1, false);


SET search_path = cadastro_unico_localizacao, pg_catalog;

--
-- TOC entry 4022 (class 0 OID 24913)
-- Dependencies: 258
-- Data for Name: bairro; Type: TABLE DATA; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

COPY bairro (id, bairro, municipio_id) FROM stdin;
7	MASSARANDUBA	1
10	GUANDUBA	1
110	FELIPE CAMARAO	1
13	NOVA ZELANDIA	1
14	NEBRASCA	1
16	GUAJIRU	1
18	REGOMOLEIRO	1
112	CAMPO VERDE BOULEVARD	1
19	BELA VISTA	1
20	MAR BELA	1
22	GOLANDIM	1
23	NOVO AMARANTE	1
25	JARDIM LOLA	1
26	AMARANTE	1
27	PROLAR	1
28	CIDADE DAS ROSAS	1
31	DISTRITO INDUSTRIAL	1
32	PASSAGEM DA VILA	1
33	REGOMOLEIRO III	1
34	REGOMOLEIRO II	1
35	NOVO HORIZONTE	1
36	BARREIROS	1
37	PAU FERRO	1
38	FAZENDA ASTURIAS	1
40	JACOBINA	1
41	LAGOA SECA	1
42	ESTRADA DE GUANDUBA	1
43	ARISCO	1
44	RIACHO DO CUNHARI	1
45	MILHARADA	1
46	MUVUCA	1
48	PEDRINHAS	1
51	SOMBRA	1
54	COQUEIROS	1
55	TRIGUERO	1
57	OITEROS	1
113	LOTEAMENTO ESPLANADA II	1
58	JACOBI	1
59	BARRO DURO	1
61	LADEIRA GRANDE	1
63	RIO DA PRATA	1
64	IGREJA NOVA	1
65	UTINGA	1
67	SERRINHA	1
68	RIACHO DO MEIO	1
70	FAZENDA CATAMBOEIRA	1
71	FAZENDA NOVO ORIZONTE	1
72	FAZENDA GUARAVES	1
73	FAZENDA CALZIRAS	1
75	FAZENDA DINAMARCA	1
77	CAMPOS VERDES	1
79	PLAZA GARDEM	1
81	JENIPABU	1
107	LOTEAMENTO ESPLANADA I	1
80	PEDRO AMERICA	1
5	SAMBURA	1
8	PADRE JOAO MARIA	1
21	NOVO SANTO ANTONIO	1
15	CANAA	1
115	OLHO DAGUA DE BAIXO	1
29	JARDIM PETROPOLIS	1
30	POCO DE PEDRA	1
39	JACARE MIRIM	1
49	URUACU DE CIMA	1
50	URUACU	1
116	LOTEAMENTO VILA SAO JORGE	1
53	JACARAU	1
52	URUACU DE BAIXO	1
56	PAJUCARA	1
47	BOSQUE DAS LETICIAS	1
62	ALAGADICO GRANDE	1
69	FAZENDA SAO PEDRO	1
60	CHA DO MORENO	1
78	OLHO DAGUA DO CARRILHO	1
83	CARNAUBINA	1
84	JACAREPAGUA	1
85	CALIFORNIA	1
86	NOVO SAO GONCALO	1
87	SANTOS DUMONT	1
88	SANTO ANTONIO DO POTENGI	1
89	OLHO DAGUA DO CHAPEU	1
17	SITIO PICA PAU	1
92	LAGOA AZUL	1
95	LOTEAMENTO SAO DOMINGOS	1
97	LOTEAMENTO CAPINHACU	1
98	LOTEAMENTO NEBRASKA	1
99	CONJUNTO RESIDENCIAL MORADA ESPACO ABERTO	1
100	LOTEAMENTO SANTA LUZIA	1
102	LOTEAMENTO LISBOA	1
103	LOTEAMENTO PARQUE DAS CERAMICAS	1
101	CIDADE DAS FLORES	1
105	PLAZA GARDEN	1
106	LOTEAMENTO ALMEIDAO	1
117	CONJUNTO ALAMEDA	1
118	CONJUNTO PROLAR	1
119	CONJUNTO IPE	1
120	CONJUNTO MONTE LIBANO	1
121	LOTEAMENTO PARQUE DOS SONHOS	1
122	LOTEAMENTO SOL NASCENTE	1
123	LOTEAMENTO PARQUE DOS EUCALIPTOS	1
124	LOTEAMENTO RESIDENCIAL PARQUE DOS COQUEIROS	1
125	JARDIM LEBLON	1
126	LOTEAMENTO JARDIM BELO HORIZONTE	1
127	LOTEAMENTO GIZELDA CAMARA	1
128	LOTEAMENTO JARDIM REDENCAO	1
129	LOTEAMENTO NOVO JARDIM REDENCAO I	1
130	LOTEAMENTO NOVO JARDIM REDENCAO II	1
132	LOTEAMENTO PARQUE INDUSTRIAL	1
131	LOTEAMENTO PATAMAR I	1
133	LOTEAMENTO CAMPO BELO	1
134	LOTEAMENTO PATAMAR II	1
135	LOTEAMENTO BOA VISTA I	1
136	LOTEAMENTO BOA VISTA II	1
137	LOTEAMENTO VEGA	1
138	LOTEAMENTO BOA VISTA III	1
139	LOTEAMENTO JARDIM	1
140	LOTEAMENTO JARDIM BRASIL	1
141	NOVA ZELANDIA II	1
142	LOTEAMENTO JARDIM FRANCESA	1
143	LOTEAMENTO SAO PEDRO	1
144	LOTEAMENTO GANCHO	1
145	LOTEAMENTO MANOEL BEZERRA	1
146	LOTEAMENTO PLANALTO	1
147	LOTEAMENTO VILA PARAISO	1
148	LOTEAMENTO JOAO ANGELO DA FONSECA	1
149	LOTEAMENTO MILENIO	1
151	LOTEAMENTO HORIZONTE	1
152	LOTEAMENTO SAO FRANCISCO III	1
153	LOTEAMENTO SAO CARLOS	1
155	LOTEAMENTO ALTO DE SAO GONCALO	1
96	LOTEAMENTO SAO FRANCISCO I	1
156	LOTEAMENTO ALTO DAS COLINAS	1
157	CENTRO	1
158	LOTEAMENTO SANTA TEREZINHA I	1
159	LOTEAMENTO SANTA TEREZINHA II	1
160	LOTEAMENTO SANTA TEREZINHA III	1
161	LOTEAMENTO NOVA ALVORADA	1
162	LOTEAMENTO PARQUE IGARACU	1
163	LOTEAMENTO RECANTO	1
164	LOTEAMENTO PARQUE DAS ROSAS	1
165	LOTEAMENTO ENCANTO	1
166	LOTEAMENTO NOVA MARBELLA	1
167	DIX SEPT ROSADO	1
168	VILA PARAISO	1
169	SAO GONÇALO DO AMARANTE	1
171	NOVO SAO GONCALO	1
172	NOVA MARBELA	1
173	OLHO DAGUA DOS LUCAS	1
174	NAO IDENTIFICADO	1
175	JARDINS	1
177	NOVA NATAL	1
178	LOTEAMENTO JOANA MARQUES	1
180	OITEIROS	1
179	NOVO MILENIO	1
181	BRASIL	1
188	CANA BRAVA	1
202	JARDIM PETROPOLIS	1
204	EMAUS	1
170	NOSSA SENHORA DA APRESENTACAO	3
176	CIDADE DO SOL	3
183	IGAPO	3
182	SANTAREM	3
184	LAGOA NOVA	3
186	NOVA PARNAMIRIM	3
187	CENTRO	3
189	ALECRIM	3
190	CIDADE DA ESPERANCA	3
191	POTENGI	3
192	CANDELARIA	3
193	VALE DOURADO	3
194	PARQUE DAS NACOES	3
195	QUINTAS	3
197	PLANALTO	3
196	BAIRRO NORDESTE	3
198	TIROL	3
199	REDINHA	3
200	PAJUCARA	3
201	SATELITE	3
203	PONTA NEGRA	3
\.


--
-- TOC entry 4471 (class 0 OID 0)
-- Dependencies: 259
-- Name: bairro_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

SELECT pg_catalog.setval('bairro_id_seq', 1, true);


--
-- TOC entry 4024 (class 0 OID 24921)
-- Dependencies: 260
-- Data for Name: comercial; Type: TABLE DATA; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

COPY comercial (id, reservado) FROM stdin;
\.


--
-- TOC entry 4472 (class 0 OID 0)
-- Dependencies: 261
-- Name: comercial_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

SELECT pg_catalog.setval('comercial_id_seq', 1, false);


--
-- TOC entry 4026 (class 0 OID 24929)
-- Dependencies: 262
-- Data for Name: cruzamento; Type: TABLE DATA; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

COPY cruzamento (id, intersecao_dois_id, intersecao_um_id, identificacao) FROM stdin;
\.


--
-- TOC entry 4473 (class 0 OID 0)
-- Dependencies: 263
-- Name: cruzamento_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

SELECT pg_catalog.setval('cruzamento_id_seq', 1, false);


--
-- TOC entry 4028 (class 0 OID 24937)
-- Dependencies: 264
-- Data for Name: distrito; Type: TABLE DATA; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

COPY distrito (id, distrito) FROM stdin;
\.


--
-- TOC entry 4474 (class 0 OID 0)
-- Dependencies: 265
-- Name: distrito_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

SELECT pg_catalog.setval('distrito_id_seq', 1, false);


--
-- TOC entry 4475 (class 0 OID 0)
-- Dependencies: 266
-- Name: divisao_admininstrativa_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

SELECT pg_catalog.setval('divisao_admininstrativa_id_seq', 1, false);


--
-- TOC entry 4031 (class 0 OID 24947)
-- Dependencies: 267
-- Data for Name: divisao_administrativa; Type: TABLE DATA; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

COPY divisao_administrativa (id, municipio_id, nome) FROM stdin;
108	1	URBANO
3	1	URBANO
4	1	URBANO
6	1	URBANO
7	1	URBANO
109	1	URBANO
10	1	URBANO
110	1	URBANO
111	1	URBANO
12	1	URBANO
13	1	URBANO
14	1	URBANO
16	1	URBANO
18	1	URBANO
112	1	URBANO
19	1	URBANO
20	1	URBANO
22	1	URBANO
23	1	URBANO
25	1	URBANO
26	1	URBANO
27	1	URBANO
28	1	URBANO
31	1	URBANO
32	1	URBANO
33	1	URBANO
34	1	URBANO
35	1	URBANO
36	1	URBANO
37	1	URBANO
38	1	URBANO
40	1	URBANO
41	1	URBANO
42	1	URBANO
43	1	URBANO
44	1	URBANO
45	1	URBANO
46	1	URBANO
48	1	URBANO
51	1	URBANO
54	1	URBANO
55	1	URBANO
57	1	URBANO
113	1	URBANO
58	1	URBANO
59	1	URBANO
61	1	URBANO
63	1	URBANO
64	1	URBANO
65	1	URBANO
66	1	URBANO
67	1	URBANO
68	1	URBANO
70	1	URBANO
71	1	URBANO
72	1	URBANO
73	1	URBANO
74	1	URBANO
75	1	URBANO
76	1	URBANO
77	1	URBANO
79	1	URBANO
81	1	URBANO
107	1	URBANO
80	1	URBANO
5	1	URBANO
8	1	URBANO
11	1	URBANO
9	1	URBANO
21	1	URBANO
15	1	URBANO
114	1	URBANO
24	1	URBANO
29	1	URBANO
30	1	URBANO
39	1	URBANO
49	1	URBANO
50	1	URBANO
115	1	URBANO
53	1	URBANO
52	1	URBANO
56	1	URBANO
47	1	URBANO
62	1	URBANO
69	1	URBANO
60	1	URBANO
78	1	URBANO
2	1	URBANO
82	1	URBANO
83	1	URBANO
84	1	URBANO
85	1	URBANO
86	1	URBANO
87	1	URBANO
88	1	URBANO
89	1	URBANO
90	1	URBANO
91	1	URBANO
17	1	URBANO
92	1	URBANO
93	3	URBANO
94	3	URBANO
95	1	URBANO
97	1	URBANO
98	1	URBANO
99	1	URBANO
100	1	URBANO
102	1	URBANO
103	1	URBANO
101	1	URBANO
104	1	URBANO
105	1	URBANO
106	1	URBANO
116	1	URBANO
117	1	URBANO
118	1	URBANO
119	1	URBANO
120	1	URBANO
121	1	URBANO
122	1	URBANO
123	1	URBANO
124	1	URBANO
125	1	URBANO
126	1	URBANO
127	1	URBANO
128	1	URBANO
129	1	URBANO
130	1	URBANO
132	1	URBANO
131	1	URBANO
133	1	URBANO
134	1	URBANO
135	1	URBANO
136	1	URBANO
137	1	URBANO
138	1	URBANO
139	1	URBANO
140	1	URBANO
141	1	URBANO
142	1	URBANO
143	1	URBANO
144	1	URBANO
145	1	URBANO
146	1	URBANO
147	1	URBANO
148	1	URBANO
149	1	URBANO
150	1	URBANO
151	1	URBANO
152	1	URBANO
153	1	URBANO
154	1	URBANO
155	1	URBANO
156	1	URBANO
157	1	URBANO
158	1	URBANO
159	1	URBANO
96	1	URBANO
160	1	URBANO
161	1	URBANO
162	1	URBANO
163	1	URBANO
164	1	URBANO
165	1	URBANO
166	1	URBANO
167	3	URBANO
168	3	URBANO
169	1	URBANO
170	3	URBANO
171	1	URBANO
172	1	URBANO
173	1	URBANA
174	1	URBANO
175	1	URBANO
176	3	URBANO
177	3	URBANO
178	1	URBANO
180	1	URBANO
179	1	URBANO
181	1	URBANA
182	3	URBANO
183	3	URBANA
184	3	URBANO
185	3	URBANO
186	4	URBANO
187	3	URBANO
188	5	URBANO
189	3	URBANO
190	3	URBANO
191	3	URBANO
192	3	URBANO
193	3	URBANO
194	4	URBANO
195	3	URBANO
196	3	URBANO
197	3	URBANO
198	3	URBANO
199	3	URBANO
200	3	URBANO
201	3	URBANO
202	7	URBANO
203	3	URBANO
204	4	URBANO
\.


--
-- TOC entry 4476 (class 0 OID 0)
-- Dependencies: 268
-- Name: divisao_administrativa_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

SELECT pg_catalog.setval('divisao_administrativa_id_seq', 204, true);


--
-- TOC entry 4033 (class 0 OID 24955)
-- Dependencies: 269
-- Data for Name: estado; Type: TABLE DATA; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

COPY estado (id, abreviacao, estado) FROM stdin;
1	RN	RIO GRANDE DO NORTE
2	RE	RE
\.


--
-- TOC entry 4477 (class 0 OID 0)
-- Dependencies: 270
-- Name: estado_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

SELECT pg_catalog.setval('estado_id_seq', 2, true);


--
-- TOC entry 4035 (class 0 OID 24963)
-- Dependencies: 271
-- Data for Name: estado_municipio; Type: TABLE DATA; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

COPY estado_municipio (estado_municipio_id, municipio_id) FROM stdin;
\.


--
-- TOC entry 4036 (class 0 OID 24966)
-- Dependencies: 272
-- Data for Name: face_da_quadra; Type: TABLE DATA; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

COPY face_da_quadra (id, quadra_id, face_da_quadra) FROM stdin;
\.


--
-- TOC entry 4478 (class 0 OID 0)
-- Dependencies: 273
-- Name: face_da_quadra_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

SELECT pg_catalog.setval('face_da_quadra_id_seq', 1, false);


--
-- TOC entry 4038 (class 0 OID 24974)
-- Dependencies: 274
-- Data for Name: foto_lote; Type: TABLE DATA; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

COPY foto_lote (id, lote_id, foto) FROM stdin;
\.


--
-- TOC entry 4479 (class 0 OID 0)
-- Dependencies: 275
-- Name: foto_lote_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

SELECT pg_catalog.setval('foto_lote_id_seq', 1, false);


--
-- TOC entry 4040 (class 0 OID 24982)
-- Dependencies: 276
-- Data for Name: foto_unidade_edificada; Type: TABLE DATA; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

COPY foto_unidade_edificada (id, unidade_edificada_id, foto) FROM stdin;
\.


--
-- TOC entry 4480 (class 0 OID 0)
-- Dependencies: 277
-- Name: foto_unidade_edificada_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

SELECT pg_catalog.setval('foto_unidade_edificada_id_seq', 1, false);


--
-- TOC entry 4042 (class 0 OID 24990)
-- Dependencies: 278
-- Data for Name: industrial; Type: TABLE DATA; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

COPY industrial (id, reservado) FROM stdin;
\.


--
-- TOC entry 4481 (class 0 OID 0)
-- Dependencies: 279
-- Name: industrial_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

SELECT pg_catalog.setval('industrial_id_seq', 1, false);


--
-- TOC entry 4044 (class 0 OID 24998)
-- Dependencies: 280
-- Data for Name: logradouro; Type: TABLE DATA; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

COPY logradouro (id, tipo_logradouro_id, logradouro) FROM stdin;
30	3	OLINTO JOSE RODRIGUES
2	3	JOSEFA MARIANO
3	3	VEREADOR AILDO MENDES DA SILVA
4	3	PREFEITO POTI CAVALCANTI
5	3	PROFESSORA ERENITE JUSTINO
6	2	PIO XII
8	3	ALEXANDRE CAVALCANTE
9	3	AGNALDO CORREIA DE MELO
10	2	AGNALDO CORREIA DE MELO
11	3	VEREADOR ERI TEIXEIRA GOMES
13	3	PEDRO MIRANDA DA SILVA
14	5	BR 160
15	3	HANDOLPHO LINS DALBUQUERQUE
12	2	ALEXANDRE CAVALCANTE
16	2	ZILMA RIBEIRO DA SILVA
17	2	MARLENE LEONARDO DA SILVA
18	3	DA FLORESTA
74	1	SAO BARTOLOMEU
21	3	TENENTE MANOEL CAVALCANTE
22	2	ATANAZIO SALUSTINO DO NASCIMENTO
25	6	SEU DEDINHO
27	3	VEREADOR ERI TEIXEIRA DANTAS
31	3	GERALDO PEGADO DE LIMA
32	2	ODILON PEREIRA MATOS
33	3	JOSEFA FAUSTA BORGES
35	3	TX FRANCISCO MARQUES CARNEIRO
36	2	OLINDA PEREIRA DA SILVA
37	2	LETICE VASCONCELOS DA SILVA
38	3	ISMAEL CARDOSO FARIA
39	3	PEDRO DE ALCANTARA CAVALCANTE
40	3	IRACI PEREIRA MACHADO
41	3	MANOEL FERREIRA GOMES
42	6	DE ALTAMIR
43	3	JEAN VARELA
44	3	MESTRE PEDRO GUAJIRU
48	2	ATANASIO SALUSTINO
50	3	ATANASIO SILVESTRE
52	3	ISRAEL FERNANDES
54	3	PROJETADA
56	5	BR 406
58	3	DA RODAGEM
62	3	DO CAMPO
63	3	SANTA LUZIA
66	2	SEM NOME
80	3	VEREADORA MARIA DO CARMO BRITO
82	3	MANOEL SOARES
84	2	LUIZ GONZAGA
24	3	31 DE MARCO
53	4	DE JACARE MIRIM
64	3	DO CEMITERIO
67	3	DO  CEMITERIO 2
23	3	GONCALO PINHEIRO
70	3	SAO BARNABE
69	3	SAO ESTEVAM
19	6	DE ZE DE ODA
83	3	IRMA MARIA ANUNCIADA
20	3	IRMA MARIA ANUNCIADA CALDAS
47	3	JESSICA DEBORA DE MELO
46	3	JOSE BENTO DE OLIVEIRA
7	3	JOSE MESQUITA
29	2	JOSE PEREIRA DE LIMA
65	3	MARIA SALETE DA CONCEICAO
106	3	DO FUTURO
61	3	MARIA TEREZA DE ARAUJO
72	3	SAO FELIPE
79	3	SAO JOAO
77	3	SAO LUCAS
71	3	SAO MARCOS
78	3	SAO MATEUS
76	3	SAO PAULO
73	3	SAO PEDRO
68	3	SAO TADEU
75	3	SAO TOME
26	3	TENENTE JOSE PEREIRA DE LIMA
96	3	DAS ANDORINHAS
87	3	CORISCO
88	3	NOVO SANTO ANTONIO
89	3	JOANA MARQUES
92	3	DECIMA SEGUNDA
93	3	MANOEL SIMPLICIO DO NASCIMENTO
94	3	DECIMA SEXTA
95	3	ESPIRITO SANTO
98	3	HELENA RODRIQUES DE FREITAS
99	3	OTAVIO AUGUSTO BARBOSA
100	3	GENERAL LECO
101	1	DAS FRONTEIRAS
102	3	SEXTA
103	3	QUINTA
104	3	GOIAIS
105	3	SEGUNDA
107	3	LEONARDO BRAZ
108	3	DECIMA QUINTA
111	3	ANDRE SUDARIO PRADO
112	3	JOSEMIR AMARAL REGO
113	3	PRIMEIRA
114	3	JOSE BASILIO DO NASCIMENTO
115	3	CRISTO REI
116	3	NOSSA SENHORA APARECIDA
117	3	SANTA HELENA
118	3	ANA CLESIA VARELA DA SILVA
119	3	ANTONIO RODRIGUES DA SILVA
120	3	MURICI
121	3	INGA
122	3	SAO VICENTE DE PAULA
123	3	DECIMA
124	3	SAO CARLOS
125	3	RIO GRANDE DO NORTE
126	3	BOANERGES MENDES DA SILVA
34	2	VEREADOR AILDO MENDES DA SILVA
55	1	AMAURICIO FERNANDES
59	3	RSANTA MARIA
60	3	RSANTA MARIA II
127	3	JESUINO BRILHANTE
128	3	BELA VISTA
129	3	NOSSA SENHORA DA CONCEICAO
130	3	SAO MIGUEL
131	3	OITAVA
132	3	DAS ARARAS
133	3	DECIMA SETIMA
134	3	AGRIPINO OLIVEIRA NETO
135	3	EXISTENTE
136	3	SEBASTIAO ROSA
137	3	DOS IPES
138	3	VEREADOR MIGUEL PONTES
139	3	DECIMA NONA
140	3	DOM JOSE AFONSO FRAILE
141	3	SERGIPE
142	3	DAS ALAGOAS
144	3	PEQUI
145	3	AZALEIAS
147	3	BENEDITO SANTANA
148	3	CRICIUMA
149	3	SANTO AGOSTINHO
150	3	BOA VISTA
151	3	ESPERANCA
153	3	ITAMBE
154	3	SÃO JOSÉ
155	3	BABILONIA
156	3	TIMBIRA
157	3	SAO JOSE
158	3	NOVA ARUEIRA
159	3	CASSITERITA
160	3	SANTO ANTONIO
161	3	MANGANES
162	3	BACHAREL RAIMUNDO MENDES
163	3	DO CAJUEIRO
164	3	ESTRADA DO GOLANDIM
165	3	ARARI
166	3	SAO LUIZ
168	3	SAO DANIEL
169	3	ARACATI
170	3	VIANA
171	3	ARACAJU
172	2	OLINTO E SILVA SEGUNDA
176	3	DONA IZABEL DE BRITO LIMA
183	3	SAO BENTO
184	3	DA DIREITA
186	3	BARAUNA
187	3	VIVALDO PEREIRA DE ARAUJO
188	3	TEREZA GOMES DA SILVA
189	3	DOS COQUEIROS
190	3	SAO SEBASTIAO
191	3	MAURICIO FERNANDES
193	3	SANTA ANA
194	3	PADRE PINTO
195	3	MONTES CLAROS
196	3	DOS PARDAIS
197	3	ELIANE BARROS
198	3	NOSSA SENHORA DA APRESENTAÇÃO
199	3	LIBANES
200	3	PROFESSOR LUIZ SOARES
201	2	RAIMUNDO MENDES
202	3	CORONEL CASCUDO
203	3	JOAO RODRIGUES DA SILVA
204	2	JOÃO RODRIGUES DA SILVA
205	3	CAMARA CASCUDO
207	3	OSVALDO CRUZ
208	3	CURURUPU
210	2	IRMA DULCE
211	3	OLINTO E SILVA
212	2	INACIO GOMES DA SILVA
214	3	ALCANTARA
215	3	PLUTAO
216	3	TIMBIRAS
217	3	BENTO CANDIDO
218	2	SANTA MARIA
219	3	VENUS
220	3	DA ESPERANCA
221	3	MANGUEIRAL
222	3	CAJUPIRANGA
223	3	DA CHELITA
224	2	ALMEIDA
227	3	PADRE ANDRE MARTINS
228	3	SANTA CLARA
229	3	NABUCODONOSOR
230	3	VEREADOR JOSE HORACIO DE GOIS
231	3	NOVA YORK
233	3	RIO POTENGI
234	2	SANTA MARIA SEGUNDO
236	3	SANTA BARBARA
237	2	SAO DOMINGOS
238	3	SAO JOSE DE MIPIBU
239	3	NOSSA SENHORA DE FATIMA
232	3	EPITACIO MARINHO DE CARVALHO
240	3	ALAGOAS
241	3	PRESIDENTE MEDICI
242	3	NOSSA SENHORA DA PENHA
243	3	MARCILIO DIAS
244	2	SANTA MARIA IV
247	3	SANTA RITA DE CASSIA
248	3	POP BARREIROS
249	3	NOSSA SENHORA DE APARECIDA
250	3	BENEDITO CANDIDO
251	3	SAO JORGE
252	2	ROUXINOL
255	3	HENRIQUE DIAS
259	3	TERRA
260	3	DONA SEGUNDA
261	1	SAO LUIS
262	3	TOCANTINS
263	3	SARGENTO CLOVIS
265	3	SAO FRANCISCO
266	1	CENTRAL
267	3	SANTA CATARINA
264	3	DA MANGUEIRA
209	2	TJOAO RODRIGUES DA SILVA
177	2	TCRICIUMA
185	1	ABENEDITO SANTANA
245	2	TSAO SEBASTIAO
206	1	APRINCIPAL
213	2	TSAO PAULO
152	2	TVEREADOR MAURICIO FERNANDES
143	3	DO COMERCIO
225	1	ACORONEL CASCUDO
253	2	TPRESIDENTE MEDICI
257	2	TMARCILIO DIAS
268	3	COJORI
269	2	SANTA MARIA III
271	3	BABACULANDIA
272	3	ONZE DE OUTUBRO
273	3	JOAO EVANGELISTA
274	2	SANTA MARIA II
276	3	MANOEL CAETANO
277	3	CRISTINA BARBOSA
278	3	SANTA MONICA
279	3	NOSSA SENHORA DO O
280	3	PRINCIPAL
281	3	CEARA MIRIM
282	3	GENERAL ADJER BARRETO
283	3	FAZENDA  REGOMOLEIRO
284	3	NOSSA SENHORA DAS NEVES
285	3	MARIA CARMELITA CABRAL
286	3	PASTOR JOAO SOARES DA SILVA
287	3	JOSE CABRAL BEZERRA
288	3	AMAZONAS
290	1	VERADOR AILDO MENDES DA SILVA
291	3	JOSE MARIANO
292	3	SAO CAETANO
293	3	OLAVO EMILIANO BARBOSA
294	3	ESTRADA DE GUANDUBA
295	3	NOSSA SENHORA DAS DORES
296	3	SANTO EXPEDITO
297	3	ARMINDA PEREIRA DE ALBUQUERQUE
298	3	PRIMAVERA
299	3	PO OITEIROS
300	3	AGUINALDO CORREIA DE MELO
301	2	CARMELITA CABRAL
302	3	MINAS GERAIS
303	3	CORONEL GONCALVES PINHEIRO DE SOUZA
304	3	SI OITEIROS
305	3	ENGEINHEIRO ROBERTO FREIRE
306	3	MARIA DE FATIMA V INACIO
307	3	SAO GABRIEL
308	3	NOSSA SENHORA DE SANTANA
309	3	SAO VICENTE
310	3	NATERCIO MARINHEIRO
311	3	BRASIL
312	3	LO SAMBURA
313	5	RN 160
314	3	LO RAVENA
315	3	RIO AMAZONA
316	3	PO JACARE MIRIM
317	3	NOVO MILENIO
318	3	PARA
319	3	OLHO DAGUA DOS LUCAS
320	3	CICERO HIPOLITO DA ROCHA
321	3	SANTA EFIGENIA
322	3	VEREADOR ARI TEIXEIRA DANTAS
323	3	APOSTULO SAO PAULO
324	3	VILA SAO JOSE
325	3	DAS GRAMPOLAS
326	3	VEREADOR LOURIVAL FLORENCIO
328	3	PADRE THIAGO
329	3	MAGANES
330	3	CAROLINA
331	3	PEDRO BATISTA CAVALCANTE
332	3	JARDIM DAS FLORES
333	3	FAZENDA
334	3	MARANHAO
335	3	SAO SEBASTIAO GONCALVES
336	3	MARBELA
337	2	SANTA MARIA QUINTA
338	3	ISABEL BRITO DE LIMA
339	3	PASTOR JOAQUIM BATISTA DE MACEDO
340	3	SANTA ISABEL
341	3	SANTAREM
342	3	RIACHUELO
343	3	LARGO DO CRICIUMA
344	3	ALBERTO MARANHAO
345	3	MACAIBA
346	3	DO LARGO
347	3	NISIA FLORESTA
348	3	IRMA VITORIA
349	3	CODO
351	3	BACABAL
352	3	SANTO AMARO
353	3	PADRE CICERO
354	3	ALVORADA
355	3	OSVALDO PEREIRA DE ARAUJO
356	3	JUPITER
357	3	JOAO RODRIGUES
358	3	TOPAZIO
359	3	HUMAITA
363	3	ARUEIRA
366	3	DO BREJO
367	3	JOSE TORRES
368	3	CAXIAS
361	2	TSANTO ANTONIO
369	3	NAO IDENTIFICADO
364	2	TOSVALDO CRUZ
370	3	ANTONIO OSCAR PAULO DE BRITO
371	3	PAU FERRO
256	2	TNOSSA SENHORA APARECIDA
372	3	DAS AGUAS
373	3	NOSSA SENHORA DAS GRACAS
374	3	TEREZINHA GOMES DA SILVA
375	3	NOSSA SENHORA DA GUIA
376	3	ALUIZIO ALVES
377	3	MONOEL SOARES
378	2	CARMELITA CABRAL
379	2	SAO TADEUS
381	3	LUIZ GONZAGA
383	3	VEREADOR MAURICIO FERNANDES DE OLIVEIRA
384	3	QUADRA OITO
385	3	SAO DAMIAO
386	2	TBOM JESUS
388	3	RESIDENCIAL AMARANTE
327	2	TSANTA LUZIA
390	3	DAS FLORES
391	3	BERILO
392	3	FILOMENA COELHO
393	2	TJOSE
394	3	SAO FRANCISCO DE ASSIS
395	2	TTOCANTINS
396	3	QUADRA NOVE
397	3	GUAJIRU
360	2	TMARANHAO
398	3	GOIANINHA
399	3	SETIMA
400	3	SEBASTIAO GONCALVES
401	3	DAS MANGUEIRAS
402	2	NOSSA SENHORA APARECIDA NONA
403	3	PIO XII
404	3	PREFEITO POTY CAVALCANTE
405	3	PO OLHO DAGUA DOS LUCAS
406	3	CAMPO LAGO
407	3	EX-COMB MIGUEL LUCIO
408	1	AMINTAS BARROS
409	3	ITAJA
411	3	SALVES LEDO
412	3	SAO GONCALO DO AMARANTE
413	3	DO COMERCIO
414	3	CONEGO MONTE
415	3	SOUZA
416	1	CHICO MENDES
417	3	CRATEUS
418	3	CARLOS GOMES
419	3	ARARIPE
420	3	OLINTO JOSE
421	1	INDUSTRIAL
422	3	RESENDE
423	3	SAO DOMINGOS DO AMARANTE
424	3	TRES TELIAS
425	3	ILHA DO PRINCIPE
426	3	ALGAROBA
427	3	DOS COLIBRIS
428	3	JOSE BARREIROS MATEUS
429	3	FABIO RINO
430	3	ABELARDO FERREIRA DE MELO
431	1	ELISA B. P. DOS SANTOS
432	3	PONTE NOVA
433	1	MARIA LACERDA MONTENEGRO
434	3	MARCOS CAVALCANTE
435	3	DA CRUZ
436	1	LIMA E SILVA
437	3	SAO DIOGO
439	3	PASTOR JERONIMO GUEIROS
440	3	CONSTRUTOR SEVERINO BEZERRA
441	3	1 DE JANEIRO
442	3	DR ARNALDO VIEIRA DE CARVALHO
443	3	DA LARANJEIRA
444	3	ALBATROZ
445	3	ALECRIM
446	3	TENENTE OLAVO FRANCISCO DOS SANTOS
447	3	MADRE VASCONCELOS
448	3	AEROPORTO DE IMPERATRIZ
438	3	LAGOA AIAPUA
449	3	POETA FRANCISCO PALMA
450	3	PROFESSOR JOAO DA MATA
451	3	HAMILTON RODRIGUES SANTIAGO JUNIOR
452	2	SAMPAIO CORREIA
\.


--
-- TOC entry 4482 (class 0 OID 0)
-- Dependencies: 281
-- Name: logradouro_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

SELECT pg_catalog.setval('logradouro_id_seq', 452, true);


--
-- TOC entry 4046 (class 0 OID 25006)
-- Dependencies: 282
-- Data for Name: lote; Type: TABLE DATA; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

COPY lote (id, bairro_id, area_lote, delimitacao_frontal, pedologia, situacao, topografia, valor_venal, zeragem_de_quadrra, identificacao) FROM stdin;
\.


--
-- TOC entry 4483 (class 0 OID 0)
-- Dependencies: 283
-- Name: lote_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

SELECT pg_catalog.setval('lote_id_seq', 1, false);


--
-- TOC entry 4048 (class 0 OID 25014)
-- Dependencies: 284
-- Data for Name: municipio; Type: TABLE DATA; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

COPY municipio (id, estado_id, municipio) FROM stdin;
1	1	SAO GONCALO DO AMARANTE
3	1	NATAL
4	1	PARNAMIRIM
5	1	MACAIBA
6	1	CEARA-MIRIM
7	1	EXTREMOZ
9	2	JKHGJHGJH
\.


--
-- TOC entry 4484 (class 0 OID 0)
-- Dependencies: 285
-- Name: municipio_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

SELECT pg_catalog.setval('municipio_id_seq', 9, true);


--
-- TOC entry 4050 (class 0 OID 25022)
-- Dependencies: 286
-- Data for Name: quadra; Type: TABLE DATA; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

COPY quadra (id, setor_id, quadra) FROM stdin;
\.


--
-- TOC entry 4485 (class 0 OID 0)
-- Dependencies: 287
-- Name: quadra_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

SELECT pg_catalog.setval('quadra_id_seq', 1, false);


--
-- TOC entry 4052 (class 0 OID 25030)
-- Dependencies: 288
-- Data for Name: residencial; Type: TABLE DATA; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

COPY residencial (id, reservado) FROM stdin;
\.


--
-- TOC entry 4486 (class 0 OID 0)
-- Dependencies: 289
-- Name: residencial_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

SELECT pg_catalog.setval('residencial_id_seq', 1, false);


--
-- TOC entry 4054 (class 0 OID 25038)
-- Dependencies: 290
-- Data for Name: setor; Type: TABLE DATA; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

COPY setor (id, distrito_id, setor) FROM stdin;
\.


--
-- TOC entry 4487 (class 0 OID 0)
-- Dependencies: 291
-- Name: setor_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

SELECT pg_catalog.setval('setor_id_seq', 1, false);


--
-- TOC entry 4056 (class 0 OID 25046)
-- Dependencies: 292
-- Data for Name: testada; Type: TABLE DATA; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

COPY testada (id, face_de_quadra_id, lote_id, trecho_de_logradouro_id, testada) FROM stdin;
\.


--
-- TOC entry 4488 (class 0 OID 0)
-- Dependencies: 293
-- Name: testada_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

SELECT pg_catalog.setval('testada_id_seq', 1, false);


--
-- TOC entry 4058 (class 0 OID 25054)
-- Dependencies: 294
-- Data for Name: tipo_logradouro; Type: TABLE DATA; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

COPY tipo_logradouro (id, tipo_logradouro) FROM stdin;
1	AVENIDA
2	TRAVESSA
3	RUA
4	ESTRADA
5	RODOVIA
6	VILA
7	BELA
8	lkjlkj
9	lkjlkj
\.


--
-- TOC entry 4489 (class 0 OID 0)
-- Dependencies: 295
-- Name: tipo_logradouro_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

SELECT pg_catalog.setval('tipo_logradouro_id_seq', 9, true);


--
-- TOC entry 4060 (class 0 OID 25062)
-- Dependencies: 296
-- Data for Name: tipo_logradouro_logradouro; Type: TABLE DATA; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

COPY tipo_logradouro_logradouro (tipo_logradouro_logradouro_id, logradouro_id) FROM stdin;
\.


--
-- TOC entry 4061 (class 0 OID 25065)
-- Dependencies: 297
-- Data for Name: trecho_de_logradouro; Type: TABLE DATA; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

COPY trecho_de_logradouro (id, cruzamento_id, logradouro_id, cep) FROM stdin;
\.


--
-- TOC entry 4490 (class 0 OID 0)
-- Dependencies: 298
-- Name: trecho_de_logradouro_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

SELECT pg_catalog.setval('trecho_de_logradouro_id_seq', 1, false);


--
-- TOC entry 4063 (class 0 OID 25073)
-- Dependencies: 299
-- Data for Name: unidade_edificada; Type: TABLE DATA; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

COPY unidade_edificada (id, lote_id, area_edificada, area_total_construida, identificacao) FROM stdin;
\.


--
-- TOC entry 4491 (class 0 OID 0)
-- Dependencies: 300
-- Name: unidade_edificada_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

SELECT pg_catalog.setval('unidade_edificada_id_seq', 1, false);


SET search_path = cadastro_unico_patrimonio, pg_catalog;

--
-- TOC entry 4065 (class 0 OID 25078)
-- Dependencies: 301
-- Data for Name: abastecimento; Type: TABLE DATA; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

COPY abastecimento (id, quilometragem, combustivel, numero_do_talao, quantidade_de_litros, consumo_medio) FROM stdin;
\.


--
-- TOC entry 4492 (class 0 OID 0)
-- Dependencies: 302
-- Name: abastecimento_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

SELECT pg_catalog.setval('abastecimento_id_seq', 1, false);


--
-- TOC entry 4067 (class 0 OID 25086)
-- Dependencies: 303
-- Data for Name: ambulancia; Type: TABLE DATA; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

COPY ambulancia (id, reservado) FROM stdin;
\.


--
-- TOC entry 4493 (class 0 OID 0)
-- Dependencies: 304
-- Name: ambulancia_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

SELECT pg_catalog.setval('ambulancia_id_seq', 1, false);


--
-- TOC entry 4069 (class 0 OID 25094)
-- Dependencies: 305
-- Data for Name: bem; Type: TABLE DATA; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

COPY bem (id, bem, data_aquisicao, estado_fisico, marca, modelo, nota_fiscal, serie, tombo, moeda_valor_unitario, tipo_bem) FROM stdin;
\.


--
-- TOC entry 4494 (class 0 OID 0)
-- Dependencies: 306
-- Name: bem_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

SELECT pg_catalog.setval('bem_id_seq', 1, false);


--
-- TOC entry 4071 (class 0 OID 25102)
-- Dependencies: 307
-- Data for Name: caminhao; Type: TABLE DATA; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

COPY caminhao (id, reservado) FROM stdin;
\.


--
-- TOC entry 4495 (class 0 OID 0)
-- Dependencies: 308
-- Name: caminhao_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

SELECT pg_catalog.setval('caminhao_id_seq', 1, false);


--
-- TOC entry 4073 (class 0 OID 25110)
-- Dependencies: 309
-- Data for Name: carro; Type: TABLE DATA; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

COPY carro (id, reservado) FROM stdin;
\.


--
-- TOC entry 4496 (class 0 OID 0)
-- Dependencies: 310
-- Name: carro_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

SELECT pg_catalog.setval('carro_id_seq', 1, false);


--
-- TOC entry 4075 (class 0 OID 25118)
-- Dependencies: 311
-- Data for Name: garagem; Type: TABLE DATA; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

COPY garagem (id, garagem) FROM stdin;
\.


--
-- TOC entry 4497 (class 0 OID 0)
-- Dependencies: 312
-- Name: garagem_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

SELECT pg_catalog.setval('garagem_id_seq', 1, false);


--
-- TOC entry 4077 (class 0 OID 25126)
-- Dependencies: 313
-- Data for Name: locacao; Type: TABLE DATA; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

COPY locacao (id, reservado) FROM stdin;
\.


--
-- TOC entry 4498 (class 0 OID 0)
-- Dependencies: 314
-- Name: locacao_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

SELECT pg_catalog.setval('locacao_id_seq', 1, false);


--
-- TOC entry 4079 (class 0 OID 25134)
-- Dependencies: 315
-- Data for Name: lotacao; Type: TABLE DATA; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

COPY lotacao (id, bem_id, organismo_id, reservado) FROM stdin;
\.


--
-- TOC entry 4499 (class 0 OID 0)
-- Dependencies: 316
-- Name: lotacao_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

SELECT pg_catalog.setval('lotacao_id_seq', 1, false);


--
-- TOC entry 4081 (class 0 OID 25142)
-- Dependencies: 317
-- Data for Name: manutencao; Type: TABLE DATA; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

COPY manutencao (id, reservado, tipo_de_manutencao) FROM stdin;
\.


--
-- TOC entry 4500 (class 0 OID 0)
-- Dependencies: 318
-- Name: manutencao_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

SELECT pg_catalog.setval('manutencao_id_seq', 1, false);


--
-- TOC entry 4083 (class 0 OID 25150)
-- Dependencies: 319
-- Data for Name: moto; Type: TABLE DATA; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

COPY moto (id, reservado) FROM stdin;
\.


--
-- TOC entry 4501 (class 0 OID 0)
-- Dependencies: 320
-- Name: moto_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

SELECT pg_catalog.setval('moto_id_seq', 1, false);


--
-- TOC entry 4085 (class 0 OID 25158)
-- Dependencies: 321
-- Data for Name: multas; Type: TABLE DATA; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

COPY multas (id, uso_id, data_da_multa, infracao, local, moeda_valor, hora) FROM stdin;
\.


--
-- TOC entry 4502 (class 0 OID 0)
-- Dependencies: 322
-- Name: multas_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

SELECT pg_catalog.setval('multas_id_seq', 1, false);


--
-- TOC entry 4087 (class 0 OID 25166)
-- Dependencies: 323
-- Data for Name: onibus; Type: TABLE DATA; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

COPY onibus (id, reservado) FROM stdin;
\.


--
-- TOC entry 4503 (class 0 OID 0)
-- Dependencies: 324
-- Name: onibus_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

SELECT pg_catalog.setval('onibus_id_seq', 1, false);


--
-- TOC entry 4089 (class 0 OID 25174)
-- Dependencies: 325
-- Data for Name: propriedade_de; Type: TABLE DATA; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

COPY propriedade_de (id, bem_id, pessoa_id, responsavel) FROM stdin;
\.


--
-- TOC entry 4504 (class 0 OID 0)
-- Dependencies: 326
-- Name: propriedade_de_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

SELECT pg_catalog.setval('propriedade_de_id_seq', 1, false);


--
-- TOC entry 4091 (class 0 OID 25182)
-- Dependencies: 327
-- Data for Name: servico; Type: TABLE DATA; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

COPY servico (id, contrato_id, veiculo_id, data_da_nota, nota_fiscal, moeda_valor, data_inicio, data_fim) FROM stdin;
\.


--
-- TOC entry 4505 (class 0 OID 0)
-- Dependencies: 328
-- Name: servico_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

SELECT pg_catalog.setval('servico_id_seq', 1, false);


--
-- TOC entry 4093 (class 0 OID 25190)
-- Dependencies: 329
-- Data for Name: trator; Type: TABLE DATA; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

COPY trator (id, reservado) FROM stdin;
\.


--
-- TOC entry 4506 (class 0 OID 0)
-- Dependencies: 330
-- Name: trator_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

SELECT pg_catalog.setval('trator_id_seq', 1, false);


--
-- TOC entry 4095 (class 0 OID 25198)
-- Dependencies: 331
-- Data for Name: uso; Type: TABLE DATA; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

COPY uso (id, garagem_id, motorista_id, veiculo_id, data) FROM stdin;
\.


--
-- TOC entry 4507 (class 0 OID 0)
-- Dependencies: 332
-- Name: uso_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

SELECT pg_catalog.setval('uso_id_seq', 1, false);


--
-- TOC entry 4097 (class 0 OID 25203)
-- Dependencies: 333
-- Data for Name: veiculo; Type: TABLE DATA; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

COPY veiculo (id, chassi, combustivel, cor, placa, quilometragem, renavam, ano_fabricacao, ano_modelo) FROM stdin;
\.


--
-- TOC entry 4508 (class 0 OID 0)
-- Dependencies: 334
-- Name: veiculo_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

SELECT pg_catalog.setval('veiculo_id_seq', 1, false);


SET search_path = cadastro_unico_pessoal, pg_catalog;

--
-- TOC entry 4099 (class 0 OID 25211)
-- Dependencies: 335
-- Data for Name: aditivo; Type: TABLE DATA; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

COPY aditivo (id, contrato_id, numero_contrato, vigencia_contrato, data_inicio, data_termino, valor_limite, produto, saldo_restante) FROM stdin;
\.


--
-- TOC entry 4509 (class 0 OID 0)
-- Dependencies: 336
-- Name: aditivo_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

SELECT pg_catalog.setval('aditivo_id_seq', 1, false);


--
-- TOC entry 4101 (class 0 OID 25219)
-- Dependencies: 337
-- Data for Name: aluno; Type: TABLE DATA; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

COPY aluno (id, numero_de_inscricao) FROM stdin;
2695	20152684
2696	20152696
2697	20152697
2698	20152698
2699	20152699
2700	20152700
2701	20152701
2702	20152702
2703	20152703
2704	20152704
2705	20152705
2706	20152706
2707	20152707
2708	20152708
2709	20152709
2710	20152710
2711	20152711
2712	20152712
2713	20152713
2714	20152714
2715	20152715
2716	20152716
2717	20152717
2718	20152718
2719	20152719
2720	20152720
2721	20152721
2722	20152722
2723	20152723
2724	20152724
2725	20152725
2726	20152726
2727	20152727
2728	20152728
2729	20152729
2730	20152730
2799	20152799
2800	20152800
2801	20152801
2803	20152803
2804	20152804
2805	20152805
2806	20152806
2807	20152807
2808	20152808
2809	20152809
2810	20152810
2812	20152811
2814	20152814
2815	20152815
2816	20152816
2817	20152817
2818	20152818
2819	20152819
2820	20152820
2821	20152821
2822	20152822
2823	20152823
2824	20152824
2825	20152825
2826	20152826
2827	20152827
2828	20152828
2829	20152829
2830	20152830
2831	20152831
2832	20152832
2833	20152833
2834	20152834
2835	20152835
2836	20152836
2837	20152837
2838	20152838
2839	20152839
2840	20152840
2841	20152841
2842	20152842
2843	20152843
2844	20152844
2845	20152845
2846	20152846
2847	20152847
2848	20152848
2849	20152849
2850	20152850
2851	20152851
2852	20152852
2853	20152853
2854	20152854
2855	20152855
2856	20152856
2857	20152857
2858	20152858
2859	20152859
2860	20152860
2861	20152861
2862	20152862
2863	20152863
2864	20152864
2865	20152865
2866	20152866
2867	20152867
2868	20152868
2870	20152870
2871	20152871
2872	20152872
2893	20152893
2894	20152894
2895	20152895
2896	20152896
762	2015762
2683	654678
2733	20152731
2734	20152734
2735	20152735
2736	20152736
2737	20152737
2738	20152738
2739	20152739
2740	20152740
2742	20152742
2743	20152743
2744	20152744
2745	20152745
2746	20152746
2747	20152747
2748	20152748
2749	20152749
2750	20152750
2751	20152751
2752	20152752
2753	20152753
2754	20152754
2755	20152755
2757	20152757
2758	20152758
2759	20152759
2760	20152760
2761	20152761
2762	20152762
2763	20152763
2764	20152764
2765	20152765
2766	20152766
2767	20152767
2768	20152768
2769	20152769
2770	20152770
2772	20152771
2773	20152773
2774	20152774
2775	20152775
2776	20152776
2777	20152777
2778	20152778
2779	20152779
2780	20152780
2781	20152781
2782	20152782
2783	20152783
2785	20152784
2786	20152786
2788	20152788
2789	20152789
2790	20152790
2792	20152791
2793	20152793
2795	20152795
2797	20152797
2798	20152798
2897	20152897
2898	20152898
2899	20152899
2900	20152900
2901	20152901
2902	20152902
2903	20152903
2904	20152904
2905	20152905
2907	20152907
2908	20152908
2910	20152910
2911	20152911
2912	20152912
987	2015987
2914	20152914
2915	20152915
2916	20152916
2917	20152917
2918	20152918
1213	20151213
2873	20152873
2919	20152919
2920	20152920
2921	20152921
2922	20152922
2923	20152923
2924	20152924
2925	20152925
2926	20152926
2874	20152874
2875	20152875
2876	20152876
763	2015763
764	2015764
765	2015765
766	2015766
767	2015767
768	2015768
769	2015769
770	2015770
771	2015771
772	2015772
773	2015773
774	2015774
775	2015775
776	2015776
777	2015777
778	2015778
779	2015779
780	2015780
781	2015781
782	2015782
783	2015783
784	2015784
785	2015785
786	2015786
787	2015787
788	2015788
789	2015789
790	2015790
791	2015791
792	2015792
793	2015793
794	2015794
795	2015795
796	2015796
797	2015797
798	2015798
799	2015799
800	2015800
801	2015801
802	2015802
803	2015803
804	2015804
805	2015805
806	2015806
807	2015807
808	2015808
809	2015809
810	2015810
811	2015811
812	2015812
813	2015813
814	2015814
815	2015815
816	2015816
817	2015817
818	2015818
819	2015819
820	2015820
821	2015821
822	2015822
823	2015823
824	2015824
825	2015825
826	2015826
827	2015827
828	2015828
829	2015829
830	2015830
831	2015831
832	2015832
833	2015833
834	2015834
835	2015835
836	2015836
837	2015837
838	2015838
839	2015839
840	2015840
841	2015841
842	2015842
843	2015843
844	2015844
845	2015845
846	2015846
847	2015847
848	2015848
849	2015849
850	2015850
851	2015851
852	2015852
853	2015853
854	2015854
855	2015855
856	2015856
857	2015857
858	2015858
859	2015859
860	2015860
861	2015861
862	2015862
863	2015863
864	2015864
865	2015865
866	2015866
867	2015867
868	2015868
869	2015869
870	2015870
871	2015871
872	2015872
873	2015873
874	2015874
875	2015875
876	2015876
877	2015877
878	2015878
879	2015879
880	2015880
881	2015881
882	2015882
883	2015883
884	2015884
885	2015885
886	2015886
887	2015887
888	2015888
889	2015889
2909	\N
2906	\N
890	2015890
891	2015891
892	2015892
893	2015893
894	2015894
895	2015895
896	2015896
897	2015897
898	2015898
899	2015899
900	2015900
901	2015901
902	2015902
903	2015903
904	2015904
905	2015905
906	2015906
907	2015907
908	2015908
909	2015909
910	2015910
911	2015911
912	2015912
913	2015913
914	2015914
915	2015915
916	2015916
917	2015917
918	2015918
919	2015919
920	2015920
921	2015921
922	2015922
923	2015923
924	2015924
925	2015925
926	2015926
927	2015927
928	2015928
929	2015929
930	2015930
931	2015931
932	2015932
933	2015933
934	2015934
935	2015935
936	2015936
937	2015937
938	2015938
939	2015939
940	2015940
941	2015941
942	2015942
943	2015943
944	2015944
945	2015945
946	2015946
947	2015947
948	2015948
949	2015949
950	2015950
951	2015951
952	2015952
953	2015953
954	2015954
955	2015955
956	2015956
957	2015957
958	2015958
959	2015959
960	2015960
961	2015961
962	2015962
963	2015963
964	2015964
965	2015965
966	2015966
967	2015967
968	2015968
969	2015969
970	2015970
971	2015971
972	2015972
973	2015973
974	2015974
975	2015975
976	2015976
977	2015977
978	2015978
979	2015979
980	2015980
981	2015981
982	2015982
983	2015983
984	2015984
985	2015985
986	2015986
988	2015988
989	2015989
990	2015990
991	2015991
992	2015992
993	2015993
994	2015994
995	2015995
996	2015996
997	2015997
998	2015998
999	2015999
1000	20151000
1001	20151001
1002	20151002
1003	20151003
1004	20151004
1005	20151005
1006	20151006
1007	20151007
1008	20151008
1009	20151009
1010	20151010
1011	20151011
1012	20151012
1013	20151013
1014	20151014
1015	20151015
1016	20151016
1017	20151017
1018	20151018
1019	20151019
1020	20151020
1021	20151021
1022	20151022
1023	20151023
1024	20151024
1025	20151025
1026	20151026
1027	20151027
1028	20151028
1029	20151029
1030	20151030
1031	20151031
1032	20151032
1033	20151033
1034	20151034
1035	20151035
1036	20151036
1037	20151037
1038	20151038
1039	20151039
1040	20151040
1041	20151041
1042	20151042
1043	20151043
1044	20151044
1045	20151045
1046	20151046
1047	20151047
1048	20151048
1049	20151049
1050	20151050
1051	20151051
1052	20151052
1053	20151053
1054	20151054
1055	20151055
1056	20151056
1057	20151057
1058	20151058
1059	20151059
1060	20151060
1061	20151061
1062	20151062
1063	20151063
1064	20151064
1065	20151065
1066	20151066
1067	20151067
1068	20151068
1069	20151069
1070	20151070
1071	20151071
1072	20151072
1073	20151073
1074	20151074
1075	20151075
1076	20151076
1077	20151077
1078	20151078
1079	20151079
1080	20151080
1081	20151081
1082	20151082
1083	20151083
1084	20151084
1085	20151085
1086	20151086
1087	20151087
1088	20151088
1089	20151089
1091	20151091
1092	20151092
1093	20151093
1094	20151094
1095	20151095
1096	20151096
1097	20151097
1098	20151098
1099	20151099
1100	20151100
1101	20151101
1102	20151102
1103	20151103
1104	20151104
1105	20151105
1106	20151106
1107	20151107
1108	20151108
1109	20151109
1111	20151111
1112	20151112
1113	20151113
1114	20151114
1115	20151115
1116	20151116
1117	20151117
1118	20151118
1119	20151119
1120	20151120
1121	20151121
1122	20151122
1123	20151123
1124	20151124
1125	20151125
1126	20151126
1127	20151127
1128	20151128
1129	20151129
1130	20151130
1131	20151131
1132	20151132
1133	20151133
1134	20151134
1135	20151135
1136	20151136
1137	20151137
1138	20151138
1139	20151139
1140	20151140
1141	20151141
1142	20151142
1143	20151143
1144	20151144
1145	20151145
1146	20151146
1147	20151147
1148	20151148
1149	20151149
1150	20151150
1151	20151151
1152	20151152
1153	20151153
1154	20151154
1155	20151155
1156	20151156
1157	20151157
1158	20151158
1159	20151159
1160	20151160
1161	20151161
1162	20151162
1163	20151163
1164	20151164
1165	20151165
1166	20151166
1167	20151167
1168	20151168
1169	20151169
1170	20151170
1171	20151171
1172	20151172
1173	20151173
1174	20151174
1175	20151175
1176	20151176
1177	20151177
1178	20151178
1179	20151179
1180	20151180
1181	20151181
1182	20151182
1183	20151183
1184	20151184
1185	20151185
1186	20151186
1187	20151187
1188	20151188
1189	20151189
1190	20151190
1191	20151191
1192	20151192
1193	20151193
1194	20151194
1195	20151195
1196	20151196
1197	20151197
1198	20151198
1199	20151199
1200	20151200
1201	20151201
1202	20151202
1203	20151203
1204	20151204
1205	20151205
1206	20151206
1207	20151207
1208	20151208
1209	20151209
1210	20151210
1211	20151211
1212	20151212
1214	20151214
1215	20151215
1216	20151216
1217	20151217
1218	20151218
1219	20151219
1220	20151220
1221	20151221
1222	20151222
1223	20151223
1224	20151224
1225	20151225
1226	20151226
1227	20151227
1228	20151228
1229	20151229
1230	20151230
1231	20151231
1232	20151232
1233	20151233
1234	20151234
1235	20151235
1236	20151236
1237	20151237
1238	20151238
1239	20151239
1240	20151240
1241	20151241
1242	20151242
1243	20151243
1244	20151244
1245	20151245
1246	20151246
1247	20151247
1248	20151248
1249	20151249
1250	20151250
1251	20151251
1252	20151252
1253	20151253
1254	20151254
1255	20151255
1256	20151256
1257	20151257
1258	20151258
1259	20151259
1260	20151260
1261	20151261
1262	20151262
1263	20151263
1264	20151264
1265	20151265
1266	20151266
1267	20151267
1268	20151268
1269	20151269
1270	20151270
1271	20151271
1272	20151272
1273	20151273
1274	20151274
1275	20151275
1276	20151276
1277	20151277
1278	20151278
1279	20151279
1280	20151280
1281	20151281
1282	20151282
1283	20151283
1284	20151284
1285	20151285
1286	20151286
1287	20151287
1288	20151288
1289	20151289
1290	20151290
1291	20151291
1292	20151292
1293	20151293
1294	20151294
1295	20151295
1296	20151296
1297	20151297
1298	20151298
1299	20151299
1300	20151300
1301	20151301
1302	20151302
1303	20151303
1304	20151304
1305	20151305
1306	20151306
1307	20151307
1308	20151308
1309	20151309
1310	20151310
1311	20151311
1312	20151312
1313	20151313
1314	20151314
1315	20151315
1316	20151316
1317	20151317
1318	20151318
1319	20151319
1320	20151320
1321	20151321
1322	20151322
1323	20151323
1325	20151325
1326	20151326
1327	20151327
1328	20151328
1329	20151329
1330	20151330
1331	20151331
1332	20151332
1333	20151333
1334	20151334
1335	20151335
1336	20151336
1337	20151337
1338	20151338
1339	20151339
1340	20151340
1341	20151341
1342	20151342
1343	20151343
1344	20151344
1345	20151345
1346	20151346
1347	20151347
1348	20151348
1349	20151349
1350	20151350
1351	20151351
1352	20151352
1353	20151353
1354	20151354
1355	20151355
1356	20151356
1357	20151357
1358	20151358
1359	20151359
1360	20151360
1361	20151361
1362	20151362
1363	20151363
1364	20151364
1365	20151365
1366	20151366
1367	20151367
1368	20151368
1369	20151369
1370	20151370
1371	20151371
1372	20151372
1373	20151373
1374	20151374
1375	20151375
1376	20151376
1377	20151377
1378	20151378
1379	20151379
1380	20151380
1381	20151381
1382	20151382
1383	20151383
1384	20151384
1385	20151385
1386	20151386
1387	20151387
1388	20151388
1389	20151389
1390	20151390
1391	20151391
1392	20151392
1393	20151393
1394	20151394
1395	20151395
1396	20151396
1397	20151397
1398	20151398
1399	20151399
1400	20151400
1401	20151401
1402	20151402
1403	20151403
1404	20151404
1405	20151405
1406	20151406
1407	20151407
1408	20151408
1409	20151409
1410	20151410
1411	20151411
1412	20151412
1413	20151413
1414	20151414
1415	20151415
1416	20151416
1417	20151417
1418	20151418
1419	20151419
1420	20151420
1421	20151421
1422	20151422
1423	20151423
1424	20151424
1425	20151425
1426	20151426
1427	20151427
1428	20151428
1429	20151429
1430	20151430
1431	20151431
1432	20151432
1433	20151433
1434	20151434
1435	20151435
1436	20151436
1437	20151437
1438	20151438
1439	20151439
1440	20151440
1441	20151441
1442	20151442
1443	20151443
1444	20151444
1445	20151445
1446	20151446
1447	20151447
1448	20151448
1449	20151449
1450	20151450
1451	20151451
1452	20151452
1453	20151453
1454	20151454
1455	20151455
1457	20151457
1458	20151458
1459	20151459
1460	20151460
1461	20151461
1462	20151462
1463	20151463
1464	20151464
1465	20151465
1466	20151466
1467	20151467
1468	20151468
1469	20151469
1470	20151470
1471	20151471
1472	20151472
1473	20151473
1474	20151474
1475	20151475
1476	20151476
1477	20151477
1478	20151478
1479	20151479
1480	20151480
1481	20151481
1482	20151482
1483	20151483
1484	20151484
1485	20151485
1486	20151486
1487	20151487
1488	20151488
1489	20151489
1490	20151490
1491	20151491
1492	20151492
1493	20151493
1494	20151494
1495	20151495
1496	20151496
1497	20151497
1498	20151498
1499	20151499
1500	20151500
1501	20151501
1502	20151502
1503	20151503
1504	20151504
1505	20151505
1506	20151506
1507	20151507
1508	20151508
1509	20151509
1510	20151510
1511	20151511
1512	20151512
1513	20151513
1514	20151514
1515	20151515
1516	20151516
1517	20151517
1518	20151518
1519	20151519
1520	20151520
1521	20151521
1522	20151522
1523	20151523
1524	20151524
1525	20151525
1526	20151526
1527	20151527
1528	20151528
1529	20151529
1530	20151530
1531	20151531
1532	20151532
1533	20151533
1534	20151534
1535	20151535
1536	20151536
1537	20151537
1538	20151538
1539	20151539
1540	20151540
1541	20151541
1542	20151542
1543	20151543
1544	20151544
1545	20151545
1546	20151546
1547	20151547
1548	20151548
1549	20151549
1550	20151550
1551	20151551
1552	20151552
1553	20151553
1554	20151554
1555	20151555
1556	20151556
1557	20151557
1558	20151558
1559	20151559
1560	20151560
1561	20151561
1562	20151562
1563	20151563
1564	20151564
1565	20151565
1566	20151566
1567	20151567
1568	20151568
1569	20151569
1570	20151570
1571	20151571
1572	20151572
1573	20151573
1574	20151574
1575	20151575
1576	20151576
1577	20151577
1578	20151578
1579	20151579
1580	20151580
1581	20151581
1582	20151582
1583	20151583
1584	20151584
1585	20151585
1586	20151586
1587	20151587
1588	20151588
1589	20151589
1590	20151590
1591	20151591
1592	20151592
1593	20151593
1594	20151594
1595	20151595
1596	20151596
1597	20151597
1598	20151598
1599	20151599
1600	20151600
1601	20151601
1602	20151602
1603	20151603
1604	20151604
1605	20151605
1606	20151606
1607	20151607
1608	20151608
1609	20151609
1610	20151610
1611	20151611
1612	20151612
1613	20151613
1614	20151614
1615	20151615
1616	20151616
1617	20151617
1618	20151618
1619	20151619
1620	20151620
1621	20151621
1622	20151622
1623	20151623
1624	20151624
1625	20151625
1626	20151626
1627	20151627
1628	20151628
1629	20151629
1630	20151630
1631	20151631
1632	20151632
1633	20151633
1634	20151634
1635	20151635
1636	20151636
1637	20151637
1638	20151638
1639	20151639
1640	20151640
1641	20151641
1642	20151642
1643	20151643
1644	20151644
1645	20151645
1646	20151646
1647	20151647
1648	20151648
1649	20151649
1650	20151650
1651	20151651
1652	20151652
1653	20151653
1654	20151654
1655	20151655
1656	20151656
1657	20151657
1658	20151658
1659	20151659
1660	20151660
1661	20151661
1662	20151662
1663	20151663
1664	20151664
1665	20151665
1666	20151666
1667	20151667
1668	20151668
1669	20151669
1670	20151670
1671	20151671
1672	20151672
1673	20151673
1674	20151674
1675	20151675
1676	20151676
1677	20151677
1678	20151678
1679	20151679
1680	20151680
1681	20151681
1682	20151682
1683	20151683
1684	20151684
1685	20151685
1686	20151686
1687	20151687
1688	20151688
1689	20151689
1690	20151690
1691	20151691
1692	20151692
1693	20151693
1694	20151694
1695	20151695
1696	20151696
1697	20151697
1698	20151698
1699	20151699
1700	20151700
1701	20151701
1702	20151702
1703	20151703
1704	20151704
1705	20151705
1706	20151706
1707	20151707
1708	20151708
1709	20151709
1710	20151710
1711	20151711
1712	20151712
1713	20151713
1714	20151714
1715	20151715
1716	20151716
1717	20151717
1718	20151718
1719	20151719
1720	20151720
1721	20151721
1722	20151722
1723	20151723
1724	20151724
1725	20151725
1726	20151726
1727	20151727
1728	20151728
1729	20151729
1730	20151730
1731	20151731
1732	20151732
1733	20151733
1734	20151734
1735	20151735
1736	20151736
1737	20151737
1738	20151738
1739	20151739
1740	20151740
1741	20151741
1742	20151742
1743	20151743
1744	20151744
1745	20151745
1746	20151746
1747	20151747
1748	20151748
1749	20151749
1750	20151750
1751	20151751
1752	20151752
1753	20151753
1754	20151754
1755	20151755
1756	20151756
1757	20151757
1758	20151758
1759	20151759
1760	20151760
1761	20151761
1762	20151762
1763	20151763
1764	20151764
1765	20151765
1766	20151766
1767	20151767
1768	20151768
1769	20151769
1770	20151770
1771	20151771
1772	20151772
1773	20151773
1774	20151774
1775	20151775
1776	20151776
1777	20151777
1778	20151778
1779	20151779
1780	20151780
1781	20151781
1782	20151782
1783	20151783
1784	20151784
1785	20151785
1786	20151786
1787	20151787
1788	20151788
1789	20151789
1791	20151791
1792	20151792
1793	20151793
1794	20151794
1795	20151795
1796	20151796
1797	20151797
1798	20151798
1799	20151799
1800	20151800
1801	20151801
1802	20151802
1803	20151803
1804	20151804
1805	20151805
1806	20151806
1807	20151807
1808	20151808
1809	20151809
1810	20151810
1811	20151811
1812	20151812
1813	20151813
1814	20151814
1815	20151815
1816	20151816
1817	20151817
1818	20151818
1819	20151819
1820	20151820
1821	20151821
1822	20151822
1823	20151823
1824	20151824
1825	20151825
1826	20151826
1827	20151827
1828	20151828
1829	20151829
1830	20151830
1831	20151831
1832	20151832
1833	20151833
1834	20151834
1835	20151835
1836	20151836
1837	20151837
1838	20151838
1839	20151839
1840	20151840
1841	20151841
1842	20151842
1843	20151843
1844	20151844
1845	20151845
1846	20151846
1847	20151847
1848	20151848
1849	20151849
1850	20151850
1851	20151851
1852	20151852
1853	20151853
1854	20151854
1855	20151855
1856	20151856
1857	20151857
1858	20151858
1859	20151859
1860	20151860
1861	20151861
1862	20151862
1863	20151863
1864	20151864
1865	20151865
1866	20151866
1867	20151867
1868	20151868
1869	20151869
1870	20151870
1871	20151871
1872	20151872
1873	20151873
1874	20151874
1875	20151875
1876	20151876
1877	20151877
1878	20151878
1879	20151879
1880	20151880
1881	20151881
1882	20151882
1883	20151883
1884	20151884
1885	20151885
1886	20151886
1887	20151887
1888	20151888
1889	20151889
1890	20151890
1891	20151891
1892	20151892
1893	20151893
1894	20151894
1895	20151895
1896	20151896
1897	20151897
1898	20151898
1899	20151899
1900	20151900
1901	20151901
1902	20151902
1903	20151903
1904	20151904
1905	20151905
1906	20151906
1907	20151907
1908	20151908
1909	20151909
1910	20151910
1911	20151911
1912	20151912
1913	20151913
1914	20151914
1915	20151915
1916	20151916
1917	20151917
1918	20151918
1919	20151919
1920	20151920
1921	20151921
1922	20151922
1923	20151923
1924	20151924
1925	20151925
1926	20151926
1927	20151927
1928	20151928
1929	20151929
1930	20151930
1931	20151931
1932	20151932
1933	20151933
1934	20151934
1935	20151935
1936	20151936
1937	20151937
1938	20151938
1939	20151939
1940	20151940
1941	20151941
1942	20151942
1943	20151943
1944	20151944
1945	20151945
1946	20151946
1947	20151947
1948	20151948
1949	20151949
1950	20151950
1951	20151951
1952	20151952
1953	20151953
1954	20151954
1955	20151955
1956	20151956
1957	20151957
1958	20151958
1959	20151959
1960	20151960
1961	20151961
1962	20151962
1963	20151963
1964	20151964
1965	20151965
1966	20151966
1967	20151967
1968	20151968
1969	20151969
1970	20151970
1971	20151971
1972	20151972
1973	20151973
1974	20151974
1975	20151975
1976	20151976
1977	20151977
1978	20151978
1979	20151979
1980	20151980
1981	20151981
1982	20151982
1983	20151983
1984	20151984
1985	20151985
1986	20151986
1987	20151987
1988	20151988
1989	20151989
1990	20151990
1991	20151991
1992	20151992
1993	20151993
1994	20151994
1995	20151995
1996	20151996
1997	20151997
1998	20151998
1999	20151999
2000	20152000
2001	20152001
2002	20152002
2003	20152003
2004	20152004
2005	20152005
2006	20152006
2007	20152007
2008	20152008
2009	20152009
2010	20152010
2011	20152011
2012	20152012
2013	20152013
2014	20152014
2015	20152015
2016	20152016
2017	20152017
2018	20152018
2019	20152019
2020	20152020
2021	20152021
2022	20152022
2023	20152023
2024	20152024
2025	20152025
2026	20152026
2027	20152027
2028	20152028
2029	20152029
2030	20152030
2031	20152031
2032	20152032
2033	20152033
2034	20152034
2035	20152035
2036	20152036
2037	20152037
2038	20152038
2039	20152039
2040	20152040
2041	20152041
2042	20152042
2043	20152043
2044	20152044
2045	20152045
2298	20152298
2299	20152299
1110	20151110
1324	20151324
761	2015761
2877	20152877
2878	20152878
2879	20152879
2880	20152880
2881	20152881
2882	20152882
2883	20152883
2884	20152884
2885	20152885
2886	20152886
2887	20152887
2888	20152888
2889	20152889
2890	20152890
2891	20152891
2892	20152892
2930	20152927
2931	20152931
2932	20152932
2933	20152933
2941	20152941
2944	20152943
2945	20152945
2946	20152946
2947	20152947
2948	20152948
2949	20152949
2950	20152950
3132	20153132
3133	20153133
3134	20153134
3135	20153135
3137	20153137
3138	20153138
2741	\N
3139	20153139
3140	20153140
3143	20153143
3144	20153144
3147	20153147
3148	20153148
3161	20153161
3162	20153162
3167	20153167
3171	20153171
3175	20153175
3176	20153176
3177	20153177
3136	\N
1790	\N
3219	20153219
3220	20153220
3222	20153222
3227	20153227
3228	20153228
3230	20153230
3244	20153244
3245	20153245
3247	20153247
3248	20153248
3254	20153254
3255	\N
1456	\N
1090	\N
3270	20153270
3272	20153272
3275	20153275
3287	20153287
3289	20153289
3290	20153290
3292	20153292
3294	20153294
3296	20153296
3298	20153298
3300	20153300
3314	20153314
3316	20153316
3319	20153319
3321	20153321
3323	20153323
3325	20153325
3327	20153327
3329	20153329
3331	20153331
2942	\N
3347	20153347
3354	20153354
\.


--
-- TOC entry 4510 (class 0 OID 0)
-- Dependencies: 338
-- Name: aluno_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

SELECT pg_catalog.setval('aluno_id_seq', 3359, false);


--
-- TOC entry 4103 (class 0 OID 25227)
-- Dependencies: 339
-- Data for Name: cidadao; Type: TABLE DATA; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

COPY cidadao (id, cm_categoria, cm_data_de_emissao, cm_numero, ct_data_de_emissao, ct_numero, ct_serie, estado_civil, nacionalidade, naturalidade, profissao, rg_data_de_emissao, rg_numero, rg_orgao_expeditor, te_numero, te_secao, te_zona) FROM stdin;
2298	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2299	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1808	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1809	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1810	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1811	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1812	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1813	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1814	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1815	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1816	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1817	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1818	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1819	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1820	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1821	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1822	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1823	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1824	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1825	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1826	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1827	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1828	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1829	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1830	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1831	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1832	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1833	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1834	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1835	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1836	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1837	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1838	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1839	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1840	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1841	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1842	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1843	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1844	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1845	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1846	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1847	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1848	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1849	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1850	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1851	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1852	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1853	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1854	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1855	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1856	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1857	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1858	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1859	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1860	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1861	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2245	\N	\N	\N	\N	\N	\N	VIUVO(A)	BRASILEIRA	\N	PORTEIRO	\N	\N	\N	\N	\N	\N
2246	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	AGENTE ADMINISTRATIVO	\N	\N	\N	\N	\N	\N
2247	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	DIRETORA	\N	\N	\N	\N	\N	\N
2248	\N	\N	\N	\N	\N	\N	DIVORCIADO(A)	BRASILEIRA	\N	VICE DIRETORA	\N	\N	\N	\N	\N	\N
2249	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	AGENTE DE SERVICOS GERAIS	\N	\N	\N	\N	\N	\N
2250	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	AGENTE ADMINISTRATIVO	\N	\N	\N	\N	\N	\N
2251	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	AGENTE ADMINISTRATIVO	\N	\N	\N	\N	\N	\N
2252	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	AGENTE DE SERVICOS GERAIS	\N	\N	\N	\N	\N	\N
2253	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	MERENDEIRA	\N	\N	\N	\N	\N	\N
2254	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	MERENDEIRA	\N	\N	\N	\N	\N	\N
2255	\N	\N	\N	\N	\N	\N	DIVORCIADO(A)	BRASILEIRA	\N	AUXILIAR ADMINISTRATIVO	\N	\N	\N	\N	\N	\N
2256	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PORTEIRO	\N	\N	\N	\N	\N	\N
2257	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	AGENTE DE SERVICOS GERAIS	\N	\N	\N	\N	\N	\N
2258	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	AGENTE DE SERVICOS GERAIS	\N	\N	\N	\N	\N	\N
2259	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	AGENTE DE SERVICOS GERAIS	\N	\N	\N	\N	\N	\N
2260	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	COORDENADORA DE DISCIPLINA	\N	\N	\N	\N	\N	\N
2261	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	MERENDEIRA	\N	\N	\N	\N	\N	\N
2262	\N	\N	\N	\N	\N	\N	DIVORCIADO(A)	BRASILEIRA	\N	AUXILIAR DE SECRETARIA	\N	\N	\N	\N	\N	\N
2263	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	COORDENADORA PEDAGOGICA	\N	\N	\N	\N	\N	\N
2264	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	TECNICA OPERACIONAL	\N	\N	\N	\N	\N	\N
2266	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	VIGIA	\N	\N	\N	\N	\N	\N
2267	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	AGENTE ADMINISTRATIVO	\N	\N	\N	\N	\N	\N
2268	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	VIGIA	\N	\N	\N	\N	\N	\N
2269	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	AGENTE DE SERVICOS GERAIS	\N	\N	\N	\N	\N	\N
2270	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	AGENTE ADMINISTRATIVO	\N	\N	\N	\N	\N	\N
2271	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	VIGIA	\N	\N	\N	\N	\N	\N
2272	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	PORTEIRO	\N	\N	\N	\N	\N	\N
2273	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	INTERPRETE	\N	\N	\N	\N	\N	\N
2274	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	MERENDEIRA	\N	\N	\N	\N	\N	\N
2275	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	COORDENADORA PEDAGOGICA	\N	\N	\N	\N	\N	\N
2276	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	MERENDEIRA	\N	\N	\N	\N	\N	\N
2277	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	MERENDEIRA	\N	\N	\N	\N	\N	\N
2278	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	MERENDEIRA	\N	\N	\N	\N	\N	\N
2279	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2052	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2054	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2055	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2056	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2058	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2059	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2060	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2061	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2062	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2280	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	DIRETOR	\N	\N	\N	\N	\N	\N
2281	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	VICE DIRETORA	\N	\N	\N	\N	\N	\N
2282	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	SECRETARIA	\N	\N	\N	\N	\N	\N
2283	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	AGENTE ADMINISTRATIVO	\N	\N	\N	\N	\N	\N
2284	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	MERENDEIRA	\N	\N	\N	\N	\N	\N
2285	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	AUXILIAR DE SERVICOS GERAIS	\N	\N	\N	\N	\N	\N
2286	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	AUXILIAR DE SERVICOS GERAIS	\N	\N	\N	\N	\N	\N
2265	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	AGENTE DE SERVICOS GERAIS	\N	\N	\N	\N	\N	\N
2304	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	VIGIA	\N	\N	\N	\N	\N	\N
2305	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	NUTRICIONISTA	\N	\N	\N	\N	\N	\N
2306	\N	\N	\N	\N	\N	\N	SOLTEIRO	BRASILEIRA	\N	DIRETOR	\N	\N	\N	\N	\N	\N
2307	\N	\N	\N	\N	\N	\N	SOLTEIRO	BRASILEIRA	\N	AUXILIAR DE SERVICO GERAIS 	\N	\N	\N	\N	\N	\N
2308	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	VIGIA	\N	\N	\N	\N	\N	\N
2309	\N	\N	\N	\N	\N	\N	SOLTEIRO	BRASILEIRA	\N	AGENTE ADMINISTRATIVO	\N	\N	\N	\N	\N	\N
1892	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1893	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1894	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1895	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1896	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1897	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1898	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1899	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1900	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1901	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1902	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1903	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1904	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1905	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1906	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1907	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1908	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1909	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1910	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1911	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1912	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1913	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1914	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1915	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1916	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1917	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1918	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1919	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1920	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1921	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1922	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1923	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1924	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1925	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1926	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1927	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1928	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1929	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1930	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1931	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1932	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1933	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1934	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1935	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1936	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1937	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1938	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1939	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1940	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1941	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1942	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1943	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1944	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1945	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1946	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1947	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1948	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1949	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1950	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1951	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1952	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1953	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1954	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1955	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1956	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1957	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1958	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1959	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1569	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1570	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1571	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1572	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1573	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1574	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1575	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1576	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1577	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1578	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1579	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1580	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1581	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1582	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1583	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1584	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1585	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1586	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1587	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1588	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1589	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1590	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1591	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1592	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1593	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1594	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1595	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1596	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1597	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1598	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1599	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1600	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1601	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1602	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1603	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1604	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1605	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1606	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1607	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1608	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1609	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1610	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1611	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1612	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1613	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1614	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1615	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1616	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1617	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1618	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1619	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1620	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1621	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1622	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1623	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1624	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1625	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1626	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1627	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1628	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1629	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1630	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1631	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1632	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1633	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1634	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1635	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1636	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1637	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1638	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1639	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1640	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1641	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1642	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1643	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1644	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1645	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1646	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1647	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1648	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1649	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1650	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1651	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1652	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1653	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1654	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1655	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1656	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1657	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1658	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1659	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1660	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1661	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1662	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1663	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1664	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1665	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1666	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1667	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1668	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1669	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1670	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1671	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1672	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1673	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1674	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1675	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1676	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1677	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1678	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1679	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1680	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1681	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1682	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1683	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1684	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1685	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1686	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1687	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1688	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1689	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1690	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1691	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1692	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1693	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1694	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1695	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1696	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1697	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1698	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1699	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1700	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1701	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1702	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1703	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1704	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1705	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1706	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1707	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1708	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1709	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1710	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1711	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1712	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1713	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1714	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1715	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1716	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1717	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1718	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1719	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1720	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1721	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1722	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1723	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1724	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1725	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1726	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1727	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1728	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1729	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1730	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1731	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1732	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1733	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1734	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1735	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1736	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1737	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1738	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1739	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1740	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1741	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1742	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1743	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1744	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1745	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1746	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1747	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1748	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1749	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1750	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1751	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1752	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1753	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1754	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1755	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1756	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1757	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1758	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1759	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1760	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1761	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1762	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1763	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1764	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1765	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1766	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1767	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1768	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1769	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1770	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1771	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1772	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2330	\N	\N	\N	\N	\N	\N	SOLTEIRO	BRASILEIRA	\N	VIGIA	\N	\N	\N	\N	\N	\N
2289	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2290	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2291	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2292	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2293	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2294	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2331	\N	\N	\N	\N	\N	\N	SOLTEIRO	BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2295	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	COLABORADOR DE MATRICULA	\N	\N	\N	\N	\N	\N
2296	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	VICE DIRETORA	\N	\N	\N	\N	\N	\N
2297	\N	\N	\N	\N	\N	\N	DIVORCIADO(A)	BRASILEIRA	\N	COORDENADORA	\N	\N	\N	\N	\N	\N
2332	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2316	\N	\N	\N	\N	\N	\N	SOLTEIRO	BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2317	\N	\N	\N	\N	\N	\N	CASADO	BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2318	\N	\N	\N	\N	\N	\N	VIUVO	BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2319	\N	\N	\N	\N	\N	\N	CASADO	BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2320	\N	\N	\N	\N	\N	\N	CASADO	BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2085	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2086	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2087	\N	\N	\N	\N	\N	\N	DIVORCIADA	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2088	\N	\N	\N	\N	\N	\N	SOLTEIRA	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2089	\N	\N	\N	\N	\N	\N	SOLTEIRA	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2090	\N	\N	\N	\N	\N	\N	SOLTEIRA	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2091	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2092	\N	\N	\N	\N	\N	\N	VIUVA	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2093	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2094	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2095	\N	\N	\N	\N	\N	\N	DIVORCIADO	BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2096	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2097	\N	\N	\N	\N	\N	\N	SOLTEIRO	BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2099	\N	\N	\N	\N	\N	\N	DIVORCIADA	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2100	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2101	\N	\N	\N	\N	\N	\N	SOLTEIRO	BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2102	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2103	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2104	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2105	\N	\N	\N	\N	\N	\N	SOLTEIRA	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2106	\N	\N	\N	\N	\N	\N	DIVORCIADA	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2107	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2108	\N	\N	\N	\N	\N	\N	SOLTEIRO	BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2109	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2110	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2111	\N	\N	\N	\N	\N	\N	SOLTEIRA	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2112	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2113	\N	\N	\N	\N	\N	\N	SOLTEIRA	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2114	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2115	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2116	\N	\N	\N	\N	\N	\N	SOLTEIRA	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2117	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2118	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2119	\N	\N	\N	\N	\N	\N	SOLTEIRA	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2120	\N	\N	\N	\N	\N	\N	SOLTEIRO	BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2121	\N	\N	\N	\N	\N	\N	SOLTEIRO	BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2122	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2123	\N	\N	\N	\N	\N	\N	SOLTEIRA	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2124	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2125	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2126	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2129	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2130	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2131	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2132	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2133	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
1773	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1774	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1775	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2098	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
1776	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1777	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1778	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1779	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1780	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1781	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1782	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1783	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1784	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1785	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1786	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1787	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1788	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1789	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1790	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1791	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1792	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1793	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1794	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1795	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1796	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1797	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1798	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1799	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1800	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1801	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1802	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1803	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1804	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1805	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1806	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1807	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1862	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1863	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1864	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1865	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1866	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1867	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1868	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1869	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1870	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1871	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1872	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1873	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1874	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1875	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1876	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1877	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1878	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1879	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1880	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1881	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1882	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1883	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1884	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1885	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1886	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1887	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1888	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1889	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1890	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1891	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1960	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1961	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1962	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1963	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1964	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1965	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1966	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1967	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1968	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1969	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1970	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1971	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1972	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1973	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1974	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1975	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1976	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1977	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1978	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1979	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1980	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1981	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1982	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1983	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1984	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1985	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1986	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1987	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1988	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1989	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1990	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1991	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1992	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1993	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1994	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1995	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1996	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1997	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1998	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1999	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2000	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2001	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2002	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2003	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2004	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2005	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2006	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2007	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2008	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2009	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2010	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2011	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2012	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2013	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2014	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2015	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2016	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2017	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2018	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2019	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2020	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2021	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2022	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2023	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2024	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2025	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2026	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2027	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2028	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2029	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2030	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2031	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2032	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2033	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2034	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2035	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2036	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2037	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2038	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2039	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2040	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2041	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2042	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2043	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2044	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2045	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	\N	\N	\N	\N	0000000	\N	\N	\N	\N
761	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
762	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
763	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
764	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
765	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
766	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
767	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
768	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
769	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
770	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
771	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
772	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
773	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
774	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
775	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
776	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
777	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
778	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
779	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
780	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
781	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
782	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
783	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
784	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
785	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
786	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
787	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
788	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
789	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
790	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
791	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
792	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
793	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
794	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
795	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
796	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
797	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
798	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
799	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
800	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
801	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
802	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
803	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
804	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
805	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
806	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
807	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
808	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
809	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
810	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
811	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
812	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
813	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
814	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
815	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
816	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
817	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
818	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
819	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
820	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
821	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
822	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
823	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
824	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
825	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
826	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
827	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
828	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
829	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
830	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
831	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
832	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
833	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
834	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
835	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
836	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
837	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
838	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
839	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
840	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
841	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
842	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
843	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
844	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
845	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
846	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
847	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
848	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
849	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
850	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
851	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
852	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
853	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
854	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
855	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
856	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
857	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
858	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
859	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
860	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
861	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
862	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
863	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
864	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
865	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
866	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
867	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
868	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
869	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
870	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
871	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
872	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
873	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
874	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
875	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
876	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
877	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
878	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
879	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
880	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
881	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
882	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
883	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
884	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
885	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
886	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
887	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
888	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
889	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
890	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
891	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
892	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
893	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
894	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
895	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
896	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
897	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
898	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
899	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
900	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
901	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
902	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
903	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
904	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
905	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
906	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
907	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
908	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
909	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
910	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
911	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
912	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
913	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
914	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
915	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
916	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
917	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
918	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
919	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
920	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
921	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
922	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
923	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
924	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
925	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
926	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
927	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
928	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
929	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
930	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
931	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
932	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
933	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
934	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
935	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
936	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
937	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
938	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
939	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
940	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
941	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
942	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
943	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
944	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
945	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
946	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
947	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
948	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
949	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
950	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
951	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
952	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
953	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
954	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
955	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
956	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
957	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
958	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
959	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
960	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
961	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
962	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
963	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
964	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
965	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
966	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
967	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
968	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
969	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
970	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
971	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
972	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
973	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
974	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
975	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
976	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
977	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
978	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
979	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
980	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
981	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
982	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
983	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
984	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
985	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
986	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
988	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
989	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
990	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
991	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
992	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
993	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
994	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
995	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
996	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
997	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
998	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
999	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1000	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1001	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1002	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1003	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1004	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1005	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1006	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1007	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1008	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1009	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1010	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1011	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1012	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1013	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1014	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1015	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1016	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1017	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1018	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1019	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1020	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1021	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1022	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1023	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1024	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1025	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1026	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1027	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1028	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1029	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1030	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1031	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1032	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1033	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1034	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1035	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1036	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1037	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1038	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1039	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1040	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1041	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1042	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1043	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1044	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1045	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1046	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1047	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1048	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1049	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1050	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1051	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1052	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1053	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1054	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1055	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1056	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1057	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1058	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1059	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1060	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1061	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1062	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1063	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1064	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1065	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1066	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1067	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1068	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1069	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1070	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1071	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1072	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1073	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1074	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1075	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1076	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1077	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1078	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1079	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1080	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1081	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1082	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1083	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1084	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1085	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1086	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1087	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1088	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1089	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1090	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1091	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1092	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1093	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1094	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1095	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1096	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1097	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1098	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1099	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1100	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1101	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1102	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1103	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1104	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1105	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1106	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1107	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1108	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1109	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1110	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1111	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1112	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1113	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1114	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1115	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1116	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1117	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1118	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1119	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1120	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1121	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1122	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1123	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1124	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1125	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1126	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1127	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1128	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1129	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1130	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1131	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1132	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1133	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1134	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1135	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1136	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1137	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1138	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1139	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1140	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1141	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1142	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1143	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1144	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1145	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1146	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1147	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1148	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1149	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1150	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1151	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1152	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1153	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1154	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1155	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1156	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1157	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1158	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1159	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1160	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1161	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1162	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1163	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1164	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1165	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1166	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1167	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1168	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1169	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1170	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1171	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1172	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1173	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1174	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1175	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1176	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1177	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1178	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1179	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1180	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1181	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1182	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1183	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1184	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1185	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1186	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1187	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1188	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1189	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1190	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1191	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1192	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1193	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1194	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1195	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1196	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1197	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1198	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1199	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1200	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1201	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1202	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1203	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1204	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1205	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1206	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1207	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1208	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1209	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1210	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1211	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1212	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1213	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1214	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1215	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1216	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1217	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1218	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1219	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1220	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1221	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1222	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1223	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1224	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1225	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1226	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1227	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1228	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1229	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1230	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1231	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1232	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1233	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1234	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1235	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1236	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1237	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1238	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1239	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1240	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1241	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1242	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1243	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1244	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1245	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1246	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1247	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1248	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1249	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1250	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1251	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1252	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1253	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1254	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1255	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1256	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1257	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1258	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1259	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1260	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1261	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1262	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1263	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1264	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1265	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1266	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1267	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1268	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1269	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1270	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1271	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1272	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1273	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1274	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1275	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1276	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1277	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1278	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1279	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1280	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1281	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1282	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1283	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1284	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1285	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1286	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1287	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1288	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1289	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1290	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1291	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1292	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1293	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1294	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1295	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1296	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1297	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1298	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1299	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1300	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1301	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1302	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1303	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1304	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1305	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1306	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1307	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1308	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1309	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1310	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1311	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1312	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1313	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1314	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1315	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1316	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1317	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1318	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1319	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1320	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1321	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1322	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1323	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1324	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1325	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1326	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1327	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1328	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1329	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1330	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1331	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1332	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1333	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1334	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1335	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1336	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1337	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1338	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1339	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1340	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1341	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1342	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1343	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1344	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1345	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1346	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1347	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1348	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1349	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1350	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1351	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1352	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1353	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1354	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1355	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1356	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1357	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1358	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1359	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1360	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1361	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1362	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1363	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1364	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1365	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1366	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1367	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1368	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1369	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1370	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1371	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1372	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1373	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1374	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1375	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1376	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1377	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1378	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1379	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1380	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1381	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1382	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1383	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1384	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1385	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1386	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1387	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1388	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1389	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1390	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1391	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1392	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1393	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1394	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1395	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1396	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1397	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1398	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1399	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1400	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1401	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1402	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1403	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1404	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1405	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1406	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1407	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1408	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1409	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1410	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1411	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1412	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1413	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1414	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1415	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1416	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1417	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1418	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1419	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1420	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1421	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1422	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1423	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1424	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1425	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1426	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1427	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1428	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1429	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1430	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1431	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1432	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1433	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1434	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1435	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1436	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1437	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1438	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1439	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1440	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1441	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1442	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1443	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1444	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1445	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1446	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1447	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1448	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1449	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1450	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1451	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1452	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1453	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1454	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1455	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1456	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1457	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1458	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1459	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1460	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1461	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1462	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1463	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1464	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1465	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1466	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1467	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1468	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1469	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1470	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1471	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1472	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1473	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1474	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1475	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1476	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1477	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1478	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1479	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1480	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1481	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1482	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1483	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1484	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1485	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1486	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1487	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1488	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1489	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1490	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1491	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1492	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1493	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1494	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1495	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1496	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1497	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1498	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1499	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1500	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1501	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1502	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1503	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1504	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1505	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1506	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1507	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1508	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1509	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1510	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1511	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1512	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1513	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1514	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1515	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1516	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1517	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1518	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1519	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1520	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1521	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1522	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1523	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1524	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1525	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1526	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1527	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1528	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1529	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1530	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1531	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1532	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1533	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1534	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1535	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1536	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1537	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1538	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1539	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1540	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1541	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1542	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1543	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1544	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1545	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1546	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1547	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1548	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1549	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1550	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1551	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1552	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1553	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1554	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1555	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1556	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1557	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1558	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1559	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1560	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1561	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1562	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1563	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1564	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1565	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1566	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1567	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
1568	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	\N	\N	\N	\N	\N
2134	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2135	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2136	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2137	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2138	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2139	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2140	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2141	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2142	\N	\N	\N	\N	\N	\N		BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
11	\N	\N	\N	\N	\N	\N	Solteiro	Brasileira	\N	AAAAA	\N	\N	\N	\N	\N	\N
2403	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	porteiro	\N	\N	\N	\N	\N	\N
2500	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2502	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2503	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2582	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2596	\N	\N	\N	\N	\N	\N	CASADO(A)	brasileiro	\N	professor	\N	\N	\N	\N	\N	\N
2599	\N	\N	\N	\N	\N	\N	DIVORCIADO(A)	brasileiro	\N	teste	\N	\N	\N	\N	\N	\N
2601	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2605	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
2615	\N	\N	\N	\N	\N	\N	null	sdf	\N	sdf	\N	\N	\N	\N	\N	\N
2619	\N	\N	\N	\N	\N	\N	DIVORCIADO(A)	wewer	\N	werwer	\N	\N	\N	\N	\N	\N
2640	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	wer	\N	wer	\N	\N	\N	\N	\N	\N
2645	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	123	\N	123	\N	\N	\N	\N	\N	\N
2662	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	sdf	\N	sdf	\N	\N	\N	\N	\N	\N
2697	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2698	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2699	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2700	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2701	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2702	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2703	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2704	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2705	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2706	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2707	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2708	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2709	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2683	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2710	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2711	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2712	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2695	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2696	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2713	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2714	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2715	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2716	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2717	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2718	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2719	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2720	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2721	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2723	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2724	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2725	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2726	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2727	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2728	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2729	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2730	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2733	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2734	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2735	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2736	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2737	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2738	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2739	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2740	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2741	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2742	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2743	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2744	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2745	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2746	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2747	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2748	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2749	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2750	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2751	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2752	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2753	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2754	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2755	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2757	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2758	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2759	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2760	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2761	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2762	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2763	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2764	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2765	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2766	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2767	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2768	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2769	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2770	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2772	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2773	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2774	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2775	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2776	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2777	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2778	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2779	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2780	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2781	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2782	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2783	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2785	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2786	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2788	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2789	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2790	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2792	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2793	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2795	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2797	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2798	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2799	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2800	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2801	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2803	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2804	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2805	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2806	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2807	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2808	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2809	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2810	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2812	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2722	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2814	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2815	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2816	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2817	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2818	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2819	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2820	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2821	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2822	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2823	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2824	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2825	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2826	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2827	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2828	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2829	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2830	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2831	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2832	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2833	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2834	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2835	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2836	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2837	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2838	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2839	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2840	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2841	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2842	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2843	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2844	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2845	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2846	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2847	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2848	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2849	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2850	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2851	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2852	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2853	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2854	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2855	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2856	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2857	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2858	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2859	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2860	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2861	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2862	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2863	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2864	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2865	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2866	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2867	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2868	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2870	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2871	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2872	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2873	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2874	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2875	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2876	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2877	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2878	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2879	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2880	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2881	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2882	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2883	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2884	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2885	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2886	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2887	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2888	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2889	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2890	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2891	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2892	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2893	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2894	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2895	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2896	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2897	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2898	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2899	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2900	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2901	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2902	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2903	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2904	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2905	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2906	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2907	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2908	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2909	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2910	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2911	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2912	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2914	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2915	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2916	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2917	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2918	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2919	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2920	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2921	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2922	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2923	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2924	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2925	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2926	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2930	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2931	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2932	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2933	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2128	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
987	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N		\N	123456	\N	\N	\N	\N
2937	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2938	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2939	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2940	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	PROFESSORA	\N	\N	\N	\N	\N	\N
2941	\N	\N	\N	\N	\N	\N	CASADO(A)	Brasileiro	\N	\N	\N	\N	\N	\N	\N	\N
2942	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	Brasil	\N	\N	\N	\N	\N	\N	\N	\N
2944	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2945	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2946	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2947	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2948	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
2949	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
2950	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASIL	\N	\N	\N	\N	\N	\N	\N	\N
3089	\N	\N	\N	\N	\N	\N	PROFESSOR(A),SOLTEIRO(A)	aaaa	\N	aaaa	\N	\N	\N	\N	\N	\N
3091	\N	\N	\N	\N	\N	\N	CASADO(A)	aaa	\N	fdfd	\N	\N	\N	\N	\N	\N
3093	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	aaa	\N	aaaa	\N	\N	\N	\N	\N	\N
3104	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	fdfd	\N	fdfd	\N	\N	\N	\N	\N	\N
3105	\N	\N	\N	\N	\N	\N	DIVORCIADO(A)	fff	\N	ffff	\N	\N	\N	\N	\N	\N
3113	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	defdf	\N	fdfdfd	\N	\N	\N	\N	\N	\N
3114	\N	\N	\N	\N	\N	\N	CASADO(A)	4343	\N	434343	\N	\N	\N	\N	\N	\N
3115	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	gfgf	\N	gfgf	\N	\N	\N	\N	\N	\N
3118	\N	\N	\N	\N	\N	\N	CASADO(A)	wer	\N	\N	\N	\N	\N	\N	\N	\N
3119	\N	\N	\N	\N	\N	\N	DIVORCIADO(A)	111	\N	\N	\N	\N	\N	\N	\N	\N
3120	\N	\N	\N	\N	\N	\N	DIVORCIADO(A)	werwe	\N	\N	\N	\N	\N	\N	\N	\N
3121	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	dde	\N	\N	\N	\N	\N	\N	\N	\N
3122	\N	\N	\N	\N	\N	\N	CASADO(A)	wer	\N	\N	\N	\N	\N	\N	\N	\N
3123	\N	\N	\N	\N	\N	\N	CASADO(A)	wer	\N	\N	\N	\N	\N	\N	\N	\N
3124	\N	\N	\N	\N	\N	\N	CASADO(A)	wer	\N	\N	\N	\N	\N	\N	\N	\N
3125	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	5	\N	\N	\N	\N	\N	\N	\N	\N
3126	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	5	\N	\N	\N	\N	\N	\N	\N	\N
3127	\N	\N	\N	\N	\N	\N	CASADO(A)	dfdf	\N	\N	\N	\N	\N	\N	\N	\N
3128	\N	\N	\N	\N	\N	\N	CASADO(A)	qwe	\N	\N	\N	\N	\N	\N	\N	\N
3129	\N	\N	\N	\N	\N	\N	DIVORCIADO(A)	dfgsdgf	\N	\N	\N	\N	\N	\N	\N	\N
3130	\N	\N	\N	\N	\N	\N	CASADO(A)	dfg	\N	\N	\N	\N	\N	\N	\N	\N
3131	\N	\N	\N	\N	\N	\N	DIVORCIADO(A)	sdf	\N	\N	\N	\N	\N	\N	\N	\N
3132	\N	\N	\N	\N	\N	\N	DIVORCIADO(A)	werwe	\N	\N	\N	\N	\N	\N	\N	\N
3133	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3134	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
3135	\N	\N	\N	\N	\N	\N	DIVORCIADO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
3137	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3138	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3139	\N	\N	\N	\N	\N	\N	DIVORCIADO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3140	\N	\N	\N	\N	\N	\N	CASADO(A)	pro	\N	\N	\N	\N	\N	\N	\N	\N
3141	\N	\N	\N	\N	\N	\N	CASADO(A)	pro	\N	\N	\N	\N	\N	\N	\N	\N
3142	\N	\N	\N	\N	\N	\N	CASADO(A)	pro	\N	\N	\N	\N	\N	\N	\N	\N
3143	\N	\N	\N	\N	\N	\N	CASADO(A)	pro	\N	\N	\N	\N	\N	\N	\N	\N
3144	\N	\N	\N	\N	\N	\N	CASADO(A)	pro	\N	\N	\N	\N	\N	\N	\N	\N
3145	\N	\N	\N	\N	\N	\N	CASADO(A)	pro	\N	\N	\N	\N	\N	\N	\N	\N
3146	\N	\N	\N	\N	\N	\N	CASADO(A)	pro	\N	\N	\N	\N	\N	\N	\N	\N
3147	\N	\N	\N	\N	\N	\N	CASADO(A)	wsrtf	\N	\N	\N	\N	\N	\N	\N	\N
3148	\N	\N	\N	\N	\N	\N	CASADO(A)	wsrtf	\N	\N	\N	\N	\N	\N	\N	\N
3149	\N	\N	\N	\N	\N	\N	VIÚVO(A)	btrs	\N	\N	\N	\N	\N	\N	\N	\N
3150	\N	\N	\N	\N	\N	\N	VIÚVO(A)	btrs	\N	\N	\N	\N	\N	\N	\N	\N
3151	\N	\N	\N	\N	\N	\N	VIÚVO(A)	btrs	\N	\N	\N	\N	\N	\N	\N	\N
3152	\N	\N	\N	\N	\N	\N	CASADO(A)	werf	\N	\N	\N	\N	\N	\N	\N	\N
3153	\N	\N	\N	\N	\N	\N	CASADO(A)	jhvg	\N	\N	\N	\N	\N	\N	\N	\N
3154	\N	\N	\N	\N	\N	\N	CASADO(A)	wert	\N	\N	\N	\N	\N	\N	\N	\N
3155	\N	\N	\N	\N	\N	\N	CASADO(A)	wert	\N	\N	\N	\N	\N	\N	\N	\N
3156	\N	\N	\N	\N	\N	\N	CASADO(A)	wert	\N	\N	\N	\N	\N	\N	\N	\N
3157	\N	\N	\N	\N	\N	\N	CASADO(A)	qwe	\N	\N	\N	\N	\N	\N	\N	\N
3158	\N	\N	\N	\N	\N	\N	CASADO(A)	qwe	\N	\N	\N	\N	\N	\N	\N	\N
3159	\N	\N	\N	\N	\N	\N	CASADO(A)	qwe	\N	\N	\N	\N	\N	\N	\N	\N
3160	\N	\N	\N	\N	\N	\N	CASADO(A)	qwe	\N	\N	\N	\N	\N	\N	\N	\N
3161	\N	\N	\N	\N	\N	\N	CASADO(A)	qwe	\N	\N	\N	\N	\N	\N	\N	\N
3162	\N	\N	\N	\N	\N	\N	DIVORCIADO(A)	asdf	\N	\N	\N	\N	\N	\N	\N	\N
3163	\N	\N	\N	\N	\N	\N	CASADO(A)	dsf	\N	\N	\N	\N	\N	\N	\N	\N
3164	\N	\N	\N	\N	\N	\N	CASADO(A)	dsf	\N	\N	\N	\N	\N	\N	\N	\N
3165	\N	\N	\N	\N	\N	\N	CASADO(A)	dsf	\N	\N	\N	\N	\N	\N	\N	\N
3166	\N	\N	\N	\N	\N	\N	CASADO(A)	dsf	\N	\N	\N	\N	\N	\N	\N	\N
3167	\N	\N	\N	\N	\N	\N	CASADO(A)	sed	\N	\N	\N	\N	\N	\N	\N	\N
3169	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
3170	\N	\N	\N	\N	\N	\N	CASADO(A)	brasileiro	\N	\N	\N	\N	\N	\N	\N	\N
3171	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3172	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
3173	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
3174	\N	\N	\N	\N	\N	\N	CASADO(A)	brasileiro	\N	\N	\N	\N	\N	\N	\N	\N
3175	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	ter	\N	\N	\N	\N	\N	\N	\N	\N
3176	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	ter	\N	\N	\N	\N	\N	\N	\N	\N
3177	\N	\N	\N	\N	\N	\N	CASADO(A)	sdfsdf	\N	\N	\N	\N	\N	\N	\N	\N
3181	\N	\N	\N	\N	\N	\N	DIVORCIADO(A)	sdfdd	\N	\N	\N	\N	\N	\N	\N	\N
3136	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
3219	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
3220	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
3221	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3222	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3223	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	aaaaaaaaa	\N	aaaaaaaa	\N	\N	\N	\N	\N	\N
3224	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3225	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3226	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3227	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3228	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3230	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3244	\N	\N	\N	\N	\N	\N	VIÚVO(A)	teste 25	\N	\N	\N	\N	\N	\N	\N	\N
3245	\N	\N	\N	\N	\N	\N	VIÚVO(A)	teste 25	\N	\N	\N	\N	\N	\N	\N	\N
3246	\N	\N	\N	\N	\N	\N	VIÚVO(A)	teste 25	\N	\N	\N	\N	\N	\N	\N	\N
3247	\N	\N	\N	\N	\N	\N	VIÚVO(A)	teste 25	\N	\N	\N	\N	\N	\N	\N	\N
3248	\N	\N	\N	\N	\N	\N	VIÚVO(A)	teste 25	\N	\N	\N	\N	\N	\N	\N	\N
3254	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3255	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3260	\N	\N	\N	\N	\N	\N	DIVORCIADO(A)	rrrrrrr	\N	rrrrrrr	\N	\N	\N	\N	\N	\N
3262	\N	\N	\N	\N	\N	\N	CASADO(A)	olo	\N	uiuiu	\N	\N	\N	\N	\N	\N
3263	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	trtrt	\N	jhjh	\N	\N	\N	\N	\N	\N
3264	\N	\N	\N	\N	\N	\N	CASADO(A)	opop	\N	ppp	\N	\N	\N	\N	\N	\N
3267	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	hfhf	\N	\N	\N	\N	\N	\N	\N	\N
3268	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
3269	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	bbbb	\N	pedreiro	\N	\N	\N	\N	\N	\N
3270	\N	\N	\N	\N	\N	\N	DIVORCIADO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3271	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	\N	\N	\N	\N	\N	\N	\N
3272	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3273	\N	\N	\N	\N	\N	\N	DIVORCIADO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3274	\N	\N	\N	\N	\N	\N	DIVORCIADO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3275	\N	\N	\N	\N	\N	\N	DIVORCIADO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3278	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	gghgjt	\N	\N	\N	\N	\N	\N	\N	\N
3281	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	gghgjt	\N	\N	\N	\N	\N	\N	\N	\N
3287	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3288	\N	\N	\N	\N	\N	\N	DIVORCIADO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3289	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3290	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3292	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3294	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3296	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3298	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3300	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3314	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3316	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	brasileiro	\N	\N	\N	\N	\N	\N	\N	\N
3319	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3321	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3323	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3325	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3327	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3329	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3331	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3332	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	gfgfgf	\N	\N	\N	\N	\N	\N	\N	\N
3333	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	fhff	\N	\N	\N	\N	\N	\N	\N	\N
3336	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	kpui	\N	\N	\N	\N	\N	\N	\N	\N
3345	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	bhhkgkhl	\N	\N	\N	\N	\N	\N	\N	\N
3346	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	brasiseira	\N	\N	\N	\N	\N	\N	\N	\N
3347	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3351	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3352	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3353	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3354	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRO	\N	\N	\N	\N	\N	\N	\N	\N
3355	\N	\N	\N	\N	\N	\N	CASADO(A)	2e2	\N	edd	\N	\N	\N	\N	\N	\N
3356	\N	\N	\N	\N	\N	\N	CASADO(A)	BRASILEIRO	\N	PROFESSOR	\N	\N	\N	\N	\N	\N
3357	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	professor	\N	professor	\N	\N	\N	\N	\N	\N
3358	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	BRASILEIRA	\N	marteleiro	\N	\N	\N	\N	\N	\N
3359	\N	\N	\N	\N	\N	\N	SOLTEIRO(A)	brasileiro	\N	gerente de processos	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 4511 (class 0 OID 0)
-- Dependencies: 340
-- Name: cidadao_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

SELECT pg_catalog.setval('cidadao_id_seq', 3359, true);


--
-- TOC entry 4105 (class 0 OID 25235)
-- Dependencies: 341
-- Data for Name: contato; Type: TABLE DATA; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

COPY contato (id, pessoa_id, tipo_contato_id, contato) FROM stdin;
\.


--
-- TOC entry 4512 (class 0 OID 0)
-- Dependencies: 342
-- Name: contato_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

SELECT pg_catalog.setval('contato_id_seq', 1, false);


--
-- TOC entry 4107 (class 0 OID 25243)
-- Dependencies: 343
-- Data for Name: contrato; Type: TABLE DATA; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

COPY contrato (id, organismo_id, fornecedor_id, numero_contrato, vigencia_contrato, data_inicio, data_termino, valor_limite, produto, saldo_restante, aditivo_vigente) FROM stdin;
\.


--
-- TOC entry 4513 (class 0 OID 0)
-- Dependencies: 344
-- Name: contrato_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

SELECT pg_catalog.setval('contrato_id_seq', 1, false);


--
-- TOC entry 4109 (class 0 OID 25251)
-- Dependencies: 345
-- Data for Name: dados_bancarios; Type: TABLE DATA; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

COPY dados_bancarios (id, pessoa_id, banco_agencia, banco_conta, banco_nome, banco_operacao) FROM stdin;
\.


--
-- TOC entry 4514 (class 0 OID 0)
-- Dependencies: 346
-- Name: dados_bancarios_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

SELECT pg_catalog.setval('dados_bancarios_id_seq', 1, false);


--
-- TOC entry 4111 (class 0 OID 25259)
-- Dependencies: 347
-- Data for Name: detem_propriedade; Type: TABLE DATA; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

COPY detem_propriedade (id, cidadao_id, unidade_edificada_id, data_inicio, data_termino) FROM stdin;
\.


--
-- TOC entry 4515 (class 0 OID 0)
-- Dependencies: 348
-- Name: detem_propriedade_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

SELECT pg_catalog.setval('detem_propriedade_id_seq', 1, false);


--
-- TOC entry 4113 (class 0 OID 25264)
-- Dependencies: 349
-- Data for Name: editora; Type: TABLE DATA; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

COPY editora (id, reservado) FROM stdin;
\.


--
-- TOC entry 4516 (class 0 OID 0)
-- Dependencies: 350
-- Name: editora_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

SELECT pg_catalog.setval('editora_id_seq', 1, false);


--
-- TOC entry 4115 (class 0 OID 25272)
-- Dependencies: 351
-- Data for Name: escola; Type: TABLE DATA; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

COPY escola (id, inep_da_escola, latitude, longitude) FROM stdin;
10	24248207	\N	\N
14	24083585	\N	\N
15	24054461	\N	\N
16	24079480	\N	\N
18	24073954	\N	\N
20	24071960	\N	\N
22	24054526	\N	\N
23	24069957	\N	\N
25	24069850	\N	\N
28	24068446	\N	\N
33	24065005	\N	\N
40	24055026	\N	\N
42	24054798	\N	\N
48	24054747	\N	\N
50	24054658	\N	\N
29	24068438	\N	\N
37	24064050	\N	\N
11	24054186	\N	\N
7	24054437	\N	\N
41	24054674	\N	\N
32	24054623	\N	\N
36	24054631	\N	\N
38	24054640	\N	\N
45	24054704	\N	\N
27	24054550	\N	\N
43	24054682	\N	\N
47	24054712	\N	\N
49	24054739	\N	\N
39	24055190	\N	\N
30	24054607	\N	\N
9	24068420	\N	\N
34	24054615	\N	\N
17	24054470	\N	\N
21	24071480	\N	\N
19	24054496	\N	\N
46	24054763	\N	\N
44	24054771	\N	\N
31	24065340	\N	\N
35	24064360	\N	\N
24	24054534	\N	\N
26	24054542	\N	\N
8	24054445	\N	\N
\.


--
-- TOC entry 4517 (class 0 OID 0)
-- Dependencies: 352
-- Name: escola_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

SELECT pg_catalog.setval('escola_id_seq', 3359, false);


--
-- TOC entry 4117 (class 0 OID 25280)
-- Dependencies: 353
-- Data for Name: fornecedor; Type: TABLE DATA; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

COPY fornecedor (id, reservado) FROM stdin;
\.


--
-- TOC entry 4518 (class 0 OID 0)
-- Dependencies: 354
-- Name: fornecedor_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

SELECT pg_catalog.setval('fornecedor_id_seq', 3359, false);


--
-- TOC entry 4119 (class 0 OID 25288)
-- Dependencies: 355
-- Data for Name: funcionario; Type: TABLE DATA; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

COPY funcionario (id, carga_horaria, data_de_admissao, data_de_demissao, inss, matricula, ativo) FROM stdin;
1	20h	2013-01-02	\N	12345	0001	\N
2054	120	1900-01-05	\N	\N	9798	
2055	120	2003-07-14	\N	\N	9347	
2056	120	2003-07-14	\N	\N	9247	
2058	120	2003-06-18	\N	\N	9242	
2059	120	2012-03-01	\N	\N	11277	
2060	120	2006-02-20	\N	\N	9880	
2061	120	2003-07-30	\N	\N	9343	
2062	120	2012-03-01	\N	\N	11267	
2085	30	\N	\N	\N	5418	
2086	30	\N	\N	\N	9886	
2087	40	\N	\N	\N	5315	
2088	30	\N	\N	\N	5369	
2089	30	\N	\N	\N	1	
2090	30	\N	\N	\N	5413	
2091	30	\N	\N	\N	9404	
2092	30	\N	\N	\N	5398	
2093	30	\N	\N	\N	5712	
2094	30	\N	\N	\N	5353	
2095	30	\N	\N	\N	6084	
2096	30	\N	\N	\N	5391	
2097	10	\N	\N	\N	11239	
2098	30	\N	\N	\N	5430	
2099	30	\N	\N	\N	5813	
2100	30	\N	\N	\N	2	
2101		\N	\N	\N	3	
2102	21	\N	\N	\N	5360	
2103	30	\N	\N	\N	4	
2104	30	\N	\N	\N	11284	
2105	30	\N	\N	\N	5421	
2106		\N	\N	\N	5	
2107	30	\N	\N	\N	5917	
2108	40	\N	\N	\N	9661	
2109	30	\N	\N	\N	5397	
2110	30	\N	\N	\N	5776	
2111		\N	\N	\N	9809	
2112	30	\N	\N	\N	9408	
2113	30	\N	\N	\N	5957	
2114	30	\N	\N	\N	5554	
2115	30	\N	\N	\N	5367	
2116	30	\N	\N	\N	9277	
2117	12	\N	\N	\N	9622	
2118	30	\N	\N	\N	5389	
2119	30	\N	\N	\N	6527	
2120	30	\N	\N	\N	9691	
2121	30	\N	\N	\N	6024	
2122		\N	\N	\N	6	
2123	30	\N	\N	\N	9702	
2124	40	\N	\N	\N	9827	
2125	30	\N	\N	\N	5373	
2126	40	\N	\N	\N	5423	
2128	30	\N	\N	\N	5350	
2129	30	\N	\N	\N	5359	
2130	30	\N	\N	\N	5810	
2131	30	\N	\N	\N	152	
2132	30	\N	\N	\N	9613	
2133	30	\N	\N	\N	9528	
2134	30	\N	\N	\N	9276	
2135	30	\N	\N	\N	9882	
2136	12	\N	\N	\N	9646	
2137	15	\N	\N	\N	5399	
2138	30	\N	\N	\N	5899	
2139	30	\N	\N	\N	5414	
2140	30	\N	\N	\N	5910	
2141	30	\N	\N	\N	9398	
2142	40	\N	\N	\N	5349	
2245	40	\N	\N	\N	7	
2246	40	\N	\N	\N	5388	
2247		\N	\N	\N	10505	
2248		\N	\N	\N	10765	
2249	40	\N	\N	\N	9866	
2250	40	\N	\N	\N	5354	
2251	40	\N	\N	\N	5363	
2253	40	\N	\N	\N	9870	
2254	40	\N	\N	\N	9041	
2255	40	\N	\N	\N	7877	
2256	40	\N	\N	\N	2027	
2257	40	\N	\N	\N	5401	
2258	40	\N	\N	\N	5400	
2259	40	\N	\N	\N	9873	
2260	30	\N	\N	\N	5422	
2261	40	\N	\N	\N	9029	
2262		\N	\N	\N	5424	
2263	30	\N	\N	\N	11241	
2264	40	\N	\N	\N	8	
2265	40	\N	\N	\N	9164	
2266	40	\N	\N	\N	5378	
2267	40	\N	\N	\N	5383	
2268	40	\N	\N	\N	5022	
2269	40	\N	\N	\N	9	
2270	30	\N	\N	\N	5393	
2271	40	\N	\N	\N	9110	
2272	40	\N	\N	\N	10	
2273	30	\N	\N	\N	11	
2274	40	\N	\N	\N	5405	
2275	30	\N	\N	\N	11238	
2276	40	\N	\N	\N	12	
2277	40	\N	\N	\N	13	
2278	40	\N	\N	\N	9865	
2279	40	\N	\N	\N	14	
2280	160	\N	\N	\N	10440	
2281	160	\N	\N	\N	6846	
2282	160	2003-07-30	\N	\N	9512	
2283	160	2003-06-10	\N	\N	9112	
2284	160	2003-06-12	\N	\N	9120	
2285	160	2003-06-10	\N	\N	9118	
2286	160	\N	\N	\N	5733	
2289	INTEGRAL	2003-07-14	\N	\N	5327	
2290	INTEGRAL	1996-06-11	\N	\N	5923	
2291	INTEGRAL	1991-05-29	\N	\N	5442	
2292	INTEGRAL	1996-11-26	\N	\N	5913	
2293	INTEGRAL	2003-07-14	\N	\N	9307	
2294	INTEGRAL	2003-09-25	\N	\N	9617	
2295	INTEGRAL	2013-10-01	\N	\N		
2296	INTEGRAL	2014-02-12	\N	\N	12071	
2297	INTEGRAL	\N	\N	\N	1199	
2304	12/36	2013-03-01	\N	\N	1747	\r
2305	INTEGRAL	2014-01-24	\N	\N	9001	\r
2306	INTEGRAL	\N	\N	\N	6726	\r
2307	8	2013-03-01	\N	\N	1354	\r
2308	12/36	2014-01-15	\N	\N	9002	\r
2309		2003-06-10	\N	\N	4952	\r
2316	25	2014-02-04	\N	\N	9004	
2317	25	2014-03-07	\N	\N	9005	
2318	25	2014-04-01	\N	\N	9006	
2319	INTEGRAL	1996-07-19	\N	\N	5779	
2320	INTEGRAL	1991-03-10	\N	\N	6054	
2330	12/36	\N	\N	\N	9003	
2331	25	2014-03-06	\N	\N	9007	
2332	120	\N	\N	\N	5984	
2052	120	2014-03-13	\N	\N	5931	
11	60	\N	\N	\N	124	\N
2937	120	\N	\N	\N	11536	\N
2938	120	\N	\N	\N	11537	\N
2940	120	\N	\N	\N	0000	\N
3223	3333	\N	\N	\N	3333	\N
2252	150	\N	\N	\N	4879	
3260	333333	\N	\N	\N	3333333	\N
3262	8787	\N	\N	\N	8787878	\N
3263	6565	\N	\N	\N	6565	\N
3264	888	\N	\N	\N	8888	\N
3269	12	\N	\N	\N	ssdfss	\N
3355	3232	\N	\N	\N	333	\N
3356	140	\N	\N	\N	2225253336B	\N
3357	100	\N	\N	\N	22222b	\N
3358	20	\N	\N	\N	54181	\N
3359	25	\N	\N	\N	54585	\N
\.


--
-- TOC entry 4519 (class 0 OID 0)
-- Dependencies: 356
-- Name: funcionario_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

SELECT pg_catalog.setval('funcionario_id_seq', 3359, true);


--
-- TOC entry 4520 (class 0 OID 0)
-- Dependencies: 357
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

SELECT pg_catalog.setval('hibernate_sequence', 1, false);


--
-- TOC entry 4521 (class 0 OID 0)
-- Dependencies: 358
-- Name: identificacaoAluno; Type: SEQUENCE SET; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

SELECT pg_catalog.setval('"identificacaoAluno"', 1, false);


--
-- TOC entry 4123 (class 0 OID 25300)
-- Dependencies: 359
-- Data for Name: motorista; Type: TABLE DATA; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

COPY motorista (id, categoria, cnh, cnh_validade, data_de_emissao) FROM stdin;
\.


--
-- TOC entry 4522 (class 0 OID 0)
-- Dependencies: 360
-- Name: motorista_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

SELECT pg_catalog.setval('motorista_id_seq', 3359, false);


--
-- TOC entry 4125 (class 0 OID 25308)
-- Dependencies: 361
-- Data for Name: paciente; Type: TABLE DATA; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

COPY paciente (id, prontuario) FROM stdin;
\.


--
-- TOC entry 4523 (class 0 OID 0)
-- Dependencies: 362
-- Name: paciente_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

SELECT pg_catalog.setval('paciente_id_seq', 3359, false);


--
-- TOC entry 4127 (class 0 OID 25316)
-- Dependencies: 363
-- Data for Name: parentesco; Type: TABLE DATA; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

COPY parentesco (id, pessoa_fisica_id, parentesco, pessoa_id) FROM stdin;
3	3137	PAI	2306
4	3137	MÃE	2700
5	3138	PAI	2318
6	3138	MÃE	2331
7	3139	PAI	1808
8	3139	MÃE	2683
9	3140	PAI	2000
10	3140	MÃE	2735
11	3141	PAI	2000
12	3141	MÃE	2735
13	3142	PAI	2000
14	3142	MÃE	2735
15	3143	PAI	2000
16	3143	MÃE	2735
17	3144	PAI	2000
18	3144	MÃE	2735
19	3145	PAI	2000
20	3145	MÃE	2735
21	3146	PAI	2000
22	3146	MÃE	2735
23	3147	PAI	2004
24	3147	MÃE	2331
25	3148	PAI	2004
26	3148	MÃE	2331
27	3149	PAI	2708
28	3149	MÃE	2331
29	3150	PAI	2708
30	3150	MÃE	2331
31	3151	PAI	2708
32	3151	MÃE	2331
33	3152	PAI	2318
34	3152	MÃE	2705
35	3153	PAI	2306
36	3153	MÃE	2705
37	3154	PAI	2868
38	3154	MÃE	2705
39	3155	PAI	2868
40	3155	MÃE	2705
41	3156	PAI	2868
42	3156	MÃE	2705
43	3157	PAI	2004
44	3157	MÃE	2705
45	3158	PAI	2004
46	3158	MÃE	2705
47	3159	PAI	2004
48	3159	MÃE	2705
49	3160	PAI	2004
50	3160	MÃE	2705
51	3161	PAI	2004
52	3161	MÃE	2705
53	3162	PAI	2708
54	3162	MÃE	1915
55	3163	PAI	2886
56	3163	MÃE	2933
57	3164	PAI	2886
58	3164	MÃE	2933
59	3165	PAI	2886
60	3165	MÃE	2933
61	3166	PAI	2886
62	3166	MÃE	2933
63	3167	PAI	2868
64	3167	MÃE	2331
67	3169	PAI	2884
68	3169	MÃE	2331
69	3170	PAI	2000
70	3170	MÃE	2294
71	3171	PAI	2500
72	3171	MÃE	2128
73	3172	PAI	2930
74	3172	MÃE	2279
75	3173	PAI	2930
76	3173	MÃE	2331
77	3174	PAI	2318
78	3174	MÃE	2293
79	3175	PAI	2133
80	3175	MÃE	2735
81	3176	PAI	2133
82	3176	MÃE	2735
83	3177	PAI	2003
84	3177	MÃE	2734
107	3244	PAI	1559
108	3244	MÃE	2331
109	3245	PAI	1559
110	3245	MÃE	2331
111	3246	PAI	1559
112	3246	MÃE	2331
113	3247	PAI	1559
114	3247	MÃE	2331
115	3248	PAI	1559
116	3248	MÃE	2331
1	3136	PAI	1808
2	3136	MÃE	2722
117	3254	PAI	1808
118	3254	MÃE	2683
119	3255	PAI	1809
120	3255	MÃE	1924
122	1456	MÃE	2297
123	2909	PAI	2884
87	1790	PAI	2876
88	1790	MÃE	2707
89	3222	PAI	2133
90	3222	MÃE	2733
91	3224	PAI	1808
92	3224	MÃE	1915
93	3225	PAI	1808
94	3225	MÃE	1915
95	3226	PAI	1808
96	3226	MÃE	1915
97	3227	PAI	1808
98	3227	MÃE	1915
99	3228	PAI	1808
100	3228	MÃE	1915
101	3230	PAI	1810
102	3230	MÃE	1915
121	1456	PAI	1809
124	2909	MÃE	2297
125	1090	PAI	2884
126	1090	MÃE	1807
127	3268	PAI	1809
128	3268	MÃE	1915
129	3270	PAI	866
130	3270	MÃE	2933
131	3271	PAI	2884
132	3271	MÃE	2296
133	3272	PAI	761
134	3272	MÃE	2733
135	3274	PAI	1810
136	3274	MÃE	2296
137	3275	PAI	1810
138	3275	MÃE	2296
139	3288	MÃE	2735
140	3289	MÃE	1811
141	3319	PAI	3317
142	3319	MÃE	3318
143	3331	MÃE	3330
144	2942	PAI	1809
145	2942	MÃE	2722
146	3336	PAI	3334
147	3336	MÃE	3335
148	3345	PAI	3342
149	3345	MÃE	3344
150	3346	PAI	2884
151	3346	MÃE	2887
152	3351	PAI	3349
153	3351	MÃE	3350
154	3352	PAI	3349
155	3352	MÃE	3350
156	3353	PAI	3349
157	3353	MÃE	3350
\.


--
-- TOC entry 4524 (class 0 OID 0)
-- Dependencies: 364
-- Name: parentesco_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

SELECT pg_catalog.setval('parentesco_id_seq', 157, true);


--
-- TOC entry 4129 (class 0 OID 25324)
-- Dependencies: 365
-- Data for Name: pessoa; Type: TABLE DATA; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

COPY pessoa (id, data_de_nascimento, nome, cpf_cnpj, escid, status, esc_id_destino) FROM stdin;
2934	\N	asd	\N	8	Ativo	0
2935	\N	nome da atividade	\N	8	Ativo	0
7	1997-05-16	CENTRO MUNICIPAL DE ENSINO FUNDAMENTAL D. JOAQUIM DE ALMEIDA	01913984000164	0	Ativo	0
2500	2014-11-14	ZZZ	32165468781	0	Ativo	0
987	2002-11-12	NALANDA BARROS DE ARAUJO	\N	8	Ativo	0
1153	1999-03-05	DIEGO DE LIMA ALVES	\N	8	Ativo	0
1436	2000-10-01	JUDSON BANDEIRA MIRANDA	\N	8	Ativo	0
2707	2009-02-03	MARIA JÚLIA DE SENA CLEMENTINO	\N	7	Ativo	0
2876	1999-12-17	NICOLLAS FELIPHE DO NASCIMENTO CAVALCANTE	124162284-12	8	Ativo	0
2882	2003-08-19	AMARILIS DE FRANCA COSTA	707640194-06	8	Ativo	0
2883	2003-01-14	CARLOS SERGIO FEITOSA BORGES	707014044-42	8	Ativo	0
2884	2002-08-18	EMANUEL MATEUS DA SILVA	706867834-33	8	Ativo	0
2885	2002-05-31	EMILLY CAROLAINE DOS SANTOS NASCIMENTO	706964884-77	8	Ativo	0
2886	2002-07-05	ADSON GABRIEL SILVA DO NASCIMENTO	\N	8	Ativo	0
2932	2010-05-14	ALANE GABRIELLY MUNIZ DO NASCIMENTO	\N	9	Ativo	0
2933	2009-08-20	ANA BEATRIZ GOMES DE CASTRO	\N	9	Ativo	0
29	2008-06-26	CENTRO DE EDUCACAO INFANTIL POTENGI	10014569000160	0	Inativo	0
2887	2002-10-18	GABRIELE BARBOSA DE LIMA	\N	8	Ativo	0
27	2010-11-08	ESCOLA MUNICIPAL DE 1 GRAU PROFESSORA MARIA PENUN	13652761000170	0	Inativo	0
43	2007-05-28	ESCOLA MUNICIPAL DE 1 GRAU JOSE HORACIO DE GOIS	08852450000114	0	Inativo	0
49	1999-05-19	ESCOLA MUNICIPAL DE 1 GRAU LUIS FERREIRA ASSUNCAO	03163788000145	0	Inativo	0
39	1997-05-20	ESCOLA MUNICIPAL DE 1 E 2 GRAU DR ROBERTO BEZERRA FREIRE	01891872000150	0	Inativo	0
14	2011-02-11	CRECHE MUNICIPAL ANA CLESIA VARELA	13624043000190	0	Inativo	0
15	2008-06-27	ESCOLA MUNICIPAL DOUTOR NILTON PESSOA DE PAULA	10174717000103	0	Inativo	0
2708	2008-10-09	MICHAEL ALEXSANDRO NASCIMENTO DE MARCENA	\N	7	Ativo	0
16	2008-06-23	ESCOLA MUNICIPAL MAURICIO FERNANDES DE OLIVEIRA	10171093000170	0	Inativo	0
18	2001-05-15	ESCOLA MUNICIPAL DE ENSINO FUNDAMENTAL FRANCISCO POTIGUAR CAVALCANTI	04463109000116	0	Inativo	0
20	2002-07-15	CENTRO EDUCACIONAL POTI CAVALCANTI	05158293000153	0	Inativo	0
22	1997-06-27	ESCOLA MUNICIPAL DE ENSINO FUNDAMENTAL PROFESSORA MARIA DA CRUZ	01939029000104	0	Inativo	0
23	2011-02-10	CENTRO EDUCACIONAL PRE ESCOLAR HAMILTON SANTIAGO JUNIOR	13675911000160	0	Inativo	0
25	2002-06-14	ESCOLA MUNICIPAL VEREADOR AILDO MENDES	05562666000157	0	Inativo	0
28	2009-06-19	CENTRO EDUCACIONAL INFANTIL E FUNDAMENTAL PROFESSOR IVANALDO DE FRANCA LIMA	11003078000186	0	Inativo	0
33	2008-06-23	ESCOLA MUNICIPAL DE 1 GRAU VEREADOR JOSE PRUDENCIO DE LIMA	13002091000146	0	Inativo	0
40	2008-04-26	PRE ESCOLAR BAIXINHOS EDUCADOS	12192253000193	0	Inativo	0
42	2008-06-23	ESCOLA MUNICIPAL DE ENSINO FUNDAMENTAL LAURO PINHEIRO DA COSTA	10014419000156	0	Inativo	0
48	1997-08-08	ESCOLA MUNICIPAL DE 1 GRAU LUIZ DE FRANCA LIMA	2049131000199	0	Inativo	0
50	1997-05-22	ESCOLA MUNICIPAL DE ENSINO FUNDAMENTAL GENESIO CABRAL DE MACEDO	01962264000199	0	Inativo	0
44	1999-05-25	ESCOLA MUNICIPAL DE 1 GRAU MONSENHOR WALFREDO GURGEL	04358001000163	0	Inativo	0
31	1997-05-16	ESCOLA MUNICIPAL DE 1 GRAU PROFESSORA JESSICA DEBORA DE MELO BEZERRA	01939035000153	0	Inativo	0
35	1997-05-20	ESCOLA MUNICIPAL DE 1 GRAU PROFESSORA MARIA DAS NEVES SILVA	01937296000134	0	Inativo	0
24	1999-05-25	ESCOLA MUNICIPAL DE 1 GRAU PROFESSORA MARIA DE LOURDES DE SOUZA	03176903000116	0	Inativo	0
26	2001-05-15	ESCOLA MUNICIPAL DE 1 GRAU PROFESSORA MARIA JUDITE DOS SANTOS	04465139000161	0	Inativo	0
2295	2014-10-16	CARLOS ALBERTO DA SILVA	40624870472	7	Ativo	0
2296	\N	PATRICIA CINTIA DUARTE DE OLIVEIRA	06799282435	7	Ativo	0
2297	\N	MARIA ROSILANDY FEITOSA	49066023400	7	Ativo	0
1807	2003-03-08	MICHELLI DE BRITO	\N	9	Ativo	0
1808	2002-12-04	WILLIAN GOMES LEITE	12454294427	9	Ativo	0
1809	2005-01-25	FELIPE BORGES DOS SANTOS	\N	9	Ativo	0
1810	2005-04-07	FRANKLIN VINICIUS DE FARIAS ANDRADE	\N	9	Ativo	0
1811	2003-02-07	JANAINA SILVA DOS SANTOS	\N	9	Ativo	0
2683	2014-12-16	MARIA APARECIDA DE AGUIAR	\N	9	Ativo	0
761	2007-07-20	ALAN COSMO COSTA DA SILVA	\N	8	Ativo	0
2133	2014-10-14	FRANCISCO GOMES DE OLIVEIRA	\N	8	Ativo	0
2344	2014-09-30	FULANO DE TAL	12222133214	0	Ativo	0
2352	2014-09-30	FULANO DE TAL	8765432651	0	Ativo	0
2357	2014-09-30	FULANO DE TAL	8765432650	0	Ativo	0
2362	2014-09-30	FULANO DE TAL	068068068099	0	Ativo	0
2368	2014-09-30	TESTE9	23462784323647	0	Ativo	0
2374	2014-09-30	asasdasdasgsdfghjgfjfg	65456497899	0	Ativo	0
2376	2014-09-30	TESTEETETET	2323232323	0	Ativo	0
2379	2014-09-30	TESTEETETET	2323232325	0	Ativo	0
2381	2014-09-30	Roberto Manaia dos Santos	23423423423	0	Ativo	0
2391	2014-10-01	TETETTETETETETSTE	1234343545435436	0	Ativo	0
2392	2014-10-01	TETETTETETETETSTE	12343154488888	0	Ativo	0
2393	1997-02-23	Roberto Manaia dos Santos Junior	10901589470	0	Ativo	0
2394	1997-02-23	Roberto Manaia dos Santos Junior	10901589478	0	Ativo	0
2396	1993-03-19	Daniel Brito Fernandes	0961516151616516	0	Ativo	0
2397	1993-03-19	Daniel Brito Fernandes	096151615161655555555	0	Ativo	0
2398	1993-03-19	Daniel Brito Fernandes	0961516151615145	0	Ativo	0
2449	2014-10-16	123123	11111111119143434	0	Ativo	0
866	2005-01-04	RIKELME BRITO DE LIMA	\N	7	Ativo	0
1559	1970-12-04	JOSE COSMO DA SILVA	70419345434	8	Ativo	0
1915	2008-01-22	LETICIA VITORIA RODRIGUES TORQUATO	\N	8	Ativo	0
2930	2008-07-14	BRYANN DYOGO DO NASCIMENTO	\N	7	Ativo	0
2931	2009-07-11	Akson Viana Costa	\N	9	Ativo	0
2722	1999-10-06	RAIANE IASMIN GOMES DE FREITAS	70552191400	8	Ativo	0
1999	2003-11-05	ESTER GABRIELLY FREIRE DE OLIVEIRA	\N	7	Ativo	0
2000	2005-07-04	EWERTON JOSE MONTEIRO DA SILVA	12452101494	7	Ativo	0
2001	2005-12-19	FLAVIA GABRIELA DA SILVA OLIVEIRA	\N	7	Ativo	0
2002	2005-05-29	GLAUCYA KETLLEY COSTA DA SILVA	\N	7	Ativo	0
2003	2005-11-26	HUGO FERNANDO DE SOUSA ISIDIO	\N	7	Ativo	0
2004	2005-11-18	JEANDERSON ANDRE DE ALBUQUERQUE SILVA	\N	7	Ativo	0
2733	2008-06-26	ANNE MARJORIE MEDEIROS DE SOUSA	\N	7	Ativo	0
2734	2008-05-31	ARIELLE DA SILVA PEREIRA	\N	7	Ativo	0
2735	2009-04-07	CLARA BEATRIZ COSTA SOARES	\N	7	Ativo	0
2306	\N	NAZARENO ALEXANDRE DE MELO	03402234483	7	Ativo	0
2318	1984-03-10	CARLOS ALBERTO PEIXOTO DE PAULA	02294108477	7	Ativo	0
2279	\N	WANJA MARIA C NOGUEIRA	\N	7	Ativo	0
2331	\N	MARIA DA CONCEICAO SIMAO CARNEIRO	05006508450	7	Ativo	0
2289	2015-02-02	MARIA DIVA DA SILVA FERREIRA	09050060463	7	Ativo	0
2294	2015-02-02	IVANILDE RODRIGUES DA SILVA	49811624400	7	Ativo	0
2291	2015-02-03	CLAUDETE FURTADO DIAS DE FREITAS	78593719449	7	Ativo	0
2290	2015-02-03	VANUSIA CANDIDO DO NASCIMENTO	01874281408	7	Ativo	0
2293	2015-02-03	VERA LÚCIA FONSECA DA COSTA	42953944400	7	Ativo	0
2868	2008-12-10	JONAS DE ASSIS SOUZA	\N	7	Ativo	0
2696	2009-05-21	ANDERSON DO NASCIMENTO SILVA	\N	7	Ativo	0
2697	2008-07-28	ANDREY VÍTOR DA SILVA ALEXANDRE	\N	7	Ativo	0
2698	2009-03-01	DEIVISSON ALEXANDRE DO NASCIMENTO	\N	7	Ativo	0
2699	2009-01-05	EMÉRSON SALES FERREIRA	\N	7	Ativo	0
2700	2008-06-08	EVELLEN THAYNÁ DA SILVA SANTOS	\N	7	Ativo	0
2701	2008-12-10	FERNANDA WILLYANE REJO COSTA	\N	7	Ativo	0
2702	2008-08-19	FLÁVIO MATHEUS DE FREITAS DIAS	\N	7	Ativo	0
2703	2009-03-28	JOÃO GABRIEL DUARTE DE LIMA	\N	7	Ativo	0
2704	2008-11-17	LAUREN BEATRIZ DA SILVA BEZERRA	\N	7	Ativo	0
2705	2009-05-18	MARIA GABRIELLY BARBOSA DE LUCENA LIMA	\N	7	Ativo	0
2706	2009-03-28	MARIA JÚLIA DUARTE DE LIMA	\N	7	Ativo	0
2709	2008-09-26	MICHAEL JOSÉ BARBOSA DOS SANTOS	\N	7	Ativo	0
2710	2008-09-16	PEDRO HENRIQUE DA SILVA RODRIGUES	\N	7	Ativo	0
2711	2008-12-14	PEDRO MIGUEL MARTINS FELIX	\N	7	Ativo	0
2712	2008-06-01	RAFAEL RODRIGO DE LIMA	\N	7	Ativo	0
2713	2009-01-27	RICHARLLYSON MATEUS DA SILVA BARBOSA	\N	7	Ativo	0
2714	2009-04-16	RICHELLY VITÓRIA SOUTO DA SILVA	\N	7	Ativo	0
2715	2009-05-26	SAMUEL TALES NASCIMENTO BANDEIRA	\N	7	Ativo	0
2716	2008-09-12	SARA DANIELLE DE MELO BARBOSA	\N	7	Ativo	0
2717	2009-02-12	SHIRLEY KAREN MÁXIMO DE SOUZA	\N	7	Ativo	0
2718	2009-01-07	TAINARA GABRIELE NASCIMENTO DE LIMA	\N	7	Ativo	0
1914	2007-04-04	LEISON VITOR DANTAS VIANA	\N	7	Ativo	0
1916	2007-07-07	LIVIA MARIA DA SILVA GOMES LIMA	\N	7	Ativo	0
1917	2007-09-24	LUAN FELIPE SOUZA FERREIRA	70733605427	7	Ativo	0
1918	2007-10-08	LUCIVAN ERWIN BARBOSA SABINO	12466745488	7	Ativo	0
1919	2007-11-15	LUIS DAVYD MORAIS DO NASCIMENTO	\N	7	Ativo	0
1920	2007-06-02	LUIS GUILHERME TORRES DOS SANTOS	\N	7	Ativo	0
1921	2007-12-04	LUIZ FELIPE SANTOS DA COSTA	\N	7	Ativo	0
1922	2007-08-16	MARCELO HENRIQUE DE PAIVA NEVES	12085193447	7	Ativo	0
1923	2007-08-16	MARCOS PAULO ANTHONY ALVES SILVA	\N	7	Ativo	0
1924	2007-04-26	MARIA CAROLINE MACEDO RIBEIRO	\N	7	Ativo	0
1925	2007-10-02	MARIA CAUANE VIEIRA DE LIMA	\N	7	Ativo	0
1926	2007-07-19	MARIA GABRIELE VASCONCELOS DA SILVA	\N	7	Ativo	0
1927	2008-12-11	NATHALY RITHLLY PEREIRA CARVALHO	\N	7	Ativo	0
1928	2007-07-04	PAULO HENRIQUE RIBEIRO DA SILVA	\N	7	Ativo	0
1929	2007-07-30	PEDRO LUCAS DA COSTA MEDEIROS	\N	7	Ativo	0
1930	2007-10-23	PEDRO PAULO DOS SANTOS	70733510477	7	Ativo	0
2719	2009-02-22	VINÍCIUS GABRIEL MONTEIRO DE SOUSA	\N	7	Ativo	0
2720	2008-10-22	VINÍCIUS KAUÊ DIAS DE SOUZA	\N	7	Ativo	0
2721	2009-04-19	YASMIM JENIFFER BARBOSA DA SILVA	\N	7	Ativo	0
2914	2009-02-17	PAULO HENRIQUE DA SILVA CALCANTE GOMES	131.205.694-02	7	Ativo	0
1931	2007-07-31	REBECA LINDAURA CLAYER OLIVEIRA DE LIMA	\N	7	Ativo	0
1932	2007-02-25	RICHARD GABRIEL ALEXANDRE BARROS	\N	7	Ativo	0
1933	2007-07-20	ROSENILDO DE OLIVEIRA SOARES	\N	7	Ativo	0
1934	2008-01-21	TALITA VITORIA BASILIO DE LIMA	\N	7	Ativo	0
1935	2007-09-17	THIAGO RIBEIRO BULHOES	\N	7	Ativo	0
1936	2007-07-21	VICTOR MESSIAS SILVA DE MELO	\N	7	Ativo	0
1937	2007-10-14	WAGNER DO NASCIMENTO FERNANDES	\N	7	Ativo	0
1938	2008-04-13	WANDERSON ODAIR DO NASCIMENTO NOGUEIRA	12415638455	7	Ativo	0
1939	2008-02-01	WENDI NOEMY COSTA DA SILVA	\N	7	Ativo	0
1940	2007-10-03	YASMIN VITORIA PINHEIRO DO NASCIMENTO	\N	7	Ativo	0
1941	2007-05-29	ELLEN FLAVIA NASCIMENTO DA SILVA	12419074490	7	Ativo	0
1942	2007-03-21	GEISE KAMYLLE DA PAZ LOPES	\N	7	Ativo	0
1943	2006-05-10	GUILHERME JANUARIO FERREIRA	\N	7	Ativo	0
1944	2007-04-11	JOELSON GABRIEL DE OLIVEIRA MARQUES	\N	7	Ativo	0
1945	2006-10-29	JOSE HENRIQUE CASSIANO DE AQUINO	\N	7	Ativo	0
1946	2005-10-17	JUDSON BARBOSA DE SOUZA	\N	7	Ativo	0
1947	2006-11-16	LAURINY REBECA ALVES CAMPELO	\N	7	Ativo	0
1948	2007-04-07	MARIA ISABEL GOMES PAIVA	\N	7	Ativo	0
1949	2006-09-11	MARIA LUISA CIRIACO PEGADO	\N	7	Ativo	0
1950	2006-11-04	MATEUS LUCYANO PINHEIRO DA SILVA	\N	7	Ativo	0
1951	2006-08-05	MATEUS MATIAS DE OLIVEIRA	12385346435	7	Ativo	0
1952	2008-12-17	NATHALIA KAROLINE MELO DA SILVA	09993944440	7	Ativo	0
1953	2006-11-30	PABLO ADRIANO DIAS NOGA ALVES	\N	7	Ativo	0
1954	2006-06-03	PAULO DUARTE DA COSTA	\N	7	Ativo	0
1955	2006-07-11	PAULO HENRIQUE DE OLIVEIRA ROCHA	\N	7	Ativo	0
1956	2007-05-29	PEDRO ANDERSON FELIX DE LIMA	\N	7	Ativo	0
1957	2006-01-15	ROGERIO SALES DO NASCIMENTO	\N	7	Ativo	0
1958	2006-12-16	SAMARA PAULINO PINHEIRO DE OLIVEIRA	70006182488	7	Ativo	0
1959	2007-01-24	SARA DA SILVA BEVENUTO	\N	7	Ativo	0
1960	2007-01-05	TANILDO TEIXEIRA CANDIDO	\N	7	Ativo	0
1961	2006-08-28	THALYANE FERREIRA VARELA	\N	7	Ativo	0
1962	2005-11-08	THIALLYSSO DA SILVA SOUZA	\N	7	Ativo	0
1963	2004-12-15	VALBIR PAULINO DOS SANTOS JUNIOR	\N	7	Ativo	0
1964	2006-06-24	VICTOR GABRIEL FERREIRA DE OLIVEIRA	\N	7	Ativo	0
1966	2005-08-08	ANA CLARA DA SILVA	12459853459	7	Ativo	0
1967	2006-06-20	ANDERSON NASCIMENTO DE SOUZA	\N	7	Ativo	0
1968	2006-09-22	ANDRIELE IASMIM SOUZA DA SILVA	\N	7	Ativo	0
1969	2006-10-17	ANDRYI KLEI SILVA DO NASCIMENTO	\N	7	Ativo	0
1970	2006-08-10	ANTONIO LUCAS MATIAS FELIX	\N	7	Ativo	0
1971	2007-01-04	ARTHUR VIDAL DA COSTA	\N	7	Ativo	0
1972	2006-04-21	BRUNO RIQUE DA SILVA MARCAL	\N	7	Ativo	0
1973	2006-09-20	CAIO FELIPE MARQUES DE LIMA	\N	7	Ativo	0
1974	2007-02-11	EDUARDO RODRIGUES DE SOUZA	\N	7	Ativo	0
1975	2007-01-27	EMANUEL ARAUJO DE SOUZA	\N	7	Ativo	0
1976	2006-04-05	ERMESON GABRIEL FERNANDES MARTINS DA COSTA	70753277476	7	Ativo	0
1977	2007-01-20	EWERTON MESSIAS NASCIMENTO DA SILVA	\N	7	Ativo	0
1978	2006-11-30	GERALDO JACINTO DO NASCIMENTO NETO	\N	7	Ativo	0
1979	2007-03-17	ISABELA RODRIGUES PEREIRA	\N	7	Ativo	0
1980	2006-05-15	JADSON DO NASCIMENTO RIBEIRO	\N	7	Ativo	0
1981	2006-08-03	JAILTON PEREIRA DO NASCIMENTO	\N	7	Ativo	0
1982	2006-08-18	JAIRO FLORENCIO BEZERRA DE MORAIS	\N	7	Ativo	0
1983	2006-10-12	JOYCE KEMILLY COSTA DA SILCA	\N	7	Ativo	0
1984	2006-11-11	JUAN RIQUELME DIAS DE SOUZA	\N	7	Ativo	0
1985	2006-08-17	KAYLLANE ROBERTA TORRES DA CRUZ	\N	7	Ativo	0
1986	2006-12-01	KEILLYSON MARCIEL DO NASCIMENTO SIQUEIRA	\N	7	Ativo	0
1987	2007-07-26	LUCAS HENRIQUE DA SILVA MARCAL	\N	7	Ativo	0
1988	2006-08-19	MARCIELE CAMILE VERAS BEZERRA	\N	7	Ativo	0
1989	2006-07-24	MARIA EDUARDA VIEIRA DE LIMA	\N	7	Ativo	0
1990	2006-05-31	PAULO DAVID DA COSTA GONCALVES	\N	7	Ativo	0
1991	2007-04-29	PAULO EDUARDO SOUZA DA SILVA	\N	7	Ativo	0
1992	2006-05-12	PEDRO FELYPE BEZERRA DA SILVA	70753848481	7	Ativo	0
1993	2007-05-10	WILLYANE ANDRADE DE LIMA	\N	7	Ativo	0
1994	2005-10-22	ANTONIO PIRES DA SILVA NETO	\N	7	Ativo	0
1995	2005-06-29	ARIELE ROBERTA FERNANDES DE MEDEIROS	\N	7	Ativo	0
1996	2005-11-14	DAMARES LOPES OLIVEIRA PEREIRA	\N	7	Ativo	0
1997	2006-01-24	DANILO DANTAS VIEIRA FILHO	\N	7	Ativo	0
1998	2005-02-09	DENISSON ISLANIO SILVA FLEXA	\N	7	Ativo	0
2005	2006-04-04	JOAO PEDRO CARLOS SILVA DO NASCIMENTO	\N	7	Ativo	0
2006	2005-08-05	KAUA ALVES BARBOSA NERY	\N	7	Ativo	0
2007	2005-08-25	KALYANE RAYNARA MARINHO BRAGA DO NASCIMENTO	12438892412	7	Ativo	0
2008	2006-05-25	LUCAS CAMILO AZEVEDO DA SILVA	12418415430	7	Ativo	0
2009	2006-04-21	MARIA EDUARDA DA SILVA VIANA	\N	7	Ativo	0
2010	2005-07-18	MARIA LUIZA LIMA DE PAIVA	\N	7	Ativo	0
2011	2006-03-02	MARIA RITA OLIVEIRA DA SILVA	\N	7	Ativo	0
2012	2006-03-22	MARJORE LARISSA DA SILVA TORRES	\N	7	Ativo	0
2013	2005-11-18	NOEMI APOLINARIO AMORIM	\N	7	Ativo	0
2014	2006-07-28	NOEMI DA SILVA COSTA	\N	7	Ativo	0
2015	2005-11-12	PAULO SERGIO DA SILVA FILHO	70733515436	7	Ativo	0
2016	2005-07-15	RIVALDO BARBOSA CARDOSO NETO	\N	7	Ativo	0
2017	2005-11-04	WALDERCIO DOS SANTOS CARVALHO	\N	7	Ativo	0
2018	2005-10-18	WILLIANE EDWIRGENS DO NASCIMENTO NOGUEIRA	\N	7	Ativo	0
2019	2005-07-31	DEBORA RAISSA DE OLIVEIRA SILVA	\N	7	Ativo	0
2020	2005-03-24	ADSON COSTA DO NASCIMENTO	12389704401	7	Ativo	0
2021	2005-06-17	ALEXANDRA FLORENCIO DA SILVA	70733534490	7	Ativo	0
2023	2001-07-27	EDVAN SABINO DE MEDEIROS JUNIOR	\N	7	Ativo	0
2024	2005-07-26	EVANOEL BEZERRA FILHO	\N	7	Ativo	0
2025	2006-03-20	FERNANDA MARIA DA SILVA COSTA	\N	7	Ativo	0
1965	2006-10-17	VNICIUS CAUA SILVA DE LIMA	\N	7	Ativo	0
1874	2007-08-16	RUAN CARLOS SILVA TEIXEIRA	12311274490	7	Ativo	0
1875	2008-01-16	ADRYALISSON DAVID MOURA ALVES	11832842410	7	Ativo	0
1876	2007-06-04	ALESSANDRO DO NASCIMENTO SANTIAGO	\N	7	Ativo	0
1877	2006-11-10	AMANDA FABIENE COSTA DA SILVA	\N	7	Ativo	0
1879	2006-12-16	ANA BEATRIZ RIBEIRO MORAIS	12475253410	7	Ativo	0
1880	2007-01-13	ANA BERATRIZ PEREIRA DE SOUZA	\N	7	Ativo	0
1881	2007-11-27	ANA CLARA GOMES ANDRADE	\N	7	Ativo	0
1882	2007-09-01	ANA LIVIA FERREIRA DO NASCIMENTO	11600234410	7	Ativo	0
1883	2008-01-18	ANNE GABRIELE LEOCADIO DE LIMA	70733609414	7	Ativo	0
1884	2008-03-19	ANNY JESSY SOUZA DE FRANCA	\N	7	Ativo	0
1885	2007-08-18	ARIENE FERNANDES MEDEIROS	\N	7	Ativo	0
1886	2007-03-27	CALIANE LAIS OLIVEIRA DE LIMA	\N	7	Ativo	0
1887	2007-09-23	CAUA FLAVIO MARQUES DE LIMA	\N	7	Ativo	0
1888	2007-11-03	CLARA NICOLI DE ARAUJO JUSTINO	\N	7	Ativo	0
1889	2007-06-24	CRISTOPHER MATEUS DE ARAUJO LIMA	\N	7	Ativo	0
1890	2008-05-06	DAMARES BEATRIZ SILVA FLEXA	70753907402	7	Ativo	0
1891	2006-09-22	DAVI ANTONY SILVA FLEXA	\N	7	Ativo	0
1892	2008-03-06	DAVIDSON KAUA DA SILVA NASCIMENTO	70737585463	7	Ativo	0
1893	2007-12-06	EDUARDA GABRIELE FERNANDES MARTINS DA COSTA	70753291460	7	Ativo	0
1894	2007-11-16	ESTEFANE NASCIMENTO DA SILVA	\N	7	Ativo	0
1895	2007-08-27	FRANCISCO CANINDE TEIXEIRA SILVA JUNIOR	12432855400	7	Ativo	0
1896	2008-04-24	FRANCISCO RYCHARLISSON SIVA DO NASCIMENTOS	\N	7	Ativo	0
1897	2007-10-17	FRANCISCO WELLINGTON REJO COSTA	09280060422	7	Ativo	0
1898	2007-09-21	GABRIEL DA SILVA ARAUJO	\N	7	Ativo	0
1899	2007-11-07	GISELE LORRAINE FERREIRA SALES	\N	7	Ativo	0
1900	2007-10-26	GISLAYNE VITORIA PEREIRA DO NASCIMENTO	\N	7	Ativo	0
1901	2007-10-01	GUILHERME CAUA COSTA DA SILVA	12433068401	7	Ativo	0
1902	2007-12-18	ISABELLE SANTOS DO NASCIMENTO	\N	7	Ativo	0
1903	2007-10-15	ISIANE KELLY SILVA DA FONSECA	\N	7	Ativo	0
1904	2008-02-12	ISIANE MORAIS DUARTE	01789981408	7	Ativo	0
1905	2007-05-24	JAMYLLE ARIELE MACEDO COSTA	\N	7	Ativo	0
1907	2007-12-29	JOAO LYANDSON ALVES DA SILVA	70753863448	7	Ativo	0
1908	2007-10-29	JONATHAN CARVALHO DA SILVA	\N	7	Ativo	0
1909	2007-09-25	JOYCE GABRIELE DOS SANTOS FAUSTINO	\N	7	Ativo	0
1910	2007-09-09	JULIO CESAR SOUZA RAMOS	\N	7	Ativo	0
1911	2008-04-23	KAIO VINICIUS RIBEIRO DA COSTA	\N	7	Ativo	0
2026	2004-10-18	FELIPE DUARTE BEZERRA	\N	7	Ativo	0
2027	2003-11-10	FRANCISCO CAUA CAETANO DA SILVA	\N	7	Ativo	0
2028	2006-03-09	GABRIEL MOISES MARCOLINO DANTAS VIEIRA	\N	7	Ativo	0
2029	2005-08-21	HELOISE ROBERTA PEREIRA DE OLIVEIRA	70737595426	7	Ativo	0
2030	2005-12-03	INGRID YASMIM CONCEICAO SALDANHA	70747629463	7	Ativo	0
2031	2005-11-30	JAINA ROQUE THE MAIA	\N	7	Ativo	0
2032	2005-03-11	JOYCE MARIA DA SILVA RODRIGUES	12529456470	7	Ativo	0
2033	2006-01-09	KAIO DOUGLAS RODRIGUES PEREIRA	\N	7	Ativo	0
2034	2006-04-06	KAUAN HENRIQUE CASSIMIRO DA SILVA	\N	7	Ativo	0
2035	2006-03-03	KAUA RICARDO DE LIMA OLIVEIRA	\N	7	Ativo	0
2036	2005-06-25	KAWA PATRYQUE ALVES CAMPELO	\N	7	Ativo	0
2037	2005-12-01	LUANA VITORIA PEREIRA DO NACIMENTO	70726643432	7	Ativo	0
2038	2005-08-26	MARCONI ROCHA DA SILVA FILHO	\N	7	Ativo	0
2039	2005-11-18	MELQUISEDEQUE ANDRADE SOUSA DE OLIVEIRA	\N	7	Ativo	0
2040	2005-06-06	PEDRO HENRIQUE SOUSA DE LIMA SANTIAGO	\N	7	Ativo	0
2041	2005-09-15	RUTE JULIANE DA SILVA JANUARIO	\N	7	Ativo	0
2042	2006-01-02	THANYLO TEIXEIRA LEAO CANDIDO	\N	7	Ativo	0
2043	2004-10-28	THYAGO TEIXEIRA LEAO CANDIDO	\N	7	Ativo	0
2044	2006-01-29	VITORIA GABRIELA FERNANDES DA SILVA	\N	7	Ativo	0
2045	2005-07-02	WELYSSON COSTA DE OLIVEIRA	\N	7	Ativo	0
2736	2008-12-04	EDIVAN FIRMINO DA SILVA	\N	7	Ativo	0
2737	2009-04-07	ELLEN ELISABETH DO NASCIMENTO NOGUEIRA	701.935.244-81	7	Ativo	0
2738	2009-01-31	ELNATÃ TALYSON RODRIGUES DE LIMA	\N	7	Ativo	0
2739	2009-03-03	EMILLY MICHELLE MEIG DA SILVA	\N	7	Ativo	0
2740	2009-05-20	FLÁVIO DA SILVA BARBOSA JÚNIOR	\N	7	Ativo	0
2741	2009-05-05	GLEIDSON THIAGO SIQUEIRA FELIX	\N	7	Ativo	0
2742	2008-10-27	INGRID BEATRIZ ADELINO DA SILVA NASCIMENTO	703.807.724-42	7	Ativo	0
2743	2009-04-07	JOÃO VICTOR MEDEIROS DE OLIVEIRA	124.201.354-74	7	Ativo	0
2744	2009-01-18	JOSÉ HENRIQUE DA SILVA DE BRITO PIRES	\N	7	Ativo	0
2745	2009-01-19	KADSON ALESSANDRO GERMANO DE LIMA	\N	7	Ativo	0
2746	2009-05-20	LEANDERSON VINÍCIUS SALES ALVES	\N	7	Ativo	0
2319	\N	MARIA DE FATIMA TRAJANO PINHEIRO	02073589405	7	Ativo	0
2790	2007-12-23	KAREN MARIANNE  ESTEVAM BERNARDO	098.956.524-61	7	Ativo	0
2792	2008-03-20	KAUANE GABRIELE LIMA DA ROCHA	700.859.844-00	7	Ativo	0
2793	2007-08-26	LAURA REGINA DANTAS MÁXIMO	106.036.134-54	7	Ativo	0
2316	2015-02-02	MAGNO IVO DO NASCIMENTO	05721085401	7	Ativo	0
2320	2015-02-02	GILVAN MONTEIRO DA GOSTA	05726832434	7	Ativo	0
2317	2015-02-02	ELIZAFFE SILVA DE MORAIS	09030265469	7	Ativo	0
2758	2008-06-05	LIEDSON LIRA DE LIMA SOUSA	124.497.834-58	7	Ativo	0
2759	2015-02-05	LUAN MELO SILVA BRANDÃO	\N	7	Ativo	0
2760	2008-09-27	MARCOS VINÍCIUS DE ALMEIDA RODRIGUES	\N	7	Ativo	0
2761	2008-09-05	MARIA CLARA MACEDO RIBEIRO	\N	7	Ativo	0
2809	2007-09-30	WHANDREY DIMITTRY BARROS DA SILVA	\N	7	Ativo	0
2830	2007-05-19	MARIA CLARA MARCOLINO DA SILVA	\N	7	Ativo	0
2831	2007-01-23	RAFAEL NASCIMENTO DE ALBUQUERQUE	703.002.564-42	7	Ativo	0
2834	2006-10-17	VINÍCIUS CAUÃ SILVA DE LIMA	704.183.754-88	7	Ativo	0
2835	2005-07-31	DÉBORA RAÍSSA DE OLIVEIRA SILVA	\N	7	Ativo	0
2836	2005-11-30	JAIANA ROQUE THÉ MAIA	\N	7	Ativo	0
2837	2005-08-05	KAUÃ ALVES BARBOSA NERY	\N	7	Ativo	0
2838	2006-03-03	KAUÃ RICARDO DE LIMA OLIVEIRA	\N	7	Ativo	0
2839	2006-01-25	MARCELO DA CRUZ FONSÊCA	\N	7	Ativo	0
2840	2005-12-24	MATEUS NASCIMENTO DE ALBUQUERQUE	703.002.684-59	7	Ativo	0
2841	2005-11-12	PAULO SERGIO DA SILVA FILHO	707.335.154-36	7	Ativo	0
2842	2005-09-24	RAMON DANTAS MENDES MONTEIRO	120.188.124-24	7	Ativo	0
2843	2005-12-01	WELLYSON DE CAMPOS LIMA	\N	7	Ativo	0
2844	2005-07-02	WELLYSON COSTA DE OLIVEIRA	\N	7	Ativo	0
2845	2005-06-17	ALEXSANDRA FLORENCIO DA SILVA	707.335.344-90	7	Ativo	0
2846	2006-04-10	CAUÃ DA SILVA FONSECA	\N	7	Ativo	0
2847	2005-04-30	CLÁUDIO ANDRADE DE SOUZA NETO	\N	7	Ativo	0
2848	2005-09-17	FELIPE GABRIEL TOMAZ DA SILVA	708.209.514-30	7	Ativo	0
2849	2005-12-19	FLÁVIA GABRIELA DA SILVA OLIVEIRA	\N	7	Ativo	0
2850	2005-05-29	GLÁUCYA KETLLEY COSTA DA SILVA	\N	7	Ativo	0
2851	2006-04-04	JOÃO PEDRO CARLOS SILVA DO NASCIMENTO	\N	7	Ativo	0
2852	2015-02-06	JOÃO VICTOR SILVA DOS SANTOS	124.783.474-31	7	Ativo	0
2853	2005-06-25	KAWÃ PATRYQUE ALVES CAMPELO	\N	7	Ativo	0
2854	2006-04-03	LUCAS HEITOR BEZERRA DO NASCIMENTO	\N	7	Ativo	0
2855	2005-05-10	RAUL CALI RAMOS FEITOSA	\N	7	Ativo	0
2856	2004-10-28	THYAGO TEIXEIRA LEÃO CANDIDO	\N	7	Ativo	0
2857	2007-09-02	ISABELLE  FABIANE SILVA DOS SANTOS	\N	7	Ativo	0
2858	2008-05-21	JÚLIO CÉSAR DA SILVA SOUZA	\N	7	Ativo	0
2859	2009-01-09	AMANDA VITÓRIA DA SILVA FERREIRA	\N	7	Ativo	0
2860	2008-11-28	CARLOS RAFAEL AZEVEDO DA SILVA	\N	7	Ativo	0
2861	2009-05-21	CLARICE DA SILVA VIEIRA	\N	7	Ativo	0
2862	2009-02-04	FRANCISCA ELOAH DE ANDRADE FRANÇA	\N	7	Ativo	0
2863	2008-12-24	GIORDANO BRUNO CARDOSO AZEVEDO CONFESSOR	\N	7	Ativo	0
2864	2008-06-07	HUDSON LIMA DA SILVA	\N	7	Ativo	0
2865	2008-12-17	JAYME ARTHUR SALDANHA SILVA	\N	7	Ativo	0
2866	2015-02-06	JOÃO GUILHERME GUIMARÃES ARAÚJO	124.483.314-21	7	Ativo	0
2867	2015-02-06	JOÃO PEDRO DE SOUZA CAVALCANTE	\N	7	Ativo	0
2869	2008-10-22	KAIO ÁLISSON VIEIRA DE LIMA	\N	7	Ativo	0
2870	2008-10-22	KAIO ÁLISSON VIEIRA DE LIMA	\N	7	Ativo	0
2871	2008-07-24	MARCOS VINÍCIUS DE ANDRADE GOMES	\N	7	Ativo	0
2872	2009-02-06	MONALISA VITÓRIA DA COSTA FAUSTINO	\N	7	Ativo	0
2873	2009-01-11	VITÓRIA RODRIGUES DA COSTA DANTAS	130.470.264-24	7	Ativo	0
2695	2008-09-14	ANA VITORIA DA SILVA	\N	7	Ativo	0
2892	2009-04-01	MARIA BEATRIZ SANTOS DE SOUZA	707.190.444-80	7	Ativo	0
1683	2004-10-01	PEDRO HENRIQUE DA SILVA	\N	9	Ativo	0
1766	2004-04-05	ANDERSON HENRIQUE DA SILVA ALVES	\N	9	Ativo	0
1768	2004-06-19	EMILLY GISLAINE SILVA DE SOUSA	\N	9	Ativo	0
1769	2004-05-12	EMILLY JAIANE DA SILVA FERREIRA	\N	9	Ativo	0
1770	2004-10-09	JOAO VICTOR CORREIA DA SILVA	\N	9	Ativo	0
1771	2004-04-05	JOAO VICTOR VENANCIO DE ADELINO	\N	9	Ativo	0
1772	2004-09-06	JOFLLYSON DO NASCIMENTO SILVA	\N	9	Ativo	0
1773	2004-06-16	JOSE EWERTON PEREIRA BEZERRA	\N	9	Ativo	0
1774	2004-04-16	MANOEL GOMES DA SILVA FILHO	70714489492	9	Ativo	0
1775	2004-11-09	MARCOS HUDSON FRANCA MARINHO	\N	9	Ativo	0
1776	2004-08-09	MARIA EDUARDA DA SILVA CANDIDO	\N	9	Ativo	0
1777	2004-01-26	MARIA HELOISA BATISTA DE LIMA	\N	9	Ativo	0
1778	2004-11-28	NAYARA DO NASCIMENTO DA SILVA	\N	9	Ativo	0
1779	2005-04-20	KELIANE TEODORO ROMAO	\N	9	Ativo	0
1780	2004-06-10	PEDRO EMANOEL DOS SANTOS LOPES	\N	9	Ativo	0
1782	2004-05-23	RAYANE ELIETH SOUZA DA SILVA	\N	9	Ativo	0
1783	2005-02-14	RAYSSA BEATRIZ GRACIANO DA SILVA	\N	9	Ativo	0
1784	2004-11-26	TAINA SILVA BEZERRA	\N	9	Ativo	0
1785	2004-11-26	TAINE SILVA BEZERRA	\N	9	Ativo	0
1786	2004-05-25	VITORIA MICAELA DE OLIVEIRA DUTRA	\N	9	Ativo	0
1787	2004-09-12	TAISE REBECA MARQUES CANUTO	\N	9	Ativo	0
1788	2004-01-08	YASMIN KAILLANE DA SILVA MORAIS	\N	9	Ativo	0
1789	2003-04-28	ALISSON BRENDO SANTOS DO NASCIMENTO	\N	9	Ativo	0
1812	2002-06-29	JANDESON DA COSTA SILVA	\N	9	Ativo	0
1813	2005-04-18	MARIA BEATRYZ GUILHERME DE SENA	\N	9	Ativo	0
1814	2003-07-15	MELICIA LIVIA FELINTO DOS SANTOS	\N	9	Ativo	0
1815	2002-09-03	KAILANY MONARIA DO NASCIMENTO DE LIMA	\N	9	Ativo	0
1816	2003-06-15	ALICIA MARIA MONTEIRO DE SOUZA	\N	9	Ativo	0
1817	2002-08-12	ANA BEATRIZ MAIA CORREIA	\N	9	Ativo	0
1819	2003-10-28	CARLOS VINICIOS VELOSO DE OLIVEIRA	\N	9	Ativo	0
1820	2002-02-01	DIEGO DA SILVA CANDIDO	\N	9	Ativo	0
1821	2002-02-18	FELIPE FERNANDES FLOR OLIVEIRA	\N	9	Ativo	0
1822	2001-03-18	IVO IGNARTE SILVA DAS CHAGAS	\N	9	Ativo	0
1823	2004-02-05	HENRIQUE RAFAEL SOUSA DO NASCIMENTO	\N	9	Ativo	0
1824	2004-01-28	JONANTHAN GABRIEL DO NASCIMENTO CORDEIRO	70541705474	9	Ativo	0
1825	2003-10-18	JONATHAN MATEUS LIBERATO DA SILVA	\N	9	Ativo	0
1826	2001-10-15	KELVIN MATOS BEZERRA	08854281450	9	Ativo	0
1827	2003-01-04	LEDIANA VIANA DO NASCIMENTO	\N	9	Ativo	0
1828	2004-08-04	LETICIA RAQUEL DO NASCIMENTO SILVA	\N	9	Ativo	0
1852	2002-12-12	FABIANO JACKSON VIANA BORGES	\N	9	Ativo	0
1853	2003-06-26	ILAIGOR NUNES DA CRUZ	\N	9	Ativo	0
1854	2002-10-08	JOSE ERICK MIGUEL DA COSTA	\N	9	Ativo	0
1855	2001-08-29	JOSE MATHEUS PEREIRA BEZERRA	\N	9	Ativo	0
1856	2002-09-15	KAUER EDUARDO DA SILVA VITORINO	\N	9	Ativo	0
1857	2002-12-25	KATARINA DE OLIVEIRA MELO	\N	9	Ativo	0
1858	2002-04-05	KELLVENY FELIPE GRACINO DA SILVA	\N	9	Ativo	0
1859	2001-02-12	LUCAS FERNANDO FREITAS DA SILVA	\N	9	Ativo	0
1860	1999-03-20	LUCAS ISAIAS DOS SANTOS VIEIRA	\N	9	Ativo	0
1861	2001-10-02	LUCAS MONTEIRO CAMPOS	\N	9	Ativo	0
1862	2001-12-23	MARCELE CAMPELO PAULINO GOMES	\N	9	Ativo	0
1863	2001-03-02	MARIA JOYCE ANDRADE DE SENA	\N	9	Ativo	0
1864	2002-02-26	MARIA VITORIA JANUARIO DA SILVA	\N	9	Ativo	0
1865	2002-11-26	MATHEUS EUDES ANDRADE DE SENA	\N	9	Ativo	0
1866	2001-03-19	MAXWELL SIQUEIRA DE LIMA	\N	9	Ativo	0
1867	2002-05-21	ODAIR JOSE SILVA DE MORAIS	\N	9	Ativo	0
1868	2000-12-03	OTACILIO DE FRANCA SILVA	\N	9	Ativo	0
1869	2000-05-29	PAULO RICARDO FRANCA DA SILVA	\N	9	Ativo	0
1870	2001-10-16	RAILMA NASCIMENTO DE LIMA	\N	9	Ativo	0
1871	2000-04-28	PEDRO ENRIQUE NUNES FEITOSA	\N	9	Ativo	0
1872	1999-07-06	RENATA FARIAS DO NASCIMENTO	\N	9	Ativo	0
1873	2001-05-19	ROSIVANIA MARIA DE SOUZA	\N	9	Ativo	0
1697	2005-04-28	DARLAN PRAXEDES GALVAO	\N	9	Ativo	0
1698	2005-09-15	DAVI DA SILVA FELIX DA COSTA	70357861477	9	Ativo	0
1699	2006-01-18	ELIS REGINE DA SILVA DANTAS	\N	9	Ativo	0
1700	2004-10-22	EMILLY MILENA DA SILVA RODRIGUES	\N	9	Ativo	0
1701	2005-09-29	ISABELE SILVA DO NASCIMENTO	\N	9	Ativo	0
1702	2005-12-02	FELIPE SILVA DO NASCIMENTO	\N	9	Ativo	0
1703	2005-06-26	FERNANDA MAYARA FLORENCIO PEREIRA	\N	9	Ativo	0
1704	2005-08-29	HIGOR EMANUEL EURICO MOURA	\N	9	Ativo	0
1705	2005-04-07	IZARLEY JADSON SANTOS DA TRINDADE	\N	9	Ativo	0
1706	2005-11-02	JENNEFY TAINA AZEVEDO RODRIGUES	70710405405	9	Ativo	0
1707	2005-07-12	JESSICA SILVA DO NASCIMENTO	\N	9	Ativo	0
1708	2006-02-16	JOAO VICTOR ROCHA DOS SANTOS COSTA	\N	9	Ativo	0
1709	2005-03-04	JUSSIER MENDES NUNES DA SILVA	\N	9	Ativo	0
1710	2005-12-21	KAROLINI JERONIMOLIMA	\N	9	Ativo	0
1711	2005-11-06	LAURO AFFONSO DO NASCIMENTO CONCEICAO	\N	9	Ativo	0
1712	2005-05-29	LETICIA IASMIN BERNARDO GRACIANO	\N	9	Ativo	0
1713	2006-01-25	MARCELO DA CRUZ FONSECA	\N	9	Ativo	0
1714	2006-01-17	MARIA EDUARDA DE AZEVEDO BEZERRA	\N	9	Ativo	0
1715	2002-11-18	MATHEUS FELIPE SILVA DE MEDEIROS	\N	9	Ativo	0
1716	2005-09-20	MAXWELL BRITO DA SILVA	\N	9	Ativo	0
1717	2005-08-12	RAISSA RALINI DA SILVA SOARES	\N	9	Ativo	0
1718	2005-08-20	SANDRA ALVES DA SILVA	\N	9	Ativo	0
1719	2006-03-14	RAIANA ELIZABETE TAVARES DE LIMA	\N	9	Ativo	0
1720	2005-10-12	MAX LIMA DO NASCIMENTO	70768175437	9	Ativo	0
1721	2008-11-11	ALANY SILVA DE SOUZA	\N	9	Ativo	0
1722	2009-03-17	BRUNA GABRIELLA DA SILVA E SILVA	\N	9	Ativo	0
1723	2009-04-12	CARLOS ACAUA FRANCA DE LIMA	\N	9	Ativo	0
1724	2008-06-11	IAGO ANDREY DA SILVA FERREIRA	\N	9	Ativo	0
1725	2010-04-25	GRAZIELLA SIMOES DE OLIVEIRA	\N	9	Ativo	0
1726	2009-11-02	GABRIEL NATAN QUEIROZ DANTAS	\N	9	Ativo	0
1727	2008-06-23	ISABELY BEATRIZ DO NASCIMENTO ROCHA	\N	9	Ativo	0
1728	2009-08-10	JOAO PEDRO SANTOS NUNES	\N	9	Ativo	0
1729	2009-09-12	JORGE MAIA FREIRE	\N	9	Ativo	0
1730	2009-04-29	JOSE AUGUSTO SILVA DOS SANTOS	\N	9	Ativo	0
1731	2008-05-29	KAUA HENRIQUE DO NASCIMENTO LIMA	\N	9	Ativo	0
1732	2009-06-29	KETTILYN YASMIN DO NASCIMENTO LIMA	\N	9	Ativo	0
1733	2008-11-05	KELLYSON ALEXANDRE MARTINS DE ALMEIDA	\N	9	Ativo	0
1734	2008-04-07	MARIA BETANIA MIGUEL DA COSTA	\N	9	Ativo	0
1735	2008-07-01	MARIA ISABELA DE SOUZA	\N	9	Ativo	0
1736	2010-04-20	MARIA JULIA DA SILVA SANTOS	\N	9	Ativo	0
1737	2010-01-09	MARIA JULIA OLIVEIRA DA SILVA	\N	9	Ativo	0
1738	2010-01-16	OTAVIO DA SILVA CANDIDO	\N	9	Ativo	0
1739	2010-04-28	PEDRO OLIVEIRA CAMPOS NETO	\N	9	Ativo	0
1740	2009-03-25	RUAN NASCIMENTO DE LIMA	\N	9	Ativo	0
1741	2009-12-08	STEPHANY KAUANY NOGUEIRA BARRETO	\N	9	Ativo	0
1742	2008-09-15	ANA BEATRIZ FELIX DO NASCIMENTO	\N	9	Ativo	0
1743	2004-07-07	ALAN FRANKLIN SILVA DE MELO	\N	9	Ativo	0
1744	2006-01-26	AISHA JENIFFER DE BRITO CABRAL	\N	9	Ativo	0
1745	2005-09-04	DIEGO SA DE SOUZA	\N	9	Ativo	0
1746	2005-04-08	ERICA VANESSA VELOSO DE OLIVEIRA	\N	9	Ativo	0
1747	2005-10-15	ERICK CATRARIO DA SILVA	\N	9	Ativo	0
1748	2003-12-24	ERICK FELIPE GOMES DANTAS	\N	9	Ativo	0
1749	2005-10-30	GUILHERME EPAMINONDAS AZEVEDO PATRICIO	\N	9	Ativo	0
1750	2006-02-09	IVANIA JHENNIFER LIBERATO DA SILVA	\N	9	Ativo	0
1751	2006-04-13	JEFFERSON COSTA DE MORAIS	\N	9	Ativo	0
1752	2005-08-16	JENFFER GABRIELY DO NASCIMENTO	70541708490	9	Ativo	0
1753	2005-11-18	JOELLISON DO NASCIMENTO SILVA	\N	9	Ativo	0
1754	2004-10-09	JULIANNE PATRICIA OLIVEIRA DA SILVA	\N	9	Ativo	0
1755	2005-06-20	KAWANI MERI DO NASCIMENTO DE LIMA	\N	9	Ativo	0
1756	2006-02-01	PAMELA GENIRA SANTOS NUNES	\N	9	Ativo	0
1757	2005-06-30	PAULO HENRIQUE DOS SANTOS LOPES	\N	9	Ativo	0
1758	2005-09-15	RAPHAEL YBSON DOS SANTOS LEANDRO	\N	9	Ativo	0
1759	2005-03-06	RENATO JOSE DOS SANTOS	\N	9	Ativo	0
1761	2004-10-23	THENNYSON CAUA DE SUZA PEREIRA	\N	9	Ativo	0
1763	2004-06-15	ADAILTON FRANCA VALENTIM	\N	9	Ativo	0
1764	2004-06-02	AMARILDO BARBOSA DA SILVA JUNIOR	\N	9	Ativo	0
1765	2004-05-30	ANA GABRIELLA CAVALCANTE DE SOUZA	\N	9	Ativo	0
1608	2008-04-01	MARIA GLEISIANE SANTOS DO NASCIMENTO	\N	9	Ativo	0
1609	2007-08-06	MARIA KAROLINA EVANGELISTA DA SILVA	\N	9	Ativo	0
1610	2007-04-21	MARIA KELLY PESSOA DA SILVA	\N	9	Ativo	0
1611	2008-05-15	MARIA LOUYSE ALBANO DIAS	\N	9	Ativo	0
1612	2008-05-18	MIGUEL GOMES DE LIMA	\N	9	Ativo	0
1613	2007-04-30	RAISSA GABRIELA ROCHA RODRIGUES	\N	9	Ativo	0
1614	2007-05-12	SAMUELLYSON JACO GUILHERME DE LIMA	\N	9	Ativo	0
1615	2007-09-15	VINICIUS GABRIEL DO NASCIMENTO SILVA	\N	9	Ativo	0
1616	2007-05-25	VLADSON EDSON DA SILVA FERREIRA	\N	9	Ativo	0
1617	2007-01-18	ALANDERSON NUNES VENTURA	\N	9	Ativo	0
1618	2007-11-06	ERIKE ISMAEL TORRES SILVA	70714501450	9	Ativo	0
1619	2008-03-22	MARIA EDUARDA GOMES DA SILVA	\N	9	Ativo	0
1620	2007-09-12	MARIA LAURA TORRES LOPES	\N	9	Ativo	0
1621	2007-09-30	YASMIM ESTHEFFANE BERNADO DO NASCIMENTO	\N	9	Ativo	0
1622	2008-01-06	FLAVIANE ANDRADE DOS SANTOS	\N	9	Ativo	0
1623	2007-07-25	GILMAR SERGIO DA SILVA TEIXEIRA JUNIOR	\N	9	Ativo	0
1624	2006-08-03	ITUANA BARBOSA DA SILVA CORDEIRO	\N	9	Ativo	0
1625	2008-03-02	MARILIA GABRIELA SILVA DO NASCIMNTO	\N	9	Ativo	0
1626	2007-12-15	FELIPE ALVES CAVALCANTE	\N	9	Ativo	0
1627	2007-11-12	RAINARA NASCIMENTO DE LIMA	\N	9	Ativo	0
1628	2006-04-26	JOAO VICTOR DA SILVA	\N	9	Ativo	0
1629	2007-08-24	HELLOYSA LYDIANE DE SOUZA BARBOSA	\N	9	Ativo	0
1630	2007-10-15	FELIPE DE MELO NASCIMENTO	\N	9	Ativo	0
1631	2008-01-13	FABIELLE APARECIDA DE ARAUJO FELIX	\N	9	Ativo	0
1655	2007-02-14	MARIA CLARA DE SOUSA SOARES	\N	9	Ativo	0
1656	2006-08-18	MARIA LARISSA SILVA DE SOUZA	\N	9	Ativo	0
1657	2006-11-04	MARIA RAFAELA DA SILVA LIMA	\N	9	Ativo	0
2299	2001-07-30	WISLANE GYSELLE DE SOUSA PEREIRA	\N	9	Ativo	0
2054	1972-12-06	SIMONE DO NASCIMENTO RAMOS	81304480410	9	Ativo	0
2055	1964-06-08	JOANA DARC DA SILVA PESSOA	83754466453	9	Ativo	0
2056	1961-08-05	MARIA LUCIA FERREIRA DA SILVA	49814478415	9	Ativo	0
2058	1983-07-02	GISLAINE BEZERRA DE MELO NASCIMENTO	04716195406	9	Ativo	0
2059	1981-06-16	ANDERSON DE SOUZA SILVA	03372174402	9	Ativo	0
2060	1968-06-25	EDVONEIDE FERNANDES DA SILVA	49826077453	9	Ativo	0
2061	1959-05-13	MARIA IRIS DE FATIMA	56727410453	9	Ativo	0
2878	2005-10-29	BARBARA BEATRIS MOREIRA DANTAS	\N	9	Ativo	0
2879	2007-03-07	JÚNIOR FERREIRA DA SILVA	\N	9	Ativo	0
2880	2005-07-29	MARIA LEIDIANE LOPES DA SILVA	\N	9	Ativo	0
2881	2007-01-14	CARLOS ANTÔNIO SANTANA ALMEIDA	\N	9	Ativo	0
1659	2006-03-16	MESSIAS DE SILVA PEREIRA	\N	9	Ativo	0
1569	2010-03-22	LIDIA MARIA ALVES CAVALCANTE	12505780439E10	9	Ativo	0
1570	2008-11-04	ALLYSSON RAFAEL SOUZA DA SILVA	06122311430	9	Ativo	0
1571	2010-04-18	MARIA ELOYSA GOMES DA SILVA	\N	9	Ativo	0
1572	2009-07-11	AKSON VIANA COSTA	\N	9	Ativo	0
1573	2009-08-20	ANA BEATRIZ GOMES DE CASTRO	\N	9	Ativo	0
1574	2009-05-14	DEBORA VITORIA JUSTINO DA SILVA	\N	9	Ativo	0
1575	2010-03-23	ERICA MARIA CLEMENTE PEREIRA	12295447470	9	Ativo	0
1576	2008-11-03	INGRID BEATRIZ DA SILVA	\N	9	Ativo	0
1577	2009-08-22	ISAIAS EZEQUIEL DA SILVA PONTES	12274481474	9	Ativo	0
2900	2005-09-14	DAIANE HELLOÍZE SILVA	\N	9	Ativo	0
2901	2006-02-17	THAUÃ GABRIEL SOUSA E SILVA	\N	9	Ativo	0
2902	2005-11-14	JOÃO PAULO LIMA DE SOUSA	\N	9	Ativo	0
1906	2007-08-06	JEAN DE BRITO LIMA	\N	7	Ativo	0
2399	2014-10-01	Manaia Junior	87978797897879	0	Ativo	0
2400	2014-10-01	Roberto Manaia dos Santos Junior	9555555555555555	0	Ativo	0
2401	2014-10-01	Roberto Manaia dos Santos Junior	566666666666587	0	Ativo	0
2403	2014-10-01	testar funcionario	33333333333333333	0	Ativo	0
2423	2014-10-02	ZOME DO PROFESSOR23700	090249	0	Ativo	0
2427	2014-10-10	ZESCOLA VAI QUEM QUER	30123654564	0	Ativo	0
2469	2014-11-05	aaaaaaaaa	545555	0	Ativo	0
2538	2014-12-03	0000	00	0	Ativo	0
2502	2014-11-14	ZZZ	321654687812213213	0	Ativo	0
2533	2014-12-02	testim	789455225258285	0	Ativo	0
2534	2014-12-02	testim	7897987898798798798789789	0	Ativo	0
2544	2014-12-05	ttttttttttttt	\N	0	Ativo	0
2545	2014-12-05	ttttttttttttt	\N	0	Ativo	0
2562	2014-12-05	thiago nois de souza	123456789	0	Ativo	0
2580	2014-12-08	f	9864546	0	Ativo	0
2582	2014-12-08	zzzzzzz	\N	0	Ativo	0
2596	2014-12-09	teste3 333	5899989699	0	Ativo	0
2599	2014-12-09	qw	888	0	Ativo	0
2601	2014-12-09	trert	55855555	0	Ativo	0
2605	2014-12-09	zzzzzzzzzz	984531345641541	0	Ativo	0
2615	2014-12-09	55858754	uuuuuuuuuuuuu	0	Ativo	0
2619	2014-12-09	sdffsdfsdfsdfsdfe3eeee	122123323233	0	Ativo	0
2640	2014-12-10	teste2222089	55899999988	0	Ativo	0
2645	2014-12-10	123	1232	0	Ativo	0
2662	2014-12-11	wreee	21342342	0	Ativo	0
920	2003-12-31	MARCIA SILVA DE OLIVEIRA	\N	8	Ativo	0
921	2004-01-28	MARIA CLARA WILKOVESK VIEIRA TEIXEIRA	\N	8	Ativo	0
922	2003-10-24	MARIA ISABEL DE LIMA SILVA	\N	8	Ativo	0
923	2004-04-16	MARIA REGINA DA SILVA OLIVEIRA	\N	8	Ativo	0
924	2004-01-03	MARILIA GABRIELA LOPES PEREIRA	\N	8	Ativo	0
925	2003-02-03	MATHEUS BRUNO NASCIMENTO DIAS	\N	8	Ativo	0
926	2003-06-05	NATHAN RICHARDSON DA SILVA	\N	8	Ativo	0
927	2004-02-28	PEDRO VITOR SOARES DA COSTA	\N	8	Ativo	0
928	2003-08-23	RISHERLLY IWLI SILVA DO NASCIMENTO	12223129480	8	Ativo	0
929	2004-02-02	SULAMITA RAQUEL DA ROCHA SANTANA	70788040405	8	Ativo	0
930	2004-01-08	TATIANE COSME DE OLIVEIRA	\N	8	Ativo	0
931	2003-05-26	WELISSANDRA SANTOS DA PAIXAO	\N	8	Ativo	0
932	2004-11-01	ILANA BEATRIZ PASCOAL MARQUES	\N	8	Ativo	0
2099	1969-12-05	GERUZA MARIA DE MORAIS	\N	8	Ativo	0
2100	1982-07-19	CLAUDIA DE MORAIS SOUZA	01385643455	8	Ativo	0
2101	1984-02-01	FRANCISCO ISAAC D OLIVEIRA	04680127457	8	Ativo	0
2103	1959-08-31	IVALDO LUIZ CAVALCANTE	19623453434	8	Ativo	0
2104	1971-01-22	MARCIANO DANTAS DE MEDEIROS	76177610404	8	Ativo	0
933	2002-01-02	ALICE BEATRIZ FERNANDES DE ARAUJO	\N	8	Ativo	0
934	2000-06-01	ANA PAULA BARBOSA DE LIMA	11037357485	8	Ativo	0
935	2001-07-15	ANA VITORIA NASCIMENTO DE LIMA	\N	8	Ativo	0
936	2001-05-26	ANDERSON OLIVEIRA DE ANDRADE	70194736440	8	Ativo	0
937	2003-09-14	BEATRIZ SILVA DOS SANTOS	12420955439	8	Ativo	0
938	2001-12-03	CAIO GABRIEL MARTINS DE ANDRADE	\N	8	Ativo	0
939	2001-07-21	DANIEL BARBOSA DA SILVA	\N	8	Ativo	0
940	2002-09-26	DEBORA EVELIN PINHEIRO DA SILVA	\N	8	Ativo	0
941	2002-06-05	ELAINE NAIR ALVES DE MELO	\N	8	Ativo	0
942	2001-12-29	ELIZONILDO ROBERT SANTOS DE OLIVEIRA	\N	8	Ativo	0
943	2002-05-25	ERICA NATALY CANDIDO DA SILVA	70445325437	8	Ativo	0
944	2003-01-20	FRANCISCO EDUARDO SANTOS DE OLIVEIRA JUNIOR	\N	8	Ativo	0
945	2001-09-30	JEAN CARLO SOUZA DA SILVA	\N	8	Ativo	0
946	2003-07-14	JENNIFER REBECA COSTA DE ANDRADE	\N	8	Ativo	0
947	2002-09-13	JOYCY TAMARA DA SILVA BATISTA	\N	8	Ativo	0
948	2003-09-21	KAUA EMANUEL RAMOS TEIXEIRA	\N	8	Ativo	0
949	2000-09-26	LEANDRO INACIO DOS SANTOS BEZERRA	\N	8	Ativo	0
950	2002-04-14	MARIA EDUARDA PEREIRA DA SILVA	\N	8	Ativo	0
951	2000-05-06	MATHEUS GUIBYSON FERREIRA	70743208463	8	Ativo	0
952	2002-06-24	NEVES GABRIELY LIMA DE OLIVEIRA	\N	8	Ativo	0
953	2002-04-01	RAISSA CAROLINE BRITO DE SOUSA	\N	8	Ativo	0
954	2002-11-14	STEFANIA KAROLINE MATIAS DANTAS	\N	8	Ativo	0
955	2003-09-27	SYANNE OLIVEIRA DO NASCIMENTO	70734962401	8	Ativo	0
956	2002-06-02	TAILSON ANDRIEL DOS SANTOS FERREIRA	\N	8	Ativo	0
957	2002-08-08	VITOR MANOEL MENDES DOS SANTOS	70629877417	8	Ativo	0
958	2003-01-06	AGHATA CRISTAL LACERDA CAVALCANTI	11766122477	8	Ativo	0
959	2003-10-15	ALISON DA SILVA DE MELO	\N	8	Ativo	0
960	2003-02-05	AMANDA DA SILVA LOCAL	\N	8	Ativo	0
961	2003-04-18	DHARLENIO ALVES DE LIMA	\N	8	Ativo	0
962	2003-08-30	ELLEN RACKEL DOS SANTOS MENDES	\N	8	Ativo	0
963	2003-11-12	ELYSON VINICIO DA SILVA LIMA	\N	8	Ativo	0
964	2003-07-09	EVERSON FILIPE FAUSTINO DA SILVA ARRUDA	70752235427	8	Ativo	0
965	2003-01-02	GLENDA DAYANA CAVALCANTI DE LIMA	\N	8	Ativo	0
966	2002-07-18	FRANKSON MICAEL DE SOUZA NEVES NASCIMENTO	\N	8	Ativo	0
967	2003-01-14	GUILHERME JERONIMO DE CARVALHO	70081837470	8	Ativo	0
968	2002-03-29	HAYRA KARILANE NASCIMENTO ANDRADE	\N	8	Ativo	0
969	2002-12-29	ISMAEL DAVI DOMINGOS SANTOS	11261313429	8	Ativo	0
970	2002-12-01	JAMILLY STHEFANY GOMES DA SILVA	70794950400	8	Ativo	0
971	2003-03-13	JAMILLY VIEIRA DO NASCIMENTO	\N	8	Ativo	0
972	2003-09-25	JORDAO DANTAS HENRIQUE	01715142462	8	Ativo	0
973	2003-04-06	JOSE LEORNADO DA SILVA PAIVA	\N	8	Ativo	0
974	2003-07-22	JOSE PATRICIO PINHEIRO DA SILVA JUNIOR	\N	8	Ativo	0
975	2002-05-02	JOSE ROBERTO RUAN FERNANDES FERREIRA	\N	8	Ativo	0
976	2002-01-23	JOSE ROMULO DE MELO FONTES	\N	8	Ativo	0
977	2002-03-21	JUDSON LUCAS PONTES DOS SANTOS	12432224418	8	Ativo	0
978	2003-04-25	JULIO PEDRO TAVARES DA SILVA	\N	8	Ativo	0
979	2003-04-13	KELINE BATISTA PINHEIRO	\N	8	Ativo	0
980	2003-02-10	LAYANE VITORIA DANTAS DE SOUSA	11230874402	8	Ativo	0
981	2002-07-09	LESTON GELSON SILVA DE ARAUJO	\N	8	Ativo	0
982	2003-05-01	LIDIA FERNANDA LIMA DO NASCIMENTO	\N	8	Ativo	0
983	2003-01-09	MARILIA VITORIA DA SILVA RODRIGUES	\N	8	Ativo	0
984	2003-04-29	MATEUS MESSIAS VASCONCELOS LIMA	\N	8	Ativo	0
985	2003-03-17	MAURY KENNED DOS SANTOS DE OLIVEIRA	\N	8	Ativo	0
986	2003-01-14	MIRIELLE PEREIRA DE MACEDO	70733573479	8	Ativo	0
988	2002-03-15	PAMELA CRISTINA NASCIMENTO DE QUEIROZ	\N	8	Ativo	0
989	2003-09-22	PEDRO VYTOR SANTOS DE MEDEIROS	01741323444	8	Ativo	0
990	2002-02-28	SAMARA MARIA DOS SANTOS DA SILVA	70760612447	8	Ativo	0
991	2002-02-28	SANDERSON SAMUEL DO NASCIMENTO	\N	8	Ativo	0
992	2002-05-24	VENILSON NASCIMENTO DA SILVA	\N	8	Ativo	0
993	2002-09-23	VITORIA EVELYN DE ALBUQUERQUE SAMPAIO	\N	8	Ativo	0
994	2003-10-10	WILLYAM LAUHAN SILVA DO NASCIMENTO	\N	8	Ativo	0
995	2003-03-09	WEMERSON THIAGO DA SILVA XAVIER	\N	8	Ativo	0
996	2002-06-27	YASMIM SIQUEIRA DE JESUS MIRANDA	\N	8	Ativo	0
997	2002-12-05	ADENILSON FELIX DO NASCIMENTO	\N	8	Ativo	0
998	2002-08-17	ADSON GABRIEL DO NASCIMENTO SILVA	\N	8	Ativo	0
999	2002-01-29	ALANE DA COSTA PENHA	\N	8	Ativo	0
1000	2002-12-15	ALYSON WENDEL DOS SANTOS COSTA	\N	8	Ativo	0
1001	2002-10-10	ANA BEATRIZ DO NASCIMENTO TEIXEIRA	\N	8	Ativo	0
1002	2002-08-16	ANA PAULA BARBOSA DE ARAUJO	11228860475	8	Ativo	0
1003	2002-10-06	ANDRESA CAROLAINE ROMAO DA SILVA	\N	8	Ativo	0
1004	2002-07-07	BRUNA CARVALHO DA COSTA	70361004435	8	Ativo	0
1005	2002-09-03	CLARA RAYANE RAMOS DE MELO	\N	8	Ativo	0
1006	2002-05-09	CLAUDIO FELIPE CAVALCANTI DA SILVA	\N	8	Ativo	0
1007	2002-09-15	DANIELLE BESERRA DA SILVA	\N	8	Ativo	0
1008	2002-05-29	DEIVID DO NASCIMENTO TAVARES	12455614484	8	Ativo	0
1009	2002-11-29	DIOGENIA BIATRIZ SILVA DO NASCIMENTO	12472075448	8	Ativo	0
1010	2002-06-21	EMILE KELY MARTINS DOS SANTOS	\N	8	Ativo	0
1011	2002-07-06	EMERSON GABRIEL LIMA FERNANDES	\N	8	Ativo	0
1012	2002-04-30	FERNANDO BARBOSA PINHEIRO	70091034450	8	Ativo	0
1013	2002-11-15	FERNANDO OLIVEIRA DA SILVA	12441915401	8	Ativo	0
1014	2002-09-19	FRANCINALDO SANTOS DA SILVA	12346293482	8	Ativo	0
1016	2002-10-24	GUILHERME SIMAO SILVA	12451596406	8	Ativo	0
1017	2002-12-22	ITALO XAVIER GOMES DE LIMA	\N	8	Ativo	0
1018	2002-07-25	JADRYELLE MILENA DE SOUZA MORAIS	\N	8	Ativo	0
1019	2002-08-26	JONAS GABRIEL SIQUEIRA DE LIMA	\N	8	Ativo	0
1020	2002-09-19	JULIA GABRIELE NASCIMENTO DA SILVA	\N	8	Ativo	0
1021	2002-12-23	KAILANE ANDRIELE SILVA DO NASCIMENTO	\N	8	Ativo	0
1022	2002-07-16	LIJARDSON LIMA ROMAO DO NASCIMENTO	\N	8	Ativo	0
1023	2001-06-18	LUCAS DA SILVA AGUIAR DO NASCIMENTO	\N	8	Ativo	0
1024	2002-07-29	LUIZ GONZAGA DANTAS DE MELO	\N	8	Ativo	0
1025	2002-12-13	MANOELA DA SILVA AGUIAR DO NASCIMENTO	\N	8	Ativo	0
1026	2002-05-20	MARIA LAYANE DA SILVA	\N	8	Ativo	0
1027	2002-03-16	MANUELA KAROLAINE SILVA DA PAIXAO	\N	8	Ativo	0
1028	2002-09-26	MAYARA SILVA DE GOIS	\N	8	Ativo	0
1029	2002-10-13	MAXWEL PAULINO DA SILVA	\N	8	Ativo	0
1030	2002-06-28	PEDRO HENRIQUE COLARES	\N	8	Ativo	0
1031	2002-04-14	RAYANE OLIVEIRA DA SILVA	\N	8	Ativo	0
1032	2002-10-12	RAYSSA LORRANE SILVA MACENA DA COSTA	12469825440	8	Ativo	0
2794	2015-02-05	Escola municipal Maconhal do BOB	1200282611179	0	Ativo	0
2280	1964-09-15	CARLOS AUGUSTO SIQUEIRA MACARIO	48291129487	0	Ativo	0
2281	1971-08-26	MEIZE LIMA DA CRUZ	47468203415	0	Ativo	0
2282	1981-11-15	ANGELA CARLA BARBOSA DA SILVA	00825443440	0	Ativo	0
2283	1982-06-11	ANTONIA MARIA DE MELO ATANASIO	01014864488	0	Ativo	0
2284	1975-11-03	TANIA MARIA AZEVEDO DE LIMA	87590344400	0	Ativo	0
1	1990-01-01	franklin	123	0	Ativo	0
1033	2002-07-01	ROBSON KEVIN GALDINO DOS SANTOS	70749064412	8	Ativo	0
1034	2002-07-09	SULAMITA DO NASCIMENTO RODRIGUES DE SOUZA	\N	8	Ativo	0
1035	2002-07-05	TARSIS LUIS FREIRE FERREIRA	\N	8	Ativo	0
2799	2009-12-12	LUÍS EDUARDO DE AZEVEDO	\N	9	Ativo	0
1036	2002-06-12	AGATHA GLENDA DA ROCHA ARAUJO	01807466426	8	Ativo	0
1037	2002-08-25	ALEF KAUAN DOS SANTOS BARBOSA	70338900446	8	Ativo	0
1038	2000-03-24	AMANDA BEATRIZ CAMPOS DE LIMA	\N	8	Ativo	0
1039	2001-03-05	BRENO MADSON DA SILVA	70218371438	8	Ativo	0
1040	2001-05-10	CARLA KETHNY DAMASCENO DE FARIAS	\N	8	Ativo	0
1041	2002-09-14	CINTIA RAISSA SANTOS DO NASCIMENTO	01807438481	8	Ativo	0
1042	2001-07-04	DANILO SOLIDONIO DA SILVA	70400139405	8	Ativo	0
1043	2001-11-08	DAVI GUILHERME DOS SANTOS	\N	8	Ativo	0
1044	2002-10-20	DAVID MATEUS RODRIGUES BALDUINO	\N	8	Ativo	0
1045	2001-01-19	EDENILSON PEREIRA DA SILVA CAMARA	\N	8	Ativo	0
1046	2002-11-24	HALLYANE DOS SANTOS DAMASCENO	\N	8	Ativo	0
1047	2001-11-06	ISMAEL FILIPE BEZERRA	70722932480	8	Ativo	0
1048	2001-04-09	IZADORA CAMARGO AMARANTES	\N	8	Ativo	0
1049	2001-09-04	JAANE MARIA CABRAL DA SILVA	12407772482	8	Ativo	0
1050	2002-08-24	JHENNEFY CAMILLY DE ASSIS FARIAS	12446361420	8	Ativo	0
1051	2002-03-14	JHONATAS MATHEUS ALMEIDA DO NASCIMENTO	12437016414	8	Ativo	0
1052	2002-12-11	JOAO VICTOR ALBUQUERQUE DA SILVA	70749219475	8	Ativo	0
1053	2001-06-20	KAMILA DOMICIANO DOS SANTOS	\N	8	Ativo	0
2970	\N	teste argume	\N	0	Ativo	0
1054	2001-10-08	LIVIA OLIVEIRA DO NASCIMENTO	12482386489	8	Ativo	0
1055	2001-09-17	LARISSA RAIARA GOMES DA SILVA	70710150407	8	Ativo	0
1056	2002-04-24	LUANDERSON RODRIGUES DA SILVA NASCIMENTO	70710237430	8	Ativo	0
1057	2001-05-15	MARIA IVETE NASCIMENTO DA SILVA	\N	8	Ativo	0
1058	2001-08-27	NOEMIA LARISSA SILVA CAMARA	\N	8	Ativo	0
1059	2002-04-21	POLYANA PRISCILA DA SILVA	12480229475	8	Ativo	0
1060	2001-09-30	RAFHAEL DIAS CAMARA	01803804432	8	Ativo	0
1061	2001-11-14	GABRIEL CIOLE ANDRADE	12420699416	8	Ativo	0
1062	2002-07-08	RYAN RODRIGUES DA CRUZ	\N	8	Ativo	0
1063	2002-06-23	STHEFANY PERERIA	\N	8	Ativo	0
1064	2002-07-23	SUNAMITA DOS SANTOS SILVA	70338899413	8	Ativo	0
1065	2000-10-21	THAYNAN JEMERSON DE SOUZA SILVA	\N	8	Ativo	0
1066	2002-08-22	VANESSA RAIANE GOMES DOS SANTOS	\N	8	Ativo	0
1067	2002-03-07	VICTOR BRUNO DA COSTA SANTOS	\N	8	Ativo	0
1068	2002-04-17	VICTOR GABRIEL RODRIGUES DANTAS DA SILVA	12511813416	8	Ativo	0
1069	2001-09-28	VITORIA LARISSE DE SOUZA	\N	8	Ativo	0
1070	2001-08-23	VIVIANE SOARES DA COSTA	\N	8	Ativo	0
1071	2002-04-09	VYTORIA YASMINEE ALVES DA COSTA	70358551498	8	Ativo	0
1072	2001-12-14	WILIAM SALVIANO PINTO	\N	8	Ativo	0
1073	2002-02-14	WEFERSON DOMINGOS CRUZ DE LIMA	\N	8	Ativo	0
1074	2003-01-19	INARA BIANCA PASCOAL MARQUES	\N	8	Ativo	0
1075	1999-10-29	ALANE MORAIS DE LIMA	\N	8	Ativo	0
1076	2001-04-08	AMANDA IDALINA XAVIER DE MOURA	\N	8	Ativo	0
1077	2001-06-19	ANA BEATRIZ DA SILVA MATIAS	\N	8	Ativo	0
1078	2000-05-05	ANDERSON SILVA DO NASCIEMENTO	\N	8	Ativo	0
1079	2001-02-13	ANDRESSA KALLYNE SILVA DA FONSECA	\N	8	Ativo	0
1080	2000-02-11	DAVID RENATO SANTANA DOS SANTOS	\N	8	Ativo	0
1081	1999-09-19	DEBORA ALINE DE OLIVEIRA SOUSA	\N	8	Ativo	0
1082	2001-07-25	DIEGO RODRIGUES DA SILVA	70094318424	8	Ativo	0
1083	1994-05-07	EDILENE DO VALE BEZERRA	\N	8	Ativo	0
1084	2000-08-31	EDJANAISON SILVA DOS SANTOS	\N	8	Ativo	0
1085	2001-06-06	EMERSON MANOEL CAVALCANTI DE LIMA	\N	8	Ativo	0
1086	2000-11-15	EVERTON LUCAS PEREIRA DE OLIVEIRA	\N	8	Ativo	0
1087	2001-09-22	GABRIELE CRISTINE SILVA DE CARVALHO	\N	8	Ativo	0
1088	2001-09-18	GLENIO WILKER DE ARAUJO COSTA	\N	8	Ativo	0
1089	2000-04-17	ITALO SOARES DA SILVA	01768455422	8	Ativo	0
1090	2001-03-27	JOALISON WILKER CANDIDO DA SILVA	70445324465	8	Ativo	0
1091	2000-11-02	JOAO VICTOR DA SILVA CATARINO	\N	8	Ativo	0
1092	2000-06-27	JOEL COSTA DA SILVA	12473712476	8	Ativo	0
1093	2001-11-22	JORDAN SIQUEIRA DOS SANTOS	\N	8	Ativo	0
1095	2000-08-12	LETICIA BEATRIZ DA ROCHA FIRMINO	01807468470	8	Ativo	0
1096	2001-07-17	LEVI MATEUS PEREIRA DA SILVA	\N	8	Ativo	0
1097	2000-09-15	LUANA PATRICIA SOARES DO NASCIMENTO	\N	8	Ativo	0
1098	2001-07-11	LUCAS MATEUS ALVES PEREIRA	\N	8	Ativo	0
1099	2001-06-14	LUIS PEDRO FLAUSINO NETO	\N	8	Ativo	0
1100	2000-04-15	MAIARA KAROLAYNE DA SILVA TEIXEIRA	70710292457	8	Ativo	0
1101	2000-11-02	MARIA VITORIA DA SILVA CATARINO	\N	8	Ativo	0
1102	2001-02-16	MIKAELLE PEDROZA DE ARAUJO	\N	8	Ativo	0
1103	2001-11-06	NICOLAS RODRIGO SANTANA DOS SANTOS	\N	8	Ativo	0
1104	2001-04-03	PETRUS ALVES BATISTA	\N	8	Ativo	0
1105	1999-11-28	RAYANE MACEDO DE LIMA	\N	8	Ativo	0
1106	2001-10-14	RICHARDSON DA COSTA CARNEIRO	\N	8	Ativo	0
1107	2001-08-14	RITHA DE KASSIA RIBEIRO DE LIMA	\N	8	Ativo	0
1108	2001-05-21	SOSTENES RUBEN SILVA DE OLIVEIRA	\N	8	Ativo	0
1109	2000-01-27	VINICIUS EDUARDO ROSENDE DA SILVA	05297625440	8	Ativo	0
1111	2001-05-26	AMOS VICTOR MEDEIROS DE SOUZA	\N	8	Ativo	0
1112	2000-11-18	ANA DEBORA FERNANDES ALVES	\N	8	Ativo	0
1113	2000-07-15	ARTUR BRENDO SILVA DE OLIVEIRA	\N	8	Ativo	0
1114	2002-08-20	BRUNA DA SILVA SANTOS	\N	8	Ativo	0
1115	2001-07-15	ERIVANIA RIBEIRO DE ALMEIDA	\N	8	Ativo	0
1116	2000-09-29	FELIPE ERIK DA SILVA RIBEIRO	\N	8	Ativo	0
1117	1997-10-04	FRANCISCA IZABEL TEIXEIRA DANTAS	\N	8	Ativo	0
1118	2000-12-30	HEMANUELLE DA SILVA BATISTA	10941859495	8	Ativo	0
1119	2000-07-15	JONATHAS WASHINGTON DA SILVA	\N	8	Ativo	0
1120	2001-05-25	JOSE AUGUSTO DA SILVA RODRIGUES	\N	8	Ativo	0
1121	2001-09-05	JULIANA MARIA VASCONCELOS LIMA	\N	8	Ativo	0
1122	2000-10-16	KELIANA BEZERRA DE FARIAS	\N	8	Ativo	0
1123	2001-09-18	LARA FABIA SANTOS DO NASCIMENTO	\N	8	Ativo	0
1124	2001-06-02	LETICIA VIANA DA SILVA	\N	8	Ativo	0
1125	2001-06-18	LIVIA NOEMI RAMOS DE SOUZA	\N	8	Ativo	0
1126	2001-10-10	LUA DA SILVA SEGUNDO	70090535456	8	Ativo	0
1127	2000-02-24	MAERLE LIANE SILVA DO NASCIMENTO	\N	8	Ativo	0
1128	2001-09-04	MANUELY ALVES DANTAS DE CALDAS	\N	8	Ativo	0
1129	2001-05-17	MARIA EDUARDA CAMPOS DA SILVA	\N	8	Ativo	0
1130	2001-10-25	MARIA ELISANGELA DE OLIVEIRA CONFESSOR	\N	8	Ativo	0
1131	2001-05-03	MATEUS LUCAS SOUZA DO NASCIMENTO	\N	8	Ativo	0
1132	2001-10-06	MAYARA DA SILVA MARCOLINO	\N	8	Ativo	0
1133	2000-04-06	MOISES FABRICIO XAVIER DA SILVA	\N	8	Ativo	0
1134	2000-08-25	MICAELE PEREIRA DE MACEDO	70733572405	8	Ativo	0
1135	2001-10-18	MICARLA PEREIRA DE MACEDO	70733571425	8	Ativo	0
1136	2000-11-01	MONIK DAYANE MONTEIRO DE ARAUJO	05167327490	8	Ativo	0
1137	2001-02-13	NATASHA LETICIA DOS REIS DA CUNHA	\N	8	Ativo	0
1138	2000-09-19	RAFAEL MATEUS COSME DE LIMA	\N	8	Ativo	0
1139	2001-12-17	RONY ANDERSON OLIVEIRA DE MIRANDA	\N	8	Ativo	0
1140	2000-04-24	ROSIVALDO ROMAO DA SILVA	\N	8	Ativo	0
1141	2001-05-29	RUAN PABLO DE SOUZA ALVES	\N	8	Ativo	0
1142	2000-09-29	SANDY SAMARIA DO NASCIMENTO SILVA	\N	8	Ativo	0
1143	2000-03-25	SARA NOEMIA DA SILVA LOPES	\N	8	Ativo	0
1144	1998-12-09	SINARA RAIHANNE DA SILVA	\N	8	Ativo	0
1145	2000-09-17	SONALY NICACIO DE OLIVEIRA NUNES	\N	8	Ativo	0
1146	2000-03-29	TAINARA BARBOSA PIMENTEL	\N	8	Ativo	0
1147	2000-11-11	VANESSA BERNARDINO DA SILVA	\N	8	Ativo	0
1148	2000-10-01	WALLYSON BRUNO BATISTA DA SILVA	\N	8	Ativo	0
1149	2000-09-28	MAURICIO BATISTA DA SILVA	\N	8	Ativo	0
1150	2001-03-18	ADRYAN GABRIEL BEZERRA DA SILVA	12469667437	8	Ativo	0
1151	2000-01-10	AMANDA NASCIMENTO DA SILVA SANTOS	\N	8	Ativo	0
1152	1999-12-13	BRUNO SILVA DE SOUSA	\N	8	Ativo	0
1154	1999-08-21	EDUARDO JOSE DA SILVA	\N	8	Ativo	0
1155	1999-07-26	EIRISON RUAN GOMES DA SILVA	\N	8	Ativo	0
1156	2000-10-17	EMANUEL JESUS CONFESSOR DE SOUSA	\N	8	Ativo	0
1157	2000-02-27	FRANCILAINE DE SOUZA NICACIO	\N	8	Ativo	0
1158	2000-03-28	FRANCISCO CANINDE NUNES GOMES	\N	8	Ativo	0
1159	2002-01-21	FRANCISCO LUCAS FEIJO DE SOUZA	\N	8	Ativo	0
1160	2002-03-04	GABRIEL SEVERIANO DA COSTA	\N	8	Ativo	0
1161	2003-01-10	GABRIELA KARDALLEYLL DA SILVA COSTA	\N	8	Ativo	0
1162	2001-08-12	GABRIELA PATRICIA SOARES DA SILVA	70015134407	8	Ativo	0
1163	1999-07-30	IVAN YURI FELIPE DE OLIVEIRA	\N	8	Ativo	0
1164	2000-03-09	IVISSON DE OLIVEIRA RODRIGUES	\N	8	Ativo	0
1165	1999-08-01	JEFFERT NASCIMENTO DA SILVA	70414706447	8	Ativo	0
1166	1999-05-14	JERFESON ANTONIO DA SILVA NASCIMENTO	\N	8	Ativo	0
1167	1999-04-16	JOAO PAULO DOS SANTOS	01419029495	8	Ativo	0
1168	2000-04-10	JOAO VITOR SILVA DO NASCIMENTO	\N	8	Ativo	0
1169	1999-12-30	LAIANNI THAINA LOURENCO DE SOUZA	\N	8	Ativo	0
1170	1999-10-13	LIZANDRA NAYARA DE OLIVEIRA SOLANO	70308013425	8	Ativo	0
1171	2001-04-22	LUANA FRANCISCA DE MELO	\N	8	Ativo	0
1173	1999-08-21	LUIZ FELIPE RODRIGUES DA SILVA	\N	8	Ativo	0
1174	2001-03-24	MARIA AMANDA SOUZA DOS ANJOS	\N	8	Ativo	0
1176	1999-09-20	MICHAEL DOUGLAS DA SILVA ARAUJO	\N	8	Ativo	0
1177	1999-03-30	NYCOLLAS DYEGO DE SOUZA BEZERRA	70312890419	8	Ativo	0
1178	2000-09-18	PAULO RICARDO DANTAS ANGELO DA SILVA	\N	8	Ativo	0
1179	2001-02-10	RAQUEL EDNA ALVES REBOUCAS	\N	8	Ativo	0
1180	2000-05-24	SHEILA MEDEIROS DA ROCHA	\N	8	Ativo	0
1181	2001-04-25	TAYNARA VALDIVINO FERNANDES	\N	8	Ativo	0
1182	1999-06-27	THAIS EDUARDA SILVA DE MELO	\N	8	Ativo	0
1183	1999-06-04	VALESKA THAUANA SOUZA FERREIRA DA SILVA	08590092461	8	Ativo	0
1184	1999-03-28	ITALO FERREIRA DANTAS DE LIMA	\N	8	Ativo	0
1185	2001-02-16	ADAM CESAR CASADO MARTINS	\N	8	Ativo	0
1186	2001-05-11	ALICE MIRANDA DE CARVALHO	\N	8	Ativo	0
1187	2001-06-16	ALISSON VINICIUS DA CUNHA	\N	8	Ativo	0
1188	2000-04-11	AMANDA DE SOUZA FERREIRA	\N	8	Ativo	0
1189	2000-07-08	ANA BEATRIZ MENDES DOS SANTOS	70138107467	8	Ativo	0
1190	2001-08-18	ANA CLAUDIA ALMEIDA DE LIMA	\N	8	Ativo	0
1191	2000-11-02	ANDRIELL COSME DA SILVA	\N	8	Ativo	0
1192	2000-07-19	BIANCA GOMES DA SILVA	\N	8	Ativo	0
1193	2000-03-09	CARLOS EDUARDO SILVEIRA MEDEIROS	70338834478	8	Ativo	0
1194	2000-05-27	CAMILA KAROLINA DA SILVA	07287930404	8	Ativo	0
1196	2000-03-22	ELISSON CARLOS COSME DE OLIVEIRA	\N	8	Ativo	0
1197	2000-07-20	EMANUEL SALVADOR DE SOUZA E SILVA	12815221418	8	Ativo	0
1198	2001-02-14	FERNANDO GABRIEL FERREIRA DOS SANTOS	\N	8	Ativo	0
1199	2001-09-02	FRANCIELE FERNANDES GOMES DA SILVA	12481293428	8	Ativo	0
1200	2000-05-21	GRASIELE CLAINE SILVA DE CARVALHO	\N	8	Ativo	0
1201	2001-04-19	IONARA BARBOSA PIMENTEL	\N	8	Ativo	0
1202	2001-03-31	ITALO DANIEL TEODOSIO DOS SANTOS	\N	8	Ativo	0
1203	2001-09-11	ITALO KENNEDY TAVARES DE OLIVEIRA	\N	8	Ativo	0
1204	2001-05-14	JESSICA ELIZANGELA SILVA DOS SANTOS	\N	8	Ativo	0
1205	2001-05-10	KAROLAINE GARCIA DE LIMA	\N	8	Ativo	0
1206	1999-12-23	LETICIA SANDY DA SILVA CRUZ	70300679408	8	Ativo	0
1207	2001-04-07	LISNARA HELOISA KELLY SANTOS DE SOUSA	\N	8	Ativo	0
1208	2001-01-25	LUCIANE FABRICIA NASCIMENTO DA SILVA	70074473417	8	Ativo	0
1209	2001-01-06	LUCAS GABRIEL RODRIGUES DA SILVA	\N	8	Ativo	0
1210	2001-03-24	MARIA EDUARDA LUCENA DE MEDEIROS	\N	8	Ativo	0
1211	2000-09-12	MARCELO AUGUSTO SILVA ARAUJO	70705492451	8	Ativo	0
1212	2001-11-05	MARCOS VITOR PAULINO DA SILVA	\N	8	Ativo	0
1213	2001-02-24	MARIANA DA SILVA GOMES	\N	8	Ativo	0
1214	2000-05-01	MARIANE SOUZA DE MIRANDA	\N	8	Ativo	0
1215	2000-03-03	PAULO EMMANUEL ALMEIDA DE SOUZA	\N	8	Ativo	0
1216	2000-06-23	RAILSON LUCAS ARAUJO PEREIRA DA SILVA	\N	8	Ativo	0
1217	2001-07-07	RAPHAEL MIQUEIAS DE BRITO RODRIGUES ALMEIDA	\N	8	Ativo	0
1218	2000-05-02	RONILSON DA SILVA SANTOS	\N	8	Ativo	0
1219	2001-06-28	RUTH MENEZES GOMES DA SILVA	\N	8	Ativo	0
1220	2001-09-22	SAMUEL DA ROCHA SANTANA	70103050485	8	Ativo	0
1221	2001-04-18	SAULO KISLANDERSON RAMOS TEIXEIRA	\N	8	Ativo	0
1222	2001-04-19	SARA CHAYENE HONORATO MOTA	\N	8	Ativo	0
1223	2001-02-02	THALES RICARDO GOMES DOS SANTOS	\N	8	Ativo	0
1224	2000-03-17	YARA KAROLINE LIMA DA SILVA	\N	8	Ativo	0
1225	2000-04-26	YASMIM CRISTINA DE MORAIS	\N	8	Ativo	0
1226	1999-10-05	ALAN WAGNER SOARES CARRILHO	70388011475	8	Ativo	0
1227	2000-02-21	ANTONIO KACIO RIBEIRO BARBOSA	07950441437	8	Ativo	0
1228	2000-04-30	BRUNA CAROLINE NASCIMENTO DOS SANTOS	10801924413	8	Ativo	0
1229	2000-08-25	CAMILA COSTA DA SILVA	70517192462	8	Ativo	0
1230	1999-02-01	DANILO WISNEY FELIX DA SILVA	\N	8	Ativo	0
1231	2000-11-27	FAGNER LENON DA SILVA PEREIRA	\N	8	Ativo	0
1232	2000-10-09	GISELLE KALINE DA SILVA SOUZA	\N	8	Ativo	0
1233	2000-12-08	ICARO DOS SANTOS SILVA	\N	8	Ativo	0
1234	2000-10-19	INGRID MEDEIROS DA SILVA	\N	8	Ativo	0
1235	2000-12-22	JANAINA BEZERRA DA SILVA	01657065464	8	Ativo	0
1236	1998-05-29	JARDDYLLA CESAR DA SILVA	\N	8	Ativo	0
1237	2000-04-04	JOAO VITOR ALVES PEREIRA	\N	8	Ativo	0
1238	2000-04-16	JONATAS ELIAS CABRAL DE OLIVEIRA	\N	8	Ativo	0
1239	2000-10-20	JOYCE AVELINO DA SILVA	\N	8	Ativo	0
1240	2000-06-08	LAISE ANDRIELLE DOS SANTOS FERREIRA	\N	8	Ativo	0
1241	2000-04-07	LIVIAN CRISTIAN SILVA MENDES DE OLIVEIRA	\N	8	Ativo	0
1242	2000-02-17	LORENA TALITA SANTOS DE SOUSA	70120177404	8	Ativo	0
1243	2000-06-19	LUIZ FELIPPE ARAUJO DA SILVA	\N	8	Ativo	0
1244	2000-11-15	MARIA EDUARDA CUNHA DE OLIVEIRA	\N	8	Ativo	0
1245	2000-05-27	MARIA LUDMILA CARDOSO DE OLIVEIRA	\N	8	Ativo	0
1246	1996-06-23	MARIA SUERDA CAMPOS DA SILVA	06844137443	8	Ativo	0
1247	2000-06-19	MATEUS ALVES DO MONTE	70103441409	8	Ativo	0
1248	2000-10-25	MAXMILIANO HUDSON MACEDO SILVA	\N	8	Ativo	0
1249	2000-12-03	MAXWELL PEREIRA DA COSTA	\N	8	Ativo	0
1250	2000-04-07	MAYKON FERNANDES DOS SANTOS	10050577450	8	Ativo	0
1251	1999-07-10	PEDRO BRUNO SILVA DE SOUZA	\N	8	Ativo	0
1252	2000-06-29	PEDRO GABRIEL TOME DO NASCIMENTO	\N	8	Ativo	0
1253	2000-09-23	SUELAINNE DA SILVA FARIAS	\N	8	Ativo	0
1254	2000-09-20	THALES LUCAS DA SILVA CAVALCANTI	\N	8	Ativo	0
1255	2000-04-27	THAYS MESQUITA DE FREITAS BARBOSA	70090591445	8	Ativo	0
1256	1999-01-16	TIAGO FERNANDO PEDROSA DO NASCIMENTO	\N	8	Ativo	0
1257	1999-05-01	VITOR DA SILVA TARGINO COSTA	18019634	8	Ativo	0
1258	2000-02-03	VITORIA BARBARA DE MACEDO COSMO	\N	8	Ativo	0
1259	1999-09-29	YEVERSON RAONNE DA COSTA SILVA	\N	8	Ativo	0
1260	2000-04-24	ALEXSANDRA KELLY SANTOS DE SOUSA	\N	8	Ativo	0
1261	2000-01-19	ANNA BEATRIZ GOIS ARAUJO	\N	8	Ativo	0
1262	2000-01-19	CARLOS DANIEL SOARES DE MOURA	\N	8	Ativo	0
1263	1999-05-06	DANIELSON MELO DOS SANTOS	\N	8	Ativo	0
1264	2000-06-12	DIANA KELLY OLIVEIRA GOMES DA SILVA	70405377452	8	Ativo	0
1266	2000-08-24	GABRIEL VICTOR LIMA DE OLIVEIRA	\N	8	Ativo	0
1267	2000-07-07	GABRIEL WILKE DE ARAUJO	\N	8	Ativo	0
1268	2000-02-15	JADNA KELLI TOMAZ DA SILVA	\N	8	Ativo	0
1269	2000-06-01	JENNIFER WESLA DA SILVA OLIVEIRA	\N	8	Ativo	0
1270	2000-06-18	JOELISON BENEDITO DOS SANTOS	\N	8	Ativo	0
1271	1999-03-27	JOSE RICARDO DOS SANTOS JUNIOR	\N	8	Ativo	0
1272	2000-01-29	JUCIARA DA SILVA BENTO	\N	8	Ativo	0
1273	2000-04-03	JULIANA BARBOSA PINHEIRO DA SILVA	70091031435	8	Ativo	0
1274	1998-07-21	JULIANA FREIRE TEIXEIRA DA COSTA	11742678440	8	Ativo	0
1275	2000-06-10	KLEDNA SILOE DA SILVA	70344096416	8	Ativo	0
1276	1998-04-18	LARISSA DO NASCIMENTO SANTOS	70002195488	8	Ativo	0
1277	2000-02-20	LARISSA SANTOS DE LUCENA	\N	8	Ativo	0
1278	2000-11-17	LAYSSA HELLEN SILVA DO NASCIMENTO	\N	8	Ativo	0
1279	2000-06-05	LUANA PATRICIA ADILINO DE SOUZA	\N	8	Ativo	0
1280	1995-08-24	LUIS CARLOS DA SILVA BARBOSA	\N	8	Ativo	0
1281	2000-06-10	MARIA EDUARDA MIRANDA	\N	8	Ativo	0
1282	2000-03-22	MARIA KAROLINA FERNANDES DO NASCIMENTO	\N	8	Ativo	0
1283	2000-08-24	MAYARA ALESSANDRA DA SILVA BASTOS	\N	8	Ativo	0
1284	2000-05-01	MILENE MARTINS DA SILVA	\N	8	Ativo	0
1285	1997-07-31	MISAEL DE LIMA RAMOS	\N	8	Ativo	0
1286	2000-03-08	PRISCYLA RAQUEL SILVA OLIVEIRA	\N	8	Ativo	0
1287	2000-04-30	SAULO THOMAZ LOPES BARRETO	\N	8	Ativo	0
1288	2000-04-22	THALLYSON GOIS SEVERO	\N	8	Ativo	0
1289	2000-08-05	THIAGO DE SOUZA CRUZ	11471368408	8	Ativo	0
1290	1999-10-29	ALICIA DA SILVA MARTINS	\N	8	Ativo	0
1291	2000-01-21	ARTHUR MURILO DE OLIVEIRA GUEDES	\N	8	Ativo	0
1292	1999-09-28	BEATRIZ MIRANDA DOS SANTOS	\N	8	Ativo	0
1293	1999-09-05	BRUNA MARIA SILVA DE ARAUJO	\N	8	Ativo	0
1294	1999-11-16	CAROLINE MIRELLY DE SOUZA SILVA	70239236408	8	Ativo	0
1295	1999-08-08	DOUGALS SAVIO OLIVEIRA DA SILVA	015694676439	8	Ativo	0
1296	1999-06-16	EDUARDA CRISTINA TEIXEIRA	\N	8	Ativo	0
1297	2000-03-20	ELAINE TAINA TAVARES DE OLIVEIRA	\N	8	Ativo	0
1298	1999-11-16	FERNANDA DE MORAIS RODRIGUES DE OLIVEIRA	\N	8	Ativo	0
1299	1999-09-17	GUILHERME SANTOS FIRMINO	\N	8	Ativo	0
1300	1999-07-08	HUGO VICTOR VICENTE CASSIANO	\N	8	Ativo	0
1265	1998-02-09	EVANDO CAMPOS DA SILVA	\N	8	Ativo	0
1301	1999-10-20	ISLA SAMAYARA NASCIMENTO DE ARAUJO	\N	8	Ativo	0
1302	1999-10-06	ISLANE AVELINO DOS SANTOS SILVA	\N	8	Ativo	0
1303	1999-02-21	JACKSON RENATO DA SILVA ALBUQUERQUE	\N	8	Ativo	0
1304	1999-04-15	JANICLEIDE BANDEIRA MIRANDA	\N	8	Ativo	0
1305	1999-11-09	JOAO MARCOS DE MORAIS PINHEIRO	\N	8	Ativo	0
1306	1998-04-13	JOSEANE APARECIDA DE PAIVA OLIVEIRA	446515948/08	8	Ativo	0
1307	1999-11-17	JOSEMBERG DE SOUZA MORAIS	\N	8	Ativo	0
1308	1999-11-29	JULIA BEATRIZ NUNES DE LIMA	\N	8	Ativo	0
1309	1999-04-01	LICIANE FABIA NASCIMENTO DA SILVA	70074469495	8	Ativo	0
1310	1999-11-29	LUCAS DA SILVA SEGUNDO	\N	8	Ativo	0
1311	1997-10-03	LUCAS DE SOUZA OLIVEIRA	\N	8	Ativo	0
1312	1999-06-03	LUIS ARTHUR QUIRINO	70661797490	8	Ativo	0
1313	1999-05-31	MARIA ISABEL MENDONCA DA SILVA	\N	8	Ativo	0
1314	1999-05-06	MATHEUS OLIVEIRA DE MELO	\N	8	Ativo	0
1315	1999-10-28	ROBSON MAX MOREIRA BALBINO	\N	8	Ativo	0
1316	1999-12-03	RUI MATEUS DE OLIVEIRA	\N	8	Ativo	0
1317	1999-04-06	TAERCIA SOARES BRASILIANO	\N	8	Ativo	0
1318	1999-07-28	TAISSA SATINVANIN DE LIMA FELIX	\N	8	Ativo	0
1319	1999-11-28	TALITA VIVIAN DE MACEDO	\N	8	Ativo	0
1320	1999-03-10	THAYNARA DO NASCIMENTO PEREIRA	\N	8	Ativo	0
1321	1998-11-21	VANESA CARVALHO DE OLIVEIRA	\N	8	Ativo	0
1322	1999-03-28	WENYA NASCIMENTO DA MOTTA MARANHAO	01833074459	8	Ativo	0
1323	1999-06-22	WESLEY BRUNO PINHEIRO DA SILVA	\N	8	Ativo	0
1325	1998-09-03	ADRYELSON FRANCISCO DE MELO	\N	8	Ativo	0
1327	1999-03-01	ANDERSON DE SOUZA	\N	8	Ativo	0
1328	1999-10-06	ANDRIELLE EMILLY MEDEIROS DOS SANTOS	70659545446	8	Ativo	0
1329	1999-04-04	BRUNA MARIANY DA SILVA COSTA	70520072405	8	Ativo	0
1330	1998-08-19	CARLOS EDUARDO GOMES DOS SANTOS	\N	8	Ativo	0
1331	1998-12-27	CLEITON GABRIEL VIANA DA COSTA	70528431455	8	Ativo	0
1332	1998-11-26	EVILYN EDUARDA DE OLIVEIRA BARBOSA	17083495700	8	Ativo	0
1333	1998-06-01	FRANKELYSON RIBEIRO DE SOUSA	\N	8	Ativo	0
1334	1999-08-09	GABRIELA MONTEIRO NOGUEIRA	\N	8	Ativo	0
1335	1998-09-01	GEORGE OLIVEIRA DO NASCIMENTO	\N	8	Ativo	0
1336	1998-09-08	GIONE MERCIA DE FRANCA SILVA	70047254483	8	Ativo	0
1337	1998-04-18	HUGO ARTUR RIBEIRO DA SILVA	\N	8	Ativo	0
1338	1996-10-27	ITALO LEANDRO RIBEIRO	\N	8	Ativo	0
1339	1999-06-30	IVANCELIO MARINHEIRO DOS SANTOS	\N	8	Ativo	0
1340	1999-02-02	JEFFERSON LIMA DO NASCIMENTO	\N	8	Ativo	0
1341	1999-03-30	JONATHAN SIQUEIRA SANTOS	\N	8	Ativo	0
1342	1999-05-05	JUSCELINO DE OLIVEIRA JUNIOR	\N	8	Ativo	0
1343	1998-08-14	KARLA LISANDRA CARVALHO ELIAS DE MACEDO	\N	8	Ativo	0
1344	1998-09-12	KAROLYNE DANDARA DA SILVA	\N	8	Ativo	0
1345	1999-05-17	LENNYO VINICIUS ALCANIZ DE MOURA	\N	8	Ativo	0
1346	1998-07-06	LEON MENCIO SILVA MENDES DE OLIVEIRA	\N	8	Ativo	0
1347	1999-03-03	MARIA EDUARDA DE FARIAS DANTAS	\N	8	Ativo	0
1348	1999-10-14	MARIA HELENA MACEDO BRAGA	\N	8	Ativo	0
1349	1999-11-04	MARIA LETICIA CAMPOS DA SILVA	\N	8	Ativo	0
1350	1997-01-25	MARILIA GABRIELA DE MACEDO BRAGA	\N	8	Ativo	0
1351	1999-03-06	MARCIO LUIZ DA SILVA ARAUJO	70705451429	8	Ativo	0
1352	1999-01-29	MARCOS FELIPE BORGES DA SILVA	70499430450	8	Ativo	0
1353	1999-08-18	POLYANA SOUZA DA SILVA	\N	8	Ativo	0
1354	1999-03-04	RODRIGO EMANUEL DE OLIVEIRA	\N	8	Ativo	0
1355	1998-05-11	SAYONARA KALIANE LIMA DOS SANTOS	01807450422	8	Ativo	0
1356	1999-01-04	SUERLEN SILVA FARIAS	\N	8	Ativo	0
1357	1998-05-19	TALIA DA SILVA SOUZA	70689519451	8	Ativo	0
1358	1968-03-12	ANA LICE CARLOS DE LIMA	\N	8	Ativo	0
1359	1996-03-22	ANDERSON RIBEIRO COSME	\N	8	Ativo	0
1360	1991-08-19	CARLOS ANDRE MONTEIRO CAMPOS	10985941421	8	Ativo	0
1361	1976-02-20	CICERA JOSEFA DOS SANTOS	28992630808	8	Ativo	0
1362	1977-09-21	EDINELMA FELIX DE LIMA	05189161463	8	Ativo	0
1363	1982-01-14	EDNILSON RIBEIRO DA SILVA	08993641401	8	Ativo	0
1364	1972-02-03	IVANEIDE ROMUALDO DA SILVA	06607485413	8	Ativo	0
1365	1958-06-15	JANILDA FREITAS ALEXANDRE	46655530415	8	Ativo	0
1366	1994-01-03	JOALISSON VIANA CAVALCANTI	11133382452	8	Ativo	0
1367	1997-12-11	JOAO BATISTA TADEU DA SILVA JUNIOR	70043987494	8	Ativo	0
1368	1972-12-03	JURACI DE FRANCA VIANA	00842042490	8	Ativo	0
1369	1997-12-10	LUIZ FELIPE TARGINO MATOS DE OLIVEIRA	01706457464	8	Ativo	0
1370	1967-03-13	MARIA HELENA CORREIA DA SILVA MOURA	53666127487	8	Ativo	0
1371	1999-05-02	MARIA MAYARA BATISTA BISPO	09222151461	8	Ativo	0
1372	1999-02-18	MAYARA KALYNE FERREIRA	70743202422	8	Ativo	0
1373	1996-11-30	MICKAEL ANGELO DA SILVA	70296683400	8	Ativo	0
1374	1994-08-23	NILTON TAVARES DA SILVA	\N	8	Ativo	0
1375	1973-07-06	ROBERTO MANOEL DA SILVA	03467096441	8	Ativo	0
1376	1998-07-20	YURE TEIXEIRA DA ROCHA	\N	8	Ativo	0
1377	1993-03-15	BRUNO DO NASCIMENTO	\N	8	Ativo	0
1378	1996-07-19	MIRELA DE MOURA SOARES	\N	8	Ativo	0
1379	1998-03-10	FERNANDA STEFANNY DA SILVA OLIVEIRA	70452455480	8	Ativo	0
1380	2001-03-26	ADNA ALVES DA COSTA BARRETO	12044254425	8	Ativo	0
1381	2002-12-15	ALANNE VITORIA NUNES DE LIMA	\N	8	Ativo	0
1382	2001-06-03	AMANDA CAMILA MENEZES DA SILVA	\N	8	Ativo	0
1383	2002-06-03	ANA BEATRIZ FABRICIO	\N	8	Ativo	0
1384	2002-08-09	ANTONO FELIPE DE ALMEIDA	\N	8	Ativo	0
1385	2001-07-26	ANTONIO MARCOS DA SILVA QUEIROZ	\N	8	Ativo	0
1389	2002-03-09	DIOGO RODRIGO LIMA DE CARVALHO	\N	8	Ativo	0
1390	2001-09-21	ERIKA SILVA DE FRANCA	\N	8	Ativo	0
1391	2002-03-14	EWERTON MATHEUS HONORIO DA SILVA	\N	8	Ativo	0
1392	2002-04-15	FRANCISCO VICTOR TEIXEIRA DANTAS	\N	8	Ativo	0
1393	2001-10-30	GABRIEL FARIAS TAVARES	\N	8	Ativo	0
1394	2002-10-31	GUSTAVO ARAUJO DA SILVA	\N	8	Ativo	0
1395	2001-09-14	IGO MATHEUS DANTAS BORGES	\N	8	Ativo	0
1396	2002-05-04	IVIS DIOGENES MOURA DE LIRA	\N	8	Ativo	0
1397	2002-02-08	JARLIENE LOURENCO DOS SANTOS	\N	8	Ativo	0
1398	2002-09-01	JEFFERSON MOISES COSTA DA SILVA	\N	8	Ativo	0
1399	2001-09-19	JESSICA KALINE DE MEDEIROS	\N	8	Ativo	0
1400	2000-06-10	JOANA BEATRIZ PONTES	70078976499	8	Ativo	0
1401	2002-03-15	JOAO VICTOR OLIVEIRA DA SILVA	\N	8	Ativo	0
1403	2002-04-19	JUDSON NUNES MEDEIROS	\N	8	Ativo	0
1404	2002-02-11	LUCAS DE MORAES DOS SANTOS	\N	8	Ativo	0
1405	2002-03-26	LUIZ FELIPE CLAUDINO DA SILVA	\N	8	Ativo	0
1406	2002-06-10	MARCELO AUGUSTO DA SILVA	\N	8	Ativo	0
1407	2001-01-28	MARIA CLARA SANTIAGO DA SILVA	\N	8	Ativo	0
1408	2000-10-30	MARIA VITORIA LORENZ DE OLIVEIRA	\N	8	Ativo	0
1409	2001-03-07	MATHEUS BRAZ DE OLIVEIRA	\N	8	Ativo	0
1410	2001-04-29	NATHALIA SANTOS DE MACEDO	\N	8	Ativo	0
1412	2001-07-31	RODRIGO MACEDO DE LIMA	\N	8	Ativo	0
1413	2001-03-02	SARAH BEATRIZ DE MEDEIROS SILVA	\N	8	Ativo	0
1414	2002-03-31	TALISON MATEUS DOS SANTOS CONFESSOR	\N	8	Ativo	0
1415	2002-06-12	TALITA MEDEIROS BATISTA	\N	8	Ativo	0
1416	2002-02-03	VICTOR DANIEL DA SILVA PINHEIRO	\N	8	Ativo	0
1417	2001-08-06	WENDELL MOURA DA SILVA	\N	8	Ativo	0
1419	2001-12-13	NATALIA ALVES GOMES	\N	8	Ativo	0
1420	2001-07-26	ADRIAN VICTOR BEZERRA DA SILVA	\N	8	Ativo	0
1421	2002-02-10	AMANDA SILVA DE LIMA	\N	8	Ativo	0
1422	2001-03-07	ANTONIO WELINGTON DE JESUS DA SILVA	70780060466	8	Ativo	0
1423	2003-02-06	DANNIELA MAYARA DA SILVA CUNHA	12456740483	8	Ativo	0
1424	2002-01-04	DEBORA KALINE DO NASCIMENTO MARTINS	\N	8	Ativo	0
1425	2001-11-23	EDUARDO DE MORAIS RODRIGUES DE OLIVEIRA	\N	8	Ativo	0
1426	2001-04-21	ERICK LIMA DA SILVA	\N	8	Ativo	0
1428	2000-01-14	FABIANO CRISTOVAN DE ANDRADE	\N	8	Ativo	0
1430	2002-04-09	FRANCIELLE RIBEIRO DE SOUSA	\N	8	Ativo	0
1431	2000-12-26	GABRIEL MONTEIRO NOGUEIRA	\N	8	Ativo	0
1432	1900-01-01	GISELY RAYNARA RAFAEL DOS SANTOS	11082509477	8	Ativo	0
1433	2000-01-20	HIAGO THAYLLON MATIAS DO NASCIMENTO	\N	8	Ativo	0
1434	2001-06-14	JOHALISON LEANDRO NUNES DE LIMA	\N	8	Ativo	0
1435	2000-08-27	JOICE FERNANDA DO CARMO GOMES DE LIMA	\N	8	Ativo	0
1437	2001-10-16	KARINY TEIXEIRA DO NASCIMENTO	\N	8	Ativo	0
1438	2001-10-06	LEANDRO DA SILVA SOUZA	\N	8	Ativo	0
1439	2001-10-18	LETICIA MIRELY AGUIAR PAIVA	\N	8	Ativo	0
1440	2002-06-09	LINDIANNE BEATRIZ ARAUJO PEREIRA	\N	8	Ativo	0
1441	2000-10-23	LUIZ FELIPE LOPES DA FONSECA	\N	8	Ativo	0
1442	1999-07-28	MARIA EDUARDA DE SOUZA MARTINS	\N	8	Ativo	0
1443	2000-08-08	MARCIO RUBENS DA FONSECA SILVA	\N	8	Ativo	0
1444	2001-09-28	MARCOS VINICIUS ALVES DA SILVA	\N	8	Ativo	0
1445	2001-04-18	MIKALLYSON LUCAS DA SILVA BARROS	\N	8	Ativo	0
1446	2001-05-21	STHEFANNE ARAUJO DE SOUZA	\N	8	Ativo	0
1447	2001-05-25	THALISON DA SILVA FERREIRA	\N	8	Ativo	0
1448	2001-03-20	THIAGO DE SOUZA SILVA	\N	8	Ativo	0
1450	2000-05-07	VITOR RODRIGUES DE MELO	\N	8	Ativo	0
1451	2001-11-20	VITORIA NATALI ALBUQUERQUE DE FRANCA	\N	8	Ativo	0
1452	2000-07-27	VITORIA SOUZA NEVES	\N	8	Ativo	0
1453	2001-04-09	WANESSA FIRMINO DE ANDRADE	70228463408	8	Ativo	0
1454	2001-03-17	MARIA RITA LIMA DO NASCIMENTO	70604748469	8	Ativo	0
1455	2001-09-23	JHOUSE CLEIDE DUARTE DOS SANTOS	70714958409	8	Ativo	0
1458	1998-06-07	AMADIA FELIX DO NASCIMENTO	\N	8	Ativo	0
1459	2000-05-15	AMANDA BEATRIZ CARVALHO DA SILVA	\N	8	Ativo	0
1460	2000-08-08	AMMERSON RODRIGO CRUZ DO NASCIMENTO	\N	8	Ativo	0
1461	2000-08-31	BRUNO LUCIANO LIMA DO NASCIMENTO	\N	8	Ativo	0
1462	1999-06-12	CLARA KAROLAYNE RODRIGUES DA CRUZ	\N	8	Ativo	0
1463	1999-07-17	DENILSON SILVA DE OLIVEIRA	\N	8	Ativo	0
1464	2000-11-14	EMANUEL MARTINS DE OLIVEIRA	\N	8	Ativo	0
1465	1999-05-05	FERNANDO LIMA DE MACEDO	\N	8	Ativo	0
1466	1998-07-19	GABRIEL JONATHAN DO NASCIMENTO	\N	8	Ativo	0
1467	1999-11-03	GILMAR MIRANDA CAVALCANTE	\N	8	Ativo	0
1468	1999-12-20	GUSTAVO NUNES DA SILVA NETO	\N	8	Ativo	0
1469	2000-10-23	HERLON HAILSON SIQUEIRA FREIRE	\N	8	Ativo	0
1470	1998-05-13	IURE RICARDO DE AZEVEDO	\N	8	Ativo	0
1471	1999-05-01	JAILMA GRABRIELY LOPES DOS SANTOS	\N	8	Ativo	0
1472	1998-10-26	JONATAS NASCIMENTO ALVES DA CRUZ	\N	8	Ativo	0
1474	1999-09-21	JOSE ANTONIO FELIX DO NASCIMENTO	\N	8	Ativo	0
1475	1989-10-09	JULIETE KISE PEREIRA DA SILVA	\N	8	Ativo	0
1477	2000-04-25	LAERCIO BRASILIANO DA SILVA JUNIOR	\N	8	Ativo	0
1480	1999-06-23	LUCAS OLIVEIRA RIBEIRO	\N	8	Ativo	0
1481	1999-09-29	MARIA JOSE PEREIRA CARDOSO	\N	8	Ativo	0
1482	1999-04-03	MARIA PRISCILA DA SILVA	\N	8	Ativo	0
1483	1999-05-11	MAGAYVER DANIEL SILVA DE OLIVEIRA	\N	8	Ativo	0
1484	1999-06-16	MATHEUS NUNES DE SOUZA	\N	8	Ativo	0
1485	2000-01-06	MAX MYLLER DE ALMEIDA SILVA	\N	8	Ativo	0
1486	2000-08-08	MILENA BEZERRA DO NASCIMENTO	\N	8	Ativo	0
1487	2000-03-20	PABLO GARCIA BANDEIRA DOS SANTOS	\N	8	Ativo	0
1489	2000-04-22	RILIANE EMANUELLE DE JESUS ALMEIDA	\N	8	Ativo	0
1490	1999-04-28	SILAS SIDNEY FERREIRA SILVA	\N	8	Ativo	0
1491	1999-08-05	THARCISIO THALES ANDRADE MACIEL	\N	8	Ativo	0
1492	1999-06-03	ALEXANDRE NASCIMENTO DA SILVA	\N	8	Ativo	0
1493	1997-06-17	ALINE RAISSA BATISTA DO NASCIMENTO	\N	8	Ativo	0
1494	1997-05-27	ALLYSON DANTAS TRAJANO	12362329410	8	Ativo	0
1496	1999-03-08	ANDERSON PETRONILO DANTAS DA SILVA	\N	8	Ativo	0
1497	1999-02-08	ANGELICA DA SILVA GOMES	\N	8	Ativo	0
1498	1999-09-10	DANIELLA NASCIMENTO DOS SANTOS	\N	8	Ativo	0
1499	1999-08-24	DANILO NATAN FIRMO DOS SANTOS	\N	8	Ativo	0
1500	1999-04-08	DOUGLAS ARIEL DA SILVA	\N	8	Ativo	0
1501	1999-06-01	EDINALDO DA SILVA BARBOSA	\N	8	Ativo	0
1502	1998-10-20	EDNADJA MIKAELLY LEONEZ DA SILVA	\N	8	Ativo	0
1503	1999-03-17	ERICA MAYSE NASCIMENTO DE SOUZA	\N	8	Ativo	0
1504	1999-03-23	FELIPE MARQUES DA SILVA	\N	8	Ativo	0
1505	1999-01-12	FRANCISCA MICARLA SOUZA DA SILVA	\N	8	Ativo	0
1506	1999-05-18	GABRIEL DE CARVALHO GOMES	\N	8	Ativo	0
1507	1999-05-21	HEBERT HOSSMAM DOS SANTOS DAMASCENO	\N	8	Ativo	0
1509	1999-07-14	JOYCE LUIZA MORAIS DA SILVA	\N	8	Ativo	0
1510	1997-06-27	JOYCE VALESCA MARCAL EVANGELISTA	\N	8	Ativo	0
1511	1999-07-08	JULIANA DANTAS DA CRUZ	\N	8	Ativo	0
1512	1999-03-26	JULLIANA KILVIA COSTA DA FONSECA	\N	8	Ativo	0
1513	1999-01-02	KALYENE NEILANE SOARES DA SILVA	\N	8	Ativo	0
1514	1999-10-24	KAUAN MARTINS OLIVEIRA	\N	8	Ativo	0
1508	1999-02-16	JESSICA FERNANDA MATIAS DE LIMA	\N	8	Ativo	0
1457	2000-07-22	ALANDESON MARINHO COSTA	\N	8	Ativo	0
1479	1999-07-05	LUCAS EMANUEL BARBOSA E SILVA	\N	8	Ativo	0
1427	2001-02-06	FABIANA COSTA DO NASCIMENTO	\N	8	Ativo	0
1429	2001-07-14	FERNANDO GEOVA DA SILVA JUSTINO	\N	8	Ativo	0
1418	2001-08-08	FRANCISCO MATHEUS DE SOUZA NEVES	\N	8	Ativo	0
1449	2002-03-19	THIAGO EMANUEL DA SILVA CAVALCANTI	\N	8	Ativo	0
1488	2000-02-26	PEDRO JORGE BARBOSA FILHO	\N	8	Ativo	0
869	2005-02-02	WILLIANE THAMIRIS DA SILVA XAVIER	\N	8	Ativo	0
870	2004-08-18	LAYONEL LUCAS DA COSTA	\N	8	Ativo	0
1478	1998-08-16	LARISSA MAIARA SILVA DE FRANCA	\N	8	Ativo	0
871	2004-09-10	ANA BEATRIZ DA SILVA BARBOSA	\N	8	Ativo	0
872	2005-02-11	SARA EMILLY BERNARDO DA SILVA	70777262401	8	Ativo	0
873	2003-07-24	JOSE GABRIEL FREIRE DA SILVA	\N	8	Ativo	0
874	2005-02-03	ALAN VITOR OLIVEIRA DO NASCIMENTO	12484255454	8	Ativo	0
875	2003-05-21	ANDERSON VARELA DO NASCIMENTO ROCHA	70783972407	8	Ativo	0
1515	1999-05-18	LEONARDO MARCELINO DA SILVA	\N	8	Ativo	0
1516	2018-09-08	MARIA APARECIDA DA SILVA OLIVEIRA	\N	8	Ativo	0
1517	2001-02-02	MARIA EDUARDA MEDEIROS MENEZES	\N	8	Ativo	0
1518	1999-09-06	MARIANO DAMIAO DOS SANTOS NETO	\N	8	Ativo	0
1519	1998-11-11	MATHEUS FARIAS DA SILVA	\N	8	Ativo	0
1520	2000-08-12	MONICA FRANCISCA PAULINO DANTAS	\N	8	Ativo	0
1521	1998-10-24	RANIELLE STEFANE DE JESUS ALMEIDA	\N	8	Ativo	0
1522	1999-05-06	RENAN AZEVEDO DO NASCIMENTO	\N	8	Ativo	0
1523	1999-08-14	ROSEANA COSME DE OLIVEIRA	\N	8	Ativo	0
1524	2000-01-03	THIAGO DAMASCENO LISBOA	\N	8	Ativo	0
1525	2000-11-18	LUIS CARLOS DA SILVA	\N	8	Ativo	0
1526	1997-06-11	ANDEZA ANGELA RIBEIRO TEIXEIRA	\N	8	Ativo	0
1527	1997-05-02	ARTUR SANTOS DA ROCHA	\N	8	Ativo	0
1528	1997-12-18	CAMILLA DE FRANCA MONTEIRO	\N	8	Ativo	0
1529	1997-04-22	DANIEL ANDERSON DANTAS DE BRITO	\N	8	Ativo	0
1530	1996-05-14	DANIELA GOMES COSTA	\N	8	Ativo	0
1531	1997-10-15	EDILANE PEREIRA DA SILVA CAMARA	\N	8	Ativo	0
1532	1997-10-02	EZEQUIEL SERGIO SALES REBOUCAS	\N	8	Ativo	0
1533	1998-01-26	FABIO AUGUSTO DA SILVA	\N	8	Ativo	0
1534	1998-02-25	FERNANDA MARIA DA SILVA	\N	8	Ativo	0
1535	1997-10-28	JACKYELI GILMARA VICENTE CASSIANO	\N	8	Ativo	0
1536	1998-02-10	JAILTON LEANDRO DA SILVA FILHO	\N	8	Ativo	0
1537	1997-06-23	JOAO PAULO REGIS DE FARIAS	\N	8	Ativo	0
1538	1997-08-18	JOSIELMA DANTAS MENESES	\N	8	Ativo	0
1539	1998-04-25	JOSSIMAR MARTINS FRANCA	\N	8	Ativo	0
1540	1997-12-01	LETICIA RAYANE DE OLIVEIRA HERCULINO	\N	8	Ativo	0
1541	1997-07-14	LUANDERSON FRANCISCO DE MELO	\N	8	Ativo	0
1542	1997-12-26	LUIZ RICARDO DA SILVA MIGUEL	\N	8	Ativo	0
1543	1998-08-09	MARIA EDUARDA IZIDRO BARBOZA	\N	8	Ativo	0
1544	1998-10-09	MARIA LUIZA DA SILVA ARAUJO	\N	8	Ativo	0
1545	1997-07-17	MARIA SAMARA SALVIANO PINTO	\N	8	Ativo	0
1546	1998-07-27	MILENA PAULA COSTA	\N	8	Ativo	0
1547	1997-04-03	PEDRO BATISTA CAVALCANTE NETO	\N	8	Ativo	0
1548	1997-02-26	RAQUEL PEREIRA DA SILVA	\N	8	Ativo	0
1549	1998-04-16	RITHALA RARYANNE PINHEIRO CASSIANO	\N	8	Ativo	0
1550	1999-08-20	LUIZ CARLOS PACHECO DA ROCHA	12445243440	8	Ativo	0
1551	1987-03-09	ADRIANO PEDRO XAVIER DA SILVA	\N	8	Ativo	0
1552	1992-11-01	BERG TRAJANO DA SILVA	\N	8	Ativo	0
1553	1973-10-26	DAVID BATISTA DA SILVA	\N	8	Ativo	0
1554	1978-12-05	FRANCISCA EUGENIA DE LIMA	6007901424	8	Ativo	0
1555	1978-07-31	JANDIRA DE MELO RIBEIRO	7911621411	8	Ativo	0
1556	1985-11-05	JOANA KELLY FERREIRA DANTAS	5492403494	8	Ativo	0
1557	1949-06-11	JOAO BATISTA DA SILVA	\N	8	Ativo	0
1558	1972-08-28	JOSE ANTONIO BARBOSA DO NASCIMENTO	4029787495	8	Ativo	0
1560	1968-06-12	MARIA DE FATIMA FERREIRA DANTAS	\N	8	Ativo	0
1561	1977-06-12	MARIA JOSIANE FERREIRA DANTAS	1962071421	8	Ativo	0
1562	1975-10-10	MARIA SALETE DA CONCEICAO NEPONUCENO	\N	8	Ativo	0
1563	1977-08-15	MARICELIA DA SILVA VELOSO	\N	8	Ativo	0
1564	1974-04-30	MARLY GALVAO DA SILVA	91231035404	8	Ativo	0
1565	1979-04-26	MAURICIO FERREIRA TIBURCIO	3224469120	8	Ativo	0
1566	1983-12-28	MIGUEL NASCIMENTO COSTA NETO	6465568438	8	Ativo	0
1567	1981-04-29	SEBASTIAO DA SILVA VICENTE	\N	8	Ativo	0
1568	1974-12-04	SEVERINA SANTOS DA SILVA	1094060445	8	Ativo	0
763	2007-11-02	AYSHA VITORIA DOS SANTOS TAVARES	01720168431	8	Ativo	0
1473	2000-07-17	JONATHAN DANTAS DE BRITO	\N	8	Ativo	0
1767	2004-10-05	CARLOS EDUARDO DOS SANTOS FERREIRA	\N	9	Ativo	0
2266	\N	IVANILDO CARDOSO	\N	8	Ativo	0
2264	\N	ERICA GEANE LUIZ	\N	8	Ativo	0
2267	\N	JOSE EDSON CABRAL	\N	8	Ativo	0
2268	\N	JOSE FLAVIO B DE OLIVEIRA	\N	8	Ativo	0
2269	\N	KATIA CILENE SOARES BRAGA	\N	8	Ativo	0
2270	\N	LIGIA DO NASCIMENTO SILVA	\N	8	Ativo	0
2271	\N	LUIZ ANDRE DA COSTA	\N	8	Ativo	0
2272	\N	LUTEMBERG ALEX M DE PAIVA	\N	8	Ativo	0
2273	\N	MAGNOLIA MIRANDA CORREIA	\N	8	Ativo	0
2274	\N	MARIA DA SILVA FREIRE	\N	8	Ativo	0
2275	\N	ODILEIA CRISTINA DA S DE OLIVEIRA	\N	8	Ativo	0
2276	\N	ROSILDA BARBOSA DA SILVA	\N	8	Ativo	0
2277	\N	UDINEIDE ALVES DA SILVA	\N	8	Ativo	0
2278	\N	SONIA MARIA DO NASCIMENTO	\N	8	Ativo	0
880	2003-08-19	IURY CAUA DANTAS CUNHA	\N	8	Ativo	0
1818	2003-04-07	CARLA NAIARA DE LIMA RODRIGUES	\N	9	Ativo	0
1829	2003-11-15	LUCAS EDUARDO VERAS DA SILVA	\N	9	Ativo	0
1830	2002-09-09	LUCAS FRANCA VALENTIM	\N	9	Ativo	0
1831	2004-01-03	MARCOS MACIEL FERREIRA SIQUEIRA	\N	9	Ativo	0
1832	2003-07-23	MARIA ANDREZA PEREIRA MAIA	\N	9	Ativo	0
1833	2003-03-18	MARIA DE FATIMA DO NASCIMENTO VIANA	\N	9	Ativo	0
1834	2002-07-16	MARIA EDUARDA MARTINS DO NASCIMENTO	\N	9	Ativo	0
1835	2002-10-21	MARIA FERNANDA MEDEIROS DA SILVA	\N	9	Ativo	0
1836	2002-07-17	MARIA MYLLENA VERAS SOARES	\N	9	Ativo	0
1837	2003-11-11	MARINA JANUARIO DINIZ	\N	9	Ativo	0
1838	2003-08-10	RAMON EDUARDO AZEVEDO PATRICIO	\N	9	Ativo	0
1839	2003-10-09	RAQUEL NASCIMENTO DE LIMA	\N	9	Ativo	0
1840	2002-02-14	SARA HEVELEM DO AMARAL FERREIRA	\N	9	Ativo	0
1841	2002-11-17	TALITA CARLA TEIXEIRA DA SILVA	\N	9	Ativo	0
1842	2003-11-24	WARLLEY DO NASCIMENTO SILVA	\N	9	Ativo	0
1843	2004-02-28	WESLEY CAUA BEZERRA DOS SANTOS	\N	9	Ativo	0
1844	2003-02-22	WESLLEY VINICIUS DA SILVA ABREU	\N	9	Ativo	0
1845	2002-10-12	WILLIANE DA SILVA CAMPOS	\N	9	Ativo	0
1846	2001-07-14	ALEXANDRE DE OLIVEIRA MELO	\N	9	Ativo	0
1847	2002-10-22	AURELIO DE AMARAL GOMES	\N	9	Ativo	0
1848	1995-08-23	CAMILA DE MORAIS	\N	9	Ativo	0
1849	2002-07-12	CARLOS EDUARDO SILVA DO NASCIMENTO	\N	9	Ativo	0
1850	2002-02-07	EMANUEL GOMES DE LIMA	\N	9	Ativo	0
1851	2001-08-24	EMERSON ALAN MEDEIROS DO NASCIMENTO	\N	9	Ativo	0
1495	1999-07-25	ANA IRIS MOURA DA SILVA	\N	8	Ativo	0
2106	1969-07-14	FRANCISCA RODRIGUES DA SILVA	46682686404	8	Ativo	0
2108	1964-09-10	VLADIR QUINTILIANO CARVALHO DA SILVA	40557782449	8	Ativo	0
2109	1964-09-10	LUZINETE MELO DA FONSECA	32278390406	8	Ativo	0
2110	1971-01-09	JANILZA VALENCIO DE PAIVA MACEDO	70335753434	8	Ativo	0
2111	1974-10-15	MYTERCIA BEZERRA DA SILVA	\N	8	Ativo	0
2112	1965-11-18	DEBORA SANTOS DE BRITO	49835181420	8	Ativo	0
2113	1969-10-04	VANUZA DA COSTA	45520526400	8	Ativo	0
2114	1966-10-12	MARIA CONCEICAO GOMES LOURENCO DA PAZ	49818279468	8	Ativo	0
2115	1969-08-23	ERINEIDE SILVA DE MELO	77900545468	8	Ativo	0
2116	1960-04-20	MARIA INES DE FARIAS	20227345487	8	Ativo	0
2117	1972-09-15	ANDRE GUILHERME FERNANDES COSTA	85275093420	8	Ativo	0
2118	1965-12-17	JULIA LILIAN ALVES ALMEIDA DE SOUZA	30269490353	8	Ativo	0
2119	1960-04-14	IRENE EUNICE DE ARAUJO	26184184415	8	Ativo	0
2120	1973-03-20	JAIR NASCIMENTO DA SILVA	90399013415	8	Ativo	0
2121	1970-08-10	JOSIVAN SILVEIRA DE OLIVEIRA	77856163453	8	Ativo	0
2122	1965-09-06	IEDA PINHEIRO CORTEZ	56757131404	8	Ativo	0
2123	1957-08-05	DIONE OLIVEIRA TAVARES	12354484520	8	Ativo	0
2124	1971-09-01	VERONICA MACHADO CHIANCA DOS SANTOS	65428722487	8	Ativo	0
2125	1961-11-06	GILENO DE QUEIROZ PEIXOTO	\N	8	Ativo	0
2126	1958-11-16	RONALDO BEZERRA DE BRITO	20186487487	8	Ativo	0
2129	\N	DENILSON GAMELEIRA DO REGO	\N	8	Ativo	0
2130	\N	FATIMA MARIA MOURA DE SOUZA	\N	8	Ativo	0
2131	\N	FRANCISCO CANIDE DA CUNHA	\N	8	Ativo	0
2132	\N	FRANCISCO DE ASSIS S DE SOUZA	\N	8	Ativo	0
2134	\N	LUCIANO GONCALVES COSTA	\N	8	Ativo	0
2135	\N	LUCIO EDIBERTO DE F MORAIS	\N	8	Ativo	0
2137	\N	MARIA DE FATIMA R FERNANDES	\N	8	Ativo	0
2138	\N	MARIA DO SOCORRO MEDEIROS	\N	8	Ativo	0
2139	\N	NEIDE LUCAS SOUZA SEGUNDO	\N	8	Ativo	0
2141	\N	SANDRA GOMES DE MACEDO	\N	8	Ativo	0
2142	\N	WANJA MARIA C NOGUEIRA	\N	8	Ativo	0
2098	1961-09-30	IELMA SILVA 	31519121415	8	Ativo	0
2102	1962-07-11	EDILSON SILVESTRE DOS SANTOS 	32388284449	8	Ativo	0
2107	1961-06-14	MARIA DA CONCEICAO DE OLIVEIRA 	59740337449	8	Ativo	0
2105	1966-04-06	REJANE BARBOSA DE OLIVEIRA 	44428332491	8	Ativo	0
2140	2015-01-27	LUCIANA MONTEIRO 	\N	8	Ativo	0
2723	1997-02-17	INGRID STEPHANY DO NASCIMENTO RIBEIRO	11324935448	8	Ativo	0
2724	1998-01-21	JESSICA KAROLAINY DA SILVA GONCALVES	70872098419	8	Ativo	0
2725	1999-07-09	JONATHAN DE OLIVEIRA SILVA	70095944494	8	Ativo	0
2726	2000-12-22	LUIZY DAIANNY ARAUJO FREIRE	70267326416	8	Ativo	0
2727	2000-08-18	RAISSA GABRIELA SILVA DO NASCIMENTO	12247721486	8	Ativo	0
2728	2001-10-13	ROBSON AQUINO DA SILVA ANDRADE	\N	8	Ativo	0
2729	1999-08-26	SUENIA THAIS DO NASCIMENTO SILVA	11150775467	8	Ativo	0
2730	1999-09-28	TALITA EMANUELLA DA SILVA RIBEIRO	\N	8	Ativo	0
1912	2008-03-18	KAUA DOS SANTOS LEMOS	\N	7	Ativo	0
1913	2008-06-06	KAUAN MATHEUS BARBOSAA DOS SANTOS	\N	7	Ativo	0
2919	2004-05-15	GABRIEL SILVA DE ALMEIDA	\N	9	Ativo	0
1658	2006-12-13	MARINA GABRIELE DUARTE SANTOS	\N	9	Ativo	0
1660	2006-10-04	REBECA PALHARES PASSOS DA COSTA	\N	9	Ativo	0
1661	2006-10-16	ROBERTO MOISES AZEVEDO PATRICIO	\N	9	Ativo	0
1662	2007-03-25	RODRIGO LAZARO DA CUNHA	\N	9	Ativo	0
1663	2006-07-11	RODRIGO NASCIMENTO DE LIMA	\N	9	Ativo	0
1664	2006-08-18	SAMARA SANTANNA COSTA DA SILVA	\N	9	Ativo	0
1665	2007-02-18	SEBASTIAO DA COSTA SOARES	\N	9	Ativo	0
1666	2006-08-10	ROBERTA JOSE DOS SANTOS	\N	9	Ativo	0
1667	2005-05-19	RAIANE DOS SANTOS VIEIRA MELO	\N	9	Ativo	0
1668	2007-03-19	MARIA VITORIA DA SILVA ABREU	\N	9	Ativo	0
1669	2005-09-24	CARLOS ANTONIO RIBEIRO DA SILVA FILHO	\N	9	Ativo	0
1781	2004-11-18	RANIELE NASCIMENTO DE LIMA	\N	9	Ativo	0
1670	2006-06-18	ADRIANO LUCAS DA SILVA CHAGAS	\N	9	Ativo	0
1671	2006-09-09	ANTONY GABRIEL DA SILVA FEITOSA	\N	9	Ativo	0
1672	2007-01-21	CAUE DE NASCIMENTO	\N	9	Ativo	0
1673	2006-07-07	CHRYSTIAN PAULINO FELICIANO DA SILVA	\N	9	Ativo	0
1674	2006-04-19	GUILHERME RAFAEL SILVA DO NASCIMENTO	\N	9	Ativo	0
1675	2006-07-16	GUSTAVO DA SILVA CANDIDO	\N	9	Ativo	0
1676	2006-10-03	ITALO GLEIDSON CORREIA DA SILVA	\N	9	Ativo	0
1677	2006-08-20	JACKSON ROBERTO DOS SANTOS SILVA	\N	9	Ativo	0
1678	2006-06-07	OTACILIO PEREIRA DE MELO FILHO	\N	9	Ativo	0
1679	2006-06-01	ABMAEL MUNIZ DO NASCIMENTO	\N	9	Ativo	0
1680	2006-09-05	JOAN XAVIER DE SOUSA NASCIMENTO	\N	9	Ativo	0
1681	2006-08-25	LUANDERSON DE LIMA BERNARDO	\N	9	Ativo	0
1682	2006-12-16	MARIA CLARA RAMOS DA SILVA	\N	9	Ativo	0
1684	2007-02-10	PEDRO PAULO DE OIVEIRA MELO	\N	9	Ativo	0
1685	2006-12-29	SAMUEL LUCAS ALVES DIAS	\N	9	Ativo	0
1686	2007-04-05	ADRIANA RAYSSA SOUZA DA SILVA	\N	9	Ativo	0
1687	2006-05-22	SARAH SANTOS OLIVEIRA	\N	9	Ativo	0
1688	2006-02-10	JOSE WALTERCIO DE SOUZA SILVA	\N	9	Ativo	0
1689	2006-09-12	GABRIEL SILVA DO NASCIMENTO	\N	9	Ativo	0
1690	2006-05-28	DAVI ELIEL DA SILVA PONTES	12274567433	9	Ativo	0
2972	\N	teste rty	\N	0	Ativo	0
1691	2006-07-27	RIKELVY MACIEL DA SILVA	\N	9	Ativo	0
1692	2006-11-20	FLAVIO ANDRADE DOAS SANTOS	\N	9	Ativo	0
1693	2006-10-17	EMANOEL ALEXSANDRO SOUZA DE OLIVEIRA	\N	9	Ativo	0
1694	2005-12-15	AMANDA RAQUEL DA COSTA SILVA	\N	9	Ativo	0
1695	2006-03-15	DAIANE VITORIA DO NASCIMENTO	\N	9	Ativo	0
1696	2004-01-06	DANIEL MATHEUS DA SILVA FERREIRA	\N	9	Ativo	0
798	2006-04-27	JULIA FERREIRA MARINHEIRO	\N	8	Ativo	0
1195	2000-05-23	ELIEL DE SANTANA LINS	\N	8	Ativo	0
799	2006-12-14	LAZARO GABRIEL DA SILVA TAVARES	\N	8	Ativo	0
801	2006-05-29	MARIA EDUARDA ANTUNES DINIZ	\N	8	Ativo	0
1015	2002-10-04	GABRIEL DE ARAUJO BRAZ	\N	8	Ativo	0
802	2007-05-05	MARIA EDUARDA ROSENDO DA SILVA	12390708455	8	Ativo	0
803	2006-07-27	MARIANA SOUZA DA SILVA	\N	8	Ativo	0
804	2006-07-24	MAYKON WINICIUS FERNANDES DE ARAUJO	\N	8	Ativo	0
805	2006-11-25	MEYRIELLE KATHERINNE BESERRA DA SILVA	\N	8	Ativo	0
806	2006-06-15	MIRELLY FERNANDES DE OLIVEIRA	\N	8	Ativo	0
807	2006-11-20	MONIQUE CANDIDO GOMES	\N	8	Ativo	0
808	2006-08-14	PAULO VITOR RODRIGUES DIAS	\N	8	Ativo	0
809	2006-11-12	RAYLHANY DANYELLE DA SILVA	\N	8	Ativo	0
810	2007-03-28	RAYSSA MIRELLA COSTA MIRANDA	\N	8	Ativo	0
811	2006-09-29	SARA DO NASCIMENTO TORRES	\N	8	Ativo	0
812	2006-04-30	VITOR GABRIEL DA SILVA MACHADO	12314882474	8	Ativo	0
813	2006-07-18	WESLLEY HANRY SILVA DO NASCIMENTO	\N	8	Ativo	0
814	2006-11-19	WESLEY MAGALHAES DE LIMA	\N	8	Ativo	0
815	2006-10-15	YASMIM DA SILVA VICENTE	\N	8	Ativo	0
816	2007-08-28	ITALO BRUNO PASCOAL MARQUES	\N	8	Ativo	0
817	2005-10-18	FRANCISCO DIVINO ALMEIDA VIANA	06223164351	8	Ativo	0
818	2005-08-02	ADSON MARTINS BARBOSA	\N	8	Ativo	0
819	2006-03-23	AISLANNE MARCELA DOS SANTOS	\N	8	Ativo	0
820	2005-05-06	ANA CLARA DA SILVA GOMES	\N	8	Ativo	0
821	2006-01-11	ANA PAULA BEZERRA DOS SANTOS	\N	8	Ativo	0
822	2005-11-03	BIANCA DA SILVA SANTOS	\N	8	Ativo	0
823	2006-01-01	BRUNO CARVALHO DA COSTA	70360993486	8	Ativo	0
824	2005-04-28	EDSON ALLYSON NASCIMENTO SANTOS BARBOSA	01722179465	8	Ativo	0
825	2005-07-18	EDGLEYCE OLIVEIRA MAGALHAES	\N	8	Ativo	0
826	2005-06-13	ELVYS DA FONSECA SILVA	\N	8	Ativo	0
827	2005-04-25	EMILY IZABELI PEREIRA DA SILVA	\N	8	Ativo	0
828	2005-07-10	EWERTON DANIEL MENDES RAMIRO	\N	8	Ativo	0
829	2005-12-27	FELIPE BARBOSA GRACIANO	70236835424	8	Ativo	0
830	2005-09-24	FELIPE ELIAS CASSEMIRO DOS SANTOS	\N	8	Ativo	0
831	2006-03-08	GABRIEL DO NASCIMENTO SILVA	\N	8	Ativo	0
832	2004-08-13	GISELLE VOTORIA OLIVEIRA DA SILVA	\N	8	Ativo	0
833	2006-02-22	IGOR JOSE TEODOSIO DOS SANTOS	\N	8	Ativo	0
834	2005-08-26	INGRIDI ELOISA LUIZ DOS SANTOS	\N	8	Ativo	0
835	2005-05-26	ISABELY SILVA SANTOS	\N	8	Ativo	0
836	2005-12-01	JOAO VICTOR SOUZA DE BRITO	\N	8	Ativo	0
837	2005-05-09	JOSE ANDERSON AUGUSTO NUNES DE LIMA	\N	8	Ativo	0
838	2005-07-27	JOSE ULISSES COSME DE OLIVEIRA	\N	8	Ativo	0
839	2005-10-12	LEONARDO DE FARIAS DA SILVA	\N	8	Ativo	0
840	2006-05-24	LETYCIA GABRIELLE BARBOSA E SILVA	\N	8	Ativo	0
841	2006-03-18	LUCAS ARAUJO BRAZ	\N	8	Ativo	0
842	2005-07-26	MARCELO SILVA DE OLIVEIRA	\N	8	Ativo	0
843	2005-09-08	NATHANAEL DAVID DOS REIS DA CUNHA	\N	8	Ativo	0
844	2005-10-26	ROSIMARA ALANA TERTO TEIXEIRA DE LIMA	\N	8	Ativo	0
845	2006-01-21	SARAH VITORIA RAMOS TEIXEIRA	\N	8	Ativo	0
846	2004-09-24	CAIO ANDRE DA SILVA	\N	8	Ativo	0
847	2004-10-10	ANA PAULA DIONISIO SILVA	01818506483	8	Ativo	0
848	2004-06-28	BARBARA REGINA BEZERRA DA SILVA	\N	8	Ativo	0
849	2004-07-04	CAIO PEREIRA GERMANO DE LIMA	\N	8	Ativo	0
850	2004-12-09	DAVYD VITOR FERREIRA DA SILVA	\N	8	Ativo	0
851	2004-10-23	ELISSON MATHEUS DOS SANTOS SILVA	\N	8	Ativo	0
852	2004-10-18	ELOHIM MARQUES SILVA SANTOS	\N	8	Ativo	0
853	2005-08-03	EMANUEL MAXWENDELL SILVA RODRIGUES	12490058410	8	Ativo	0
854	2004-04-06	FELIPE LOES SANTOS SANTIAGO	\N	8	Ativo	0
855	2005-01-03	FRANKLIN MISAEL DE SOUZA NEVES NASCIMENTO	\N	8	Ativo	0
856	2004-07-18	INGRID XAVIER GOMES DE LIMA	\N	8	Ativo	0
857	1999-08-25	JEAN FELIPE DE BRITO	06307724447	8	Ativo	0
858	2004-07-16	JOAO VITOR COSMO DA COSTA	70362096406	8	Ativo	0
859	2004-10-07	JOAO VICTOR OLIVEIRA DE SENA	\N	8	Ativo	0
860	2004-05-09	JOSE PEREIRA COSTA DE ARAUJO	707500885483	8	Ativo	0
861	2004-10-02	MARCELLE BEATRIZ SANTOS COSTA	70696677440	8	Ativo	0
862	2005-04-18	MARCOS ANTONIO GOMES DE GOIS FILHO	\N	8	Ativo	0
863	2004-07-11	MERIELY RAYONARA SILVA DO NASCIMENTO	\N	8	Ativo	0
864	2005-05-01	PEDRO AUGUSTO DOS SANTOS	\N	8	Ativo	0
865	2004-06-11	REBEKA RAYANNE GOMES DE MACEDO	\N	8	Ativo	0
867	2004-04-18	THAYSA ANAYANA DO NASCIMENTO	\N	8	Ativo	0
762	2007-09-29	ANA LETICIA GALDINO DE SALES	\N	8	Ativo	0
764	2007-11-13	CAIO MATEUS RAMOS DE MELO	\N	8	Ativo	0
765	2007-06-18	CARLOS MIGUEL OLIVEIRA DA SILVA	\N	8	Ativo	0
766	2007-07-17	CAUAN CARLOS BRITO DOS SANTOS	\N	8	Ativo	0
767	2006-07-18	EMILLY VITORIA TEIXEIRA DA SILVA	\N	8	Ativo	0
768	2007-12-26	ISAAC BRUNO DA SILVA GOMES	\N	8	Ativo	0
1326	1998-01-03	ALINE NOGUEIRA	\N	8	Ativo	0
876	2003-10-21	CARLA KAWANE GALDINO DA SILVA	\N	8	Ativo	0
877	2003-12-04	ELAINE VITORIA FREITAS DE OLIVERIA	70417063466	8	Ativo	0
878	2003-08-02	HAWANDERSON MISAEL SIQUEIRA DA SILVA	12499300493	8	Ativo	0
879	2004-02-04	ISABELLE KELLY ADELINA SILVA DE SOUZA	\N	8	Ativo	0
881	2004-06-21	JENNYFER MICLEYDE SANTOS FRANCO DE MEDEIROS	\N	8	Ativo	0
882	2004-07-29	JOSINALDO SILVA DE FRANCA	\N	8	Ativo	0
883	2004-05-19	KAYLANE DA SILVA MACHADO	12314890493	8	Ativo	0
884	2004-01-24	KLEVERSON MACIEL NOBRE	11116279401	8	Ativo	0
885	2002-12-30	LARIANE SILVA DE FRANCA	\N	8	Ativo	0
886	2004-05-19	LARYSSA EMANUELE BARBOSA E SILVA	\N	8	Ativo	0
887	2002-01-10	LILIANE DA FONSECA MOREIRA	\N	8	Ativo	0
888	2002-07-28	MARIA ALICE DIONISIO COSTA	\N	8	Ativo	0
889	2003-07-27	MATHEUS SANTOS DE MENDONCA	\N	8	Ativo	0
890	2002-05-01	NATALIA SANTOS DE MENDONCA	\N	8	Ativo	0
891	2004-08-21	RAYONARA VITORIA DA SILVA	\N	8	Ativo	0
892	2004-01-30	SUSANA MARIA DA SILVA	\N	8	Ativo	0
893	2003-03-16	VICTOR HUGO BEZERRA DA SILVA	\N	8	Ativo	0
894	2004-03-20	VINICIUS DIOGO DA SILVA BERNARDINO	\N	8	Ativo	0
895	2004-06-29	VITOR HUGO NASCIMENTO DA SILVA	\N	8	Ativo	0
896	2004-03-07	SARA CRISLANE OLIVEIRA DA SILVA	\N	8	Ativo	0
897	2003-05-17	CAUA DERICK DE CARVALHO SOARES	12476133485	8	Ativo	0
2022	2006-04-10	CAUA DA SILVA FONSECA	\N	7	Ativo	0
1760	2005-11-11	RICARDO DE BRITO	\N	9	Ativo	0
899	2004-06-18	MARCELLINE BRITO DA CRUZ	\N	8	Ativo	0
900	2004-06-16	LARISSA VITORIA SANTOS FREITAS	7796817405	8	Ativo	0
901	2003-10-22	ALANNE MAYARA DIONISIO DA SILVA	01815807455	8	Ativo	0
902	2003-09-28	ALIDA LETICIA BEZERRA DA SILVA	\N	8	Ativo	0
903	2003-04-01	ALYSSON GUILHERME MELO DA COSTA	\N	8	Ativo	0
904	2003-09-25	ANA LIGIA DA SILVA NASCIMENTO	\N	8	Ativo	0
906	2003-04-01	CARLOS ANTONIO LORENZ DOS SANTOS	\N	8	Ativo	0
907	2003-03-18	DEYVISSON ALISSON DA SILVA	\N	8	Ativo	0
908	2004-01-14	DIOGO OLIVEIRA DE MORAIS	\N	8	Ativo	0
909	2003-04-30	ELLYDY ANDRESA DOS SANTOS	01722181443	8	Ativo	0
910	2003-01-14	FELIPE NICACIO DE OLIVEIRA NUNES	\N	8	Ativo	0
911	2003-05-25	GEOVANNA CANDIDA DA SILVA	\N	8	Ativo	0
912	2003-06-07	GEOVANNY LOPES FERNANDES	12086191448	8	Ativo	0
2347	2014-09-30	SICRANO	22211133344	0	Ativo	0
782	2008-04-10	VITOR GABRIEL PEREIRA DE SOUZA	\N	8	Ativo	0
1579	2009-03-30	JENIFFER FLORDELINS DA SILVA FRANCA	\N	9	Ativo	0
1580	2009-07-26	JONATHAN HENRIQUE DA SILVA	\N	9	Ativo	0
1581	2009-02-06	JOYCE ANNY NASCIMENTO DE ARAUJO	\N	9	Ativo	0
1582	2009-09-30	LEIFSON HENRIQUE SOUSA DE CASTRO	\N	9	Ativo	0
1583	2010-04-23	LISLANY THAUANE MOREIRA DA SILVA	\N	9	Ativo	0
1584	2009-12-12	LUIS EDUARDO DE AZEVEDO BEZERRA	\N	9	Ativo	0
1585	2009-02-21	MANOELE RAQUEL SILVA DE OLIVEIRA	\N	9	Ativo	0
1586	2009-09-01	MARCOS ANTONY DA SILVA FERREIRA	\N	9	Ativo	0
1587	2010-03-30	MAYKON DANTAS DA SILVA	\N	9	Ativo	0
1588	2009-01-11	SAMUEL RODRIGUES DE MIRANDA	\N	9	Ativo	0
1589	2008-08-10	WELMO SILVA DO NASCIMENTO JUNIOR	\N	9	Ativo	0
1590	2009-05-01	YURI RAMOS DA SILVA	\N	9	Ativo	0
1591	2008-12-30	DARYEL PRAXEDES GALVAO	\N	9	Ativo	0
1592	2007-04-12	ALEX FERREIRA DE LIMA	\N	9	Ativo	0
1593	2007-06-26	DARLYSON PRAXEDES GALVAO	\N	9	Ativo	0
1594	2008-03-25	DAVI FERREIRA DE QUEIROZ	\N	9	Ativo	0
1595	2007-08-09	DOMINICK KELLY MARTINS DA SILVA	\N	9	Ativo	0
1596	2008-01-12	ERYCK DA SILVA FELICIANO	\N	9	Ativo	0
1597	2007-09-18	FABRICIO FRANCA VALENTIM	\N	9	Ativo	0
1598	2007-07-16	FLAVIA TAYSSA SOARES DA SILVA	\N	9	Ativo	0
1599	1900-01-01	GUILHERME OLIVEIRA DA SILVA	\N	9	Ativo	0
1600	2007-06-17	HITALO RAUA CASTRO DOS REIS	\N	9	Ativo	0
1601	2008-03-03	ISAAC ELIZEU DA SILVA PONTES	\N	9	Ativo	0
1602	2007-08-09	ISABELE SILVA GOMES	\N	9	Ativo	0
1603	2008-02-19	JOAO VICTOR VENANCIO MEDEIROS	\N	9	Ativo	0
1604	2008-04-22	JOSEMBERG CLEMENTE BARBOSA	\N	9	Ativo	0
1605	2008-03-22	KEVERSON WILLIAN SILVA DA COSTA	\N	9	Ativo	0
1606	2007-06-29	LAURA CANDIDA DO NASCIMENTO CONCEICAO	\N	9	Ativo	0
1607	2008-05-01	LIEDSON GRACINO DA SILVA	\N	9	Ativo	0
2747	1998-10-25	LUCAS HENRIQUE VIEIRA TAVARES	11970489448	8	Ativo	0
2335	2014-09-23	Jose Francivaldo Lucio	32145676512	8	Ativo	0
1386	2002-12-21	BRUNA KAROLLYNE	10679656456	8	Ativo	0
1387	1999-03-04	DANIEL MUNIZ FARIAS	\N	8	Ativo	0
1388	2001-07-21	DEBORA EMANUELLE CABRAL DE OLVIVEIRA	\N	8	Ativo	0
2245	1959-01-20	SEBASTIAO VENCESLAU DOS SANTOS	22213783420	8	Ativo	0
2336	2014-09-23	roberto manaia dos santos junior	23333333333333333333333	0	Ativo	0
2337	2014-09-23	ESCOLA TESTE 2	11111111111	0	Ativo	0
2304	\N	ANTONIO MARCOS MANTUAL	19159689849	0	Ativo	0
2307	\N	SIDCLEI FIGUEROA DOS SANTOS RODRIGUES	02631578490	0	Ativo	0
2308	\N	JOAO MARIA LOPES DA SILVA	48156474472	0	Ativo	0
2309	\N	JEANE DIAS RIBEIRO	02576553443	0	Ativo	0
2338	1999-10-30	Manaia Manaia	06806806806	0	Ativo	0
2748	2001-01-23	ALEXSANDRO FERNANDES DA SILVA FILHO	\N	8	Ativo	0
2749	2002-03-15	TALLISSON CAIO SOUZA DE MACEDO	124318844-81	8	Ativo	0
2750	2001-02-13	DÉBORA GUILHERME BARBOSA DOS SANTOS	707665874-79	8	Ativo	0
2751	2001-06-09	DANIELE SILVA DE LIMA	700907014-88	8	Ativo	0
2752	2000-11-30	FRANCISCO CASSIO DA SILVA SOUZA	129653354-98	8	Ativo	0
2753	2001-06-17	GABRIELA MARIA DA NÓBREGA FREITAS	\N	8	Ativo	0
2754	2001-03-25	GABRIELLE SILVA BARBOSA DOS SANTOS	052497655-48	8	Ativo	0
2755	2015-02-04	JONATHAS WASHINGTON DA SILVA	018146544-29	8	Ativo	0
2757	2001-06-05	JULIANA VIANA DUARTE	70151837490	8	Ativo	0
1632	2007-08-13	EMILLY VITORIA ALVES ROSENDO DOS SANTOS	\N	9	Ativo	0
1633	2007-10-28	ELIABE GUEDES DA SILVA DANTAS	\N	9	Ativo	0
1634	2007-10-15	CECILIA MELO DO NASCIMENTO	\N	9	Ativo	0
1635	2008-01-22	ANTONIO DOUGLAS DO NASCIMENTO TORRES	\N	9	Ativo	0
1636	2007-05-09	KAILANE DE FARIAS ANDRADE	\N	9	Ativo	0
1637	2007-04-03	ANA KAROLLYNE BEZERRA DA SILVA	\N	9	Ativo	0
1638	2006-06-20	ANA SARA FABRICIO MACIEL	\N	9	Ativo	0
1639	2006-10-07	CAMILE VITORIA CANDIDA DA SILVA	\N	9	Ativo	0
1640	2007-05-28	DEDORA RAYANE DA SILVA	\N	9	Ativo	0
1641	2006-06-18	EMILLY EMMANUELLE DE CASTRO MEDEIROS	\N	9	Ativo	0
1642	2006-11-25	EVELLYN RAYANE SOARES DOS SANTOS	\N	9	Ativo	0
1643	2004-02-08	FLAVIO VINICIO DA SILVA ANDRADE	\N	9	Ativo	0
1644	2006-10-31	FRANCIRENE DE FRANCA LIMA	\N	9	Ativo	0
1645	2006-12-03	GABRIELA FERNANDES DA COSTA	\N	9	Ativo	0
1646	2007-02-22	GEILSON SANTOS DO NASCIMENTO	\N	9	Ativo	0
1647	2007-03-21	JADSON DA SILVA RIBEIRO	\N	9	Ativo	0
1648	2006-12-15	JOSE CARLOS NASCIMENTO DA SILVA	\N	9	Ativo	0
1649	2005-10-24	JOSE CARLOS OLIVEIRA DE SOUZA	\N	9	Ativo	0
1650	2006-11-14	JOSUE LUIS SILVA DA CRUZ	\N	9	Ativo	0
1651	2006-03-09	JUAN KAIRON CASTRO DOS REIS	\N	9	Ativo	0
1652	2007-01-17	KAIUMY HORACIO DE OLIVEIRA	\N	9	Ativo	0
1653	2006-11-23	LUCAS GABRIEL LAZARO DA SILVA	\N	9	Ativo	0
1654	2006-09-27	LUCAS RIBEIRO OLIVEIRA	\N	9	Ativo	0
2531	2014-12-02	asdfadfgas-0987	798754654218412	0	Ativo	0
2093	1965-08-09	FRANCISCO TRAJANO DA SILVA	77923391491	8	Ativo	0
2085	1970-06-24	PAULO JUNIOR SIQUEIRA	37896598434	8	Ativo	0
2086	1967-05-05	IRIS REGINA DE S G R MARQUES	42331471487	8	Ativo	0
2087	1962-07-11	LEDA GONZAGA CABRAL	33634807415	8	Ativo	0
2088	1971-10-13	FATIMA CARDOSO DA SILVA	53877535453	8	Ativo	0
2089	1988-09-13	ANDREIA SILVA DE MELO	01419015435	8	Ativo	0
2090	1966-05-02	MARIA VERALUCIA DO NASCIMENTO	49077090487	8	Ativo	0
2091	\N	LUCIANO MARIANO DE OLIVEIRA	08590281434	8	Ativo	0
2092	1948-09-01	MARIA DA CONCEICAO S DO NASCIMENTO	75128810453	8	Ativo	0
2094	1955-04-02	ARIOSTON DE SOUZA ABRANTES	15084183491	8	Ativo	0
2285	1958-09-24	EDNILMA PIMENTA NASCIMENTO	26096323472	0	Ativo	0
2286	1970-09-23	FRANCISCA SYNARA TEIXEIRA FERNANDES	82860076468	0	Ativo	0
4	1989-04-17	Thiago Pereira de Souza	654951357	0	Ativo	0
2246	1973-03-09	JOSENILDA GONCALVES DO NASCIMENTO	80761348468	8	Ativo	0
2247	1963-08-22	MARIA GORETE SILVA DOS SANTOS	35819758404	8	Ativo	0
2503	2014-11-14	ZZZ	213111	0	Ativo	0
51	1992-11-17	Franklin Teste	09024942446	0	Ativo	0
2248	1952-02-22	FRANCISCA VIANA FILHA	07263384434	8	Ativo	0
2249	1976-09-09	CARLOS CESAR GOMES PEREIRA	02070943496	8	Ativo	0
2250	1957-01-28	AURISMAR LOPES DE SOUZA	22148302434	8	Ativo	0
2251	1969-08-18	ELIONE DE LIMA DANTAS	42949238491	8	Ativo	0
2252	1952-11-29	ARY LOPES DA SILVA	70216711487	8	Ativo	0
2762	2009-03-22	MARIA ELOÍSA RODRIGUES GOMES	708.502.634-09	7	Ativo	0
2763	2009-05-12	MARIA ISABELL BASILIO DE LIMA	\N	7	Ativo	0
2764	2008-06-29	MARJORIE CECÍLIA ANDRADE DA SILVA	\N	7	Ativo	0
2765	2009-04-06	MICAEL CARVALHO RAMOS DA SILVA	130.576.434-00	7	Ativo	0
2766	2008-06-29	PAULO CÉSAR SOUZA DA SILVA	\N	7	Ativo	0
2767	2009-05-21	PAULO VINÍCIUS SANTOS DE LIMA	\N	7	Ativo	0
2768	2009-03-20	RIKELMY GABRIEL SOUZA DE LIMA	\N	7	Ativo	0
2769	2009-02-06	THALLES LEANDRO RAMOS DA SILVA	\N	7	Ativo	0
2770	2009-02-26	VÍTOR GABRIEL LEOCÁDIO DE LIMA	\N	7	Ativo	0
2772	2007-09-23	CAUÃ FLÁVIO MARQUES LIMA	\N	7	Ativo	0
2773	2007-09-23	CAUÃ FLÁVIO MARQUES LIMA	\N	7	Ativo	0
2774	2007-09-25	JOYCE GRAZIELLY DOS SANTOS FAUSTINO	\N	7	Ativo	0
2775	2007-04-04	LEILSON VÍTOR DANTAS VIANA	\N	7	Ativo	0
2776	2020-12-29	JOÃO LYANDSON ALVES DA SILVA	707.538.634-48	7	Ativo	0
2777	2007-09-09	JÚLIO CÉSAR SOUZA RAMOS	\N	7	Ativo	0
2778	2008-03-18	KAUÃ DOS SANTOS LEMOS	\N	7	Ativo	0
2779	2008-06-02	ALICE MARQUES DA SILVA TEIXEIRA	702.330.464-96	7	Ativo	0
2780	2008-05-31	ANA BEATRIZ DE FREITAS BEVENUTO	125.124.254-52	7	Ativo	0
2781	2008-01-04	ANA KAROLINA FERNANDES DA SILVA	099.883.694-09	7	Ativo	0
2783	2008-01-23	JAANA ÁGATHA RODRIGUES DASILVA	\N	7	Ativo	0
2786	2007-09-18	JENNYFER MONTEIRO SIQUEIRA	\N	7	Ativo	0
2788	2007-06-10	JOÃO GABRIEL ARAÚJO DA SILVA	\N	7	Ativo	0
2789	2008-04-02	JOSÉ ALEXANDRE GOMES	\N	7	Ativo	0
2795	2007-10-22	LETÍCIA SANTOS DA SILVA PRAÇA	708.127.864-75	7	Ativo	0
2798	2008-01-22	LETÍCIA VITÓRIA RODRIGUES TORQUATO	707.536.854-00	7	Ativo	0
2785	2011-02-14	FRANKLIN KAUAN ABATH DE SOUZA	\N	9	Ativo	0
2782	2009-10-08	DAYANNE BEZERRA MARTINS	\N	9	Ativo	0
2062	1975-06-09	CLAUDIA HELENA BEZERRA DA CUNHA DA SILVA	87670038420	9	Ativo	0
2797	2010-05-18	ISMAEL SILVA DE ALMEIDA	\N	9	Ativo	0
10	2010-03-24	ESCOLA MUNICIPAL PROFESSORA MARIA LOURDES DE LIMA F	12002826000179	0	Inativo	0
2253	1967-04-16	EVERANEIDE LIMA BEZERRA DE ALMEIDA	52353761453	8	Ativo	0
2254	1974-03-05	EDINEIDE DO NASCIMENTO	02128151481	8	Ativo	0
2255	1974-08-09	FRANCILENE DIAS DANTAS	73743550415	8	Ativo	0
2256	1971-11-15	JAILSON HORACIO DE SOUZA	87746999468	8	Ativo	0
2257	1964-10-22	MARIA ALDENORA DOS SANTOS MEDEIROS	70413207404	8	Ativo	0
2258	1960-11-26	MARIA DO SOCORRO NEVES COSTA	22230294487	8	Ativo	0
2259	1974-10-09	ANA MARIA TEIXEIRA DE SOUZA	03591567469	8	Ativo	0
2260	1963-04-30	REJANE FREIRE CAVALCANTE	36565440425	8	Ativo	0
2261	1977-07-04	CYNTHIA DE CASSIA CABRAL	00056284403	8	Ativo	0
2262	1959-06-24	ROSILDA ACIOLE BARBOSA	42946786404	8	Ativo	0
2263	1987-09-28	ANA PAULA DIAS DOS SANTOS	06683125481	8	Ativo	0
1402	2002-02-14	JOCYMARA FERREIRA MARINHEIRO	\N	8	Ativo	0
771	2007-10-01	JOSE ARTHUR LUCENA DA SILVA	\N	8	Ativo	0
783	2007-07-19	WANDEMBERG SILVA DE OLIVEIRA	\N	8	Ativo	0
11	1997-05-23	CENTRO EDUCACIONAL 1 DE MAIO	01939036000106	0	Inativo	0
37	2011-02-11	CENTRO DE EDUCACAO PRE ESCOLAR LEIA FELIPE DE SOUZA	13501843000113	0	Inativo	0
41	1997-07-10	ESCOLA MUNICIPAL DE 1 E 2 JOSE FRANCISCO DA COSTA	01965393000130	0	Inativo	0
32	2011-07-14	ESCOLA MUNICIPAL DE 1 GRAU COSMO ALVES DE SOUZA	14039599000181	0	Inativo	0
36	1999-05-06	ESCOLA MUNICIPAL DE 1 GRAU DJALMA MARINHO	03174690000193	0	Inativo	0
38	1997-06-11	ESCOLA MUNICIPAL DE 1 GRAU DOUTOR VARELA BARCA	02043244000187	0	Inativo	0
45	2008-04-14	ESCOLA MUNICIPAL DE 1 GRAU ISABEL DA SILVEIRA	09520884000180	0	Inativo	0
47	1999-05-17	ESCOLA MUNICIPAL DE 1 GRAU LEONEL MESQUITA	03166843000150	0	Inativo	0
30	1999-05-21	ESCOLA MUNICIPAL DE 1 GRAU BENIGNA SILVA	03167067000103	0	Inativo	0
34	1999-05-26	ESCOLA MUNICIPAL DE 1 GRAU CLEUZA APARECIDA F LAUREANO	03173605000172	0	Inativo	0
17	1999-05-25	ESCOLA MUNICIPAL DE 1 GRAU JOAQUIM INES DO NASCIMENTO	03170363000163	0	Inativo	0
21	1998-04-29	ESCOLA MUNICIPAL DE 1 GRAU JOAQUIM VICTOR DE HOLANDA	02494930000174	0	Inativo	0
19	1997-05-24	ESCOLA MUNICIPAL DE 1 GRAU JONAS ESCOLASTICO DE NORONHA	01930154000145	0	Inativo	0
46	1997-06-27	ESCOLA MUNICIPAL DE 1 GRAU MARIA RUFINA DE LIMA	01942474000115	0	Inativo	0
2292	\N	MARIA DE FATIMA PEREIRA DA SILVA	75202220472	7	Ativo	0
2330	\N	MAXWELL NASCIMENTO DA SILVA	10297667667	7	Ativo	0
2800	2007-06-21	LÍVIA MARIA ALVES DE LIMA	\N	7	Ativo	0
2801	2007-07-30	LORENNA LAÍS DA SILVA MARQUES	\N	7	Ativo	0
2803	2007-05-11	LUCAS GABRIEL FELISBERTO DE MELO	130.544.354-31	7	Ativo	0
2804	2007-08-12	MARIA CLARA DA SILVA LOURENÇO	128.166.824-98	7	Ativo	0
2805	2007-09-19	MARIA CLARA TOMAZ DE ARAÚJO	\N	7	Ativo	0
2806	2008-03-08	PAULO GUILHERME RODRIGUES DE SOUSA	124.934.894-38	7	Ativo	0
2807	2008-02-09	SARAH VITÓRIA ALVES DO NASCIMENTO	707.516.744-86	7	Ativo	0
2052	1980-05-21	ANA MARIA DOS SANTOS DE OLIVEIRA	00932715494	9	Ativo	0
2332	1969-12-14	NILDA MARIA LUCAS DE SOUZA	77909313420	9	Ativo	0
2808	2010-12-01	MARIA GABRIELA DE BRITO SILVA	\N	9	Ativo	0
2810	2009-11-13	MARIA EDUARDA CÂNDIDO DE OLIVEIRA	\N	9	Ativo	0
8	1997-06-19	ESCOLA MUNICIPAL DE 1 E 2 GRAUS VICENTE FRANCA MONTE	01926842000131	0	Ativo	0
769	2007-06-10	JOAO VITOR MEDEIROS DA SILCA	\N	8	Ativo	0
770	2008-05-09	JONATHAN AKILYS DA SILVA GOMES	\N	8	Ativo	0
772	2007-07-15	JOSE HENRIQUE DA SILVA	70393496473	8	Ativo	0
773	2008-05-05	KAROLYNNE EMANUELE RAMOS TEIXEIRA	\N	8	Ativo	0
774	2008-02-22	KELIA MARTA LIMA DE ABREU	\N	8	Ativo	0
775	2008-02-11	MAGNUS RODRIGO AIRES DA SILVA	\N	8	Ativo	0
776	2007-07-18	MAHYRLLA GABRIELLY DE ARAUJO	\N	8	Ativo	0
777	2007-12-29	MARIA DA LUZ GOMES DOS SANTOS	\N	8	Ativo	0
778	2007-04-27	MARIA VICTORIA SOUZA BRITO	70568716400	8	Ativo	0
779	2007-10-08	MARYANE MARQUES PINHEIRO	\N	8	Ativo	0
780	2008-02-16	PAULO CEZAR MIRANDA PORTES	\N	8	Ativo	0
781	2007-11-27	STHEFANY CAUANY DANTAS CUNHA	\N	8	Ativo	0
2812	2007-03-27	CALINE LAIS OLIVEIRA DE LIMA	707.354.824-03	7	Ativo	0
2815	2006-04-05	EMERSON GABRIEL FERNANDES MARTINS DA COSTA	707.532.774-76	7	Ativo	0
2820	2006-12-17	NATHÁLIA KAROLINE MELO DA SILVA	099.939.444-40	7	Ativo	0
2822	2006-01-15	ROGÉRIO SALES DO NASCIMENTO	124.227.804-40	7	Ativo	0
2826	2007-01-12	ANA BEATRIZ PEREIRA DE SOUSA	\N	7	Ativo	0
2829	2006-09-16	CAYRON YURI BEZERRA DA SILVA	\N	7	Ativo	0
2814	2011-03-13	DÉBORA VICTÓRIA ROCHA DOS SANTOS COSTA	\N	9	Ativo	0
2816	2009-07-02	ANTONELLA DA SILVA SOUZA	\N	9	Ativo	0
2817	2010-07-21	RICHARD BAZÍLIO DOS SANTOS LEANDRO	\N	9	Ativo	0
2818	2010-11-24	ISABELLY CRISTINA LEOCADIO DE LIMA	\N	9	Ativo	0
2819	2010-12-02	LANNA DOS SANTOS LUIZ	\N	9	Ativo	0
2821	2010-08-17	ROBSON ROBÉRIO FARIAS DOS SANTOS	\N	9	Ativo	0
2823	2010-08-06	WYLLIANE FRANÇA DE MOURA	\N	9	Ativo	0
2824	2011-02-03	RIAN RIBEIRO DE OLIVEIRA	\N	9	Ativo	0
2825	2011-04-27	KAUÃ WILLIAMS MATOS DE ARRUDA	\N	9	Ativo	0
2827	2011-03-27	MARIA APARECIDA ALVES PEREIRA DE SOUZA	\N	9	Ativo	0
2828	2010-12-08	MIGUEL DO NASCIMENTO EVANGELISTA	\N	9	Ativo	0
2832	2010-01-09	MARIA JÚLLIA OLIVEIRA DA SILVA	\N	9	Ativo	0
2833	2009-08-10	JOÃO PEDRO SANTOS NUNES	\N	9	Ativo	0
784	2007-08-24	WILLAMES BARBOSA DE LIMA	\N	8	Ativo	0
785	2008-02-29	YURY GABRIEL LOUREIRO MARQUES	\N	8	Ativo	0
786	2008-05-19	MERCIA SILVA DE OLIVEIRA	\N	8	Ativo	0
898	2004-10-06	ISLANIA DA SILVA ANDRADE	\N	8	Ativo	0
1094	2002-04-30	JOSE EDUARDO DA SILVA	\N	8	Ativo	0
1411	2002-03-11	RIAN BORGES ALVES	\N	8	Ativo	0
868	2004-04-15	WESLEI FERREIRA DA SILVA	\N	8	Ativo	0
2096	1963-04-24	LECI MARTINS DE LIMA NIELSON	42982928434	8	Ativo	0
2097	1982-09-23	JOSE WERBSON MENEZES DE OLIVEIRA	04539444425	8	Ativo	0
913	2003-07-17	GUILHERME DA SILVA TAVARES	\N	8	Ativo	0
914	2003-03-27	IANNY CAROLLINY SOUZA MASCARENHAS	\N	8	Ativo	0
915	2003-02-06	ITALO SIQUEIRA SANTOS	\N	8	Ativo	0
916	2003-11-05	JOAO PAULO MARTINS DA CRUZ	\N	8	Ativo	0
917	2003-03-05	JOSE MANOEL COSTA DE ARAUJO	70750887427	8	Ativo	0
918	2004-03-03	JOSE VICTOR FERNANDES BRASIL	\N	8	Ativo	0
919	2004-02-11	KAUANY ISABELA XAVIER DA SILVA	70564625450	8	Ativo	0
787	2008-04-04	LUCAS RAFAEL PALHANO DE JESUS	70776909460	8	Ativo	0
788	2006-09-19	AMANDA CLARA NUNES DE LIMA	\N	8	Ativo	0
789	2006-05-09	MARIA LUCIA DE FARIAS SANTOS	\N	8	Ativo	0
790	2006-04-18	ANA JULIA COSTA SILVA	\N	8	Ativo	0
791	2006-05-09	ALESSANDRA VITORIA DE FARIAS	\N	8	Ativo	0
792	2007-04-13	CAIO VINICIUS RIBEIRO SILVA	\N	8	Ativo	0
793	2006-04-19	ELLEN VOTORIA SANTANA DA SILVA	\N	8	Ativo	0
794	2006-06-13	ERICKA DA SILVA BERNARDINO	\N	8	Ativo	0
795	2006-08-16	HELDER HENRIQUE ROCHA DA SILVA	\N	8	Ativo	0
796	1996-10-31	IARA MARIANNE SANTIAGO DA SILVA	\N	8	Ativo	0
2973	\N	teste oi	\N	0	Ativo	0
797	2006-08-10	ISTEFANE RICHELLE LUIZ DOS SANTOS	\N	8	Ativo	0
2874	2000-02-17	LUCAS MATHEUS DA SILVA RODRIGUES	\N	8	Ativo	0
2875	1999-12-21	MAYARA ALLANA DA ROCHA SILVA	103962114-70	8	Ativo	0
2888	2003-07-02	GEOVANNA DA SILVA DANTAS	078811284-88	8	Ativo	0
2889	2003-03-08	LAYZA RAISSA FERNANDES DE MEDEIROS	090201934-14	8	Ativo	0
2890	2003-03-08	LISNATALLY KLEBIA OLIVEIRA DA SILVA	\N	8	Ativo	0
2891	2015-02-06	WENDELL BRUNO DA LUZ PINHEIRO	\N	8	Ativo	0
2265	2015-02-09	FRANCISCO EDSON ALVES	11	8	Ativo	0
2893	2001-02-26	FERNANDO BRENO SILVA DE OLIVEIRA	707604044-10	8	Ativo	0
2894	2002-01-21	GEOVANE AUGUSTO GOMES DOS SANTOS	\N	8	Ativo	0
2895	2000-12-13	JOAO MAYCKON PATRICIO DA SILVA	\N	8	Ativo	0
2896	2001-08-19	JULIA FARIAS OTAVIANO	124313794-00	8	Ativo	0
1476	2009-09-06	KELVEN MACIEL NOBRE	\N	8	Ativo	0
2897	2000-12-23	LUIZ FELIPE DA SILVA RIBEIRO	\N	8	Ativo	0
2898	2001-09-04	LUIS FILIPE MORAIS DA SILVA SANTOS	122711834-13	8	Ativo	0
2899	2001-08-03	MARIA EDUARDA DOMINGOS GONCALVES	125478614-70	8	Ativo	0
2903	2001-11-05	MARIA FERNANDA DE SALES MONTEIRO COSTA	707292734-40	8	Ativo	0
2904	2015-02-09	RAPHAEL DIAS CAMARA	018038044-32	8	Ativo	0
2905	2001-03-09	WILMA ZILDA MELO DE LIMA	\N	8	Ativo	0
2906	2000-08-10	EUDLIGIA HALANA NICIAS DA SILVA	700831254-77	8	Ativo	0
2907	2000-05-01	LUCAS EMANOEL DA SILVA GOMES	016965274-22	8	Ativo	0
2908	2000-12-23	LUIZ PAULO DA SILVA RIBEIRO	\N	8	Ativo	0
2909	2000-04-24	MADSON VICTOR FELIX DA SILVA	703585544-03	8	Ativo	0
2910	1999-10-22	MANASSES FELIPE PEREIRA SILVA	707322154-20	8	Ativo	0
2911	2000-08-23	MATEUS DA SILVA MEDEIROS	124432104-48	8	Ativo	0
1172	1999-09-18	LUCAS TEIXEIRA DA SILVA	\N	8	Ativo	0
905	2004-07-12	ARIADNE RIBEIRO SILVA	\N	8	Ativo	0
2298	2001-07-30	WISLANE GYSELLE DE SOUSA PEREIRA	\N	9	Ativo	0
2877	2005-05-03	REBECA SILVA DE SOUSA	\N	9	Ativo	0
1175	1999-08-31	MICAL THABATA DE LIMA VASCONCELOS	\N	8	Ativo	0
9	1997-04-03	ESCOLA MUNICIPAL DE ENSINO FUNDAMENTAL CANTINHO DO SABER	03174807000139	0	Ativo	0
2915	2008-08-21	LUZIA SILVA DAS CHAGAS FERREIRA	707.286.634-57	7	Ativo	0
2916	2005-07-17	PEDRO ARTUR ABATH DA SILVA	700.513.354-41	7	Ativo	0
2917	2008-07-04	FRANCISCO RICARDO OLIVEIRA DA SILVA	707.334.374-51	7	Ativo	0
2918	2009-03-05	JOÃO VÍTOR ANDRADE DE SOUZA	701.336.334-03	7	Ativo	0
2921	2007-11-19	GABRIELLE YASMIM DE MELO BARELA	700.891.464-41	7	Ativo	0
2922	2008-07-06	KAYKE DA SILVA LIMA	130.982.814-80	7	Ativo	0
2912	2006-11-22	MARIA CLARA ALVES PEREIRA DE SOUZA	\N	9	Ativo	0
1578	2008-07-18	JEANDERSON LUCAS ANDRADE DA SILVA	\N	9	Ativo	0
2920	2011-04-04	LUANDERSON  HENRIQUE DE SOUZA DA SILVA	\N	9	Ativo	0
2923	2004-09-27	YASMIN SILVA DOS SANTOS	\N	9	Ativo	0
2924	2004-04-07	FRANCIKELE DE FRANÇA ABEL	\N	9	Ativo	0
2925	2010-04-10	MARIA  DE NAZARÉ NASCIMENTO DA CRUZ	\N	9	Ativo	0
2926	2010-05-14	ALANE GABRIELLY MUNIZ DO NASCIMENTO	\N	9	Ativo	0
1762	2004-06-18	VICTOR DE BRITO	\N	9	Ativo	0
1790	2002-11-13	ANDREIA BRUNA DA SILVA LIMA	\N	9	Ativo	0
1791	2003-02-08	CRISTINA TERCIA SA SILVA	\N	9	Ativo	0
1792	2005-05-12	EDINEIDE MIRELE CLEMENTE PEREIRA	\N	9	Ativo	0
1793	2003-05-11	ERIKA FIRMINO RIBEIRO DA SILVA	\N	9	Ativo	0
1794	2002-09-03	EVELYN CLEMENTE PEREIRA	\N	9	Ativo	0
1795	2004-02-08	FLAVIA SENA DE ARAUJO	\N	9	Ativo	0
1796	2003-10-10	JESSICA NUNES MARTINS	\N	9	Ativo	0
1797	2003-03-20	JOSE THIAGO DA SILVA CANDIDO	\N	9	Ativo	0
1798	2005-03-18	JOSE WELLINGTON CASTRO DE ARAUJO	\N	9	Ativo	0
1799	2005-04-11	JOSINALDO DA SILVA CLEMENTE JUNIOR	\N	9	Ativo	0
1800	2004-12-10	JOSUE RAMOS CORDEIRO DA SILVA	\N	9	Ativo	0
1801	2005-01-17	KESIA WILYANE DA SILVA COSTA	\N	9	Ativo	0
1802	2005-02-03	KLEITON NASCIMENTO DE SOUZA	\N	9	Ativo	0
1803	2004-03-30	LAYZE DOS SANTOS GOMES	\N	9	Ativo	0
1804	2005-01-16	LORENA RAQUEL DO NASCIMENTO LIMA	\N	9	Ativo	0
1805	2002-02-10	MARILIA BEATRIZ MEDEIROS DE OLIVEIRA	\N	9	Ativo	0
1806	2005-10-13	MATEUS GABRIEL DE LIMA CRUZ	\N	9	Ativo	0
2936	2015-04-16	SETIC SGA	00000000000	0	Ativo	0
2937	1972-12-04	THEMIS LACERDA DOS SANTOS	02545340405	9	Ativo	0
2938	1986-03-25	FERNANDA DA SILVA PEREIRA	05849553401	9	Ativo	0
2939	1986-03-25	FERNANDA DA SILVA PEREIRA	058.495.534-01	9	Ativo	0
2940	1983-02-20	IVANILDA DA SILVA	04668754447	9	Ativo	0
2941	2015-05-13	Franklin Dias	123.654.984-40	0	Ativo	0
1324	1998-12-27	ADALTON LEVY DANTAS DE ALMEIDA	01708706429	8	Ativo	0
1878	2007-10-09	ANA ALICE LIMA DE PAIVA	\N	7	Ativo	0
2944	2015-05-20	FRANCISCO ALVES	04525385741	8	Ativo	0
2945	2015-05-20	FRANCISCO PEREIRA	04525354785	8	Ativo	0
2946	2005-04-13	MARIA LUIZA COELHO DA SILVA	\N	7	Ativo	0
2947	2008-06-06	ELLYSA THAYNÁ COSTA DE LIMA	123.882.534-62	7	Ativo	0
2948	2009-03-04	RIAN KENNEDY SILVA DE LIMA	709.602.654-14	7	Ativo	0
2949	2007-10-26	GISLAYNE VITÓRIA PEREIRA DO NASCIMENTO	\N	7	Ativo	0
2095	1966-09-26	JOSUE ANTAO DO NASCIMENTO	52321991453	8	Ativo	0
2136	1960-06-02	MARCOS ANTONIO C CALAÇA	\N	8	Ativo	0
2950	2003-05-20	ALESSANDRO FERREIRA DE LIMA TEIXEIRA	129.412.584-26	8	Ativo	0
2963	\N	teste pai	\N	0	Ativo	0
2964	\N	teste de testa	\N	0	Ativo	0
2965	\N	tessta pai de tudo	\N	0	Ativo	0
2966	\N	teste de paiiiiis	\N	0	Ativo	0
2967	\N	teste de ttt	\N	0	Ativo	0
2968	\N	teste iiiooo	\N	0	Ativo	0
2969	\N	testes uuuu	\N	0	Ativo	0
2942	2004-05-11	ALANIS REGINA DOS SANTOS CAVALCANTI	\N	8	Ativo	0
2974	\N	tetim de pai	\N	0	Ativo	0
2978	\N	cadastrando pai agorinha	\N	0	Ativo	0
2980	\N	sdrrrrrrrrrrrrrrrrrrrrrrrrrrr	\N	0	Ativo	0
2982	\N	Rsrsrssrsrsrsrsrsrsrsrsr	\N	0	Ativo	0
2986	\N	555555555555555555555555555555555555555555555	\N	0	Ativo	0
2988	\N	cadastrando 3333333333	\N	0	Ativo	0
2990	\N	pai 1111111111111111	\N	0	Ativo	0
2992	\N	testando 77777777	\N	0	Ativo	0
2994	\N	staf2	\N	0	Ativo	0
2996	\N	staf4	\N	0	Ativo	0
2998	\N	Tttttttttttttt	\N	0	Ativo	0
3001	\N	CLbcvbcvb	\N	0	Ativo	0
3003	\N	agora vai	\N	0	Ativo	0
3006	\N	VBNVBN	\N	0	Ativo	0
3008	\N	mmmmm	\N	0	Ativo	0
3009	\N	agora vai dumdumdum	\N	0	Ativo	0
3011	\N	jhjhjhjhjh	\N	0	Ativo	0
3013	\N	bbbbbbbbb	\N	0	Ativo	0
3014	2015-06-15	b	\N	0	Ativo	0
3015	\N	vvvvvvvvvvv	\N	0	Ativo	0
3016	\N	ccccccc	\N	0	Ativo	0
2975	\N	testom pai	\N	0	Ativo	0
2976	\N	testando agoraaa	\N	0	Ativo	0
2977	\N	pai da silva souza	\N	0	Ativo	0
2979	\N	pai de todos	\N	0	Ativo	0
2981	\N	kkkkkkkkkkkkkkkkkkk	\N	0	Ativo	0
2983	\N	111111111111111111111111	\N	0	Ativo	0
2984	\N	pai de todo mundo aaa	\N	0	Ativo	0
2985	\N	vixe agora vai	\N	0	Ativo	0
2987	\N	22222222222	\N	0	Ativo	0
2989	\N	cadastrando 44444444444	\N	0	Ativo	0
2991	\N	pai 2222222222	\N	0	Ativo	0
2993	\N	staf	\N	0	Ativo	0
2995	\N	staf3	\N	0	Ativo	0
2997	\N	cvbcvbcvbcvbcv	\N	0	Ativo	0
2999	\N	bbbbbbbbb	\N	0	Ativo	0
3000	\N	21111111111111111	\N	0	Ativo	0
3002	\N	555555555555555	\N	0	Ativo	0
3004	\N	zzzzzzzzzz	\N	0	Ativo	0
3005	\N	2222	\N	0	Ativo	0
3007	\N	99999999999999999	\N	0	Ativo	0
3010	\N	uruuuuuuu	\N	0	Ativo	0
3012	\N	lllll	\N	0	Ativo	0
3017	\N	teste de testa	\N	0	Ativo	0
3020	\N	pai de filho	\N	0	Ativo	0
3022	\N	teste de testa3	\N	0	Ativo	0
3023	\N	teste de testa4	\N	0	Ativo	0
3024	\N	pai teste 1	\N	0	Ativo	0
3025	\N	teste yes	\N	0	Ativo	0
3026	\N	teste 007	\N	0	Ativo	0
3027	\N	4444444444444444444444444444444444	\N	0	Ativo	0
3028	\N	33333333333333333333333333333333333333333333	\N	0	Ativo	0
3029	\N	9999999999999999999999999999999999999999999999	\N	0	Ativo	0
3030	\N	555555555555555555555555555555555555555	\N	0	Ativo	0
3031	\N	777777777777777777777777777777777777777777	\N	0	Ativo	0
3032	\N	TESTE AQUI Y	\N	0	Ativo	0
3033	\N	000000000000000000000000000000000000	\N	0	Ativo	0
3034	\N	AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA	\N	0	Ativo	0
3035	\N	RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR	\N	0	Ativo	0
3036	\N	YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY	\N	0	Ativo	0
3037	\N	WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW	\N	0	Ativo	0
3038	\N	pppppppppppppppppppppppppppppppppppppppppppppppp	\N	0	Ativo	0
3039	\N	TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT	\N	0	Ativo	0
3040	\N	VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV	\N	0	Ativo	0
3041	\N	FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF	\N	0	Ativo	0
3042	\N	gggggggggggggggggggggggggggggggggggggggggggggggg	\N	0	Ativo	0
3043	\N	KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK	\N	0	Ativo	0
3044	\N	TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT	\N	0	Ativo	0
3045	\N	QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ	\N	0	Ativo	0
3046	\N	EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE	\N	0	Ativo	0
3047	\N	RSRSRSRSRSRSRSRSRSRSRSRSRS	\N	0	Ativo	0
3048	\N	RSRSRSRSRSRSRSRSRSRSRSRSRSRSRSRS	\N	0	Ativo	0
3049	\N	BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB	\N	0	Ativo	0
3050	\N	RSRSRSRSRSRSRSRSRSRSRSRSRSRSRSRS	\N	0	Ativo	0
3051	\N	KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK	\N	0	Ativo	0
3052	\N	ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ	\N	0	Ativo	0
3053	\N	ggggggggggggggggggggggggg	\N	0	Ativo	0
3054	\N	PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP	\N	0	Ativo	0
3055	\N	XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX	\N	0	Ativo	0
3056	\N	QQQQQQQQQQQQQQQQQQQQQQQQQQQ	\N	0	Ativo	0
3057	\N	uUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU	\N	0	Ativo	0
3058	\N	ddddddddddddddddddddddddddddddddddd	\N	0	Ativo	0
3059	\N	MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM	\N	0	Ativo	0
3060	\N	ÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇÇ	\N	0	Ativo	0
3061	\N	UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU	\N	0	Ativo	0
3062	\N	YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY	\N	0	Ativo	0
3063	\N	HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH	\N	0	Ativo	0
3064	\N	TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT	\N	0	Ativo	0
3065	\N	IEBER MOURA	\N	0	Ativo	0
3066	\N	rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr	\N	0	Ativo	0
3067	\N	aaaaaaaaaaaaaaaaaaaaaaa	\N	0	Ativo	0
3068	\N	wwwwwwwwwwwwwwwww	\N	0	Ativo	0
3069	\N	eeeeeeeeeeeeeeeee	\N	0	Ativo	0
3070	\N	VvvvVVVvvvVVVVvvvVVV	\N	0	Ativo	0
3071	\N	agora vai mesmo vum	\N	0	Ativo	0
3072	\N	nnnnnnnnnnnnnnnnnnnnnn	\N	0	Ativo	0
3073	\N	namaio	\N	0	Ativo	0
3074	\N	wewewerwer	\N	0	Ativo	0
3075	\N	junior cabeção	\N	0	Ativo	0
3076	\N	junior cabeção	\N	0	Ativo	0
3077	\N	thiago é foda	\N	0	Ativo	0
3078	\N	thiago é foda	\N	0	Ativo	0
3079	\N	junior otaro	\N	0	Ativo	0
3080	\N	asdfasdfasdf	\N	0	Ativo	0
3081	\N	qwerty	\N	0	Ativo	0
3082	\N	qwerty1	\N	0	Ativo	0
3083	\N	qwerty1	\N	0	Ativo	0
3084	\N	iebinho	\N	0	Ativo	0
3085	\N	iebinho	\N	0	Ativo	0
3086	\N	teste 789	\N	0	Ativo	0
3087	\N	sdfdddd uuuuu	\N	0	Ativo	0
3088	\N	sdfdddd uuuuu uuuuuoo	\N	0	Ativo	0
3089	2015-06-17	11111	111111	8	Ativo	0
3090	\N	testando99999	\N	0	Ativo	0
3091	2015-06-17	222	2222	8	Ativo	0
3092	\N	trererererre yyy	\N	0	Ativo	0
3093	2015-06-17	aaa	111	8	Ativo	0
3094	\N	asdfasdfasdfasdfasdf	\N	0	Ativo	0
3095	\N	tatatatatatatataatatatatatattatata	\N	0	Ativo	0
3096	\N	iber Mourinha	\N	0	Ativo	0
3097	\N	novinho	\N	0	Ativo	0
3098	\N	gatoso	\N	0	Ativo	0
3099	\N	cadastre!	\N	0	Ativo	0
3100	\N	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	\N	0	Ativo	0
3101	\N	Aaaaaaaaatttttttttttttttttttttttt	\N	0	Ativo	0
3102	\N	aerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr	\N	0	Ativo	0
3103	\N	yyyyyyyyyyyyyyyyyyyyy	\N	0	Ativo	0
3104	2015-06-17	aaaa	222	8	Ativo	0
3105	2015-06-17	aaaa	444	8	Ativo	0
3106	\N	ljslklkajklgalklaljaslkgjlç	\N	0	Ativo	0
3107	\N	ççççççççççççççççççççççççççç	\N	0	Ativo	0
3108	\N	papapapapapapa	\N	0	Ativo	0
3109	\N	treste	\N	0	Ativo	0
3110	\N	testinho	\N	0	Ativo	0
3111	\N	teste ae	\N	0	Ativo	0
3112	\N	TESTE AQUI	\N	0	Ativo	0
3113	2015-06-18	aaaaaaa	787878	8	Ativo	0
3114	2015-06-18	dfdgfgfgf	4343434343	8	Ativo	0
3115	2015-06-18	dsds	45454545	8	Ativo	0
3118	2015-06-19	testito	1111118	0	Ativo	0
3119	2015-06-22	www	2231	0	Ativo	0
3120	2015-06-22	tessss	11144	0	Ativo	0
3121	2015-06-22	Rdeee	11100	0	Ativo	0
3122	2015-06-22	yuyuyu	88870	0	Ativo	0
3123	2015-06-22	yuyuyu	888701	0	Ativo	0
3124	2015-06-22	yuyuyu	88870121	0	Ativo	0
3125	2015-06-22	po	255558	0	Ativo	0
3126	2015-06-22	po	2555581	0	Ativo	0
3127	2015-06-22	teseee	128875	0	Ativo	0
3128	2015-06-22	teste	1111110	0	Ativo	0
3129	2015-06-22	teste	7777784	0	Ativo	0
3130	2015-06-22	asdfeee	1232221	0	Ativo	0
3131	2015-06-22	dgfdfdew3	88875	0	Ativo	0
3132	2015-06-22	wer333	111111114	0	Ativo	0
3133	2015-06-23	teste de aluno	1111155	0	Ativo	0
3134	2015-06-23	teste 01	0255556	0	Ativo	0
3135	2015-06-23	teste 02	058999	0	Ativo	0
3136	2015-06-23	teste 03	1258885	0	Ativo	0
3137	2015-06-23	teste 04	045333	0	Ativo	0
3138	2015-06-23	teste 06	05888822	0	Ativo	0
3139	2015-06-24	teste eee	0452223	8	Ativo	0
3140	2015-06-24	teste 07	052337	8	Ativo	0
3141	2015-06-24	teste 08	0523371	8	Ativo	0
3142	2015-06-24	teste 09	05233712	8	Ativo	0
3143	2015-06-24	teste 10	052337121	8	Ativo	0
3144	2015-06-24	teste 13	0523371212	8	Ativo	0
3145	2015-06-24	teste 14	05233712122	8	Ativo	0
3146	2015-06-24	teste 15	052337121222	8	Ativo	0
3147	2015-06-24	teste 18	0458856933	8	Ativo	0
3148	2015-06-24	teste 19	04588569332	8	Ativo	0
3149	2015-06-24	teste 26	0452532258	8	Ativo	0
3150	2015-06-24	teste 27	04525322582	8	Ativo	0
3151	2015-06-24	teste 28	0452532252	8	Ativo	0
3152	2015-06-24	teste 31	078955	8	Ativo	0
3153	2015-06-24	teste 31	85558	8	Ativo	0
3154	2015-06-24	teste 35	045255889	8	Ativo	0
3155	2015-06-24	teste 36	0452558892	8	Ativo	0
3156	2015-06-24	teste 37	04525588921	8	Ativo	0
3157	2015-06-24	teste 38	0522366	8	Ativo	0
3158	2015-06-24	teste 40	05223668850	8	Ativo	0
3159	2015-06-24	teste 41	05223668851	8	Ativo	0
3160	2015-06-24	teste 42	05223668852	8	Ativo	0
3161	2015-06-24	teste 44	05223668853	8	Ativo	0
3162	2015-06-24	teste 403	04522520	8	Ativo	0
3163	2015-06-24	teste 45	04522533	8	Ativo	0
3164	2015-06-24	teste 46	04522534	8	Ativo	0
3165	2015-06-24	teste 47	04522535	8	Ativo	0
3166	2015-06-24	teste 48	04522536	8	Ativo	0
3167	2015-06-24	teste 49	0552320	8	Ativo	0
3169	2015-06-24	blablabla de souza melo	123415252362	8	Ativo	0
3170	2015-06-24	glugluglgugluglguglugl	7777848484	8	Ativo	0
3171	2015-06-24	TecoeTico	88889797945	8	Ativo	0
3172	2015-06-24	tiquinho do amor	454554643131	8	Ativo	0
3173	2015-06-24	Administracao	7788554563	8	Ativo	0
3174	2015-06-24	yyyyyyyyyyyyykk nnnnnssssss	123456789451	8	Ativo	0
3175	2015-06-25	teste 46	0223988	8	Ativo	0
3176	2015-06-25	teste 49	0223989	8	Ativo	0
3177	2015-06-25	teste 50	056690	8	Ativo	0
3179	\N	teste pai	\N	0	Ativo	0
3180	\N	teste mae	\N	0	Ativo	0
3181	2015-06-25	teste 52	058991	8	Ativo	0
3182	\N	teste 12 ddt	\N	0	Ativo	0
3183	\N	teste 12 ddt	\N	0	Ativo	0
3184	\N	teste 12 dd5	\N	0	Ativo	0
3185	\N	ttt r	\N	0	Ativo	0
3186	\N	sldkjsdflksjdflk sdsdfsdf	\N	0	Ativo	0
3187	\N	gjjkghkgh	\N	0	Ativo	0
3188	\N	test uuu	\N	0	Ativo	0
3189	\N	teste 88	\N	0	Ativo	0
3190	\N	teste 88	\N	0	Ativo	0
3191	\N	teste 88	\N	0	Ativo	0
3192	\N	teste 88	\N	0	Ativo	0
3193	\N	teste 88	\N	0	Ativo	0
3194	\N	teste 88	\N	0	Ativo	0
3195	\N	teste 88	\N	0	Ativo	0
3196	\N	teste aqyui	\N	0	Ativo	0
3197	\N	teste 889	\N	0	Ativo	0
3198	\N	teste fff	\N	0	Ativo	0
3199	\N	teste ddd	\N	0	Ativo	0
3200	\N	teste ddd t	\N	0	Ativo	0
3201	\N	teste zz	\N	0	Ativo	0
3202	\N	teste 555	\N	0	Ativo	0
3203	\N	teste 001	\N	0	Ativo	0
3204	\N	teste 4545	\N	0	Ativo	0
3205	\N	teste errrrr	\N	0	Ativo	0
3206	\N	teste456	\N	0	Ativo	0
3207	\N	teste 111	\N	0	Ativo	0
3208	\N	teste 444	\N	0	Ativo	0
3209	\N	teste rrrr22	\N	0	Ativo	0
3210	\N	teste rrr3335	\N	0	Ativo	0
3211	\N	teste 5454	\N	0	Ativo	0
3212	\N	tester t	\N	0	Ativo	0
3213	\N	teste 34	\N	0	Ativo	0
3214	\N	teste 556	\N	0	Ativo	0
3215	\N	teste 5558	\N	0	Ativo	0
3216	\N	terminou tudo	\N	0	Ativo	0
3217	\N	Ana Maria	\N	0	Ativo	0
3218	\N	Ana Maria	\N	0	Ativo	0
3219	2015-07-02	teste	1112224455	0	Ativo	0
3220	2015-07-02	teste 78	549	8	Ativo	0
3221	2015-07-02	CHICO SANTOSS	0523369	8	Ativo	0
3222	2015-07-02	CHICO SANTOSS	05233698	8	Ativo	0
3223	2015-07-03	TÉST	11111111	8	Ativo	0
3224	2015-07-07	TESTE 001	0225	8	Ativo	0
3225	2015-07-07	TESTE 002	0225888888888	8	Ativo	0
3226	2015-07-07	TESTE 003	02258888888889	8	Ativo	0
3227	2015-07-07	TESTE 004	022588888888890	8	Ativo	0
3228	2015-07-07	TESTE 005	022588888888891	8	Ativo	0
3229	\N	teste 005	\N	0	Ativo	0
3230	2015-07-07	TESTE 006	022588888888892	8	Ativo	0
3231	\N	teste 01 pai	\N	0	Ativo	0
3237	\N	teste 01 pai 	020233	0	Ativo	0
3238	\N	teste 02 mae	022259	0	Ativo	0
3239	\N	teste pai 03 e	234454	0	Ativo	0
3241	\N	teste 001 aqui	025263551	0	Ativo	0
3242	\N	teste 002 mae aqui	02288111	0	Ativo	0
3244	2015-07-10	TESTE 00002	025507	8	Ativo	0
3245	2015-07-10	TESTE 00002	025508	8	Ativo	0
3246	2015-07-10	TESTE 00002	0255091	8	Ativo	0
3247	2015-07-10	TESTE 00003	0255092	8	Ativo	0
3248	2015-07-10	TESTE 00004	0255093	8	Ativo	0
3249	\N	THIAGO PEREIRA DE SOUZA	\N	0	Ativo	0
3250	\N	THIAGO PEREIRA DE SOUZA	\N	0	Ativo	0
3251	\N	THIAGO PEREIRA DE SOUZA	\N	0	Ativo	0
3252	\N	THIAGO PEREIRA DE SOUZA	\N	0	Ativo	0
3253	\N	THIAGO PEREIRA DE SOUZA	\N	0	Ativo	0
1110	2000-12-17	ABEDENEGO OLIVEIRA DA SILVA SANTOS	0225232	8	Ativo	0
3254	2015-07-13	TESTE 0001	00000252	8	Ativo	0
3256	\N	teste de pai 01	334	0	Ativo	0
3255	2015-07-13	TESTE 0000103	02200015	8	Ativo	0
1456	1999-06-03	ADSON ADRIAN FELIX DO NASCIMENTO	0452221	8	Ativo	0
3260	2015-07-14	RRRRRRR	3333333	8	Ativo	0
3261	2015-07-14	ABCD	333	8	Ativo	0
3262	2015-07-14	YYYYYYYYYYYYYY	545454	8	Ativo	0
3263	2015-07-14	TTTTTTTT	5454	8	Ativo	0
3264	2015-07-14	YUUUU	545	8	Ativo	0
3298	2015-07-17	TESTE 17 10	\N	8	Ativo	0
2128	2014-10-15	ALCINA DINIZ DE SOUZAE	25588958000	8	Ativo	0
3265	\N	fhfhhh	58888	0	Ativo	0
3266	\N	fhfhfhfg	56853558	0	Ativo	0
3267	2015-07-15	DANIEL TESTE	56353	8	Ativo	0
3268	2015-07-15	THIAGO PEREIRA DE SOUZA	7894561	8	Ativo	0
2305	2015-07-15	ANA CATARINA DUARTE DA SILVA	07984011419	0	Ativo	0
3269	2015-07-15	THIAGO PEREIRA DDE SOUZA	12334445	0	Ativo	0
3270	2015-07-15	TESTE 00011	88250001	0	Ativo	0
3271	2015-07-15	THIAGO PEREIRA DE SOUZA	123233444	8	Ativo	0
3272	2015-07-15	TESTE 00011	01111000	8	Ativo	0
3273	2015-07-15	TESTE 00022	0020009	8	Ativo	0
3274	2015-07-15	TESTE 000033	0333001	8	Ativo	0
3275	2015-07-15	TESTE 000033	0333002	8	Ativo	0
3276	\N	tyjgjg	2555	0	Ativo	0
3277	\N	ghghgfg	25454	0	Ativo	0
3278	2015-07-16	DANIL TESDTFD	58	8	Ativo	0
3279	\N	hjgfjg	756855565565	0	Ativo	0
3280	\N	srgrh	586586868687	0	Ativo	0
3281	2015-07-16	DANIL TESDTFD	5658955886	8	Ativo	0
3282	\N	TESTE PAI 16	125521	0	Ativo	0
3283	\N	TESTE 16 01	223220	0	Ativo	0
3284	\N	SDFSDFSDF	333333	0	Ativo	0
3285	\N	teste 16 01	344333	0	Ativo	0
3286	\N	wereee	3333344	0	Ativo	0
3287	2015-07-16	TESTE 16 01 TESTE	045322552000	8	Ativo	0
3288	2015-07-17	TESTE 17 01	\N	8	Ativo	0
3289	2015-07-17	TESTE 17 04	\N	8	Ativo	0
3290	2015-07-17	TESTE 17 05	\N	8	Ativo	0
3291	\N	TESTE MAE 17 06	0222525	0	Ativo	0
3292	2015-07-17	TESTE 17 06	\N	8	Ativo	0
3293	\N	TESTE 02 2200	0202001	0	Ativo	0
3294	2015-07-17	TESTE 17 08	\N	8	Ativo	0
3295	\N	TESTE 17 09	234777	0	Ativo	0
3296	2015-07-17	TESTE 17 08	\N	8	Ativo	0
3297	\N	TESTE 17 10 MAE	344455500	0	Ativo	0
3299	\N	teste mae 17 11	345444	0	Ativo	0
3300	2015-07-17	TESTE 17 11	\N	8	Ativo	0
3301	\N	teste mae 12	234234666	0	Ativo	0
3302	\N	WERWERWERWERWERWER	4444440	0	Ativo	0
3303	\N	W EWRWERWERE EEE	44444401	0	Ativo	0
3304	\N	teste aqui mae	323423423400	0	Ativo	0
3305	\N	trtrtrtrtr	33333330	0	Ativo	0
3306	\N	TESTE 16	234	0	Ativo	0
3307	\N	TESTE AAAAAA	22233	0	Ativo	0
3308	\N	Teste 0	3546	0	Ativo	0
3309	\N	Teste de Mãe	65456	0	Ativo	0
3310	\N	Teste de Cadastro de Mãe	12345	0	Ativo	0
3311	\N	Nome da Mae	123456	0	Ativo	0
3312	\N	Cadastro da Mar	456	0	Ativo	0
3313	\N	teste aqui	12344	0	Ativo	0
3314	2015-07-17	TESTE 22525 89	\N	8	Ativo	0
3315	\N	testessssss	3234	0	Ativo	0
3316	2015-07-17	AQUI	\N	8	Ativo	0
3317	\N	tyeste 	23423434410	0	Ativo	0
3318	\N	tresd ddddd	344456	0	Ativo	0
3319	2015-07-17	TES TE	\N	8	Ativo	0
3320	\N	teste 19 mae	000288	0	Ativo	0
3321	2015-07-17	TESTE 19	\N	8	Ativo	0
3322	\N	teste 22 mae	333550	0	Ativo	0
3323	2015-07-17	TESTE 17 22	\N	8	Ativo	0
3324	\N	teste mae 23	23423499	0	Ativo	0
3325	2015-07-17	TESTE 23	\N	8	Ativo	0
3326	\N	teste mae 04	2343333	0	Ativo	0
3327	2015-07-17	TESTES 24	\N	8	Ativo	0
3328	\N	teste 25 mae	23433333	0	Ativo	0
3329	2015-07-17	TESTE 25	\N	8	Ativo	0
3330	\N	teste 25 mae	234333335	0	Ativo	0
3331	2015-07-17	TESTE 26	\N	8	Ativo	0
800	2006-12-17	LETICIA GABRIELY DOS SANTOS SILVA	\N	8	Ativo	0
3332	2015-07-21	TESTEVICENTE	545655	8	Ativo	0
3333	2015-07-22	TESTEDANIEL11	55	8	Ativo	0
3334	\N	uikuhyh	757575	0	Ativo	0
3335	\N	opopuoip	474	0	Ativo	0
3336	2015-07-22	DANIELTESTRE	4756564	8	Ativo	0
3337	\N	htthytht		0	Ativo	0
3340	\N	hththth	53535	0	Ativo	0
3342	\N	hffgfhfhf	998956589566	0	Ativo	0
3344	\N	fgfjgjffh	46555656565	0	Ativo	0
3345	2015-07-22	DANIETESTE	096538554-09	8	Ativo	0
3346	2015-07-22	THIAGO PEREIRA AGORA TESTE	1134646788	8	Ativo	0
3347	2015-07-23	ALUNO TESTE 01	0101225	8	Ativo	0
3349	\N	testev m	020202	0	Ativo	0
3350	\N	teste mm	02202333	0	Ativo	0
3351	2015-07-23	TESTE ALUNO 03	02202022300	8	Ativo	0
3352	2015-07-23	TESTE ALUNO 03	02202022301	8	Ativo	0
3353	2015-07-23	TESTE ALUNO 03	02202022302	8	Ativo	0
3354	2015-07-23	TESTE ALUNO 04	00200011	8	Ativo	0
3355	2015-07-23	TESTEPROFESSOR	2323	8	Ativo	0
3356	2015-07-23	PROFESSOR TESTE	045222100	8	Ativo	0
3357	2015-07-23	TESTEPROFESSOR	22222222	8	Ativo	0
3358	2015-07-23	ROBERTO MANAIA DOS SANTOS JUNIOR	0123458454	0	Ativo	0
3359	2015-07-23	ROBERTO MANAIA DOS SANTOS JUNIOR	126545885	8	Ativo	0
\.


--
-- TOC entry 4130 (class 0 OID 25331)
-- Dependencies: 366
-- Data for Name: pessoa_fisica; Type: TABLE DATA; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

COPY pessoa_fisica (id, cor, foto, grau_de_instrucao, necessidades_especiais, rc_data_do_registro, rc_folha_do_livro, rc_nome_do_cartorio, rc_nome_do_livro, rc_numero, religiao, sexo, tipo_sanguineo) FROM stdin;
2298	\N	\N		\N	\N				45988	\N	FEMININO	\N
2245	\N	\N		\N	\N					\N	MASCULINO	\N
2246	\N	\N		\N	\N					\N	FEMININO	\N
2247	\N	\N		\N	\N					\N	FEMININO	\N
2248	\N	\N		\N	\N					\N	FEMININO	\N
2249	\N	\N		\N	\N					\N	MASCULINO	\N
2250	\N	\N		\N	\N					\N	FEMININO	\N
2251	\N	\N		\N	\N					\N	FEMININO	\N
2252	\N	\N		\N	\N					\N	MASCULINO	\N
2253	\N	\N		\N	\N					\N	FEMININO	\N
2254	\N	\N		\N	\N					\N	FEMININO	\N
2255	\N	\N		\N	\N					\N	FEMININO	\N
2256	\N	\N		\N	\N					\N	MASCULINO	\N
2257	\N	\N		\N	\N					\N	FEMININO	\N
2258	\N	\N		\N	\N					\N	FEMININO	\N
2259	\N	\N		\N	\N					\N	FEMININO	\N
2260	\N	\N		\N	\N					\N	FEMININO	\N
2261	\N	\N		\N	\N					\N	FEMININO	\N
2262	\N	\N		\N	\N					\N	FEMININO	\N
2263	\N	\N		\N	\N					\N	FEMININO	\N
2264	\N	\N		\N	\N					\N	FEMININO	\N
2265	\N	\N		\N	\N					\N	MASCULINO	\N
2266	\N	\N		\N	\N					\N	MASCULINO	\N
2267	\N	\N		\N	\N					\N	MASCULINO	\N
2268	\N	\N		\N	\N					\N	MASCULINO	\N
2269	\N	\N		\N	\N					\N	FEMININO	\N
2270	\N	\N		\N	\N					\N	FEMININO	\N
2271	\N	\N		\N	\N					\N	MASCULINO	\N
2272	\N	\N		\N	\N					\N	MASCULINO	\N
2273	\N	\N		\N	\N					\N	FEMININO	\N
2274	\N	\N		\N	\N					\N	FEMININO	\N
2275	\N	\N		\N	\N					\N	FEMININO	\N
2276	\N	\N		\N	\N					\N	FEMININO	\N
2277	\N	\N		\N	\N					\N	FEMININO	\N
2278	\N	\N		\N	\N					\N	FEMININO	\N
2279	\N	\N		\N	\N					\N	FEMININO	\N
2299	\N	\N		\N	\N				45988	\N	FEMININO	\N
2280	\N	\N	SUPERIOR COMPLETO	\N	\N					\N	MASCULINO	\N
2281	\N	\N	SUPERIOR INCOMPLETO	\N	\N					\N	FEMININO	\N
2282	\N	\N	SUPERIOR COMPLETO	\N	\N					\N	FEMININO	\N
2283	\N	\N	SUPERIOR COMPLETO	\N	\N					\N	FEMININO	\N
2284	\N	\N	ENSINO MEDIO INCOMPLETO	\N	\N					\N	FEMININO	\N
2285	\N	\N	FUNDAMENTAL	\N	\N					\N	FEMININO	\N
2286	\N	\N	1 GRAU INCOMPLETO	\N	\N					\N	FEMININO	\N
2330	\N	\N	FUNDAMENTAL INCOMPLETO	\N	\N					\N	MASCULINO	\N
2054	\N	\N	SUPERIOR COMPLETO	\N	\N					\N	FEMININO	\N
2055	\N	\N	POS-GRADUACAO	\N	\N					\N	FEMININO	\N
2056	\N	\N	SUPERIOR COMPLETO	\N	\N					\N	FEMININO	\N
2058	\N	\N	SUPERIOR COMPLETO	\N	\N					\N	FEMININO	\N
2059	\N	\N	SUPERIOR COMPLETO	\N	\N					\N	MASCULINO	\N
2060	\N	\N	SUPERIOR COMPLETO	\N	\N					\N	FEMININO	\N
2061	\N	\N	SUPERIOR COMPLETO	\N	\N					\N	FEMININO	\N
2062	\N	\N	SUPERIOR COMPLETO	\N	\N					\N	FEMININO	\N
2289	\N	\N	SUPERIOR COMPLETO	\N	\N					\N	FEMININO	\N
2290	\N	\N	SUPERIOR COMPLETO	\N	\N					\N	FEMININO	\N
2291	\N	\N	SUPERIOR COMPLETO	\N	\N					\N	FEMININO	\N
2292	\N	\N	SUPERIOR COMPLETO	\N	\N					\N	FEMININO	\N
2293	\N	\N	SUPERIOR COMPLETO	\N	\N					\N	FEMININO	\N
2294	\N	\N	SUPERIOR COMPLETO	\N	\N					\N	FEMININO	\N
2304	\N	\N		\N	\N					\N	MASCULINO	\N
2305	\N	\N	SUPERIOR COMPLETO	\N	\N					\N	FEMININO	\N
2306	\N	\N	SUPERIOR COMPLETO	\N	\N					\N	MASCULINO	\N
2307	\N	\N		\N	\N					\N	MASCULINO	\N
2308	\N	\N	SUPERIOR COMPLETO	\N	\N					\N	FEMININO	\N
2309	\N	\N	SUPERIOR COMPLETO	\N	\N					\N	FEMININO	\N
2331	\N	\N	SUPERIOR COMPLETO	\N	\N					\N	FEMININO	\N
2295	\N	\N		\N	\N					\N	MASCULINO	\N
2296	\N	\N	SUPERIOR COMPLETO	\N	\N					\N	FEMININO	\N
2297	\N	\N	SUPERIOR COMPLETO	\N	\N					\N	FEMININO	\N
2332	\N	\N	SUPERIOR COMPLETO	\N	\N					\N	FEMININO	\N
9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	M	\N
11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	M	\N
14	\N	\N	\N	\N	\N	exemplo	exemplo	exemplo	exemplo	\N	M	\N
42	\N	\N	\N	\N	\N	exemplo	exemplo	exemplo	vxcv	\N	Masculino	\N
2316	\N	\N	ESTAGIARIO	\N	\N					\N	MASCULINO	\N
2317	\N	\N	ESTAGIARIO	\N	\N					\N	MASCULINO	\N
2318	\N	\N	ESTAGIARIO	\N	\N					\N	MASCULINO	\N
2319	\N	\N	SUPERIOR COMPLETO	\N	\N					\N	FEMININO	\N
2320	\N	\N	SUPERIOR COMPLETO	\N	\N					\N	MASCULINO	\N
4	\N	\N	\N	\N	\N	GGG	GGG	GGG	12345	\N	F	\N
7	\N	\N	\N	\N	\N	11	car	111	111	\N	M	\N
2085	\N	\N		\N	\N					\N	MASCULINO	\N
2086	\N	\N		\N	\N					\N	FEMININO	\N
2087	\N	\N		\N	\N					\N	FEMININO	\N
2088	\N	\N		\N	\N					\N	FEMININO	\N
2089	\N	\N		\N	\N					\N	FEMININO	\N
2090	\N	\N		\N	\N					\N	FEMININO	\N
2091	\N	\N		\N	\N					\N	MASCULINO	\N
2092	\N	\N		\N	\N					\N	FEMININO	\N
2093	\N	\N		\N	\N					\N	MASCULINO	\N
2094	\N	\N		\N	\N					\N	MASCULINO	\N
2095	\N	\N		\N	\N					\N	MASCULINO	\N
2096	\N	\N		\N	\N					\N	FEMININO	\N
2097	\N	\N		\N	\N					\N	MASCULINO	\N
2098	\N	\N		\N	\N					\N	FEMININO	\N
2099	\N	\N		\N	\N					\N	FEMININO	\N
2100	\N	\N		\N	\N					\N	FEMININO	\N
2101	\N	\N		\N	\N					\N	MASCULINO	\N
2102	\N	\N		\N	\N					\N	MASCULINO	\N
2103	\N	\N		\N	\N					\N	MASCULINO	\N
2104	\N	\N		\N	\N					\N	MASCULINO	\N
2105	\N	\N		\N	\N					\N	FEMININO	\N
2106	\N	\N		\N	\N					\N	FEMININO	\N
2107	\N	\N		\N	\N					\N	FEMININO	\N
2108	\N	\N		\N	\N					\N	MASCULINO	\N
2109	\N	\N		\N	\N					\N	FEMININO	\N
2110	\N	\N		\N	\N					\N	FEMININO	\N
2111	\N	\N		\N	\N					\N	FEMININO	\N
2112	\N	\N		\N	\N					\N	FEMININO	\N
2113	\N	\N		\N	\N					\N	FEMININO	\N
2114	\N	\N		\N	\N					\N	FEMININO	\N
2115	\N	\N		\N	\N					\N	FEMININO	\N
2116	\N	\N		\N	\N					\N	FEMININO	\N
2117	\N	\N		\N	\N					\N	MASCULINO	\N
2118	\N	\N		\N	\N					\N	FEMININO	\N
2119	\N	\N		\N	\N					\N	FEMININO	\N
2120	\N	\N		\N	\N					\N	MASCULINO	\N
2121	\N	\N		\N	\N					\N	MASCULINO	\N
2052	\N	\N	SUPERIOR COMPLETO	\N	\N				12366	\N	FEMININO	\N
2122	\N	\N		\N	\N					\N	FEMININO	\N
2123	\N	\N		\N	\N					\N	FEMININO	\N
2124	\N	\N		\N	\N					\N	FEMININO	\N
2125	\N	\N		\N	\N					\N	MASCULINO	\N
2126	\N	\N		\N	\N					\N	MASCULINO	\N
2128	\N	\N		\N	\N					\N	FEMININO	\N
2129	\N	\N		\N	\N					\N	MASCULINO	\N
2130	\N	\N		\N	\N					\N	FEMININO	\N
2131	\N	\N		\N	\N					\N	MASCULINO	\N
2132	\N	\N		\N	\N					\N	MASCULINO	\N
2133	\N	\N		\N	\N					\N	MASCULINO	\N
2134	\N	\N		\N	\N					\N	MASCULINO	\N
2135	\N	\N		\N	\N					\N	MASCULINO	\N
2136	\N	\N		\N	\N					\N	MASCULINO	\N
2137	\N	\N		\N	\N					\N	FEMININO	\N
2138	\N	\N		\N	\N					\N	FEMININO	\N
2139	\N	\N		\N	\N					\N	FEMININO	\N
2140	\N	\N		\N	\N					\N	FEMININO	\N
2141	\N	\N		\N	\N					\N	FEMININO	\N
2142	\N	\N		\N	\N					\N	FEMININO	\N
761	\N	\N		\N	\N	109	2 OFICIO DE NOTAS	100	55299	\N	MASCULINO	\N
762	\N	\N		\N	\N	214	5 OFICIO DE NOTAS	A-528	287975	\N	FEMININO	\N
763	\N	\N		\N	\N	122V	2 OFICIO DE NOTAS	58	35158	\N	FEMININO	\N
764	\N	\N		\N	\N	192	2 OFICIO DE NOTAS	A-102	55782	\N	MASCULINO	\N
765	\N	\N		\N	\N	136	UNICO DE IGAPO	103	74014	\N	MASCULINO	\N
766	\N	\N		\N	\N	150	5 OFICIO DE NOTAS	A-525	287013	\N	MASCULINO	\N
767	\N	\N		\N	\N	85	2 OFICIO DE NOTAS	92	53675	\N	FEMININO	\N
768	\N	\N		\N	\N	179	2 OFICIO DE NOTAS	421	135923	\N	MASCULINO	\N
769	\N	\N		\N	\N	246	UNICO DE IGAPO	A-87	64693	\N	MASCULINO	\N
770	\N	\N		\N	\N	107	2 OFICIO DE NOTAS	A-106	56497	\N	MASCULINO	\N
771	\N	\N		\N	\N	65	UNICO DE IGAPO	89	65532	\N	MASCULINO	\N
772	\N	\N		\N	\N	95	2 OFICIO DE NOTAS	101	55485	\N	MASCULINO	\N
773	\N	\N		\N	\N	93	2 OFICIO DE NOTAS	A-105	56283	\N	FEMININO	\N
774	\N	\N		\N	\N	249	COMARCA DE AFONSO BEZERRA	A-05	3085	\N	FEMININO	\N
775	\N	\N		\N	\N	152	2 OFICIO DE NOTAS	A-107	56742	\N	MASCULINO	\N
776	\N	\N		\N	\N	191	UNICO DE IGAPO	88	65185	\N	FEMININO	\N
777	\N	\N		\N	\N	171V	2 OFICIO DE NOTAS	A-13	5287	\N	FEMININO	\N
778	\N	\N		\N	\N	173	2 OFICIO DE NOTAS	A-102	55763	\N	FEMININO	\N
779	\N	\N		\N	\N	139	UNICO DE IGAPO	A-91	66764	\N	FEMININO	\N
780	\N	\N		\N	\N	114	5 OFICIO DE NOTAS	A-536	290277	\N	MASCULINO	\N
781	\N	\N		\N	\N	95	4 OFICIO DE NOTAS	A-420	135539	\N	FEMININO	\N
782	\N	\N		\N	\N	287	4 OFICIO DE NOTAS	A-424	136931	\N	MASCULINO	\N
783	\N	\N		\N	\N	31	2 OFICIO DE NOTAS	101	55421	\N	MASCULINO	\N
784	\N	\N		\N	\N	23	2 OFICIO DE NOTAS	102	55613	\N	MASCULINO	\N
785	\N	\N		\N	\N	188	UNICO DE IGAPO	A-91	66845	\N	MASCULINO	\N
786	\N	\N		\N	\N	89	2 OFICIO DE NOTAS	A-106	56479	\N	FEMININO	\N
787	\N	\N		\N	\N	193	5 OFICIO DE NOTAS	A-550	294556	\N	MASCULINO	\N
788	\N	\N		\N	\N	189	2 OFICIO DE NOTAS	93	53979	\N	FEMININO	\N
789	\N	\N		\N	\N	68	2 OFICIO DE NOTAS	97	54659	\N	FEMININO	\N
790	\N	\N		\N	\N	259	UNICO DE IGAPO	86	64117	\N	FEMININO	\N
791	\N	\N		\N	\N	69	2 OFICIO DE NOTAS	97	54659	\N	FEMININO	\N
792	\N	\N		\N	\N	178	2 OFICIO DE NOTAS	A-170	57518	\N	MASCULINO	\N
793	\N	\N		\N	\N	175	2OFICIO DE NOTAS	92	53765	\N	FEMININO	\N
794	\N	\N		\N	\N	139	OFICIAL PRIVATIVO DE REGISTRO CIVIL	A-32	13565	\N	FEMININO	\N
795	\N	\N		\N	\N	196	2 OFICIO DE NOTAS	92	53786	\N	MASCULINO	\N
796	\N	\N		\N	\N	157	2 OFICIO DE NOTAS	94	54147	\N	FEMININO	\N
797	\N	\N		\N	\N	76	UNICO DE IGAPO	82	61408	\N	FEMININO	\N
798	\N	\N		\N	\N	94	UNICO DE IGAPO	80	60242	\N	FEMININO	\N
799	\N	\N		\N	\N	255V	COMARCA DE TOUROS	A-50	33127	\N	MASCULINO	\N
800	\N	\N		\N	\N	115	2 OFICIO DE NOTAS	95	54305	\N	FEMININO	\N
801	\N	\N		\N	\N	230	UNICO DE IGAPO	80	60514	\N	FEMININO	\N
802	\N	\N		\N	\N	109	2 OFICIO DE NOTAS	98	54899	\N	FEMININO	\N
803	\N	\N		\N	\N	220	UNICO DE IGAPO	82	61695	\N	FEMININO	\N
804	\N	\N		\N	\N	83	2 OFICIO DE NOTAS	92	53673	\N	MASCULINO	\N
805	\N	\N		\N	\N	133	2 OFICIO DE NOTAS	98	54923	\N	FEMININO	\N
806	\N	\N		\N	\N	44	UNICO DE IGAPO	81	60742	\N	FEMININO	\N
807	\N	\N		\N	\N	221	5 OFICIO DE NOTAS	514-A	283784	\N	FEMININO	\N
808	\N	\N		\N	\N	96	UNICO DE IGAPO	82	61448	\N	MASCULINO	\N
809	\N	\N		\N	\N	176	2 OFICIO DE NOTAS	94	54166	\N	FEMININO	\N
810	\N	\N		\N	\N	128	2 OFICIO DE NOTAS	97	54718	\N	FEMININO	\N
811	\N	\N		\N	\N	255	5 OFICIO DE NOTAS	A-512	283218	\N	FEMININO	\N
812	\N	\N		\N	\N	205V	UNICO DE IGAPO	81	61066	\N	MASCULINO	\N
813	\N	\N		\N	\N	45	2 OFICIO DE NOTAS	92	53635	\N	MASCULINO	\N
814	\N	\N		\N	\N	188	SERVICO REGISTRAL GOES DE MELO	A-24	11375	\N	MASCULINO	\N
815	\N	\N		\N	\N	53	2 OFICIO DE NOTAS	94-A	54043	\N	FEMININO	\N
816	\N	\N		\N	\N	247	CARTORIO OFICIAL DE REGISTRO CIVIL	180-A	81947	\N	MASCULINO	\N
817	\N	\N		\N	\N	86	OFICIO UNICO DE NOTAS	50	17728	\N	MASCULINO	\N
818	\N	\N		\N	\N	191	2 OFICIO DE NOTAS	86	52181	\N	MASCULINO	\N
819	\N	\N		\N	\N	101	2 OFICIO DE NOTAS	91	53491	\N	FEMININO	\N
820	\N	\N		\N	\N	136	2 OFICIO DE NOTAS	86	52126	\N	FEMININO	\N
821	\N	\N		\N	\N	301	2 OFICIO DE NOTAS	89	52891	\N	FEMININO	\N
822	\N	\N		\N	\N	44	2 OFICIO DE NOTAS	89	52934	\N	FEMININO	\N
823	\N	\N		\N	\N	270	2 OFICIO DE NOTAS	88	52860	\N	MASCULINO	\N
824	\N	\N		\N	\N	159	5 OFICIO DE NOTAS	A-506	281322	\N	MASCULINO	\N
825	\N	\N		\N	\N	170	CARTORIO SERVICO REGISTRAL	A-32	22659	\N	FEMININO	\N
826	\N	\N		\N	\N	135	CARTORIO UNICO	A-11	8025	\N	MASCULINO	\N
827	\N	\N		\N	\N	109	UNICO DE IGAPO	74	56688	\N	FEMININO	\N
828	\N	\N		\N	\N	259	4 OFICIO DE NOTAS	405	131203	\N	MASCULINO	\N
829	\N	\N		\N	\N	38	CARTORIO DO REGISTO CIVIL DAS PESSOAS NATURAIS	A-109	40936	\N	MASCULINO	\N
830	\N	\N		\N	\N	158	2 OFICIO DE NOTAS	87	52448	\N	MASCULINO	\N
831	\N	\N		\N	\N	3	2 OFICIO DE NOTAS	96	54393	\N	MASCULINO	\N
832	\N	\N		\N	\N	95	4 OFICIO DE NOTAS	A-376	122539	\N	FEMININO	\N
833	\N	\N		\N	\N	68	CARTORIO DO REGISTO CIVIL DAS PESSOAS NATURAIS	383	114668	\N	MASCULINO	\N
834	\N	\N		\N	\N	249	UNICO DE IGAPO	75	57570	\N	FEMININO	\N
1644	\N	\N		\N	\N				54108	\N	FEMININO	\N
1	\N	\N	\N	\N	\N					\N	MASCULINO	\N
835	\N	\N		\N	\N	160	2 OFICIO DE NOTAS	87	52450	\N	FEMININO	\N
836	\N	\N		\N	\N	257	CARTORIO UNICO JUDICIARIO DE IELMO MARINHO	A/12	15533	\N	MASCULINO	\N
837	\N	\N		\N	\N	71	2 OFICIO DE NOTAS	85	51762	\N	MASCULINO	\N
1652	\N	\N		\N	\N				54410	\N	MASCULINO	\N
838	\N	\N		\N	\N	85	5 OFICIO DE NOTAS	A-494	277648	\N	MASCULINO	\N
839	\N	\N		\N	\N	55	5 OFICIO DE NOTAS	A-496	278218	\N	MASCULINO	\N
840	\N	\N		\N	\N	203	UNICO DE IGAPO	A-80	60459	\N	FEMININO	\N
841	\N	\N		\N	\N	267	1 OFICIO DE NOTAS	A-19	17336	\N	MASCULINO	\N
842	\N	\N		\N	\N	138	2 OFICIO DE NOTAS	86	52128	\N	MASCULINO	\N
843	\N	\N		\N	\N	5	2 OFICIO DE NOTAS	87	52340	\N	MASCULINO	\N
844	\N	\N		\N	\N	268	UNICO DE IGAPO	76	58208	\N	FEMININO	\N
845	\N	\N		\N	\N	35	2 OFICIO DE NOTAS	89	52925	\N	FEMININO	\N
846	\N	\N		\N	\N	64	2 OFICIO DE NOTAS	82	50855	\N	MASCULINO	\N
847	\N	\N		\N	\N	141V	UNICO DE IGAPO	A-17	58554	\N	FEMININO	\N
848	\N	\N		\N	\N	271	2 OFICIO DE NOTAS	80	50462	\N	FEMININO	\N
849	\N	\N		\N	\N	188	2 OFICIO DE NOTAS	A-105	56378	\N	MASCULINO	\N
850	\N	\N		\N	\N	99	2 OFICIO DE NOTAS	86	52089	\N	MASCULINO	\N
851	\N	\N		\N	\N	205	2 OFICIO DE NOTAS	82	50996	\N	MASCULINO	\N
852	\N	\N		\N	\N	153	UNICO DE IGAPO	A-72	55577	\N	MASCULINO	\N
853	\N	\N		\N	\N	17	2 OFICIO DE NOTAS	87-A	52307	\N	MASCULINO	\N
854	\N	\N		\N	\N	169	2 OFICIO DE NOTAS	79	50060	\N	MASCULINO	\N
855	\N	\N		\N	\N	147	2 OFICIO DE NOTAS	83	51238	\N	MASCULINO	\N
856	\N	\N		\N	\N	187	2 OFICIO DE NOTAS	81	50678	\N	FEMININO	\N
857	\N	\N		\N	\N	185	2 OFICIO DE NOTAS	60	44470	\N	MASCULINO	\N
858	\N	\N		\N	\N	70	2 OFICIO DE NOTAS	81	50561	\N	MASCULINO	\N
859	\N	\N		\N	\N	106	2 OFICIO DE NOTAS	82	50897	\N	MASCULINO	\N
860	\N	\N		\N	\N	14	2 OFICIO DE NOTAS	80	50205	\N	MASCULINO	\N
861	\N	\N		\N	\N	107	2 OFICIO DE NOTAS	82	50898	\N	FEMININO	\N
862	\N	\N		\N	\N	293	2 OFICIO DE NOTAS	84	51684	\N	MASCULINO	\N
863	\N	\N		\N	\N	24	UNICO DE IGAPO	A-68	53078	\N	FEMININO	\N
864	\N	\N		\N	\N	191	2 OFICIO DE NOTAS	88	52781	\N	MASCULINO	\N
865	\N	\N		\N	\N	298	13 SUBDISTRITO BUTANTA	A-372	164042	\N	FEMININO	\N
866	\N	\N		\N	\N	145	2 OFICIO DE NOTAS	83	51236	\N	MASCULINO	\N
867	\N	\N		\N	\N	278	UNICO DE IGAPO	78	59427	\N	FEMININO	\N
868	\N	\N		\N	\N	150	UNICO DE IGAPO	66	52134	\N	MASCULINO	\N
869	\N	\N		\N	\N	67	CARTORIO UNICO JUDICIARIO DE BOA SAUDE	15	7540	\N	FEMININO	\N
870	\N	\N		\N	\N	45	UNICO DE IGAPO	A-69	53725	\N	MASCULINO	\N
871	\N	\N		\N	\N	4	2 OFICIO DE NOTAS	82	50795	\N	FEMININO	\N
872	\N	\N		\N	\N	288	2 OFICIO DE NOTAS	83	51379	\N	FEMININO	\N
873	\N	\N		\N	\N	8	UNICO DE IGAPO	A-62	49446	\N	MASCULINO	\N
874	\N	\N		\N	\N	100V	2 OFICIO DE NOTAS	53	3314	\N	MASCULINO	\N
875	\N	\N		\N	\N	57	2 OFICIO DE NOTAS	80	50248	\N	MASCULINO	\N
876	\N	\N		\N	\N	250	2 OFICIO DE NOTAS	107	28758	\N	MASCULINO	\N
877	\N	\N		\N	\N	237	2 OFICIO DE NOTAS	78	49828	\N	FEMININO	\N
878	\N	\N		\N	\N	252	UNICO DE IGAPO	A-62	49934	\N	MASCULINO	\N
879	\N	\N		\N	\N	74	2 OFICIO DE NOTAS	79	49965	\N	FEMININO	\N
880	\N	\N		\N	\N	140	2 OFICIO DE NOTAS	76	49131	\N	MASCULINO	\N
881	\N	\N		\N	\N	232	2 OFICIO DE NOTAS	80	50423	\N	FEMININO	\N
882	\N	\N		\N	\N	123	2 OFICIO DE NOTAS	81	50614	\N	MASCULINO	\N
883	\N	\N		\N	\N	105	5 OFICIO DE NOTAS	A-476	272268	\N	FEMININO	\N
884	\N	\N		\N	\N	94	UNICO DE IGAPO	65	51449	\N	MASCULINO	\N
885	\N	\N		\N	\N	194	2 OFICIO DE NOTAS	73	48288	\N	FEMININO	\N
886	\N	\N		\N	\N	65	2 OFICIO DE NOTAS	80	50256	\N	FEMININO	\N
887	\N	\N		\N	\N	240V	COMARCA DE SAO BERNARDO DOS CAMPOS	A14	8112	\N	FEMININO	\N
888	\N	\N		\N	\N	61V	UNICO DE IGAPO	A60	49352	\N	FEMININO	\N
889	\N	\N		\N	\N	110V	OFICIO UNICO DE NOTAS E REGISTROS	62A	16864	\N	MASCULINO	\N
890	\N	\N		\N	\N	110	OFICIO UNICO DE NOTAS E REGISTROS	62A	16863	\N	FEMININO	\N
891	\N	\N		\N	\N	66	2 OFICIO DE NOTAS	89	52956	\N	FEMININO	\N
892	\N	\N		\N	\N	97	2 OFICIO DE NOTAS	80	50288	\N	FEMININO	\N
893	\N	\N		\N	\N	59	UNICO DE IGAPO	61	48947	\N	MASCULINO	\N
894	\N	\N		\N	\N	17	UNICO	29	12945	\N	MASCULINO	\N
895	\N	\N		\N	\N	6	2 OFICIO DE NOTAS	81	50497	\N	MASCULINO	\N
896	\N	\N		\N	\N	271	UNICO DE IGAPO	65	51773	\N	FEMININO	\N
897	\N	\N		\N	\N	251	2 OFICIO DE NOTAS	75	48942	\N	MASCULINO	\N
898	\N	\N		\N	\N	120	2 OFICIO DE NOTAS	82	50911	\N	FEMININO	\N
899	\N	\N		\N	\N	294	UNICO DE IGAPO	67	53018	\N	FEMININO	\N
900	\N	\N		\N	\N	268	CEU PALMEIRA SERVICO REGISTRAL	45	52192	\N	FEMININO	\N
901	\N	\N		\N	\N	98	UNICO DE IGAPO	65	51458	\N	FEMININO	\N
902	\N	\N		\N	\N	281	2 OFICIO DE NOTAS	76	49272	\N	FEMININO	\N
903	\N	\N		\N	\N	21	2 OFICIO DE NOTAS	75	48712	\N	MASCULINO	\N
904	\N	\N		\N	\N	289	4 OFICIO DE NOTAS	364	118933	\N	FEMININO	\N
905	\N	\N		\N	\N	117	2 OFICIO DE NOTAS	A-00128	49067	\N	FEMININO	\N
906	\N	\N		\N	\N	42	REGISTRO CIVIL PRAIA DA CONCEICAO	33-A	15953	\N	MASCULINO	\N
907	\N	\N		\N	\N	222	2 OFICIO DE NOTAS	74	48613	\N	MASCULINO	\N
908	\N	\N		\N	\N	264	5 OFICIO DE NOTAS	A-474	271827	\N	MASCULINO	\N
909	\N	\N		\N	\N	116	5 OFICIO DE NOTAS	A-455	265979	\N	FEMININO	\N
910	\N	\N		\N	\N	84	2 OFICIO DE NOTAS	74	48477	\N	MASCULINO	\N
911	\N	\N		\N	\N	163	2 OFICIO DE NOTAS	75	48854	\N	FEMININO	\N
912	\N	\N		\N	\N	169	4 OFICIO DE NOTAS	359	117313	\N	MASCULINO	\N
913	\N	\N		\N	\N	61	5 OFICIO DE NOTAS	A-465	268924	\N	MASCULINO	\N
914	\N	\N		\N	\N	179	UNICO DE IGAPO	A-59	47989	\N	FEMININO	\N
915	\N	\N		\N	\N	24	2 OFICIO DE NOTAS	75	48715	\N	MASCULINO	\N
916	\N	\N		\N	\N	224	2 OFICIO DE NOTAS	A-81	50715	\N	MASCULINO	\N
917	\N	\N		\N	\N	141	2 OFICIO DE NOTAS	80	50332	\N	MASCULINO	\N
918	\N	\N		\N	\N	288	UNICO DE IGAPO	A-65	51807	\N	MASCULINO	\N
919	\N	\N		\N	\N	132	5 OFICIO DE NOTAS	A-466	269295	\N	FEMININO	\N
920	\N	\N		\N	\N	215	2 OFICIO DE NOTAS	78	49806	\N	FEMININO	\N
921	\N	\N		\N	\N	186	UNICO DE IGAPO	A-66	52206	\N	FEMININO	\N
922	\N	\N		\N	\N	197	2 REISTRO CIVIL	A-288	172018	\N	FEMININO	\N
923	\N	\N		\N	\N	152 V	UNICO DE IGAPO	A-66	52138	\N	FEMININO	\N
924	\N	\N		\N	\N	71	2 OFICIO DE NOTAS	80	50262	\N	FEMININO	\N
925	\N	\N		\N	\N	266	UNICO DE IGAPO	A-59	49163	\N	MASCULINO	\N
926	\N	\N		\N	\N	234	2 OFICIO DE NOTAS	77	49525	\N	MASCULINO	\N
1653	\N	\N		\N	\N				30816	\N	MASCULINO	\N
927	\N	\N		\N	\N	240 V	2 OFICIO DE NOTAS	A-00071	27898	\N	MASCULINO	\N
928	\N	\N		\N	\N	256	2 OFICIO DE NOTAS	76	49247	\N	FEMININO	\N
929	\N	\N		\N	\N	157	2 OFICIO DE NOTAS	78	49748	\N	FEMININO	\N
930	\N	\N		\N	\N	62	2 OFICIO DE NOTAS	78	49653	\N	FEMININO	\N
931	\N	\N		\N	\N	129	2 OFICIO DE NOTAS	77	49420	\N	FEMININO	\N
932	\N	\N		\N	\N		1 OFICIO DE NOTAS		22254658	\N	FEMININO	\N
933	\N	\N		\N	\N	294	2 OFICIO DE NOTAS	75	48975	\N	FEMININO	\N
934	\N	\N		\N	\N	120	CARTORIO DO REGISTO CIVIL	A-125	14761	\N	FEMININO	\N
935	\N	\N		\N	\N	170	2 OFICIO DE NOTAS	12	47964	\N	FEMININO	\N
936	\N	\N		\N	\N	236	5 OFICIO DE NOTAS	A-410	252600	\N	MASCULINO	\N
937	\N	\N		\N	\N	251	2 OFICIO DE NOTAS	76	49242	\N	FEMININO	\N
938	\N	\N		\N	\N	186	2 OFICIO DE NOTAS	67	46480	\N	MASCULINO	\N
939	\N	\N		\N	\N	115	4 CARTORIO JUDICIARIO	A-138	97625	\N	MASCULINO	\N
940	\N	\N		\N	\N	231	2 OFICIO DE NOTAS	72	48025	\N	FEMININO	\N
941	\N	\N		\N	\N	74 V	UNICO DE IGAPO	A-74	56619	\N	FEMININO	\N
942	\N	\N		\N	\N	323	UNICO DE IGAPO	A-71	55223	\N	MASCULINO	\N
943	\N	\N		\N	\N	88	CARTORIO EXTRAJUDICIAL DE JACANA	A-8	5237	\N	FEMININO	\N
944	\N	\N		\N	\N	287	2 OFICIO DE NOTAS	73	48381	\N	MASCULINO	\N
945	\N	\N		\N	\N	9	2 OFICIO DE NOTAS	67	46303	\N	MASCULINO	\N
946	\N	\N		\N	\N	201	5 OFICIO DE NOTAS	A-456	266364	\N	FEMININO	\N
947	\N	\N		\N	\N	297	4 OFICIO DE NOTAS	A-348	114141	\N	FEMININO	\N
948	\N	\N		\N	\N	255	2 OFICIO DE NOTAS	77	49546	\N	MASCULINO	\N
949	\N	\N		\N	\N	241	5 OFICIO DE NOTAS	A-400	249606	\N	MASCULINO	\N
950	\N	\N		\N	\N	44	2 OFICIO DE NOTAS	A-74	48437	\N	FEMININO	\N
951	\N	\N		\N	\N	115	2 OFICIO DE NOTAS	A-114	51163	\N	MASCULINO	\N
952	\N	\N		\N	\N	146	CARTORIO DE REGISTRO CIVIL	A-57	40726	\N	FEMININO	\N
953	\N	\N		\N	\N	133	2 OFICIO DE NOTAS	70	47327	\N	FEMININO	\N
954	\N	\N		\N	\N	179	5 OFICIO DE NOTAS	A-441	261842	\N	FEMININO	\N
955	\N	\N		\N	\N	197	2 OFICIO DE NOTAS	77	49488	\N	FEMININO	\N
956	\N	\N		\N	\N	274	2 OFICIO DE NOTAS	74	48665	\N	MASCULINO	\N
957	\N	\N		\N	\N	160	5 OFICIO DE NOTAS	A-495	278023	\N	MASCULINO	\N
958	\N	\N		\N	\N	254	4 OFICIO DE NOTAS	A-359	117398	\N	FEMININO	\N
959	\N	\N		\N	\N	109	UNICO DE IGAPO	A-63	50248	\N	MASCULINO	\N
960	\N	\N		\N	\N	300	2 OFICIO DE NOTAS	79	50191	\N	FEMININO	\N
961	\N	\N		\N	\N	159	CARTORIO UNICO	A-36	9148	\N	MASCULINO	\N
962	\N	\N		\N	\N	76	4 OFICIO DE NOTAS	A-363	118420	\N	FEMININO	\N
963	\N	\N		\N	\N	45V	2 OFICIO DE NOTAS	A-51	32205	\N	MASCULINO	\N
964	\N	\N		\N	\N	273	2 OFICIO DE NOTAS	75	48964	\N	MASCULINO	\N
965	\N	\N		\N	\N	200	2 OFICIO DE NOTAS	73	48294	\N	FEMININO	\N
966	\N	\N		\N	\N	122	2 OFICIO DE NOTAS	77	49413	\N	MASCULINO	\N
967	\N	\N		\N	\N	251	2 OFICIO DE NOTAS	74	48642	\N	MASCULINO	\N
968	\N	\N		\N	\N	228V	UNICO DE IGAPO	A-63	50487	\N	FEMININO	\N
969	\N	\N		\N	\N	209V	UNICO DE IGAPO	A-57	46853	\N	MASCULINO	\N
970	\N	\N		\N	\N	241V	UNICO DE IGAPO	A-61	49312	\N	FEMININO	\N
971	\N	\N		\N	\N	101	5 OFICIO DE NOTAS	A-448	263864	\N	FEMININO	\N
972	\N	\N		\N	\N	60	2 OFICIO DE NOTAS	3	2051	\N	MASCULINO	\N
973	\N	\N		\N	\N	42	2 OFICIO DE NOTAS	75	48733	\N	MASCULINO	\N
974	\N	\N		\N	\N	77	5 OFICIO DE NOTAS	A-455	265940	\N	MASCULINO	\N
975	\N	\N		\N	\N	36	4 OFICIO DE NOTAS	A-343	112380	\N	MASCULINO	\N
976	\N	\N		\N	\N	235	5 OFICIO DE NOTAS	A-425	257098	\N	MASCULINO	\N
977	\N	\N		\N	\N	187	5 OFICIO DE NOTAS	A-440	261550	\N	MASCULINO	\N
978	\N	\N		\N	\N	8	2 OFICIO DE NOTAS	75	48699	\N	MASCULINO	\N
979	\N	\N		\N	\N	99	2 OFICIO DE NOTAS	81	50590	\N	FEMININO	\N
980	\N	\N		\N	\N	71	2 OFICIO DE NOTAS	74	43464	\N	FEMININO	\N
981	\N	\N		\N	\N	288	2 OFICIO DE NOTAS	104	27896	\N	MASCULINO	\N
982	\N	\N		\N	\N	145	2 OFICIO DE NOTAS	75	48836	\N	FEMININO	\N
983	\N	\N		\N	\N	217	2 OFICIO DE NOTAS	88	52807	\N	FEMININO	\N
984	\N	\N		\N	\N	78	2 OFICIO DE NOTAS	75	48769	\N	MASCULINO	\N
985	\N	\N		\N	\N	137	UNICO DE IGAPO	A-60	48503	\N	MASCULINO	\N
986	\N	\N		\N	\N	249	2 OFICIO DE NOTAS	78	49840	\N	FEMININO	\N
987	\N	\N		\N	\N	124	4 OFICIO DE NOTAS	A-351	114868	\N	FEMININO	\N
988	\N	\N		\N	\N	194	2 OFICIO DE NOTAS	69	47088	\N	FEMININO	\N
989	\N	\N		\N	\N	273	2 OFICIO DE NOTAS	76	49264	\N	MASCULINO	\N
990	\N	\N		\N	\N	155	5 OFICIO DE NOTAS	A-429	258218	\N	FEMININO	\N
991	\N	\N		\N	\N	255	2 OFICIO DE NOTAS	74	48646	\N	MASCULINO	\N
992	\N	\N		\N	\N	283	2 OFICIO DE NOTAS	70	47477	\N	MASCULINO	\N
993	\N	\N		\N	\N	209	CARTORIO DE REGISTRO CIVIL DE BODOCONGO	A-33	28281	\N	FEMININO	\N
994	\N	\N		\N	\N	263	2 OFICIO DE NOTAS	77	49554	\N	MASCULINO	\N
995	\N	\N		\N	\N	292V	CARTORIO UNICO JUDICIARIO	A-14	7240	\N	MASCULINO	\N
996	\N	\N		\N	\N	156	2 OFICIO DE NOTAS	71	47650	\N	FEMININO	\N
997	\N	\N		\N	\N	261	2 OFICIO DE NOTAS	81	50752	\N	MASCULINO	\N
998	\N	\N		\N	\N	45	2 OFICIO DE NOTAS	72	47839	\N	MASCULINO	\N
999	\N	\N		\N	\N	19	2 OFICIO DE NOTAS	69	46913	\N	FEMININO	\N
1000	\N	\N		\N	\N	66	2 OFICIO DE NOTAS	A-49	31446	\N	MASCULINO	\N
1001	\N	\N		\N	\N	202	2 OFICIO DE NOTAS	77	49493	\N	FEMININO	\N
1002	\N	\N		\N	\N	211	2 OFICIO DE NOTAS	72	48005	\N	FEMININO	\N
1634	\N	\N		\N	\N				55668	\N	FEMININO	\N
1003	\N	\N		\N	\N	223	2 OFICIO DE NOTAS	72	48017	\N	FEMININO	\N
1004	\N	\N		\N	\N	187	2 OFICIO DE NOTAS	71	47681	\N	FEMININO	\N
1005	\N	\N		\N	\N	102	2 OFICIO DE NOTAS	72	47896	\N	FEMININO	\N
1006	\N	\N		\N	\N	227	2 OFICIO DE NOTAS	70	47421	\N	MASCULINO	\N
1007	\N	\N		\N	\N	282	2 OFICIO DE NOTAS	72	48076	\N	FEMININO	\N
1008	\N	\N		\N	\N	242	2 OFICIO DE NOTAS	73	48336	\N	MASCULINO	\N
1009	\N	\N		\N	\N	38V	CARTORIO JUDICIARIO DE EXTREMOZ	19	13962	\N	FEMININO	\N
1010	\N	\N		\N	\N	105	2 CARTORIO DO REGISTRO CIVIL	130	45805	\N	FEMININO	\N
1645	\N	\N		\N	\N				54274	\N	FEMININO	\N
1011	\N	\N		\N	\N	271V	COMARCA DE NATAL	A-55	45781	\N	MASCULINO	\N
1012	\N	\N		\N	\N	92	4 OFICIO DE NOTAS	A-351	114836	\N	MASCULINO	\N
1013	\N	\N		\N	\N	121	2 OFICIO DE NOTAS	76	49112	\N	MASCULINO	\N
1014	\N	\N		\N	\N	20	5 OFICIO DE NOTAS	A-461	267683	\N	MASCULINO	\N
1015	\N	\N		\N	\N	112	1 OFICIO DE NOTAS	A-10	11251	\N	MASCULINO	\N
1016	\N	\N		\N	\N	283	2 OFICIO DE NOTAS	72	48077	\N	MASCULINO	\N
1017	\N	\N		\N	\N	179	2 OFICIO DE NOTAS	73	48273	\N	MASCULINO	\N
1018	\N	\N		\N	\N	237	UNICO DE IGAPO	A-55	45712	\N	FEMININO	\N
1019	\N	\N		\N	\N	131	2 OFICIO DE NOTAS	75	48822	\N	MASCULINO	\N
1020	\N	\N		\N	\N	290	4 OFICIO DE NOTAS	A-348	114134	\N	FEMININO	\N
1021	\N	\N		\N	\N	118	2 OFICIO DE NOTAS	75	48809	\N	FEMININO	\N
1022	\N	\N		\N	\N	240	2 OFICIO DE NOTAS	71	47734	\N	MASCULINO	\N
1023	\N	\N		\N	\N	171	CARTORIO UNICO JUDICIARIO	14	6755	\N	MASCULINO	\N
1024	\N	\N		\N	\N	231	5 OFICIO DE NOTAS	A-466	269394	\N	MASCULINO	\N
1025	\N	\N		\N	\N	17V	CARTORIO UNICO JUDICIARIO	A-15	7371	\N	FEMININO	\N
1026	\N	\N		\N	\N	180	2 OFICIO DE NOTAS	72	47974	\N	FEMININO	\N
1027	\N	\N		\N	\N	132	2 OFICIO DE NOTAS	70	47326	\N	FEMININO	\N
1028	\N	\N		\N	\N	182	2 OFICIO DE NOTAS	76	49173	\N	FEMININO	\N
1029	\N	\N		\N	\N	141	2 OFICIO DE NOTAS	88	52731	\N	MASCULINO	\N
1030	\N	\N		\N	\N	134	2 OFICIO DE NOTAS	A-52	22446	\N	MASCULINO	\N
1031	\N	\N		\N	\N	202	2 OFICIO DE NOTAS	70	47396	\N	FEMININO	\N
1032	\N	\N		\N	\N	34	2 OFICIO DE NOTAS	73	48128	\N	FEMININO	\N
1033	\N	\N		\N	\N	292	2 OFICIO DE NOTAS	72	48086	\N	MASCULINO	\N
1034	\N	\N		\N	\N	89	CARTORIO UNICO DE NOTAS	A-09	5561	\N	FEMININO	\N
1035	\N	\N		\N	\N	204	4 OFICIO DE NOTAS	A-345	113148	\N	MASCULINO	\N
1036	\N	\N		\N	\N	109	2 OFICIO DE NOTAS	71	47603	\N	FEMININO	\N
1037	\N	\N		\N	\N	88V	UNICO DE IGAPO	A-58	47209	\N	MASCULINO	\N
1038	\N	\N		\N	\N	14	5 OFICIO DE NOTAS	A-389	245296	\N	FEMININO	\N
1039	\N	\N		\N	\N	121	5 OFICIO DE NOTAS	A-451	264784	\N	MASCULINO	\N
1040	\N	\N		\N	\N	261	2 OFICIO DE NOTAS	69	47155	\N	FEMININO	\N
1041	\N	\N		\N	\N	103	2OFICIO DE NOTAS	73	48197	\N	FEMININO	\N
1042	\N	\N		\N	\N	54	2 CARTORIO JUDICIARIO	A-82	40806	\N	MASCULINO	\N
1043	\N	\N		\N	\N	70	2 OFICIO DE NOTAS	71	47564	\N	MASCULINO	\N
1044	\N	\N		\N	\N	284	COMARCA DE NATAL	A-57	47002	\N	MASCULINO	\N
1045	\N	\N		\N	\N	109	2 OFICIO DE NOTAS	65	45794	\N	MASCULINO	\N
1046	\N	\N		\N	\N	205	2 OFICIO DE NOTAS	80	50396	\N	FEMININO	\N
1047	\N	\N		\N	\N	6V	2OFICIO DE NOTAS	A-52	32526	\N	MASCULINO	\N
1048	\N	\N		\N	\N	60	CARTORIO UNICO DE CATALAO	A-103	36377	\N	FEMININO	\N
1049	\N	\N		\N	\N	162	2 OFICIO DE NOTAS	70	47356	\N	FEMININO	\N
1050	\N	\N		\N	\N	32	2 CARTORIO	106	46209	\N	FEMININO	\N
1051	\N	\N		\N	\N	247	UNICO DE IGAPO	A-61	49323	\N	MASCULINO	\N
1052	\N	\N		\N	\N	180	5 OFICIO DE NOTAS	A-455	266043	\N	MASCULINO	\N
1053	\N	\N		\N	\N	234	2 OFICIO DE NOTAS	65	45919	\N	FEMININO	\N
1054	\N	\N		\N	\N	57	2 OFICIO DE NOTAS	83	51148	\N	FEMININO	\N
1055	\N	\N		\N	\N	216	2 OFICIO DE NOTAS	66	46210	\N	FEMININO	\N
1056	\N	\N		\N	\N	278	2 OFICIO DE NOTAS	69	47172	\N	MASCULINO	\N
1057	\N	\N		\N	\N	243	2 OFICIO DE NOTAS	65	45928	\N	FEMININO	\N
1058	\N	\N		\N	\N	238V	UNICO DE IGAPO	A-48	41530	\N	FEMININO	\N
1059	\N	\N		\N	\N	114	CARTORIO UNICO JUDICIARIO DA REDINHA	A-288	13980	\N	FEMININO	\N
1060	\N	\N		\N	\N	266	5 OFICIO DE NOTAS	A-417	254729	\N	MASCULINO	\N
1061	\N	\N		\N	\N	69	4 OFICIO DE NOTAS	A-336	110313	\N	MASCULINO	\N
1062	\N	\N		\N	\N	3	TABELIONATO DO REGISTRO CIVIL DE PEDRO VELHO	A-35	8891	\N	MASCULINO	\N
1063	\N	\N		\N	\N	17	4 OFICIO DE NOTAS	A-375	121961	\N	FEMININO	\N
1064	\N	\N		\N	\N	297	2 OFICIO DE NOTAS	73	48391	\N	FEMININO	\N
1065	\N	\N		\N	\N	219	UNICO DE IGAPO	A-42	37884	\N	MASCULINO	\N
1066	\N	\N		\N	\N	74V	1 OFICIO DE NOTAS	A-10	4148	\N	FEMININO	\N
1067	\N	\N		\N	\N	60	2 OFICIO DE NOTAS	71	47554	\N	MASCULINO	\N
1068	\N	\N		\N	\N	137	2 OFICIO DE NOTAS	72	47931	\N	MASCULINO	\N
1069	\N	\N		\N	\N	462	SERVICO REGISTRAL E NOTORIAL	A-43	27814	\N	FEMININO	\N
1070	\N	\N		\N	\N	189	5 OFICIO DE NOTAS	A-426	257352	\N	FEMININO	\N
1071	\N	\N		\N	\N	238	UNICO DE IGAPO	53	44515	\N	FEMININO	\N
1072	\N	\N		\N	\N	81	4 OFICIO DE NOTAS	A-337	110625	\N	MASCULINO	\N
1073	\N	\N		\N	\N	155	4 OFICIO DE NOTAS	A-339	111299	\N	MASCULINO	\N
1074	\N	\N		\N	\N	204	1 OFICIO DE NOTAS	392	211976-36	\N	FEMININO	\N
1075	\N	\N		\N	\N	52V	UNICO DE IGAPO	A-37	33226	\N	FEMININO	\N
1076	\N	\N		\N	\N	269	5 OFICIO DE NOTAS	A-428	258032	\N	FEMININO	\N
1077	\N	\N		\N	\N	103	2 OFICIO DE NOTAS	A-107	46951	\N	FEMININO	\N
1078	\N	\N		\N	\N	55	2 OFICIO DE NOTAS	59	44040	\N	MASCULINO	\N
1079	\N	\N		\N	\N	56	2 OFICIO DE NOTAS	76	49047	\N	FEMININO	\N
1080	\N	\N		\N	\N	148	2 OFICIO DE NOTAS	62	44933	\N	MASCULINO	\N
1081	\N	\N		\N	\N	101	2 OFICIO DE NOTAS	55	42887	\N	FEMININO	\N
1082	\N	\N		\N	\N	14	2 OFICIO DE NOTAS	A-66	46008	\N	MASCULINO	\N
1083	\N	\N		\N	\N	50V	UNICO DE IGAPO	A-17	15110	\N	FEMININO	\N
1084	\N	\N		\N	\N	278	UNICO DE IGAPO	A-48	41597	\N	MASCULINO	\N
1085	\N	\N		\N	\N	189V	1 DISTRITO DA COMARCA DE VITORIA DE SANTO ANTAO	A-3	2327	\N	MASCULINO	\N
1086	\N	\N		\N	\N	283	2 CARTORIO JUDICIARIO	A-99	26391	\N	MASCULINO	\N
1087	\N	\N		\N	\N	67	2 OFICIO DE NOTAS	70	47261	\N	FEMININO	\N
1088	\N	\N		\N	\N	248	2 OFICIO DE NOTAS	68	46842	\N	MASCULINO	\N
1089	\N	\N		\N	\N	226	SERVICO REGISTRAL E NOTORIAL	45	28779	\N	MASCULINO	\N
1090	\N	\N		\N	\N	300V	CARTORIO UNICO DE JACANA	A-7	5062	\N	MASCULINO	\N
1091	\N	\N		\N	\N	17	TABELIONATO DO REGISTRO CIVIL DE PEDRO VELHO	A-30	8406	\N	MASCULINO	\N
1092	\N	\N		\N	\N	209	2 OFICIO DE NOTAS	62	44994	\N	MASCULINO	\N
1093	\N	\N		\N	\N	118	2 OFICIO DE NOTAS	54	46412	\N	MASCULINO	\N
1094	\N	\N		\N	\N	102	UNICO DE IGAPO	A-53	44243	\N	MASCULINO	\N
1095	\N	\N		\N	\N	171	2 OFICIO DE NOTAS	60	44456	\N	FEMININO	\N
1096	\N	\N		\N	\N	283	2 OFICIO DE NOTAS	71	47777	\N	MASCULINO	\N
1097	\N	\N		\N	\N	211	2 OFICIO DE NOTAS	69	47105	\N	FEMININO	\N
1098	\N	\N		\N	\N	291	UNICO DE IGAPO	A-47	41035	\N	MASCULINO	\N
1099	\N	\N		\N	\N	67	2 OFICIO DE NOTAS	72	74861	\N	MASCULINO	\N
1100	\N	\N		\N	\N	106	UNICO DE IGAPO	4	39463	\N	FEMININO	\N
1188	\N	\N		\N	\N	289	4 OFICIO DE NOTAS	A-311	103595	\N	FEMININO	\N
1101	\N	\N		\N	\N	16	TABELIONATO DO REGISTRO CIVIL DE PEDRO VELHO	A-30	8405	\N	FEMININO	\N
1102	\N	\N		\N	\N	56	5 OFICIO DE NOTAS	A-404	250620	\N	FEMININO	\N
1103	\N	\N		\N	\N	292	2 OFICIO DE NOTAS	69	47186	\N	MASCULINO	\N
1104	\N	\N		\N	\N	96V	CARTORIO REGISTRAL CIVIL	161	188959	\N	MASCULINO	\N
1105	\N	\N		\N	\N	29	2 OFICIO DE NOTAS	56	43115	\N	FEMININO	\N
1106	\N	\N		\N	\N	235	2 OFICIO DE NOTAS	68	46830	\N	MASCULINO	\N
1107	\N	\N		\N	\N	168	4 OFICIO DE NOTAS	A-332	109211	\N	FEMININO	\N
1108	\N	\N		\N	\N	95	CARTORIO DO REGISTRO CIVIL DAS PESSOAS NATURAIS	A-42	26826	\N	MASCULINO	\N
1109	\N	\N		\N	\N	144	UNICO DE IGAPO	A-37	34187	\N	MASCULINO	\N
1656	\N	\N		\N	\N				53795	\N	FEMININO	\N
1110	\N	\N		\N	\N	238	2 OFICIO DE NOTAS	63	45323	\N	MASCULINO	\N
1111	\N	\N		\N	\N	82	UNICO DE IGAPO	A-56	46002	\N	MASCULINO	\N
1112	\N	\N		\N	\N	66	3 OFICIO DE NOTAS	A-0521	215166	\N	FEMININO	\N
1113	\N	\N		\N	\N	191	UNICO DE IGAPO	A-40	36624	\N	MASCULINO	\N
1114	\N	\N		\N	\N	136	2 OFICIO DE NOTAS	72	47930	\N	FEMININO	\N
1115	\N	\N		\N	\N	282	UNICO DE IGAPO	47	41018	\N	FEMININO	\N
1116	\N	\N		\N	\N	278	4 OFICIO DE NOTAS	319	105520	\N	MASCULINO	\N
1117	\N	\N		\N	\N	285V	CARTORIO UNICO DE PEDRA PRETA	8	1786	\N	FEMININO	\N
1118	\N	\N		\N	\N	143	UNICO DE IGAPO	53	44326	\N	FEMININO	\N
1119	\N	\N		\N	\N	16	UNICO DE IGAPO	65	51262	\N	MASCULINO	\N
1120	\N	\N		\N	\N	151	2 OFICIO DE NOTAS	65	45836	\N	MASCULINO	\N
1121	\N	\N		\N	\N	182	2 OFICIO DE NOTAS	66	46186	\N	FEMININO	\N
1122	\N	\N		\N	\N	5	UNICO DE IGAPO	46	39861	\N	FEMININO	\N
1123	\N	\N		\N	\N	207	2 OFICIO DE NOTAS	66	46201	\N	FEMININO	\N
1124	\N	\N		\N	\N	294	2 OFICIO DE NOTAS	46	30102	\N	FEMININO	\N
1125	\N	\N		\N	\N	214	CARTORIO DE REGISTRO CIVIL DE PESSOAS NATURAIS	A-329	108456	\N	FEMININO	\N
1126	\N	\N		\N	\N	282	2 OFICIO DE NOTAS	67	46576	\N	MASCULINO	\N
1127	\N	\N		\N	\N	127	2 CARTORIO JUDICIARIO	19	19347	\N	FEMININO	\N
1128	\N	\N		\N	\N	209	5 OFICIO DE NOTAS	A-419	255272	\N	FEMININO	\N
1129	\N	\N		\N	\N	56	5 OFICIO DE NOTAS	A-409	252120	\N	FEMININO	\N
1130	\N	\N		\N	\N	176	2 OFICIO DE NOTAS	A-45	34018	\N	FEMININO	\N
1131	\N	\N		\N	\N	13	2 OFICIO DE NOTAS	65	45698	\N	MASCULINO	\N
1132	\N	\N		\N	\N	229	2 OFICIO DE NOTAS	70	47423	\N	FEMININO	\N
1133	\N	\N		\N	\N	114	UNICO DE IGAPO	A-38	35296	\N	MASCULINO	\N
1134	\N	\N		\N	\N	192	2 OFICIO DE NOTAS	61	44677	\N	FEMININO	\N
1135	\N	\N		\N	\N	76	2 OFICIO DE NOTAS	72	47870	\N	FEMININO	\N
1136	\N	\N		\N	\N	9V	5 OFICIO DE NOTAS	A-396	248087	\N	FEMININO	\N
1137	\N	\N		\N	\N	33	2 OFICIO DE NOTAS	65	45718	\N	FEMININO	\N
1138	\N	\N		\N	\N	2	2 OFICIO DE NOTAS	66	45987	\N	MASCULINO	\N
1139	\N	\N		\N	\N	271	2 OFICIO DE NOTAS	68	46865	\N	MASCULINO	\N
1140	\N	\N		\N	\N	58	2 OFICIO DE NOTAS	59	44043	\N	MASCULINO	\N
1141	\N	\N		\N	\N	112	5 OFICIO DE NOTAS	A-410	252476	\N	MASCULINO	\N
1142	\N	\N		\N	\N	90	2 OFICIO DE NOTAS	63	45175	\N	FEMININO	\N
1143	\N	\N		\N	\N	147V	5 OFICIO DE NOTAS	A-389	245563	\N	FEMININO	\N
1144	\N	\N		\N	\N	217	UNICO DE IGAPO	A-329	28674	\N	FEMININO	\N
1145	\N	\N		\N	\N	100V	CARTORIO UNICO JUDICIARIO	A-11	6711	\N	FEMININO	\N
1146	\N	\N		\N	\N	285	2 CARTORIO JUDICIARIO	A-01	1137	\N	FEMININO	\N
1147	\N	\N		\N	\N	188	2 CARTORIO JUDICIARIO	A-24	11979	\N	FEMININO	\N
1148	\N	\N		\N	\N	21	UNICO DE IGAPO	44	38688	\N	MASCULINO	\N
1149	\N	\N		\N	\N	124	2 OFICIO DE NOTAS	62	44909	\N	MASCULINO	\N
1150	\N	\N		\N	\N	36	2 OFICIO DE NOTAS	64	45421	\N	MASCULINO	\N
1151	\N	\N		\N	\N	277	2 OFICIO DE NOTAS	57	43663	\N	FEMININO	\N
1152	\N	\N		\N	\N	130V	1 OFICIO DE NOTAS	A-74	158893	\N	MASCULINO	\N
1153	\N	\N		\N	\N	48V	2 CARTORIO JUDICIARIO	A-17/2	13764	\N	MASCULINO	\N
1154	\N	\N		\N	\N	44	4 OFICIO DE NOTAS		100225	\N	MASCULINO	\N
1155	\N	\N		\N	\N	163	2 OFICIO DE NOTAS	A-81	31076	\N	MASCULINO	\N
1156	\N	\N		\N	\N	148	2 OFICIO DE NOTAS	66	46142	\N	MASCULINO	\N
1157	\N	\N		\N	\N	200V	COMARCA DE CEARA-MIRIM	1	800	\N	FEMININO	\N
1158	\N	\N		\N	\N	97	UNICO DE IGAPO	A-38	35228	\N	MASCULINO	\N
1159	\N	\N		\N	\N	259	2 OFICIO DE NOTAS	72	48053	\N	MASCULINO	\N
1160	\N	\N		\N	\N	199	2 OFICIO DE NOTAS	A-134	62189	\N	MASCULINO	\N
1161	\N	\N		\N	\N	263	5 OFICIO DE NOTAS	A-443	262526	\N	FEMININO	\N
1162	\N	\N		\N	\N	15	2 OFICIO DE NOTAS	66	46009	\N	FEMININO	\N
1163	\N	\N		\N	\N	248	5 OFICIO DE NOTAS	A-373	239658	\N	MASCULINO	\N
1164	\N	\N		\N	\N	216	5 OFICIO DE NOTAS	A-404	250780	\N	MASCULINO	\N
1165	\N	\N		\N	\N	84	2 OFICIO DE NOTAS	A-62	44869	\N	MASCULINO	\N
1166	\N	\N		\N	\N	189	CARTORIO UNICO	A-45	39629	\N	MASCULINO	\N
1167	\N	\N		\N	\N	180V	2 OFICIO DE NOTAS	54	40650	\N	MASCULINO	\N
1168	\N	\N		\N	\N	190	2 OFICIO DE NOTAS	69	47084	\N	MASCULINO	\N
1169	\N	\N		\N	\N	111	CARTORIO UNICO	A-11	13549	\N	FEMININO	\N
1170	\N	\N		\N	\N	175	2 CARTORIO JUDICIARIO	A-41	13666	\N	FEMININO	\N
1171	\N	\N		\N	\N	163	2 OFICIO DE NOTAS	A-91	41504	\N	FEMININO	\N
1172	\N	\N		\N	\N	263V	5 OFICIO DE NOTAS	A-372	238520	\N	MASCULINO	\N
1173	\N	\N		\N	\N	293	SEGUNDO CARTORIO DO REGISTRO CIVIL	32	13816	\N	MASCULINO	\N
1174	\N	\N		\N	\N	56	2 OFICIO DE NOTAS	64	45441	\N	FEMININO	\N
1175	\N	\N		\N	\N	300	2 OFICIO DE NOTAS	65	45985	\N	MASCULINO	\N
1176	\N	\N		\N	\N	174	CARTORIO DE REGISTRO CIVIL DAS PESSOAS NATURAIS	36	32513	\N	MASCULINO	\N
1177	\N	\N		\N	\N	233V	UNICO DE IGAPO	A-33	29941	\N	MASCULINO	\N
1178	\N	\N		\N	\N	201	5 OFICIO DE NOTAS	A-405	251065	\N	MASCULINO	\N
1179	\N	\N		\N	\N	51	CARTORIO UNICO OFICIAL DE NOTAS	9	5302	\N	FEMININO	\N
1180	\N	\N		\N	\N	13V	CARTORIO OFICIAL DE REGISTRO CIVIL	A-0152	151973	\N	FEMININO	\N
1181	\N	\N		\N	\N	175	2 OFICIO DE NOTAS	A-48	31064	\N	FEMININO	\N
1182	\N	\N		\N	\N	250	2 OFICIO DE NOTAS	54	40929	\N	FEMININO	\N
1183	\N	\N		\N	\N	175	2 OFICIO DE NOTAS	54	40628	\N	FEMININO	\N
1184	\N	\N		\N	\N	24V	CARTORIO DE REGISTRO CIVIL	A-90	35298	\N	MASCULINO	\N
1185	\N	\N		\N	\N	181	2 OFICIO DE NOTAS	63	45266	\N	MASCULINO	\N
1186	\N	\N		\N	\N	160	2 OFICIO DE NOTAS	65	45845	\N	FEMININO	\N
1187	\N	\N		\N	\N	24	UNICO DE IGAPO	A-48	41102	\N	MASCULINO	\N
1189	\N	\N		\N	\N	59	2 OFICIO DE NOTAS	75	48750	\N	FEMININO	\N
1190	\N	\N		\N	\N	60	CARTORIO DO REGISTRO CIVIL DAS PESSOAS NATURAIS	A-33	8749	\N	FEMININO	\N
1191	\N	\N		\N	\N	78	2 CARTORIO JUDICIARIO	63	45163	\N	MASCULINO	\N
1192	\N	\N		\N	\N	86	2 OFICIO DE NOTAS	69	46980	\N	FEMININO	\N
1193	\N	\N		\N	\N	191V	UNICO DE IGAPO	A-38	35607	\N	MASCULINO	\N
1194	\N	\N		\N	\N	160	2 OFICIO DE NOTAS	67	46454	\N	FEMININO	\N
1195	\N	\N		\N	\N	220	2 OFICIO DE NOTAS	59	44205	\N	MASCULINO	\N
1196	\N	\N		\N	\N	143	2 OFICIO DE NOTAS	60	44428	\N	MASCULINO	\N
1197	\N	\N		\N	\N	73	2 OFICIO DE NOTAS	62	44858	\N	MASCULINO	\N
1198	\N	\N		\N	\N	123	2 OFICIO DE NOTAS	64	45508	\N	MASCULINO	\N
1199	\N	\N		\N	\N	204	2 OFICIO DE NOTAS	A-66	46198	\N	FEMININO	\N
1200	\N	\N		\N	\N	185	2 OFICIO DE NOTAS	59	44170	\N	FEMININO	\N
1201	\N	\N		\N	\N	149V	2 CARTORIO DO REGISTRO CIVIL	2	1498	\N	MASCULINO	\N
1202	\N	\N		\N	\N	90	CARTORIO DO REGISTRO CIVIL DAS PESSOAS NATURAIS	A-239	224935	\N	MASCULINO	\N
1203	\N	\N		\N	\N	183	2 OFICIO DE NOTAS	67	46477	\N	MASCULINO	\N
1204	\N	\N		\N	\N	279	UNICO DE IGAPO	46-A	40409	\N	FEMININO	\N
1205	\N	\N		\N	\N	22	2 OFICIO DE NOTAS	65	45707	\N	FEMININO	\N
1206	\N	\N		\N	\N	17	12 REGISTRO CIVIL	1SA-0068	35417	\N	FEMININO	\N
1207	\N	\N		\N	\N	156	5 OFICIO DE NOTAS	A-410	252520	\N	FEMININO	\N
1208	\N	\N		\N	\N	67	2 OFICIO DE NOTAS	67	46361	\N	FEMININO	\N
1209	\N	\N		\N	\N	154	2 OFICIO DE NOTAS	72	47948	\N	MASCULINO	\N
1210	\N	\N		\N	\N	236	2 OFICIO DE NOTAS	64	45621	\N	FEMININO	\N
1211	\N	\N		\N	\N	151	CARTORIO UNICO JUDICIARIO	11	13717	\N	MASCULINO	\N
1212	\N	\N		\N	\N	267	2 OFICIO DE NOTAS	70	47411	\N	MASCULINO	\N
1213	\N	\N		\N	\N	277	2 OFICIO DE NOTAS	63	45362	\N	FEMININO	\N
1214	\N	\N		\N	\N	9	2 OFICIO DE NOTAS	60	44294	\N	FEMININO	\N
1215	\N	\N		\N	\N	288	2 OFICIO DE NOTAS	58	43973	\N	MASCULINO	\N
1216	\N	\N		\N	\N	257	2 OFICIO DE NOTAS	59	44252	\N	MASCULINO	\N
1217	\N	\N		\N	\N	217V	UNICO DE IGAPO	49	42059	\N	MASCULINO	\N
1218	\N	\N		\N	\N	231	2 OFICIO DE NOTAS	59	44216	\N	MASCULINO	\N
1219	\N	\N		\N	\N	225	2 SUBDISTRITO	A-268	161916	\N	FEMININO	\N
1220	\N	\N		\N	\N	32	UNICO DE IGAPO	A-49	41704	\N	MASCULINO	\N
1221	\N	\N		\N	\N	115	2 OFICIO DE NOTAS	67	46409	\N	MASCULINO	\N
1222	\N	\N		\N	\N	21V	REGISTRO CIVIL DAS PESSOAS NATURAIS	A-841	477144	\N	FEMININO	\N
1223	\N	\N		\N	\N	144	1 OFICIO DE NOTAS	A-08	3744	\N	MASCULINO	\N
1224	\N	\N		\N	\N	190V	1 OFICIO DE NOTAS	17	12170	\N	FEMININO	\N
1225	\N	\N		\N	\N	285	UNICO DE IGAPO	A-42	37915	\N	FEMININO	\N
1226	\N	\N		\N	\N	178	1 ZONA REDINHA	A-19	11800	\N	MASCULINO	\N
1227	\N	\N		\N	\N					\N	MASCULINO	\N
1228	\N	\N		\N	\N	28	2 OFICIO DE NOTAS	61	44511	\N	FEMININO	\N
1229	\N	\N		\N	\N	232	5 OFICIO DE NOTAS	A-440	261595	\N	FEMININO	\N
1230	\N	\N		\N	\N	80	2 OFICIO DE NOTAS	54	40252	\N	MASCULINO	\N
1231	\N	\N		\N	\N	252V	UNICO DE IGAPO	A-45	39756	\N	MASCULINO	\N
1232	\N	\N		\N	\N	158V	UNICO DE IGAPO	A-42	37762	\N	FEMININO	\N
1233	\N	\N		\N	\N	120	2 OFICIO DE NOTAS	70	47314	\N	MASCULINO	\N
1234	\N	\N		\N	\N	106V	5 OFICIO DE NOTAS	A-395	247881	\N	FEMININO	\N
1235	\N	\N		\N	\N	50	4 OFICIO DE NOTAS	4323	106492	\N	FEMININO	\N
1236	\N	\N		\N	\N	251	CARTORIO DO REGISTRO CIVIL DAS PESSOAS NATURAIS	53	44541	\N	FEMININO	\N
1237	\N	\N		\N	\N	245	10 OFICIO DE NOTAS	AA-45	6500	\N	MASCULINO	\N
1238	\N	\N		\N	\N	42	4 OFICIO DE NOTAS	316	104483	\N	MASCULINO	\N
1239	\N	\N		\N	\N	240	2 OFICIO DE NOTAS	66	46234	\N	FEMININO	\N
1240	\N	\N		\N	\N	78	2 OFICIO DE NOTAS	78	49669	\N	FEMININO	\N
1241	\N	\N		\N	\N	3	2 OFICIO DE NOTAS	62	44788	\N	FEMININO	\N
1242	\N	\N		\N	\N	290	2 OFICIO DE NOTAS	57	43676	\N	FEMININO	\N
1243	\N	\N		\N	\N	24	2 OFICIO DE NOTAS	60	44309	\N	MASCULINO	\N
1244	\N	\N		\N	\N	92	2 OFICIO DE NOTAS	62	44877	\N	FEMININO	\N
1245	\N	\N		\N	\N	15	2 OFICIO DE NOTAS	65	45700	\N	FEMININO	\N
1246	\N	\N		\N	\N	181	UNICO DE IGAPO	A-25	22431	\N	FEMININO	\N
1247	\N	\N		\N	\N	159	CARTORIO UNICO	A-0521	5577	\N	MASCULINO	\N
1248	\N	\N		\N	\N	252	CARTORIO UNICO NOTARIAL	A-1	252	\N	MASCULINO	\N
1249	\N	\N		\N	\N	11	2 OFICIO DE NOTAS	63	45096	\N	MASCULINO	\N
1250	\N	\N		\N	\N	83	5 OFICIO DE NOTAS	397	248634	\N	MASCULINO	\N
1251	\N	\N		\N	\N	263	2 OFICIO DE NOTAS	61	44748	\N	MASCULINO	\N
1252	\N	\N		\N	\N	94	4 OFICIO DE NOTAS	314	104136	\N	MASCULINO	\N
1253	\N	\N		\N	\N	168	CARTORIO UNICO	A-11	13786	\N	FEMININO	\N
1254	\N	\N		\N	\N	275	2 OFICIO DE NOTAS	61	44760	\N	MASCULINO	\N
1255	\N	\N		\N	\N	290	2 OFICIO DE NOTAS	70	47484	\N	FEMININO	\N
1256	\N	\N		\N	\N	64	5 OFICIO DE NOTAS	A-368	232923	\N	MASCULINO	\N
1257	\N	\N		\N	\N	206	4 OFICIO DE NOTAS	310	107066	\N	MASCULINO	\N
1258	\N	\N		\N	\N	82	2 OFICIO DE NOTAS	57	43468	\N	FEMININO	\N
1259	\N	\N		\N	\N		2 CARTORIO JUDICIARIO	A24	11500	\N	MASCULINO	\N
1260	\N	\N		\N	\N	120	5 OFICIO DE NOTAS	A-386	244489	\N	FEMININO	\N
1261	\N	\N		\N	\N	166	2 OFICIO DE NOTAS	57	43552	\N	FEMININO	\N
1262	\N	\N		\N	\N	109	2 OFICIO DE NOTAS	57	43495	\N	MASCULINO	\N
1263	\N	\N		\N	\N	164	2 OFICIO DE NOTAS	A-81	31079	\N	MASCULINO	\N
1264	\N	\N		\N	\N	248	UNICO DE IGAPO	A-39	36140	\N	FEMININO	\N
1265	\N	\N		\N	\N	51	2 OFICIO DE NOTAS	59	44036	\N	MASCULINO	\N
1355	\N	\N		\N	\N	174	2 OFICIO DE NOTAS	52	38800	\N	FEMININO	\N
1266	\N	\N		\N	\N	146V	CARTORIO DO REGISTRO CIVIL DAS PESSOAS NATURAIS	A-57	46727	\N	MASCULINO	\N
1267	\N	\N		\N	\N	51	2 OFICIO DE NOTAS	69	46945	\N	MASCULINO	\N
1268	\N	\N		\N	\N	228V	UNICO DE IGAPO	A-56	46292	\N	FEMININO	\N
1269	\N	\N		\N	\N	59V	5 OFICIO DE NOTAS	A-393	246987	\N	FEMININO	\N
1270	\N	\N		\N	\N	44V	COMARCA DE CEARA-MIRIM	A-10	5391	\N	MASCULINO	\N
1271	\N	\N		\N	\N	144	UNICO DE IGAPO	A-33	29586	\N	MASCULINO	\N
1272	\N	\N		\N	\N	268	2 OFICIO DE NOTAS	65	45953	\N	FEMININO	\N
1273	\N	\N		\N	\N	267	2 OFICIO DE NOTAS	67	46561	\N	FEMININO	\N
1274	\N	\N		\N	\N	25	2 OFICIO DE NOTAS	53	39437	\N	FEMININO	\N
1275	\N	\N		\N	\N	268	2 OFICIO DE NOTAS	62	45053	\N	FEMININO	\N
1276	\N	\N		\N	\N	66	2 CARTORIO JUDICIARIO	A-93	35022	\N	FEMININO	\N
1277	\N	\N		\N	\N	145	5 OFICIO DE NOTAS	A-460	267508	\N	FEMININO	\N
1278	\N	\N		\N	\N	299	2 OFICIO DE NOTAS	62	45084	\N	FEMININO	\N
1279	\N	\N		\N	\N	293	2 CARTORIO JUDICIARIO	A-19	20009	\N	FEMININO	\N
1280	\N	\N		\N	\N	112V	2 OFICIO DE NOTAS	A-50	35823	\N	MASCULINO	\N
1281	\N	\N		\N	\N	19	2 OFICIO DE NOTAS	71	47513	\N	FEMININO	\N
1282	\N	\N		\N	\N					\N	FEMININO	\N
1283	\N	\N		\N	\N	44	5 OFICIO DE NOTAS	A-392	246556	\N	FEMININO	\N
1284	\N	\N		\N	\N	144	2 OFICIO DE NOTAS	64	45529	\N	FEMININO	\N
1285	\N	\N		\N	\N	30V	CARTORIO DO REGISTRO CIVIL DAS PESSOAS NATURAIS	284	223686	\N	MASCULINO	\N
1286	\N	\N		\N	\N	46V	UNICO DE IGAPO	A-38	35026	\N	FEMININO	\N
1287	\N	\N		\N	\N	30	11 DISTRITO	A-38	14810	\N	MASCULINO	\N
1288	\N	\N		\N	\N	231V	4 OFICIO DE NOTAS	311	103365	\N	MASCULINO	\N
1289	\N	\N		\N	\N	47	UNICO DE IGAPO	43	38039	\N	MASCULINO	\N
1290	\N	\N		\N	\N	281	UNICO DE IGAPO	A-35	32546	\N	FEMININO	\N
1291	\N	\N		\N	\N	24V	UNICO DE IGAPO	A-38	34940	\N	MASCULINO	\N
1292	\N	\N		\N	\N	152	UNICO DE IGAPO	A-40	36546	\N	FEMININO	\N
1293	\N	\N		\N	\N	56	2 OFICIO DE NOTAS	73	48150	\N	FEMININO	\N
1294	\N	\N		\N	\N	10	4 OFICIO DE NOTAS	310	101290	\N	FEMININO	\N
1295	\N	\N		\N	\N	268	2 OFICIO DE NOTAS	54	42003	\N	MASCULINO	\N
1296	\N	\N		\N	\N	221	2 OFICIO DE NOTAS	A-639	236198	\N	FEMININO	\N
1297	\N	\N		\N	\N	182	4 OFICIO DE NOTAS	311	103168	\N	FEMININO	\N
1298	\N	\N		\N	\N	166	5 OFICIO DE NOTAS	374	240531	\N	MASCULINO	\N
1299	\N	\N		\N	\N	118	UNICO DE IGAPO	49	41860	\N	MASCULINO	\N
1300	\N	\N		\N	\N	51	COMARCA DE PIMENTA BUENO	A-52	20134	\N	MASCULINO	\N
1301	\N	\N		\N	\N	163	5 OFICIO DE NOTAS	A-373	239319	\N	FEMININO	\N
1302	\N	\N		\N	\N	86	2 OFICIO DE NOTAS	67	46380	\N	FEMININO	\N
1303	\N	\N		\N	\N	115	2 OFICIO DE NOTAS	54	40393	\N	MASCULINO	\N
1304	\N	\N		\N	\N	78	2 OFICIO DE NOTAS	61	44563	\N	FEMININO	\N
1305	\N	\N		\N	\N	252	2 CARTORIO JUDICIARIO	A-160	73353	\N	MASCULINO	\N
1306	\N	\N		\N	\N	278	32 SUBDISTRITO	A-482	247773	\N	FEMININO	\N
1307	\N	\N		\N	\N	298V	UNICO DE IGAPO	A-38	33010	\N	MASCULINO	\N
1308	\N	\N		\N	\N	57	UNICO DE IGAPO	A-37	33244	\N	FEMININO	\N
1309	\N	\N		\N	\N	74	2 OFICIO DE NOTAS	54	40226	\N	FEMININO	\N
1310	\N	\N		\N	\N	114	2 OFICIO DE NOTAS	57	43500	\N	MASCULINO	\N
1311	\N	\N		\N	\N	13	4 OFICIO DE NOTAS	A-308	98902	\N	MASCULINO	\N
1312	\N	\N		\N	\N	66	2 OFICIO DE NOTAS	62	44851	\N	MASCULINO	\N
1313	\N	\N		\N	\N	73	2 OFICIO DE NOTAS	55	42859	\N	FEMININO	\N
1314	\N	\N		\N	\N	270	2 OFICIO DE NOTAS	69	47164	\N	MASCULINO	\N
1315	\N	\N		\N	\N	91	2 OFICIO DE NOTAS	56	43177	\N	MASCULINO	\N
1316	\N	\N		\N	\N	191	2 OFICIO DE NOTAS	A-62	26029	\N	MASCULINO	\N
1317	\N	\N		\N	\N	212	4 OFICIO DE NOTAS	A-308	99697	\N	FEMININO	\N
1318	\N	\N		\N	\N	150	CARTORIO UNICO	A-19	11827	\N	FEMININO	\N
1319	\N	\N		\N	\N	56	2 OFICIO DE NOTAS	56	43138	\N	FEMININO	\N
1320	\N	\N		\N	\N	47V	2 OFICIO DE NOTAS	54	40181	\N	FEMININO	\N
1321	\N	\N		\N	\N	16	COMARCA DE CAICARA	A-7	6093	\N	FEMININO	\N
1322	\N	\N		\N	\N	63	2 OFICIO DE NOTAS	54	40182	\N	FEMININO	\N
1323	\N	\N		\N	\N	142	2 OFICIO DE NOTAS	54	40499	\N	MASCULINO	\N
1324	\N	\N		\N	\N	443	CARTORIO UNICO	A-02	1296	\N	MASCULINO	\N
1325	\N	\N		\N	\N	186V	2 OFICIO DE NOTAS	A-45	31883	\N	MASCULINO	\N
1326	\N	\N		\N	\N	150	CARTORIO DO REGISTRO CIVIL DAS PESSOAS NATURAIS	7	3556	\N	FEMININO	\N
1327	\N	\N		\N	\N	147	5 OFICIO DE NOTAS	A-369	234455	\N	MASCULINO	\N
1328	\N	\N		\N	\N	252V	2 CARTORIO JUDICIARIO	A-2	2405	\N	FEMININO	\N
1329	\N	\N		\N	\N	201	5 OFICIO DE NOTAS	369	234670	\N	FEMININO	\N
1330	\N	\N		\N	\N	12	2 OFICIO DE NOTAS	59	43997	\N	MASCULINO	\N
1331	\N	\N		\N	\N	11	5 OFICIO DE NOTAS	A-370	235111	\N	MASCULINO	\N
1332	\N	\N		\N	\N	132	CARTORIO NASCIMENTO	49	13215	\N	FEMININO	\N
1333	\N	\N		\N	\N	43	5 OFICIO DE NOTAS	A-364	228038	\N	MASCULINO	\N
1334	\N	\N		\N	\N	65	2 OFICIO DE NOTAS	67	46359	\N	FEMININO	\N
1335	\N	\N		\N	\N	141	5 OFICIO DE NOTAS	267	232033	\N	MASCULINO	\N
1336	\N	\N		\N	\N	151	2 OFICIO DE NOTAS	54	40535	\N	FEMININO	\N
1337	\N	\N		\N	\N	158V	2 OFICIO DE NOTAS	52	38739	\N	MASCULINO	\N
1338	\N	\N		\N	\N	229V	2 OFICIO DE NOTAS	50	36281	\N	MASCULINO	\N
1339	\N	\N		\N	\N	299	UNICO DE IGAPO	35	32617	\N	MASCULINO	\N
1340	\N	\N		\N	\N	276	2 OFICIO DE NOTAS	57	43662	\N	MASCULINO	\N
1341	\N	\N		\N	\N	84	2 OFICIO DE NOTAS		40268	\N	MASCULINO	\N
1342	\N	\N		\N	\N	23	UNICO DE IGAPO	A-34	30299	\N	MASCULINO	\N
1343	\N	\N		\N	\N	147	4 OFICIO DE NOTAS	A-308	99438	\N	FEMININO	\N
1344	\N	\N		\N	\N	233	CARTORIO DO REGISTRO CIVIL DAS PESSOAS NATURAIS	A-39	29059	\N	FEMININO	\N
1345	\N	\N		\N	\N	142V	5 OFICIO DE NOTAS	A-370	235636	\N	MASCULINO	\N
1346	\N	\N		\N	\N	164V	2 OFICIO DE NOTAS	53	39912	\N	MASCULINO	\N
1347	\N	\N		\N	\N	118	2 OFICIO DE NOTAS	55	42904	\N	FEMININO	\N
1348	\N	\N		\N	\N	121	UNICO DE IGAPO	A-42	37687	\N	FEMININO	\N
1349	\N	\N		\N	\N	246V	5 OFICIO DE NOTAS	A-373	239652	\N	FEMININO	\N
1350	\N	\N		\N	\N	147	5 OFICIO DE NOTAS	A-363	227255	\N	FEMININO	\N
1351	\N	\N		\N	\N	26V	UNICO DE IGAPO	A-34	30313	\N	MASCULINO	\N
1352	\N	\N		\N	\N	49	2 OFICIO DE NOTAS	54	40186	\N	MASCULINO	\N
1353	\N	\N		\N	\N	271	2 OFICIO DE NOTAS	54	4014	\N	FEMININO	\N
1354	\N	\N		\N	\N	141	2 OFICIO DE NOTAS		40495	\N	MASCULINO	\N
1633	\N	\N		\N	\N				55730	\N	MASCULINO	\N
1356	\N	\N		\N	\N	26	CARTORIO UNICO	A-11	13211	\N	FEMININO	\N
1357	\N	\N		\N	\N	254	2 CARTORIO DO REGISTRO CIVIL	A-07	7010	\N	FEMININO	\N
1358	\N	\N		\N	\N	3	CARTORIO UNICO	3	1985	\N	FEMININO	\N
1359	\N	\N		\N	\N	4	2 OFICIO DE NOTAS	62	44789	\N	MASCULINO	\N
1360	\N	\N		\N	\N	117	2 OFICIO DE NOTAS	A-45	29845	\N	MASCULINO	\N
1361	\N	\N		\N	\N	14	CARTORIO UNICO	A-09	8004	\N	FEMININO	\N
1362	\N	\N		\N	\N	197V	2 CARTORIO JUDUCIARIO	A-29	3782	\N	FEMININO	\N
1363	\N	\N		\N	\N	145	5 OFICIO DE NOTAS	A-303	159258	\N	MASCULINO	\N
1364	\N	\N		\N	\N	74	CARTORIO UNICO	2	1468	\N	FEMININO	\N
1365	\N	\N		\N	\N	41	2 OFICIO DE NOTAS	12	3653	\N	FEMININO	\N
1366	\N	\N		\N	\N	46	2 OFICIO DE NOTAS	251	31582	\N	MASCULINO	\N
1650	\N	\N		\N	\N				54255	\N	MASCULINO	\N
1367	\N	\N		\N	\N	123	UNICO DE IGAPO	A-39	35889	\N	MASCULINO	\N
1368	\N	\N		\N	\N	236	2 OFICIO DE NOTAS	17-A	1657	\N	FEMININO	\N
1369	\N	\N		\N	\N	265	1 CARTORIO	A-116	52639	\N	MASCULINO	\N
1370	\N	\N		\N	\N	50	UNICO DE IGAPO	41-B	17508	\N	FEMININO	\N
1371	\N	\N		\N	\N	13	2 OFICIO DE NOTAS	A-64	35953	\N	FEMININO	\N
1372	\N	\N		\N	\N	108	2 CARTORIO	234	47811	\N	FEMININO	\N
1657	\N	\N		\N	\N				54118	\N	FEMININO	\N
1373	\N	\N		\N	\N	24	CARTORIO UNICO	52	43489	\N	MASCULINO	\N
1374	\N	\N		\N	\N	237	2 OFICIO DE NOTAS	49	35125	\N	MASCULINO	\N
1375	\N	\N		\N	\N	78V	CARTORIO UNICO	A-9	5170	\N	MASCULINO	\N
1376	\N	\N		\N	\N	240V	2 CARTORIO JUDICIARIO	A-05	3354	\N	MASCULINO	\N
1377	\N	\N		\N	\N	79	14 CIRCUNSCRICAO DO REGISTRO CIVIL DAS PESSOAS NATURAIS	SAA-74	40584	\N	MASCULINO	\N
1378	\N	\N		\N	\N	283	2 OFICIO DE NOTAS	49	35130	\N	FEMININO	\N
1379	\N	\N		\N	\N	240	UNICO DE IGAPO	51	43323	\N	FEMININO	\N
1380	\N	\N		\N	\N	126	2 OFICIO DE NOTAS	64	45511	\N	FEMININO	\N
1381	\N	\N		\N	\N	3	2 OFICIO DE NOTAS	71	47497	\N	FEMININO	\N
1382	\N	\N		\N	\N	137	CARTORIO UNICO DO IGAPO	49	41899	\N	FEMININO	\N
1383	\N	\N		\N	\N	89	2 OFICIO DE NOTAS	87	52379	\N	FEMININO	\N
1384	\N	\N		\N	\N	101	4 OFICIO DE NOTAS	347	113645	\N	MASCULINO	\N
1385	\N	\N		\N	\N	281	2 CARTORIO JUDICIARIO	A - 19	19963	\N	MASCULINO	\N
1386	\N	\N		\N	\N	112	4 OFICIO DE NOTAS	383	124456	\N	FEMININO	\N
1387	\N	\N		\N	\N	113	5 OFICIO DE NOTAS	A - 385	244182	\N	MASCULINO	\N
1388	\N	\N		\N	\N	232	2 OFICIO DE NOTAS	66	46226	\N	FEMININO	\N
1389	\N	\N		\N	\N	148	2 OFICIO DE NOTAS	71	47642	\N	MASCULINO	\N
1390	\N	\N		\N	\N	94	2 OFICIO DE NOTAS	67	46388	\N	FEMININO	\N
1391	\N	\N		\N	\N	125	CARTORIO UNICO DO IGAPO	A - 55	45489	\N	MASCULINO	\N
1392	\N	\N		\N	\N	89	CARTORIO UNICO DE CAICARA DO RIO DOS VENTOS	5	3203	\N	MASCULINO	\N
1393	\N	\N		\N	\N	142	5 OFICIO DE NOTAS	A - 419	255205	\N	MASCULINO	\N
1394	\N	\N		\N	\N	10	2 OFICIO DE NOTAS	75	48701	\N	MASCULINO	\N
1395	\N	\N		\N	\N	143	2 OFICIO DE NOTAS	66	46137	\N	MASCULINO	\N
1396	\N	\N		\N	\N	152	2 OFICIO DE NOTAS	76	49143	\N	MASCULINO	\N
1397	\N	\N		\N	\N	32	CARTORIO UNICO JUDICIARIO	A - 12	14043	\N	FEMININO	\N
1398	\N	\N		\N	\N	31	2 OFICIO DE NOTAS	73	48125	\N	MASCULINO	\N
1399	\N	\N		\N	\N	135	5 OFICIO DE NOTAS	A - 417	254598	\N	FEMININO	\N
1400	\N	\N		\N	\N	171	5 OFICIO DE NOTAS	A - 396	248410	\N	FEMININO	\N
1401	\N	\N		\N	\N	216	2 OFICIO DE NOTAS	70	47410	\N	MASCULINO	\N
1402	\N	\N		\N	\N	179	CARTORIO UNICO DO IGAPO	51	43199	\N	FEMININO	\N
1403	\N	\N		\N	\N	22	2 OFICIO DE NOTAS	70	47216	\N	MASCULINO	\N
1404	\N	\N		\N	\N	286	4 OFICIO DE NOTAS	A - 339	111430	\N	MASCULINO	\N
1405	\N	\N		\N	\N	175	4 OFICIO DE NOTAS	341	111919	\N	MASCULINO	\N
1406	\N	\N		\N	\N	94	5 OFICIO DE NOTAS	A - 433	259357	\N	MASCULINO	\N
1407	\N	\N		\N	\N	1	2 OFICIO DE NOTAS	78	49592	\N	FEMININO	\N
1408	\N	\N		\N	\N	220 - U	3 DISTRITO JUDICIARIO DE PAULISTA	30 - A	14066	\N	FEMININO	\N
1409	\N	\N		\N	\N	259	4 OFICIO DE NOTAS	A - 325	107301	\N	MASCULINO	\N
1410	\N	\N		\N	\N	231	4 OFICIO DE NOTAS	327	107873	\N	FEMININO	\N
1411	\N	\N		\N	\N	289	2 OFICIO DE NOTAS	68	46883	\N	MASCULINO	\N
1412	\N	\N		\N	\N	299	2 OFICIO DE NOTAS	65	45984	\N	MASCULINO	\N
1413	\N	\N		\N	\N	171	CARTORIO UNICO DO IGAPO	A - 45	39594	\N	FEMININO	\N
1414	\N	\N		\N	\N	25	2 OFICIO DE SANTA CRUZ	A - 104	27633	\N	MASCULINO	\N
1415	\N	\N		\N	\N	18	CARTORIO UNICO DE RAFAEL FERNANDES	A - V	2760	\N	FEMININO	\N
1416	\N	\N		\N	\N	77	4 OFICIO DE NOTAS	339	111221	\N	MASCULINO	\N
1417	\N	\N		\N	\N	56	2 OFICIO DE NOTAS	67	46350	\N	MASCULINO	\N
1418	\N	\N		\N	\N	296	2 OFICIO DE NOTAS	66	46290	\N	MASCULINO	\N
1419	\N	\N		\N	\N	129	1 RESGISTRO CIVIL E TABELIONATO DE NOTAS	A - 216	185565	\N	FEMININO	\N
1420	\N	\N		\N	\N	20	2 OFICIO DE NOTAS	66 - A	46014	\N	MASCULINO	\N
1421	\N	\N		\N	\N	222	2 OFICIO DE NOTAS	68	46816	\N	FEMININO	\N
1422	\N	\N		\N	\N	189	OFICIO DE NOTAS E REGISTROS	A - 42	29798	\N	MASCULINO	\N
1423	\N	\N		\N	\N	227	4 OFICIO DE NOTAS	354	115871	\N	FEMININO	\N
1424	\N	\N		\N	\N	171	2 OFICIO DE NOTAS	69	47065	\N	FEMININO	\N
1425	\N	\N		\N	\N	147	5 OFICIO DE NOTAS	A - 423	256410	\N	MASCULINO	\N
1426	\N	\N		\N	\N	199	2 OFICIO DE NOTAS	65	45884	\N	MASCULINO	\N
1427	\N	\N		\N	\N	221	2 OFICIO DE NOTAS	64	45606	\N	FEMININO	\N
1428	\N	\N		\N	\N	A - 28	CARTORIO UNICO DO IGAPO	86	13952	\N	MASCULINO	\N
1429	\N	\N		\N	\N	291	2 OFICIO DE NOTAS	65	45976	\N	MASCULINO	\N
1430	\N	\N		\N	\N	107	CARTORIO UNICO	68	25969	\N	FEMININO	\N
1431	\N	\N		\N	\N	131	CARTORIO UNICO DO IGAPO	A - 49	41887	\N	MASCULINO	\N
1432	\N	\N		\N	\N	211	5 OFICIO DE NOTAS	A - 422	256174	\N	FEMININO	\N
1433	\N	\N		\N	\N	155 - U	CARTORIO UNICO DO IGAPO	A - 69	53946	\N	MASCULINO	\N
1434	\N	\N		\N	\N	183	CARTORIO UNICO DO IGAPO	47	40820	\N	MASCULINO	\N
1435	\N	\N		\N	\N	291	CARTORIO UNICO DO IGAPO	A - 41	37428	\N	FEMININO	\N
1436	\N	\N		\N	\N	214	2 OFICIO DE NOTAS	67	46508	\N	MASCULINO	\N
1437	\N	\N		\N	\N	314	OFICIO DO REGISTRO CIVIL	44	28265	\N	FEMININO	\N
1438	\N	\N		\N	\N	233	2 OFICIO DE NOTAS	66	46227	\N	MASCULINO	\N
1439	\N	\N		\N	\N	210	CARTORIO UNICO DO IGAPO	50	42661	\N	FEMININO	\N
1440	\N	\N		\N	\N	29	CARTORIO UNICO DO IGAPO	54	44696	\N	FEMININO	\N
1441	\N	\N		\N	\N	112	2 OFICIO DE NOTAS	63	45197	\N	MASCULINO	\N
1442	\N	\N		\N	\N	285	5 OFICIO DE NOTAS	A - 371	237406	\N	FEMININO	\N
1443	\N	\N		\N	\N	27	2 CARTORIO JUDICIARIO	61	44515	\N	MASCULINO	\N
1444	\N	\N		\N	\N	193	2 CARTORIO JUDICIARIO	70	47387	\N	MASCULINO	\N
1445	\N	\N		\N	\N	108 - V	2 OFICIO DE NOTAS	A - 46	29731	\N	MASCULINO	\N
1446	\N	\N		\N	\N	241	2 OFICIO DE NOTAS	65	45926	\N	FEMININO	\N
1447	\N	\N		\N	\N	93	OFICIO DE NOTAS DE REGISTRO	A - 38	28902	\N	MASCULINO	\N
1448	\N	\N		\N	\N	82	2 OFICIO DE NOTAS	65	45767	\N	MASCULINO	\N
1449	\N	\N		\N	\N	66	2 OFICIO DE NOTAS	72	47860	\N	MASCULINO	\N
1646	\N	\N		\N	\N				56086	\N	MASCULINO	\N
1450	\N	\N		\N	\N	180	2 CARTORIO JUDICIARIO	59	44165	\N	MASCULINO	\N
1451	\N	\N		\N	\N	249	2 OFICIO DE NOTAS	67	46543	\N	FEMININO	\N
1651	\N	\N		\N	\N				53079	\N	MASCULINO	\N
1452	\N	\N		\N	\N	178	5 OFICIO DE NOTAS	A - 392	246824	\N	FEMININO	\N
1453	\N	\N		\N	\N	207	CARTORIO UNICO DO IGAPO	46	40266	\N	FEMININO	\N
1454	\N	\N		\N	\N	63 - V	CARTORIO UNICO DE MAXARANGUAPE	A - 31	25874	\N	FEMININO	\N
1455	\N	\N		\N	\N	142	CARTORIO JUDICIARIO	17	9716	\N	FEMININO	\N
1456	\N	\N		\N	\N	13	2 OFICIO DE NOTAS	82	50804	\N	MASCULINO	\N
1457	\N	\N		\N	\N	288	3 OFICIO DE NOTAS	A - 0002	588	\N	MASCULINO	\N
1458	\N	\N		\N	\N	233	2 OFICIO DE NOTAS	81	50724	\N	FEMININO	\N
1658	\N	\N		\N	\N				54293	\N	FEMININO	\N
1459	\N	\N		\N	\N	216	2 OFICIO DE NOTAS	64	45601	\N	FEMININO	\N
1460	\N	\N		\N	\N	209	1 OFICIO DE NOTAS	17	12244	\N	MASCULINO	\N
1461	\N	\N		\N	\N	181	2 CARTORIO JUDICIARIO	61	44666	\N	MASCULINO	\N
1462	\N	\N		\N	\N	55	5 OFICIO DE NOTAS	A - 384	243824	\N	FEMININO	\N
1463	\N	\N		\N	\N	198	2 CARTORIO JUDICIARIO	55	42984	\N	MASCULINO	\N
1464	\N	\N		\N	\N	220	2 OFICIO DE NOTAS	65	45905	\N	MASCULINO	\N
1465	\N	\N		\N	\N	282	4 OFICIO DE NOTAS	A - 353	115626	\N	MASCULINO	\N
1466	\N	\N		\N	\N	36 - V	2 CARTORIO JUDICIARIO	53	39484	\N	MASCULINO	\N
1467	\N	\N		\N	\N	59	2 CARTORIO JUDICIARIO	55	42845	\N	MASCULINO	\N
1468	\N	\N		\N	\N	124	CARTORIODE OFICIO DE REGISTRO CIVIL	A - 197	118463	\N	MASCULINO	\N
1469	\N	\N		\N	\N	37	CARTORIO UNICO	A - 12	9001	\N	MASCULINO	\N
1470	\N	\N		\N	\N	139	2 CARTORIO JUDICIARIO	61	44624	\N	MASCULINO	\N
1471	\N	\N		\N	\N	11 - V	2 CARTORIO JUDICIARIO	A - 98	25353	\N	FEMININO	\N
1472	\N	\N		\N	\N	8 - V	4 OFICIO DE NOTAS	A - 306	96483	\N	MASCULINO	\N
1473	\N	\N		\N	\N	243	CARTORIO UNICO DO IGAPO	40	36728	\N	MASCULINO	\N
1474	\N	\N		\N	\N	232	2 OFICIO DE NOTAS	81	50723	\N	MASCULINO	\N
1475	\N	\N		\N	\N	196	2 CARTORIO DE OFICIO	41	26161	\N	FEMININO	\N
1476	\N	\N		\N	\N	263	2 OFICIO DE NOTAS	54	40983	\N	MASCULINO	\N
1477	\N	\N		\N	\N	80	CARTORIO UNICO DO IGAPO	A - 50	42401	\N	MASCULINO	\N
1478	\N	\N		\N	\N	2 - V	2 CARTORIO JUDICIARIO	53	38347	\N	FEMININO	\N
1479	\N	\N		\N	\N	149	2 CARTORIO JUDICIARIO	54	40528	\N	MASCULINO	\N
1480	\N	\N		\N	\N	216	CARTORIO UNICO DO IGAPO	36	32692	\N	MASCULINO	\N
1481	\N	\N		\N	\N	197 - U	CARTORIO DE REGISTRO CIVIL	96	39321	\N	FEMININO	\N
1482	\N	\N		\N	\N	61 - V	2 OFICIO DE NOTAS		40173	\N	FEMININO	\N
1483	\N	\N		\N	\N	225 - V	CARTORIO UNICO DO IGAPO	33	29910	\N	MASCULINO	\N
1484	\N	\N		\N	\N	258	CARTORIO UNICO DO IGAPO	A - 45	39767	\N	MASCULINO	\N
1485	\N	\N		\N	\N	230	2 CARTORIO JUDICIARIO	57	43616	\N	MASCULINO	\N
1486	\N	\N		\N	\N	32	2 OFICIO DE NOTAS	73 - A	48126	\N	FEMININO	\N
1487	\N	\N		\N	\N	213 - V	REGISTRO CIVIL DAS PESSOAS NATURAIS	A - 078	38472	\N	MASCULINO	\N
1488	\N	\N		\N	\N	26	CARTORIO DE REGISTRO CIVIL	A - 46	62175	\N	MASCULINO	\N
1489	\N	\N		\N	\N	276	2 CARTORIO JUDICIARIO	62	45061	\N	FEMININO	\N
1490	\N	\N		\N	\N	24	2 CARTORIO JUDICIARIO	56	43110	\N	MASCULINO	\N
1491	\N	\N		\N	\N	44	2 CARTORIO OFICIO DE NOTAS	71	47538	\N	MASCULINO	\N
1492	\N	\N		\N	\N	111	CARTORIO UNICO DO IGAPO	34	30651	\N	MASCULINO	\N
1493	\N	\N		\N	\N	242	2 OFICIO DE NOTAS	78	49832	\N	FEMININO	\N
1494	\N	\N		\N	\N	43 - V	5 OFICIO DE NOTAS	357	220642	\N	MASCULINO	\N
1495	\N	\N		\N	\N	258 - V	4 OFICIO DE NOTAS	A - 309	101084	\N	FEMININO	\N
1496	\N	\N		\N	\N	32	5 OFICIO DE NOTAS	369	233995	\N	MASCULINO	\N
1497	\N	\N		\N	\N	20	2 CARTORIO JUDICIARIO	54	40070	\N	FEMININO	\N
1498	\N	\N		\N	\N	7	2 OFICIO DE NOTAS	63	45092	\N	FEMININO	\N
1499	\N	\N		\N	\N	195	CARTORIO UNICO DO IGAPO	53	44430	\N	MASCULINO	\N
1500	\N	\N		\N	\N	49	2 CARTORIO JUDICIARIO	54	40185	\N	MASCULINO	\N
1501	\N	\N		\N	\N	202	2 OFICIO DE NOTAS	54	40735	\N	MASCULINO	\N
1502	\N	\N		\N	\N	124	CARTORIO UNICO ALTO DO RODRIGUES	A - 12	5634	\N	FEMININO	\N
1503	\N	\N		\N	\N	280	CARTORIO UNICO	A - 06	4568	\N	FEMININO	\N
1504	\N	\N		\N	\N	111	2 OFICIO DE NOTAS	89	53001	\N	MASCULINO	\N
1505	\N	\N		\N	\N	227		A - 8	9278	\N	FEMININO	\N
1506	\N	\N		\N	\N	126	2 CARTORIO JUDICIARIO	66	46129	\N	MASCULINO	\N
1507	\N	\N		\N	\N	77 - V	2 CARTORIO JUDICIARIO	54	40242	\N	MASCULINO	\N
1508	\N	\N		\N	\N	194	5 OFICIO DE NOTAS	A - 370	235842	\N	FEMININO	\N
1509	\N	\N		\N	\N	187	2 CARTORIO JUDICIARIO	148	69539	\N	FEMININO	\N
1510	\N	\N		\N	\N	339	CARTORIO UNICO DO IGAPO	A -50	42918	\N	FEMININO	\N
1511	\N	\N		\N	\N	131	2 CARTORIO JUDICIARIO	56	43217	\N	FEMININO	\N
1512	\N	\N		\N	\N	278 - U	4 OFICIO DE NOTAS	310	102 355	\N	FEMININO	\N
1513	\N	\N		\N	\N	68	2 CARTORIO JUDICIARIO	54	40202	\N	FEMININO	\N
1514	\N	\N		\N	\N	238	CARTORIO UNICO DO IGAPO	43	38521	\N	MASCULINO	\N
1515	\N	\N		\N	\N	58	CARTORIO JUDICIARIO	11	13341	\N	MASCULINO	\N
1516	\N	\N		\N	\N	265	2 CARTORIO JUDICIARIO	56	43351	\N	FEMININO	\N
1517	\N	\N		\N	\N	194	4 OFICIO DE NOTAS	338	111038	\N	FEMININO	\N
1518	\N	\N		\N	\N	223	2 CARTORIO JUDICIARIO	54	40822	\N	MASCULINO	\N
1519	\N	\N		\N	\N	123	2 CARTORIO JUDICIARIO	56	43209	\N	MASCULINO	\N
1520	\N	\N		\N	\N	106	2 CARTORIO JUDICIARIO	65	45791	\N	FEMININO	\N
1521	\N	\N		\N	\N	88	2 CARTORIO JUDICIARIO	54	40286	\N	FEMININO	\N
1522	\N	\N		\N	\N	86 - U	2 CARTORIO JUDICIARIO	54	40278	\N	MASCULINO	\N
1523	\N	\N		\N	\N	256 - V	5 OFICIO DE NOTAS	371	237292	\N	FEMININO	\N
1524	\N	\N		\N	\N	99	2 CARTORIO JUDICIARIO	57	43485	\N	MASCULINO	\N
1525	\N	\N		\N	\N	91	2 OFICIO DE NOTAS	63	45176	\N	MASCULINO	\N
1526	\N	\N		\N	\N	80	CARTORIO UNICO DO IGAPO	27	24599	\N	FEMININO	\N
1527	\N	\N		\N	\N	19	2 OFICIO DE NOTAS	58	43705	\N	MASCULINO	\N
1528	\N	\N		\N	\N	284	2 CARTORIO JUDICIARIO	53	40325	\N	FEMININO	\N
1529	\N	\N		\N	\N	197	5 CARTORIO DE NOTAS	356	220059	\N	MASCULINO	\N
1530	\N	\N		\N	\N	96	14 SUBDISTRITO	A - 248	148325	\N	FEMININO	\N
1531	\N	\N		\N	\N	257	2 OFICIO DE NOTAS	51	37981	\N	FEMININO	\N
1532	\N	\N		\N	\N	171	CARTORIO UNICO JUDICIARIO	A - 8	4942	\N	MASCULINO	\N
1533	\N	\N		\N	\N	10	2 OFICIO DE NOTAS	55	42794	\N	MASCULINO	\N
1534	\N	\N		\N	\N	150	CARTORIO UNICO JUDICIARIO	A - 11	6124	\N	FEMININO	\N
1535	\N	\N		\N	\N	93	CARTORIO UNICO DO IGAPO	A - 28	25848	\N	FEMININO	\N
1536	\N	\N		\N	\N	48	2 CARTORIO JUDICIARIO	53	39499	\N	MASCULINO	\N
1537	\N	\N		\N	\N	198	4 OFICIO DE NOTAS	304	94844	\N	MASCULINO	\N
1538	\N	\N		\N	\N	69	CARTORIO UNICO DO IGAPO	27	24553	\N	FEMININO	\N
1539	\N	\N		\N	\N	20	2 CARTORIO JUDICIARIO	53	39420	\N	MASCULINO	\N
1540	\N	\N		\N	\N	69	5 OFICIO DE NOTAS	A - 364	228144	\N	FEMININO	\N
1541	\N	\N		\N	\N	229	OFICIO DE NOTAS	44	30856	\N	MASCULINO	\N
1542	\N	\N		\N	\N	47	2 CARTORIO JUDICIARIO	52	38309	\N	FEMININO	\N
1543	\N	\N		\N	\N	206	2 OFICIO DE NOTAS	53	40982	\N	FEMININO	\N
1544	\N	\N		\N	\N	231	2 OFICIO DE NOTAS	53	40081	\N	FEMININO	\N
1545	\N	\N		\N	\N	181	2 OFICIO DE NOTAS	53	39981	\N	FEMININO	\N
1546	\N	\N		\N	\N	80	CARTORIO UNICO DO IGAPO	35 - A	31744	\N	FEMININO	\N
1547	\N	\N		\N	\N	91	2 CARTORIO JUDICIARIO	52	38497	\N	MASCULINO	\N
1548	\N	\N		\N	\N	124	4 OFICIO DE NOTAS	A - 333	109467	\N	FEMININO	\N
1549	\N	\N		\N	\N	262	5 OFICIO DE NOTAS	363	227715	\N	FEMININO	\N
1550	\N	\N		\N	\N		2 OFICIO DE NOTAS			\N	MASCULINO	\N
1551	\N	\N		\N	\N	210	CARTORIO DE REGISTRO CIVIL	A - 294	233105	\N	MASCULINO	\N
1552	\N	\N		\N	\N	253	CARTORIO DE NATAL	A - 16	1564	\N	MASCULINO	\N
1553	\N	\N		\N	\N	270	CARTORIO UNICO DO IGAPO	B - 23	7796	\N	MASCULINO	\N
1554	\N	\N		\N	\N	139	1 CATORIO	3	2390	\N	FEMININO	\N
1555	\N	\N		\N	\N	48	2 OFICIO DE NOTAS	29	12367	\N	FEMININO	\N
1556	\N	\N		\N	\N	300	2 CARTORIO JUDICIARIO	A -068	16729	\N	FEMININO	\N
1557	\N	\N		\N	\N	102	5 CARTORIO	33 -B	1747	\N	MASCULINO	\N
1558	\N	\N		\N	\N	12	2 OFICIO DE NOTAS	A - 30	17915	\N	MASCULINO	\N
1559	\N	\N		\N	\N	117		A - 06		\N	MASCULINO	\N
1560	\N	\N		\N	\N	212	2 CARTORIO	47	35598	\N	FEMININO	\N
1561	\N	\N		\N	\N	206	2 CARTORIO JUDICIARIO	27	11201	\N	FEMININO	\N
1562	\N	\N		\N	\N	249	2 CARTORIO	16	3140	\N	FEMININO	\N
1563	\N	\N		\N	\N	269	2 CARTORIO JUDICIARIO	A -35	5198	\N	FEMININO	\N
1564	\N	\N		\N	\N	273	2 CARTORIO JUDICIARIO	A - 03	1064	\N	FEMININO	\N
1565	\N	\N		\N	\N	2	2 CARTORIO JUDICIARIO	36	5331	\N	MASCULINO	\N
1566	\N	\N		\N	\N	169	4 OFICIO DE NOTAS	74	14950	\N	MASCULINO	\N
1567	\N	\N		\N	\N	265	2 CARTORIO JUDICIARIO	4	3451	\N	MASCULINO	\N
1568	\N	\N		\N	\N	246	2 CARTORIO JUDICIARIO	67	6446	\N	FEMININO	\N
1569	\N	\N		\N	\N				093906015520101001190840059074-54	\N	FEMININO	\N
1570	\N	\N		\N	\N				57164	\N	MASCULINO	\N
1571	\N	\N		\N	\N				09564601552010100027289001854739	\N	FEMININO	\N
1572	\N	\N		\N	\N				58144	\N	MASCULINO	\N
1573	\N	\N		\N	\N				58342	\N	FEMININO	\N
1574	\N	\N		\N	\N				58016	\N	FEMININO	\N
1575	\N	\N		\N	\N				09390601552010100119033005902346	\N	FEMININO	\N
1576	\N	\N		\N	\N				57150	\N	FEMININO	\N
1577	\N	\N		\N	\N				58613	\N	MASCULINO	\N
1578	\N	\N		\N	\N				56839	\N	MASCULINO	\N
1579	\N	\N		\N	\N				58365	\N	FEMININO	\N
1580	\N	\N		\N	\N				58190	\N	MASCULINO	\N
1581	\N	\N		\N	\N				57544	\N	FEMININO	\N
1582	\N	\N		\N	\N				09390601552011100127083006067320	\N	MASCULINO	\N
1583	\N	\N		\N	\N				09390601552010100119161005915151	\N	FEMININO	\N
1584	\N	\N		\N	\N				58673	\N	MASCULINO	\N
1585	\N	\N		\N	\N				58762	\N	FEMININO	\N
1586	\N	\N		\N	\N				58329	\N	MASCULINO	\N
1587	\N	\N		\N	\N				09462301552010100008130000596114	\N	MASCULINO	\N
1588	\N	\N		\N	\N				15120	\N	MASCULINO	\N
1589	\N	\N		\N	\N				16125	\N	MASCULINO	\N
1590	\N	\N		\N	\N				57960	\N	MASCULINO	\N
1591	\N	\N		\N	\N				294131	\N	MASCULINO	\N
1592	\N	\N		\N	\N				133374	\N	MASCULINO	\N
1593	\N	\N		\N	\N				294130	\N	MASCULINO	\N
1594	\N	\N		\N	\N				290109	\N	MASCULINO	\N
1595	\N	\N		\N	\N				287144	\N	FEMININO	\N
1596	\N	\N		\N	\N				68586	\N	MASCULINO	\N
1597	\N	\N		\N	\N				56401	\N	MASCULINO	\N
1598	\N	\N		\N	\N				6144	\N	FEMININO	\N
1599	\N	\N		\N	\N				55020	\N	MASCULINO	\N
1600	\N	\N		\N	\N				55145	\N	MASCULINO	\N
1601	\N	\N		\N	\N				58195	\N	MASCULINO	\N
1602	\N	\N		\N	\N				55410	\N	FEMININO	\N
1603	\N	\N		\N	\N				8777	\N	MASCULINO	\N
1604	\N	\N		\N	\N				56254	\N	MASCULINO	\N
1605	\N	\N		\N	\N				16565	\N	MASCULINO	\N
1606	\N	\N		\N	\N				55184	\N	FEMININO	\N
1607	\N	\N		\N	\N				56403	\N	MASCULINO	\N
1608	\N	\N		\N	\N				56587	\N	FEMININO	\N
1609	\N	\N		\N	\N				14120	\N	FEMININO	\N
1610	\N	\N		\N	\N				285599	\N	FEMININO	\N
1611	\N	\N		\N	\N				3147485	\N	FEMININO	\N
1612	\N	\N		\N	\N				56514	\N	MASCULINO	\N
1613	\N	\N		\N	\N				54888	\N	FEMININO	\N
1614	\N	\N		\N	\N				285856	\N	MASCULINO	\N
1615	\N	\N		\N	\N				09390601552007100101184005557473	\N	MASCULINO	\N
1616	\N	\N		\N	\N				54995	\N	MASCULINO	\N
1617	\N	\N		\N	\N				3240857	\N	MASCULINO	\N
1618	\N	\N		\N	\N				288404	\N	MASCULINO	\N
1619	\N	\N		\N	\N				17756	\N	FEMININO	\N
1620	\N	\N		\N	\N				55553	\N	FEMININO	\N
1621	\N	\N		\N	\N				55655	\N	FEMININO	\N
1622	\N	\N		\N	\N				55968	\N	FEMININO	\N
1623	\N	\N		\N	\N				55398	\N	MASCULINO	\N
1624	\N	\N		\N	\N				53733	\N	FEMININO	\N
1625	\N	\N		\N	\N				56774	\N	FEMININO	\N
1626	\N	\N		\N	\N				55946	\N	MASCULINO	\N
1627	\N	\N		\N	\N				55796	\N	FEMININO	\N
1628	\N	\N		\N	\N				53515	\N	MASCULINO	\N
1629	\N	\N		\N	\N				65178	\N	FEMININO	\N
1630	\N	\N		\N	\N				55667	\N	MASCULINO	\N
1631	\N	\N		\N	\N				56251	\N	FEMININO	\N
1632	\N	\N		\N	\N				21435	\N	FEMININO	\N
1635	\N	\N		\N	\N				56008	\N	MASCULINO	\N
1636	\N	\N		\N	\N					\N	FEMININO	\N
1637	\N	\N		\N	\N				54894	\N	FEMININO	\N
1638	\N	\N		\N	\N				53624	\N	FEMININO	\N
1639	\N	\N		\N	\N				55389	\N	FEMININO	\N
1640	\N	\N		\N	\N				40517	\N	FEMININO	\N
1641	\N	\N		\N	\N				53705	\N	FEMININO	\N
1642	\N	\N		\N	\N				54205	\N	FEMININO	\N
1643	\N	\N		\N	\N				09390601552011100127165006075529	\N	MASCULINO	\N
1647	\N	\N		\N	\N				54698	\N	MASCULINO	\N
1648	\N	\N		\N	\N				54307	\N	MASCULINO	\N
1649	\N	\N		\N	\N				53034	\N	MASCULINO	\N
1654	\N	\N		\N	\N				28315	\N	MASCULINO	\N
1655	\N	\N		\N	\N				54517	\N	FEMININO	\N
1659	\N	\N		\N	\N				53107	\N	MASCULINO	\N
1660	\N	\N		\N	\N				283151	\N	FEMININO	\N
1661	\N	\N		\N	\N				09498701552006100406193013143756	\N	MASCULINO	\N
1662	\N	\N		\N	\N				57318	\N	MASCULINO	\N
1663	\N	\N		\N	\N				53589	\N	MASCULINO	\N
1664	\N	\N		\N	\N				282975	\N	FEMININO	\N
1665	\N	\N		\N	\N				54531	\N	MASCULINO	\N
1666	\N	\N		\N	\N				17546	\N	FEMININO	\N
1667	\N	\N		\N	\N				51822	\N	FEMININO	\N
1668	\N	\N		\N	\N				54688	\N	FEMININO	\N
1669	\N	\N		\N	\N				52660	\N	MASCULINO	\N
1670	\N	\N		\N	\N				60859	\N	MASCULINO	\N
1671	\N	\N		\N	\N				54002	\N	MASCULINO	\N
1672	\N	\N		\N	\N				09499501552007100517144028460778	\N	MASCULINO	\N
1673	\N	\N		\N	\N				61176	\N	MASCULINO	\N
1674	\N	\N		\N	\N				286559	\N	MASCULINO	\N
1675	\N	\N		\N	\N				39756	\N	MASCULINO	\N
1676	\N	\N		\N	\N				54135	\N	MASCULINO	\N
1677	\N	\N		\N	\N				53797	\N	MASCULINO	\N
1678	\N	\N		\N	\N				23073	\N	MASCULINO	\N
1679	\N	\N		\N	\N				54265	\N	MASCULINO	\N
1680	\N	\N		\N	\N				53879	\N	MASCULINO	\N
1681	\N	\N		\N	\N				53929	\N	MASCULINO	\N
1682	\N	\N		\N	\N				64087	\N	FEMININO	\N
1683	\N	\N		\N	\N				51048	\N	MASCULINO	\N
1684	\N	\N		\N	\N				54647	\N	MASCULINO	\N
1685	\N	\N		\N	\N				284250	\N	MASCULINO	\N
1686	\N	\N		\N	\N				54741	\N	FEMININO	\N
1687	\N	\N		\N	\N				53793	\N	FEMININO	\N
1688	\N	\N		\N	\N				59341	\N	MASCULINO	\N
1689	\N	\N		\N	\N				55452	\N	MASCULINO	\N
1690	\N	\N		\N	\N				55466	\N	MASCULINO	\N
1691	\N	\N		\N	\N				55276	\N	MASCULINO	\N
1692	\N	\N		\N	\N				54231	\N	MASCULINO	\N
1693	\N	\N		\N	\N				54083	\N	MASCULINO	\N
1694	\N	\N		\N	\N				14937	\N	FEMININO	\N
1695	\N	\N		\N	\N				53106	\N	FEMININO	\N
1696	\N	\N		\N	\N				53390	\N	MASCULINO	\N
1697	\N	\N		\N	\N				275929	\N	MASCULINO	\N
1698	\N	\N		\N	\N				3097918	\N	MASCULINO	\N
1699	\N	\N		\N	\N				52896	\N	FEMININO	\N
1700	\N	\N		\N	\N				50964	\N	FEMININO	\N
1701	\N	\N		\N	\N				3564385	\N	FEMININO	\N
1702	\N	\N		\N	\N				52716	\N	MASCULINO	\N
1703	\N	\N		\N	\N				13589	\N	FEMININO	\N
1704	\N	\N		\N	\N				52296	\N	MASCULINO	\N
1705	\N	\N		\N	\N				275773	\N	MASCULINO	\N
1706	\N	\N		\N	\N				127606	\N	FEMININO	\N
1707	\N	\N		\N	\N				52047	\N	FEMININO	\N
1708	\N	\N		\N	\N				59442	\N	MASCULINO	\N
1709	\N	\N		\N	\N				274752	\N	MASCULINO	\N
1710	\N	\N		\N	\N				32407	\N	FEMININO	\N
1711	\N	\N		\N	\N				54509	\N	MASCULINO	\N
1712	\N	\N		\N	\N				51879	\N	FEMININO	\N
1713	\N	\N		\N	\N				52931	\N	MASCULINO	\N
1714	\N	\N		\N	\N				279565	\N	FEMININO	\N
1715	\N	\N		\N	\N				48115	\N	MASCULINO	\N
1716	\N	\N		\N	\N				52377	\N	MASCULINO	\N
1717	\N	\N		\N	\N				16555	\N	FEMININO	\N
1718	\N	\N		\N	\N				17238	\N	FEMININO	\N
1719	\N	\N		\N	\N				54971	\N	FEMININO	\N
1720	\N	\N		\N	\N				61921	\N	MASCULINO	\N
1721	\N	\N		\N	\N				57589	\N	FEMININO	\N
1722	\N	\N		\N	\N				70533	\N	FEMININO	\N
1723	\N	\N		\N	\N				297322	\N	MASCULINO	\N
1724	\N	\N		\N	\N				137744	\N	MASCULINO	\N
1725	\N	\N		\N	\N				11556801552010100288240017290456	\N	FEMININO	\N
1726	\N	\N		\N	\N				4308	\N	MASCULINO	\N
1727	\N	\N		\N	\N				17107	\N	FEMININO	\N
1728	\N	\N		\N	\N				72033	\N	MASCULINO	\N
1729	\N	\N		\N	\N				09390601552010100118155005894532	\N	MASCULINO	\N
1730	\N	\N		\N	\N				57886	\N	MASCULINO	\N
1731	\N	\N		\N	\N				09390601552008100106126005651629	\N	MASCULINO	\N
1732	\N	\N		\N	\N				58129	\N	FEMININO	\N
1733	\N	\N		\N	\N				57163	\N	MASCULINO	\N
1734	\N	\N		\N	\N				56288	\N	FEMININO	\N
1735	\N	\N		\N	\N				56696	\N	FEMININO	\N
1736	\N	\N		\N	\N				09390601552010100121118005950850	\N	FEMININO	\N
1737	\N	\N		\N	\N				09390601552010100118015005880540	\N	FEMININO	\N
1738	\N	\N		\N	\N				09537201552010100113048004273905	\N	MASCULINO	\N
1739	\N	\N		\N	\N				14809801552010100130045005710746	\N	MASCULINO	\N
1740	\N	\N		\N	\N				57842	\N	MASCULINO	\N
1741	\N	\N		\N	\N				09499501552010100568088029985337	\N	FEMININO	\N
1742	\N	\N		\N	\N				57983	\N	FEMININO	\N
1743	\N	\N		\N	\N				50743	\N	MASCULINO	\N
1744	\N	\N		\N	\N				52937	\N	FEMININO	\N
1745	\N	\N		\N	\N				279376	\N	MASCULINO	\N
1746	\N	\N		\N	\N				51892	\N	FEMININO	\N
1747	\N	\N		\N	\N				264402	\N	MASCULINO	\N
1748	\N	\N		\N	\N				49816	\N	MASCULINO	\N
1749	\N	\N		\N	\N				95285	\N	MASCULINO	\N
1750	\N	\N		\N	\N				53008	\N	FEMININO	\N
1751	\N	\N		\N	\N				53275	\N	MASCULINO	\N
1752	\N	\N		\N	\N				58077	\N	FEMININO	\N
1753	\N	\N		\N	\N				33736	\N	MASCULINO	\N
1754	\N	\N		\N	\N				50967	\N	FEMININO	\N
1755	\N	\N		\N	\N				30048	\N	FEMININO	\N
1756	\N	\N		\N	\N				59377	\N	FEMININO	\N
1757	\N	\N		\N	\N				276740	\N	MASCULINO	\N
1758	\N	\N		\N	\N				52362	\N	MASCULINO	\N
1759	\N	\N		\N	\N				17174	\N	MASCULINO	\N
1760	\N	\N		\N	\N				288498	\N	MASCULINO	\N
1761	\N	\N		\N	\N				51267	\N	MASCULINO	\N
1762	\N	\N		\N	\N				288499	\N	MASCULINO	\N
1763	\N	\N		\N	\N				50431	\N	MASCULINO	\N
1764	\N	\N		\N	\N				270935	\N	MASCULINO	\N
1765	\N	\N		\N	\N				270753	\N	FEMININO	\N
1766	\N	\N		\N	\N				16632	\N	MASCULINO	\N
1767	\N	\N		\N	\N				50889	\N	MASCULINO	\N
1768	\N	\N		\N	\N				2813313	\N	FEMININO	\N
1769	\N	\N		\N	\N				50217	\N	FEMININO	\N
1770	\N	\N		\N	\N				50915	\N	MASCULINO	\N
1771	\N	\N		\N	\N				52074	\N	MASCULINO	\N
1772	\N	\N		\N	\N				7027	\N	MASCULINO	\N
1773	\N	\N		\N	\N				50411	\N	MASCULINO	\N
1774	\N	\N		\N	\N				4062	\N	MASCULINO	\N
1775	\N	\N		\N	\N				273418	\N	MASCULINO	\N
1776	\N	\N		\N	\N				37671	\N	FEMININO	\N
1777	\N	\N		\N	\N				51488	\N	FEMININO	\N
1778	\N	\N		\N	\N				123679	\N	FEMININO	\N
1779	\N	\N		\N	\N				51687	\N	FEMININO	\N
1780	\N	\N		\N	\N				9534	\N	MASCULINO	\N
1781	\N	\N		\N	\N				51061	\N	MASCULINO	\N
1782	\N	\N		\N	\N				270421	\N	FEMININO	\N
1783	\N	\N		\N	\N				55544	\N	FEMININO	\N
1784	\N	\N		\N	\N				51160	\N	FEMININO	\N
1785	\N	\N		\N	\N				51161	\N	FEMININO	\N
1786	\N	\N		\N	\N				28156	\N	FEMININO	\N
1787	\N	\N		\N	\N				272070	\N	FEMININO	\N
1788	\N	\N		\N	\N				47696	\N	FEMININO	\N
1789	\N	\N		\N	\N				48806	\N	MASCULINO	\N
1790	\N	\N		\N	\N				09390601552002100073025004811979	\N	FEMININO	\N
1791	\N	\N		\N	\N				8954	\N	FEMININO	\N
1792	\N	\N		\N	\N				51794	\N	FEMININO	\N
1793	\N	\N		\N	\N				5116	\N	FEMININO	\N
1794	\N	\N		\N	\N				47934	\N	FEMININO	\N
1795	\N	\N		\N	\N				50435	\N	FEMININO	\N
1796	\N	\N		\N	\N				9179	\N	FEMININO	\N
1797	\N	\N		\N	\N				36149	\N	MASCULINO	\N
1798	\N	\N		\N	\N				51536	\N	MASCULINO	\N
1799	\N	\N		\N	\N				51643	\N	MASCULINO	\N
1800	\N	\N		\N	\N				54990	\N	MASCULINO	\N
1801	\N	\N		\N	\N				15932	\N	FEMININO	\N
1802	\N	\N		\N	\N				29890	\N	MASCULINO	\N
1803	\N	\N		\N	\N				269688	\N	FEMININO	\N
1804	\N	\N		\N	\N				51279	\N	FEMININO	\N
1805	\N	\N		\N	\N				111303	\N	FEMININO	\N
1806	\N	\N		\N	\N				58094	\N	MASCULINO	\N
1807	\N	\N		\N	\N				288500	\N	FEMININO	\N
1808	\N	\N		\N	\N				48439	\N	MASCULINO	\N
1809	\N	\N		\N	\N				51407	\N	MASCULINO	\N
1810	\N	\N		\N	\N				51905	\N	MASCULINO	\N
1811	\N	\N		\N	\N				47553	\N	FEMININO	\N
1812	\N	\N		\N	\N				45099	\N	FEMININO	\N
1813	\N	\N		\N	\N				59908	\N	FEMININO	\N
1814	\N	\N		\N	\N				49355	\N	FEMININO	\N
1815	\N	\N		\N	\N				28083	\N	FEMININO	\N
1816	\N	\N		\N	\N				49386	\N	FEMININO	\N
1817	\N	\N		\N	\N				47882	\N	FEMININO	\N
1818	\N	\N		\N	\N				28907	\N	FEMININO	\N
1819	\N	\N		\N	\N				46919	\N	MASCULINO	\N
1820	\N	\N		\N	\N				34762	\N	MASCULINO	\N
1821	\N	\N		\N	\N				47162	\N	MASCULINO	\N
1822	\N	\N		\N	\N				45603	\N	MASCULINO	\N
1823	\N	\N		\N	\N				50221	\N	MASCULINO	\N
1824	\N	\N		\N	\N				52384	\N	MASCULINO	\N
1825	\N	\N		\N	\N				49544	\N	MASCULINO	\N
1826	\N	\N		\N	\N				46374	\N	MASCULINO	\N
1827	\N	\N		\N	\N				48621	\N	FEMININO	\N
1828	\N	\N		\N	\N				53664	\N	FEMININO	\N
1829	\N	\N		\N	\N				49482	\N	MASCULINO	\N
1830	\N	\N		\N	\N				114024	\N	MASCULINO	\N
1831	\N	\N		\N	\N				49744	\N	MASCULINO	\N
1832	\N	\N		\N	\N				49515	\N	FEMININO	\N
1833	\N	\N		\N	\N				49185	\N	FEMININO	\N
1834	\N	\N		\N	\N				47927	\N	FEMININO	\N
1835	\N	\N		\N	\N				48052	\N	FEMININO	\N
1836	\N	\N		\N	\N				48460	\N	FEMININO	\N
1837	\N	\N		\N	\N				50733	\N	FEMININO	\N
1838	\N	\N		\N	\N				49822	\N	MASCULINO	\N
1839	\N	\N		\N	\N				50751	\N	FEMININO	\N
1840	\N	\N		\N	\N				8313	\N	FEMININO	\N
1841	\N	\N		\N	\N				48565	\N	FEMININO	\N
1842	\N	\N		\N	\N				6942	\N	MASCULINO	\N
1843	\N	\N		\N	\N				120561	\N	MASCULINO	\N
1844	\N	\N		\N	\N				09537201552003100092016003608820	\N	MASCULINO	\N
1845	\N	\N		\N	\N				49400	\N	FEMININO	\N
1846	\N	\N		\N	\N				17164	\N	MASCULINO	\N
1847	\N	\N		\N	\N				94554	\N	MASCULINO	\N
1848	\N	\N		\N	\N				34605	\N	FEMININO	\N
1849	\N	\N		\N	\N				47883	\N	MASCULINO	\N
1850	\N	\N		\N	\N				46719	\N	MASCULINO	\N
1851	\N	\N		\N	\N				47237	\N	MASCULINO	\N
1852	\N	\N		\N	\N				48607	\N	MASCULINO	\N
1853	\N	\N		\N	\N				36404	\N	MASCULINO	\N
1854	\N	\N		\N	\N				48199	\N	MASCULINO	\N
1855	\N	\N		\N	\N				46657	\N	MASCULINO	\N
1856	\N	\N		\N	\N				48337	\N	MASCULINO	\N
1857	\N	\N		\N	\N				3823	\N	FEMININO	\N
1858	\N	\N		\N	\N				3915	\N	MASCULINO	\N
1859	\N	\N		\N	\N				47050	\N	MASCULINO	\N
1860	\N	\N		\N	\N				47240	\N	MASCULINO	\N
1861	\N	\N		\N	\N				47672	\N	MASCULINO	\N
1862	\N	\N		\N	\N				49479	\N	FEMININO	\N
1863	\N	\N		\N	\N				48554	\N	FEMININO	\N
1864	\N	\N		\N	\N				47365	\N	FEMININO	\N
1865	\N	\N		\N	\N				43553	\N	MASCULINO	\N
1866	\N	\N		\N	\N				45526	\N	MASCULINO	\N
1867	\N	\N		\N	\N				47695	\N	MASCULINO	\N
1868	\N	\N		\N	\N				27066	\N	MASCULINO	\N
1869	\N	\N		\N	\N				20030	\N	MASCULINO	\N
1870	\N	\N		\N	\N				48815	\N	FEMININO	\N
1871	\N	\N		\N	\N				35902	\N	MASCULINO	\N
1872	\N	\N		\N	\N				43521	\N	FEMININO	\N
1873	\N	\N		\N	\N				27562	\N	FEMININO	\N
1874	\N	\N		\N	\N				55431	\N	MASCULINO	\N
1875	\N	\N		\N	\N				56009	\N	MASCULINO	\N
1876	\N	\N		\N	\N				55144	\N	MASCULINO	\N
1877	\N	\N		\N	\N				54152	\N	FEMININO	\N
1878	\N	\N		\N	\N				55653	\N	FEMININO	\N
1879	\N	\N		\N	\N				54583	\N	FEMININO	\N
1880	\N	\N		\N	\N				54382	\N	FEMININO	\N
1881	\N	\N		\N	\N				56000	\N	FEMININO	\N
1882	\N	\N		\N	\N				53497	\N	FEMININO	\N
1883	\N	\N		\N	\N				56071	\N	FEMININO	\N
1884	\N	\N		\N	\N				56205	\N	FEMININO	\N
1885	\N	\N		\N	\N				55135	\N	FEMININO	\N
1886	\N	\N		\N	\N				55809	\N	FEMININO	\N
1887	\N	\N		\N	\N				55652	\N	MASCULINO	\N
1888	\N	\N		\N	\N				55745	\N	FEMININO	\N
1889	\N	\N		\N	\N				58150	\N	MASCULINO	\N
1890	\N	\N		\N	\N				58584	\N	FEMININO	\N
1891	\N	\N		\N	\N				54300	\N	MASCULINO	\N
1892	\N	\N		\N	\N				56450	\N	MASCULINO	\N
1893	\N	\N		\N	\N					\N	FEMININO	\N
1894	\N	\N		\N	\N				55793	\N	FEMININO	\N
1895	\N	\N		\N	\N				55473	\N	MASCULINO	\N
1896	\N	\N		\N	\N				56388	\N	MASCULINO	\N
1897	\N	\N		\N	\N				65953	\N	MASCULINO	\N
1898	\N	\N		\N	\N				55578	\N	MASCULINO	\N
1899	\N	\N		\N	\N				55769	\N	FEMININO	\N
1900	\N	\N		\N	\N				55724	\N	FEMININO	\N
1901	\N	\N		\N	\N				55617	\N	MASCULINO	\N
1902	\N	\N		\N	\N				59978	\N	FEMININO	\N
1903	\N	\N		\N	\N				55795	\N	FEMININO	\N
1904	\N	\N		\N	\N				55064	\N	FEMININO	\N
1905	\N	\N		\N	\N				55011	\N	FEMININO	\N
1906	\N	\N		\N	\N				55387	\N	MASCULINO	\N
1907	\N	\N		\N	\N				5592135	\N	MASCULINO	\N
1908	\N	\N		\N	\N				55723	\N	MASCULINO	\N
1909	\N	\N		\N	\N				55600	\N	FEMININO	\N
1910	\N	\N		\N	\N				55521	\N	MASCULINO	\N
1911	\N	\N		\N	\N				56718	\N	MASCULINO	\N
1912	\N	\N		\N	\N				56642	\N	MASCULINO	\N
1913	\N	\N		\N	\N				56551	\N	MASCULINO	\N
1914	\N	\N		\N	\N				56760	\N	MASCULINO	\N
1915	\N	\N		\N	\N				58568	\N	FEMININO	\N
1916	\N	\N		\N	\N				55251	\N	FEMININO	\N
1917	\N	\N		\N	\N				55589	\N	MASCULINO	\N
1918	\N	\N		\N	\N				55634	\N	MASCULINO	\N
1919	\N	\N		\N	\N				53790	\N	MASCULINO	\N
1920	\N	\N		\N	\N				55038	\N	MASCULINO	\N
1921	\N	\N		\N	\N				55845	\N	MASCULINO	\N
1922	\N	\N		\N	\N				55434	\N	MASCULINO	\N
1923	\N	\N		\N	\N				56210	\N	MASCULINO	\N
1924	\N	\N		\N	\N				54881	\N	FEMININO	\N
1925	\N	\N		\N	\N				55626	\N	FEMININO	\N
1926	\N	\N		\N	\N				64807	\N	FEMININO	\N
1927	\N	\N		\N	\N				54040	\N	FEMININO	\N
1928	\N	\N		\N	\N				55212	\N	MASCULINO	\N
1929	\N	\N		\N	\N				55525	\N	MASCULINO	\N
1930	\N	\N		\N	\N				55711	\N	MASCULINO	\N
1931	\N	\N		\N	\N				55372	\N	FEMININO	\N
1932	\N	\N		\N	\N				54708	\N	MASCULINO	\N
1933	\N	\N		\N	\N				10476	\N	MASCULINO	\N
1934	\N	\N		\N	\N				56014	\N	FEMININO	\N
1935	\N	\N		\N	\N				55575	\N	MASCULINO	\N
1936	\N	\N		\N	\N				55581	\N	MASCULINO	\N
1937	\N	\N		\N	\N				55658	\N	MASCULINO	\N
1938	\N	\N		\N	\N				56312	\N	MASCULINO	\N
1939	\N	\N		\N	\N				66555	\N	FEMININO	\N
1940	\N	\N		\N	\N				55733	\N	FEMININO	\N
1941	\N	\N		\N	\N				57476	\N	FEMININO	\N
1942	\N	\N		\N	\N				54682	\N	FEMININO	\N
1943	\N	\N		\N	\N				53353	\N	MASCULINO	\N
1944	\N	\N		\N	\N				54777	\N	MASCULINO	\N
1945	\N	\N		\N	\N				62274	\N	MASCULINO	\N
1946	\N	\N		\N	\N				53066	\N	MASCULINO	\N
1947	\N	\N		\N	\N				44075	\N	FEMININO	\N
1948	\N	\N		\N	\N				54822	\N	FEMININO	\N
1949	\N	\N		\N	\N				53911	\N	FEMININO	\N
1950	\N	\N		\N	\N				54119	\N	MASCULINO	\N
1951	\N	\N		\N	\N				53734	\N	MASCULINO	\N
1952	\N	\N		\N	\N				40118	\N	FEMININO	\N
1953	\N	\N		\N	\N				54220	\N	MASCULINO	\N
1954	\N	\N		\N	\N				53450	\N	MASCULINO	\N
1955	\N	\N		\N	\N				53599	\N	MASCULINO	\N
1956	\N	\N		\N	\N				55123	\N	MASCULINO	\N
1957	\N	\N		\N	\N				52912	\N	MASCULINO	\N
1958	\N	\N		\N	\N				3283334	\N	FEMININO	\N
1959	\N	\N		\N	\N				54655	\N	FEMININO	\N
1960	\N	\N		\N	\N				3774	\N	MASCULINO	\N
1961	\N	\N		\N	\N				53836	\N	FEMININO	\N
1962	\N	\N		\N	\N				107866	\N	MASCULINO	\N
1963	\N	\N		\N	\N				2683625	\N	MASCULINO	\N
1964	\N	\N		\N	\N				282098	\N	MASCULINO	\N
1965	\N	\N		\N	\N				54054	\N	MASCULINO	\N
1966	\N	\N		\N	\N				34366	\N	FEMININO	\N
1967	\N	\N		\N	\N				60884	\N	MASCULINO	\N
1968	\N	\N		\N	\N				54103	\N	FEMININO	\N
1969	\N	\N		\N	\N				54050	\N	MASCULINO	\N
1970	\N	\N		\N	\N				61389	\N	MASCULINO	\N
1971	\N	\N		\N	\N				56757	\N		\N
1972	\N	\N		\N	\N				53264	\N		\N
1973	\N	\N		\N	\N				53950	\N	MASCULINO	\N
1974	\N	\N		\N	\N				54504	\N	MASCULINO	\N
1975	\N	\N		\N	\N					\N	MASCULINO	\N
1976	\N	\N		\N	\N				53200	\N	MASCULINO	\N
1977	\N	\N		\N	\N				54561	\N	MASCULINO	\N
1978	\N	\N		\N	\N				54251	\N	MASCULINO	\N
1979	\N	\N		\N	\N				56325	\N	FEMININO	\N
1980	\N	\N		\N	\N				53391	\N	MASCULINO	\N
1981	\N	\N		\N	\N				54633	\N	MASCULINO	\N
1982	\N	\N		\N	\N				53811	\N	MASCULINO	\N
1983	\N	\N		\N	\N				54048	\N	FEMININO	\N
1984	\N	\N		\N	\N				54161	\N	MASCULINO	\N
1985	\N	\N		\N	\N				53783	\N	FEMININO	\N
1986	\N	\N		\N	\N				54968	\N	MASCULINO	\N
1987	\N	\N		\N	\N				55328	\N	MASCULINO	\N
1988	\N	\N		\N	\N				53802	\N	FEMININO	\N
1989	\N	\N		\N	\N				53763	\N	FEMININO	\N
1990	\N	\N		\N	\N				54088	\N	MASCULINO	\N
1991	\N	\N		\N	\N				55117	\N	MASCULINO	\N
1992	\N	\N		\N	\N				53369	\N	MASCULINO	\N
1993	\N	\N		\N	\N				54922	\N	FEMININO	\N
1994	\N	\N		\N	\N				52557	\N	MASCULINO	\N
1995	\N	\N		\N	\N				52641	\N	FEMININO	\N
1996	\N	\N		\N	\N				52614	\N	FEMININO	\N
1997	\N	\N		\N	\N				52928	\N	MASCULINO	\N
1998	\N	\N		\N	\N				51840	\N	MASCULINO	\N
1999	\N	\N		\N	\N				272312	\N		\N
2000	\N	\N		\N	\N				52017	\N	MASCULINO	\N
2001	\N	\N		\N	\N				52803	\N	FEMININO	\N
2002	\N	\N		\N	\N				51888	\N	FEMININO	\N
2003	\N	\N		\N	\N				52971	\N	MASCULINO	\N
2004	\N	\N		\N	\N				52629	\N	MASCULINO	\N
2005	\N	\N		\N	\N				53184	\N	MASCULINO	\N
2006	\N	\N		\N	\N				277091	\N	MASCULINO	\N
2007	\N	\N		\N	\N				55325	\N	FEMININO	\N
2008	\N	\N		\N	\N				53422	\N	MASCULINO	\N
2009	\N	\N		\N	\N				53282	\N	FEMININO	\N
2010	\N	\N		\N	\N				52092	\N	FEMININO	\N
2011	\N	\N		\N	\N				53071	\N	FEMININO	\N
2012	\N	\N		\N	\N				53133	\N	FEMININO	\N
2013	\N	\N		\N	\N				52656	\N	FEMININO	\N
2014	\N	\N		\N	\N				53713	\N	FEMININO	\N
2015	\N	\N		\N	\N				52601	\N	MASCULINO	\N
2016	\N	\N		\N	\N				1294	\N	MASCULINO	\N
2017	\N	\N		\N	\N				52604	\N	MASCULINO	\N
2018	\N	\N		\N	\N				52489	\N	FEMININO	\N
2019	\N	\N		\N	\N				52494	\N	FEMININO	\N
2020	\N	\N		\N	\N				51552	\N	MASCULINO	\N
2021	\N	\N		\N	\N				52747	\N	FEMININO	\N
2022	\N	\N		\N	\N					\N	MASCULINO	\N
2023	\N	\N		\N	\N				2384616	\N	MASCULINO	\N
2024	\N	\N		\N	\N				52121	\N	MASCULINO	\N
2025	\N	\N		\N	\N				53334	\N	FEMININO	\N
2026	\N	\N		\N	\N				50975	\N	MASCULINO	\N
2027	\N	\N		\N	\N				51395	\N	MASCULINO	\N
2028	\N	\N		\N	\N				53093	\N	MASCULINO	\N
2029	\N	\N		\N	\N				54344	\N	FEMININO	\N
2030	\N	\N		\N	\N				52719	\N	FEMININO	\N
2031	\N	\N		\N	\N				127723	\N	FEMININO	\N
2032	\N	\N		\N	\N				51509	\N	FEMININO	\N
2033	\N	\N		\N	\N				52889	\N	MASCULINO	\N
2034	\N	\N		\N	\N					\N	MASCULINO	\N
2035	\N	\N		\N	\N				53120	\N	MASCULINO	\N
2036	\N	\N		\N	\N				42630	\N	MASCULINO	\N
2037	\N	\N		\N	\N				52695	\N	FEMININO	\N
2038	\N	\N		\N	\N				126826	\N	MASCULINO	\N
2039	\N	\N		\N	\N				52630	\N	MASCULINO	\N
2040	\N	\N		\N	\N				52248	\N	MASCULINO	\N
2041	\N	\N		\N	\N				7148	\N	FEMININO	\N
2042	\N	\N		\N	\N				53173	\N	MASCULINO	\N
2043	\N	\N		\N	\N				53172	\N	MASCULINO	\N
2044	\N	\N		\N	\N				16289	\N	FEMININO	\N
2045	\N	\N		\N	\N				52744	\N	MASCULINO	\N
2368	\N	\N	\N	\N	\N	9837498347	983472938	8924723847	9827	\N	null	\N
2396	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2397	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2398	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2399	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2400	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2401	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2403	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2500	\N	\N	\N	\N	\N	897654	321654	65654	654564	\N	MASCULINO	\N
2502	\N	\N	\N	\N	\N	897654131231	3216541321312	65654321312	65456412321	\N	MASCULINO	\N
2503	\N	\N	\N	\N	\N	897654131231111	3216541321312111	65654321312111	6545641232111	\N	MASCULINO	\N
2582	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2695	\N	\N	\N	\N	\N	08	2º OFICIO DE NOTAS	A-109	56998	\N	FEMININO	\N
2596	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2599	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2601	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2605	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2615	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2619	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2696	\N	\N	\N	\N	\N	152	2	A-113	57942	\N	MASCULINO	\N
2640	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2645	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2662	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2697	\N	\N	\N	\N	\N	186	2º OFICIO DE NOTAS	A-107	56776	\N	MASCULINO	\N
2698	\N	\N	\N	\N	\N	15	2º OFICIO DE NOTAS	A-112	57605	\N	MASCULINO	\N
2699	\N	\N	\N	\N	\N	71	2º OFICIO DE NOTAS	A-113	57861	\N	MASCULINO	\N
2683	\N	\N	\N	\N	\N					\N	FEMININO	\N
2700	\N	\N	\N	\N	\N	156	2º OFICIO DE NOTAS	A-106	56546	\N	FEMININO	\N
2701	\N	\N	\N	\N	\N	108	2º OFICIO DE NOTAS	A-110	57298	\N	FEMININO	\N
2702	\N	\N	\N	\N	\N	91	2º OFICIO DE NOTAS	A-108	56881	\N	MASCULINO	\N
2703	\N	\N	\N	\N	\N	111	2º OFICIO DE NOTAS	A-114	58101	\N	MASCULINO	\N
2704	\N	\N	\N	\N	\N	02	COMARCA DE NÍSIA FLORESTA	A-19	6595	\N	FEMININO	\N
2705	\N	\N	\N	\N	\N	48	2º OFICIO DE NOTAS	A-114	58038	\N	FEMININO	\N
2706	\N	\N	\N	\N	\N	112	2º OFICIO DE NOTAS	A-114	58102	\N	FEMININO	\N
2707	\N	\N	\N	\N	\N	179	2º OFICIO DE NOTAS	A-111	57569	\N	FEMININO	\N
2708	\N	\N	\N	\N	\N	73	2º OFICIO DE NOTAS	A-109	57063	\N	MASCULINO	\N
2709	\N	\N	\N	\N	\N	42	2º OFICIO DE NOTAS	A-109	57032	\N	MASCULINO	\N
2710	\N	\N	\N	\N	\N	179	COMARCA DE PARNAMIRIM - 2º OFÍCIO DE NOTAS	A-192	61919	\N	MASCULINO	\N
2711	\N	\N	\N	\N	\N	121	2º OFICIO DE NOTAS	A-110	57311	\N	MASCULINO	\N
2712	\N	\N	\N	\N	\N	75	2º OFICIO DE NOTAS	A-113	57865	\N	MASCULINO	\N
2713	\N	\N	\N	\N	\N	109	2º OFICIO DE NOTAS	A-111	57499	\N	MASCULINO	\N
2714	\N	\N	\N	\N	\N	17	2º OFICIO DE NOTAS	A-113	57807	\N	FEMININO	\N
2715	\N	\N	\N	\N	\N	150	COMARCA DE CEARÁ-MIRIM - 2º OFÍCIO DE NOTAS	A-125	55834	\N	MASCULINO	\N
2716	\N	\N	\N	\N	\N	37	2º OFICIO DE NOTAS	A-109	57027	\N	FEMININO	\N
2717	\N	\N	\N	\N	\N	174	2º OFICIO DE NOTAS	A-111	57564	\N	FEMININO	\N
2718	\N	\N	\N	\N	\N	21	2º OFICIO DE NOTAS	A-111	57411	\N	FEMININO	\N
2719	\N	\N	\N	\N	\N	87	2º OFICIO DE NOTAS	A-133	61877	\N	MASCULINO	\N
2720	\N	\N	\N	\N	\N	08	2º OFICIO DE NOTAS	A-110	57198	\N	MASCULINO	\N
2721	\N	\N	\N	\N	\N	39	2º OFICIO DE NOTAS	A-115	58229	\N	FEMININO	\N
2722	\N	\N	\N	\N	\N	267	2° CARTORIO JUDICIARIO	58	43952	\N	FEMININO	\N
2723	\N	\N	\N	\N	\N	88	CARTORIO UNICO	A 35	31775	\N	FEMININO	\N
2724	\N	\N	\N	\N	\N	283	4° OFICIO DE NOTAS	A-307	98782	\N	FEMININO	\N
2725	\N	\N	\N	\N	\N	148	2° CARTORIO JUDICIARIO	54	40523	\N	MASCULINO	\N
2726	\N	\N	\N	\N	\N	249	4° OFICIO DE NOTAS	325	107291	\N	FEMININO	\N
2727	\N	\N	\N	\N	\N	198	2° CARTORIO JUDICIARIO	01	44583	\N	FEMININO	\N
2728	\N	\N	\N	\N	\N	288	2° CARTORIO JUDICIARIO	61	44773	\N	MASCULINO	\N
2729	\N	\N	\N	\N	\N	20	\N	36	32791	\N	FEMININO	\N
2730	\N	\N	\N	\N	\N	28	5° OFICIO DE NOTAS	A-408	251792	\N	FEMININO	\N
2733	\N	\N	\N	\N	\N	88	2º OFICIO DE NOTAS	A-107	56678	\N	FEMININO	\N
2734	\N	\N	\N	\N	\N	138	2º OFICIO DE NOTAS	A-106	56528	\N	FEMININO	\N
2735	\N	\N	\N	\N	\N	62	2º OFICIO DE NOTAS	A-115	58252	\N	FEMININO	\N
2736	\N	\N	\N	\N	\N	90	2º OFICIO DE NOTAS	A-110	57280	\N	MASCULINO	\N
2737	\N	\N	\N	\N	\N	01	2º OFICIO DE NOTAS	A-113	57791	\N	FEMININO	\N
2738	\N	\N	\N	\N	\N	137	2º OFICIO DE NOTAS	A-111	57527	\N	MASCULINO	\N
2739	\N	\N	\N	\N	\N	297	5º OFÍCIO DE NOTAS - NATAL/RN	A-552	295260	\N	FEMININO	\N
2740	\N	\N	\N	\N	\N	153	2º OFICIO DE NOTAS	A-113	57943	\N	MASCULINO	\N
2741	\N	\N	\N	\N	\N	74	2º OFICIO DE NOTAS	A-113	57864	\N	MASCULINO	\N
2742	\N	\N	\N	\N	\N	145	2º OFICIO DE NOTAS	A-109	57135	\N	FEMININO	\N
2743	\N	\N	\N	\N	\N	15	2º OFICIO DE NOTAS	A-114	58005	\N	MASCULINO	\N
2744	\N	\N	\N	\N	\N	52	5º OFÍCIO DE NOTAS - NATAL/RN	A-551	294715	\N	MASCULINO	\N
2745	\N	\N	\N	\N	\N	85	2º OFICIO DE NOTAS	A-112	57675	\N	MASCULINO	\N
2746	\N	\N	\N	\N	\N	155	2º OFICIO DE NOTAS	A-113	57945	\N	MASCULINO	\N
2747	\N	\N	\N	\N	\N	7	UNICO DE IGAPO	A-50	42254	\N	MASCULINO	\N
2748	\N	\N	\N	\N	\N	280	UNICO DE IGAPO	A-44	38209	\N	MASCULINO	\N
2749	\N	\N	\N	\N	\N	032	2° OFICIO DE NOTAS	70	47226	\N	MASCULINO	\N
2750	\N	\N	\N	\N	\N	206	1° DISTRITO DE SÃO GONÇALO	A-0128	71875	\N	FEMININO	\N
2751	\N	\N	\N	\N	\N	100	2° CARTORIO DE CEARA MIRIM	102	43948	\N	FEMININO	\N
2752	\N	\N	\N	\N	\N	242	2° JUDICIARIO DE SÃO GONÇALO DO AMARANTE	62	45027	\N	MASCULINO	\N
2753	\N	\N	\N	\N	\N	254V	CARTORIO CIVIL DE SANTA LUZIA - PB	A-13	11343	\N	FEMININO	\N
2754	\N	\N	\N	\N	\N	296	2° OFICIO DE JUAZEIRO - BA	A-20	23987	\N	FEMININO	\N
2755	\N	\N	\N	\N	\N	16	UNICO DE IGAPO	65	51262	\N	MASCULINO	\N
2757	\N	\N	\N	\N	\N	204	2° CARTORIO DE SÃO GONÇALO DO AMARANTE - RN	65	45889	\N	FEMININO	\N
2758	\N	\N	\N	\N	\N	68	2º OFICIO DE NOTAS	A-108	56858	\N	MASCULINO	\N
2759	\N	\N	\N	\N	\N	63	5º OFÍCIO DE NOTAS - NATAL/RN	A-533	289326	\N	MASCULINO	\N
2760	\N	\N	\N	\N	\N	33	2º OFICIO DE NOTAS	A-109	57023	\N	MASCULINO	\N
2761	\N	\N	\N	\N	\N	11	2º OFICIO DE NOTAS	A-109	57001	\N	FEMININO	\N
2762	\N	\N	\N	\N	\N	130	2º OFICIO DE NOTAS	A-112	57720	\N	FEMININO	\N
2763	\N	\N	\N	\N	\N	122	2º OFICIO DE NOTAS	A-113	57912	\N	FEMININO	\N
2764	\N	\N	\N	\N	\N	56	2º OFICIO DE NOTAS	A-107	56646	\N	FEMININO	\N
2765	\N	\N	\N	\N	\N	115	2º OFICIO DE NOTAS	A-114	58105	\N	MASCULINO	\N
2766	\N	\N	\N	\N	\N	72	2º OFICIO DE NOTAS	A-107	56662	\N	MASCULINO	\N
2767	\N	\N	\N	\N	\N	168	2º OFICIO DE NOTAS	A-113	57958	\N	MASCULINO	\N
2768	\N	\N	\N	\N	\N	199	2º OFICIO DE NOTAS	A-112	57789	\N	MASCULINO	\N
2769	\N	\N	\N	\N	\N	169	2º OFICIO DE NOTAS	A-111	57559	\N	MASCULINO	\N
2770	\N	\N	\N	\N	\N	57	2º OFICIO DE NOTAS	A-112	57647	\N	MASCULINO	\N
2772	\N	\N	\N	\N	\N	62	2º OFICIO DE NOTAS	A-102	55652	\N	MASCULINO	\N
2773	\N	\N	\N	\N	\N	62	2º OFICIO DE NOTAS	A-102	55652	\N	MASCULINO	\N
2774	\N	\N	\N	\N	\N	10	2º OFICIO DE NOTAS	102	55600	\N	FEMININO	\N
2775	\N	\N	\N	\N	\N	170	2º OFICIO DE NOTAS	A-97	54760	\N	MASCULINO	\N
2776	\N	\N	\N	\N	\N	131	2º OFICIO DE NOTAS	A-103	55921	\N	MASCULINO	\N
2777	\N	\N	\N	\N	\N	131	2º OFICIO DE NOTAS	101	55521	\N	MASCULINO	\N
2778	\N	\N	\N	\N	\N	52	2º OFICIO DE NOTAS	A-107	56642	\N	MASCULINO	\N
2779	\N	\N	\N	\N	\N	197	2º OFICIO DE NOTAS	106	56587	\N	FEMININO	\N
2780	\N	\N	\N	\N	\N	132	2º OFICIO DE NOTAS	A-106	56522	\N	FEMININO	\N
2781	\N	\N	\N	\N	\N	146	2º OFICIO DE NOTAS	A-103	55936	\N	FEMININO	\N
2782	\N	\N	\N	\N	\N	114	Cartório Único de Igapó	A 101	72766	\N	FEMININO	\N
2783	\N	\N	\N	\N	\N	21	2º OFICIO DE NOTAS	A-104	56011	\N	FEMININO	\N
2785	\N	\N	\N	\N	\N	96	SEGUNDO OFÍCIO DE NOTAS	130-A	61286	\N	MASCULINO	\N
2786	\N	\N	\N	\N	\N	174	2º OFICIO DE NOTAS	101	55564	\N	FEMININO	\N
2788	\N	\N	\N	\N	\N	92	2º OFICIO DE NOTAS	99	55082	\N	MASCULINO	\N
2789	\N	\N	\N	\N	\N	71	2º OFICIO DE NOTAS	A-105	56261	\N	MASCULINO	\N
2790	\N	\N	\N	\N	\N	145	2º OFICIO DE NOTAS	A-103	55935	\N	FEMININO	\N
2792	\N	\N	\N	\N	\N	12	2º OFICIO DE NOTAS	A-105	56202	\N	FEMININO	\N
2793	\N	\N	\N	\N	\N	247	2º TABELIONATO DE NOTAS - MACAÍBA/RN	A-120	45284	\N	FEMININO	\N
2795	\N	\N	\N	\N	\N	45	2º OFICIO DE NOTAS	A-112	57635	\N	FEMININO	\N
2797	\N	\N	\N	\N	\N	026	SEGUNDO OFÍCIO DE NOTAS	A 114	43092	\N	MASCULINO	\N
2798	\N	\N	\N	\N	\N	178	2º OFICIO DE NOTAS	A-116	58568	\N	FEMININO	\N
2799	\N	\N	\N	\N	\N	83	SEGUNDO OFÍCIO DE NOTAS	117	58673	\N	MASCULINO	\N
2800	\N	\N	\N	\N	\N	246	4º OFÍCIO DE NOTAS - NATAL/RN	A-414	133890	\N	FEMININO	\N
2801	\N	\N	\N	\N	\N	174	2º OFICIO DE NOTAS	100	55364	\N	FEMININO	\N
2803	\N	\N	\N	\N	\N	236	CARTÓRIO ÚNICO - IPANGUAÇU/RN	37	17062	\N	MASCULINO	\N
2804	\N	\N	\N	\N	\N	60	2º OFICIO DE NOTAS	101	55450	\N	FEMININO	\N
2805	\N	\N	\N	\N	\N	192	2º OFICIO DE NOTAS	101	55582	\N	FEMININO	\N
2806	\N	\N	\N	\N	\N	170	2º OFICIO DE NOTAS	104	56160	\N	MASCULINO	\N
2807	\N	\N	\N	\N	\N	57	2º OFICIO DE NOTAS	A-104	56047	\N	FEMININO	\N
2808	\N	\N	\N	\N	\N	124	SEGUNDO OFÍCIO DE NOTAS	33	60023	\N	FEMININO	\N
2809	\N	\N	\N	\N	\N	87	2º OFICIO DE NOTAS	A-102	55677	\N	MASCULINO	\N
2810	\N	\N	\N	\N	\N	44	Cartório Único de Igapó	102 A	73227	\N	FEMININO	\N
2812	\N	\N	\N	\N	\N	19	2º OFICIO DE NOTAS	A-103	55809	\N	FEMININO	\N
2814	\N	\N	\N	\N	\N	053	CARTÓRIO ÚNICO DE IGAPÓ	112 A	78595	\N	FEMININO	\N
2815	\N	\N	\N	\N	\N	10	2º OFICIO DE NOTAS	90	53200	\N	MASCULINO	\N
2816	\N	\N	\N	\N	\N	063	SEGUNDO OFÍCIO DE NOTAS	160119	59053	\N	FEMININO	\N
2817	\N	\N	\N	\N	\N	108	SEGUNDO OFÍCIO DE NOTAS	121-A	59498	\N	MASCULINO	\N
2818	\N	\N	\N	\N	\N	109	PRIMEIRO CARTÓRIO	041	77424	\N	FEMININO	\N
2819	\N	\N	\N	\N	\N	196	CARTÓRIO ÚNICO DE IGAPÓ	109 A	77733	\N	FEMININO	\N
2820	\N	\N	\N	\N	\N	129	2º TABELIONATO DE NOTAS - MACAÍBA/RN	A-107	40118	\N	FEMININO	\N
2821	\N	\N	\N	\N	\N	11	SEGUNDO OFÍCIO DE NOTAS SÃO GONÇALO DO AMARANTE	123	59801	\N	MASCULINO	\N
2822	\N	\N	\N	\N	\N	22	2º OFICIO DE NOTAS	89	52912	\N	MASCULINO	\N
2823	\N	\N	\N	\N	\N	187	SEGUNDO OFÍCIO DE NOTAS SÃO GONÇALO DO AMARANTE	121	59577	\N	FEMININO	\N
2824	\N	\N	\N	\N	\N	154	5º OFÍCIO DE NOTAS - NATAL	588 A	305920	\N	MASCULINO	\N
2825	\N	\N	\N	\N	\N	032	CARTÓRIO ÚNICO DE IGAPÓ	118 A	80374	\N	MASCULINO	\N
2826	\N	\N	\N	\N	\N	192	2º OFICIO DE NOTAS	95	54382	\N	FEMININO	\N
2827	\N	\N	\N	\N	\N	146	SEGUNDO OFÍCIO DE NOTAS SÃO GONÇALO DO AMARANTE	125	60336	\N	FEMININO	\N
2828	\N	\N	\N	\N	\N	047	SEGUNDO OFÍCIO DE NOTAS SÃO GONÇALO DO AMARANTE	124	60037	\N	MASCULINO	\N
2829	\N	\N	\N	\N	\N	89	2º OFICIO DE NOTAS	94	54079	\N	MASCULINO	\N
2830	\N	\N	\N	\N	\N	96	2º TABELIONATO DE NOTAS - MACAÍBA/RN	A-108	40552	\N	FEMININO	\N
2831	\N	\N	\N	\N	\N	49	2º OFICIO DE NOTAS	96	54439	\N	MASCULINO	\N
2832	\N	\N	\N	\N	\N	015	\N	118 A	58805	\N	FEMININO	\N
2833	\N	\N	\N	\N	\N	48	CARTÓRIO ÚNICO DE IGAPÓ	100	72033	\N	MASCULINO	\N
2834	\N	\N	\N	\N	\N	64	2º OFICIO DE NOTAS	94	54054	\N	MASCULINO	\N
2835	\N	\N	\N	\N	\N	59	2º OFICIO DE NOTAS	89	52949	\N	FEMININO	\N
2836	\N	\N	\N	\N	\N	79	4º OFÍCIO DE NOTAS - NATAL/RN	A-394	127723	\N	FEMININO	\N
2837	\N	\N	\N	\N	\N	128	5º OFÍCIO DE NOTAS - NATAL/RN	A-492	277091	\N	MASCULINO	\N
2838	\N	\N	\N	\N	\N	230	2º OFICIO DE NOTAS	89	53120	\N	MASCULINO	\N
2839	\N	\N	\N	\N	\N	41	2º OFICIO DE NOTAS	89	52931	\N	MASCULINO	\N
2840	\N	\N	\N	\N	\N	238	2º OFICIO DE NOTAS	88	52828	\N	MASCULINO	\N
2841	\N	\N	\N	\N	\N	11	2º OFICIO DE NOTAS	88	52601	\N	MASCULINO	\N
2842	\N	\N	\N	\N	\N	252	2º OFICIO DE NOTAS	88	52842	\N	MASCULINO	\N
2843	\N	\N	\N	\N	\N	115	2º OFICIO DE NOTAS	88	52705	\N	MASCULINO	\N
2844	\N	\N	\N	\N	\N	154	2º OFICIO DE NOTAS	88	52744	\N	MASCULINO	\N
2845	\N	\N	\N	\N	\N	157	2º OFICIO DE NOTAS	88	52747	\N	FEMININO	\N
2846	\N	\N	\N	\N	\N	90	2º OFICIO DE NOTAS	100	53220	\N	MASCULINO	\N
2847	\N	\N	\N	\N	\N	59	2º OFICIO DE NOTAS	85	51750	\N	MASCULINO	\N
2848	\N	\N	\N	\N	\N	88	2º OFICIO DE NOTAS	87	52378	\N	MASCULINO	\N
2849	\N	\N	\N	\N	\N	213	2º OFICIO DE NOTAS	88	52803	\N	FEMININO	\N
2850	\N	\N	\N	\N	\N	198	2º OFICIO DE NOTAS	85	51888	\N	FEMININO	\N
2851	\N	\N	\N	\N	\N	294	2º OFICIO DE NOTAS	89	53184	\N	MASCULINO	\N
2852	\N	\N	\N	\N	\N	276	2º OFICIO DE NOTAS	85	51966	\N	MASCULINO	\N
2853	\N	\N	\N	\N	\N	189	CARTÓRIO DE REGISTRO CIVIL - GOIANÉSIA/GO	87	42630	\N	MASCULINO	\N
2854	\N	\N	\N	\N	\N	296	2º OFICIO DE NOTAS	89	53186	\N	MASCULINO	\N
2855	\N	\N	\N	\N	\N	90	2º OFICIO DE NOTAS	85	51781	\N	MASCULINO	\N
2856	\N	\N	\N	\N	\N	282	2º OFICIO DE NOTAS	89	53172	\N	MASCULINO	\N
2857	\N	\N	\N	\N	\N	110	2º OFICIO DE NOTAS	101	55500	\N	FEMININO	\N
2858	\N	\N	\N	\N	\N	104	2º OFICIO DE NOTAS	A-106	56494	\N	MASCULINO	\N
2859	\N	\N	\N	\N	\N	100	2º OFICIO DE NOTAS	A-111	57490	\N	FEMININO	\N
2860	\N	\N	\N	\N	\N	142	2º OFICIO DE NOTAS	A-110	57332	\N	MASCULINO	\N
2861	\N	\N	\N	\N	\N	148	2º OFICIO DE NOTAS	A-113	56638	\N	FEMININO	\N
2862	\N	\N	\N	\N	\N	195	2º OFICIO DE NOTAS	A-111	57585	\N	FEMININO	\N
2863	\N	\N	\N	\N	\N	130	5º OFÍCIO DE NOTAS - NATAL/RN	A-549	294193	\N	MASCULINO	\N
2864	\N	\N	\N	\N	\N	68	2º OFICIO DE NOTAS	A-107	56658	\N	MASCULINO	\N
2865	\N	\N	\N	\N	\N	154	2º OFICIO DE NOTAS	A-110	57344	\N	MASCULINO	\N
2866	\N	\N	\N	\N	\N	174	2º TABELIONATO DE NOTAS - MACAÍBA/RN	A-110	41686	\N	MASCULINO	\N
2867	\N	\N	\N	\N	\N	162	2º OFICIO DE NOTAS	A-110	57352	\N	MASCULINO	\N
2868	\N	\N	\N	\N	\N	120	2º OFICIO DE NOTAS	A-110	57310	\N	MASCULINO	\N
2870	\N	\N	\N	\N	\N	117	2º OFICIO DE NOTAS	A-109	57107	\N	MASCULINO	\N
2871	\N	\N	\N	\N	\N	47	2º OFICIO DE NOTAS	A-108	56837	\N	MASCULINO	\N
2872	\N	\N	\N	\N	\N	16	2º OFICIO DE NOTAS	A-112	57606	\N	FEMININO	\N
2873	\N	\N	\N	\N	\N	27	2º OFICIO DE NOTAS	A-111	57417	\N	FEMININO	\N
2874	\N	\N	\N	\N	\N	102	2° CARTORIO DE SÃO GONÇALO DO AMARANTE - RN	57	43488	\N	MASCULINO	\N
2875	\N	\N	\N	\N	\N	200	4° OFICO DE NOTAS - NATAL/RN	310	102045	\N	FEMININO	\N
2876	\N	\N	\N	\N	\N	216	2° CARTORIO DE SÃO GONÇALO DO AMARANTE - RN	62	45001	\N	MASCULINO	\N
2877	\N	\N	\N	\N	\N	212 v	SERVIÇO NOTARIAL E REGISTRAL - TOUROS	50 A	32.955	\N	FEMININO	\N
2878	\N	\N	\N	\N	\N	283	CARTÓRIO ÚNICO DE IGAPÓ	82 A	61.817	\N	FEMININO	\N
2879	\N	\N	\N	\N	\N	266	CARTÓRIO ÚNICO DE IGAPÓ	98 A	71.267	\N	MASCULINO	\N
2880	\N	\N	\N	\N	\N	66	5º OFÍCIO DE NOTAS - NATAL	500 A	279.429	\N	FEMININO	\N
2881	\N	\N	\N	\N	\N	283	CARTÓRIO ÚNICO DE IGAPÓ	84 A	62.982	\N	MASCULINO	\N
2882	\N	\N	\N	\N	\N	215	2° CARTORIO DE SÃO GONÇALO DO AMARANTE - RN	76	49206	\N	FEMININO	\N
2883	\N	\N	\N	\N	\N	88	5° OFICIO DE NOTAS NATAL-RN	A-444	262651	\N	MASCULINO	\N
2884	\N	\N	\N	\N	\N	253	CARTORIO DE REGISTRO CIVIL DE NATAL	A-56	46341	\N	MASCULINO	\N
2885	\N	\N	\N	\N	\N	138	2° JUDICIARIO DE SÃO GONÇALO DO AMARANTE-RN	71	47632	\N	FEMININO	\N
2886	\N	\N	\N	\N	\N	114	2 OFICIO DE NOTAS DE SÃO GONÇALO DO AMARANTE-RN	71	47608	\N	MASCULINO	\N
2887	\N	\N	\N	\N	\N	131	CARTORIO RCPN TABELIONATO DE JAPERI-RJ	AA-41	23617	\N	FEMININO	\N
2888	\N	\N	\N	\N	\N	232	UNICO DE IGAPO NATAL-RN	A-61	49294	\N	FEMININO	\N
2889	\N	\N	\N	\N	\N	21	5° OFICIO DE NOTAS NATAL-RN	A-447	263675	\N	FEMININO	\N
2890	\N	\N	\N	\N	\N	257	4° OFICO DE NOTAS - NATAL/RN	A-355	116201	\N	FEMININO	\N
2891	\N	\N	\N	\N	\N	91	UNICO DE IGAPO NATAL-RN	54	44819	\N	MASCULINO	\N
2892	\N	\N	\N	\N	\N	152	2º OFICIO DE NOTAS	A-112	57742	\N	FEMININO	\N
2893	\N	\N	\N	\N	\N	255	2 OFICIO DE NOTAS DE SÃO GONÇALO DO AMARANTE-RN	64	45640	\N	MASCULINO	\N
2894	\N	\N	\N	\N	\N	369	UNICO DE IGAPO NATAL-RN	50	42978	\N	MASCULINO	\N
2895	\N	\N	\N	\N	\N	33	5° OFICIO DE NOTAS NATAL-RN	A-420	255396	\N	MASCULINO	\N
2896	\N	\N	\N	\N	\N	130	5° OFICIO DE NOTAS NATAL-RN	A-415	253993	\N	MASCULINO	\N
2897	\N	\N	\N	\N	\N	299	4° OFICO DE NOTAS - NATAL/RN	A-323	106741	\N	MASCULINO	\N
2898	\N	\N	\N	\N	\N	23	2 OFICIO DE NOTAS DE SÃO GONÇALO DO AMARANTE-RN	69	46917	\N	MASCULINO	\N
2899	\N	\N	\N	\N	\N	02	5° OFICIO DE NOTAS DE NATAL-RN	A-420	255.365	\N	FEMININO	\N
2900	\N	\N	\N	\N	\N	47	5º OFÍCIO DE NOTAS - NATAL	495 A	277.910	\N	FEMININO	\N
2901	\N	\N	\N	\N	\N	210	2º CARTÓRIO DE MOSSORÓ	200 A	86.861	\N	MASCULINO	\N
2902	\N	\N	\N	\N	\N	42	COMARCA DE SALVADOR - SUBDISTRITO DA CONCEIÇÃO DA PRAIA	99 A	29.442	\N	MASCULINO	\N
2903	\N	\N	\N	\N	\N	59	2 OFICIO DE NOTAS DE SÃO GONÇALO DO AMARANTE-RN	70	47253	\N	FEMININO	\N
2904	\N	\N	\N	\N	\N	266	5° OFICIO DE NOTAS DE NATAL-RN	A-417	254729	\N	MASCULINO	\N
2905	\N	\N	\N	\N	\N	25	4° OFICO DE NOTAS - NATAL/RN	326	107367	\N	FEMININO	\N
2906	\N	\N	\N	\N	\N	282-V	UNICO DE IGAPO NATAL-RN	A-41	37411	\N	FEMININO	\N
2907	\N	\N	\N	\N	\N	151-V	CARTORIO JUDICIARIO DE EXTREMOZ-RN	17	12014	\N	MASCULINO	\N
2908	\N	\N	\N	\N	\N	298	4° OFICO DE NOTAS - NATAL/RN	323	106740	\N	MASCULINO	\N
2909	\N	\N	\N	\N	\N	230	2° JUDICIARIO DE SÃO GONÇALO DO AMARANTE-RN	58	43915	\N	MASCULINO	\N
2910	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2911	\N	\N	\N	\N	\N	41	5° OFICIO DE NOTAS DE NATAL-RN	A-392	246550	\N	MASCULINO	\N
2912	\N	\N	\N	\N	\N	147	CARTÓRIO ÚNICO - PUREZA	15 A	6750	\N	FEMININO	\N
2914	\N	\N	\N	\N	\N	467	5º OFÍCIO DE NOTAS - NATAL/RN	A-551	294830	\N	MASCULINO	\N
2915	\N	\N	\N	\N	\N	202	2º OFICIO DE NOTAS	A-23	24045	\N	FEMININO	\N
2916	\N	\N	\N	\N	\N	109	2º OFICIO DE NOTAS	86	52099	\N	MASCULINO	\N
2917	\N	\N	\N	\N	\N	71	2º OFICIO DE NOTAS	A-107	56661	\N	MASCULINO	\N
2918	\N	\N	\N	\N	\N	141	2º OFICIO DE NOTAS	A-112	57731	\N	MASCULINO	\N
2919	\N	\N	\N	\N	\N	177	CARTÓRIO ÚNICO DE IGAPÓ	73 A	56.235	\N	MASCULINO	\N
2920	\N	\N	\N	\N	\N	189	SEGUNDO OFÍCIO DE NOTAS SÃO GONÇALO DO AMARANTE	125	093906015520111001251890060	\N	MASCULINO	\N
3071	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2921	\N	\N	\N	\N	\N	13	2º OFICIO DE NOTAS	A-103	55803	\N	FEMININO	\N
2922	\N	\N	\N	\N	\N	163	2º OFICIO DE NOTAS	A-107	56753	\N	MASCULINO	\N
2923	\N	\N	\N	\N	\N	13	8º CARTÓRIO DE REGISTRO CIVIL - MANAUS	223 A	0055503	\N	FEMININO	\N
2924	\N	\N	\N	\N	\N	167	OFÍCIO ÚNICO  DE REGISTRO E NOTAS - CANGUARETAMA	82	29.155	\N	FEMININO	\N
2925	\N	\N	\N	\N	\N	133	CARTÓRIO ÚNICO  PEDRA GRANDE	A-08	\N	\N	FEMININO	\N
2926	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
2930	\N	\N	\N	\N	\N	182	2º OFICIO DE NOTAS	A-107	56772	\N	MASCULINO	\N
2931	\N	\N	\N	\N	\N	154	SEGUNDO OFÍCIO DE NOTAS	114	58.144	\N	MASCULINO	\N
2932	\N	\N	\N	\N	\N	\N	SEGUNDO OFÍCIO DE NOTAS	\N	09390601552010100120180005937001	\N	FEMININO	\N
2933	\N	\N	\N	\N	\N	\N	SEGUNDO OFÍCIO DE NOTAS	\N	\N	\N	FEMININO	\N
2937	\N	\N	\N	\N	\N					\N	FEMININO	\N
2938	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
2939	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
2940	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
2941	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2942	\N	\N	\N	\N	\N	082V	oficio único de notas - Florania/RN	A-27	15491	\N	FEMININO	\N
2944	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2945	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2946	\N	\N	\N	\N	\N	35-F	TABELIÃO DE NOTAS DO DISTRITO DE ITAQUERA/SP	455	324.441	\N	FEMININO	\N
2947	\N	\N	\N	\N	\N	160	2º OFICIO DE NOTAS	A-106	56.550	\N	FEMININO	\N
2948	\N	\N	\N	\N	\N	37	2º OFICIO DE NOTAS	A-112	57.627	\N	MASCULINO	\N
2949	\N	\N	\N	\N	\N	134	2º OFICIO DE NOTAS	A-102	55.724	\N	FEMININO	\N
2950	\N	\N	\N	\N	\N	195	SERVICO NOTARIAL E REGISTRAL SAO JOSE DE CAMPESTRE/RN	CERTIDAO DE NASCIMENTO	A-00032	\N	MASCULINO	\N
2963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
2997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3016	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3017	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3020	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3022	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3023	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3024	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3025	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3026	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3027	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3028	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3029	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3030	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3031	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3032	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3033	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3034	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3035	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3036	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3037	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3038	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3039	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3040	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3041	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3042	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3043	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3044	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3045	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3046	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3047	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3048	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3049	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3050	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3051	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3052	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3053	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3054	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3055	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3056	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3057	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3058	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3059	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3060	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3061	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3062	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3063	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3064	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3065	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3066	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3067	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3068	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3069	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3070	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3072	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3073	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3074	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3075	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3076	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3077	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3078	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3079	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3080	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3081	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3082	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3083	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3084	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3085	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3086	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3087	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3088	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3089	\N	\N	\N	\N	\N	11111	11111	11111	11111	\N	MASCULINO	\N
3090	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3091	\N	\N	\N	\N	\N	2	2	2	2	\N	MASCULINO	\N
3092	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3093	\N	\N	\N	\N	\N	1	11111	11111	11	\N	MASCULINO	\N
3094	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3095	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3096	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3097	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3098	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3099	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3100	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3101	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3102	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3103	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3104	\N	\N	\N	\N	\N	22	22	22	22	\N	MASCULINO	\N
3105	\N	\N	\N	\N	\N	44	44	44	44	\N	MASCULINO	\N
3106	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3107	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3108	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3109	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3110	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3111	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3112	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3113	\N	\N	\N	\N	\N	32323	323232	3232	32323	\N	MASCULINO	\N
3114	\N	\N	\N	\N	\N	434343	434343	434343	4343434	\N	MASCULINO	\N
3115	\N	\N	\N	\N	\N	54545454	545454	54545454	4e4545	\N	MASCULINO	\N
3118	\N	\N	\N	\N	\N	q	q	q	q	\N	MASCULINO	\N
3119	\N	\N	\N	\N	\N	q	q	q	q	\N	MASCULINO	\N
3120	\N	\N	\N	\N	\N	1	1	1	1	\N	MASCULINO	\N
3121	\N	\N	\N	\N	\N	1	1	1	1	\N	MASCULINO	\N
3122	\N	\N	\N	\N	\N	e	e	e	e	\N	MASCULINO	\N
3123	\N	\N	\N	\N	\N	e	e	e	e	\N	MASCULINO	\N
3124	\N	\N	\N	\N	\N	e	e	e	e	\N	MASCULINO	\N
3125	\N	\N	\N	\N	\N	1	1	1	1	\N	MASCULINO	\N
3126	\N	\N	\N	\N	\N	1	1	1	1	\N	MASCULINO	\N
3127	\N	\N	\N	\N	\N	1	1	1	1	\N	MASCULINO	\N
3128	\N	\N	\N	\N	\N	1	1	1	1	\N	MASCULINO	\N
3129	\N	\N	\N	\N	\N	1	1	1	1	\N	MASCULINO	\N
3130	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3132	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3133	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3134	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3135	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3137	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3138	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3139	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3140	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3141	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3142	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3143	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3144	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3145	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3146	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3147	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3148	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3149	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3150	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3151	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3152	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3153	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3154	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3155	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3156	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3157	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3158	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3159	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3160	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3161	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3162	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3163	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3164	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3165	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3166	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3167	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3169	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3170	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3171	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3172	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3173	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3174	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3175	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3176	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3177	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3179	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3180	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3181	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3182	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3183	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3184	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3185	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3186	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3187	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3189	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3190	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3191	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3192	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3193	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3194	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3195	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3196	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3197	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3198	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3199	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3200	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3201	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3202	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3203	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3204	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3205	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3206	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3207	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3208	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3209	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3210	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3211	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3212	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3213	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3214	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3215	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3216	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3136	\N	\N	\N	\N	\N					\N	FEMININO	\N
3217	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3218	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3219	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3220	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3221	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3222	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3223	\N	\N	\N	\N	\N	11	aaaaaaaaaa	aaaaaaaaaaaaa	111111111	\N	MASCULINO	\N
3224	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3225	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3226	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3227	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3228	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3230	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3237	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3238	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3239	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3241	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3242	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3244	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3245	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3246	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3247	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3248	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3249	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3250	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3251	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3252	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3253	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3254	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3256	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3255	\N	\N	\N	\N	\N					\N	MASCULINO	\N
3260	\N	\N	\N	\N	\N	333	rrrrrr	rrrrrrr	333333	\N	MASCULINO	\N
3262	\N	\N	\N	\N	\N	878	5454	hghghg	44444	\N	MASCULINO	\N
3264	\N	\N	\N	\N	\N	99	jjhjh	jhjj	5454	\N	FEMININO	\N
3263	\N	\N	\N	\N	\N		rtr	trtrt	5454	\N	MASCULINO	\N
3265	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3266	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3267	\N	\N	\N	\N	\N	245	525	hj	525	\N	MASCULINO	\N
3268	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3269	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3270	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3271	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3272	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3273	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3274	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3275	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3276	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3277	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3278	\N	\N	\N	\N	\N	247	ko-[l	44	4547	\N	MASCULINO	\N
3279	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3281	\N	\N	\N	\N	\N	247	ko-[l	44	4547	\N	MASCULINO	\N
3282	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3283	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3284	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3285	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3286	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3287	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3288	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3289	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3290	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3291	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3292	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3293	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3294	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3295	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3296	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3297	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3298	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3299	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3300	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3301	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3302	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3303	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3304	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3305	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3306	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3307	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3308	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3309	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3310	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3311	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3312	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3313	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3314	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3315	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3316	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3317	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3318	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3319	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3321	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3322	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3323	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3324	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3326	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3327	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3328	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3329	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3330	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3331	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3332	\N	\N	\N	\N	\N	652	fdfd	fdfd	95	\N	MASCULINO	\N
3333	\N	\N	\N	\N	\N	35	dfhfhf	fgfg	5445	\N	MASCULINO	\N
3334	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3335	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3336	\N	\N	\N	\N	\N	856	khkjh	jghg	45654	\N	MASCULINO	\N
3337	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3340	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3342	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3344	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3345	\N	\N	\N	\N	\N	hf	fhf	hf	gdgf	\N	MASCULINO	\N
3346	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3347	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3349	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3350	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FEMININO	\N
3351	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3352	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3353	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3354	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3355	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3356	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3357	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3358	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
3359	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	MASCULINO	\N
\.


--
-- TOC entry 4525 (class 0 OID 0)
-- Dependencies: 367
-- Name: pessoa_fisica_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

SELECT pg_catalog.setval('pessoa_fisica_id_seq', 3359, true);


--
-- TOC entry 4526 (class 0 OID 0)
-- Dependencies: 368
-- Name: pessoa_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

SELECT pg_catalog.setval('pessoa_id_seq', 3359, true);


--
-- TOC entry 4133 (class 0 OID 25341)
-- Dependencies: 369
-- Data for Name: pessoa_juridica; Type: TABLE DATA; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

COPY pessoa_juridica (id, inscricao_estadual, razao_social) FROM stdin;
14		CRECHE MUNICIPAL ANA CLESIA VARELA
15		ESCOLA MUNICIPAL DOUTOR NILTON PESSOA DE PAULA
44		ESCOLA MUNICIPAL DE 1 GRAU MONSENHOR WALFREDO GURGEL
16		ESCOLA MUNICIPAL MAURICIO FERNANDES DE OLIVEIRA
31		ESCOLA MUNICIPAL DE 1 GRAU PROFESSORA JESSICA DEBORA DE MELO BEZERRA
18		ESCOLA MUNICIPAL DE ENSINO FUNDAMENTAL FRANCISCO POTIGUAR CAVALCANTI
20		CENTRO EDUCACIONAL POTI CAVALCANTI
22		ESCOLA MUNICIPAL DE ENSINO FUNDAMENTAL PROFESSORA MARIA DA CRUZ
23		CENTRO EDUCACIONAL PRE ESCOLAR HAMILTON SANTIAGO JUNIOR
25		ESCOLA MUNICIPAL VEREADOR AILDO MENDES
28		CENTRO EDUCACIONAL INFANTIL E FUNDAMENTAL PROFESSOR IVANALDO DE FRANCA LIMA
33		ESCOLA MUNICIPAL DE 1 GRAU VEREADOR JOSE PRUDENCIO DE LIMA
35		ESCOLA MUNICIPAL DE 1 GRAU PROFESSORA MARIA DAS NEVES SILVA
24		ESCOLA MUNICIPAL DE 1 GRAU PROFESSORA MARIA DE LOURDES DE SOUZA
40		PRE ESCOLAR BAIXINHOS EDUCADOS
42		ESCOLA MUNICIPAL DE ENSINO FUNDAMENTAL LAURO PINHEIRO DA COSTA
48		ESCOLA MUNICIPAL DE 1 GRAU LUIZ DE FRANCA LIMA
50		ESCOLA MUNICIPAL DE ENSINO FUNDAMENTAL GENESIO CABRAL DE MACEDO
26		ESCOLA MUNICIPAL DE 1 GRAU PROFESSORA MARIA JUDITE DOS SANTOS
8		ESCOLA MUNICIPAL DE 1 E 2 GRAUS VICENTE FRANCA MONTE
37		CENTRO DE EDUCACAO PRE ESCOLAR LEIA FELIPE DE SOUZA
11		CENTRO EDUCACIONAL 1 DE MAIO
7		ESCOLA MUNICIPAL 1 E 2 GRAUS DOM JOAQUIM DE ALMEIDA
41		ESCOLA MUNICIPAL DE 1 E 2 JOSE FRANCISCO DA COSTA
32		ESCOLA MUNICIPAL DE 1 GRAU COSMO ALVES DE SOUZA
36		ESCOLA MUNICIPAL DE 1 GRAU DJALMA MARINHO
38		ESCOLA MUNICIPAL DE 1 GRAU DOUTOR VARELA BARCA
45		ESCOLA MUNICIPAL DE 1 GRAU ISABEL DA SILVEIRA
27		ESCOLA MUNICIPAL DE 1 GRAU PROFESSORA MARIA PENUN
43		ESCOLA MUNICIPAL DE 1 GRAU JOSE HORACIO DE GOIS
47		ESCOLA MUNICIPAL DE 1 GRAU LEONEL MESQUITA
49		ESCOLA MUNICIPAL DE 1 GRAU LUIS FERREIRA ASSUNCAO
39		ESCOLA MUNICIPAL DE 1 E 2 GRAU DR ROBERTO BEZERRA FREIRE
30		ESCOLA MUNICIPAL DE 1 GRAU BENIGNA SILVA
9		ESCOLA MUNICIPAL DE 1 GRAU CANTINHO DO SABER
34		ESCOLA MUNICIPAL DE 1 GRAU CLEUZA APARECIDA F LAUREANO
17		ESCOLA MUNICIPAL DE 1 GRAU JOAQUIM INES DO NASCIMENTO
21		ESCOLA MUNICIPAL DE 1 GRAU JOAQUIM VICTOR DE HOLANDA
19		ESCOLA MUNICIPAL DE 1 GRAU JONAS ESCOLASTICO DE NORONHA
46		ESCOLA MUNICIPAL DE 1 GRAU MARIA RUFINA DE LIMA
29	1233	CENTRO DE EDUCACAO INFANTIL POTENGI
10	12555	ESCOLA MUNICIPAL PROFESSORA MARIA LOURDES DE LIMA F
\.


--
-- TOC entry 4527 (class 0 OID 0)
-- Dependencies: 370
-- Name: pessoa_juridica_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

SELECT pg_catalog.setval('pessoa_juridica_id_seq', 3359, false);


--
-- TOC entry 4135 (class 0 OID 25349)
-- Dependencies: 371
-- Data for Name: prefeitura; Type: TABLE DATA; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

COPY prefeitura (id, brasao) FROM stdin;
7	pmsga
\.


--
-- TOC entry 4528 (class 0 OID 0)
-- Dependencies: 372
-- Name: prefeitura_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

SELECT pg_catalog.setval('prefeitura_id_seq', 3359, false);


--
-- TOC entry 4137 (class 0 OID 25357)
-- Dependencies: 373
-- Data for Name: professor; Type: TABLE DATA; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

COPY professor (id, identificacao) FROM stdin;
2061	\N
2085	\N
2086	\N
2087	\N
2088	\N
2090	\N
2091	\N
2092	\N
2093	\N
2096	\N
2098	\N
2099	\N
2100	\N
2101	\N
2102	\N
2103	\N
2104	\N
2105	\N
2106	\N
2107	\N
2108	\N
2109	\N
2111	\N
2112	\N
2113	\N
2114	\N
2115	\N
2117	\N
2118	\N
2119	\N
2121	\N
2122	\N
2123	\N
2124	\N
2125	\N
2126	\N
2129	\N
2130	\N
2131	\N
2132	\N
2134	\N
2135	\N
2137	\N
2138	\N
2139	\N
2141	\N
2142	\N
2292	\N
2316	1\r
2319	4\r
2331	6
2054	fff
2059	gggttt
2094	5
2318	3
2052	
2133	8
2128	59
2140	
2289	
2294	
2110	
2089	
2317	2
2320	5
2291	
2290	
2293	
2055	
2332	
2056	
2060	
2058	
2062	
2937	
2938	\N
2095	
2120	
2116	
2136	
2097	
3355	\N
3356	\N
3357	\N
\.


--
-- TOC entry 4529 (class 0 OID 0)
-- Dependencies: 374
-- Name: professor_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

SELECT pg_catalog.setval('professor_id_seq', 3359, false);


--
-- TOC entry 4139 (class 0 OID 25365)
-- Dependencies: 375
-- Data for Name: reside; Type: TABLE DATA; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

COPY reside (id, bairro_id, logradouro_id, pessoa_id, numero, complemento, cep) FROM stdin;
6	88	87	1569	20	\N	\N
11	88	88	1571		\N	\N
14	88	89	1572		\N	\N
15	88	92	1573	4	\N	\N
16	88	92	1574	4	\N	\N
17	88	94	1575	5	\N	\N
18	88	88	1679		\N	\N
19	88	105	1763	1332	\N	\N
20	88	14	1686	1083	\N	\N
21	88	117	1670		\N	\N
22	88	88	1744		\N	\N
23	88	88	1743		\N	\N
24	88	88	1617	33	\N	\N
25	88	88	1721		\N	\N
30	88	88	1846	135	\N	\N
31	88	88	1816	7	\N	\N
34	88	88	1789		\N	\N
35	88	88	1570		\N	\N
36	26	118	1694	141	\N	\N
37	169	134	1764	267	\N	\N
38	88	133	1742	11	\N	\N
39	88	88	1817		\N	\N
40	88	135	1765	131	\N	\N
41	88	88	1637	2	\N	\N
42	88	88	1638	23	\N	\N
43	170	136	1766	265	\N	\N
45	88	88	1635		\N	\N
46	88	88	1671	23	\N	\N
47	88	88	1847		\N	\N
48	88	102	1722	14	\N	\N
49	88	88	1848		\N	\N
50	88	113	1639	3	\N	\N
52	88	115	1723		\N	\N
53	23	158	1	1071	\N	\N
55	158	295	1874	11	\N	\N
56	5	285	1875	909	\N	\N
57	5	286	1876	11 A	\N	\N
58	171	287	1878	68 A	\N	\N
59	157	84	1879	34	\N	\N
60	88	288	1881	53	\N	\N
61	157	26	1882	412	\N	\N
62	157	21	1883	11	\N	\N
63	5	13	1884	5	\N	\N
64	157	152	1885	1412	\N	\N
66	171	287	1887	36	\N	\N
67	157	24	1888	219	\N	\N
68	5	48	1889	810 B	\N	\N
69	157	18	1890	42 A	\N	\N
70	5	3	1892	18	\N	\N
71	157	6	1893	62	\N	\N
73	157	5	1895	115	\N	\N
74	157	24	1896	463	\N	\N
75	157	84	1897	23	\N	\N
76	5	46	1898	26	\N	\N
77	5	291	1900	13	\N	\N
78	158	292	1901	4 B	\N	\N
79	158	239	1902	1890	\N	\N
80	50	293	1904	30	\N	\N
81	8	71	1905		\N	\N
82	157	3	1906	26	\N	\N
83	157	294	1907	1 A	\N	\N
84	13	122	1669	16	\N	\N
85	88	88	1767		\N	\N
86	88	88	1849		\N	\N
87	88	88	1819		\N	\N
88	88	88	1672		\N	\N
89	26	148	761	30	\N	\N
90	88	113	1634	571	\N	\N
65	157	23	1886		\N	\N
51	88	133	1818	11	\N	\N
91	88	104	1673	102	\N	\N
93	26	150	763	161	\N	\N
94	23	128	764	441	\N	\N
95	26	18	765	504A	\N	\N
97	26	152	767	32	\N	\N
98	88	206	1791	1083	\N	\N
99	26	18	768	502	\N	\N
100	88	124	1695		\N	\N
102	88	95	1696	22	\N	\N
103	26	157	770	1	\N	\N
104	26	155	771	579	\N	\N
105	88	100	1697	16	\N	\N
106	26	156	772	61	\N	\N
107	88	100	1593	16	\N	\N
108	88	100	1591	16	\N	\N
109	23	128	773	446B	\N	\N
110	88	125	1698	131	\N	\N
111	23	158	774	939	\N	\N
112	88	95	1690	21	\N	\N
113	26	159	775	1550	\N	\N
118	88	102	1594	13	\N	\N
119	26	160	776	32	\N	\N
120	88	93	1574	15	\N	\N
121	26	161	777	1172	\N	\N
122	26	162	778	1158	\N	\N
123	22	163	779	120	\N	\N
124	23	164	780	141	\N	\N
125	26	165	781	22	\N	\N
127	26	18	783	3	\N	\N
130	22	168	786	153	\N	\N
131	26	169	787	3	\N	\N
132	22	116	788	997	\N	\N
134	26	170	789	53	\N	\N
136	26	170	791	53	\N	\N
138	23	162	793	786	\N	\N
139	26	156	794	71	\N	\N
140	26	171	795	20	\N	\N
141	26	155	796	593	\N	\N
142	23	128	797	455	\N	\N
126	26	166	782	80	AP 16	\N
128	26	166	784	80	AP 09	\N
143	26	157	798	14	\N	\N
145	26	170	800	22	\N	\N
146	26	150	801	3	\N	\N
148	26	177	803	15	\N	\N
149	26	18	804	52	\N	\N
150	26	150	805	604	\N	\N
152	26	157	807	1	\N	\N
153	26	183	808		\N	\N
154	18	184	809	26	\N	\N
155	26	185	810	61	\N	\N
156	167	186	811	520	\N	\N
158	168	63	813	1525	\N	\N
159	22	148	814	23	\N	\N
160	26	18	815	175	\N	\N
161	26	159	816	1523	\N	\N
163	26	183	818	17	\N	\N
164	26	188	819	44	\N	\N
165	26	189	820	9	\N	\N
166	26	190	821	6	\N	\N
167	22	55	822	604	\N	\N
170	23	193	824	285	\N	\N
171	22	148	825	23B	\N	\N
172	26	157	826	570D	\N	\N
173	26	194	827	399	\N	\N
174	26	148	828	50	\N	\N
175	26	195	829	91	\N	\N
176	26	196	830	20	\N	\N
177	26	150	831	3	\N	\N
178	22	197	832	39	\N	\N
179	26	196	833	18	\N	\N
180	23	128	834	455	\N	\N
181	23	198	835	36	\N	\N
182	26	162	836	1154	\N	\N
183	23	199	837	16	\N	\N
184	26	157	838	3	\N	\N
185	22	200	839	168	\N	\N
186	26	165	840	10	\N	\N
187	26	165	841	26	\N	\N
188	26	148	842	2	\N	\N
189	26	129	843	20	\N	\N
190	23	201	844	30	\N	\N
191	23	128	845	446B	\N	\N
192	26	202	846	519	\N	\N
194	119	190	848	6	\N	\N
196	26	116	850	250	\N	\N
197	26	148	851	14	\N	\N
198	22	205	852	771	\N	\N
199	26	185	853	134	\N	\N
200	26	128	854	882	\N	\N
201	88	88	1640	113	\N	\N
202	23	162	855	222	\N	\N
203	23	197	856		\N	\N
204	26	170	857	54	\N	\N
205	26	148	858	30	\N	\N
206	26	194	859	8	\N	\N
207	18	184	860	102	\N	\N
208	13	130	1820	3	\N	\N
209	88	120	1745	7	\N	\N
210	88	103	1595	6	\N	\N
211	88	88	1792	22	\N	\N
213	88	369	1633	6	\N	\N
214	18	206	861	47	\N	\N
215	26	185	862	87	\N	\N
216	88	369	1699	6	\N	\N
217	88	88	1850		\N	\N
218	174	117	1693	149	\N	\N
219	26	148	863	8	\N	\N
220	88	88	1851		\N	\N
221	26	207	864	7	\N	\N
222	26	208	865	24	\N	\N
223	18	147	866	92B	\N	\N
224	88	115	1641	52	\N	\N
226	168	210	868	4	\N	\N
227	88	137	1768	10	\N	\N
228	26	76	869	76	\N	\N
229	168	211	870	313	\N	\N
230	88	88	1769	10	\N	\N
231	26	212	871	27	\N	\N
232	23	77	872	26	\N	\N
233	88	370	1700		\N	\N
234	88	369	1632	20	\N	\N
235	88	94	1575	5	\N	\N
236	174	369	1746		\N	\N
237	26	213	873	35	\N	\N
238	26	214	874	13	\N	\N
239	26	161	875	1190	\N	\N
241	23	162	877	1174	\N	\N
242	26	148	878	8	\N	\N
243	26	185	879	159	\N	\N
244	26	165	880	22	\N	\N
245	23	59	881	205	\N	\N
246	26	128	882	262	\N	\N
248	26	155	884	5	\N	\N
249	26	152	885	32	\N	\N
250	26	165	886	10	\N	\N
251	26	157	887	570	\N	\N
253	23	162	889	164A	\N	\N
254	23	162	890	164A	\N	\N
255	18	184	891	26	\N	\N
256	26	196	892	78	\N	\N
258	26	216	894	7	\N	\N
259	174	369	1747		\N	\N
260	88	369	1748	3	\N	\N
261	23	217	895	749	\N	\N
262	23	217	896	421	\N	\N
263	13	122	1793	16	\N	\N
265	174	107	1618		\N	\N
169	27	159	823	1520		\N
264	26	73	897	14	\N	\N
267	22	197	898	634A	\N	\N
268	88	369	1642	10	\N	\N
266	88	104	1596	102	\N	\N
269	22	197	899	448	\N	\N
270	88	88	1794		\N	\N
271	88	369	1852		\N	\N
272	88	369	1631	132	\N	\N
273	88	105	1597	1332	\N	\N
274	88	87	1626	20	\N	\N
275	88	369	1809		\N	\N
276	88	113	1630	571	\N	\N
277	88	369	1821	1	\N	\N
278	88	280	1702	6	\N	\N
279	26	111	1703	269	\N	\N
280	174	73	1795	5	\N	\N
281	88	106	1598		\N	\N
282	88	369	1622	21	\N	\N
285	88	88	1622		\N	\N
286	88	369	1643	28	\N	\N
287	88	88	1644		\N	\N
288	174	369	1810		\N	\N
289	174	369	1726	3	\N	\N
290	88	88	1689		\N	\N
291	174	369	1645	1	\N	\N
292	88	88	1646		\N	\N
295	23	217	903	563	\N	\N
296	88	98	1725	4000	\N	\N
297	88	107	1749	226	\N	\N
298	88	107	1599	315	\N	\N
299	26	190	904	6B	\N	\N
300	88	115	1674	4	\N	\N
301	174	369	1675		\N	\N
303	88	369	1629	143	\N	\N
304	88	369	1823	13	\N	\N
305	26	190	906	6C	\N	\N
306	88	88	1704		\N	\N
307	26	165	907	10	\N	\N
308	88	108	1600	4	\N	\N
309	88	88	1724	14	\N	\N
310	176	219	908	41	\N	\N
311	29	145	1853	113	\N	\N
312	23	193	909	285	\N	\N
313	88	88	1576	42	\N	\N
314	88	95	1601	21	\N	\N
315	88	126	1701	107	\N	\N
316	88	369	1602	12	\N	\N
317	88	88	1727	38	\N	\N
318	88	95	1577	21	\N	\N
319	88	88	1676	43	\N	\N
320	88	369	1624		\N	\N
321	22	197	910	180	\N	\N
322	88	88	1750		\N	\N
323	23	116	911	16	\N	\N
325	88	116	1822	37	\N	\N
327	88	87	1705	20	\N	\N
329	88	123	1677	12	\N	\N
330	88	115	1647	179	\N	\N
331	18	221	915	30	\N	\N
332	13	130	1235	2	\N	\N
333	26	76	916	10	\N	\N
334	169	132	1812	8	\N	\N
335	18	184	917	102	\N	\N
336	88	88	1578	70	\N	\N
337	26	222	918	30	\N	\N
338	169	101	1751	62	\N	\N
339	174	369	1752		\N	\N
340	23	116	919	250	\N	\N
341	88	96	1579	20	\N	\N
342	26	223	920	1440	\N	\N
343	177	127	1706	918	\N	\N
344	174	369	1796		\N	\N
345	88	128	1707	4	\N	\N
346	88	123	1680	12	\N	\N
347	13	369	1728		\N	\N
348	88	138	1770	9	\N	\N
349	26	157	921	7579	\N	\N
350	26	223	922	1446	\N	\N
352	88	96	1628	20	\N	\N
353	13	129	1708	25	\N	\N
354	13	88	1771	6	\N	\N
355	174	310	1603	243	\N	\N
356	169	54	1753	19	\N	\N
357	169	54	1772	19	\N	\N
358	174	369	1824		\N	\N
359	88	96	1580	20	\N	\N
360	88	88	1825		\N	\N
361	88	88	1729		\N	\N
362	13	130	1730	22	\N	\N
363	88	369	1648	4	\N	\N
364	88	99	1649	11	\N	\N
365	88	369	1854		\N	\N
366	88	369	1773		\N	\N
367	13	122	1855	150	\N	\N
368	88	369	1797		\N	\N
369	88	280	1688	1083	\N	\N
370	88	54	1798	19	\N	\N
371	88	369	1604		\N	\N
372	174	369	1799		\N	\N
374	88	369	1800	3	\N	\N
375	88	88	1581	15	\N	\N
376	88	108	1651	4	\N	\N
377	88	88	1754		\N	\N
378	88	369	1709	47	\N	\N
379	88	369	1636	52	\N	\N
381	174	249	1652		\N	\N
382	88	88	1710		\N	\N
383	88	88	1857	135	\N	\N
384	88	88	1731	24	\N	\N
385	88	88	1856		\N	\N
386	88	115	1755	8	\N	\N
387	88	371	1779	39	\N	\N
283	175	309	900	250	AP 307	\N
388	88	369	1858		\N	\N
389	13	130	1733	22	\N	\N
390	88	141	1826	672	\N	\N
391	88	88	1801	120	\N	\N
392	174	96	1732		\N	\N
393	88	369	1605	119	\N	\N
394	174	369	1802		\N	\N
395	88	369	1606	13	\N	\N
396	88	369	1711	13	\N	\N
397	174	88	1803		\N	\N
398	88	143	1827	3	\N	\N
399	88	230	1582	69	\N	\N
401	88	88	1712	83	\N	\N
402	88	142	1828	23	\N	\N
403	88	87	1569	20	\N	\N
404	88	54	1607	4	\N	\N
405	88	98	1583	9	\N	\N
406	88	105	1804	1396	\N	\N
407	88	369	1681	83	\N	\N
408	88	88	1829		\N	\N
409	18	190	1859	20	\N	\N
410	88	105	1830	1332	\N	\N
411	88	369	1653	5	\N	\N
412	88	88	1860		\N	\N
413	88	88	1861		\N	\N
414	174	117	1654		\N	\N
415	174	88	1584	111	\N	\N
416	174	369	1774		\N	\N
417	88	88	1585		\N	\N
418	88	88	1862		\N	\N
419	88	88	1713	15	\N	\N
420	88	88	1586		\N	\N
421	88	108	1775	75	\N	\N
422	88	88	1831		\N	\N
423	88	88	1832		\N	\N
424	88	140	1813	1	\N	\N
425	88	88	1734	32	\N	\N
426	88	88	1655		\N	\N
427	88	117	1682		\N	\N
428	88	143	1833	3	\N	\N
429	13	130	1776	3	\N	\N
430	88	88	1714	111	\N	\N
431	174	369	1619		\N	\N
432	88	131	1834	18	\N	\N
433	174	369	1571		\N	\N
434	88	88	1835		\N	\N
435	88	88	1608		\N	\N
436	169	124	1777	12	\N	\N
437	88	131	1735	19	\N	\N
438	88	88	1863	28	\N	\N
439	88	280	1736	6	\N	\N
440	88	132	1737	105	\N	\N
441	88	111	1609	249	\N	\N
442	88	132	1610	105	\N	\N
443	174	369	1656		\N	\N
444	18	114	1620	2713	\N	\N
445	88	369	1611	23	\N	\N
446	88	369	1836		\N	\N
447	88	88	1657		\N	\N
448	174	121	1668	8	\N	\N
449	88	88	1864		\N	\N
450	174	369	1805		\N	\N
451	88	88	1625		\N	\N
457	88	107	923	205	\N	\N
458	23	224	924	29	\N	\N
459	23	225	925	391	\N	\N
460	23	199	926	16A	\N	\N
462	26	188	928	14	\N	\N
463	23	162	929	589	\N	\N
464	23	162	930	996	\N	\N
465	26	207	931	27	\N	\N
466	26	159	932	1523	\N	\N
467	26	18	933	52	\N	\N
468	23	128	934	S/N	\N	\N
470	26	193	936	632	\N	\N
471	22	228	937	114	\N	\N
472	26	183	938	17	\N	\N
473	26	229	939	13	\N	\N
474	23	193	940	206	\N	\N
475	26	169	941	68	\N	\N
477	23	116	943	39	\N	\N
478	23	128	944	359	\N	\N
479	23	128	945	476	\N	\N
480	26	157	946	557	\N	\N
482	23	128	948	446B	\N	\N
483	23	162	949	1415	\N	\N
484	26	148	950	8	\N	\N
486	26	18	952	466	\N	\N
487	88	240	953	72	\N	\N
488	26	166	954	13A	\N	\N
489	26	185	955	26	\N	\N
490	26	231	956	2A	\N	\N
491	18	232	957	3A	\N	\N
492	18	233	958	8	\N	\N
493	23	197	959	262	\N	\N
494	26	189	960	98	\N	\N
495	23	202	961	153	\N	\N
496	26	188	962	9	\N	\N
497	26	162	963	781	\N	\N
498	22	234	964	123	\N	\N
499	36	190	965	39	\N	\N
500	26	162	966	222	\N	\N
501	22	59	967	120	\N	\N
502	18	280	968	132	\N	\N
503	23	158	969	834	\N	\N
504	36	190	970	20	\N	\N
505	23	162	971	913A	\N	\N
506	22	228	972	33	\N	\N
507	26	236	973	517	\N	\N
508	23	152	974	17	\N	\N
510	26	152	976	15	\N	\N
511	18	238	977	17	\N	\N
512	23	217	978	417	\N	\N
461	26	227	927	91	LOTE 390 Q19	\N
513	36	190	979	18	\N	\N
515	26	150	981	610	\N	\N
516	23	239	982	433	\N	\N
517	26	232	983	49	\N	\N
518	23	162	984	797	\N	\N
519	23	162	985	342	\N	\N
520	88	240	986	63	\N	\N
522	23	162	988	45	\N	\N
523	23	162	989	586	\N	\N
524	23	242	990	36	\N	\N
525	26	150	991	30	\N	\N
526	26	217	992	749	\N	\N
527	26	76	993	110	\N	\N
530	26	185	996	81	\N	\N
531	23	162	997	9	\N	\N
532	23	217	998	714	\N	\N
533	26	185	999	61B	\N	\N
536	26	207	1000	7	\N	\N
537	22	244	1001	89	\N	\N
538	26	18	1002	28	\N	\N
539	22	236	1003	495	\N	\N
541	23	128	1005	441	\N	\N
542	26	245	1006	31	\N	\N
543	26	150	1007	604	\N	\N
544	23	162	1008	766	\N	\N
545	88	111	1009	259	\N	\N
546	26	148	1010	35A	\N	\N
547	26	194	1011	4A	\N	\N
548	22	247	1012	56	\N	\N
549	26	18	1013	40A	\N	\N
550	26	196	1014	12A	\N	\N
551	23	205	1015	245	\N	\N
552	23	128	1016	259	\N	\N
553	23	197	1017	1010	\N	\N
554	23	193	1018	280	\N	\N
555	36	369	1019	19	\N	\N
556	18	280	1020	22	\N	\N
557	23	162	1021	766	\N	\N
558	22	217	1022	724	\N	\N
559	23	249	1023	242	\N	\N
560	26	250	1024	67A	\N	\N
561	26	116	1025	242	\N	\N
562	23	239	1026	160	\N	\N
563	22	157	1027	158	\N	\N
564	26	185	1028	87	\N	\N
565	26	229	1029	534D	\N	\N
566	26	157	1030	18	\N	\N
567	22	251	1031	97	\N	\N
568	174	369	1032		\N	\N
569	26	185	1033	54	\N	\N
570	26	162	1034	409	\N	\N
571	22	252	1035	173	\N	\N
572	18	206	1036	194	\N	\N
573	26	18	1037	46	\N	\N
575	18	129	1039	5	\N	\N
576	26	185	1040	461	\N	\N
577	18	190	1041	32A	\N	\N
579	18	190	1043	322	\N	\N
580	36	190	1044	74	\N	\N
581	23	128	1045	280	\N	\N
583	26	76	1047	65	\N	\N
584	23	205	1048	281	\N	\N
585	26	162	1049	496A	\N	\N
586	22	249	1050	661	\N	\N
587	23	239	1051	406A	\N	\N
588	23	256	1052	13	\N	\N
589	23	162	1053	157	\N	\N
590	18	190	1054	36	\N	\N
591	23	116	1055	240	\N	\N
592	88	369	1658		\N	\N
593	88	88	1837		\N	\N
594	88	105	1806	10	\N	\N
595	88	88	1865	28	\N	\N
596	88	88	1715	46	\N	\N
597	88	76	1720	43	\N	\N
598	88	88	1716	32	\N	\N
599	88	88	1866		\N	\N
600	88	88	1587	28	\N	\N
601	22	197	1056	634	\N	\N
602	170	101	1814	67	\N	\N
603	174	369	1659		\N	\N
604	174	369	1807		\N	\N
605	88	88	1612		\N	\N
606	88	372	1778	4	\N	\N
607	88	88	1867		\N	\N
608	88	88	1868		\N	\N
609	88	88	1678		\N	\N
610	88	88	1738		\N	\N
611	88	106	1757	10	\N	\N
612	88	369	1869		\N	\N
613	26	162	1057	530	\N	\N
615	13	373	1780	55	\N	\N
616	23	162	1059	1022	\N	\N
617	26	193	1060	269	\N	\N
618	168	259	1061	103A	\N	\N
619	23	162	1062	84	\N	\N
620	26	171	1063	20	\N	\N
621	26	193	1064	527	\N	\N
622	26	128	1065	820	\N	\N
623	26	161	1066	1175	\N	\N
625	23	158	1068	942	\N	\N
627	26	148	1380	26	\N	\N
628	26	148	1381	34	\N	\N
630	26	227	1070	91	\N	\N
631	26	374	1382	6	\N	\N
633	26	114	1072	1	\N	\N
540	26	159	1004	1520		\N
634	26	107	1073	245	\N	\N
635	26	159	1074	1523	\N	\N
636	88	369	1383	23	\N	\N
637	26	217	1384	635	\N	\N
638	22	252	1385	200	\N	\N
641	26	170	1387	43	\N	\N
642	22	200	1076	177	\N	\N
643	22	272	1388	15	\N	\N
644	26	199	1077	27	\N	\N
645	26	162	1389	945	\N	\N
646	26	160	1078	9	\N	\N
647	26	169	1079	33	\N	\N
648	18	375	1390	45	\N	\N
649	23	162	1080	403	\N	\N
650	25	376	1391	28	\N	\N
651	26	128	1081	355	\N	\N
652	26	116	1392	20	\N	\N
653	26	222	1393	15	\N	\N
654	22	262	1082	42	\N	\N
655	26	116	1394	568	\N	\N
656	23	116	1083	7	\N	\N
657	26	128	1395	401	\N	\N
658	26	330	1396	74	\N	\N
659	26	116	1397	2	\N	\N
660	26	236	1398	511	\N	\N
662	18	238	1400	17	\N	\N
663	22	269	1401	23	\N	\N
664	26	157	1402	14	\N	\N
665	18	347	1403	3	\N	\N
666	26	194	1404	4	\N	\N
667	26	193	1405	276	\N	\N
668	22	128	1406	1341	\N	\N
669	26	256	1407	15	\N	\N
670	26	190	1408	6	\N	\N
672	18	189	1410	159	\N	\N
673	16	353	1411	62	\N	\N
674	22	217	1412	417	\N	\N
675	22	383	1413	616	\N	\N
677	26	343	1415	2	\N	\N
679	26	191	1417	606	\N	\N
680	26	162	1418	922	\N	\N
681	18	347	1419	37	\N	\N
683	26	236	1421	384	\N	\N
685	26	128	1423	655	\N	\N
686	26	239	1424	388	\N	\N
687	18	347	1425	16	\N	\N
688	26	202	1426	187	\N	\N
689	22	326	1427	30	\N	\N
690	26	242	1428	63	\N	\N
691	26	162	1429	952	\N	\N
692	26	128	1430	634	\N	\N
693	26	162	1431	497	\N	\N
694	26	271	1432	84	\N	\N
697	18	185	1435	160	\N	\N
698	26	129	1436	23	\N	\N
700	22	247	1438	110	\N	\N
702	174	384	1440	17	\N	\N
703	26	236	1441	328	\N	\N
704	26	147	1442	80	\N	\N
705	26	201	1443	314	\N	\N
706	22	331	1444	141	\N	\N
707	26	272	1445	25	\N	\N
708	26	351	1446	26	\N	\N
710	26	162	1448	530	\N	\N
711	22	385	1449	148	\N	\N
712	26	170	1450	25	\N	\N
713	18	190	1451	33	\N	\N
715	170	386	1452	10		\N
717	18	232	1454	19		\N
718	26	334	1455	20		\N
719	26	201	1456	9		\N
720	26	147	1457	61		\N
721	26	193	1458	195		\N
722	26	162	1459	821		\N
723	26	388	1460	18		\N
724	174	384	1461	1		\N
725	26	116	1462	20		\N
726	26	340	1463	111		\N
727	26	239	1464	385		\N
728	22	269	1465	64		\N
729	26	116	1466	366		\N
730	26	129	1467	12		\N
731	22	162	1468	230		\N
732	26	148	1469	8		\N
733	26	390	1470	25		\N
734	26	183	1471	203		\N
735	26	391	1472	1304		\N
736	26	392	1473	11		\N
737	26	193	1474	195		\N
738	26	207	1475	5		\N
741	26	152	1478	32		\N
742	26	165	1479	10		\N
743	26	231	1480	46		\N
744	26	194	1481	27		\N
745	26	239	1482	160		\N
746	26	218	1483	84		\N
747	18	152	1484	24		\N
748	26	271	1485	42		\N
749	26	162	1486	845		\N
750	26	272	1487	106		\N
751	22	326	1488	26		\N
640	26	261	1075	80	AP 09	\N
753	25	359	1490	4		\N
754	26	169	1491	12		\N
755	26	271	1492	90		\N
756	18	190	1493	41		\N
757	18	190	1494	28		\N
758	26	191	1495	606		\N
759	26	18	1496	124		\N
760	26	189	1497	9		\N
761	26	393	1498	7		\N
762	26	231	1499	102		\N
763	26	202	1500	519		\N
764	26	162	1501	1220		\N
765	26	128	1502	408		\N
766	22	262	1503	275		\N
767	22	128	1504	941		\N
768	26	278	1505	12		\N
769	22	274	1506	64		\N
771	22	282	1508	59		\N
772	26	162	1509	1313		\N
773	22	197	1510	262		\N
774	36	190	1511	1		\N
775	18	375	1512	16		\N
776	26	202	1513	165		\N
777	22	247	1514	47		\N
778	26	214	1515	16		\N
779	26	223	1516	1437		\N
780	22	200	1517	176		\N
781	26	161	1518	1110		\N
782	26	217	1519	472		\N
783	22	269	1520	47		\N
784	26	330	1521	88		\N
785	26	334	1522	54		\N
786	26	157	1523	3		\N
787	26	218	1524	99		\N
788	22	395	1525	16		\N
789	26	194	1526	569		\N
790	26	77	1527	88		\N
791	26	340	1528	28		\N
792	26	392	1529	11		\N
794	26	128	1531	280		\N
795	26	363	1532	717		\N
797	26	363	1534	629		\N
798	174	148	1535	30		\N
799	22	197	1536	614		\N
800	26	162	1537	821		\N
801	26	193	1538	522		\N
802	26	162	1539	396		\N
803	22	200	1540	226		\N
804	26	162	1541	459		\N
805	170	157	1542	28		\N
806	18	336	1543	92		\N
807	26	363	1544	77		\N
808	22	239	1545	272		\N
809	22	218	1546	145		\N
810	22	331	1547	54		\N
811	26	170	1548	67		\N
812	26	157	1549	570		\N
813	18	396	1550	17		\N
814	26	190	1551	6		\N
815	16	79	1552	50		\N
816	26	216	1553	71		\N
817	18	238	1554	34		\N
818	26	129	1555	37		\N
819	18	190	1556	53		\N
820	169	76	1557	6		\N
822	16	397	1559	35		\N
823	18	190	1560	38		\N
824	18	190	1561	28		\N
825	18	280	1562	33		\N
827	18	398	1564	28		\N
828	26	256	1565	17		\N
829	26	160	1566	32		\N
832	88	369	1871	NAO IDENTIFICADO		\N
833	88	88	1683	29	RUA DA IGREJA	\N
834	88	88	1739	135		\N
835	88	88	1684	NAO IDENTIFICADO		\N
836	88	88	1719	37		\N
837	88	88	1667	NAO IDENTIFICADO		\N
838	88	88	1870	NAO IDENTIFICADO		\N
839	88	119	1627	10		\N
840	88	260	1613	5		\N
841	88	88	1717	12		\N
842	88	107	1838	226		\N
843	169	119	1781	10		\N
844	88	280	1758	21		\N
845	88	119	1839	10		\N
846	18	281	1782	38		\N
847	13	130	1783	153		\N
848	26	118	1660	44		\N
849	26	147	1872	162		\N
850	174	369	1759	NAO IDENTIFICADO		\N
851	174	369	1760	NAO IDENTIFICADO		\N
852	88	94	1691	21		\N
853	88	88	1666	119		\N
854	88	107	1661	226		\N
855	88	88	1662	33		\N
856	88	119	1663	10		\N
857	88	131	1873	19		\N
858	88	119	1740	10		\N
859	88	120	1664	5		\N
860	88	88	1685	62		\N
861	88	96	1588	12		\N
862	88	112	1614	189		\N
863	88	88	1718	113		\N
864	88	88	1840	NAO IDENTIFICADO		\N
865	169	101	1687	NAO IDENTIFICADO		\N
866	88	88	1665	NAO IDENTIFICADO		\N
867	88	98	1741	NAO IDENTIFICADO		\N
868	88	115	1784	5		\N
869	88	115	1785	5		\N
870	88	106	1787	29		\N
871	88	88	1841	NAO IDENTIFICADO		\N
872	88	108	1761	4		\N
873	174	369	1762	NAO IDENTIFICADO		\N
875	88	113	1615	105		\N
876	88	139	1786	66		\N
877	88	369	1616	131		\N
878	88	54	1842	19		\N
879	88	99	1589	9		\N
880	88	144	1843	11		\N
881	88	121	1844	5		\N
882	88	119	1808	15		\N
883	88	88	1845	NAO IDENTIFICADO		\N
884	88	399	1621	11		\N
885	174	369	1788	NAO IDENTIFICADO		\N
886	88	369	1590	3		\N
887	23	116	1083	7		\N
890	26	231	1086	102B		\N
891	18	190	1087	46		\N
892	22	116	1088	28		\N
893	22	60	1089	26		\N
894	23	256	1090	39		\N
899	23	401	1091	126		\N
900	23	236	1092	398		\N
901	18	280	1093	81		\N
902	23	265	1094	104		\N
903	18	266	1095	194		\N
904	23	401	1096	167		\N
905	22	267	1097	48		\N
906	26	268	1098	13B		\N
907	26	190	1099	3		\N
908	26	261	1100	62		\N
909	23	401	1101	126		\N
910	22	269	1102	56		\N
911	23	162	1103	403		\N
912	88	227	1104	111		\N
913	23	217	1105	417		\N
914	26	271	1106	8		\N
915	26	188	1107	6		\N
916	26	272	1108	178		\N
917	174	369	1109	0		\N
918	23	193	1110	254		\N
920	26	185	1112	45		\N
921	26	402	1113	23		\N
922	22	191	1114	604		\N
923	26	232	1115	12		\N
924	23	76	1116	19		\N
925	23	116	1117	20		\N
926	25	273	1118	5		\N
927	178	230	1119	19	LOTE 19 Q 3	\N
928	18	232	1120	49		\N
929	23	162	1121	797A		\N
930	22	200	1122	168		\N
931	36	190	1123	82		\N
932	22	274	1124	124A		\N
933	23	162	1125	1256		\N
934	22	276	1126	160		\N
935	22	200	1127	12A		\N
936	18	232	1128	35		\N
937	22	277	1129	104		\N
938	18	184	1130	208		\N
939	22	168	1131	180		\N
940	26	150	1132	604		\N
941	26	193	1133	325		\N
942	88	240	1134	63		\N
943	88	240	1135	63		\N
944	26	165	1136	5		\N
945	26	129	1137	20		\N
946	26	76	1138	68		\N
947	23	217	1139	642		\N
948	23	236	1140	495		\N
949	26	232	1141	24		\N
950	26	150	1142	3		\N
951	26	278	1143	68		\N
952	23	128	1144	441		\N
953	22	197	1145	180		\N
954	23	193	1146	580		\N
955	26	216	1147	7		\N
956	23	162	1148	366		\N
957	23	279	1149	355		\N
958	26	222	1150	7		\N
959	26	231	1151	81		\N
960	18	280	1152	41		\N
961	18	281	1153	36		\N
962	23	59	1154	126		\N
963	22	76	1155	84		\N
964	26	271	1156	11		\N
965	22	164	1157	326		\N
966	26	177	1158	9		\N
967	23	128	1159	208		\N
968	22	282	1160	158A		\N
969	23	162	1161	796		\N
970	22	247	1162	78		\N
971	18	283	1163	22		\N
972	23	162	1164	287		\N
973	23	77	1165	12		\N
974	26	18	1166	131A		\N
975	18	280	1167	47		\N
976	23	197	1168	69		\N
977	18	54	1169	21		\N
978	18	238	1170	22		\N
979	23	162	1171	459		\N
980	26	236	1172	246		\N
982	23	217	1174	584		\N
983	26	128	1175	297		\N
985	26	231	1177	64		\N
986	18	190	1178	53		\N
987	23	158	1179	717		\N
988	23	236	1180	256		\N
989	23	197	1181	485A		\N
990	26	194	1182	399		\N
991	29	325	1183	7		\N
992	36	190	1184	48		\N
993	22	326	1185	36		\N
994	23	162	1186	815		\N
996	26	328	1188	1314		\N
997	26	232	1189	3		\N
998	26	183	1190	S/N		\N
999	26	329	1191	1106A		\N
1000	26	232	1192	30		\N
1001	22	272	1193	8		\N
1002	23	157	1194	7		\N
1003	26	116	1195	10		\N
1004	26	162	1196	996		\N
1005	23	193	1197	359		\N
1006	26	196	1198	48		\N
1007	23	193	1199	476		\N
1008	18	190	1200	46		\N
1009	23	193	1201	580		\N
1010	26	196	1202	18		\N
1011	26	330	1203	1		\N
1012	26	330	1204	1		\N
1013	22	197	1205	371		\N
1014	23	116	1206	169		\N
1015	22	217	1207	543		\N
1016	22	277	1208	105		\N
1017	23	162	1209	1248		\N
1018	22	331	1210	134		\N
1019	22	332	1211	76		\N
1020	26	229	1212	534		\N
1021	18	189	1213	9		\N
1022	22	197	1214	275		\N
1023	18	333	1215	22		\N
1024	26	334	1216	14		\N
1025	26	150	1217	31		\N
1026	22	218	1218	16		\N
1027	26	76	1219	8		\N
1028	26	162	1220	589		\N
1029	23	128	1221	446		\N
1030	23	239	1222	136		\N
1031	26	161	1223	1172		\N
1032	26	197	1224	312		\N
1034	26	272	1226	210A		\N
1035	26	169	1227	4		\N
1036	26	336	1228	28		\N
1037	23	205	1229	771		\N
1038	26	161	1230	487		\N
1039	88	369	1231	26		\N
1040	179	280	1908	S/N		\N
1041	158	295	1909	54		\N
1042	157	18	1910	42A		\N
1043	157	18	1911	260		\N
1044	158	296	1912	12		\N
1045	171	297	1913	7		\N
1046	5	286	1914	23		\N
1047	157	82	1915	86		\N
1048	10	298	1916	3		\N
1049	57	299	1917	101		\N
1050	158	292	1919	12		\N
1051	157	26	1920	2		\N
1052	171	300	1921	115		\N
1053	171	378	1922	35		\N
1054	57	299	1923	32AP		\N
1055	8	379	1924	S/N		\N
1056	157	84	1925	171		\N
1057	88	302	1926	71		\N
1058	157	300	1927	101		\N
1059	5	44	1928	970CS		\N
1060	160	239	1929	93		\N
1061	157	303	1930	5		\N
1062	22	247	1232	110		\N
1063	26	193	1233	527		\N
1064	26	330	1234	85		\N
1065	22	337	1235	46		\N
1067	26	157	1237	602A		\N
1068	22	272	1238	15		\N
1070	26	231	1240	2		\N
1071	26	162	1241	354		\N
1072	36	264	1242	14		\N
1073	23	73	1243	20		\N
1074	23	128	1244	354		\N
1076	22	277	1246	104		\N
1077	23	340	1247	55		\N
1078	170	341	1248	46		\N
1079	88	157	1249	306		\N
1080	22	247	1250	103		\N
1081	18	342	1251	16		\N
1082	26	116	1252	251		\N
1083	26	170	1253	71		\N
1084	22	168	1254	148		\N
1085	22	251	1255	74		\N
1086	26	162	1256	1004		\N
1087	23	239	1257	221		\N
1088	26	343	1258	9		\N
1089	26	116	1259	57		\N
1090	23	217	1260	543		\N
1091	26	148	1261	1716		\N
1092	23	217	1262	678		\N
1094	23	207	1264	6		\N
1095	22	277	1265	104		\N
1096	26	18	1266	466		\N
1097	22	116	1267	28		\N
1098	22	344	1268	88		\N
1099	26	222	1269	2		\N
1100	26	222	1270	16		\N
1101	18	345	1271	23		\N
1102	23	162	1272	156		\N
1103	22	247	1273	56		\N
1104	26	346	1275	10		\N
1105	23	164	1276	457		\N
1106	23	256	1277	23		\N
1107	26	346	1278	13		\N
1108	26	169	1279	5		\N
1109	23	162	1280	1220		\N
1110	23	158	1281	881		\N
1111	23	202	1282	391		\N
1112	18	347	1283	4		\N
1113	26	217	1284	669		\N
1114	23	76	1285	26		\N
1115	18	206	1286	120		\N
1116	26	363	1287	797		\N
1117	86	297	1931	512A		\N
1118	57	304	1933	60		\N
1119	15	305	1934	31		\N
1120	160	295	1935	S/N		\N
1121	157	295	1936	2105		\N
1122	157	47	1937	1159-1		\N
1123	157	304	1938	3		\N
1124	157	306	1939	3		\N
1125	86	26	1940	180A		\N
1126	160	292	1941	08 SGA		\N
1127	5	46	1942	8		\N
1128	160	307	1943	14		\N
1129	160	308	1944	S/N		\N
1130	158	122	1945	24		\N
1131	88	310	1947	203		\N
1132	5	191	1948	S/N		\N
1133	160	191	1951	S/N		\N
1134	181	311	1952	41		\N
1135	160	307	1953	700		\N
1136	5	312	1954	33		\N
1137	160	191	1955	S/N		\N
1138	157	2	1958	48		\N
1139	31	313	1960	106		\N
1140	88	314	1963	32		\N
1141	166	315	1964	16		\N
1142	157	24	1965	131		\N
1143	171	287	1966	345		\N
1144	157	8	1968	300		\N
1145	157	16	1969	28		\N
1146	5	3	1970	S/N		\N
1147	86	287	1973	36		\N
1148	157	300	1974	108F		\N
1149	157	300	1975	12		\N
1150	157	6	1976	62		\N
1151	157	300	1979	45A		\N
1152	39	316	1980	1 PR 7		\N
1153	157	8	1983	S/N		\N
1154	158	191	1984	30		\N
1155	158	236	1985	61		\N
1156	88	302	1986	92		\N
1157	86	40	1988	53		\N
1158	86	24	1990	30		\N
1159	158	122	1991	21		\N
1160	5	2	1992	55		\N
1161	86	41	1993	361		\N
1162	158	296	1994	12LD		\N
1163	158	122	1996	50		\N
1164	86	26	1997	204		\N
1165	157	300	2000	101CS		\N
1166	157	8	2002	S/N		\N
1167	15	317	2004	130		\N
1168	88	318	2007	141		\N
1169	86	40	2008	286		\N
1170	157	26	2011	461		\N
1171	157	4	2012	58		\N
1173	173	405	2013	153		\N
1175	88	288	2014	63		\N
1176	157	303	2015	5		\N
1177	26	77	1288	45		\N
1178	26	193	1289	427		\N
1179	5	286	2019	S/N		\N
1181	5	2	2020	S/N		\N
1182	36	190	1291	182		\N
1183	57	299	2021	20		\N
1184	26	349	1292	1A		\N
1185	158	295	2022	13		\N
1186	26	193	1293	1		\N
1187	23	236	1294	316		\N
1188	18	280	1295	199		\N
1189	86	26	2023	238A		\N
1190	158	239	2024	493		\N
1191	158	122	2025	7		\N
1192	5	320	2026	3		\N
1193	158	183	2027	7		\N
1194	160	321	2028	37		\N
1195	5	3	2029	18		\N
1196	158	122	2030	7		\N
1197	171	11	2031	138		\N
1198	5	320	2032	9		\N
1199	171	297	2033	83		\N
1200	158	295	2034	12		\N
1201	158	323	2035	7		\N
1202	88	310	2036	203		\N
1203	50	324	2037	S/N		\N
1204	86	40	2038	6		\N
1205	158	122	2040	21		\N
1206	26	159	1296	1537		\N
1207	158	239	2041	480		\N
1208	26	351	1297	14		\N
1209	18	347	1298	16		\N
1210	31	313	2042	106		\N
1211	18	280	1299	110		\N
1212	31	313	2043	106		\N
1213	22	148	1300	30B		\N
1214	26	162	1301	177		\N
1215	23	218	1302	111		\N
1216	36	190	1303	14		\N
1217	23	129	1304	23		\N
1218	22	239	1305	338		\N
1219	23	236	1306	289		\N
1220	23	193	1307	280		\N
624	88	260	1067	6	LOTEAMENTO SAO CARLOS	\N
481	178	230	947	19	LOTE 19 Q3	\N
324	26	185	912	167	AP 10	\N
162	26	147	817	50	AP 201	\N
1223	22	352	1309	NAO IDENTIFICADO		\N
1225	22	276	1310	160		\N
1226	26	360	1378	21		\N
1227	23	152	1311	4A		\N
1228	26	18	1377	490		\N
1229	22	353	1312	217		\N
1230	26	368	1376	25		\N
1231	26	364	1313	5		\N
1232	26	232	1314	25		\N
1233	26	157	1375	13-A		\N
1234	22	353	1315	191		\N
1235	23	239	1374	406		\N
1236	22	326	1373	28		\N
1237	23	236	1316	356		\N
1241	26	161	1319	1106		\N
1242	174	369	1371	NAO IDENTIFICADO		\N
1243	23	152	1320	11		\N
1244	170	367	1370	765		\N
1245	26	202	1321	585		\N
1246	22	352	1322	S/N		\N
1247	23	193	1323	206		\N
1248	23	129	1369	403		\N
1249	23	116	1324	25		\N
1250	18	221	1368	16		\N
1251	157	46	2295	1383		\N
1252	23	162	1325	459		\N
1253	36	190	1367	6		\N
1254	23	256	1326	6		\N
1255	157	5	2296	04		\N
1256	23	197	1327	275		\N
1257	18	221	1366	16		\N
1258	22	353	1328	345		\N
1259	23	129	1329	153		\N
1260	26	366	1365	16		\N
1261	23	158	1330	960		\N
1262	26	157	1364	13		\N
1263	23	128	1331	558		\N
1264	182	406	2297	34		\N
1265	174	369	1363	NAO IDENTIFICADO		\N
1266	26	360	1362	10		\N
1267	22	353	1332	205		\N
1268	26	76	1361	6-B		\N
1269	23	128	1333	634		\N
1270	25	359	1360	450		\N
1271	18	232	1359	12		\N
1272	23	162	1334	497		\N
1273	26	160	1358	11		\N
1274	23	162	1335	415		\N
1275	26	358	1357	1009		\N
1276	26	334	1336	101D		\N
1277	23	128	1337	1019		\N
1278	23	128	1338	1019		\N
1279	23	150	1339	6010		\N
1280	23	236	1340	450		\N
1281	183	243	2294	1108		\N
1282	23	236	1340	450		\N
1283	18	221	1341	30		\N
1284	26	170	1356	1009		\N
1285	26	330	1342	83A		\N
1286	23	228	1355	50		\N
1287	23	357	1354	50		\N
1288	21	158	1353	746		\N
1289	23	202	1352	227		\N
1290	22	332	1351	76		\N
1291	183	187	1350	240		\N
1292	22	277	1349	104		\N
1293	23	225	1343	323		\N
1294	26	150	1344	7		\N
1295	176	356	1345	148		\N
1296	23	162	1346	354		\N
1297	23	128	1347	400		\N
1298	183	187	1348	227		\N
1299	50	407	2291	44		\N
1300	171	26	2292	49		\N
1301	184	408	2085	1420		\N
1302	186	409	2086	25		\N
1303	183	63	2245	13	VILA JOSE DANTAS	\N
1304	183	356	2246	99		\N
1305	183	412	2247	71		\N
1306	157	411	2248	681	AP 202	\N
1307	188	143	2087	S/N		\N
1308	26	358	2088	1050	CONJUNTO PROLAR	\N
1309	189	414	2089	377		\N
1310	167	186	2090	520		\N
1311	190	415	2249	46		\N
1312	170	416	2250	3		\N
1313	191	417	2251	2558	CONJUNTO PANATIS I	\N
1314	26	330	2252	20		\N
1315	192	418	2253	3553		\N
1316	191	419	2254	2555	CONJUNTO PANATIS	\N
1317	157	420	2255	1246	LOTEAMENTO SAMBURA	\N
1318	193	421	2256	68		\N
1319	26	159	2257	S/N	CONJUNTO PROLAR	\N
1320	23	193	2258	300		\N
1321	18	232	2259	66		\N
1322	191	422	2260	2325	CONJUNTO SANTA CATARIINA	\N
1323	183	423	2091	1824		\N
1324	191	424	2092	2910		\N
1325	26	170	2093	25		\N
1326	170	425	2094	568		\N
1327	186	426	2095	1301	CONDOMINIO ITATIAIA, TORRE BEGE	\N
1328	26	427	2096	14		\N
1329	28	428	2097	1725		\N
1330	26	271	2098	44		\N
1331	189	429	2099	1111		\N
1332	174	430	2100	146		\N
1333	194	431	2101	100		\N
1334	170	432	2102	1438		\N
1335	186	433	2103	1195		\N
1336	183	149	2104	358		\N
1337	195	434	2105	12		\N
1338	23	128	2261	1071		\N
1339	196	435	2106	365		\N
1340	183	203	2107	358		\N
1341	184	436	2108	1547		\N
1342	23	363	2262	817		\N
1343	197	437	2263	98		\N
1344	26	271	2109	96		\N
1345	23	128	2110	704		\N
1346	191	438	2111	1085	CONJUNTO SOLEDADE	\N
1347	198	439	2112	1244		\N
1348	199	440	2113	479	BLOCO F, AP 403	\N
1349	18	345	2114	21		\N
1350	195	441	2115	NAO IDENTIFICADO		\N
1351	56	442	2116	209		\N
1352	191	443	2117	31		\N
1353	201	444	2118	8020		\N
1354	186	433	2119	339	GUAIRA III, BLOCO 1/A, AP 304	\N
1355	29	445	2120	NAO IDENTIFICADO		\N
1356	203	446	2121	100	AP 1001, TORRE A	\N
1357	26	159	2122	1502	CONJUNTO PROLAR	\N
1358	192	447	2123	1888		\N
1359	183	354	2124	786		\N
1360	204	448	2125	51	CONJUNTO JARDIM AEROPORTO	\N
1361	26	147	2126	44		\N
1362	189	414	2089	377		\N
1363	160	296	2316	03		\N
1364	88	449	2331	19		\N
1365	184	450	2320	1063A		\N
1366	157	303	2307	15		\N
1367	54	451	2306	72		\N
1368	186	433	2305	78		\N
1369	88	157	2317	76		\N
1370	86	40	2308	0418		\N
1371	167	452	2318	80	BL 2 APTO 208	\N
1373	92	128	3160	25	efsdfsdf dd	59129-696
1374	92	128	3161	25	efsdfsdf dd	59129-696
1375	92	128	3162	25	dgh	59129-696
1376	92	128	3164	25	hgf	59129-696
1377	92	128	3165	25	hgf	59129-696
1378	92	128	3167	25	asdf	59129-696
1380	92	128	3175	3	wer	59129-696
1381	92	128	3176	3	wer	59129-696
1382	92	128	3177	25	2sdf	59129-696
1384	92	128	3181	2	234	59129-696
1407	23	256	1090	39		
1409	92	128	3270	58	teste	59129-696
1411	92	128	3272	33	sdf	59129-696
1412	92	128	3275	25	teste	59129-696
44	92	128	1790	789	cidade praia 1	59129-696
1385	92	128	3222	2588	SDFS444	59129-696
1386	92	128	3224	25	perto do posto	59129-696
1387	92	128	3225	25	perto do posto	59129-696
1388	92	128	3226	25	perto do posto	59129-696
1389	92	128	3227	25	perto do posto	59129-696
1390	92	128	3228	25	perto do posto	59129-696
1391	92	128	3230	25	perto do posto	59129-696
1394	92	128	3245	25	teste	59129-696
1395	92	128	3247	25	teste	59129-696
1396	92	128	3248	25	testes	59129-696
1397	92	128	3254	2566	perto do bar	59129-696
1398	92	128	3255	255	TESTE	59129-696
1402	92	128	3255	255	TESTE	59129-696
1403	92	128	1456	9		59129-696
1404	26	201	1456	9		
1405	26	201	1456	9		
1406	26	201	1456	9		
1413	92	128	3287	254	998	59129-696
\.


--
-- TOC entry 4530 (class 0 OID 0)
-- Dependencies: 376
-- Name: reside_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

SELECT pg_catalog.setval('reside_id_seq', 1413, true);


--
-- TOC entry 4141 (class 0 OID 25373)
-- Dependencies: 377
-- Data for Name: tipo_contato; Type: TABLE DATA; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

COPY tipo_contato (id, tipo_contato) FROM stdin;
\.


--
-- TOC entry 4531 (class 0 OID 0)
-- Dependencies: 378
-- Name: tipo_contato_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

SELECT pg_catalog.setval('tipo_contato_id_seq', 1, false);


SET search_path = cadastro_unico_protocolo, pg_catalog;

--
-- TOC entry 4143 (class 0 OID 25381)
-- Dependencies: 379
-- Data for Name: item; Type: TABLE DATA; Schema: cadastro_unico_protocolo; Owner: admin_db_sr
--

COPY item (id, lote_item_id, nome) FROM stdin;
\.


--
-- TOC entry 4532 (class 0 OID 0)
-- Dependencies: 380
-- Name: item_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_protocolo; Owner: admin_db_sr
--

SELECT pg_catalog.setval('item_id_seq', 1, false);


--
-- TOC entry 4145 (class 0 OID 25389)
-- Dependencies: 381
-- Data for Name: lote_item; Type: TABLE DATA; Schema: cadastro_unico_protocolo; Owner: admin_db_sr
--

COPY lote_item (id, lote) FROM stdin;
\.


--
-- TOC entry 4533 (class 0 OID 0)
-- Dependencies: 382
-- Name: lote_item_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_protocolo; Owner: admin_db_sr
--

SELECT pg_catalog.setval('lote_item_id_seq', 1, false);


--
-- TOC entry 4147 (class 0 OID 25397)
-- Dependencies: 383
-- Data for Name: movimentacao; Type: TABLE DATA; Schema: cadastro_unico_protocolo; Owner: admin_db_sr
--

COPY movimentacao (id, destino_id, lote_item_id, origem_id, tratamento_id, data_de_envio, data_de_recebimento) FROM stdin;
\.


--
-- TOC entry 4534 (class 0 OID 0)
-- Dependencies: 384
-- Name: movimentacao_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_protocolo; Owner: admin_db_sr
--

SELECT pg_catalog.setval('movimentacao_id_seq', 1, false);


--
-- TOC entry 4149 (class 0 OID 25402)
-- Dependencies: 385
-- Data for Name: tratamento; Type: TABLE DATA; Schema: cadastro_unico_protocolo; Owner: admin_db_sr
--

COPY tratamento (id, tratamento) FROM stdin;
\.


--
-- TOC entry 4535 (class 0 OID 0)
-- Dependencies: 386
-- Name: tratamento_id_seq; Type: SEQUENCE SET; Schema: cadastro_unico_protocolo; Owner: admin_db_sr
--

SELECT pg_catalog.setval('tratamento_id_seq', 1, false);


SET search_path = controle_de_acesso_a_dado, pg_catalog;

--
-- TOC entry 4151 (class 0 OID 25410)
-- Dependencies: 387
-- Data for Name: mapa_de_acesso; Type: TABLE DATA; Schema: controle_de_acesso_a_dado; Owner: admin_db_sr
--

COPY mapa_de_acesso (id, pessoa_id, cargos, celulas, organismos, denominacao, cargo_id, celula_id, organismo_id, restrito) FROM stdin;
3	1	1	1	1	\N	\N	\N	\N	f
\.


--
-- TOC entry 4536 (class 0 OID 0)
-- Dependencies: 388
-- Name: mapa_de_acesso_id_seq; Type: SEQUENCE SET; Schema: controle_de_acesso_a_dado; Owner: admin_db_sr
--

SELECT pg_catalog.setval('mapa_de_acesso_id_seq', 3, true);


--
-- TOC entry 4153 (class 0 OID 25418)
-- Dependencies: 389
-- Data for Name: vinculo_acesso; Type: TABLE DATA; Schema: controle_de_acesso_a_dado; Owner: admin_db_sr
--

COPY vinculo_acesso (id, esquema, idescola, tabela, idtabela) FROM stdin;
1	cadastro_unico_pessoal	8	pessoa	763
2	cadastro_unico_pessoal	8	pessoa	764
\.


--
-- TOC entry 4537 (class 0 OID 0)
-- Dependencies: 390
-- Name: vinculo_acesso_id_seq; Type: SEQUENCE SET; Schema: controle_de_acesso_a_dado; Owner: admin_db_sr
--

SELECT pg_catalog.setval('vinculo_acesso_id_seq', 1, false);


SET search_path = educacao_academico, pg_catalog;

--
-- TOC entry 4155 (class 0 OID 25426)
-- Dependencies: 391
-- Data for Name: atividade; Type: TABLE DATA; Schema: educacao_academico; Owner: admin_db_sr
--

COPY atividade (id, descricao_atividade, nome_atividade, nota_maxima, peso_atividade, turma_disciplina_id, data_fim, data_inicio, bimestre, tipo_atividade) FROM stdin;
33	atividade daniel	daniel	5	1	827	2015-07-06 00:00:00	2015-07-06 00:00:00	1º BIMESTRE	TRABALHO
34	prova	prova2	10	1	827	2015-07-06 00:00:00	2015-07-06 00:00:00	2º BIMESTRE	AVALIAÇÃO
35	ddgfdfd	prova 3	10	1	827	2015-07-06 00:00:00	2015-07-06 00:00:00	3º BIMESTRE	AVALIAÇÃO
36	dgfdgd	prova 4	10	1	827	2015-07-06 00:00:00	2015-07-06 00:00:00	4º BIMESTRE	TESTE
37	ghgg	rec	10	1	827	2015-07-06 00:00:00	2015-07-06 00:00:00	RECUPERACAO	AVALIAÇÃO
38	pf	pf	10	1	827	2015-07-06 00:00:00	2015-07-06 00:00:00	PROVA FINAL	AVALIAÇÃO
\.


--
-- TOC entry 4538 (class 0 OID 0)
-- Dependencies: 392
-- Name: atividade_id_seq; Type: SEQUENCE SET; Schema: educacao_academico; Owner: admin_db_sr
--

SELECT pg_catalog.setval('atividade_id_seq', 38, true);


--
-- TOC entry 4157 (class 0 OID 25434)
-- Dependencies: 393
-- Data for Name: aula; Type: TABLE DATA; Schema: educacao_academico; Owner: admin_db_sr
--

COPY aula (id, conteudo, data_aula, quant_horarios, tipo_aula_id, titulo, turma_disciplina_id) FROM stdin;
\.


--
-- TOC entry 4539 (class 0 OID 0)
-- Dependencies: 394
-- Name: aula_id_seq; Type: SEQUENCE SET; Schema: educacao_academico; Owner: admin_db_sr
--

SELECT pg_catalog.setval('aula_id_seq', 47, true);


--
-- TOC entry 4159 (class 0 OID 25442)
-- Dependencies: 395
-- Data for Name: conteudo_da_disciplina; Type: TABLE DATA; Schema: educacao_academico; Owner: admin_db_sr
--

COPY conteudo_da_disciplina (id, disciplina_id, conteudo_da_disciplina) FROM stdin;
\.


--
-- TOC entry 4540 (class 0 OID 0)
-- Dependencies: 396
-- Name: conteudo_da_disciplina_id_seq; Type: SEQUENCE SET; Schema: educacao_academico; Owner: admin_db_sr
--

SELECT pg_catalog.setval('conteudo_da_disciplina_id_seq', 2, true);


--
-- TOC entry 4161 (class 0 OID 25450)
-- Dependencies: 397
-- Data for Name: disciplina; Type: TABLE DATA; Schema: educacao_academico; Owner: admin_db_sr
--

COPY disciplina (id, carga_horaria, disciplina) FROM stdin;
5	120	GEOGRAFIA
6	120	HISTORIA
7	120	INFORMATICA
8	120	INGLES
9	120	CIENCIAS
11	120	RELIGIAO
12	120	EDUCACAO FISICA
13	120	CULTURA DO RN
14	120	FILOSOFIA
15	120	DANCA
16	120	EDUCACAO MUSICAL
18	120	REGRA CONVIVENCIA E VALORES
10	120	ARTES
19	120	POLIVALENTE
30	120	ESPANHOL
3	140	PORTUGUÊS
46	120	MATEMÁTICA
\.


--
-- TOC entry 4541 (class 0 OID 0)
-- Dependencies: 398
-- Name: disciplina_id_seq; Type: SEQUENCE SET; Schema: educacao_academico; Owner: admin_db_sr
--

SELECT pg_catalog.setval('disciplina_id_seq', 48, true);


--
-- TOC entry 4163 (class 0 OID 25458)
-- Dependencies: 399
-- Data for Name: disciplina_lecionada_por_professor; Type: TABLE DATA; Schema: educacao_academico; Owner: admin_db_sr
--

COPY disciplina_lecionada_por_professor (id, disciplina_id, professor_id, data, situacao) FROM stdin;
240	7	2061	2014-12-11	ATIVA
10	3	2062	2014-01-01	ATIVA
12	5	2062	2014-01-01	ATIVA
13	6	2062	2014-01-01	ATIVA
15	9	2062	2014-01-01	ATIVA
16	10	2062	2014-01-01	ATIVA
17	11	2062	2014-01-01	ATIVA
18	12	2062	2014-01-01	ATIVA
19	3	2056	2014-01-01	ATIVA
21	5	2056	2014-01-01	ATIVA
22	6	2056	2014-01-01	ATIVA
24	9	2056	2014-01-01	ATIVA
25	10	2056	2014-01-01	ATIVA
26	12	2056	2014-01-01	ATIVA
27	3	2060	2014-01-01	ATIVA
29	5	2060	2014-01-01	ATIVA
30	6	2060	2014-01-01	ATIVA
32	9	2060	2014-01-01	ATIVA
34	10	2060	2014-01-01	ATIVA
33	11	2060	2014-01-01	ATIVA
35	12	2060	2014-01-01	ATIVA
36	11	2056	2014-01-01	ATIVA
38	3	2061	2014-01-01	ATIVA
40	5	2061	2014-01-01	ATIVA
41	6	2061	2014-01-01	ATIVA
43	9	2061	2014-01-01	ATIVA
44	10	2061	2014-01-01	ATIVA
45	11	2061	2014-01-01	ATIVA
46	12	2061	2014-01-01	ATIVA
47	3	2058	2014-01-01	ATIVA
49	9	2117	2014-01-01	ATIVA
50	5	2058	2014-01-01	ATIVA
51	6	2058	2014-01-01	ATIVA
52	9	2058	2014-01-01	ATIVA
53	10	2058	2014-01-01	ATIVA
54	11	2058	2014-01-01	ATIVA
55	12	2058	2014-01-01	ATIVA
56	3	2059	2014-01-01	ATIVA
58	5	2059	2014-01-01	ATIVA
59	6	2059	2014-01-01	ATIVA
60	9	2059	2014-01-01	ATIVA
61	10	2059	2014-01-01	ATIVA
62	11	2059	2014-01-01	ATIVA
63	12	2059	2014-01-01	ATIVA
65	10	2112	2014-01-01	ATIVA
66	3	2123	2014-01-01	ATIVA
67	9	2102	2014-01-01	ATIVA
69	8	2100	2014-01-01	ATIVA
70	15	2089	2014-01-01	ATIVO
71	3	2130	2014-01-01	ATIVA
73	3	2132	2014-01-01	ATIVA
76	3	2133	2014-01-01	ATIVA
78	3	2099	2014-01-01	ATIVA
80	12	2125	2014-01-01	ATIVA
85	8	2110	2014-01-01	ATIVA
86	5	2119	2014-01-01	ATIVA
87	3	2086	2014-01-01	ATIVA
88	12	2103	2014-01-01	ATIVA
91	11	2097	2014-01-01	ATIVA
92	6	2121	2014-01-01	ATIVA
94	11	2331	2014-01-01	ATIVA
95	6	2118	2014-01-01	ATIVA
102	3	2091	2014-01-01	ATIVA
105	12	2135	2014-01-01	ATIVA
106	5	2136	2014-01-01	ATIVA
108	6	2137	2014-01-01	ATIVA
109	5	2104	2014-01-01	ATIVA
110	3	2055	2014-01-01	ATIVA
112	5	2055	2014-01-01	ATIVA
113	6	2055	2014-01-01	ATIVA
114	3	2116	2014-01-01	ATIVA
115	9	2055	2014-01-01	ATIVA
116	10	2055	2014-01-01	ATIVA
117	9	2111	2014-01-01	ATIVA
118	10	2055	2014-01-01	ATIVA
119	11	2055	2014-01-01	ATIVA
120	3	2139	2014-01-01	ATIVA
122	3	2332	2014-01-01	ATIVA
124	5	2332	2014-01-01	ATIVA
125	6	2332	2014-01-01	ATIVA
126	9	2332	2014-01-01	ATIVA
127	10	2332	2014-01-01	ATIVA
128	12	2126	2014-01-01	ATIVA
129	11	2332	2014-01-01	ATIVA
130	12	2332	2014-01-01	ATIVA
131	3	2124	2014-01-01	ATIVA
132	9	2108	2014-01-01	ATIVA
133	3	2052	2014-01-01	ATIVA
135	9	2052	2014-01-01	ATIVA
136	6	2052	2014-01-01	ATIVA
137	5	2052	2014-01-01	ATIVA
138	10	2052	2014-01-01	ATIVA
139	11	2052	2014-01-01	ATIVA
140	12	2052	2014-01-01	ATIVA
146	13	2111	2014-01-01	ATIVA
152	13	2119	2014-01-01	ATIVO
155	10	2089	2014-01-01	ATIVO
257	5	2093	2015-01-22	ATIVA
261	3	2289	2015-02-02	ATIVA
262	6	2294	2015-02-02	ATIVA
263	3	2294	2015-02-02	ATIVA
265	12	2317	2015-02-02	ATIVA
267	12	2320	2015-02-02	ATIVA
276	5	2054	2015-02-05	ATIVA
277	6	2054	2015-02-05	ATIVA
278	9	2054	2015-02-05	ATIVA
279	11	2054	2015-02-05	ATIVA
280	12	2054	2015-02-05	ATIVA
281	10	2054	2015-02-05	ATIVA
282	3	2054	2015-02-05	ATIVA
286	12	2055	2015-02-12	ATIVA
156	13	2118	2014-01-01	ATIVA
157	13	2104	2014-01-01	ATIVA
158	13	2102	2014-01-01	ATIVA
258	5	2098	2015-01-27	ATIVA
268	6	2291	2015-02-03	ATIVA
274	6	2290	2015-02-03	ATIVA
275	14	2293	2015-02-03	ATIVA
294	46	2052	2015-02-13	ATIVA
295	46	2055	2015-02-13	ATIVA
296	46	2332	2015-02-13	ATIVA
297	46	2054	2015-02-13	ATIVA
298	5	2937	2015-04-29	ATIVA
299	6	2937	2015-04-29	ATIVA
300	9	2937	2015-04-29	ATIVA
301	11	2937	2015-04-29	ATIVA
302	12	2937	2015-04-29	ATIVA
303	10	2937	2015-04-29	ATIVA
304	3	2937	2015-04-29	ATIVA
305	46	2937	2015-04-29	ATIVA
306	5	2938	2015-04-29	ATIVA
307	6	2938	2015-04-29	ATIVA
308	9	2938	2015-04-29	ATIVA
309	11	2938	2015-04-29	ATIVA
310	12	2938	2015-04-29	ATIVA
311	10	2938	2015-04-29	ATIVA
312	3	2938	2015-04-29	ATIVA
313	46	2938	2015-04-29	ATIVA
314	46	2095	2015-06-02	ATIVA
315	46	2120	2015-06-02	ATIVA
316	6	2097	2015-06-02	ATIVA
317	5	3355	2015-07-23	ATIVA
318	30	3356	2015-07-23	ATIVA
319	3	3356	2015-07-23	ATIVA
320	3	3357	2015-07-23	ATIVA
\.


--
-- TOC entry 4542 (class 0 OID 0)
-- Dependencies: 400
-- Name: disciplina_lecionada_por_professor_id_seq; Type: SEQUENCE SET; Schema: educacao_academico; Owner: admin_db_sr
--

SELECT pg_catalog.setval('disciplina_lecionada_por_professor_id_seq', 320, true);


--
-- TOC entry 4165 (class 0 OID 25466)
-- Dependencies: 401
-- Data for Name: frequencia; Type: TABLE DATA; Schema: educacao_academico; Owner: admin_db_sr
--

COPY frequencia (id, aula_id, matricula_id, quant_faltas) FROM stdin;
\.


--
-- TOC entry 4543 (class 0 OID 0)
-- Dependencies: 402
-- Name: frequencia_id_seq; Type: SEQUENCE SET; Schema: educacao_academico; Owner: admin_db_sr
--

SELECT pg_catalog.setval('frequencia_id_seq', 93, true);


--
-- TOC entry 4167 (class 0 OID 25471)
-- Dependencies: 403
-- Data for Name: horario; Type: TABLE DATA; Schema: educacao_academico; Owner: admin_db_sr
--

COPY horario (id, sala_id, horario, turma_disciplina_id) FROM stdin;
8	30	2M23	8
113	30	6M34	32
13	27	3T12	29
12	27	2T34	23
11	27	2T125	12
14	27	3T34	12
15	27	3T5	31
16	27	4T12	45
18	27	4T5	49
19	27	5T1	31
20	27	5T2	49
21	27	5T3	23
22	27	5T4	45
23	27	5T5	55
25	27	6T35	59
26	27	6T4	29
27	21	2T12	60
28	21	2T34	61
29	21	2T5	62
30	21	3T125	61
31	21	3T3	63
32	21	3T4	62
34	21	4T3	71
35	21	4T4	72
36	21	4T56	73
37	21	5T12	63
38	21	5T3	72
39	21	5T4	75
40	21	5T5	71
41	21	6T1	75
42	21	6T2	60
43	21	6T3	62
46	20	2T3	77
47	20	2T4	78
48	20	2T5	79
49	20	3T12	80
51	20	3T45	77
52	20	4T1	81
53	20	4T2	82
54	20	4T3	78
55	20	4T46	83
57	20	5T12	79
58	20	5T3	82
59	20	5T3	82
60	20	5T4	81
61	20	5T5	80
62	20	6T1	78
63	20	6T23	77
64	20	6T45	84
65	22	2T12	85
66	22	2T3	86
69	22	3T3	88
70	22	3T45	89
71	22	4T1	95
72	22	4T2	91
73	22	4T3	92
74	22	4T45	86
75	22	5T1	85
76	22	5T2	156
77	22	5T3	89
78	22	5T45	94
79	22	6T1	94
80	22	6T2	88
81	22	6T3	95
82	22	6T45	85
83	22	6T6	92
84	23	2T12	96
86	23	2T45	98
87	23	3T1	98
88	23	3T2	99
89	23	3T3	155
91	23	4T12	100
92	23	4T3	101
93	23	4T4	102
94	23	4T5	103
95	23	5T12	103
96	23	5T3	99
97	23	5T45	98
98	23	6T1	96
99	23	6T2	102
101	23	6T46	104
102	23	6T5	100
103	30	3M2	30
104	30	3M3	32
107	30	4M4	9
108	30	4M6	40
109	30	5M23	32
111	30	5M5	40
114	31	2M23	10
115	31	2M45	11
116	31	3M2	64
117	31	3M3	34
118	31	3M4	41
119	31	3M56	10
120	31	4M23	42
121	31	4M4	34
123	31	5M12	48
124	31	5M3	64
125	31	6M2	10
127	31	6M5	11
128	31	6M6	42
129	32	2M4	13
131	32	3M2	13
132	32	3M3	35
133	32	3M4	36
134	32	3M5	65
136	32	4M3	65
138	32	4M56	35
139	31	5M13	50
140	32	5M2	36
141	32	5M45	51
142	32	5M6	13
143	32	6M3	51
110	30	5M46	32
10	30	3M16	9
9	30	2M45	9
144	32	6M56	13
146	26	2M4	20
147	26	2M56	21
148	26	3M2	37
149	26	3M4	21
150	26	3M5	20
151	26	3M6	66
152	26	4M23	44
153	26	4M4	66
154	26	5M1	52
155	26	5M3	37
156	26	5M45	21
157	26	5M6	44
159	26	6M4	52
160	26	6M5	20
162	24	2M236	22
165	24	3M45	22
166	24	3M6	38
167	24	4M4	46
168	24	4M5	67
169	24	5M23	46
170	24	5M46	53
171	24	5M5	67
172	24	6M12	54
173	24	6M34	38
175	24	6M6	56
176	25	2M23	25
177	25	2M45	26
178	25	2M6	27
179	25	3M236	26
180	25	3M5	39
181	25	4M2	68
182	25	4M3	39
183	25	4M56	27
184	25	5M2	68
185	25	6M13	57
186	25	6M2	25
187	25	6M4	58
207	29	2T12	114
208	29	2T3	115
210	29	3T1	153
211	29	3T2	117
212	29	3T3	118
213	29	3T4	119
214	29	3T5	120
215	29	4T1	121
216	29	4T2	122
218	29	4T45	115
219	29	5T1	126
220	29	5T2	122
221	29	5T34	114
223	29	5T6	128
224	29	6T14	121
225	29	6T23	120
226	29	6T5	114
228	30	2T1	123
230	30	2T45	125
231	30	3T1	125
232	30	3T2	152
233	30	3T3	126
234	30	3T4	127
235	30	3T5	128
236	30	4T12	123
237	30	4T34	129
238	30	4T5	130
239	30	5T1	131
241	30	5T4	126
242	30	5T5	130
243	30	5T6	128
244	30	6T12	125
245	30	6T3	129
246	30	6T45	127
247	25	2T12	132
248	25	2T3	133
249	25	2T45	134
250	25	3T1	135
251	25	3T2	136
252	25	3T3	137
253	25	3T45	133
254	25	3T6	138
255	25	4T1	139
257	25	4T3	134
258	25	4T45	137
259	25	5T12	133
260	25	5T3	138
262	25	5T5	151
263	25	6T1	135
264	25	6T2	132
265	25	6T3	139
268	24	2T2	142
269	24	2T3	150
270	24	2T45	143
271	24	3T1	144
272	24	3T23	145
273	24	3T45	146
274	24	3T6	147
276	24	4T2	148
277	24	4T3	143
278	24	4T4	144
279	24	4T5	149
280	24	5T12	142
281	24	5T3	148
282	24	5T4	147
283	24	5T5	145
285	24	6T34	145
286	24	6T5	148
289	24	ttt	148
290	24	yyy	148
294	14	3T3	28
296	30	3M16	28
297	30	5M46	69
298	30	5M46	40
299	30	6M2	28
300	30	6M2	9
301	30	6M2	9
302	30	5M46	69
303	30	5M46	69
304	30	6M2	40
305	30	6M2	8
309	27	2T125	12
310	30	6M2	8
311	30	6M2	9
112	30	6M2	69
315	27	3M34	34
316	27	4T12	34
\.


--
-- TOC entry 4544 (class 0 OID 0)
-- Dependencies: 404
-- Name: horario_id_seq; Type: SEQUENCE SET; Schema: educacao_academico; Owner: admin_db_sr
--

SELECT pg_catalog.setval('horario_id_seq', 316, true);


--
-- TOC entry 4169 (class 0 OID 25479)
-- Dependencies: 405
-- Data for Name: matricula; Type: TABLE DATA; Schema: educacao_academico; Owner: admin_db_sr
--

COPY matricula (id, aluno_id, turma_id, data_da_matricula, matricula, status) FROM stdin;
838	2926	185	2015-02-27	178	Ativo
839	2933	185	2015-02-27	179	Ativo
665	2881	179	2015-01-14	044	Ativo
666	2880	179	2015-01-23	045	Ativo
667	2879	179	2015-01-16	046	Ativo
668	2878	179	2015-01-21	047	Ativo
669	2877	179	2015-01-13	048	Ativo
670	999	158	2015-02-06	\N	Ativo
671	2882	158	2015-02-06	\N	Ativo
672	2883	158	2015-02-06	\N	Ativo
673	1156	158	2015-02-06	\N	Ativo
674	2884	158	2015-02-06	\N	Ativo
675	1010	158	2015-02-06	\N	Ativo
676	2885	158	2015-02-06	\N	Ativo
678	1160	158	2015-02-06	\N	Ativo
680	2887	158	2015-02-06	\N	Ativo
682	1394	158	2015-02-06	\N	Ativo
683	970	158	2015-02-06	\N	Ativo
685	1167	158	2015-02-06	\N	Ativo
686	1052	158	2015-02-06	\N	Ativo
687	2889	158	2015-02-06	\N	Ativo
688	2890	158	2015-02-06	\N	Ativo
689	1056	158	2015-02-06	\N	Ativo
690	988	158	2015-02-06	\N	Ativo
691	992	158	2015-02-06	\N	Ativo
694	2891	158	2015-02-06	\N	Ativo
695	1150	159	2015-02-09	\N	Ativo
696	1076	159	2015-02-09	\N	Ativo
697	1077	159	2015-02-09	\N	Ativo
702	2893	159	2015-02-09	\N	Ativo
703	1159	159	2015-02-09	\N	Ativo
705	1162	159	2015-02-09	\N	Ativo
706	2894	159	2015-02-09	\N	Ativo
707	1088	159	2015-02-09	\N	Ativo
708	1047	159	2015-02-09	\N	Ativo
709	1667	179	2015-02-09	049	Ativo
712	2833	177	2015-02-09	023	Ativo
713	1090	159	2015-02-09	\N	Ativo
714	1093	159	2015-02-09	\N	Ativo
715	2896	159	2015-02-09	\N	Ativo
716	1171	159	2015-02-09	\N	Ativo
718	1023	159	2015-02-09	\N	Ativo
729	1743	182	2015-01-21	059	Ativo
730	2898	159	2015-02-09	\N	Ativo
732	1701	182	2015-01-22	060	Ativo
733	1174	159	2015-02-09	\N	Ativo
734	1745	182	2015-01-22	061	Ativo
735	1760	182	2015-01-19	062	Ativo
739	2899	159	2015-02-09	\N	Ativo
746	1750	182	2015-01-19	072	Ativo
747	1744	182	2015-01-12	073	Ativo
750	1783	182	2015-01-19	076	Ativo
752	2901	182	2015-01-27	078	Ativo
753	2900	182	2015-01-23	079	Ativo
754	2903	159	2015-02-09	\N	Ativo
755	1058	159	2015-02-09	\N	Ativo
757	1179	159	2015-02-09	\N	Ativo
758	1106	159	2015-02-09	\N	Ativo
760	1141	159	2015-02-09	\N	Ativo
761	1181	159	2015-02-09	\N	Ativo
762	1069	159	2015-02-09	\N	Ativo
765	1075	160	2015-02-09	\N	Ativo
766	1151	160	2015-02-09	\N	Ativo
767	1462	160	2015-02-09	\N	Ativo
770	1084	160	2015-02-09	\N	Ativo
771	1155	160	2015-02-09	\N	Ativo
772	2906	160	2015-02-09	\N	Ativo
773	1158	160	2015-02-09	\N	Ativo
774	1184	160	2015-02-09	\N	Ativo
775	1163	160	2015-02-09	\N	Ativo
776	1164	160	2015-02-09	\N	Ativo
7	764	56	2014-11-24	VIC1003	Inativo
9	766	50	2014-01-01	VIC1005	Inativo
661	1656	179	2014-12-18	040	Inativo
322	1101	29	2017-01-01	VIC1334	Ativo
333	1067	28	20014-01-01	VIC1302	Ativo
475	1214	165	2015-02-03	\N	Ativo
477	1247	165	2015-02-03	\N	Ativo
478	1250	165	2015-02-03	\N	Ativo
479	1249	165	2015-02-03	\N	Ativo
424	1186	164	2015-02-03	\N	Ativo
425	1187	164	2015-02-03	\N	Ativo
426	1494	164	2015-02-03	\N	Ativo
427	1190	164	2015-02-03	\N	Ativo
431	1199	164	2015-02-03	\N	Ativo
432	1201	164	2015-02-03	\N	Ativo
434	1202	164	2015-02-03	\N	Ativo
435	1203	164	2015-02-03	\N	Ativo
436	1204	164	2015-02-03	\N	Ativo
437	1205	164	2015-02-03	\N	Ativo
430	1229	36	2015-07-13		Ativo
473	1516	166	2015-07-13		Ativo
476	1518	166	2015-07-13		Ativo
518	1224	165	2015-07-13		Ativo
699	1006	158	2015-07-14		Ativo
698	1039	160	2015-07-14		Ativo
701	1045	160	2015-07-14		Ativo
704	1431	160	2015-07-14		Ativo
711	2895	160	2015-07-14		Ativo
724	2897	160	2015-07-14		Ativo
768	1153	159	2015-07-14		Ativo
769	1154	159	2015-07-14		Ativo
438	1207	164	2015-02-03	\N	Ativo
439	1209	164	2015-02-03	\N	Ativo
440	1210	164	2015-02-03	\N	Ativo
441	1246	164	2015-02-03	\N	Ativo
442	1213	164	2015-02-03	\N	Ativo
443	1212	164	2015-02-03	\N	Ativo
446	1217	164	2015-02-03	\N	Ativo
447	1219	164	2015-02-03	\N	Ativo
448	1220	164	2015-02-03	\N	Ativo
449	1223	164	2015-02-03	\N	Ativo
451	1228	165	2015-02-03	\N	Ativo
452	1193	165	2015-02-03	\N	Ativo
456	1195	165	2015-02-03	\N	Ativo
457	1196	165	2015-02-03	\N	Ativo
458	1197	165	2015-02-03	\N	Ativo
461	1200	165	2015-02-03	\N	Ativo
465	1237	165	2015-02-03	\N	Ativo
466	1238	165	2015-02-03	\N	Ativo
467	1239	165	2015-02-03	\N	Ativo
470	1206	165	2015-02-03	\N	Ativo
483	1218	165	2015-02-03	\N	Ativo
485	1254	165	2015-02-03	\N	Ativo
488	1497	166	2015-02-03	\N	Ativo
491	1500	166	2015-02-03	\N	Ativo
492	1506	166	2015-02-03	\N	Ativo
493	2723	166	2015-02-03	\N	Ativo
662	1642	179	2014-12-16	041	Inativo
495	1508	166	2015-02-03	\N	Ativo
496	2724	166	2015-02-03	\N	Ativo
497	2725	166	2015-02-03	\N	Ativo
498	1509	166	2015-02-03	\N	Ativo
499	1511	166	2015-02-03	\N	Ativo
500	1513	166	2015-02-03	\N	Ativo
507	1519	166	2015-02-03	\N	Ativo
508	1251	166	2015-02-03	\N	Ativo
510	1521	166	2015-02-03	\N	Ativo
513	2729	166	2015-02-03	\N	Ativo
514	2730	166	2015-02-03	\N	Ativo
515	1319	166	2015-02-03	\N	Ativo
516	1524	166	2015-02-03	\N	Ativo
517	1257	166	2015-02-03	\N	Ativo
522	1456	161	2015-02-04	\N	Ativo
523	1457	161	2015-02-04	\N	Ativo
524	1458	161	2015-02-04	\N	Ativo
525	1459	161	2015-02-04	\N	Ativo
526	1460	161	2015-02-04	\N	Ativo
527	1461	161	2015-02-04	\N	Ativo
528	1428	161	2015-02-04	\N	Ativo
529	1466	161	2015-02-04	\N	Ativo
530	1468	161	2015-02-04	\N	Ativo
531	1433	161	2015-02-04	\N	Ativo
532	1472	161	2015-02-04	\N	Ativo
533	1473	161	2015-02-04	\N	Ativo
534	1474	161	2015-02-04	\N	Ativo
536	1476	161	2015-02-04	\N	Ativo
537	1478	161	2015-02-04	\N	Ativo
538	1479	161	2015-02-04	\N	Ativo
539	1480	161	2015-02-04	\N	Ativo
541	1483	161	2015-02-04	\N	Ativo
542	1442	161	2015-02-04	\N	Ativo
543	1481	161	2015-02-04	\N	Ativo
544	1482	161	2015-02-04	\N	Ativo
545	1484	161	2015-02-04	\N	Ativo
546	1485	161	2015-02-04	\N	Ativo
549	1381	162	2015-02-04	\N	Ativo
550	1421	162	2015-02-04	\N	Ativo
551	1385	162	2015-02-04	\N	Ativo
554	2695	18	2015-02-04		Ativo
555	1423	162	2015-02-04	\N	Ativo
557	2695	157	2015-02-04		Ativo
560	1390	162	2015-02-04	\N	Ativo
563	1430	162	2015-02-04	\N	Ativo
565	1432	162	2015-02-04	\N	Ativo
570	1123	162	2015-02-04	\N	Ativo
445	1520	37	2015-07-13		Ativo
459	1231	164	2015-07-13		Ativo
464	1235	164	2015-07-13		Ativo
494	1236	164	2015-07-13		Ativo
450	1495	166	2015-07-13		Ativo
453	1498	166	2015-07-13		Ativo
454	1499	166	2015-07-13		Ativo
455	1501	166	2015-07-13		Ativo
462	1507	166	2015-07-13		Ativo
468	1510	166	2015-07-13		Ativo
469	1514	166	2015-07-13		Ativo
484	1523	166	2015-07-13		Ativo
487	1189	165	2015-07-13		Ativo
501	1240	165	2015-07-13		Ativo
502	1278	165	2015-07-13		Ativo
503	1241	165	2015-07-13		Ativo
505	1211	165	2015-07-13		Ativo
506	1281	165	2015-07-13		Ativo
509	2727	165	2015-07-13		Ativo
512	2728	165	2015-07-13		Ativo
553	1422	163	2015-07-13		Ativo
558	1464	163	2015-07-13		Ativo
559	1426	163	2015-07-13		Ativo
561	1427	163	2015-07-13		Ativo
562	1429	163	2015-07-13		Ativo
567	1434	163	2015-07-13		Ativo
566	1118	163	2015-07-13		Ativo
535	1475	162	2015-07-14		Ativo
636	2876	161	2015-07-14		Ativo
637	1488	161	2015-07-14		Ativo
540	1441	163	2015-07-14		Ativo
573	1440	162	2015-02-04	\N	Ativo
576	1130	162	2015-02-04	\N	Ativo
577	1131	162	2015-02-04	\N	Ativo
581	1410	162	2015-02-04	\N	Ativo
582	1139	162	2015-02-04	\N	Ativo
586	1449	162	2015-02-04	\N	Ativo
587	1451	162	2015-02-04	\N	Ativo
590	1469	163	2015-02-04	\N	Ativo
594	2750	163	2015-02-04	\N	Ativo
597	2754	163	2015-02-04	\N	Ativo
598	2752	163	2015-02-04	\N	Ativo
599	2753	163	2015-02-04	\N	Ativo
601	1455	163	2015-02-04	\N	Ativo
603	2757	163	2015-02-04	\N	Ativo
615	1729	177	2015-01-12	008	Ativo
616	2808	177	2015-02-05	009	Ativo
617	2810	177	2015-01-13	010	Ativo
663	1676	179	2014-12-16	042	Inativo
664	1647	179	2014-12-18	043	Inativo
710	2832	177	2014-12-16	024	Inativo
719	1753	182	2014-12-16	050	Inativo
720	1694	182	2014-12-09	051	Inativo
722	1703	182	2014-12-16	053	Inativo
723	1749	182	2014-12-05	054	Inativo
725	1757	182	2014-12-08	055	Inativo
726	1746	182	2014-12-16	056	Inativo
727	1628	182	2014-12-11	057	Inativo
728	1756	182	2014-12-16	058	Inativo
736	1758	182	2014-12-16	063	Inativo
737	1717	182	2014-12-03	064	Inativo
738	1702	182	2014-12-03	065	Inativo
740	1716	182	2014-12-11	066	Inativo
741	1711	182	2014-12-16	067	Inativo
742	1697	182	2014-12-16	068	Inativo
743	1718	182	2014-12-16	069	Inativo
744	1707	182	2014-12-16	070	Inativo
745	1710	182	2014-12-16	071	Inativo
748	1712	182	2014-12-16	074	Inativo
749	1714	182	2014-12-10	075	Inativo
158	866	55	2014-01-01	VIC1105	Inativo
44	907	52	2014-01-01	VIC1145	Inativo
45	908	52	2014-01-01	VIC1146	Inativo
46	796	51	2014-01-01	VIC1035	Inativo
47	797	51	2014-01-01	VIC1036	Inativo
48	816	51	2014-01-01	VIC1037	Inativo
49	798	51	2014-01-01	VIC1038	Inativo
50	799	51	2014-01-01	VIC1039	Inativo
51	800	51	2014-01-01	VIC1040	Inativo
52	909	52	2014-01-01	VIC1147	Inativo
53	910	52	2014-01-01	VIC1148	Inativo
54	911	52	2014-01-01	VIC1149	Inativo
55	801	51	2014-01-01	VIC1041	Inativo
56	912	52	2014-01-01	VIC1150	Inativo
57	802	51	2014-01-01	VIC1042	Inativo
58	803	51	2014-01-01	VIC1043	Inativo
59	804	51	2014-01-01	VIC1044	Inativo
60	913	52	2014-01-01	VIC1151	Inativo
61	805	51	2014-01-01	VIC1045	Inativo
62	914	52	2014-01-01	VIC1152	Inativo
63	932	52	2014-01-01	VIC1153	Inativo
64	806	51	2014-01-01	VIC1046	Inativo
65	807	51	2014-01-01	VIC1047	Inativo
66	915	52	2014-01-01	VIC1154	Inativo
67	808	51	2014-01-01	VIC1048	Inativo
68	809	51	2014-01-01	VIC1049	Inativo
69	810	51	2014-01-01	VIC1050	Inativo
70	811	51	2014-01-01	VIC1051	Inativo
71	916	52	2014-01-01	VIC1155	Inativo
72	917	52	2014-01-01	VIC1156	Inativo
73	918	52	2014-01-01	VIC1157	Inativo
74	919	52	2014-01-01	VIC1158	Inativo
75	920	52	2014-01-01	VIC1159	Inativo
76	921	52	2014-01-01	VIC1160	Inativo
77	922	52	2014-01-01	VIC1161	Inativo
78	923	52	2014-01-01	VIC1162	Inativo
79	812	51	2014-01-01	VIC1052	Inativo
80	814	51	2014-01-01	VIC1053	Inativo
81	924	52	2014-01-01	VIC1163	Inativo
82	813	51	2014-01-01	VIC1054	Inativo
83	815	51	2014-01-01	VIC1055	Inativo
84	925	52	2014-01-01	VIC1164	Inativo
85	926	52	2014-01-01	VIC1165	Inativo
86	927	52	2014-01-01	VIC1166	Inativo
87	818	53	2014-01-01	VIC1056	Inativo
88	819	53	2014-01-01	VIC1057	Inativo
89	928	52	2014-01-01	VIC1167	Inativo
90	929	52	2014-01-01	VIC1168	Inativo
91	820	53	2014-01-01	VIC1058	Inativo
92	930	52	2014-01-01	VIC1169	Inativo
93	821	53	2014-01-01	VIC1059	Inativo
94	931	52	2014-01-01	VIC1170	Inativo
96	823	53	2014-01-01	VIC1061	Inativo
572	1439	163	2015-07-14		Ativo
575	1444	163	2015-07-14		Ativo
579	1445	163	2015-07-14		Ativo
580	1486	161	2015-07-14		Ativo
583	1446	163	2015-07-14		Ativo
584	1447	163	2015-07-14		Ativo
585	1448	163	2015-07-14		Ativo
589	2748	162	2015-07-14		Ativo
595	2751	162	2015-07-14		Ativo
591	2749	162	2015-07-14		Ativo
593	1113	161	2015-07-14		Ativo
596	1116	161	2015-07-14		Ativo
600	1435	161	2015-07-14		Ativo
602	1119	161	2015-07-14		Ativo
97	846	53	2014-01-01	VIC1062	Inativo
98	825	53	2014-01-01	VIC1063	Inativo
99	824	53	2014-01-01	VIC1064	Inativo
100	933	54	2014-01-01	VIC1171	Inativo
101	826	53	2014-01-01	VIC1065	Inativo
102	934	54	2014-01-01	VIC1172	Inativo
103	827	53	2014-01-01	VIC1066	Inativo
104	935	54	2014-01-01	VIC1173	Inativo
105	828	53	2014-01-01	VIC1067	Inativo
106	829	53	2014-01-01	VIC1068	Inativo
107	936	54	2014-01-01	VIC1174	Inativo
108	830	53	2014-01-01	VIC1069	Inativo
109	937	54	2014-01-01	VIC1175	Inativo
110	831	53	2014-01-01	VIC1070	Inativo
111	938	54	2014-01-01	VIC1176	Inativo
112	832	53	2014-01-01	VIC1071	Inativo
113	833	53	2014-01-01	VIC1072	Inativo
114	834	53	2014-01-01	VIC1073	Inativo
115	939	54	2014-01-01	VIC1177	Inativo
116	835	53	2014-01-01	VIC1074	Inativo
117	940	54	2014-01-01	VIC1178	Inativo
118	836	53	2014-01-01	VIC1075	Inativo
119	837	53	2014-01-01	VIC1076	Inativo
120	838	53	2014-01-01	VIC1077	Inativo
121	941	54	2014-01-01	VIC1179	Inativo
122	839	53	2014-01-01	VIC1078	Inativo
123	840	53	2014-01-01	VIC1079	Inativo
124	942	54	2014-01-01	VIC1180	Inativo
5	762	55	2014-11-24	VIC1001	Inativo
14	771	56	2014-11-24	VIC1010	Inativo
8	765	50	2014-11-24	VIC1004	Inativo
125	841	53	2014-01-01	VIC1080	Inativo
126	943	54	2014-01-01	VIC1181	Inativo
127	842	53	2014-01-01	VIC1081	Inativo
128	843	53	2014-01-01	VIC1082	Inativo
129	944	54	2014-01-01	VIC1182	Inativo
130	844	53	2014-01-01	VIC1083	Inativo
131	845	53	2014-01-01	VIC1084	Inativo
132	871	55	2014-01-01	VIC1085	Inativo
133	847	55	2014-01-01	VIC1086	Inativo
134	848	55	2014-01-01	VIC1087	Inativo
135	849	55	2014-01-01	VIC1088	Inativo
136	850	55	2014-01-01	VIC1089	Inativo
137	851	55	2014-01-01	VIC1090	Inativo
138	945	54	2014-01-01	VIC1183	Inativo
139	852	55	2014-01-01	VIC1091	Inativo
140	853	55	2014-01-01	VIC1092	Inativo
141	854	55	2014-01-01	VIC1093	Inativo
142	855	55	2014-01-01	VIC1094	Inativo
143	856	55	2014-01-01	VIC1095	Inativo
144	946	54	2014-01-01	VIC1184	Inativo
145	857	55	2014-01-01	VIC1096	Inativo
146	947	54	2014-01-01	VIC1185	Inativo
147	859	55	2014-01-01	VIC1097	Inativo
148	858	55	2014-01-01	VIC1098	Inativo
149	860	55	2014-01-01	VIC1099	Inativo
150	870	55	2014-01-01	VIC1100	Inativo
151	948	54	2014-01-01	VIC1186	Inativo
152	861	55	2014-01-01	VIC1101	Inativo
153	862	55	2014-01-01	VIC1102	Inativo
154	863	55	2014-01-01	VIC1103	Inativo
155	949	54	2014-01-01	VIC1187	Inativo
156	950	54	2014-01-01	VIC1188	Inativo
157	865	55	2014-01-01	VIC1104	Inativo
159	951	54	2014-01-01	VIC1189	Inativo
160	952	54	2014-01-01	VIC1190	Inativo
161	872	55	2014-01-01	VIC1107	Inativo
162	867	55	2014-01-01	VIC1108	Inativo
163	868	55	2014-01-01	VIC1109	Inativo
165	953	54	2014-01-01	VIC1191	Inativo
166	955	54	2014-01-01	VIC1192	Inativo
167	956	54	2014-01-01	VIC1193	Inativo
168	957	54	2014-01-01	VIC1194	Inativo
169	874	56	2014-01-01	VIC1111	Inativo
170	875	56	2014-01-01	VIC1112	Inativo
171	876	56	2014-01-01	VIC1113	Inativo
172	897	56	2014-01-01	VIC1114	Inativo
173	877	56	2014-01-01	VIC1115	Inativo
174	958	23	2014-01-01	VIC1195	Inativo
175	878	56	2014-01-01	VIC1116	Inativo
164	869	55	2014-01-01	VIC1110	Inativo
176	879	56	2014-01-01	VIC1117	Inativo
177	898	56	2014-01-01	VIC1118	Inativo
178	880	56	2014-01-01	VIC1119	Inativo
179	881	56	2014-01-01	VIC1120	Inativo
180	873	56	2014-01-01	VIC1121	Inativo
181	882	56	2014-01-01	VIC1122	Inativo
182	883	56	2014-01-01	VIC1123	Inativo
183	884	56	2014-01-01	VIC1124	Inativo
184	885	56	2014-01-01	VIC1125	Inativo
185	900	56	2014-01-01	VIC1126	Inativo
186	886	56	2014-01-01	VIC1127	Inativo
187	887	56	2014-01-01	VIC1128	Inativo
188	899	56	2014-01-01	VIC1129	Inativo
189	888	56	2014-01-01	VIC1130	Inativo
190	889	56	2014-01-01	VIC1131	Inativo
191	890	56	2014-01-01	VIC1132	Inativo
192	891	56	2014-01-01	VIC1133	Inativo
193	896	56	2014-01-01	VIC1134	Inativo
194	892	56	2014-01-01	VIC1135	Inativo
195	894	56	2014-01-01	VIC1136	Inativo
196	895	56	2014-01-01	VIC1137	Inativo
197	959	23	2014-01-01	VIC1196	Inativo
198	960	23	2014-01-01	VIC1197	Inativo
199	961	23	2014-01-01	VIC1198	Inativo
200	962	23	2014-01-01	VIC1199	Inativo
201	963	23	2014-01-01	VIC1200	Inativo
202	964	23	2014-01-01	VIC1201	Inativo
203	966	23	2014-01-01	VIC1202	Inativo
204	965	23	2014-01-01	VIC1203	Inativo
205	967	23	2014-01-01	VIC1204	Inativo
206	968	23	2014-01-01	VIC1205	Inativo
207	969	23	2014-01-01	VIC1206	Inativo
208	970	23	2014-01-01	VIC1207	Inativo
209	971	23	2014-01-01	VIC1208	Inativo
210	972	23	2014-01-01	VIC1209	Inativo
211	973	23	2014-01-01	VIC1210	Inativo
212	974	23	2014-01-01	VIC1211	Inativo
213	975	23	2014-01-01	VIC1212	Inativo
214	976	23	2014-01-01	VIC1213	Inativo
215	977	23	2014-01-01	VIC1214	Inativo
216	978	23	2014-01-01	VIC1215	Inativo
217	979	23	2014-01-01	VIC1216	Inativo
218	980	23	2014-01-01	VIC1217	Inativo
219	981	23	2014-01-01	VIC1218	Inativo
220	982	23	2014-01-01	VIC1219	Inativo
221	983	23	2014-01-01	VIC1220	Inativo
222	984	23	2014-01-01	VIC1221	Inativo
223	985	23	2014-01-01	VIC1222	Inativo
224	986	23	2014-01-01	VIC1223	Inativo
225	987	23	2014-01-01	VIC1224	Inativo
226	988	23	2014-01-01	VIC1225	Inativo
227	989	23	2014-01-01	VIC1226	Inativo
228	991	23	2014-01-01	VIC1227	Inativo
229	993	23	2014-01-01	VIC1228	Inativo
230	995	23	2014-01-01	VIC1229	Inativo
231	994	23	2014-01-01	VIC1230	Inativo
232	996	23	2014-01-01	VIC1231	Inativo
233	997	26	2014-01-01	VIC1232	Inativo
234	998	26	2014-01-01	VIC1233	Inativo
235	999	26	2014-01-01	VIC1234	Inativo
236	1000	26	2014-01-01	VIC1235	Inativo
237	1001	26	2014-01-01	VIC1236	Inativo
238	1002	26	2014-01-01	VIC1237	Inativo
239	1003	26	2014-01-01	VIC1238	Inativo
240	1004	26	2014-01-01	VIC1239	Inativo
241	1005	26	2014-01-01	VIC1240	Inativo
242	1006	26	2014-01-01	VIC1241	Inativo
243	1007	26	2014-01-01	VIC1242	Inativo
244	1008	26	2014-01-01	VIC1243	Inativo
245	1009	26	2014-01-01	VIC1244	Inativo
246	1011	26	2014-01-01	VIC1245	Inativo
247	1010	26	2014-01-01	VIC1246	Inativo
248	1012	26	2014-01-01	VIC1247	Inativo
249	1013	26	2014-01-01	VIC1248	Inativo
250	1014	26	2014-01-01	VIC1249	Inativo
251	1015	26	2014-01-01	VIC1250	Inativo
252	1016	26	2014-01-01	VIC1251	Inativo
253	1017	26	2014-01-01	VIC1252	Inativo
254	1018	26	2014-01-01	VIC1253	Inativo
255	1019	26	2014-01-01	VIC1254	Inativo
256	1020	26	2014-01-01	VIC1255	Inativo
257	1021	26	2014-01-01	VIC1256	Inativo
258	1022	26	2014-01-01	VIC1257	Inativo
259	1023	26	2014-01-01	VIC1258	Inativo
260	1024	26	2014-01-01	VIC1259	Inativo
261	1025	26	2014-01-01	VIC1260	Inativo
262	1027	26	2014-01-01	VIC1261	Inativo
263	1026	26	2014-01-01	VIC1262	Inativo
264	1029	26	2014-01-01	VIC1263	Inativo
265	1028	26	2014-01-01	VIC1264	Inativo
266	1030	26	2014-01-01	VIC1265	Inativo
267	1031	26	2014-01-01	VIC1266	Inativo
268	1032	26	2014-01-01	VIC1267	Inativo
269	1033	26	2014-01-01	VIC1268	Inativo
270	1034	26	2014-01-01	VIC1269	Inativo
271	1035	26	2014-01-01	VIC1270	Inativo
272	1036	28	2014-01-01	VIC1271	Inativo
273	1075	29	2014-01-01	VIC1310	Inativo
274	1076	29	2014-01-01	VIC1311	Inativo
275	1037	28	2014-01-01	VIC1272	Inativo
276	1077	29	2014-01-01	VIC1312	Inativo
277	1038	28	2014-01-01	VIC1273	Inativo
278	1039	28	2014-01-01	VIC1274	Inativo
279	1078	29	2014-01-01	VIC1313	Inativo
280	1040	28	2014-01-01	VIC1275	Inativo
281	1079	29	2014-01-01	VIC1314	Inativo
282	1080	29	2014-01-01	VIC1315	Inativo
283	1081	29	2014-01-01	VIC1316	Inativo
284	1041	28	2014-01-01	VIC1276	Inativo
285	1082	29	2014-01-01	VIC1317	Inativo
286	1042	28	2014-01-01	VIC1277	Inativo
287	1083	29	2014-01-01	VIC1318	Inativo
288	1044	28	2014-01-01	VIC1278	Inativo
289	1084	29	2014-01-01	VIC1319	Inativo
290	1043	28	2014-01-01	VIC1279	Inativo
291	1045	28	2014-01-01	VIC1279	Inativo
292	1085	29	2014-01-01	VIC1320	Inativo
293	1046	28	2014-01-01	VIC1280	Inativo
294	1086	29	2014-01-01	VIC1321	Inativo
295	1074	28	2014-01-01	VIC1281	Inativo
296	1047	28	2014-01-01	VIC1282	Inativo
297	1048	28	2014-01-01	VIC1283	Inativo
298	1049	28	2014-01-01	VIC1284	Inativo
299	1050	28	2014-01-01	VIC1285	Inativo
300	1051	28	2014-01-01	VIC1286	Inativo
301	1087	29	2014-01-01	VIC1322	Inativo
302	1052	28	2014-01-01	VIC1287	Inativo
303	1088	29	2014-01-01	VIC1323	Inativo
304	1053	28	2014-01-01	VIC1288	Inativo
305	1090	29	2014-01-01	VIC1324	Inativo
306	1055	28	2014-01-01	VIC1289	Inativo
307	1091	29	2014-01-01	VIC1325	Inativo
308	1054	28	2014-01-01	VIC1290	Inativo
309	1056	28	2014-01-01	VIC1291	Inativo
310	1092	29	2014-01-01	VIC1326	Inativo
311	1093	29	2014-01-01	VIC1327	Inativo
312	1057	28	2014-01-01	VIC1292	Inativo
313	1058	28	2014-01-01	VIC1293	Inativo
314	1059	28	2014-01-01	VIC1294	Inativo
315	1060	28	2014-01-01	VIC1295	Inativo
316	1095	29	2014-01-01	VIC1328	Inativo
317	1096	29	2014-01-01	VIC1329	Inativo
318	1097	29	2014-01-01	VIC1330	Inativo
319	1098	29	2014-01-01	VIC1331	Inativo
320	1099	29	2014-01-01	VIC1332	Inativo
321	1100	29	2014-01-01	VIC1333	Inativo
323	1062	28	2014-01-01	VIC1296	Inativo
324	1102	29	2014-01-01	VIC1335	Inativo
325	1063	28	2014-01-01	VIC1297	Inativo
326	1103	29	2014-01-01	VIC1336	Inativo
327	1064	28	2014-01-01	VIC1298	Inativo
328	1065	28	2014-01-01	VIC1299	Inativo
329	1104	29	2014-01-01	VIC1337	Inativo
330	1066	28	2014-01-01	VIC1300	Inativo
331	1067	28	2014-01-01	VIC1301	Inativo
332	1105	29	2014-01-01	VIC1338	Inativo
334	1106	29	2014-01-01	VIC1339	Inativo
335	1107	29	2014-01-01	VIC1340	Inativo
336	1068	28	2014-01-01	VIC1303	Inativo
337	1108	29	2014-01-01	VIC1341	Inativo
338	1069	28	2014-01-01	VIC1304	Inativo
339	1109	29	2014-01-01	VIC1342	Inativo
340	1070	28	2014-01-01	VIC1305	Inativo
341	1380	30	2014-01-01	VIC1343	Inativo
342	1071	28	2014-01-01	VIC1306	Inativo
343	1381	30	2014-01-01	VIC1344	Inativo
344	1073	28	2014-01-01	VIC1307	Inativo
345	1382	30	2014-01-01	VIC1345	Inativo
346	1072	28	2014-01-01	VIC1308	Inativo
347	1383	30	2014-01-01	VIC1346	Inativo
348	1385	30	2014-01-01	VIC1347	Inativo
350	1387	30	2014-01-01	VIC1348	Inativo
351	1388	30	2014-01-01	VIC1349	Inativo
352	1389	30	2014-01-01	VIC1350	Inativo
353	1426	30	2014-01-01	VIC1351	Inativo
354	1391	30	2014-01-01	VIC1352	Inativo
355	1390	30	2014-01-01	VIC1351	Inativo
356	1391	30	2014-01-01	VIC1352	Inativo
357	1418	30	2014-01-01	VIC1353	Inativo
358	1392	30	2014-01-01	VIC1354	Inativo
359	1393	30	2014-01-01	VIC1355	Inativo
360	1394	30	2014-01-01	VIC1356	Inativo
361	1395	30	2014-01-01	VIC1357	Inativo
362	1396	30	2014-01-01	VIC1358	Inativo
363	1397	30	2014-01-01	VIC1359	Inativo
364	1398	30	2014-01-01	VIC1360	Inativo
365	1399	30	2014-01-01	VIC1361	Inativo
366	1400	30	2014-01-01	VIC1362	Inativo
367	1401	30	2014-01-01	VIC1363	Inativo
368	1402	30	2014-01-01	VIC1364	Inativo
369	1403	30	2014-01-01	VIC1365	Inativo
370	1404	30	2014-01-01	VIC1366	Inativo
371	1405	30	2014-01-01	VIC1367	Inativo
372	1406	30	2014-01-01	VIC1368	Inativo
373	1407	30	2014-01-01	VIC1369	Inativo
374	1408	30	2014-01-01	VIC1370	Inativo
375	1409	30	2014-01-01	VIC1371	Inativo
376	1419	30	2014-01-01	VIC1372	Inativo
377	1410	30	2014-01-01	VIC1373	Inativo
378	1411	30	2014-01-01	VIC1374	Inativo
379	1412	30	2014-01-01	VIC1375	Inativo
380	1413	30	2014-01-01	VIC1376	Inativo
381	1415	30	2014-01-01	VIC1377	Inativo
382	1416	30	2014-01-01	VIC1378	Inativo
383	1417	30	2014-01-01	VIC1379	Inativo
384	1110	31	2014-01-01	VIC1380	Inativo
385	1111	31	2014-01-01	VIC1381	Inativo
386	1112	31	2014-01-01	VIC1382	Inativo
387	1113	31	2014-01-01	VIC1383	Inativo
388	1114	31	2014-01-01	VIC1384	Inativo
389	1115	31	2014-01-01	VIC1385	Inativo
390	1116	31	2014-01-01	VIC1386	Inativo
391	1117	31	2014-01-01	VIC1387	Inativo
392	1118	31	2014-01-01	VIC1388	Inativo
393	1119	31	2014-01-01	VIC1389	Inativo
394	1120	31	2014-01-01	VIC1390	Inativo
395	761	51	2014-11-20	testeee	Inativo
397	864	51	2014-11-20	teste05	Inativo
398	893	51	2014-11-20	teste050	Inativo
399	789	74	2014-11-20	888	Inativo
10	767	50	2014-11-24	VIC1006	Inativo
6	763	51	2014-11-24	VIC1002	Inativo
402	1122	51	2014-12-05	25223	Inativo
403	1089	83	2014-12-05	2525	Inativo
606	2782	177	2014-12-19	0001	Inativo
609	2799	177	2014-12-10	004	Inativo
611	1726	177	2014-12-10	005	Inativo
613	1587	177	2014-12-16	006	Inativo
614	1725	177	2014-12-01	007	Inativo
11	768	50	2014-01-01	VIC1007	Inativo
12	769	50	2014-01-01	VIC1008	Inativo
13	770	50	2014-01-01	VIC1009	Inativo
15	772	50	2014-01-01	VIC1011	Inativo
16	773	50	2014-01-01	VIC1012	Inativo
17	774	50	2014-01-01	VIC1013	Inativo
18	787	50	2014-01-01	VIC1014	Inativo
19	775	50	2014-01-01	VIC1015	Inativo
20	776	50	2014-01-31	VIC1016	Inativo
21	777	50	2014-01-01	VIC1017	Inativo
22	778	50	2014-01-01	VIC1018	Inativo
23	779	50	2014-01-01	VIC1019	Inativo
24	786	50	2014-01-01	VIC1020	Inativo
25	780	50	2014-01-01	VIC1021	Inativo
26	781	50	2014-01-01	VIC1022	Inativo
27	782	50	2014-01-01	VIC1023	Inativo
28	783	50	2014-01-01	VIC1024	Inativo
29	784	50	2014-01-01	VIC1025	Inativo
30	785	50	2014-01-01	VIC1026	Inativo
31	901	52	2014-01-01	VIC1140	Inativo
32	791	51	2014-01-01	VIC1027	Inativo
33	788	51	2014-01-01	VIC1028	Inativo
34	902	52	2014-01-01	VIC1141	Inativo
35	903	52	2014-01-01	VIC1142	Inativo
36	790	51	2014-01-01	VIC1029	Inativo
37	792	51	2014-01-01	VIC1030	Inativo
38	793	51	2014-01-01	VIC1031	Inativo
39	905	52	2014-01-01	VIC1143	Inativo
40	794	51	2014-01-01	VIC1032	Inativo
41	906	52	2014-01-01	VIC1144	Inativo
42	817	51	2014-01-01	VIC1033	Inativo
43	795	51	2014-01-01	VIC1034	Inativo
95	822	53	2014-01-01	VIC1060	Inativo
480	1215	165	2015-02-03	\N	Ativo
481	1252	165	2015-02-03	\N	Ativo
628	1739	177	2014-12-01	021	Inativo
647	1683	179	2014-12-17	025	Inativo
649	1661	179	2014-12-05	028	Inativo
650	1666	179	2014-12-08	029	Inativo
651	1641	179	2014-12-16	030	Inativo
652	1650	179	2014-12-18	031	Inativo
653	1659	179	2014-12-18	032	Inativo
654	1645	179	2014-12-18	033	Inativo
657	1657	179	2014-12-08	036	Inativo
658	1682	179	2014-12-08	037	Inativo
659	1692	179	2014-12-16	038	Inativo
660	1689	179	2014-12-18	039	Inativo
619	2827	177	2015-01-19	012	Ativo
620	2825	177	2015-01-15	013	Ativo
621	2824	177	2015-01-12	014	Ativo
622	2823	177	2015-01-13	015	Ativo
623	2821	177	2015-01-13	016	Ativo
624	2819	177	2015-01-13	017	Ativo
626	2817	177	2015-01-12	019	Ativo
630	2814	177	2015-01-12	022	Ativo
641	1221	163	2015-02-06	\N	Ativo
644	1147	163	2015-02-06	\N	Ativo
646	1148	163	2015-02-06	\N	Ativo
648	1654	179	2015-01-12	026	Ativo
751	2902	182	2015-02-05	077	Ativo
777	1092	160	2015-02-09	\N	Ativo
778	1165	160	2015-02-09	\N	Ativo
779	2907	160	2015-02-09	\N	Ativo
780	1173	160	2015-02-09	\N	Ativo
781	2908	160	2015-02-09	\N	Ativo
782	2909	160	2015-02-09	\N	Ativo
783	2910	160	2015-02-09	\N	Ativo
784	2911	160	2015-02-09	\N	Ativo
785	1175	160	2015-02-09	\N	Ativo
786	1177	160	2015-02-09	\N	Ativo
787	1178	160	2015-02-09	\N	Ativo
788	1182	160	2015-02-09	\N	Ativo
789	1491	160	2015-02-09	\N	Ativo
791	1109	160	2015-02-09	\N	Ativo
792	2912	179	2015-02-10	080	Ativo
793	2919	183	2015-01-12	081	Ativo
794	1775	183	2015-01-16	082	Ativo
795	1829	183	2015-01-12	083	Ativo
796	1572	185	2015-01-12	170	Ativo
800	2920	185	2015-01-12	174	Ativo
803	2298	183	2015-01-23	085	Ativo
805	1796	183	2015-01-23	087	Ativo
825	1787	183	2015-01-12	107	Ativo
826	1780	183	2015-01-12	108	Ativo
828	1786	183	2015-01-12	110	Ativo
797	1573	185	2014-12-19	171	Inativo
798	1577	185	2014-12-19	172	Inativo
799	1580	185	2014-12-18	173	Inativo
801	1808	183	2014-12-08	084	Inativo
802	1818	183	2014-12-08	085	Inativo
804	1871	183	2014-12-05	086	Inativo
807	2923	183	2014-12-08	089	Inativo
808	1800	183	2014-12-09	090	Inativo
809	1785	183	2014-12-15	091	Inativo
810	1809	183	2014-12-05	092	Inativo
811	1801	183	2014-12-15	093	Inativo
812	1813	183	2014-12-05	094	Inativo
813	1767	183	2014-12-05	095	Inativo
814	1772	183	2014-12-16	096	Inativo
815	1798	183	2014-12-16	097	Inativo
816	1778	183	2014-12-16	098	Inativo
817	1764	183	2014-12-16	099	Inativo
818	1803	183	2014-12-16	100	Inativo
819	1799	183	2014-12-05	101	Inativo
820	2924	183	2014-12-18	102	Inativo
821	1804	183	2014-12-19	103	Inativo
822	1806	183	2014-12-19	104	Inativo
823	1765	183	2014-12-15	105	Inativo
827	1771	183	2014-12-22	109	Inativo
829	1810	183	2014-12-05	111	Inativo
830	1732	185	2014-12-15	175	Inativo
831	1582	185	2014-12-18	176	Inativo
832	1586	185	2014-12-16	176	Inativo
833	1575	185	2014-12-04	177	Inativo
834	1569	177	2014-12-19	177	Inativo
835	1583	185	2014-12-08	178	Inativo
836	1571	185	2014-12-08	179	Inativo
837	1664	179	2014-12-03	035	Inativo
634	2875	161	2015-07-14		Ativo
639	1489	161	2015-07-14		Ativo
643	1146	161	2015-07-14		Ativo
840	1436	186	2015-03-12	0005	Ativo
841	1559	186	2015-03-12	0006	Ativo
842	987	186	2015-03-13	0007	Ativo
844	1915	186	2015-03-30	\N	Ativo
845	920	186	2015-03-31	\N	Ativo
848	2828	179	2015-04-01	114	Ativo
721	1755	46	2015-05-06	052	Inativo
849	2683	182	2014-12-16	115	Ativo
850	2942	188	2015-02-19	\N	Ativo
843	1324	186	2015-03-25	\N	Ativo
846	962	186	2015-04-07	\N	Ativo
851	2945	132	2015-05-21	\N	Ativo
852	3176	133	2015-06-25	333	Ativo
854	3222	132	2015-07-02	55	Ativo
428	1191	36	2015-07-13		Ativo
444	1248	36	2015-07-13		Ativo
463	1233	164	2015-07-13		Ativo
482	2722	166	2015-07-13		Inativo
631	2874	161	2015-07-14		Ativo
857	2950	188	2015-02-19	\N	Ativo
858	934	190	2015-01-07	\N	Ativo
859	936	190	2015-01-08	\N	Ativo
860	1079	190	2015-01-08	\N	Ativo
861	1040	190	2015-01-08	\N	Ativo
862	939	190	2015-01-08	\N	Ativo
863	1081	190	2015-01-12	\N	Ativo
864	1091	190	2015-01-26	\N	Ativo
865	1055	190	2014-12-23	\N	Ativo
866	1172	190	2015-01-08	\N	Ativo
867	1057	190	2015-01-07	\N	Ativo
868	1101	190	2015-01-07	\N	Ativo
869	1102	190	2014-12-23	\N	Ativo
870	1036	189	2015-01-23	\N	Ativo
871	1043	189	2015-01-07	\N	Ativo
872	1012	189	2015-01-21	\N	Ativo
873	940	188	2015-01-26	\N	Ativo
874	1548	188	2015-03-18	\N	Ativo
875	957	188	2015-01-21	\N	Ativo
876	3347	189	2015-07-23	2220	Ativo
877	3354	131	2015-07-23		Ativo
878	1110	187	2015-01-08	\N	Ativo
879	1380	187	2015-01-08	\N	Ativo
880	1382	187	2015-01-09	\N	Ativo
881	1387	187	2015-01-06	\N	Ativo
883	1388	187	2015-01-06	\N	Ativo
884	1425	187	2015-01-08	\N	Ativo
885	1418	187	2015-01-06	\N	Ativo
886	1393	187	2015-01-09	\N	Ativo
887	1122	187	2015-01-07	\N	Ativo
888	1124	187	2015-07-23	\N	Ativo
889	1125	187	2015-07-23	\N	Ativo
890	1129	187	2015-07-23	\N	Ativo
891	1149	187	2015-07-23	\N	Ativo
892	1132	187	2015-07-23	\N	Ativo
893	1133	187	2015-01-08	\N	Ativo
894	1136	187	2015-01-07	\N	Ativo
895	1145	187	2015-01-07	\N	Ativo
896	1411	187	2015-07-23	\N	Ativo
897	1144	187	2015-01-07	\N	Ativo
898	1414	187	2015-01-06	\N	Ativo
899	1415	187	2015-01-05	\N	Ativo
900	1416	187	2015-01-07	\N	Ativo
901	1383	136	2015-01-05	\N	Ativo
902	1114	136	2015-01-07	\N	Ativo
903	1389	136	2015-01-23	\N	Ativo
904	1391	136	2015-01-23	\N	Ativo
905	1117	136	2015-01-23	\N	Ativo
906	1392	136	2015-01-23	\N	Ativo
907	1396	136	2015-01-23	\N	Ativo
908	1397	136	2015-01-23	\N	Ativo
909	1398	136	2015-01-23	\N	Ativo
910	1403	136	2015-01-23	\N	Ativo
911	1121	136	2015-01-23	\N	Ativo
912	1404	136	2015-01-23	\N	Ativo
913	1405	136	2015-01-23	\N	Ativo
914	1409	136	2015-01-23	\N	Ativo
915	1138	136	2015-01-23	\N	Ativo
916	997	135	2015-01-23	\N	Ativo
917	2886	135	2015-01-23	\N	Ativo
918	1037	135	2015-01-23	\N	Ativo
919	959	135	2015-01-23	\N	Ativo
920	1038	135	2015-01-23	\N	Ativo
921	1112	135	2015-01-23	\N	Ativo
922	1005	135	2015-01-23	\N	Ativo
923	1007	135	2015-01-23	\N	Ativo
924	1042	135	2015-01-23	\N	Ativo
925	1011	135	2015-01-23	\N	Ativo
926	1013	135	2015-01-23	\N	Ativo
927	1014	135	2015-01-23	\N	Ativo
929	1015	135	2015-01-23	\N	Ativo
930	1046	135	2015-01-23	\N	Ativo
931	969	135	2015-01-23	\N	Ativo
932	1017	135	2015-01-23	\N	Ativo
933	1051	135	2015-01-23	\N	Ativo
934	975	135	2015-01-23	\N	Ativo
935	976	135	2015-01-23	\N	Ativo
936	981	135	2015-01-23	\N	Ativo
937	1096	135	2015-01-23	\N	Ativo
938	1025	135	2015-01-23	\N	Ativo
939	1027	135	2015-01-23	\N	Ativo
940	1029	135	2015-01-23	\N	Ativo
941	1030	135	2015-01-23	\N	Ativo
942	1104	135	2015-01-23	\N	Ativo
943	1059	135	2015-01-23	\N	Ativo
928	966	135	2015-07-23		Ativo
\.


--
-- TOC entry 4545 (class 0 OID 0)
-- Dependencies: 406
-- Name: matricula_id_seq; Type: SEQUENCE SET; Schema: educacao_academico; Owner: admin_db_sr
--

SELECT pg_catalog.setval('matricula_id_seq', 943, true);


--
-- TOC entry 4171 (class 0 OID 25488)
-- Dependencies: 407
-- Data for Name: matricula_nota; Type: TABLE DATA; Schema: educacao_academico; Owner: admin_db_sr
--

COPY matricula_nota (matricula_nota_id, nota_id) FROM stdin;
\.


--
-- TOC entry 4172 (class 0 OID 25491)
-- Dependencies: 408
-- Data for Name: nota; Type: TABLE DATA; Schema: educacao_academico; Owner: admin_db_sr
--

COPY nota (id, atividade_id, matricula_id, observacao, pontuacao) FROM stdin;
71	33	845		1
72	33	846		1.10000002
73	33	841		3.29999995
74	33	842		2.20000005
75	33	843		5
76	33	844		4.80000019
77	33	840		1.5
78	34	845		8
79	34	846		7
80	34	841		5
81	34	842		4
82	34	843		6
83	34	844		7
84	34	840		9
85	35	845		4
86	35	846		9
87	35	841		6
88	35	842		10
89	35	843		8
90	35	844		5
91	35	840		10
92	36	845		5
93	36	846		7
94	36	841		8
95	36	842		10
96	36	843		6
97	36	844		4
98	36	840		6
99	37	845		3
100	37	846		0
103	37	843		0
105	37	840		0
101	37	841		4
104	37	844		0.5
102	37	842		8
107	38	846		0
109	38	842		0
110	38	843		0
112	38	840		0
106	38	845		10
108	38	841		2
111	38	844		1.10000002
\.


--
-- TOC entry 4546 (class 0 OID 0)
-- Dependencies: 409
-- Name: nota_id_seq; Type: SEQUENCE SET; Schema: educacao_academico; Owner: admin_db_sr
--

SELECT pg_catalog.setval('nota_id_seq', 112, true);


--
-- TOC entry 4174 (class 0 OID 25496)
-- Dependencies: 410
-- Data for Name: sala; Type: TABLE DATA; Schema: educacao_academico; Owner: admin_db_sr
--

COPY sala (id, escola_id, sala, vagas) FROM stdin;
3	9	1	30
9	9	LABORATORIO DE INFORMATICA	30
11	8	LABORATORIO DE INFORMATICA	30
12	8	MULTIFUNCIONAL	30
13	8	DIRECAO	30
14	8	SALA DE JOGOS	30
16	8	SALA DE VIDEO	30
15	8	SECRETARIA	30
17	8	SALA DE LEITURA	30
18	8	SALA DOS PROFESSORES/COORDENACAO	30
19	8	COORDENACAO MAIS EDUCACAO	30
20	8	1	30
21	8	2	30
22	8	3	30
23	8	4	30
24	8	5	30
25	8	6	30
26	8	7	30
27	8	8	30
28	8	9	30
29	8	10	30
31	8	12	30
32	8	13	30
33	7	01	30
34	7	02	30
35	7	03	30
36	7	04	30
37	7	05	30
38	7	06	30
39	7	LABORATORIO DE INFORMATICA	30
40	7	LEITURA	30
41	8	ARQUIVO	30
47	50	sala de apresentração	100
74	10	teste85	89
75	10	teste85	89
76	10	teste85	89
30	7	11	30
4	9	2	32
5	9	3	32
6	9	4	32
7	9	5	25
8	9	6	25
10	9	MULTIFUNCIONAL	5
100	8	teste 01	3
101	8	teste 02	-1
102	8	teste 03	0
\.


--
-- TOC entry 4547 (class 0 OID 0)
-- Dependencies: 411
-- Name: sala_id_seq; Type: SEQUENCE SET; Schema: educacao_academico; Owner: admin_db_sr
--

SELECT pg_catalog.setval('sala_id_seq', 105, true);


--
-- TOC entry 4176 (class 0 OID 25504)
-- Dependencies: 412
-- Data for Name: serie; Type: TABLE DATA; Schema: educacao_academico; Owner: admin_db_sr
--

COPY serie (id, data_de_inicio, data_de_termino, numero_de_vagas, serie) FROM stdin;
3	2014-01-01	2014-12-31	100	NIVEL I
4	2014-01-01	2014-12-31	100	NIVEL II
5	2014-01-01	2014-12-31	100	NIVEL III
6	2014-01-01	2014-12-31	100	NIVEL IV
12	2014-01-01	2014-12-31	100	6 ANO
13	2014-01-01	2014-12-31	100	7 ANO
14	2014-01-01	2014-12-31	100	8 ANO
15	2014-01-01	2014-12-31	100	9 ANO
16	2014-01-01	2014-12-31	100	1 SERIE
17	2014-01-01	2014-12-31	100	2 SERIE
18	2014-01-01	2104-12-31	100	3 SERIE
53	2015-03-02	2015-12-21	23	NIVEL III/IV
11	2015-03-02	2015-12-21	100	5 ANO
7	2015-03-02	2015-12-19	100	1 ANO
8	2015-03-02	2015-12-21	100	2 ANO
10	2015-03-02	2015-12-21	64	4 ANO
19	2015-03-02	2015-12-21	28	CORREÇÃO DE FLUXO - FUNDAMENTAL
9	2015-03-02	2015-12-19	64	3 ANO
\.


--
-- TOC entry 4548 (class 0 OID 0)
-- Dependencies: 413
-- Name: serie_id_seq; Type: SEQUENCE SET; Schema: educacao_academico; Owner: admin_db_sr
--

SELECT pg_catalog.setval('serie_id_seq', 53, true);


--
-- TOC entry 4179 (class 0 OID 25514)
-- Dependencies: 415
-- Data for Name: tipo_aula; Type: TABLE DATA; Schema: educacao_academico; Owner: admin_db_sr
--

COPY tipo_aula (id, tipo_de_aula) FROM stdin;
2	PRESENCIAL
3	DE CAMPO
4	A DISTÂNCIA
\.


--
-- TOC entry 4549 (class 0 OID 0)
-- Dependencies: 414
-- Name: tipo_aula_id_seq; Type: SEQUENCE SET; Schema: educacao_academico; Owner: admin_db_sr
--

SELECT pg_catalog.setval('tipo_aula_id_seq', 4, true);


--
-- TOC entry 4180 (class 0 OID 25521)
-- Dependencies: 416
-- Data for Name: tipoaula; Type: TABLE DATA; Schema: educacao_academico; Owner: admin_db_sr
--

COPY tipoaula (id, tipo_de_aula) FROM stdin;
\.


--
-- TOC entry 4550 (class 0 OID 0)
-- Dependencies: 417
-- Name: tipoaula_id_seq; Type: SEQUENCE SET; Schema: educacao_academico; Owner: admin_db_sr
--

SELECT pg_catalog.setval('tipoaula_id_seq', 1, false);


--
-- TOC entry 4182 (class 0 OID 25526)
-- Dependencies: 418
-- Data for Name: turma; Type: TABLE DATA; Schema: educacao_academico; Owner: admin_db_sr
--

COPY turma (id, serie_id, turma, vagas, escola_id, ano_letivo, turno) FROM stdin;
177	53	EDUCAÇÃO INFANTIL B	25	9	2015	VESPERTINO
183	11	ÚNICO	32	9	2015	VESPERTINO
157	8	teste	11	7	2015	\N
181	7	B	11	7	2015	MATUTINO
179	9	B	25	9	2015	VESPERTINO
76	3	asd	44	22	2014	\N
77	3	asd	44	22	2014	\N
78	3	asd	44	22	2014	\N
79	3	asd	44	22	2014	\N
80	3	asd	44	22	2014	\N
81	3	AAAB	36	10	2014	\N
36	15	B - VICENTE	50	8	2014	\N
82	3	AAAB	36	10	2014	\N
113	11	turma teste	25	10	2014	\N
83	6	abcc	2	10	2014	\N
88	3	chico	100	10	2014	\N
89	3	767	767	10	2014	\N
90	3	767	767	10	2014	\N
92	3	23123	123	10	2014	\N
93	5	turma da monica	1	10	2014	\N
94	5	turma da monica 2	19	10	2014	\N
95	3	xurumelas	11	16	2014	\N
96	3	8858	8	10	2014	\N
100	8	turma mesquita	25	47	2014	\N
108	16	teste t	69	44	2014	\N
109	16	teste t	20	44	2014	\N
110	12	teste 99	58	11	2014	\N
111	9	teste rer	20	10	2014	\N
112	9	teste rer	20	10	2014	\N
38	15	D - VICENTE	50	8	2014	\N
51	8	U - VICENTE	50	8	2014	\N
52	11	A - VICENTE	50	8	2014	\N
53	18	U - VICENTE	50	8	2014	\N
54	11	B - VICENTE	50	8	2014	\N
55	10	A - VICENTE	50	8	2014	\N
56	10	B - VICENTE	50	8	2014	\N
50	7	U-VICENTE	50	8	2014	\N
39	7	A - CANTINHO	50	9	2014	\N
40	7	B - CANTINHO	50	9	2014	\N
42	8	A - CANTINHO	50	9	2014	\N
43	8	B - CANTINHO	50	9	2014	\N
41	9	A - CANTINHO	50	9	2014	\N
44	9	B - CANTINHO	50	9	2014	\N
45	10	A - CANTINHO	50	9	2014	\N
46	10	B - CANTINHO	50	9	2014	\N
15	7	A - DOM	50	7	2014	\N
16	7	B - DOM	50	7	2014	\N
18	8	A - DOM	50	7	2014	\N
19	8	B - DOM	50	7	2014	\N
22	9	B - DOM	50	7	2014	\N
47	11	U - CANTINHO	50	9	2014	\N
70	13	NN	55	15	2014	\N
71	3	abcd	300	10	2014	\N
72	5	5	9	10	2014	\N
73	5	5	9	10	2014	\N
74	8	AAAAAR	66	10	2014	\N
23	12	A-VICENTE	50	8	2014	\N
24	12	E - VICENTE	50	8	2014	\N
26	12	B-VICENTE	50	8	2014	\N
25	13	C - VICENTE	50	8	2014	\N
27	13	D - VICENTE	50	8	2014	\N
28	12	C-VICENTE	50	8	2014	\N
29	12	D-VICENTE	50	8	2014	\N
30	13	A-VICENTE	50	8	2014	\N
31	13	B-VICENTE	50	8	2014	\N
32	14	A - VICENTE	50	8	2014	\N
33	14	B - VICENTE	50	8	2014	\N
35	15	A - VICENTE	50	8	2014	\N
34	14	C - VICENTE	50	8	2014	\N
37	15	C - VICENTE	50	8	2014	\N
127	9	Única	40	8	2015	\N
128	10	Única	40	8	2015	\N
132	12	B	40	8	2015	\N
137	19	Única	40	8	2015	\N
185	53	EDUCAÇÃO INFANTIL A	25	9	2015	MATUTINO
184	7	A	30	9	2015	MATUTINO
156	7	A	30	7	2015	\N
129	11	A	40	8	2015	\N
130	11	B	40	8	2015	\N
182	10	A	32	9	2015	VESPERTINO
164	15	A	40	8	2015	VESPERTINO
165	15	B	40	8	2015	VESPERTINO
162	14	C	40	8	2015	VESPERTINO
163	14	D	40	8	2015	VESPERTINO
166	15	C	40	8	2015	VESPERTINO
158	13	C	40	8	2015	VESPERTINO
159	13	D	40	8	2015	VESPERTINO
160	13	E	40	8	2015	VESPERTINO
135	13	B	40	8	2015	MATUTINO
134	13	A	40	8	2015	MATUTINO
125	7	Único	40	8	2015	VESPERTINO
186	6	TURMA TESTE DE ATIVIDADE	10	8	2015	MATUTINO
187	14	B	40	8	2015	MATUTINO
161	14	E	40	8	2015	VESPERTINO
188	12	D	40	8	2015	VESPERTINO
189	12	E	40	8	2015	VESPERTINO
190	12	F	40	8	2015	VESPERTINO
131	12	A	40	8	2015	MATUTINO
133	12	C	40	8	2015	MATUTINO
136	14	A	40	8	2015	MATUTINO
126	8	Único	40	8	2015	MATUTINO
\.


--
-- TOC entry 4183 (class 0 OID 25532)
-- Dependencies: 419
-- Data for Name: turma_disciplina; Type: TABLE DATA; Schema: educacao_academico; Owner: admin_db_sr
--

COPY turma_disciplina (id, turma_id, data_inicio, data_termino, identificacao, disciplina_lecionada_por_professor_id) FROM stdin;
8	23	2014-01-01	2014-12-31	VICENTE6A-IEGEO	86
9	23	2014-01-01	2014-12-31	VICENTE6A-MBCIE	117
10	26	2014-01-01	2014-12-31	VICENTE6B-LMPOR	102
11	26	2014-01-01	2014-12-31	VICENTE6B-IEGEO	86
12	24	2014-01-01	2014-12-31	VICENTE6E-DOPOR	66
13	28	2014-01-01	2014-12-31	VICENTE6C-LMPOR	102
744	156	2015-02-03	2015-02-03	Automatico - 156 - 94 - 0	94
20	29	2014-01-01	2014-12-31	VICENTE6D-MBCIE	117
21	29	2014-01-01	2014-12-31	VICENTE6D-LMPOR	102
22	30	2014-01-01	2014-12-31	VICENTE7A-DOPOR	66
23	24	2014-01-01	2014-12-31	VICENTE6E-MAGEO	106
25	31	2014-01-01	2014-12-31	VICENTE7B-MBCIE	117
26	31	2014-01-01	2014-12-31	VICENTE7B-DOPOR	66
27	31	2014-08-01	2014-12-31	VICENTE7B-IEGEO	86
28	23	2014-01-01	2014-12-31	VICENTE6A-GQEDU	80
29	24	2014-01-01	2014-12-31	VICENTE6E-ESCIE	67
30	23	2014-01-01	2014-12-31	VICENTE6A-MBCUL	146
31	24	2014-01-01	2014-12-31	VICENTE6E-DSART	65
32	23	2014-01-01	2014-12-31	VICENTE6A-LMPOR	102
34	26	2014-01-01	2014-12-31	VICENTE6B-JVING	85
35	28	2014-01-01	2014-12-31	VICENTE6C-MBCIE	117
36	28	2014-01-01	2014-12-31	VICENTE6C-JVING	85
37	29	2014-01-01	2014-12-31	VICENTE6D-JVING	85
38	30	2014-01-01	2014-12-31	VICENTE7A-MBCIE	117
39	31	2014-01-01	2014-12-31	VICENTE7B-JVING	85
40	23	2014-01-01	2014-12-31	VICENTE6A-JVING	85
41	26	2014-01-01	2014-12-31	VICENTE6B-MBCUL	146
42	26	2014-01-01	2014-12-31	VICENTE6B-MBCIE	117
44	29	2014-01-01	2014-12-31	VICENTE6D-IEGEO	86
45	24	2014-01-01	2014-12-31	VICENTE6E-MFHIS	108
46	30	2014-01-01	2014-12-31	VICENTE7A-IEGEO	86
48	26	2014-01-01	2014-12-31	VICENTE6B-ILEDU	88
49	24	2014-01-01	2014-12-31	VICENTE6E-CMING	69
50	28	2014-01-01	2014-12-31	VICENTE6C-ILEDU	88
51	28	2014-01-01	2014-12-31	VICENTE6C-IEGEO	86
52	29	2014-01-01	2014-12-31	VICENTE6D-ILEDU	88
53	30	2014-01-01	2014-12-31	VICENTE7A-JVING	85
54	30	2014-01-01	2014-12-31	VICENTE7A-ILEDU	88
56	30	2014-01-01	2014-12-31	VICENTE7A-IECUL	152
57	31	2014-01-01	2014-12-31	VICENTE7B-ILEDU	88
58	31	2014-01-01	2014-12-31	VICENTE7B-IECUL	152
59	24	2014-01-01	2014-12-31	VICENTE6E-LEEDU	105
60	25	2014-01-01	2014-12-31	VICENTE7C-MAGEO	106
61	25	2014-01-01	2014-12-31	VICENTE7C-DOPOR	66
62	25	2014-01-01	2014-12-31	VICENTE7C-ESCIE	67
63	25	2014-01-01	2014-12-31	VICENTE7C-MFHIS	108
64	26	2014-01-01	2014-12-31	VICENTE6B-ASART	155
65	28	2014-01-01	2014-12-31	VICENTE6C-ASART	155
66	29	2014-01-01	2014-12-31	VICENTE6D-ASART	155
67	30	2014-01-01	2014-12-31	VICENTE7A-ASART	155
68	31	2014-01-01	2014-12-31	VICENTE7B-ASART	155
69	23	2014-01-01	2014-12-31	VICENTE6A-ASART	155
71	25	2014-01-01	2014-12-31	VICENTE7C-CMING	69
72	25	2014-01-01	2014-12-31	VICENTE7C-JWREL	91
74	25	2014-01-01	2014-12-31	VICENTE7C-MFHIS	108
75	25	2014-01-01	2014-12-31	VICENTE7C-DSART	65
77	27	2014-01-01	2014-12-31	VICENTE7D-MIPOR	114
78	27	2014-01-01	2014-12-31	VICENTE7D-ESCIE	67
79	27	2014-01-01	2014-12-31	VICENTE7D-MAGEO	106
80	27	2014-01-01	2014-12-31	VICENTE7D-MFHIS	108
81	27	2014-01-01	2014-12-31	VICENTE7D-JWREL	91
82	27	2014-01-01	2014-12-31	VICENTE7D-CDING	69
84	27	2014-01-01	2014-12-31	VICENTE7D-DSART	65
85	32	2014-01-01	2014-12-31	VICENTE8A-MIPOR	114
86	32	2014-01-01	2014-12-31	VICENTE8A-ESCIE	67
88	32	2014-01-01	2014-12-31	VICENTE8A-DSART	65
89	32	2014-01-01	2014-12-31	VICENTE8A-MFHIS	108
90	32	2014-01-01	2014-12-31	VICENTE8A-CMING	69
92	32	2014-01-01	2014-12-31	VICENTE8A-LEEDU	105
83	27	2014-01-01	2014-12-31	VICENTE7D-LEEDU	105
93	32	2014-01-01	2014-12-31	VICENTE8A-MFHIS	108
94	32	2014-01-01	2014-12-31	VICENTE8A-MAGEO	106
95	32	2014-01-01	2014-12-31	VICENTE8A-CMING	69
96	33	2014-01-01	2014-12-31	VICENTE8B-MDGEO	109
98	33	2014-01-01	2014-12-31	VICENTE8B-MIPOR	114
99	33	2014-01-01	2014-12-31	VICENTE8B-DSART	65
100	33	2014-01-01	2014-12-31	VICENTE8B-ESCIE	67
102	33	2014-01-01	2014-12-31	VICENTE8B-CMING	69
103	33	2014-01-01	2014-12-31	VICENTE8B-JLHIS	95
104	33	2014-01-01	2014-12-31	VICENTE8B-LEEDU	105
114	35	2014-01-01	2014-12-31	VICENTE9A-GMPOR	78
115	35	2014-01-01	2014-12-31	VICENTE9A-AGCIE	49
117	35	2014-01-01	2014-12-31	VICENTE9A-CMING	69
73	25	2014-12-01	2014-12-31	VICENTE7C-LEEDU	105
91	32	2014-01-01	2014-12-31	VICENTE8A-JWREL	91
101	33	2014-01-01	2014-12-31	VICENTE8B-JWREL	91
118	35	2014-01-01	2014-12-31	VICENTE9A-RBEDU	128
119	35	2014-01-01	2014-12-31	VICENTE9A-JWREL	91
120	35	2014-01-01	2014-12-31	VICENTE9A-MDGEO	109
121	35	2014-01-01	2014-12-31	VICENTE9A-JLHIS	95
127	36	2014-01-01	2014-12-31	VICENTE9B-MDGEO	109
129	36	2014-01-01	2014-12-31	VICENTE9B-JLHIS	95
130	36	2014-01-01	2014-12-31	VICENTE9B-DSART	65
131	36	2014-01-01	2014-12-31	VICENTE9B-JWREL	91
132	37	2014-01-01	2014-12-31	VICENTE9C-JLHIS	95
134	37	2014-01-01	2014-12-31	VICENTE9C-AGCIE	49
135	37	2014-01-01	2014-12-31	VICENTE9C-CMING	69
136	37	2014-01-01	2014-12-31	VICENTE9C-JWREL	91
137	37	2014-01-01	2014-12-31	VICENTE9C-MDGEO	109
138	37	2014-01-01	2014-12-31	VICENTE9C-RBEDU	128
139	37	2014-01-01	2014-12-31	VICENTE9C-DSART	65
142	38	2014-01-01	2014-12-31	VICENTE9D-AGCIE	49
143	38	2014-01-01	2014-12-31	VICENTE9D-MDGEO	109
144	38	2014-01-01	2014-12-31	VICENTE9D-DSART	65
145	38	2014-01-01	2014-12-31	VICENTE9D-GMPOR	78
146	38	2014-01-01	2014-12-31	VICENTE9D-CMING	69
147	38	2014-01-01	2014-12-31	VICENTE9D-RBEDU	128
148	38	2014-01-01	2014-12-31	VICENTE9D-JLHIS	95
149	38	2014-01-01	2014-12-31	VICENTE9D-JWREL	91
150	38	2014-01-01	2014-12-31	VICENTE9D-JLCUL	156
151	37	2014-01-01	2014-12-31	VICENTE9C-JLCUL	156
152	36	2014-01-01	2014-12-31	VICENTE9B-MDCUL	157
153	35	2014-01-01	2014-12-31	VICENTE9A-MDCUL	157
155	33	2014-01-01	2014-12-31	VICENTE8B-ESCUL	158
156	32	2014-01-01	2014-12-31	VICENTE8A-ESCUL	158
55	24	2014-01-01	2014-12-31	VICENTE6E-JWREL	91
122	35	2014-01-01	2014-12-31	VICENTE9A-DSART	65
123	36	2014-01-01	2014-12-31	VICENTE9B-AGCIE	49
128	36	2014-01-01	2014-12-31	VICENTE9B-RBEDU	128
126	36	2014-01-01	2014-12-31	VICENTE9B-CMING	69
125	36	2014-01-01	2014-12-31	VICENTE9B-GMPOR	78
133	37	2014-01-01	2014-12-31	VICENTE9C-GMPOR	78
745	157	2015-02-03	2015-02-03	Automatico - 157 - 94 - 0	94
183	110	2014-11-26	2014-11-26	Automatico - 110 - 2	13
797	181	2015-02-06	2015-02-06	Automatico - 181 - 261 - 0	261
798	182	2015-02-06	2015-02-06	Automatico - 182 - 122 - 0	122
799	182	2015-02-06	2015-02-06	Automatico - 182 - 124 - 1	124
800	182	2015-02-06	2015-02-06	Automatico - 182 - 125 - 2	125
801	182	2015-02-09	2015-02-09	Automatico - 182 - 126 - 3	126
802	182	2015-02-09	2015-02-09	Automatico - 182 - 127 - 4	127
803	182	2015-02-09	2015-02-09	Automatico - 182 - 129 - 5	129
804	182	2015-02-09	2015-02-09	Automatico - 182 - 130 - 6	130
805	183	2015-02-09	2015-02-09	Automatico - 183 - 110 - 0	110
806	183	2015-02-09	2015-02-09	Automatico - 183 - 112 - 1	112
807	183	2015-02-09	2015-02-09	Automatico - 183 - 113 - 2	113
808	184	2015-02-11	2015-02-11	Automatico - 184 - 10 - 0	10
809	184	2015-02-11	2015-02-11	Automatico - 184 - 12 - 1	12
667	88	2014-12-01	2014-12-01	Automatico - 88 - 10 - 0	10
810	184	2015-02-11	2015-02-11	Automatico - 184 - 15 - 2	15
669	113	2014-12-01	2014-12-01	Automatico - 113 - 10 - 0	10
670	76	2014-12-01	2014-12-01	Automatico - 76 - 10 - 0	10
811	184	2015-02-11	2015-02-11	Automatico - 184 - 16 - 3	16
672	80	2014-12-01	2014-12-01	Automatico - 80 - 10 - 0	10
812	184	2015-02-11	2015-02-11	Automatico - 184 - 17 - 4	17
813	185	2015-02-11	2015-02-11	Automatico - 185 - 50 - 0	50
814	185	2015-02-11	2015-02-11	Automatico - 185 - 51 - 1	51
816	183	2015-02-13	2015-02-13	Automatico - 183 - 115 - 3	115
817	183	2015-02-13	2015-02-13	Automatico - 183 - 118 - 4	118
818	183	2015-02-13	2015-02-13	Automatico - 183 - 119 - 5	119
820	183	2015-02-13	2015-02-13	Automatico - 183 - 286 - 7	286
702	125	2015-01-27	2015-01-27	Automatico - 125 - 70 - 0	70
703	126	2015-01-27	2015-01-27	Automatico - 126 - 240 - 0	240
704	127	2015-01-27	2015-01-27	Automatico - 127 - 240 - 0	240
705	128	2015-01-27	2015-01-27	Automatico - 128 - 240 - 0	240
706	129	2015-01-27	2015-01-27	Automatico - 129 - 240 - 0	240
707	130	2015-01-27	2015-01-27	Automatico - 130 - 240 - 0	240
708	131	2015-01-27	2015-01-27	Automatico - 131 - 240 - 0	240
709	132	2015-01-27	2015-01-27	Automatico - 132 - 240 - 0	240
710	133	2015-01-27	2015-01-27	Automatico - 133 - 240 - 0	240
711	134	2015-01-27	2015-01-27	Automatico - 134 - 240 - 0	240
712	135	2015-01-27	2015-01-27	Automatico - 135 - 240 - 0	240
713	136	2015-01-27	2015-01-27	Automatico - 136 - 240 - 0	240
714	137	2015-01-27	2015-01-27	Automatico - 137 - 240 - 0	240
823	183	2015-02-13	2015-02-13	Automatico - 183 - 286 - 6	286
824	183	2015-02-13	2015-02-13	Automatico - 183 - 295 - 7	295
826	182	2015-02-13	2015-02-13	Automatico - 182 - 296 - 7	296
827	186	2015-03-11	2015-03-11	Automatico - 186 - 67 - 0	67
828	187	2015-04-22	2015-04-22	Automatico - 187 - 65 - 0	65
829	187	2015-04-22	2015-04-22	Automatico - 187 - 69 - 1	69
830	187	2015-04-22	2015-04-22	Automatico - 187 - 91 - 2	91
831	187	2015-04-22	2015-04-22	Automatico - 187 - 105 - 3	105
832	187	2015-04-22	2015-04-22	Automatico - 187 - 108 - 4	108
833	187	2015-04-22	2015-04-22	Automatico - 187 - 109 - 5	109
834	188	2015-04-22	2015-04-22	Automatico - 188 - 65 - 0	65
835	188	2015-04-22	2015-04-22	Automatico - 188 - 69 - 1	69
836	188	2015-04-22	2015-04-22	Automatico - 188 - 91 - 2	91
837	189	2015-04-22	2015-04-22	Automatico - 189 - 65 - 0	65
838	189	2015-04-22	2015-04-22	Automatico - 189 - 69 - 1	69
839	189	2015-04-22	2015-04-22	Automatico - 189 - 91 - 2	91
840	190	2015-04-22	2015-04-22	Automatico - 190 - 65 - 0	65
841	190	2015-04-22	2015-04-22	Automatico - 190 - 69 - 1	69
842	190	2015-04-22	2015-04-22	Automatico - 190 - 91 - 2	91
843	177	2015-05-06	2015-05-06	Automatico - 177 - 298 - 8	298
844	177	2015-05-06	2015-05-06	Automatico - 177 - 299 - 9	299
845	177	2015-05-06	2015-05-06	Automatico - 177 - 300 - 10	300
846	177	2015-05-06	2015-05-06	Automatico - 177 - 301 - 11	301
847	177	2015-05-06	2015-05-06	Automatico - 177 - 302 - 12	302
848	177	2015-05-06	2015-05-06	Automatico - 177 - 303 - 13	303
849	177	2015-05-06	2015-05-06	Automatico - 177 - 304 - 14	304
850	177	2015-05-06	2015-05-06	Automatico - 177 - 305 - 15	305
852	177	2015-05-06	2015-05-06	Automatico - 177 - 298 - 1	298
853	177	2015-05-06	2015-05-06	Automatico - 177 - 299 - 2	299
854	177	2015-05-06	2015-05-06	Automatico - 177 - 300 - 3	300
855	177	2015-05-06	2015-05-06	Automatico - 177 - 301 - 4	301
856	177	2015-05-06	2015-05-06	Automatico - 177 - 302 - 5	302
857	177	2015-05-06	2015-05-06	Automatico - 177 - 303 - 6	303
858	177	2015-05-06	2015-05-06	Automatico - 177 - 304 - 7	304
859	177	2015-05-06	2015-05-06	Automatico - 177 - 305 - 8	305
860	177	2015-05-06	2015-05-06	Automatico - 177 - 298 - 0	298
861	177	2015-05-06	2015-05-06	Automatico - 177 - 299 - 1	299
862	177	2015-05-06	2015-05-06	Automatico - 177 - 300 - 2	300
863	177	2015-05-06	2015-05-06	Automatico - 177 - 301 - 3	301
864	177	2015-05-06	2015-05-06	Automatico - 177 - 302 - 4	302
865	177	2015-05-06	2015-05-06	Automatico - 177 - 303 - 5	303
866	177	2015-05-06	2015-05-06	Automatico - 177 - 304 - 6	304
867	177	2015-05-06	2015-05-06	Automatico - 177 - 305 - 7	305
868	179	2015-05-06	2015-05-06	Automatico - 179 - 306 - 0	306
869	179	2015-05-06	2015-05-06	Automatico - 179 - 307 - 1	307
870	179	2015-05-06	2015-05-06	Automatico - 179 - 308 - 2	308
871	179	2015-05-06	2015-05-06	Automatico - 179 - 309 - 3	309
872	179	2015-05-06	2015-05-06	Automatico - 179 - 310 - 4	310
873	179	2015-05-06	2015-05-06	Automatico - 179 - 311 - 5	311
874	179	2015-05-06	2015-05-06	Automatico - 179 - 312 - 6	312
875	179	2015-05-06	2015-05-06	Automatico - 179 - 313 - 7	313
876	164	2015-05-13	2015-05-13	Automatico - 164 - 65 - 1	65
877	164	2015-05-13	2015-05-13	Automatico - 164 - 69 - 2	69
878	188	2015-06-02	2015-06-02	Automatico - 188 - 105 - 3	105
879	188	2015-06-02	2015-06-02	Automatico - 188 - 108 - 4	108
882	189	2015-06-02	2015-06-02	Automatico - 189 - 105 - 3	105
883	189	2015-06-02	2015-06-02	Automatico - 189 - 108 - 4	108
886	190	2015-06-02	2015-06-02	Automatico - 190 - 67 - 1	67
887	190	2015-06-02	2015-06-02	Automatico - 190 - 69 - 2	69
888	190	2015-06-02	2015-06-02	Automatico - 190 - 91 - 3	91
889	190	2015-06-02	2015-06-02	Automatico - 190 - 105 - 4	105
890	190	2015-06-02	2015-06-02	Automatico - 190 - 108 - 5	108
891	190	2015-06-02	2015-06-02	Automatico - 190 - 114 - 6	114
892	190	2015-06-02	2015-06-02	Automatico - 190 - 315 - 7	315
893	158	2015-06-02	2015-06-02	Automatico - 158 - 65 - 0	65
894	158	2015-06-02	2015-06-02	Automatico - 158 - 67 - 1	67
895	158	2015-06-02	2015-06-02	Automatico - 158 - 69 - 2	69
896	158	2015-06-02	2015-06-02	Automatico - 158 - 91 - 3	91
897	158	2015-06-02	2015-06-02	Automatico - 158 - 105 - 4	105
898	158	2015-06-02	2015-06-02	Automatico - 158 - 114 - 5	114
899	158	2015-06-02	2015-06-02	Automatico - 158 - 315 - 6	315
900	162	2015-06-02	2015-06-02	Automatico - 162 - 65 - 0	65
901	162	2015-06-02	2015-06-02	Automatico - 162 - 67 - 1	67
902	162	2015-06-02	2015-06-02	Automatico - 162 - 69 - 2	69
903	162	2015-06-02	2015-06-02	Automatico - 162 - 91 - 3	91
908	163	2015-06-02	2015-06-02	Automatico - 163 - 65 - 0	65
909	163	2015-06-02	2015-06-02	Automatico - 163 - 67 - 1	67
910	163	2015-06-02	2015-06-02	Automatico - 163 - 69 - 2	69
911	163	2015-06-02	2015-06-02	Automatico - 163 - 91 - 3	91
912	163	2015-06-02	2015-06-02	Automatico - 163 - 109 - 4	109
914	163	2015-06-02	2015-06-02	Automatico - 163 - 314 - 6	314
916	161	2015-06-02	2015-06-02	Automatico - 161 - 65 - 0	65
917	161	2015-06-02	2015-06-02	Automatico - 161 - 69 - 1	69
918	161	2015-06-02	2015-06-02	Automatico - 161 - 91 - 2	91
919	161	2015-06-02	2015-06-02	Automatico - 161 - 109 - 3	109
921	161	2015-06-02	2015-06-02	Automatico - 161 - 314 - 5	314
927	164	2015-07-14	2015-07-14	Automatico - 164 - 91 - 3	91
928	164	2015-07-14	2015-07-14	Automatico - 164 - 109 - 4	109
929	164	2015-07-14	2015-07-14	Automatico - 164 - 314 - 5	314
930	164	2015-07-14	2015-07-14	Automatico - 164 - 65 - 0	65
931	164	2015-07-14	2015-07-14	Automatico - 164 - 69 - 1	69
932	164	2015-07-14	2015-07-14	Automatico - 164 - 91 - 2	91
933	164	2015-07-14	2015-07-14	Automatico - 164 - 109 - 3	109
934	164	2015-07-14	2015-07-14	Automatico - 164 - 314 - 4	314
935	131	2015-07-14	2015-07-14	Automatico - 131 - 10 - 1	10
936	133	2015-07-14	2015-07-14	Automatico - 133 - 10 - 1	10
937	165	2015-07-14	2015-07-14	Automatico - 165 - 65 - 0	65
938	165	2015-07-14	2015-07-14	Automatico - 165 - 91 - 1	91
939	165	2015-07-14	2015-07-14	Automatico - 165 - 109 - 2	109
940	165	2015-07-14	2015-07-14	Automatico - 165 - 314 - 3	314
941	166	2015-07-14	2015-07-14	Automatico - 166 - 65 - 0	65
942	166	2015-07-14	2015-07-14	Automatico - 166 - 91 - 1	91
943	166	2015-07-14	2015-07-14	Automatico - 166 - 109 - 2	109
944	166	2015-07-14	2015-07-14	Automatico - 166 - 314 - 3	314
945	162	2015-07-14	2015-07-14	Automatico - 162 - 114 - 5	114
948	162	2015-07-14	2015-07-14	Automatico - 162 - 315 - 8	315
949	162	2015-07-14	2015-07-14	Automatico - 162 - 315 - 6	315
950	163	2015-07-14	2015-07-14	Automatico - 163 - 314 - 5	314
951	161	2015-07-15	2015-07-15	Automatico - 161 - 314 - 4	314
952	161	2015-07-15	2015-07-15	Automatico - 161 - 316 - 5	316
953	162	2015-07-15	2015-07-15	Automatico - 162 - 114 - 4	114
954	162	2015-07-15	2015-07-15	Automatico - 162 - 315 - 5	315
955	160	2015-07-15	2015-07-15	Automatico - 160 - 67 - 0	67
956	160	2015-07-15	2015-07-15	Automatico - 160 - 69 - 1	69
957	160	2015-07-15	2015-07-15	Automatico - 160 - 91 - 2	91
958	160	2015-07-15	2015-07-15	Automatico - 160 - 105 - 3	105
959	160	2015-07-15	2015-07-15	Automatico - 160 - 114 - 4	114
960	160	2015-07-15	2015-07-15	Automatico - 160 - 315 - 5	315
961	160	2015-07-15	2015-07-15	Automatico - 160 - 316 - 6	316
962	159	2015-07-15	2015-07-15	Automatico - 159 - 67 - 0	67
963	159	2015-07-15	2015-07-15	Automatico - 159 - 69 - 1	69
964	159	2015-07-15	2015-07-15	Automatico - 159 - 91 - 2	91
965	159	2015-07-15	2015-07-15	Automatico - 159 - 105 - 3	105
966	159	2015-07-15	2015-07-15	Automatico - 159 - 114 - 4	114
967	159	2015-07-15	2015-07-15	Automatico - 159 - 315 - 5	315
968	159	2015-07-15	2015-07-15	Automatico - 159 - 316 - 6	316
969	189	2015-07-15	2015-07-15	Automatico - 189 - 66 - 1	66
970	189	2015-07-15	2015-07-15	Automatico - 189 - 69 - 2	69
971	189	2015-07-15	2015-07-15	Automatico - 189 - 91 - 3	91
972	189	2015-07-15	2015-07-15	Automatico - 189 - 105 - 4	105
973	189	2015-07-15	2015-07-15	Automatico - 189 - 108 - 5	108
974	188	2015-07-15	2015-07-15	Automatico - 188 - 66 - 1	66
975	188	2015-07-15	2015-07-15	Automatico - 188 - 69 - 2	69
976	188	2015-07-15	2015-07-15	Automatico - 188 - 91 - 3	91
977	188	2015-07-15	2015-07-15	Automatico - 188 - 105 - 4	105
978	188	2015-07-15	2015-07-15	Automatico - 188 - 108 - 5	108
979	136	2015-07-16	2015-07-16	Automatico - 136 - 26 - 1	26
980	126	2015-07-20	2015-07-20	Automatico - 126 - 10 - 1	10
\.


--
-- TOC entry 4551 (class 0 OID 0)
-- Dependencies: 420
-- Name: turma_disciplina_id_seq; Type: SEQUENCE SET; Schema: educacao_academico; Owner: admin_db_sr
--

SELECT pg_catalog.setval('turma_disciplina_id_seq', 980, true);


--
-- TOC entry 4552 (class 0 OID 0)
-- Dependencies: 421
-- Name: turma_id_seq; Type: SEQUENCE SET; Schema: educacao_academico; Owner: admin_db_sr
--

SELECT pg_catalog.setval('turma_id_seq', 190, true);


SET search_path = educacao_biblioteca, pg_catalog;

--
-- TOC entry 4186 (class 0 OID 25542)
-- Dependencies: 422
-- Data for Name: acervo; Type: TABLE DATA; Schema: educacao_biblioteca; Owner: admin_db_sr
--

COPY acervo (id, escola_id, nome) FROM stdin;
\.


--
-- TOC entry 4553 (class 0 OID 0)
-- Dependencies: 423
-- Name: acervo_id_seq; Type: SEQUENCE SET; Schema: educacao_biblioteca; Owner: admin_db_sr
--

SELECT pg_catalog.setval('acervo_id_seq', 1, false);


--
-- TOC entry 4188 (class 0 OID 25550)
-- Dependencies: 424
-- Data for Name: autor; Type: TABLE DATA; Schema: educacao_biblioteca; Owner: admin_db_sr
--

COPY autor (id, nome) FROM stdin;
\.


--
-- TOC entry 4554 (class 0 OID 0)
-- Dependencies: 425
-- Name: autor_id_seq; Type: SEQUENCE SET; Schema: educacao_biblioteca; Owner: admin_db_sr
--

SELECT pg_catalog.setval('autor_id_seq', 1, false);


--
-- TOC entry 4190 (class 0 OID 25558)
-- Dependencies: 426
-- Data for Name: conteudo; Type: TABLE DATA; Schema: educacao_biblioteca; Owner: admin_db_sr
--

COPY conteudo (id, conteudo) FROM stdin;
\.


--
-- TOC entry 4191 (class 0 OID 25564)
-- Dependencies: 427
-- Data for Name: conteudo_didatica; Type: TABLE DATA; Schema: educacao_biblioteca; Owner: admin_db_sr
--

COPY conteudo_didatica (id, conteudo_id, didatica_id, reservado) FROM stdin;
\.


--
-- TOC entry 4555 (class 0 OID 0)
-- Dependencies: 428
-- Name: conteudo_didatica_id_seq; Type: SEQUENCE SET; Schema: educacao_biblioteca; Owner: admin_db_sr
--

SELECT pg_catalog.setval('conteudo_didatica_id_seq', 1, false);


--
-- TOC entry 4556 (class 0 OID 0)
-- Dependencies: 429
-- Name: conteudo_id_seq; Type: SEQUENCE SET; Schema: educacao_biblioteca; Owner: admin_db_sr
--

SELECT pg_catalog.setval('conteudo_id_seq', 1, false);


--
-- TOC entry 4194 (class 0 OID 25574)
-- Dependencies: 430
-- Data for Name: didatica; Type: TABLE DATA; Schema: educacao_biblioteca; Owner: admin_db_sr
--

COPY didatica (id, reservado) FROM stdin;
\.


--
-- TOC entry 4557 (class 0 OID 0)
-- Dependencies: 431
-- Name: didatica_id_seq; Type: SEQUENCE SET; Schema: educacao_biblioteca; Owner: admin_db_sr
--

SELECT pg_catalog.setval('didatica_id_seq', 1, false);


--
-- TOC entry 4196 (class 0 OID 25582)
-- Dependencies: 432
-- Data for Name: edicao; Type: TABLE DATA; Schema: educacao_biblioteca; Owner: admin_db_sr
--

COPY edicao (id, obra_id, edicao, isbn, ano) FROM stdin;
\.


--
-- TOC entry 4558 (class 0 OID 0)
-- Dependencies: 433
-- Name: edicao_id_seq; Type: SEQUENCE SET; Schema: educacao_biblioteca; Owner: admin_db_sr
--

SELECT pg_catalog.setval('edicao_id_seq', 1, false);


--
-- TOC entry 4198 (class 0 OID 25590)
-- Dependencies: 434
-- Data for Name: emprestimo; Type: TABLE DATA; Schema: educacao_biblioteca; Owner: admin_db_sr
--

COPY emprestimo (id, cidadao_id, exemplar_id, funcionario_id, data_devolucao, data_prevista, data_retirada, situacao) FROM stdin;
\.


--
-- TOC entry 4559 (class 0 OID 0)
-- Dependencies: 435
-- Name: emprestimo_id_seq; Type: SEQUENCE SET; Schema: educacao_biblioteca; Owner: admin_db_sr
--

SELECT pg_catalog.setval('emprestimo_id_seq', 1, false);


--
-- TOC entry 4200 (class 0 OID 25598)
-- Dependencies: 436
-- Data for Name: estante; Type: TABLE DATA; Schema: educacao_biblioteca; Owner: admin_db_sr
--

COPY estante (id, acervo_id, estante) FROM stdin;
\.


--
-- TOC entry 4560 (class 0 OID 0)
-- Dependencies: 437
-- Name: estante_id_seq; Type: SEQUENCE SET; Schema: educacao_biblioteca; Owner: admin_db_sr
--

SELECT pg_catalog.setval('estante_id_seq', 1, false);


--
-- TOC entry 4202 (class 0 OID 25606)
-- Dependencies: 438
-- Data for Name: exemplar; Type: TABLE DATA; Schema: educacao_biblioteca; Owner: admin_db_sr
--

COPY exemplar (id, obra_id, prateleira_id, codigo) FROM stdin;
\.


--
-- TOC entry 4561 (class 0 OID 0)
-- Dependencies: 439
-- Name: exemplar_id_seq; Type: SEQUENCE SET; Schema: educacao_biblioteca; Owner: admin_db_sr
--

SELECT pg_catalog.setval('exemplar_id_seq', 1, false);


--
-- TOC entry 4204 (class 0 OID 25614)
-- Dependencies: 440
-- Data for Name: literaria; Type: TABLE DATA; Schema: educacao_biblioteca; Owner: admin_db_sr
--

COPY literaria (id, resumo) FROM stdin;
\.


--
-- TOC entry 4562 (class 0 OID 0)
-- Dependencies: 441
-- Name: literaria_id_seq; Type: SEQUENCE SET; Schema: educacao_biblioteca; Owner: admin_db_sr
--

SELECT pg_catalog.setval('literaria_id_seq', 1, false);


--
-- TOC entry 4206 (class 0 OID 25622)
-- Dependencies: 442
-- Data for Name: obra; Type: TABLE DATA; Schema: educacao_biblioteca; Owner: admin_db_sr
--

COPY obra (id, editora_id, tipo_obra_id, autor_principal, obra) FROM stdin;
\.


--
-- TOC entry 4207 (class 0 OID 25628)
-- Dependencies: 443
-- Data for Name: obra_autor; Type: TABLE DATA; Schema: educacao_biblioteca; Owner: admin_db_sr
--

COPY obra_autor (id, autor_id, obra_id, reservado) FROM stdin;
\.


--
-- TOC entry 4563 (class 0 OID 0)
-- Dependencies: 444
-- Name: obra_autor_id_seq; Type: SEQUENCE SET; Schema: educacao_biblioteca; Owner: admin_db_sr
--

SELECT pg_catalog.setval('obra_autor_id_seq', 1, false);


--
-- TOC entry 4564 (class 0 OID 0)
-- Dependencies: 445
-- Name: obra_id_seq; Type: SEQUENCE SET; Schema: educacao_biblioteca; Owner: admin_db_sr
--

SELECT pg_catalog.setval('obra_id_seq', 1, false);


--
-- TOC entry 4210 (class 0 OID 25638)
-- Dependencies: 446
-- Data for Name: prateleira; Type: TABLE DATA; Schema: educacao_biblioteca; Owner: admin_db_sr
--

COPY prateleira (id, estante_id, prateleira) FROM stdin;
\.


--
-- TOC entry 4565 (class 0 OID 0)
-- Dependencies: 447
-- Name: prateleira_id_seq; Type: SEQUENCE SET; Schema: educacao_biblioteca; Owner: admin_db_sr
--

SELECT pg_catalog.setval('prateleira_id_seq', 1, false);


--
-- TOC entry 4212 (class 0 OID 25646)
-- Dependencies: 448
-- Data for Name: tipo_obra; Type: TABLE DATA; Schema: educacao_biblioteca; Owner: admin_db_sr
--

COPY tipo_obra (id, tipo_obra) FROM stdin;
\.


--
-- TOC entry 4566 (class 0 OID 0)
-- Dependencies: 449
-- Name: tipo_obra_id_seq; Type: SEQUENCE SET; Schema: educacao_biblioteca; Owner: admin_db_sr
--

SELECT pg_catalog.setval('tipo_obra_id_seq', 1, false);


SET search_path = energia, pg_catalog;

--
-- TOC entry 4214 (class 0 OID 25654)
-- Dependencies: 450
-- Data for Name: classe_unidade; Type: TABLE DATA; Schema: energia; Owner: admin_db_sr
--

COPY classe_unidade (descricao, idclasseunidade, ativo) FROM stdin;
Administrativa                                                                                      	6	S
Praças                                                                                              	7	S
Educação                                                                                            	8	S
Saneamento                                                                                          	9	S
Saúde                                                                                               	13	S
Esporte e lazer                                                                                     	14	S
Promoção Social                                                                                     	18	S
Iluminação Pública                                                                                  	19	S
Segurança Publica                                                                                   	15	S
Serviços em Geral                                                                                   	20	S
Sem Identificação                                                                                   	21	S
\.


--
-- TOC entry 4567 (class 0 OID 0)
-- Dependencies: 451
-- Name: classe_unidade_idclasseunidade_seq; Type: SEQUENCE SET; Schema: energia; Owner: admin_db_sr
--

SELECT pg_catalog.setval('classe_unidade_idclasseunidade_seq', 21, true);


--
-- TOC entry 4216 (class 0 OID 25659)
-- Dependencies: 452
-- Data for Name: conta; Type: TABLE DATA; Schema: energia; Owner: admin_db_sr
--

COPY conta (competencia, taxakwh, consumoativo, outrastaxas, valorfatura, idcontatariva, idunidade, idconta, ativo, idtaxa) FROM stdin;
2015-01-31	0.430655092	271	5.44000006	131.107529	\N	58	28	\N	4
2015-01-31	0.430655092	267	5.01999998	128.96492	\N	59	29	\N	4
2015-01-31	0.430655092	255	9.60999966	128.387054	\N	60	30	\N	4
2015-01-31	0.430655092	4576	137.830002	2117.46777	\N	28	31	\N	4
2015-01-31	0.430655092	1200	37.6100006	563.356079	\N	29	32	\N	4
2015-01-31	0.430655092	1188	37.3499985	557.928223	\N	30	33	\N	4
2015-01-31	0.430655092	433	13.9799995	209.413651	\N	31	34	\N	4
\.


--
-- TOC entry 4568 (class 0 OID 0)
-- Dependencies: 453
-- Name: conta_idconta_seq; Type: SEQUENCE SET; Schema: energia; Owner: admin_db_sr
--

SELECT pg_catalog.setval('conta_idconta_seq', 34, true);


--
-- TOC entry 4218 (class 0 OID 25664)
-- Dependencies: 454
-- Data for Name: contatarifa; Type: TABLE DATA; Schema: energia; Owner: admin_db_sr
--

COPY contatarifa (idcontatarifa, idconta, idtarifa) FROM stdin;
51	28	6
52	0	6
53	29	6
\.


--
-- TOC entry 4569 (class 0 OID 0)
-- Dependencies: 455
-- Name: contatarifa_idcontatarifa_seq; Type: SEQUENCE SET; Schema: energia; Owner: admin_db_sr
--

SELECT pg_catalog.setval('contatarifa_idcontatarifa_seq', 53, true);


--
-- TOC entry 4570 (class 0 OID 0)
-- Dependencies: 456
-- Name: seq_classe_unidade; Type: SEQUENCE SET; Schema: energia; Owner: admin_db_sr
--

SELECT pg_catalog.setval('seq_classe_unidade', 1, false);


--
-- TOC entry 4571 (class 0 OID 0)
-- Dependencies: 457
-- Name: seq_conta; Type: SEQUENCE SET; Schema: energia; Owner: admin_db_sr
--

SELECT pg_catalog.setval('seq_conta', 1, false);


--
-- TOC entry 4572 (class 0 OID 0)
-- Dependencies: 458
-- Name: seq_tarifa; Type: SEQUENCE SET; Schema: energia; Owner: admin_db_sr
--

SELECT pg_catalog.setval('seq_tarifa', 1, false);


--
-- TOC entry 4573 (class 0 OID 0)
-- Dependencies: 459
-- Name: seq_unidade; Type: SEQUENCE SET; Schema: energia; Owner: admin_db_sr
--

SELECT pg_catalog.setval('seq_unidade', 1, false);


--
-- TOC entry 4224 (class 0 OID 25677)
-- Dependencies: 460
-- Data for Name: tarifa; Type: TABLE DATA; Schema: energia; Owner: admin_db_sr
--

COPY tarifa (descricao, valor, idtarifa, ativo) FROM stdin;
CONSUMO REATIVO EXCEDENTE(kVARh)                                                                    	0	5	S
CONTRIBUICAO ILUMINACAO PUBLICA                                                                     	8.9666767	6	S
\.


--
-- TOC entry 4574 (class 0 OID 0)
-- Dependencies: 461
-- Name: tarifa_idtarifa_seq; Type: SEQUENCE SET; Schema: energia; Owner: admin_db_sr
--

SELECT pg_catalog.setval('tarifa_idtarifa_seq', 6, true);


--
-- TOC entry 4226 (class 0 OID 25685)
-- Dependencies: 462
-- Data for Name: taxa; Type: TABLE DATA; Schema: energia; Owner: admin_db_sr
--

COPY taxa (idtaxa, descricao, valor, ativo) FROM stdin;
4	B3 PODER PUBLICO                                                                                    	0.43065509	S
5	B4A ILUMINACAO PUBLICA                                                                              	0.2377676	S
\.


--
-- TOC entry 4575 (class 0 OID 0)
-- Dependencies: 463
-- Name: taxa_idtaxa_seq; Type: SEQUENCE SET; Schema: energia; Owner: admin_db_sr
--

SELECT pg_catalog.setval('taxa_idtaxa_seq', 5, true);


--
-- TOC entry 4228 (class 0 OID 25693)
-- Dependencies: 464
-- Data for Name: unidade; Type: TABLE DATA; Schema: energia; Owner: admin_db_sr
--

COPY unidade (nome, endereco, bairro, area, numcontrato, nummedidor, idunidade, ativo, idclasseunidade) FROM stdin;
DEMUTRAN                                                                                                                                                                                                                                                                                                    	rua 31 de março, 590                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    	Novo São Gonçalo                                                                                                                                                                                        	Urbana                                            	296738018	1419137	4	S	6
CREAS                                                                                                                                                                                                                                                                                                       	Rua Gonçalo Pinheiro, 121                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               	Jardim Lola                                                                                                                                                                                             	Urbana                                            	7000221850	1379732	5	S	18
Secretaria de Administração                                                                                                                                                                                                                                                                                 	Av. Coronel Estevão Moura, 230                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          	Centro                                                                                                                                                                                                  	Urbana                                            	296238015	1402233	3	S	6
PETI Serrinha (Semtasc)                                                                                                                                                                                                                                                                                     	Rua Principal, 9                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        	Serrinha                                                                                                                                                                                                	Rural                                             	7000882512	1650031	7	S	18
Curso Profisionalizante (Semdet)                                                                                                                                                                                                                                                                            	Rua Berilo, 1316                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        	Amarante                                                                                                                                                                                                	Urbana                                            	7001144248	1387953	8	S	20
Secretaria de Infraestrutura                                                                                                                                                                                                                                                                                	Rua Pio XII, 127                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        	Centro                                                                                                                                                                                                  	Urbana                                            	7000629043	1403406	6	S	6
Olaria Futebol Clube (Serviços Urbanos)                                                                                                                                                                                                                                                                     	PC dos Mártires, 20                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	Uruaçu                                                                                                                                                                                                  	Rural                                             	857092821	1417781	9	S	21
Quadra de Pajuçara                                                                                                                                                                                                                                                                                          	Rua Principal, 10 QD                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    	Pajuçara                                                                                                                                                                                                	Rural                                             	855519682	1415323	10	S	14
Telecentro Jardim Petropolis                                                                                                                                                                                                                                                                                	Rua das Grampolas, 10                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   	Jardim Petropolis                                                                                                                                                                                       	Urbana                                            	851870458	1407137	13	S	18
PAIF (Semtasc)                                                                                                                                                                                                                                                                                              	Rua São Marcos, 2449                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    	Padre João Maria                                                                                                                                                                                        	Rural                                             	853410012	1420956	11	S	18
Associação das Mulheres                                                                                                                                                                                                                                                                                     	Rua Vereador Willian Camara de Brito, 133                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               	Santo Antonio do Potengi                                                                                                                                                                                	Urbana                                            	851750983	1400580	14	S	18
Casa Abrigo                                                                                                                                                                                                                                                                                                 	LO Canaa, 85A                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           	Canaa                                                                                                                                                                                                   	Rural                                             	851135953	1409790	15	S	18
Clube de Maes Maria Augusta Barbosa                                                                                                                                                                                                                                                                         	Av. Engenheiro Roberto Freire, 10                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       	Santo Antonio do Potengi                                                                                                                                                                                	Urbana                                            	586600010	1399792	16	S	18
Secretaria de Defesa Social e Guarda Municipal                                                                                                                                                                                                                                                              	Rua Maranhão, 21                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        	Amarante                                                                                                                                                                                                	Urbana                                            	7007869872	1386516	17	S	15
Conselho Comunitário de Poço de Pedra                                                                                                                                                                                                                                                                       	PC Poço de Pedra, 136                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   	Poço de Pedra                                                                                                                                                                                           	Rural                                             	377564014	1415566	18	S	18
Clube Municipal de Massaranduba                                                                                                                                                                                                                                                                             	PC Poço de Pedra, 170                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   	Poço de Pedra                                                                                                                                                                                           	Rural                                             	377501012	1415601	19	S	18
PETI Guajurú (Semtasc)                                                                                                                                                                                                                                                                                      	Rua Padre João Maria, 112                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               	Guajurú                                                                                                                                                                                                 	Rural                                             	375336022	1411513	20	S	18
Centro Convivência e Apoio a Terceira Idade                                                                                                                                                                                                                                                                 	Ru Geraldo Veríssimo, 40                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                	Guanduba                                                                                                                                                                                                	Rural                                             	850750661	1412930	21	S	18
Casa da Cidadania                                                                                                                                                                                                                                                                                           	Av. Coronel Estevão Cesar Moura, 314                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    	Centro                                                                                                                                                                                                  	Urbana                                            	296233013	1402197	22	S	18
Telecentro Centro                                                                                                                                                                                                                                                                                           	Rua Alexandre Cavalcante, 51                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            	Centro                                                                                                                                                                                                  	Urbana                                            	296910015	1402434	23	S	18
Central de Atendimento (Semtasc)                                                                                                                                                                                                                                                                            	Av. Bacharel Tomaz Landim, 1028                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         	Jardim Lola                                                                                                                                                                                             	Urbana                                            	371570012	1380084	24	S	18
Centro de Saúde de Serrinha                                                                                                                                                                                                                                                                                 	Rua Principal, 111                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	Serrinha                                                                                                                                                                                                	Rural                                             	377544013	1422489	32	S	13
UBS Poço de Pedra                                                                                                                                                                                                                                                                                           	Rua Oitava, 167                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         	Poço de Pedra                                                                                                                                                                                           	Rural                                             	377498011	1416119	30	S	13
UBS Igreja Nova                                                                                                                                                                                                                                                                                             	Rua Vereador Maurício Fernandes, 125                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    	Igreja Nova                                                                                                                                                                                             	Rural                                             	377516010	1413419	31	S	13
Centro de Saúde de Santo Antonio                                                                                                                                                                                                                                                                            	Rua Joaquim Rodrigues da Silva, 106                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	Santo Antonio do Potengi                                                                                                                                                                                	Urbana                                            	377478010	1399399	29	S	13
UBS Centro                                                                                                                                                                                                                                                                                                  	Rua Ten Manoel Cavalcanti, 328                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          	Centro                                                                                                                                                                                                  	Urbana                                            	377463013	1402590	28	S	13
UBS Guanduba                                                                                                                                                                                                                                                                                                	Rua Severino Siqueira, 13                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               	Ganduba                                                                                                                                                                                                 	Rural                                             	617483017	1412804	34	S	13
Centro de Saúde Jardim Lola                                                                                                                                                                                                                                                                                 	Rua da Aurora, 01                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       	Jardim Lola                                                                                                                                                                                             	Rural                                             	651941010	1383846	35	S	13
UBS Olho D'agua do Carrilho                                                                                                                                                                                                                                                                                 	-                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       	Olho D'agua do Carrilho                                                                                                                                                                                 	Rural                                             	654625026	1405019	36	S	13
UBS Massaranduba                                                                                                                                                                                                                                                                                            	Rua Maria Tereza de Araujo, 08                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          	Massaranduba                                                                                                                                                                                            	Rural                                             	850452377	1413987	37	S	13
UBS Jardim Petrópolis                                                                                                                                                                                                                                                                                       	Rua das Grampolas, 10                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   	Jardim Petrópolis                                                                                                                                                                                       	Urbana                                            	850905070	1407133	38	S	13
UBS Bela Vista                                                                                                                                                                                                                                                                                              	Rua Vereador Geraldo Monteiro, 01                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       	Bela Vista                                                                                                                                                                                              	Rural                                             	852232790	1408309	41	S	13
PETI Serrinha de Cima                                                                                                                                                                                                                                                                                       	Av Principal, 87                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        	Serrinha de Cima                                                                                                                                                                                        	Rural                                             	7007849022	1422443	43	S	18
Sem identificação                                                                                                                                                                                                                                                                                           	Av Flores do Campo, 37                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  	Jardins                                                                                                                                                                                                 	Urbana                                            	7007377147	2430812	44	S	21
UBS Regomoleiro                                                                                                                                                                                                                                                                                             	Rua Parnamirim, 50                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	Regomoleiro                                                                                                                                                                                             	Urbana                                            	852026642	1405679	40	S	13
CAPS                                                                                                                                                                                                                                                                                                        	Av. Hildebrando Ribeiro da Silva, 225                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   	Santo Antonio do Potengi                                                                                                                                                                                	Urbana                                            	851682848	1399262	39	S	13
UBS Jacare Mirim                                                                                                                                                                                                                                                                                            	Rua de Baixo, 98                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        	Jacare Mirim                                                                                                                                                                                            	Rural                                             	7007348139	2429305	46	S	13
Sem identificação                                                                                                                                                                                                                                                                                           	Rua Sady Dantas Armstrong                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               	Jardins                                                                                                                                                                                                 	Urbana                                            	7005169075	2296658	47	\N	\N
Secretaria de Assistencia Social                                                                                                                                                                                                                                                                            	Rua Olinto Jose Rodrigues, 1413                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         	Centro                                                                                                                                                                                                  	Urbana                                            	853409952	1404155	12	S	6
Bolsa Família                                                                                                                                                                                                                                                                                               	Rua Olinto José Rodrigues, 1414                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         	Centro                                                                                                                                                                                                  	Urbana                                            	296988014	1404154	25	S	18
Conselho Tutelar                                                                                                                                                                                                                                                                                            	Rua Prefeito Poty Cavalcante, 64                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        	Centro                                                                                                                                                                                                  	Urbana                                            	853371122	1402157	26	S	18
UBS                                                                                                                                                                                                                                                                                                         	Rua Osvaldo Cruz, 25                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    	Amarante                                                                                                                                                                                                	Urbana                                            	7007355488	2429690	45	S	13
UBS Mangueirão                                                                                                                                                                                                                                                                                              	Rua Lirios do Vale, 32A                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 	Jardim Lola                                                                                                                                                                                             	Urbana                                            	856377850	1382829	42	S	13
Centro de Saúde do Amarante                                                                                                                                                                                                                                                                                 	Rua Maranhão, 2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         	Amarante                                                                                                                                                                                                	Urbana                                            	594656016	1386515	33	S	13
UBS Novo Amarante II                                                                                                                                                                                                                                                                                        	Rua Bacharel Raimundo Mendes, 547                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       	Novo Amarante                                                                                                                                                                                           	Urbana                                            	7003554893	2204536	48	S	13
SAMU                                                                                                                                                                                                                                                                                                        	Av. Engenheiro Roberto Freire, 1000A                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    	Loteamento Canaa                                                                                                                                                                                        	Rural                                             	7003413912	1409867	49	S	13
UBS Novo Amarante I                                                                                                                                                                                                                                                                                         	Rua Bela Vista, 979                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	Golandim                                                                                                                                                                                                	Urbana                                            	7001143896	1396018	50	S	13
UBS Rio da Prata                                                                                                                                                                                                                                                                                            	PO Rio da Prata, 2 G1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   	Rio da Prata                                                                                                                                                                                            	Rural                                             	7000928490	2038687	51	S	13
UBS Loteamento                                                                                                                                                                                                                                                                                              	Rua Nossa Senhora de Fátima, 499                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        	Santa Terezinha                                                                                                                                                                                         	Rural                                             	7000904613	1420557	52	S	13
UBS Barro Duro                                                                                                                                                                                                                                                                                              	Av. Vereador Edson Coelho da Silva, 480                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 	Barro Duro                                                                                                                                                                                              	Rural                                             	7000782569	2062250	53	S	13
UBS Humaitá                                                                                                                                                                                                                                                                                                 	Rua Treze de Maio, 339 Apt 209                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          	Jardim Lola                                                                                                                                                                                             	Urbana                                            	7000496515	1379874	54	S	21
Endemias                                                                                                                                                                                                                                                                                                    	Rua Prefeito Poty Cavalcante, 04                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        	Centro                                                                                                                                                                                                  	Urbana                                            	8567745716	1402168	55	S	13
UBS Uruaçu                                                                                                                                                                                                                                                                                                  	PC dos Martires, 161                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    	Uruaçu                                                                                                                                                                                                  	Rural                                             	344246017	1417825	56	S	13
UBS Golandim II                                                                                                                                                                                                                                                                                             	Rua Nossa Senhora da Penha, 20                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          	Novo Amarante                                                                                                                                                                                           	Urbana                                            	375579014	1391038	57	S	13
Garagem Municipal                                                                                                                                                                                                                                                                                           	Rua Trinta e Um de Março, 551                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           	Centro                                                                                                                                                                                                  	Urbana                                            	377569016	1402962	58	S	6
CRAS Padre João Maria                                                                                                                                                                                                                                                                                       	Rua das Artes, 1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        	Padre João Maria                                                                                                                                                                                        	Rural                                             	851789413	1421122	59	S	18
Sem identificação                                                                                                                                                                                                                                                                                           	Rua Jardim Leblom, 39                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   	Goladim                                                                                                                                                                                                 	Urbana                                            	7006352841	1397232	60	S	21
\.


--
-- TOC entry 4576 (class 0 OID 0)
-- Dependencies: 465
-- Name: unidade_idunidade_seq; Type: SEQUENCE SET; Schema: energia; Owner: admin_db_sr
--

SELECT pg_catalog.setval('unidade_idunidade_seq', 60, true);


SET search_path = login, pg_catalog;

--
-- TOC entry 4230 (class 0 OID 25701)
-- Dependencies: 466
-- Data for Name: grupo; Type: TABLE DATA; Schema: login; Owner: admin_db_sr
--

COPY grupo (id, descricao, nome, master) FROM stdin;
5	Secretaria	Secretaria	t
8	Diretorias	Diretoria	t
1	Master	Master	t
2	Professor	Professor	f
6	Aluno	Aluno	f
18	teste	teste	f
19	adm	adm	f
21	asvxc	admin 2	f
\.


--
-- TOC entry 4577 (class 0 OID 0)
-- Dependencies: 467
-- Name: grupo_id_seq; Type: SEQUENCE SET; Schema: login; Owner: admin_db_sr
--

SELECT pg_catalog.setval('grupo_id_seq', 21, true);


--
-- TOC entry 4232 (class 0 OID 25709)
-- Dependencies: 468
-- Data for Name: grupo_usuario; Type: TABLE DATA; Schema: login; Owner: admin_db_sr
--

COPY grupo_usuario (id, grupo_id, usuario_id) FROM stdin;
8	1	4
9	1	5
11	5	6
12	6	6
13	1	8
14	2	8
15	1	9
22	1	13
23	2	13
25	1	14
27	6	14
31	1	16
32	2	16
34	2	17
35	1	7
36	1	7
37	1	7
38	1	7
39	1	7
40	1	7
41	1	2
42	2	2
43	1	2
44	2	2
45	1	7
46	1	2
47	2	2
48	1	2
49	2	2
50	1	2
51	2	2
52	1	2
53	2	2
54	1	2
55	2	2
56	1	7
57	1	7
58	1	2
59	2	2
70	1	2
71	2	2
72	1	2
73	2	2
74	1	2
75	2	2
76	1	2
77	2	2
78	5	18
79	1	19
82	1	21
83	1	21
84	1	22
85	1	23
86	1	24
87	1	16
88	2	16
91	1	25
92	1	26
94	2	27
95	5	11
96	1	28
\.


--
-- TOC entry 4578 (class 0 OID 0)
-- Dependencies: 469
-- Name: grupo_usuario_id_seq; Type: SEQUENCE SET; Schema: login; Owner: admin_db_sr
--

SELECT pg_catalog.setval('grupo_usuario_id_seq', 95, true);


--
-- TOC entry 4234 (class 0 OID 25714)
-- Dependencies: 470
-- Data for Name: permissao; Type: TABLE DATA; Schema: login; Owner: admin_db_sr
--

COPY permissao (id, esquema, grupo_id, permissao, tabela) FROM stdin;
396	EDUCACAO_ACADEMICO	19	2	SALA
398	LOGIN	19	2	USUARIO
399	CADASTRO_UNICO_PESSOAL	19	2	FUNCIONARIO
400	CADASTRO_UNICO_PESSOAL	19	2	PROFESSOR
401	CADASTRO_UNICO_PESSOAL	19	2	ALUNO
371	EDUCACAO_ACADEMICO	19	2	HORARIO
373	EDUCACAO_ACADEMICO	19	2	MATRICULA
375	EDUCACAO_ACADEMICO	19	2	SERIE
376	EDUCACAO_ACADEMICO	19	2	TURMA
377	EDUCACAO_ACADEMICO	19	2	DISCIPLINA
378	LOGIN	19	2	GRUPO
372	CADASTRO_UNICO_PESSOAL	19	2	ESCOLA
402	LOGIN	1	2	USUARIO
403	EDUCACAO_ACADEMICO	1	2	HORARIO
404	CADASTRO_UNICO_PESSOAL	1	2	ESCOLA
406	CADASTRO_UNICO_PESSOAL	1	2	FUNCIONARIO
408	EDUCACAO_ACADEMICO	1	2	TURMA
410	LOGIN	1	2	GRUPO
412	EDUCACAO_ACADEMICO	1	2	SALA
414	EDUCACAO_ACADEMICO	1	2	ATIVIDADE
415	EDUCACAO_ACADEMICO	1	2	NOTA
413	CADASTRO_UNICO_PESSOAL	1	2	PROFESSOR
411	CADASTRO_UNICO_PESSOAL	1	2	ALUNO
409	EDUCACAO_ACADEMICO	1	2	DISCIPLINA
407	EDUCACAO_ACADEMICO	1	2	SERIE
405	EDUCACAO_ACADEMICO	1	2	MATRICULA
416	EDUCACAO_ACADEMICO	5	2	HORARIO
417	EDUCACAO_ACADEMICO	5	2	NOTA
418	CADASTRO_UNICO_PESSOAL	5	1	ESCOLA
419	EDUCACAO_ACADEMICO	5	2	MATRICULA
420	CADASTRO_UNICO_PESSOAL	5	1	FUNCIONARIO
421	EDUCACAO_ACADEMICO	5	2	ATIVIDADE
422	EDUCACAO_ACADEMICO	5	2	TURMA
423	EDUCACAO_ACADEMICO	5	2	SERIE
424	EDUCACAO_ACADEMICO	5	2	DISCIPLINA
425	CADASTRO_UNICO_PESSOAL	5	2	ALUNO
426	EDUCACAO_ACADEMICO	5	2	SALA
427	CADASTRO_UNICO_PESSOAL	5	1	PROFESSOR
428	EDUCACAO_ACADEMICO	2	2	NOTA
429	EDUCACAO_ACADEMICO	2	2	ATIVIDADE
\.


--
-- TOC entry 4579 (class 0 OID 0)
-- Dependencies: 471
-- Name: permissao_id_seq; Type: SEQUENCE SET; Schema: login; Owner: admin_db_sr
--

SELECT pg_catalog.setval('permissao_id_seq', 429, true);


--
-- TOC entry 4236 (class 0 OID 25722)
-- Dependencies: 472
-- Data for Name: usuario; Type: TABLE DATA; Schema: login; Owner: admin_db_sr
--

COPY usuario (id, senha, username, pessoa_id) FROM stdin;
4	202cb962ac59075b964b07152d234b70	marcio	2298
5	202cb962ac59075b964b07152d234b70	rafael	2335
6	aa1bf4646de67fd9086cf6c79007026c	julio	2309
8	202cb962ac59075b964b07152d234b70	algusto	2335
9	698dc19d489c4e4db73e28a713eab07b	maria	2299
11	202cb962ac59075b964b07152d234b70	chico	2093
13	202cb962ac59075b964b07152d234b70	123	2055
14	4829322d03d1606fb09ae9af59a271d3	eu	2126
16	202cb962ac59075b964b07152d234b70	jose	2335
17	202cb962ac59075b964b07152d234b70	jose.oliveira	2097
7	c8837b23ff8aaa8a2dde915473ce0991	manaia.junior	2381
2	202cb962ac59075b964b07152d234b70	pedro	2058
18	202cb962ac59075b964b07152d234b70	erineide.melo	2115
19	f2dcc81c0196924768ec9abfe06a0d00	Manaia Jr	2400
21	202cb962ac59075b964b07152d234b70	franklin	2126
22	202cb962ac59075b964b07152d234b70	domjoaquim	2306
23	202cb962ac59075b964b07152d234b70	cantinhodosaber	2059
24	202cb962ac59075b964b07152d234b70	vicente	2247
25	202cb962ac59075b964b07152d234b70	professor	2117
26	202cb962ac59075b964b07152d234b70	atividade	2061
27	202cb962ac59075b964b07152d234b70	atv	2102
28	202cb962ac59075b964b07152d234b70	master	2936
\.


--
-- TOC entry 4580 (class 0 OID 0)
-- Dependencies: 473
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: login; Owner: admin_db_sr
--

SELECT pg_catalog.setval('usuario_id_seq', 27, true);


SET search_path = public, pg_catalog;

--
-- TOC entry 4581 (class 0 OID 0)
-- Dependencies: 474
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: admin_db_sr
--

SELECT pg_catalog.setval('hibernate_sequence', 44, true);


--
-- TOC entry 4239 (class 0 OID 25732)
-- Dependencies: 475
-- Data for Name: layout; Type: TABLE DATA; Schema: public; Owner: admin_db_sr
--

COPY layout (id, version) FROM stdin;
\.


--
-- TOC entry 4240 (class 0 OID 25735)
-- Dependencies: 476
-- Data for Name: nota_aluno; Type: TABLE DATA; Schema: public; Owner: admin_db_sr
--

COPY nota_aluno (nota_aluno_id_id, aluno_id) FROM stdin;
\.


--
-- TOC entry 4241 (class 0 OID 25738)
-- Dependencies: 477
-- Data for Name: nota_disciplina_lecionada_por_professor; Type: TABLE DATA; Schema: public; Owner: admin_db_sr
--

COPY nota_disciplina_lecionada_por_professor (nota_disciplina_lecionada_por_professor_id_id, disciplina_lecionada_por_professor_id) FROM stdin;
\.


--
-- TOC entry 4242 (class 0 OID 25741)
-- Dependencies: 478
-- Data for Name: nota_turma; Type: TABLE DATA; Schema: public; Owner: admin_db_sr
--

COPY nota_turma (nota_turma_id_id, turma_id) FROM stdin;
\.


--
-- TOC entry 4243 (class 0 OID 25744)
-- Dependencies: 479
-- Data for Name: sequence_definition; Type: TABLE DATA; Schema: public; Owner: admin_db_sr
--

COPY sequence_definition (id, version, format, name, tenant_id) FROM stdin;
\.


--
-- TOC entry 4244 (class 0 OID 25747)
-- Dependencies: 480
-- Data for Name: sequence_number; Type: TABLE DATA; Schema: public; Owner: admin_db_sr
--

COPY sequence_number (id, version, definition_id, sequence_group, number) FROM stdin;
\.


--
-- TOC entry 4245 (class 0 OID 25750)
-- Dependencies: 481
-- Data for Name: tabela; Type: TABLE DATA; Schema: public; Owner: admin_db_sr
--

COPY tabela (id, version, permissao, schema, tabela, schema_name) FROM stdin;
\.


SET search_path = saude_procedimento, pg_catalog;

--
-- TOC entry 4246 (class 0 OID 25756)
-- Dependencies: 482
-- Data for Name: cbo; Type: TABLE DATA; Schema: saude_procedimento; Owner: admin_db_sr
--

COPY cbo (id, cbo, nome) FROM stdin;
\.


--
-- TOC entry 4582 (class 0 OID 0)
-- Dependencies: 483
-- Name: cbo_id_seq; Type: SEQUENCE SET; Schema: saude_procedimento; Owner: admin_db_sr
--

SELECT pg_catalog.setval('cbo_id_seq', 1, false);


--
-- TOC entry 4248 (class 0 OID 25764)
-- Dependencies: 484
-- Data for Name: cbo_numero_procedimento; Type: TABLE DATA; Schema: saude_procedimento; Owner: admin_db_sr
--

COPY cbo_numero_procedimento (id, cbo_id, numero_procedimento_id, reservado) FROM stdin;
\.


--
-- TOC entry 4583 (class 0 OID 0)
-- Dependencies: 485
-- Name: cbo_numero_procedimento_id_seq; Type: SEQUENCE SET; Schema: saude_procedimento; Owner: admin_db_sr
--

SELECT pg_catalog.setval('cbo_numero_procedimento_id_seq', 1, false);


--
-- TOC entry 4250 (class 0 OID 25772)
-- Dependencies: 486
-- Data for Name: executor; Type: TABLE DATA; Schema: saude_procedimento; Owner: admin_db_sr
--

COPY executor (id, funcionario_id, procedimento_id, situacao) FROM stdin;
\.


--
-- TOC entry 4584 (class 0 OID 0)
-- Dependencies: 487
-- Name: executor_id_seq; Type: SEQUENCE SET; Schema: saude_procedimento; Owner: admin_db_sr
--

SELECT pg_catalog.setval('executor_id_seq', 1, false);


--
-- TOC entry 4252 (class 0 OID 25780)
-- Dependencies: 488
-- Data for Name: forma_de_organizacao; Type: TABLE DATA; Schema: saude_procedimento; Owner: admin_db_sr
--

COPY forma_de_organizacao (id, sub_grupo_id, codigo, nome) FROM stdin;
\.


--
-- TOC entry 4585 (class 0 OID 0)
-- Dependencies: 489
-- Name: forma_de_organizacao_id_seq; Type: SEQUENCE SET; Schema: saude_procedimento; Owner: admin_db_sr
--

SELECT pg_catalog.setval('forma_de_organizacao_id_seq', 1, false);


--
-- TOC entry 4254 (class 0 OID 25788)
-- Dependencies: 490
-- Data for Name: grupo; Type: TABLE DATA; Schema: saude_procedimento; Owner: admin_db_sr
--

COPY grupo (id, codigo, nome) FROM stdin;
\.


--
-- TOC entry 4586 (class 0 OID 0)
-- Dependencies: 491
-- Name: grupo_id_seq; Type: SEQUENCE SET; Schema: saude_procedimento; Owner: admin_db_sr
--

SELECT pg_catalog.setval('grupo_id_seq', 1, false);


--
-- TOC entry 4256 (class 0 OID 25796)
-- Dependencies: 492
-- Data for Name: lugar; Type: TABLE DATA; Schema: saude_procedimento; Owner: admin_db_sr
--

COPY lugar (id, lugar) FROM stdin;
\.


--
-- TOC entry 4587 (class 0 OID 0)
-- Dependencies: 493
-- Name: lugar_id_seq; Type: SEQUENCE SET; Schema: saude_procedimento; Owner: admin_db_sr
--

SELECT pg_catalog.setval('lugar_id_seq', 1, false);


--
-- TOC entry 4258 (class 0 OID 25801)
-- Dependencies: 494
-- Data for Name: material_procedimento; Type: TABLE DATA; Schema: saude_procedimento; Owner: admin_db_sr
--

COPY material_procedimento (id, material_id, procedimento_id, reservado) FROM stdin;
\.


--
-- TOC entry 4588 (class 0 OID 0)
-- Dependencies: 495
-- Name: material_procedimento_id_seq; Type: SEQUENCE SET; Schema: saude_procedimento; Owner: admin_db_sr
--

SELECT pg_catalog.setval('material_procedimento_id_seq', 1, false);


--
-- TOC entry 4260 (class 0 OID 25809)
-- Dependencies: 496
-- Data for Name: numero_procedimento; Type: TABLE DATA; Schema: saude_procedimento; Owner: admin_db_sr
--

COPY numero_procedimento (id, forma_de_organizacao_id, codigo, nome) FROM stdin;
\.


--
-- TOC entry 4589 (class 0 OID 0)
-- Dependencies: 497
-- Name: numero_procedimento_id_seq; Type: SEQUENCE SET; Schema: saude_procedimento; Owner: admin_db_sr
--

SELECT pg_catalog.setval('numero_procedimento_id_seq', 1, false);


--
-- TOC entry 4262 (class 0 OID 25817)
-- Dependencies: 498
-- Data for Name: procedimento; Type: TABLE DATA; Schema: saude_procedimento; Owner: admin_db_sr
--

COPY procedimento (id, numero_procedimento_id, procedimento_id, tipo_procedimento_id, data_de_marcacao, data_do_procedimento, descricao, status, lugar_id) FROM stdin;
\.


--
-- TOC entry 4590 (class 0 OID 0)
-- Dependencies: 499
-- Name: procedimento_id_seq; Type: SEQUENCE SET; Schema: saude_procedimento; Owner: admin_db_sr
--

SELECT pg_catalog.setval('procedimento_id_seq', 1, false);


--
-- TOC entry 4264 (class 0 OID 25825)
-- Dependencies: 500
-- Data for Name: procedimento_paciente; Type: TABLE DATA; Schema: saude_procedimento; Owner: admin_db_sr
--

COPY procedimento_paciente (id, paciente_id, procedimento_id, reservado) FROM stdin;
\.


--
-- TOC entry 4591 (class 0 OID 0)
-- Dependencies: 501
-- Name: procedimento_paciente_id_seq; Type: SEQUENCE SET; Schema: saude_procedimento; Owner: admin_db_sr
--

SELECT pg_catalog.setval('procedimento_paciente_id_seq', 1, false);


--
-- TOC entry 4266 (class 0 OID 25833)
-- Dependencies: 502
-- Data for Name: sub_grupo; Type: TABLE DATA; Schema: saude_procedimento; Owner: admin_db_sr
--

COPY sub_grupo (id, grupo_id, codigo, nome) FROM stdin;
\.


--
-- TOC entry 4592 (class 0 OID 0)
-- Dependencies: 503
-- Name: sub_grupo_id_seq; Type: SEQUENCE SET; Schema: saude_procedimento; Owner: admin_db_sr
--

SELECT pg_catalog.setval('sub_grupo_id_seq', 1, false);


--
-- TOC entry 4268 (class 0 OID 25841)
-- Dependencies: 504
-- Data for Name: tipo_procedimento; Type: TABLE DATA; Schema: saude_procedimento; Owner: admin_db_sr
--

COPY tipo_procedimento (id, tipo_procedimento) FROM stdin;
\.


--
-- TOC entry 4593 (class 0 OID 0)
-- Dependencies: 505
-- Name: tipo_procedimento_id_seq; Type: SEQUENCE SET; Schema: saude_procedimento; Owner: admin_db_sr
--

SELECT pg_catalog.setval('tipo_procedimento_id_seq', 1, false);


SET search_path = administracao_organizacao, pg_catalog;

--
-- TOC entry 3053 (class 2606 OID 25995)
-- Name: assessoria_id_key; Type: CONSTRAINT; Schema: administracao_organizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY assessoria
    ADD CONSTRAINT assessoria_id_key UNIQUE (id);


--
-- TOC entry 3055 (class 2606 OID 25997)
-- Name: assessoria_pkey; Type: CONSTRAINT; Schema: administracao_organizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY assessoria
    ADD CONSTRAINT assessoria_pkey PRIMARY KEY (id);


--
-- TOC entry 3057 (class 2606 OID 25999)
-- Name: cargo_id_key; Type: CONSTRAINT; Schema: administracao_organizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY cargo
    ADD CONSTRAINT cargo_id_key UNIQUE (id);


--
-- TOC entry 3059 (class 2606 OID 26001)
-- Name: cargo_pkey; Type: CONSTRAINT; Schema: administracao_organizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY cargo
    ADD CONSTRAINT cargo_pkey PRIMARY KEY (id);


--
-- TOC entry 3061 (class 2606 OID 26003)
-- Name: celula_id_key; Type: CONSTRAINT; Schema: administracao_organizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY celula
    ADD CONSTRAINT celula_id_key UNIQUE (id);


--
-- TOC entry 3063 (class 2606 OID 26005)
-- Name: celula_pkey; Type: CONSTRAINT; Schema: administracao_organizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY celula
    ADD CONSTRAINT celula_pkey PRIMARY KEY (id);


--
-- TOC entry 3065 (class 2606 OID 26009)
-- Name: lotacao_pkey; Type: CONSTRAINT; Schema: administracao_organizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY lotacao
    ADD CONSTRAINT lotacao_pkey PRIMARY KEY (id);


--
-- TOC entry 3067 (class 2606 OID 26011)
-- Name: organismo_id_key; Type: CONSTRAINT; Schema: administracao_organizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY organismo
    ADD CONSTRAINT organismo_id_key UNIQUE (id);


--
-- TOC entry 3069 (class 2606 OID 26013)
-- Name: organismo_pkey; Type: CONSTRAINT; Schema: administracao_organizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY organismo
    ADD CONSTRAINT organismo_pkey PRIMARY KEY (id);


SET search_path = administracao_registro, pg_catalog;

--
-- TOC entry 3648 (class 2606 OID 30688)
-- Name: pk_id; Type: CONSTRAINT; Schema: administracao_registro; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY log
    ADD CONSTRAINT pk_id PRIMARY KEY (id);


SET search_path = cadastro_unico_almoxarifado, pg_catalog;

--
-- TOC entry 3071 (class 2606 OID 26015)
-- Name: almoxarifado_id_key; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY almoxarifado
    ADD CONSTRAINT almoxarifado_id_key UNIQUE (id);


--
-- TOC entry 3075 (class 2606 OID 26017)
-- Name: almoxarifado_lote_id_key; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY almoxarifado_lote
    ADD CONSTRAINT almoxarifado_lote_id_key UNIQUE (id);


--
-- TOC entry 3077 (class 2606 OID 26019)
-- Name: almoxarifado_lote_pkey; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY almoxarifado_lote
    ADD CONSTRAINT almoxarifado_lote_pkey PRIMARY KEY (id);


--
-- TOC entry 3073 (class 2606 OID 26021)
-- Name: almoxarifado_pkey; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY almoxarifado
    ADD CONSTRAINT almoxarifado_pkey PRIMARY KEY (id);


--
-- TOC entry 3079 (class 2606 OID 26023)
-- Name: composicao_id_key; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY composicao
    ADD CONSTRAINT composicao_id_key UNIQUE (id);


--
-- TOC entry 3081 (class 2606 OID 26025)
-- Name: composicao_pkey; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY composicao
    ADD CONSTRAINT composicao_pkey PRIMARY KEY (id);


--
-- TOC entry 3085 (class 2606 OID 26027)
-- Name: forma_farmaceutica_medicamento_pkey; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY forma_farmaceutica_medicamento
    ADD CONSTRAINT forma_farmaceutica_medicamento_pkey PRIMARY KEY (id);


--
-- TOC entry 3083 (class 2606 OID 26029)
-- Name: forma_farmaceutica_pkey; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY forma_farmaceutica
    ADD CONSTRAINT forma_farmaceutica_pkey PRIMARY KEY (id);


--
-- TOC entry 3087 (class 2606 OID 26031)
-- Name: foto_medicamento_id_key; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY foto_material
    ADD CONSTRAINT foto_medicamento_id_key UNIQUE (id);


--
-- TOC entry 3089 (class 2606 OID 26033)
-- Name: foto_medicamento_pkey; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY foto_material
    ADD CONSTRAINT foto_medicamento_pkey PRIMARY KEY (id);


--
-- TOC entry 3091 (class 2606 OID 26035)
-- Name: lote_material_id_key; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY lote_material
    ADD CONSTRAINT lote_material_id_key UNIQUE (id);


--
-- TOC entry 3093 (class 2606 OID 26037)
-- Name: lote_material_pkey; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY lote_material
    ADD CONSTRAINT lote_material_pkey PRIMARY KEY (id);


--
-- TOC entry 3095 (class 2606 OID 26039)
-- Name: lote_medicamento_pkey; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY lote_medicamento
    ADD CONSTRAINT lote_medicamento_pkey PRIMARY KEY (id);


--
-- TOC entry 3097 (class 2606 OID 26041)
-- Name: material_id_key; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY material
    ADD CONSTRAINT material_id_key UNIQUE (id);


--
-- TOC entry 3099 (class 2606 OID 26043)
-- Name: material_pkey; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY material
    ADD CONSTRAINT material_pkey PRIMARY KEY (id);


--
-- TOC entry 3101 (class 2606 OID 26045)
-- Name: medicamento_id_key; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY medicamento
    ADD CONSTRAINT medicamento_id_key UNIQUE (id);


--
-- TOC entry 3103 (class 2606 OID 26047)
-- Name: medicamento_pkey; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY medicamento
    ADD CONSTRAINT medicamento_pkey PRIMARY KEY (id);


--
-- TOC entry 3105 (class 2606 OID 26049)
-- Name: principio_ativo_id_key; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY principio_ativo
    ADD CONSTRAINT principio_ativo_id_key UNIQUE (id);


--
-- TOC entry 3109 (class 2606 OID 26051)
-- Name: principio_ativo_medicamento_pkey; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY principio_ativo_medicamento
    ADD CONSTRAINT principio_ativo_medicamento_pkey PRIMARY KEY (id);


--
-- TOC entry 3107 (class 2606 OID 26053)
-- Name: principio_ativo_pkey; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY principio_ativo
    ADD CONSTRAINT principio_ativo_pkey PRIMARY KEY (id);


--
-- TOC entry 3111 (class 2606 OID 26055)
-- Name: remessa_id_key; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY remessa
    ADD CONSTRAINT remessa_id_key UNIQUE (id);


--
-- TOC entry 3115 (class 2606 OID 26057)
-- Name: remessa_medicamento_pkey; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY remessa_medicamento
    ADD CONSTRAINT remessa_medicamento_pkey PRIMARY KEY (id);


--
-- TOC entry 3113 (class 2606 OID 26059)
-- Name: remessa_pkey; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY remessa
    ADD CONSTRAINT remessa_pkey PRIMARY KEY (id);


--
-- TOC entry 3117 (class 2606 OID 26061)
-- Name: substancia_id_key; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY substancia
    ADD CONSTRAINT substancia_id_key UNIQUE (id);


--
-- TOC entry 3119 (class 2606 OID 26063)
-- Name: substancia_pkey; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY substancia
    ADD CONSTRAINT substancia_pkey PRIMARY KEY (id);


--
-- TOC entry 3121 (class 2606 OID 26065)
-- Name: tipo_material_id_key; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY tipo_material
    ADD CONSTRAINT tipo_material_id_key UNIQUE (id);


--
-- TOC entry 3123 (class 2606 OID 26067)
-- Name: tipo_material_pkey; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY tipo_material
    ADD CONSTRAINT tipo_material_pkey PRIMARY KEY (id);


--
-- TOC entry 3125 (class 2606 OID 26069)
-- Name: tipo_principio_ativo_id_key; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY tipo_principio_ativo
    ADD CONSTRAINT tipo_principio_ativo_id_key UNIQUE (id);


--
-- TOC entry 3127 (class 2606 OID 26071)
-- Name: tipo_principio_ativo_pkey; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY tipo_principio_ativo
    ADD CONSTRAINT tipo_principio_ativo_pkey PRIMARY KEY (id);


--
-- TOC entry 3129 (class 2606 OID 26073)
-- Name: unidade_de_saude_pkey; Type: CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY unidade_de_saude
    ADD CONSTRAINT unidade_de_saude_pkey PRIMARY KEY (id);


SET search_path = cadastro_unico_atendimento, pg_catalog;

--
-- TOC entry 3131 (class 2606 OID 26075)
-- Name: atendimento_id_key; Type: CONSTRAINT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY atendimento
    ADD CONSTRAINT atendimento_id_key UNIQUE (id);


--
-- TOC entry 3133 (class 2606 OID 26077)
-- Name: atendimento_pkey; Type: CONSTRAINT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY atendimento
    ADD CONSTRAINT atendimento_pkey PRIMARY KEY (id);


--
-- TOC entry 3135 (class 2606 OID 26079)
-- Name: balcao_id_key; Type: CONSTRAINT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY balcao
    ADD CONSTRAINT balcao_id_key UNIQUE (id);


--
-- TOC entry 3137 (class 2606 OID 26081)
-- Name: balcao_pkey; Type: CONSTRAINT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY balcao
    ADD CONSTRAINT balcao_pkey PRIMARY KEY (id);


--
-- TOC entry 3139 (class 2606 OID 26083)
-- Name: fila_id_key; Type: CONSTRAINT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY fila
    ADD CONSTRAINT fila_id_key UNIQUE (id);


--
-- TOC entry 3141 (class 2606 OID 26085)
-- Name: fila_pkey; Type: CONSTRAINT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY fila
    ADD CONSTRAINT fila_pkey PRIMARY KEY (id);


--
-- TOC entry 3143 (class 2606 OID 26087)
-- Name: lotacao_balconista_id_key; Type: CONSTRAINT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY lotacao_balconista
    ADD CONSTRAINT lotacao_balconista_id_key UNIQUE (id);


--
-- TOC entry 3145 (class 2606 OID 26089)
-- Name: lotacao_balconista_pkey; Type: CONSTRAINT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY lotacao_balconista
    ADD CONSTRAINT lotacao_balconista_pkey PRIMARY KEY (id);


--
-- TOC entry 3147 (class 2606 OID 26091)
-- Name: lotacao_gerente_id_key; Type: CONSTRAINT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY lotacao_gerente
    ADD CONSTRAINT lotacao_gerente_id_key UNIQUE (id);


--
-- TOC entry 3149 (class 2606 OID 26093)
-- Name: lotacao_gerente_pkey; Type: CONSTRAINT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY lotacao_gerente
    ADD CONSTRAINT lotacao_gerente_pkey PRIMARY KEY (id);


--
-- TOC entry 3151 (class 2606 OID 26095)
-- Name: ticket_id_key; Type: CONSTRAINT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY ticket
    ADD CONSTRAINT ticket_id_key UNIQUE (id);


--
-- TOC entry 3153 (class 2606 OID 26097)
-- Name: ticket_pkey; Type: CONSTRAINT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY ticket
    ADD CONSTRAINT ticket_pkey PRIMARY KEY (id);


--
-- TOC entry 3155 (class 2606 OID 26099)
-- Name: tipo_ticket_id_key; Type: CONSTRAINT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY tipo_ticket
    ADD CONSTRAINT tipo_ticket_id_key UNIQUE (id);


--
-- TOC entry 3157 (class 2606 OID 26101)
-- Name: tipo_ticket_pkey; Type: CONSTRAINT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY tipo_ticket
    ADD CONSTRAINT tipo_ticket_pkey PRIMARY KEY (id);


SET search_path = cadastro_unico_infraestrutura_basica, pg_catalog;

--
-- TOC entry 3159 (class 2606 OID 26103)
-- Name: arborizacao_id_key; Type: CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY arborizacao
    ADD CONSTRAINT arborizacao_id_key UNIQUE (id);


--
-- TOC entry 3161 (class 2606 OID 26105)
-- Name: arborizacao_pkey; Type: CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY arborizacao
    ADD CONSTRAINT arborizacao_pkey PRIMARY KEY (id);


--
-- TOC entry 3163 (class 2606 OID 26107)
-- Name: coleta_de_lixo_id_key; Type: CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY coleta_de_lixo
    ADD CONSTRAINT coleta_de_lixo_id_key UNIQUE (id);


--
-- TOC entry 3165 (class 2606 OID 26109)
-- Name: coleta_de_lixo_pkey; Type: CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY coleta_de_lixo
    ADD CONSTRAINT coleta_de_lixo_pkey PRIMARY KEY (id);


--
-- TOC entry 3167 (class 2606 OID 26111)
-- Name: galeria_pluvial_id_key; Type: CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY galeria_pluvial
    ADD CONSTRAINT galeria_pluvial_id_key UNIQUE (id);


--
-- TOC entry 3169 (class 2606 OID 26113)
-- Name: galeria_pluvial_pkey; Type: CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY galeria_pluvial
    ADD CONSTRAINT galeria_pluvial_pkey PRIMARY KEY (id);


--
-- TOC entry 3171 (class 2606 OID 26115)
-- Name: guias_sargetas_id_key; Type: CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY guias_sargetas
    ADD CONSTRAINT guias_sargetas_id_key UNIQUE (id);


--
-- TOC entry 3173 (class 2606 OID 26117)
-- Name: guias_sargetas_pkey; Type: CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY guias_sargetas
    ADD CONSTRAINT guias_sargetas_pkey PRIMARY KEY (id);


--
-- TOC entry 3175 (class 2606 OID 26119)
-- Name: iluminacao_id_key; Type: CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY iluminacao
    ADD CONSTRAINT iluminacao_id_key UNIQUE (id);


--
-- TOC entry 3177 (class 2606 OID 26121)
-- Name: iluminacao_pkey; Type: CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY iluminacao
    ADD CONSTRAINT iluminacao_pkey PRIMARY KEY (id);


--
-- TOC entry 3179 (class 2606 OID 26123)
-- Name: infra_estrutura_id_key; Type: CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY infra_estrutura
    ADD CONSTRAINT infra_estrutura_id_key UNIQUE (id);


--
-- TOC entry 3181 (class 2606 OID 26125)
-- Name: infra_estrutura_pkey; Type: CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY infra_estrutura
    ADD CONSTRAINT infra_estrutura_pkey PRIMARY KEY (id);


--
-- TOC entry 3183 (class 2606 OID 26127)
-- Name: limpeza_id_key; Type: CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY limpeza
    ADD CONSTRAINT limpeza_id_key UNIQUE (id);


--
-- TOC entry 3185 (class 2606 OID 26129)
-- Name: limpeza_pkey; Type: CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY limpeza
    ADD CONSTRAINT limpeza_pkey PRIMARY KEY (id);


--
-- TOC entry 3187 (class 2606 OID 26131)
-- Name: pavimentacao_id_key; Type: CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY pavimentacao
    ADD CONSTRAINT pavimentacao_id_key UNIQUE (id);


--
-- TOC entry 3189 (class 2606 OID 26133)
-- Name: pavimentacao_pkey; Type: CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY pavimentacao
    ADD CONSTRAINT pavimentacao_pkey PRIMARY KEY (id);


--
-- TOC entry 3191 (class 2606 OID 26135)
-- Name: rede_de_agua_id_key; Type: CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY rede_de_agua
    ADD CONSTRAINT rede_de_agua_id_key UNIQUE (id);


--
-- TOC entry 3193 (class 2606 OID 26137)
-- Name: rede_de_agua_pkey; Type: CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY rede_de_agua
    ADD CONSTRAINT rede_de_agua_pkey PRIMARY KEY (id);


--
-- TOC entry 3195 (class 2606 OID 26139)
-- Name: rede_de_esgoto_id_key; Type: CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY rede_de_esgoto
    ADD CONSTRAINT rede_de_esgoto_id_key UNIQUE (id);


--
-- TOC entry 3197 (class 2606 OID 26141)
-- Name: rede_de_esgoto_pkey; Type: CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY rede_de_esgoto
    ADD CONSTRAINT rede_de_esgoto_pkey PRIMARY KEY (id);


--
-- TOC entry 3199 (class 2606 OID 26143)
-- Name: rede_de_telefone_id_key; Type: CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY rede_de_telefone
    ADD CONSTRAINT rede_de_telefone_id_key UNIQUE (id);


--
-- TOC entry 3201 (class 2606 OID 26145)
-- Name: rede_de_telefone_pkey; Type: CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY rede_de_telefone
    ADD CONSTRAINT rede_de_telefone_pkey PRIMARY KEY (id);


SET search_path = cadastro_unico_localizacao, pg_catalog;

--
-- TOC entry 3203 (class 2606 OID 26147)
-- Name: bairro_id_key; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY bairro
    ADD CONSTRAINT bairro_id_key UNIQUE (id);


--
-- TOC entry 3205 (class 2606 OID 26149)
-- Name: bairro_pkey; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY bairro
    ADD CONSTRAINT bairro_pkey PRIMARY KEY (id);


--
-- TOC entry 3207 (class 2606 OID 26151)
-- Name: comercial_id_key; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY comercial
    ADD CONSTRAINT comercial_id_key UNIQUE (id);


--
-- TOC entry 3209 (class 2606 OID 26153)
-- Name: comercial_pkey; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY comercial
    ADD CONSTRAINT comercial_pkey PRIMARY KEY (id);


--
-- TOC entry 3211 (class 2606 OID 26155)
-- Name: cruzamento_id_key; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY cruzamento
    ADD CONSTRAINT cruzamento_id_key UNIQUE (id);


--
-- TOC entry 3213 (class 2606 OID 26157)
-- Name: cruzamento_pkey; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY cruzamento
    ADD CONSTRAINT cruzamento_pkey PRIMARY KEY (id);


--
-- TOC entry 3215 (class 2606 OID 26159)
-- Name: distrito_id_key; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY distrito
    ADD CONSTRAINT distrito_id_key UNIQUE (id);


--
-- TOC entry 3217 (class 2606 OID 26161)
-- Name: distrito_pkey; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY distrito
    ADD CONSTRAINT distrito_pkey PRIMARY KEY (id);


--
-- TOC entry 3219 (class 2606 OID 26163)
-- Name: divisao_administrativa_id_key; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY divisao_administrativa
    ADD CONSTRAINT divisao_administrativa_id_key UNIQUE (id);


--
-- TOC entry 3221 (class 2606 OID 26165)
-- Name: divisao_administrativa_pkey; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY divisao_administrativa
    ADD CONSTRAINT divisao_administrativa_pkey PRIMARY KEY (id);


--
-- TOC entry 3223 (class 2606 OID 26167)
-- Name: estado_id_key; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT estado_id_key UNIQUE (id);


--
-- TOC entry 3225 (class 2606 OID 26169)
-- Name: estado_pkey; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id);


--
-- TOC entry 3227 (class 2606 OID 26171)
-- Name: face_de_quadra_id_key; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY face_da_quadra
    ADD CONSTRAINT face_de_quadra_id_key UNIQUE (id);


--
-- TOC entry 3229 (class 2606 OID 26173)
-- Name: face_de_quadra_pkey; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY face_da_quadra
    ADD CONSTRAINT face_de_quadra_pkey PRIMARY KEY (id);


--
-- TOC entry 3231 (class 2606 OID 26175)
-- Name: foto_lote_id_key; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY foto_lote
    ADD CONSTRAINT foto_lote_id_key UNIQUE (id);


--
-- TOC entry 3233 (class 2606 OID 26177)
-- Name: foto_lote_pkey; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY foto_lote
    ADD CONSTRAINT foto_lote_pkey PRIMARY KEY (id);


--
-- TOC entry 3235 (class 2606 OID 26179)
-- Name: foto_unidade_unificada_id_key; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY foto_unidade_edificada
    ADD CONSTRAINT foto_unidade_unificada_id_key UNIQUE (id);


--
-- TOC entry 3237 (class 2606 OID 26181)
-- Name: foto_unidade_unificada_pkey; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY foto_unidade_edificada
    ADD CONSTRAINT foto_unidade_unificada_pkey PRIMARY KEY (id);


--
-- TOC entry 3239 (class 2606 OID 26183)
-- Name: industrial_id_key; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY industrial
    ADD CONSTRAINT industrial_id_key UNIQUE (id);


--
-- TOC entry 3241 (class 2606 OID 26185)
-- Name: industrial_pkey; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY industrial
    ADD CONSTRAINT industrial_pkey PRIMARY KEY (id);


--
-- TOC entry 3243 (class 2606 OID 26187)
-- Name: logradouro_id_key; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY logradouro
    ADD CONSTRAINT logradouro_id_key UNIQUE (id);


--
-- TOC entry 3245 (class 2606 OID 26189)
-- Name: logradouro_pkey; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY logradouro
    ADD CONSTRAINT logradouro_pkey PRIMARY KEY (id);


--
-- TOC entry 3247 (class 2606 OID 26191)
-- Name: lote_id_key; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY lote
    ADD CONSTRAINT lote_id_key UNIQUE (id);


--
-- TOC entry 3249 (class 2606 OID 26193)
-- Name: lote_pkey; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY lote
    ADD CONSTRAINT lote_pkey PRIMARY KEY (id);


--
-- TOC entry 3251 (class 2606 OID 26195)
-- Name: municipio_id_key; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY municipio
    ADD CONSTRAINT municipio_id_key UNIQUE (id);


--
-- TOC entry 3253 (class 2606 OID 26197)
-- Name: municipio_pkey; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY municipio
    ADD CONSTRAINT municipio_pkey PRIMARY KEY (id);


--
-- TOC entry 3255 (class 2606 OID 26199)
-- Name: quadra_id_key; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY quadra
    ADD CONSTRAINT quadra_id_key UNIQUE (id);


--
-- TOC entry 3257 (class 2606 OID 26201)
-- Name: quadra_pkey; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY quadra
    ADD CONSTRAINT quadra_pkey PRIMARY KEY (id);


--
-- TOC entry 3259 (class 2606 OID 26203)
-- Name: residencial_id_key; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY residencial
    ADD CONSTRAINT residencial_id_key UNIQUE (id);


--
-- TOC entry 3261 (class 2606 OID 26205)
-- Name: residencial_pkey; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY residencial
    ADD CONSTRAINT residencial_pkey PRIMARY KEY (id);


--
-- TOC entry 3263 (class 2606 OID 26207)
-- Name: setor_id_key; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY setor
    ADD CONSTRAINT setor_id_key UNIQUE (id);


--
-- TOC entry 3265 (class 2606 OID 26209)
-- Name: setor_pkey; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY setor
    ADD CONSTRAINT setor_pkey PRIMARY KEY (id);


--
-- TOC entry 3267 (class 2606 OID 26211)
-- Name: testada_id_key; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY testada
    ADD CONSTRAINT testada_id_key UNIQUE (id);


--
-- TOC entry 3269 (class 2606 OID 26213)
-- Name: testada_pkey; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY testada
    ADD CONSTRAINT testada_pkey PRIMARY KEY (id);


--
-- TOC entry 3271 (class 2606 OID 26215)
-- Name: tipo_logradouro_id_key; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY tipo_logradouro
    ADD CONSTRAINT tipo_logradouro_id_key UNIQUE (id);


--
-- TOC entry 3273 (class 2606 OID 26217)
-- Name: tipo_logradouro_pkey; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY tipo_logradouro
    ADD CONSTRAINT tipo_logradouro_pkey PRIMARY KEY (id);


--
-- TOC entry 3275 (class 2606 OID 26219)
-- Name: trecho_de_logradouro_id_key; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY trecho_de_logradouro
    ADD CONSTRAINT trecho_de_logradouro_id_key UNIQUE (id);


--
-- TOC entry 3277 (class 2606 OID 26221)
-- Name: trecho_de_logradouro_pkey; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY trecho_de_logradouro
    ADD CONSTRAINT trecho_de_logradouro_pkey PRIMARY KEY (id);


--
-- TOC entry 3279 (class 2606 OID 26223)
-- Name: unidade_edificada_id_key; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY unidade_edificada
    ADD CONSTRAINT unidade_edificada_id_key UNIQUE (id);


--
-- TOC entry 3281 (class 2606 OID 26225)
-- Name: unidade_edificada_pkey; Type: CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY unidade_edificada
    ADD CONSTRAINT unidade_edificada_pkey PRIMARY KEY (id);


SET search_path = cadastro_unico_patrimonio, pg_catalog;

--
-- TOC entry 3283 (class 2606 OID 26227)
-- Name: abastecimento_id_key; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY abastecimento
    ADD CONSTRAINT abastecimento_id_key UNIQUE (id);


--
-- TOC entry 3285 (class 2606 OID 26229)
-- Name: abastecimento_pkey; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY abastecimento
    ADD CONSTRAINT abastecimento_pkey PRIMARY KEY (id);


--
-- TOC entry 3287 (class 2606 OID 26231)
-- Name: ambulancia_id_key; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY ambulancia
    ADD CONSTRAINT ambulancia_id_key UNIQUE (id);


--
-- TOC entry 3289 (class 2606 OID 26233)
-- Name: ambulancia_pkey; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY ambulancia
    ADD CONSTRAINT ambulancia_pkey PRIMARY KEY (id);


--
-- TOC entry 3291 (class 2606 OID 26235)
-- Name: bem_id_key; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY bem
    ADD CONSTRAINT bem_id_key UNIQUE (id);


--
-- TOC entry 3293 (class 2606 OID 26237)
-- Name: bem_pkey; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY bem
    ADD CONSTRAINT bem_pkey PRIMARY KEY (id);


--
-- TOC entry 3295 (class 2606 OID 26239)
-- Name: caminhao_id_key; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY caminhao
    ADD CONSTRAINT caminhao_id_key UNIQUE (id);


--
-- TOC entry 3297 (class 2606 OID 26241)
-- Name: caminhao_pkey; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY caminhao
    ADD CONSTRAINT caminhao_pkey PRIMARY KEY (id);


--
-- TOC entry 3299 (class 2606 OID 26243)
-- Name: carro_id_key; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY carro
    ADD CONSTRAINT carro_id_key UNIQUE (id);


--
-- TOC entry 3301 (class 2606 OID 26245)
-- Name: carro_pkey; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY carro
    ADD CONSTRAINT carro_pkey PRIMARY KEY (id);


--
-- TOC entry 3303 (class 2606 OID 26247)
-- Name: garagem_id_key; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY garagem
    ADD CONSTRAINT garagem_id_key UNIQUE (id);


--
-- TOC entry 3305 (class 2606 OID 26249)
-- Name: garagem_pkey; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY garagem
    ADD CONSTRAINT garagem_pkey PRIMARY KEY (id);


--
-- TOC entry 3307 (class 2606 OID 26251)
-- Name: locacao_pkey; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY locacao
    ADD CONSTRAINT locacao_pkey PRIMARY KEY (id);


--
-- TOC entry 3309 (class 2606 OID 26253)
-- Name: lotacao_id_key; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY lotacao
    ADD CONSTRAINT lotacao_id_key UNIQUE (id);


--
-- TOC entry 3311 (class 2606 OID 26255)
-- Name: lotacao_pkey; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY lotacao
    ADD CONSTRAINT lotacao_pkey PRIMARY KEY (id);


--
-- TOC entry 3313 (class 2606 OID 26257)
-- Name: manutencao_id_key; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY manutencao
    ADD CONSTRAINT manutencao_id_key UNIQUE (id);


--
-- TOC entry 3315 (class 2606 OID 26259)
-- Name: manutencao_pkey; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY manutencao
    ADD CONSTRAINT manutencao_pkey PRIMARY KEY (id);


--
-- TOC entry 3317 (class 2606 OID 26261)
-- Name: moto_id_key; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY moto
    ADD CONSTRAINT moto_id_key UNIQUE (id);


--
-- TOC entry 3319 (class 2606 OID 26263)
-- Name: moto_pkey; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY moto
    ADD CONSTRAINT moto_pkey PRIMARY KEY (id);


--
-- TOC entry 3321 (class 2606 OID 26265)
-- Name: multas_id_key; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY multas
    ADD CONSTRAINT multas_id_key UNIQUE (id);


--
-- TOC entry 3323 (class 2606 OID 26267)
-- Name: multas_pkey; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY multas
    ADD CONSTRAINT multas_pkey PRIMARY KEY (id);


--
-- TOC entry 3325 (class 2606 OID 26269)
-- Name: onibus_id_key; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY onibus
    ADD CONSTRAINT onibus_id_key UNIQUE (id);


--
-- TOC entry 3327 (class 2606 OID 26271)
-- Name: onibus_pkey; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY onibus
    ADD CONSTRAINT onibus_pkey PRIMARY KEY (id);


--
-- TOC entry 3329 (class 2606 OID 26273)
-- Name: propriedade_de_id_key; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY propriedade_de
    ADD CONSTRAINT propriedade_de_id_key UNIQUE (id);


--
-- TOC entry 3331 (class 2606 OID 26275)
-- Name: propriedade_de_pkey; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY propriedade_de
    ADD CONSTRAINT propriedade_de_pkey PRIMARY KEY (id);


--
-- TOC entry 3333 (class 2606 OID 26277)
-- Name: servico_id_key; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY servico
    ADD CONSTRAINT servico_id_key UNIQUE (id);


--
-- TOC entry 3335 (class 2606 OID 26279)
-- Name: servico_pkey; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY servico
    ADD CONSTRAINT servico_pkey PRIMARY KEY (id);


--
-- TOC entry 3337 (class 2606 OID 26281)
-- Name: trator_id_key; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY trator
    ADD CONSTRAINT trator_id_key UNIQUE (id);


--
-- TOC entry 3339 (class 2606 OID 26283)
-- Name: trator_pkey; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY trator
    ADD CONSTRAINT trator_pkey PRIMARY KEY (id);


--
-- TOC entry 3341 (class 2606 OID 26285)
-- Name: uso_id_key; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY uso
    ADD CONSTRAINT uso_id_key UNIQUE (id);


--
-- TOC entry 3343 (class 2606 OID 26287)
-- Name: uso_pkey; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY uso
    ADD CONSTRAINT uso_pkey PRIMARY KEY (id);


--
-- TOC entry 3345 (class 2606 OID 26289)
-- Name: veiculo_id_key; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY veiculo
    ADD CONSTRAINT veiculo_id_key UNIQUE (id);


--
-- TOC entry 3347 (class 2606 OID 26291)
-- Name: veiculo_pkey; Type: CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY veiculo
    ADD CONSTRAINT veiculo_pkey PRIMARY KEY (id);


SET search_path = cadastro_unico_pessoal, pg_catalog;

--
-- TOC entry 3349 (class 2606 OID 26293)
-- Name: aditivo_id_key; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY aditivo
    ADD CONSTRAINT aditivo_id_key UNIQUE (id);


--
-- TOC entry 3351 (class 2606 OID 26295)
-- Name: aditivo_pkey; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY aditivo
    ADD CONSTRAINT aditivo_pkey PRIMARY KEY (id);


--
-- TOC entry 3353 (class 2606 OID 26297)
-- Name: aluno_id_key; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY aluno
    ADD CONSTRAINT aluno_id_key UNIQUE (id);


--
-- TOC entry 3355 (class 2606 OID 26299)
-- Name: aluno_numero_de_inscricao_key; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY aluno
    ADD CONSTRAINT aluno_numero_de_inscricao_key UNIQUE (numero_de_inscricao);


--
-- TOC entry 3357 (class 2606 OID 26301)
-- Name: aluno_pkey; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY aluno
    ADD CONSTRAINT aluno_pkey PRIMARY KEY (id);


--
-- TOC entry 3359 (class 2606 OID 26303)
-- Name: cidadao_id_key; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY cidadao
    ADD CONSTRAINT cidadao_id_key UNIQUE (id);


--
-- TOC entry 3361 (class 2606 OID 26305)
-- Name: cidadao_pkey; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY cidadao
    ADD CONSTRAINT cidadao_pkey PRIMARY KEY (id);


--
-- TOC entry 3363 (class 2606 OID 26307)
-- Name: contato_id_key; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY contato
    ADD CONSTRAINT contato_id_key UNIQUE (id);


--
-- TOC entry 3365 (class 2606 OID 26309)
-- Name: contato_pkey; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY contato
    ADD CONSTRAINT contato_pkey PRIMARY KEY (id);


--
-- TOC entry 3367 (class 2606 OID 26311)
-- Name: contrato_id_key; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY contrato
    ADD CONSTRAINT contrato_id_key UNIQUE (id);


--
-- TOC entry 3369 (class 2606 OID 26313)
-- Name: contrato_pkey; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY contrato
    ADD CONSTRAINT contrato_pkey PRIMARY KEY (id);


--
-- TOC entry 3371 (class 2606 OID 26315)
-- Name: dados_bancarios_id_key; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY dados_bancarios
    ADD CONSTRAINT dados_bancarios_id_key UNIQUE (id);


--
-- TOC entry 3373 (class 2606 OID 26317)
-- Name: dados_bancarios_pkey; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY dados_bancarios
    ADD CONSTRAINT dados_bancarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3375 (class 2606 OID 26319)
-- Name: detem_propriedade_id_key; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY detem_propriedade
    ADD CONSTRAINT detem_propriedade_id_key UNIQUE (id);


--
-- TOC entry 3377 (class 2606 OID 26321)
-- Name: detem_propriedade_pkey; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY detem_propriedade
    ADD CONSTRAINT detem_propriedade_pkey PRIMARY KEY (id);


--
-- TOC entry 3379 (class 2606 OID 26323)
-- Name: editora_id_key; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY editora
    ADD CONSTRAINT editora_id_key UNIQUE (id);


--
-- TOC entry 3381 (class 2606 OID 26325)
-- Name: editora_pkey; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY editora
    ADD CONSTRAINT editora_pkey PRIMARY KEY (id);


--
-- TOC entry 3383 (class 2606 OID 26327)
-- Name: escola_id_key; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY escola
    ADD CONSTRAINT escola_id_key UNIQUE (id);


--
-- TOC entry 3385 (class 2606 OID 26329)
-- Name: escola_pkey; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY escola
    ADD CONSTRAINT escola_pkey PRIMARY KEY (id);


--
-- TOC entry 3387 (class 2606 OID 26331)
-- Name: fonecedor_pkey; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY fornecedor
    ADD CONSTRAINT fonecedor_pkey PRIMARY KEY (id);


--
-- TOC entry 3389 (class 2606 OID 26333)
-- Name: funcionario_id_key; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT funcionario_id_key UNIQUE (id);


--
-- TOC entry 3391 (class 2606 OID 26335)
-- Name: funcionario_matricula_key; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT funcionario_matricula_key UNIQUE (matricula);


--
-- TOC entry 3393 (class 2606 OID 26337)
-- Name: funcionario_pkey; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (id);


--
-- TOC entry 3395 (class 2606 OID 26339)
-- Name: motorista_id_key; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY motorista
    ADD CONSTRAINT motorista_id_key UNIQUE (id);


--
-- TOC entry 3397 (class 2606 OID 26341)
-- Name: motorista_pkey; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY motorista
    ADD CONSTRAINT motorista_pkey PRIMARY KEY (id);


--
-- TOC entry 3399 (class 2606 OID 26343)
-- Name: paciente_id_key; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY paciente
    ADD CONSTRAINT paciente_id_key UNIQUE (id);


--
-- TOC entry 3401 (class 2606 OID 26345)
-- Name: paciente_pkey; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY paciente
    ADD CONSTRAINT paciente_pkey PRIMARY KEY (id);


--
-- TOC entry 3403 (class 2606 OID 26349)
-- Name: parentesco_id_key; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY parentesco
    ADD CONSTRAINT parentesco_id_key UNIQUE (id);


--
-- TOC entry 3405 (class 2606 OID 26351)
-- Name: parentesco_pkey; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY parentesco
    ADD CONSTRAINT parentesco_pkey PRIMARY KEY (id);


--
-- TOC entry 3413 (class 2606 OID 26353)
-- Name: pessoa_fisica_id_key; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY pessoa_fisica
    ADD CONSTRAINT pessoa_fisica_id_key UNIQUE (id);


--
-- TOC entry 3415 (class 2606 OID 26355)
-- Name: pessoa_fisica_pkey; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY pessoa_fisica
    ADD CONSTRAINT pessoa_fisica_pkey PRIMARY KEY (id);


--
-- TOC entry 3407 (class 2606 OID 26357)
-- Name: pessoa_id_cpf_cnpj_key; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY pessoa
    ADD CONSTRAINT pessoa_id_cpf_cnpj_key UNIQUE (cpf_cnpj);


--
-- TOC entry 3409 (class 2606 OID 26359)
-- Name: pessoa_id_key; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY pessoa
    ADD CONSTRAINT pessoa_id_key UNIQUE (id);


--
-- TOC entry 3417 (class 2606 OID 26361)
-- Name: pessoa_juridica_id_key; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY pessoa_juridica
    ADD CONSTRAINT pessoa_juridica_id_key UNIQUE (id);


--
-- TOC entry 3419 (class 2606 OID 26363)
-- Name: pessoa_juridica_pkey; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY pessoa_juridica
    ADD CONSTRAINT pessoa_juridica_pkey PRIMARY KEY (id);


--
-- TOC entry 3421 (class 2606 OID 26365)
-- Name: pessoa_juridica_razao_social_key; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY pessoa_juridica
    ADD CONSTRAINT pessoa_juridica_razao_social_key UNIQUE (razao_social);


--
-- TOC entry 3411 (class 2606 OID 26367)
-- Name: pessoa_pkey; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY pessoa
    ADD CONSTRAINT pessoa_pkey PRIMARY KEY (id);


--
-- TOC entry 3423 (class 2606 OID 26369)
-- Name: prefeitura_id_key; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY prefeitura
    ADD CONSTRAINT prefeitura_id_key UNIQUE (id);


--
-- TOC entry 3425 (class 2606 OID 26371)
-- Name: prefeitura_pkey; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY prefeitura
    ADD CONSTRAINT prefeitura_pkey PRIMARY KEY (id);


--
-- TOC entry 3427 (class 2606 OID 26373)
-- Name: professor_id_key; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY professor
    ADD CONSTRAINT professor_id_key UNIQUE (id);


--
-- TOC entry 3429 (class 2606 OID 26375)
-- Name: professor_pkey; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY professor
    ADD CONSTRAINT professor_pkey PRIMARY KEY (id);


--
-- TOC entry 3431 (class 2606 OID 26377)
-- Name: reside_id_key; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY reside
    ADD CONSTRAINT reside_id_key UNIQUE (id);


--
-- TOC entry 3433 (class 2606 OID 26379)
-- Name: reside_pkey; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY reside
    ADD CONSTRAINT reside_pkey PRIMARY KEY (id);


--
-- TOC entry 3435 (class 2606 OID 26381)
-- Name: tipo_contato_id_key; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY tipo_contato
    ADD CONSTRAINT tipo_contato_id_key UNIQUE (id);


--
-- TOC entry 3437 (class 2606 OID 26383)
-- Name: tipo_contato_pkey; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY tipo_contato
    ADD CONSTRAINT tipo_contato_pkey PRIMARY KEY (id);


--
-- TOC entry 3439 (class 2606 OID 26385)
-- Name: tipo_contato_tipo_key; Type: CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY tipo_contato
    ADD CONSTRAINT tipo_contato_tipo_key UNIQUE (tipo_contato);


SET search_path = cadastro_unico_protocolo, pg_catalog;

--
-- TOC entry 3441 (class 2606 OID 26387)
-- Name: item_id_key; Type: CONSTRAINT; Schema: cadastro_unico_protocolo; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY item
    ADD CONSTRAINT item_id_key UNIQUE (id);


--
-- TOC entry 3443 (class 2606 OID 26389)
-- Name: item_pkey; Type: CONSTRAINT; Schema: cadastro_unico_protocolo; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY item
    ADD CONSTRAINT item_pkey PRIMARY KEY (id);


--
-- TOC entry 3445 (class 2606 OID 26391)
-- Name: lote_item_id_key; Type: CONSTRAINT; Schema: cadastro_unico_protocolo; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY lote_item
    ADD CONSTRAINT lote_item_id_key UNIQUE (id);


--
-- TOC entry 3447 (class 2606 OID 26393)
-- Name: lote_item_pkey; Type: CONSTRAINT; Schema: cadastro_unico_protocolo; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY lote_item
    ADD CONSTRAINT lote_item_pkey PRIMARY KEY (id);


--
-- TOC entry 3449 (class 2606 OID 26395)
-- Name: movimentacao_id_key; Type: CONSTRAINT; Schema: cadastro_unico_protocolo; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY movimentacao
    ADD CONSTRAINT movimentacao_id_key UNIQUE (id);


--
-- TOC entry 3451 (class 2606 OID 26397)
-- Name: movimentacao_pkey; Type: CONSTRAINT; Schema: cadastro_unico_protocolo; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY movimentacao
    ADD CONSTRAINT movimentacao_pkey PRIMARY KEY (id);


--
-- TOC entry 3453 (class 2606 OID 26399)
-- Name: tratamento_id_key; Type: CONSTRAINT; Schema: cadastro_unico_protocolo; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY tratamento
    ADD CONSTRAINT tratamento_id_key UNIQUE (id);


--
-- TOC entry 3455 (class 2606 OID 26401)
-- Name: tratamento_pkey; Type: CONSTRAINT; Schema: cadastro_unico_protocolo; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY tratamento
    ADD CONSTRAINT tratamento_pkey PRIMARY KEY (id);


SET search_path = controle_de_acesso_a_dado, pg_catalog;

--
-- TOC entry 3457 (class 2606 OID 26403)
-- Name: id; Type: CONSTRAINT; Schema: controle_de_acesso_a_dado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY mapa_de_acesso
    ADD CONSTRAINT id PRIMARY KEY (id);


--
-- TOC entry 3459 (class 2606 OID 26405)
-- Name: vinculo_acesso_pkey; Type: CONSTRAINT; Schema: controle_de_acesso_a_dado; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY vinculo_acesso
    ADD CONSTRAINT vinculo_acesso_pkey PRIMARY KEY (id);


SET search_path = educacao_academico, pg_catalog;

--
-- TOC entry 3461 (class 2606 OID 26407)
-- Name: atividade_pkey; Type: CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY atividade
    ADD CONSTRAINT atividade_pkey PRIMARY KEY (id);


--
-- TOC entry 3463 (class 2606 OID 26409)
-- Name: aula_pkey; Type: CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY aula
    ADD CONSTRAINT aula_pkey PRIMARY KEY (id);


--
-- TOC entry 3465 (class 2606 OID 26411)
-- Name: conteudo_da_disciplina_id_key; Type: CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY conteudo_da_disciplina
    ADD CONSTRAINT conteudo_da_disciplina_id_key UNIQUE (id);


--
-- TOC entry 3467 (class 2606 OID 26413)
-- Name: conteudo_da_disciplina_pkey; Type: CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY conteudo_da_disciplina
    ADD CONSTRAINT conteudo_da_disciplina_pkey PRIMARY KEY (id);


--
-- TOC entry 3469 (class 2606 OID 26415)
-- Name: disciplina_id_key; Type: CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY disciplina
    ADD CONSTRAINT disciplina_id_key UNIQUE (id);


--
-- TOC entry 3471 (class 2606 OID 26417)
-- Name: disciplina_pkey; Type: CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY disciplina
    ADD CONSTRAINT disciplina_pkey PRIMARY KEY (id);


--
-- TOC entry 3477 (class 2606 OID 26419)
-- Name: frequencia_pkey; Type: CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY frequencia
    ADD CONSTRAINT frequencia_pkey PRIMARY KEY (id);


--
-- TOC entry 3479 (class 2606 OID 26421)
-- Name: horario_id_key; Type: CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY horario
    ADD CONSTRAINT horario_id_key UNIQUE (id);


--
-- TOC entry 3481 (class 2606 OID 26423)
-- Name: horario_pkey; Type: CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY horario
    ADD CONSTRAINT horario_pkey PRIMARY KEY (id);


--
-- TOC entry 3473 (class 2606 OID 26425)
-- Name: leciona_id_key; Type: CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY disciplina_lecionada_por_professor
    ADD CONSTRAINT leciona_id_key UNIQUE (id);


--
-- TOC entry 3475 (class 2606 OID 26427)
-- Name: leciona_pkey; Type: CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY disciplina_lecionada_por_professor
    ADD CONSTRAINT leciona_pkey PRIMARY KEY (id);


--
-- TOC entry 3483 (class 2606 OID 26429)
-- Name: matricula_id_key; Type: CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY matricula
    ADD CONSTRAINT matricula_id_key UNIQUE (id);


--
-- TOC entry 3485 (class 2606 OID 26431)
-- Name: matricula_pkey; Type: CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY matricula
    ADD CONSTRAINT matricula_pkey PRIMARY KEY (id);


--
-- TOC entry 3487 (class 2606 OID 26433)
-- Name: nota_id_key; Type: CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY nota
    ADD CONSTRAINT nota_id_key UNIQUE (id);


--
-- TOC entry 3489 (class 2606 OID 26435)
-- Name: nota_pkey; Type: CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY nota
    ADD CONSTRAINT nota_pkey PRIMARY KEY (id);


--
-- TOC entry 3491 (class 2606 OID 26437)
-- Name: sala_id_key; Type: CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY sala
    ADD CONSTRAINT sala_id_key UNIQUE (id);


--
-- TOC entry 3493 (class 2606 OID 26439)
-- Name: sala_pkey; Type: CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY sala
    ADD CONSTRAINT sala_pkey PRIMARY KEY (id);


--
-- TOC entry 3495 (class 2606 OID 26441)
-- Name: serie_id_key; Type: CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY serie
    ADD CONSTRAINT serie_id_key UNIQUE (id);


--
-- TOC entry 3497 (class 2606 OID 26443)
-- Name: serie_pkey; Type: CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY serie
    ADD CONSTRAINT serie_pkey PRIMARY KEY (id);


--
-- TOC entry 3499 (class 2606 OID 26445)
-- Name: tipo_aula_id_key; Type: CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY tipo_aula
    ADD CONSTRAINT tipo_aula_id_key UNIQUE (id);


--
-- TOC entry 3501 (class 2606 OID 26447)
-- Name: tipo_aula_pkey; Type: CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY tipo_aula
    ADD CONSTRAINT tipo_aula_pkey PRIMARY KEY (id);


--
-- TOC entry 3503 (class 2606 OID 26449)
-- Name: tipoaula_pkey; Type: CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY tipoaula
    ADD CONSTRAINT tipoaula_pkey PRIMARY KEY (id);


--
-- TOC entry 3510 (class 2606 OID 26451)
-- Name: turma_disciplina_id_key; Type: CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY turma_disciplina
    ADD CONSTRAINT turma_disciplina_id_key UNIQUE (id);


--
-- TOC entry 3512 (class 2606 OID 26453)
-- Name: turma_disciplina_pkey; Type: CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY turma_disciplina
    ADD CONSTRAINT turma_disciplina_pkey PRIMARY KEY (id);


--
-- TOC entry 3506 (class 2606 OID 26455)
-- Name: turma_id_key; Type: CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY turma
    ADD CONSTRAINT turma_id_key UNIQUE (id);


--
-- TOC entry 3508 (class 2606 OID 26457)
-- Name: turma_pkey; Type: CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY turma
    ADD CONSTRAINT turma_pkey PRIMARY KEY (id);


SET search_path = educacao_biblioteca, pg_catalog;

--
-- TOC entry 3514 (class 2606 OID 26459)
-- Name: acervo_id_key; Type: CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY acervo
    ADD CONSTRAINT acervo_id_key UNIQUE (id);


--
-- TOC entry 3516 (class 2606 OID 26461)
-- Name: acervo_pkey; Type: CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY acervo
    ADD CONSTRAINT acervo_pkey PRIMARY KEY (id);


--
-- TOC entry 3518 (class 2606 OID 26463)
-- Name: autor_id_key; Type: CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY autor
    ADD CONSTRAINT autor_id_key UNIQUE (id);


--
-- TOC entry 3520 (class 2606 OID 26465)
-- Name: autor_pkey; Type: CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY autor
    ADD CONSTRAINT autor_pkey PRIMARY KEY (id);


--
-- TOC entry 3526 (class 2606 OID 26467)
-- Name: conteudo_didatica_id_key; Type: CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY conteudo_didatica
    ADD CONSTRAINT conteudo_didatica_id_key UNIQUE (id);


--
-- TOC entry 3528 (class 2606 OID 26469)
-- Name: conteudo_didatica_pkey; Type: CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY conteudo_didatica
    ADD CONSTRAINT conteudo_didatica_pkey PRIMARY KEY (id);


--
-- TOC entry 3522 (class 2606 OID 26471)
-- Name: conteudo_id_key; Type: CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY conteudo
    ADD CONSTRAINT conteudo_id_key UNIQUE (id);


--
-- TOC entry 3524 (class 2606 OID 26473)
-- Name: conteudo_pkey; Type: CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY conteudo
    ADD CONSTRAINT conteudo_pkey PRIMARY KEY (id);


--
-- TOC entry 3530 (class 2606 OID 26475)
-- Name: didatica_id_key; Type: CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY didatica
    ADD CONSTRAINT didatica_id_key UNIQUE (id);


--
-- TOC entry 3532 (class 2606 OID 26477)
-- Name: didatica_pkey; Type: CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY didatica
    ADD CONSTRAINT didatica_pkey PRIMARY KEY (id);


--
-- TOC entry 3534 (class 2606 OID 26479)
-- Name: edicao_id_key; Type: CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY edicao
    ADD CONSTRAINT edicao_id_key UNIQUE (id);


--
-- TOC entry 3536 (class 2606 OID 26481)
-- Name: edicao_pkey; Type: CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY edicao
    ADD CONSTRAINT edicao_pkey PRIMARY KEY (id);


--
-- TOC entry 3538 (class 2606 OID 26483)
-- Name: emprestimo_id_key; Type: CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY emprestimo
    ADD CONSTRAINT emprestimo_id_key UNIQUE (id);


--
-- TOC entry 3540 (class 2606 OID 26485)
-- Name: emprestimo_pkey; Type: CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY emprestimo
    ADD CONSTRAINT emprestimo_pkey PRIMARY KEY (id);


--
-- TOC entry 3542 (class 2606 OID 26487)
-- Name: estante_id_key; Type: CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY estante
    ADD CONSTRAINT estante_id_key UNIQUE (id);


--
-- TOC entry 3544 (class 2606 OID 26489)
-- Name: estante_pkey; Type: CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY estante
    ADD CONSTRAINT estante_pkey PRIMARY KEY (id);


--
-- TOC entry 3546 (class 2606 OID 26491)
-- Name: exemplar_id_key; Type: CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY exemplar
    ADD CONSTRAINT exemplar_id_key UNIQUE (id);


--
-- TOC entry 3548 (class 2606 OID 26493)
-- Name: exemplar_pkey; Type: CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY exemplar
    ADD CONSTRAINT exemplar_pkey PRIMARY KEY (id);


--
-- TOC entry 3550 (class 2606 OID 26495)
-- Name: literaria_id_key; Type: CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY literaria
    ADD CONSTRAINT literaria_id_key UNIQUE (id);


--
-- TOC entry 3552 (class 2606 OID 26497)
-- Name: literaria_pkey; Type: CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY literaria
    ADD CONSTRAINT literaria_pkey PRIMARY KEY (id);


--
-- TOC entry 3558 (class 2606 OID 26499)
-- Name: obra_autor_id_key; Type: CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY obra_autor
    ADD CONSTRAINT obra_autor_id_key UNIQUE (id);


--
-- TOC entry 3560 (class 2606 OID 26501)
-- Name: obra_autor_pkey; Type: CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY obra_autor
    ADD CONSTRAINT obra_autor_pkey PRIMARY KEY (id);


--
-- TOC entry 3554 (class 2606 OID 26503)
-- Name: obra_id_key; Type: CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY obra
    ADD CONSTRAINT obra_id_key UNIQUE (id);


--
-- TOC entry 3556 (class 2606 OID 26505)
-- Name: obra_pkey; Type: CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY obra
    ADD CONSTRAINT obra_pkey PRIMARY KEY (id);


--
-- TOC entry 3562 (class 2606 OID 26507)
-- Name: prateleira_id_key; Type: CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY prateleira
    ADD CONSTRAINT prateleira_id_key UNIQUE (id);


--
-- TOC entry 3564 (class 2606 OID 26509)
-- Name: prateleira_pkey; Type: CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY prateleira
    ADD CONSTRAINT prateleira_pkey PRIMARY KEY (id);


--
-- TOC entry 3566 (class 2606 OID 26511)
-- Name: tipo_obra_id_key; Type: CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY tipo_obra
    ADD CONSTRAINT tipo_obra_id_key UNIQUE (id);


--
-- TOC entry 3568 (class 2606 OID 26513)
-- Name: tipo_obra_pkey; Type: CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY tipo_obra
    ADD CONSTRAINT tipo_obra_pkey PRIMARY KEY (id);


SET search_path = energia, pg_catalog;

--
-- TOC entry 3570 (class 2606 OID 26515)
-- Name: pk_classe_unidade; Type: CONSTRAINT; Schema: energia; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY classe_unidade
    ADD CONSTRAINT pk_classe_unidade PRIMARY KEY (idclasseunidade);


--
-- TOC entry 3572 (class 2606 OID 26517)
-- Name: pk_conta; Type: CONSTRAINT; Schema: energia; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY conta
    ADD CONSTRAINT pk_conta PRIMARY KEY (idconta);


--
-- TOC entry 3574 (class 2606 OID 26519)
-- Name: pk_conta_tarifa; Type: CONSTRAINT; Schema: energia; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY contatarifa
    ADD CONSTRAINT pk_conta_tarifa PRIMARY KEY (idcontatarifa);


--
-- TOC entry 3576 (class 2606 OID 26521)
-- Name: pk_tarifa; Type: CONSTRAINT; Schema: energia; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY tarifa
    ADD CONSTRAINT pk_tarifa PRIMARY KEY (idtarifa);


--
-- TOC entry 3578 (class 2606 OID 26523)
-- Name: pk_taxa; Type: CONSTRAINT; Schema: energia; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY taxa
    ADD CONSTRAINT pk_taxa PRIMARY KEY (idtaxa);


--
-- TOC entry 3580 (class 2606 OID 26525)
-- Name: pk_unidade; Type: CONSTRAINT; Schema: energia; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY unidade
    ADD CONSTRAINT pk_unidade PRIMARY KEY (idunidade);


SET search_path = login, pg_catalog;

--
-- TOC entry 3582 (class 2606 OID 26527)
-- Name: grupo_pkey; Type: CONSTRAINT; Schema: login; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY grupo
    ADD CONSTRAINT grupo_pkey PRIMARY KEY (id);


--
-- TOC entry 3584 (class 2606 OID 26529)
-- Name: grupo_usuario_pkey; Type: CONSTRAINT; Schema: login; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY grupo_usuario
    ADD CONSTRAINT grupo_usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 3586 (class 2606 OID 26531)
-- Name: permissao_pkey; Type: CONSTRAINT; Schema: login; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY permissao
    ADD CONSTRAINT permissao_pkey PRIMARY KEY (id);


--
-- TOC entry 3588 (class 2606 OID 26533)
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: login; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


SET search_path = public, pg_catalog;

--
-- TOC entry 3590 (class 2606 OID 26535)
-- Name: layout_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY layout
    ADD CONSTRAINT layout_pkey PRIMARY KEY (id);


--
-- TOC entry 3592 (class 2606 OID 26537)
-- Name: sequence_definition_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY sequence_definition
    ADD CONSTRAINT sequence_definition_pkey PRIMARY KEY (id);


--
-- TOC entry 3594 (class 2606 OID 26539)
-- Name: sequence_definition_tenant_id_name_key; Type: CONSTRAINT; Schema: public; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY sequence_definition
    ADD CONSTRAINT sequence_definition_tenant_id_name_key UNIQUE (tenant_id, name);


--
-- TOC entry 3596 (class 2606 OID 26541)
-- Name: sequence_number_definition_id_sequence_group_key; Type: CONSTRAINT; Schema: public; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY sequence_number
    ADD CONSTRAINT sequence_number_definition_id_sequence_group_key UNIQUE (definition_id, sequence_group);


--
-- TOC entry 3598 (class 2606 OID 26543)
-- Name: sequence_number_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY sequence_number
    ADD CONSTRAINT sequence_number_pkey PRIMARY KEY (id);


--
-- TOC entry 3600 (class 2606 OID 26545)
-- Name: tabela_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY tabela
    ADD CONSTRAINT tabela_pkey PRIMARY KEY (id);


SET search_path = saude_procedimento, pg_catalog;

--
-- TOC entry 3602 (class 2606 OID 26547)
-- Name: cbo_id_key; Type: CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY cbo
    ADD CONSTRAINT cbo_id_key UNIQUE (id);


--
-- TOC entry 3606 (class 2606 OID 26549)
-- Name: cbo_numero_procedimento_id_key; Type: CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY cbo_numero_procedimento
    ADD CONSTRAINT cbo_numero_procedimento_id_key UNIQUE (id);


--
-- TOC entry 3608 (class 2606 OID 26551)
-- Name: cbo_numero_procedimento_pkey; Type: CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY cbo_numero_procedimento
    ADD CONSTRAINT cbo_numero_procedimento_pkey PRIMARY KEY (id);


--
-- TOC entry 3604 (class 2606 OID 26553)
-- Name: cbo_pkey; Type: CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY cbo
    ADD CONSTRAINT cbo_pkey PRIMARY KEY (id);


--
-- TOC entry 3610 (class 2606 OID 26555)
-- Name: executor_id_key; Type: CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY executor
    ADD CONSTRAINT executor_id_key UNIQUE (id);


--
-- TOC entry 3612 (class 2606 OID 26557)
-- Name: executor_pkey; Type: CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY executor
    ADD CONSTRAINT executor_pkey PRIMARY KEY (id);


--
-- TOC entry 3614 (class 2606 OID 26559)
-- Name: forma_de_organizacao_id_key; Type: CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY forma_de_organizacao
    ADD CONSTRAINT forma_de_organizacao_id_key UNIQUE (id);


--
-- TOC entry 3616 (class 2606 OID 26561)
-- Name: forma_de_organizacao_pkey; Type: CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY forma_de_organizacao
    ADD CONSTRAINT forma_de_organizacao_pkey PRIMARY KEY (id);


--
-- TOC entry 3618 (class 2606 OID 26563)
-- Name: grupo_id_key; Type: CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY grupo
    ADD CONSTRAINT grupo_id_key UNIQUE (id);


--
-- TOC entry 3620 (class 2606 OID 26565)
-- Name: grupo_pkey; Type: CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY grupo
    ADD CONSTRAINT grupo_pkey PRIMARY KEY (id);


--
-- TOC entry 3622 (class 2606 OID 26567)
-- Name: lugar_pkey; Type: CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY lugar
    ADD CONSTRAINT lugar_pkey PRIMARY KEY (id);


--
-- TOC entry 3624 (class 2606 OID 26569)
-- Name: material_procedimento_id_key; Type: CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY material_procedimento
    ADD CONSTRAINT material_procedimento_id_key UNIQUE (id);


--
-- TOC entry 3626 (class 2606 OID 26571)
-- Name: material_procedimento_pkey; Type: CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY material_procedimento
    ADD CONSTRAINT material_procedimento_pkey PRIMARY KEY (id);


--
-- TOC entry 3628 (class 2606 OID 26573)
-- Name: numero_procedimento_id_key; Type: CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY numero_procedimento
    ADD CONSTRAINT numero_procedimento_id_key UNIQUE (id);


--
-- TOC entry 3630 (class 2606 OID 26575)
-- Name: numero_procedimento_pkey; Type: CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY numero_procedimento
    ADD CONSTRAINT numero_procedimento_pkey PRIMARY KEY (id);


--
-- TOC entry 3632 (class 2606 OID 26577)
-- Name: procedimento_id_key; Type: CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY procedimento
    ADD CONSTRAINT procedimento_id_key UNIQUE (id);


--
-- TOC entry 3636 (class 2606 OID 26579)
-- Name: procedimento_paciente_id_key; Type: CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY procedimento_paciente
    ADD CONSTRAINT procedimento_paciente_id_key UNIQUE (id);


--
-- TOC entry 3638 (class 2606 OID 26581)
-- Name: procedimento_paciente_pkey; Type: CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY procedimento_paciente
    ADD CONSTRAINT procedimento_paciente_pkey PRIMARY KEY (id);


--
-- TOC entry 3634 (class 2606 OID 26583)
-- Name: procedimento_pkey; Type: CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY procedimento
    ADD CONSTRAINT procedimento_pkey PRIMARY KEY (id);


--
-- TOC entry 3640 (class 2606 OID 26585)
-- Name: sub_grupo_id_key; Type: CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY sub_grupo
    ADD CONSTRAINT sub_grupo_id_key UNIQUE (id);


--
-- TOC entry 3642 (class 2606 OID 26587)
-- Name: sub_grupo_pkey; Type: CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY sub_grupo
    ADD CONSTRAINT sub_grupo_pkey PRIMARY KEY (id);


--
-- TOC entry 3644 (class 2606 OID 26589)
-- Name: tipo_procedimento_id_key; Type: CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY tipo_procedimento
    ADD CONSTRAINT tipo_procedimento_id_key UNIQUE (id);


--
-- TOC entry 3646 (class 2606 OID 26591)
-- Name: tipo_procedimento_pkey; Type: CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr; Tablespace: 
--

ALTER TABLE ONLY tipo_procedimento
    ADD CONSTRAINT tipo_procedimento_pkey PRIMARY KEY (id);


SET search_path = educacao_academico, pg_catalog;

--
-- TOC entry 3504 (class 1259 OID 26592)
-- Name: fki_escola_id; Type: INDEX; Schema: educacao_academico; Owner: admin_db_sr; Tablespace: 
--

CREATE INDEX fki_escola_id ON turma USING btree (escola_id);


SET search_path = cadastro_unico_pessoal, pg_catalog;

--
-- TOC entry 3838 (class 2620 OID 26593)
-- Name: gat_altera_seq; Type: TRIGGER; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

CREATE TRIGGER gat_altera_seq AFTER INSERT ON pessoa FOR EACH ROW EXECUTE PROCEDURE altera_seq();


SET search_path = administracao_organizacao, pg_catalog;

--
-- TOC entry 3649 (class 2606 OID 26594)
-- Name: assessoria_organismo_id_fkey; Type: FK CONSTRAINT; Schema: administracao_organizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY assessoria
    ADD CONSTRAINT assessoria_organismo_id_fkey FOREIGN KEY (organismo_id) REFERENCES organismo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3650 (class 2606 OID 26599)
-- Name: cargo_celula_id_fkey; Type: FK CONSTRAINT; Schema: administracao_organizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY cargo
    ADD CONSTRAINT cargo_celula_id_fkey FOREIGN KEY (celula_id) REFERENCES celula(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3651 (class 2606 OID 26604)
-- Name: celula_organismo_id_fkey; Type: FK CONSTRAINT; Schema: administracao_organizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY celula
    ADD CONSTRAINT celula_organismo_id_fkey FOREIGN KEY (organismo_id) REFERENCES organismo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3652 (class 2606 OID 26609)
-- Name: lotacao_cargo_id_fkey; Type: FK CONSTRAINT; Schema: administracao_organizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY lotacao
    ADD CONSTRAINT lotacao_cargo_id_fkey FOREIGN KEY (cargo_id) REFERENCES cargo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3653 (class 2606 OID 26614)
-- Name: lotacao_funcionario_id_fkey; Type: FK CONSTRAINT; Schema: administracao_organizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY lotacao
    ADD CONSTRAINT lotacao_funcionario_id_fkey FOREIGN KEY (funcionario_id) REFERENCES cadastro_unico_pessoal.funcionario(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3654 (class 2606 OID 26619)
-- Name: organismo_prefeitura_id_fkey; Type: FK CONSTRAINT; Schema: administracao_organizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY organismo
    ADD CONSTRAINT organismo_prefeitura_id_fkey FOREIGN KEY (prefeitura_id) REFERENCES cadastro_unico_pessoal.prefeitura(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = administracao_registro, pg_catalog;

--
-- TOC entry 3837 (class 2606 OID 30680)
-- Name: fk1a3442842e2c1; Type: FK CONSTRAINT; Schema: administracao_registro; Owner: admin_db_sr
--

ALTER TABLE ONLY log
    ADD CONSTRAINT fk1a3442842e2c1 FOREIGN KEY (usuario_id) REFERENCES login.usuario(id);


SET search_path = cadastro_unico_almoxarifado, pg_catalog;

--
-- TOC entry 3656 (class 2606 OID 26624)
-- Name: almoxarifado_lote_almoxarifado_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY almoxarifado_lote
    ADD CONSTRAINT almoxarifado_lote_almoxarifado_id_fkey FOREIGN KEY (almoxarifado_id) REFERENCES almoxarifado(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3657 (class 2606 OID 26629)
-- Name: almoxarifado_lote_lote_material_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY almoxarifado_lote
    ADD CONSTRAINT almoxarifado_lote_lote_material_id_fkey FOREIGN KEY (lote_material_id) REFERENCES lote_material(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3655 (class 2606 OID 26634)
-- Name: almoxarifado_organismo_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY almoxarifado
    ADD CONSTRAINT almoxarifado_organismo_id_fkey FOREIGN KEY (organismo_id) REFERENCES administracao_organizacao.organismo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3658 (class 2606 OID 26639)
-- Name: composicao_medicamento_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY composicao
    ADD CONSTRAINT composicao_medicamento_id_fkey FOREIGN KEY (medicamento_id) REFERENCES medicamento(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3659 (class 2606 OID 26644)
-- Name: composicao_substancia_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY composicao
    ADD CONSTRAINT composicao_substancia_id_fkey FOREIGN KEY (substancia_id) REFERENCES substancia(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3660 (class 2606 OID 26649)
-- Name: forma_farmaceutica_medicamento_forma_farmaceutica_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY forma_farmaceutica_medicamento
    ADD CONSTRAINT forma_farmaceutica_medicamento_forma_farmaceutica_id_fkey FOREIGN KEY (forma_farmaceutica_id) REFERENCES forma_farmaceutica(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3661 (class 2606 OID 26654)
-- Name: forma_farmaceutica_medicamento_medicamento_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY forma_farmaceutica_medicamento
    ADD CONSTRAINT forma_farmaceutica_medicamento_medicamento_id_fkey FOREIGN KEY (medicamento_id) REFERENCES medicamento(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3662 (class 2606 OID 26659)
-- Name: foto_medicamento_material_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY foto_material
    ADD CONSTRAINT foto_medicamento_material_id_fkey FOREIGN KEY (material_id) REFERENCES material(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3663 (class 2606 OID 26664)
-- Name: lote_material_fabricante_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY lote_material
    ADD CONSTRAINT lote_material_fabricante_id_fkey FOREIGN KEY (fabricante_id) REFERENCES cadastro_unico_pessoal.pessoa_juridica(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3664 (class 2606 OID 26669)
-- Name: lote_material_fornecedor_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY lote_material
    ADD CONSTRAINT lote_material_fornecedor_id_fkey FOREIGN KEY (fornecedor_id) REFERENCES cadastro_unico_pessoal.pessoa_juridica(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3665 (class 2606 OID 26674)
-- Name: lote_medicamento_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY lote_medicamento
    ADD CONSTRAINT lote_medicamento_id_fkey FOREIGN KEY (id) REFERENCES lote_material(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3666 (class 2606 OID 26679)
-- Name: material_tipo_material_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY material
    ADD CONSTRAINT material_tipo_material_id_fkey FOREIGN KEY (tipo_material_id) REFERENCES tipo_material(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3667 (class 2606 OID 26684)
-- Name: medicamento_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY medicamento
    ADD CONSTRAINT medicamento_id_fkey FOREIGN KEY (id) REFERENCES material(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3669 (class 2606 OID 26689)
-- Name: principio_ativo_medicamento_medicamento_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY principio_ativo_medicamento
    ADD CONSTRAINT principio_ativo_medicamento_medicamento_id_fkey FOREIGN KEY (medicamento_id) REFERENCES medicamento(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3670 (class 2606 OID 26694)
-- Name: principio_ativo_medicamento_principio_ativo_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY principio_ativo_medicamento
    ADD CONSTRAINT principio_ativo_medicamento_principio_ativo_id_fkey FOREIGN KEY (principio_ativo_id) REFERENCES principio_ativo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3668 (class 2606 OID 26699)
-- Name: principio_ativo_tipo_principio_ativo_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY principio_ativo
    ADD CONSTRAINT principio_ativo_tipo_principio_ativo_id_fkey FOREIGN KEY (tipo_principio_ativo_id) REFERENCES tipo_principio_ativo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3671 (class 2606 OID 26704)
-- Name: remessa_almoxarifado_destino_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY remessa
    ADD CONSTRAINT remessa_almoxarifado_destino_id_fkey FOREIGN KEY (almoxarifado_destino_id) REFERENCES almoxarifado(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3672 (class 2606 OID 26709)
-- Name: remessa_almoxarifado_origem_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY remessa
    ADD CONSTRAINT remessa_almoxarifado_origem_id_fkey FOREIGN KEY (almoxarifado_origem_id) REFERENCES almoxarifado(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3673 (class 2606 OID 26714)
-- Name: remessa_cidadao_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY remessa
    ADD CONSTRAINT remessa_cidadao_id_fkey FOREIGN KEY (cidadao_id) REFERENCES cadastro_unico_pessoal.cidadao(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3674 (class 2606 OID 26719)
-- Name: remessa_funcionario_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY remessa
    ADD CONSTRAINT remessa_funcionario_id_fkey FOREIGN KEY (funcionario_id) REFERENCES cadastro_unico_pessoal.funcionario(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3675 (class 2606 OID 26724)
-- Name: remessa_lote_material_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY remessa
    ADD CONSTRAINT remessa_lote_material_id_fkey FOREIGN KEY (lote_material_id) REFERENCES lote_material(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3676 (class 2606 OID 26729)
-- Name: remessa_medicamento_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY remessa_medicamento
    ADD CONSTRAINT remessa_medicamento_id_fkey FOREIGN KEY (id) REFERENCES remessa(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3677 (class 2606 OID 26734)
-- Name: unidade_de_saude_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_almoxarifado; Owner: admin_db_sr
--

ALTER TABLE ONLY unidade_de_saude
    ADD CONSTRAINT unidade_de_saude_id_fkey FOREIGN KEY (id) REFERENCES almoxarifado(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = cadastro_unico_atendimento, pg_catalog;

--
-- TOC entry 3678 (class 2606 OID 26739)
-- Name: atendimento_balcao_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

ALTER TABLE ONLY atendimento
    ADD CONSTRAINT atendimento_balcao_id_fkey FOREIGN KEY (balcao_id) REFERENCES balcao(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3679 (class 2606 OID 26744)
-- Name: atendimento_ticket_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

ALTER TABLE ONLY atendimento
    ADD CONSTRAINT atendimento_ticket_id_fkey FOREIGN KEY (ticket_id) REFERENCES ticket(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3680 (class 2606 OID 26749)
-- Name: balcao_fila_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

ALTER TABLE ONLY balcao
    ADD CONSTRAINT balcao_fila_id_fkey FOREIGN KEY (fila_id) REFERENCES fila(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3681 (class 2606 OID 26754)
-- Name: lotacao_balconista_balcao_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

ALTER TABLE ONLY lotacao_balconista
    ADD CONSTRAINT lotacao_balconista_balcao_id_fkey FOREIGN KEY (balcao_id) REFERENCES balcao(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3682 (class 2606 OID 26759)
-- Name: lotacao_balconista_funcionario_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

ALTER TABLE ONLY lotacao_balconista
    ADD CONSTRAINT lotacao_balconista_funcionario_id_fkey FOREIGN KEY (funcionario_id) REFERENCES cadastro_unico_pessoal.funcionario(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3683 (class 2606 OID 26764)
-- Name: lotacao_gerente_fila_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

ALTER TABLE ONLY lotacao_gerente
    ADD CONSTRAINT lotacao_gerente_fila_id_fkey FOREIGN KEY (fila_id) REFERENCES fila(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3684 (class 2606 OID 26769)
-- Name: lotacao_gerente_funcionario_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

ALTER TABLE ONLY lotacao_gerente
    ADD CONSTRAINT lotacao_gerente_funcionario_id_fkey FOREIGN KEY (funcionario_id) REFERENCES cadastro_unico_pessoal.funcionario(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3685 (class 2606 OID 26774)
-- Name: ticket_cidadao_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

ALTER TABLE ONLY ticket
    ADD CONSTRAINT ticket_cidadao_id_fkey FOREIGN KEY (cidadao_id) REFERENCES cadastro_unico_pessoal.cidadao(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3686 (class 2606 OID 26779)
-- Name: ticket_tipo_ticket_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_atendimento; Owner: admin_db_sr
--

ALTER TABLE ONLY ticket
    ADD CONSTRAINT ticket_tipo_ticket_id_fkey FOREIGN KEY (tipo_ticket_id) REFERENCES tipo_ticket(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = cadastro_unico_infraestrutura_basica, pg_catalog;

--
-- TOC entry 3687 (class 2606 OID 26784)
-- Name: infra_estrutura_arborizacao_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER TABLE ONLY infra_estrutura
    ADD CONSTRAINT infra_estrutura_arborizacao_id_fkey FOREIGN KEY (arborizacao_id) REFERENCES arborizacao(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3688 (class 2606 OID 26789)
-- Name: infra_estrutura_coleta_de_lixo_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER TABLE ONLY infra_estrutura
    ADD CONSTRAINT infra_estrutura_coleta_de_lixo_id_fkey FOREIGN KEY (coleta_de_lixo_id) REFERENCES coleta_de_lixo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3689 (class 2606 OID 26794)
-- Name: infra_estrutura_galeria_pluvial_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER TABLE ONLY infra_estrutura
    ADD CONSTRAINT infra_estrutura_galeria_pluvial_id_fkey FOREIGN KEY (galeria_pluvial_id) REFERENCES galeria_pluvial(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3690 (class 2606 OID 26799)
-- Name: infra_estrutura_guias_sargetas_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER TABLE ONLY infra_estrutura
    ADD CONSTRAINT infra_estrutura_guias_sargetas_id_fkey FOREIGN KEY (guias_sargetas_id) REFERENCES guias_sargetas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3691 (class 2606 OID 26804)
-- Name: infra_estrutura_iluminacao_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER TABLE ONLY infra_estrutura
    ADD CONSTRAINT infra_estrutura_iluminacao_id_fkey FOREIGN KEY (iluminacao_id) REFERENCES iluminacao(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3692 (class 2606 OID 26809)
-- Name: infra_estrutura_limpeza_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER TABLE ONLY infra_estrutura
    ADD CONSTRAINT infra_estrutura_limpeza_id_fkey FOREIGN KEY (limpeza_id) REFERENCES limpeza(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3693 (class 2606 OID 26814)
-- Name: infra_estrutura_pavimentacao_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER TABLE ONLY infra_estrutura
    ADD CONSTRAINT infra_estrutura_pavimentacao_id_fkey FOREIGN KEY (pavimentacao_id) REFERENCES pavimentacao(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3694 (class 2606 OID 26819)
-- Name: infra_estrutura_rede_de_agua_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER TABLE ONLY infra_estrutura
    ADD CONSTRAINT infra_estrutura_rede_de_agua_id_fkey FOREIGN KEY (rede_de_agua_id) REFERENCES rede_de_agua(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3695 (class 2606 OID 26824)
-- Name: infra_estrutura_rede_de_esgoto_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER TABLE ONLY infra_estrutura
    ADD CONSTRAINT infra_estrutura_rede_de_esgoto_id_fkey FOREIGN KEY (rede_de_esgoto_id) REFERENCES rede_de_esgoto(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3696 (class 2606 OID 26829)
-- Name: infra_estrutura_rede_de_telefone_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER TABLE ONLY infra_estrutura
    ADD CONSTRAINT infra_estrutura_rede_de_telefone_id_fkey FOREIGN KEY (rede_de_telefone_id) REFERENCES rede_de_telefone(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3697 (class 2606 OID 26834)
-- Name: infra_estrutura_trecho_de_logradouro_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_infraestrutura_basica; Owner: admin_db_sr
--

ALTER TABLE ONLY infra_estrutura
    ADD CONSTRAINT infra_estrutura_trecho_de_logradouro_id_fkey FOREIGN KEY (trecho_de_logradouro_id) REFERENCES cadastro_unico_localizacao.trecho_de_logradouro(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = cadastro_unico_localizacao, pg_catalog;

--
-- TOC entry 3698 (class 2606 OID 26839)
-- Name: bairro_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY bairro
    ADD CONSTRAINT bairro_id_fkey FOREIGN KEY (id) REFERENCES divisao_administrativa(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3699 (class 2606 OID 26844)
-- Name: bairro_municipio_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY bairro
    ADD CONSTRAINT bairro_municipio_fkey FOREIGN KEY (municipio_id) REFERENCES municipio(id);


--
-- TOC entry 3700 (class 2606 OID 26849)
-- Name: comercial_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY comercial
    ADD CONSTRAINT comercial_id_fkey FOREIGN KEY (id) REFERENCES unidade_edificada(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3701 (class 2606 OID 26854)
-- Name: cruzamento_intersecao_dois_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY cruzamento
    ADD CONSTRAINT cruzamento_intersecao_dois_id_fkey FOREIGN KEY (intersecao_dois_id) REFERENCES logradouro(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3702 (class 2606 OID 26859)
-- Name: cruzamento_intersecao_um_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY cruzamento
    ADD CONSTRAINT cruzamento_intersecao_um_id_fkey FOREIGN KEY (intersecao_um_id) REFERENCES logradouro(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3703 (class 2606 OID 26864)
-- Name: distrito_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY distrito
    ADD CONSTRAINT distrito_id_fkey FOREIGN KEY (id) REFERENCES divisao_administrativa(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3704 (class 2606 OID 26869)
-- Name: divisao_administrativa_municipio_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY divisao_administrativa
    ADD CONSTRAINT divisao_administrativa_municipio_id_fkey FOREIGN KEY (municipio_id) REFERENCES municipio(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3707 (class 2606 OID 26874)
-- Name: face_de_quadra_quadra_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY face_da_quadra
    ADD CONSTRAINT face_de_quadra_quadra_id_fkey FOREIGN KEY (quadra_id) REFERENCES quadra(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3705 (class 2606 OID 26879)
-- Name: fk5adcc454e8042102; Type: FK CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY estado_municipio
    ADD CONSTRAINT fk5adcc454e8042102 FOREIGN KEY (estado_municipio_id) REFERENCES estado(id);


--
-- TOC entry 3706 (class 2606 OID 26884)
-- Name: fk5adcc454ea24c024; Type: FK CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY estado_municipio
    ADD CONSTRAINT fk5adcc454ea24c024 FOREIGN KEY (municipio_id) REFERENCES municipio(id);


--
-- TOC entry 3720 (class 2606 OID 26889)
-- Name: fk7769ba5454c6cf0; Type: FK CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY tipo_logradouro_logradouro
    ADD CONSTRAINT fk7769ba5454c6cf0 FOREIGN KEY (logradouro_id) REFERENCES logradouro(id);


--
-- TOC entry 3721 (class 2606 OID 26894)
-- Name: fk7769ba547c57a264; Type: FK CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY tipo_logradouro_logradouro
    ADD CONSTRAINT fk7769ba547c57a264 FOREIGN KEY (tipo_logradouro_logradouro_id) REFERENCES tipo_logradouro(id);


--
-- TOC entry 3708 (class 2606 OID 26899)
-- Name: foto_lote_lote_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY foto_lote
    ADD CONSTRAINT foto_lote_lote_id_fkey FOREIGN KEY (lote_id) REFERENCES lote(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3709 (class 2606 OID 26904)
-- Name: foto_unidade_unificada_unidade_edificada_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY foto_unidade_edificada
    ADD CONSTRAINT foto_unidade_unificada_unidade_edificada_id_fkey FOREIGN KEY (unidade_edificada_id) REFERENCES unidade_edificada(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3710 (class 2606 OID 26909)
-- Name: industrial_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY industrial
    ADD CONSTRAINT industrial_id_fkey FOREIGN KEY (id) REFERENCES unidade_edificada(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3711 (class 2606 OID 26914)
-- Name: logradouro_tipo_logradouro_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY logradouro
    ADD CONSTRAINT logradouro_tipo_logradouro_id_fkey FOREIGN KEY (tipo_logradouro_id) REFERENCES tipo_logradouro(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3712 (class 2606 OID 26919)
-- Name: lote_bairro_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY lote
    ADD CONSTRAINT lote_bairro_id_fkey FOREIGN KEY (bairro_id) REFERENCES bairro(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3713 (class 2606 OID 26924)
-- Name: municipio_estado_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY municipio
    ADD CONSTRAINT municipio_estado_id_fkey FOREIGN KEY (estado_id) REFERENCES estado(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3714 (class 2606 OID 26929)
-- Name: quadra_setor_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY quadra
    ADD CONSTRAINT quadra_setor_id_fkey FOREIGN KEY (setor_id) REFERENCES setor(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3715 (class 2606 OID 26934)
-- Name: residencial_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY residencial
    ADD CONSTRAINT residencial_id_fkey FOREIGN KEY (id) REFERENCES unidade_edificada(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3716 (class 2606 OID 26939)
-- Name: setor_distrito_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY setor
    ADD CONSTRAINT setor_distrito_id_fkey FOREIGN KEY (distrito_id) REFERENCES distrito(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3717 (class 2606 OID 26944)
-- Name: testada_face_de_quadra_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY testada
    ADD CONSTRAINT testada_face_de_quadra_id_fkey FOREIGN KEY (face_de_quadra_id) REFERENCES face_da_quadra(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3718 (class 2606 OID 26949)
-- Name: testada_lote_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY testada
    ADD CONSTRAINT testada_lote_id_fkey FOREIGN KEY (lote_id) REFERENCES lote(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3719 (class 2606 OID 26954)
-- Name: testada_trecho_de_logradouro_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY testada
    ADD CONSTRAINT testada_trecho_de_logradouro_id_fkey FOREIGN KEY (trecho_de_logradouro_id) REFERENCES trecho_de_logradouro(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3722 (class 2606 OID 26959)
-- Name: trecho_de_logradouro_cruzamento_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY trecho_de_logradouro
    ADD CONSTRAINT trecho_de_logradouro_cruzamento_id_fkey FOREIGN KEY (cruzamento_id) REFERENCES cruzamento(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3723 (class 2606 OID 26964)
-- Name: trecho_de_logradouro_logradouro_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY trecho_de_logradouro
    ADD CONSTRAINT trecho_de_logradouro_logradouro_id_fkey FOREIGN KEY (logradouro_id) REFERENCES logradouro(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3724 (class 2606 OID 26969)
-- Name: unidade_edificada_lote_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_localizacao; Owner: admin_db_sr
--

ALTER TABLE ONLY unidade_edificada
    ADD CONSTRAINT unidade_edificada_lote_id_fkey FOREIGN KEY (lote_id) REFERENCES lote(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = cadastro_unico_patrimonio, pg_catalog;

--
-- TOC entry 3725 (class 2606 OID 26974)
-- Name: abastecimento_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY abastecimento
    ADD CONSTRAINT abastecimento_id_fkey FOREIGN KEY (id) REFERENCES servico(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3726 (class 2606 OID 26979)
-- Name: ambulancia_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY ambulancia
    ADD CONSTRAINT ambulancia_id_fkey FOREIGN KEY (id) REFERENCES veiculo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3727 (class 2606 OID 26984)
-- Name: caminhao_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY caminhao
    ADD CONSTRAINT caminhao_id_fkey FOREIGN KEY (id) REFERENCES veiculo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3728 (class 2606 OID 26989)
-- Name: carro_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY carro
    ADD CONSTRAINT carro_id_fkey FOREIGN KEY (id) REFERENCES veiculo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3729 (class 2606 OID 26994)
-- Name: locacao_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY locacao
    ADD CONSTRAINT locacao_id_fkey FOREIGN KEY (id) REFERENCES servico(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3730 (class 2606 OID 26999)
-- Name: lotacao_bem_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY lotacao
    ADD CONSTRAINT lotacao_bem_id_fkey FOREIGN KEY (bem_id) REFERENCES bem(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3731 (class 2606 OID 27004)
-- Name: lotacao_organismo_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY lotacao
    ADD CONSTRAINT lotacao_organismo_id_fkey FOREIGN KEY (organismo_id) REFERENCES administracao_organizacao.organismo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3732 (class 2606 OID 27009)
-- Name: manutencao_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY manutencao
    ADD CONSTRAINT manutencao_id_fkey FOREIGN KEY (id) REFERENCES servico(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3733 (class 2606 OID 27014)
-- Name: moto_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY moto
    ADD CONSTRAINT moto_id_fkey FOREIGN KEY (id) REFERENCES veiculo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3734 (class 2606 OID 27019)
-- Name: multas_uso_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY multas
    ADD CONSTRAINT multas_uso_id_fkey FOREIGN KEY (uso_id) REFERENCES uso(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3735 (class 2606 OID 27024)
-- Name: onibus_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY onibus
    ADD CONSTRAINT onibus_id_fkey FOREIGN KEY (id) REFERENCES veiculo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3736 (class 2606 OID 27029)
-- Name: propriedade_de_bem_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY propriedade_de
    ADD CONSTRAINT propriedade_de_bem_id_fkey FOREIGN KEY (bem_id) REFERENCES bem(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3737 (class 2606 OID 27034)
-- Name: propriedade_de_pessoa_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY propriedade_de
    ADD CONSTRAINT propriedade_de_pessoa_id_fkey FOREIGN KEY (pessoa_id) REFERENCES cadastro_unico_pessoal.pessoa(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3738 (class 2606 OID 27039)
-- Name: servico_contrato_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY servico
    ADD CONSTRAINT servico_contrato_id_fkey FOREIGN KEY (contrato_id) REFERENCES cadastro_unico_pessoal.contrato(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3739 (class 2606 OID 27044)
-- Name: servico_veiculo_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY servico
    ADD CONSTRAINT servico_veiculo_id_fkey FOREIGN KEY (veiculo_id) REFERENCES veiculo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3740 (class 2606 OID 27049)
-- Name: trator_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY trator
    ADD CONSTRAINT trator_id_fkey FOREIGN KEY (id) REFERENCES veiculo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3741 (class 2606 OID 27054)
-- Name: uso_garagem_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY uso
    ADD CONSTRAINT uso_garagem_id_fkey FOREIGN KEY (garagem_id) REFERENCES garagem(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3742 (class 2606 OID 27059)
-- Name: uso_motorista_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY uso
    ADD CONSTRAINT uso_motorista_id_fkey FOREIGN KEY (motorista_id) REFERENCES cadastro_unico_pessoal.motorista(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3743 (class 2606 OID 27064)
-- Name: uso_veiculo_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY uso
    ADD CONSTRAINT uso_veiculo_id_fkey FOREIGN KEY (veiculo_id) REFERENCES veiculo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3744 (class 2606 OID 27069)
-- Name: veiculo_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_patrimonio; Owner: admin_db_sr
--

ALTER TABLE ONLY veiculo
    ADD CONSTRAINT veiculo_id_fkey FOREIGN KEY (id) REFERENCES bem(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = cadastro_unico_pessoal, pg_catalog;

--
-- TOC entry 3745 (class 2606 OID 27074)
-- Name: aditivo_contrato_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY aditivo
    ADD CONSTRAINT aditivo_contrato_id_fkey FOREIGN KEY (contrato_id) REFERENCES contrato(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3746 (class 2606 OID 27079)
-- Name: aluno_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY aluno
    ADD CONSTRAINT aluno_id_fkey FOREIGN KEY (id) REFERENCES cidadao(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3747 (class 2606 OID 27084)
-- Name: cidadao_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY cidadao
    ADD CONSTRAINT cidadao_id_fkey FOREIGN KEY (id) REFERENCES pessoa_fisica(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3748 (class 2606 OID 27089)
-- Name: contato_pessoa_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY contato
    ADD CONSTRAINT contato_pessoa_id_fkey FOREIGN KEY (pessoa_id) REFERENCES pessoa(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3749 (class 2606 OID 27094)
-- Name: contato_tipo_contato_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY contato
    ADD CONSTRAINT contato_tipo_contato_id_fkey FOREIGN KEY (tipo_contato_id) REFERENCES tipo_contato(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3750 (class 2606 OID 27099)
-- Name: contrato_fornecedor_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY contrato
    ADD CONSTRAINT contrato_fornecedor_id_fkey FOREIGN KEY (fornecedor_id) REFERENCES fornecedor(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3751 (class 2606 OID 27104)
-- Name: contrato_organismo_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY contrato
    ADD CONSTRAINT contrato_organismo_id_fkey FOREIGN KEY (organismo_id) REFERENCES administracao_organizacao.organismo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3752 (class 2606 OID 27109)
-- Name: dados_bancarios_pessoa_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY dados_bancarios
    ADD CONSTRAINT dados_bancarios_pessoa_id_fkey FOREIGN KEY (pessoa_id) REFERENCES pessoa(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3753 (class 2606 OID 27114)
-- Name: detem_propriedade_cidadao_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY detem_propriedade
    ADD CONSTRAINT detem_propriedade_cidadao_id_fkey FOREIGN KEY (cidadao_id) REFERENCES cidadao(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3754 (class 2606 OID 27119)
-- Name: detem_propriedade_unidade_edificada_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY detem_propriedade
    ADD CONSTRAINT detem_propriedade_unidade_edificada_id_fkey FOREIGN KEY (unidade_edificada_id) REFERENCES cadastro_unico_localizacao.unidade_edificada(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3755 (class 2606 OID 27124)
-- Name: editora_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY editora
    ADD CONSTRAINT editora_id_fkey FOREIGN KEY (id) REFERENCES pessoa_juridica(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3756 (class 2606 OID 27129)
-- Name: escola_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY escola
    ADD CONSTRAINT escola_id_fkey FOREIGN KEY (id) REFERENCES pessoa_juridica(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3757 (class 2606 OID 27134)
-- Name: fonecedor_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY fornecedor
    ADD CONSTRAINT fonecedor_id_fkey FOREIGN KEY (id) REFERENCES pessoa_juridica(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3758 (class 2606 OID 27139)
-- Name: fornecedor_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY fornecedor
    ADD CONSTRAINT fornecedor_id_fkey FOREIGN KEY (id) REFERENCES pessoa_juridica(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3759 (class 2606 OID 27144)
-- Name: funcionario_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT funcionario_id_fkey FOREIGN KEY (id) REFERENCES cidadao(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3760 (class 2606 OID 27149)
-- Name: motorista_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY motorista
    ADD CONSTRAINT motorista_id_fkey FOREIGN KEY (id) REFERENCES funcionario(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3761 (class 2606 OID 27154)
-- Name: paciente_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY paciente
    ADD CONSTRAINT paciente_id_fkey FOREIGN KEY (id) REFERENCES pessoa_fisica(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3762 (class 2606 OID 27159)
-- Name: parentesco_pessoa_fisica_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY parentesco
    ADD CONSTRAINT parentesco_pessoa_fisica_id_fkey FOREIGN KEY (pessoa_fisica_id) REFERENCES pessoa_fisica(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3764 (class 2606 OID 27164)
-- Name: pessoa_fisica_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY pessoa_fisica
    ADD CONSTRAINT pessoa_fisica_id_fkey FOREIGN KEY (id) REFERENCES pessoa(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3763 (class 2606 OID 27530)
-- Name: pessoa_id_key; Type: FK CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY parentesco
    ADD CONSTRAINT pessoa_id_key FOREIGN KEY (pessoa_id) REFERENCES pessoa(id);


--
-- TOC entry 3765 (class 2606 OID 27169)
-- Name: pessoa_juridica_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY pessoa_juridica
    ADD CONSTRAINT pessoa_juridica_id_fkey FOREIGN KEY (id) REFERENCES pessoa(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3766 (class 2606 OID 27174)
-- Name: prefeitura_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY prefeitura
    ADD CONSTRAINT prefeitura_id_fkey FOREIGN KEY (id) REFERENCES pessoa_juridica(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3767 (class 2606 OID 27179)
-- Name: professor_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY professor
    ADD CONSTRAINT professor_id_fkey FOREIGN KEY (id) REFERENCES funcionario(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3768 (class 2606 OID 27184)
-- Name: reside_bairro_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY reside
    ADD CONSTRAINT reside_bairro_id_fkey FOREIGN KEY (bairro_id) REFERENCES cadastro_unico_localizacao.bairro(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3769 (class 2606 OID 27189)
-- Name: reside_logradouro_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY reside
    ADD CONSTRAINT reside_logradouro_id_fkey FOREIGN KEY (logradouro_id) REFERENCES cadastro_unico_localizacao.logradouro(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3770 (class 2606 OID 27194)
-- Name: reside_pessoa_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_pessoal; Owner: admin_db_sr
--

ALTER TABLE ONLY reside
    ADD CONSTRAINT reside_pessoa_id_fkey FOREIGN KEY (pessoa_id) REFERENCES pessoa(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = cadastro_unico_protocolo, pg_catalog;

--
-- TOC entry 3771 (class 2606 OID 27199)
-- Name: item_lote_item_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_protocolo; Owner: admin_db_sr
--

ALTER TABLE ONLY item
    ADD CONSTRAINT item_lote_item_id_fkey FOREIGN KEY (lote_item_id) REFERENCES lote_item(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3772 (class 2606 OID 27204)
-- Name: movimentacao_destino_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_protocolo; Owner: admin_db_sr
--

ALTER TABLE ONLY movimentacao
    ADD CONSTRAINT movimentacao_destino_id_fkey FOREIGN KEY (destino_id) REFERENCES administracao_organizacao.cargo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3773 (class 2606 OID 27209)
-- Name: movimentacao_lote_item_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_protocolo; Owner: admin_db_sr
--

ALTER TABLE ONLY movimentacao
    ADD CONSTRAINT movimentacao_lote_item_id_fkey FOREIGN KEY (lote_item_id) REFERENCES lote_item(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3774 (class 2606 OID 27214)
-- Name: movimentacao_origem_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_protocolo; Owner: admin_db_sr
--

ALTER TABLE ONLY movimentacao
    ADD CONSTRAINT movimentacao_origem_id_fkey FOREIGN KEY (origem_id) REFERENCES administracao_organizacao.cargo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3775 (class 2606 OID 27219)
-- Name: movimentacao_tratamento_id_fkey; Type: FK CONSTRAINT; Schema: cadastro_unico_protocolo; Owner: admin_db_sr
--

ALTER TABLE ONLY movimentacao
    ADD CONSTRAINT movimentacao_tratamento_id_fkey FOREIGN KEY (tratamento_id) REFERENCES tratamento(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = controle_de_acesso_a_dado, pg_catalog;

--
-- TOC entry 3776 (class 2606 OID 27224)
-- Name: mapa_de_acesso_pessoa_id_fkey; Type: FK CONSTRAINT; Schema: controle_de_acesso_a_dado; Owner: admin_db_sr
--

ALTER TABLE ONLY mapa_de_acesso
    ADD CONSTRAINT mapa_de_acesso_pessoa_id_fkey FOREIGN KEY (pessoa_id) REFERENCES cadastro_unico_pessoal.pessoa(id);


SET search_path = educacao_academico, pg_catalog;

--
-- TOC entry 3780 (class 2606 OID 27229)
-- Name: conteudo_da_disciplina_disciplina_id_fkey; Type: FK CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY conteudo_da_disciplina
    ADD CONSTRAINT conteudo_da_disciplina_disciplina_id_fkey FOREIGN KEY (disciplina_id) REFERENCES disciplina(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3793 (class 2606 OID 27234)
-- Name: escola_id; Type: FK CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY turma
    ADD CONSTRAINT escola_id FOREIGN KEY (escola_id) REFERENCES cadastro_unico_pessoal.escola(id);


--
-- TOC entry 3778 (class 2606 OID 27239)
-- Name: fk2ddca94ed54a1e; Type: FK CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY aula
    ADD CONSTRAINT fk2ddca94ed54a1e FOREIGN KEY (tipo_aula_id) REFERENCES tipo_aula(id);


--
-- TOC entry 3779 (class 2606 OID 27244)
-- Name: fk2ddca965d659cb; Type: FK CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY aula
    ADD CONSTRAINT fk2ddca965d659cb FOREIGN KEY (turma_disciplina_id) REFERENCES turma_disciplina(id);


--
-- TOC entry 3790 (class 2606 OID 27249)
-- Name: fk33afee4a41bf20; Type: FK CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY nota
    ADD CONSTRAINT fk33afee4a41bf20 FOREIGN KEY (matricula_id) REFERENCES matricula(id);


--
-- TOC entry 3791 (class 2606 OID 27254)
-- Name: fk33afee6297a680; Type: FK CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY nota
    ADD CONSTRAINT fk33afee6297a680 FOREIGN KEY (atividade_id) REFERENCES atividade(id);


--
-- TOC entry 3789 (class 2606 OID 27259)
-- Name: fk54002a0f422afcef; Type: FK CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY matricula_nota
    ADD CONSTRAINT fk54002a0f422afcef FOREIGN KEY (matricula_nota_id) REFERENCES matricula(id);


--
-- TOC entry 3783 (class 2606 OID 27264)
-- Name: fk7e9d2495370adf34; Type: FK CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY frequencia
    ADD CONSTRAINT fk7e9d2495370adf34 FOREIGN KEY (aula_id) REFERENCES aula(id);


--
-- TOC entry 3784 (class 2606 OID 27269)
-- Name: fk7e9d24954a41bf20; Type: FK CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY frequencia
    ADD CONSTRAINT fk7e9d24954a41bf20 FOREIGN KEY (matricula_id) REFERENCES matricula(id);


--
-- TOC entry 3777 (class 2606 OID 27274)
-- Name: fkc1b71d0765d659cb; Type: FK CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY atividade
    ADD CONSTRAINT fkc1b71d0765d659cb FOREIGN KEY (turma_disciplina_id) REFERENCES turma_disciplina(id);


--
-- TOC entry 3785 (class 2606 OID 27279)
-- Name: horario_sala_id_fkey; Type: FK CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY horario
    ADD CONSTRAINT horario_sala_id_fkey FOREIGN KEY (sala_id) REFERENCES sala(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3786 (class 2606 OID 27284)
-- Name: horario_turma_disciplina_id_fkey; Type: FK CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY horario
    ADD CONSTRAINT horario_turma_disciplina_id_fkey FOREIGN KEY (turma_disciplina_id) REFERENCES turma_disciplina(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3781 (class 2606 OID 27289)
-- Name: leciona_disciplina_id_fkey; Type: FK CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY disciplina_lecionada_por_professor
    ADD CONSTRAINT leciona_disciplina_id_fkey FOREIGN KEY (disciplina_id) REFERENCES disciplina(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3782 (class 2606 OID 27294)
-- Name: leciona_professor_id_fkey; Type: FK CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY disciplina_lecionada_por_professor
    ADD CONSTRAINT leciona_professor_id_fkey FOREIGN KEY (professor_id) REFERENCES cadastro_unico_pessoal.professor(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3787 (class 2606 OID 27299)
-- Name: matricula_aluno_id_fkey; Type: FK CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY matricula
    ADD CONSTRAINT matricula_aluno_id_fkey FOREIGN KEY (aluno_id) REFERENCES cadastro_unico_pessoal.aluno(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3788 (class 2606 OID 27304)
-- Name: matricula_turma_id_fkey; Type: FK CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY matricula
    ADD CONSTRAINT matricula_turma_id_fkey FOREIGN KEY (turma_id) REFERENCES turma(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3792 (class 2606 OID 27309)
-- Name: sala_escola_id_fkey; Type: FK CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY sala
    ADD CONSTRAINT sala_escola_id_fkey FOREIGN KEY (escola_id) REFERENCES cadastro_unico_pessoal.escola(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3795 (class 2606 OID 27314)
-- Name: turma_disciplina_disciplina_lecionada_por_professor_id_fkey; Type: FK CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY turma_disciplina
    ADD CONSTRAINT turma_disciplina_disciplina_lecionada_por_professor_id_fkey FOREIGN KEY (disciplina_lecionada_por_professor_id) REFERENCES disciplina_lecionada_por_professor(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3796 (class 2606 OID 27319)
-- Name: turma_disciplina_turma_id_fkey; Type: FK CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY turma_disciplina
    ADD CONSTRAINT turma_disciplina_turma_id_fkey FOREIGN KEY (turma_id) REFERENCES turma(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3794 (class 2606 OID 27324)
-- Name: turma_serie_id_fkey; Type: FK CONSTRAINT; Schema: educacao_academico; Owner: admin_db_sr
--

ALTER TABLE ONLY turma
    ADD CONSTRAINT turma_serie_id_fkey FOREIGN KEY (serie_id) REFERENCES serie(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = educacao_biblioteca, pg_catalog;

--
-- TOC entry 3797 (class 2606 OID 27329)
-- Name: acervo_escola_id_fkey; Type: FK CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY acervo
    ADD CONSTRAINT acervo_escola_id_fkey FOREIGN KEY (escola_id) REFERENCES cadastro_unico_pessoal.escola(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3798 (class 2606 OID 27334)
-- Name: conteudo_didatica_conteudo_id_fkey; Type: FK CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY conteudo_didatica
    ADD CONSTRAINT conteudo_didatica_conteudo_id_fkey FOREIGN KEY (conteudo_id) REFERENCES conteudo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3799 (class 2606 OID 27339)
-- Name: conteudo_didatica_didatica_id_fkey; Type: FK CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY conteudo_didatica
    ADD CONSTRAINT conteudo_didatica_didatica_id_fkey FOREIGN KEY (didatica_id) REFERENCES didatica(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3800 (class 2606 OID 27344)
-- Name: didatica_id_fkey; Type: FK CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY didatica
    ADD CONSTRAINT didatica_id_fkey FOREIGN KEY (id) REFERENCES obra(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3801 (class 2606 OID 27349)
-- Name: edicao_obra_id_fkey; Type: FK CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY edicao
    ADD CONSTRAINT edicao_obra_id_fkey FOREIGN KEY (obra_id) REFERENCES obra(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3802 (class 2606 OID 27354)
-- Name: emprestimo_cidadao_id_fkey; Type: FK CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY emprestimo
    ADD CONSTRAINT emprestimo_cidadao_id_fkey FOREIGN KEY (cidadao_id) REFERENCES cadastro_unico_pessoal.cidadao(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3803 (class 2606 OID 27359)
-- Name: emprestimo_exemplar_id_fkey; Type: FK CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY emprestimo
    ADD CONSTRAINT emprestimo_exemplar_id_fkey FOREIGN KEY (exemplar_id) REFERENCES exemplar(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3804 (class 2606 OID 27364)
-- Name: emprestimo_funcionario_id_fkey; Type: FK CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY emprestimo
    ADD CONSTRAINT emprestimo_funcionario_id_fkey FOREIGN KEY (funcionario_id) REFERENCES cadastro_unico_pessoal.funcionario(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3805 (class 2606 OID 27369)
-- Name: estante_acervo_id_fkey; Type: FK CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY estante
    ADD CONSTRAINT estante_acervo_id_fkey FOREIGN KEY (acervo_id) REFERENCES acervo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3806 (class 2606 OID 27374)
-- Name: exemplar_obra_id_fkey; Type: FK CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY exemplar
    ADD CONSTRAINT exemplar_obra_id_fkey FOREIGN KEY (obra_id) REFERENCES obra(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3807 (class 2606 OID 27379)
-- Name: exemplar_prateleira_id_fkey; Type: FK CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY exemplar
    ADD CONSTRAINT exemplar_prateleira_id_fkey FOREIGN KEY (prateleira_id) REFERENCES prateleira(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3808 (class 2606 OID 27384)
-- Name: literaria_id_fkey; Type: FK CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY literaria
    ADD CONSTRAINT literaria_id_fkey FOREIGN KEY (id) REFERENCES obra(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3811 (class 2606 OID 27389)
-- Name: obra_autor_autor_id_fkey; Type: FK CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY obra_autor
    ADD CONSTRAINT obra_autor_autor_id_fkey FOREIGN KEY (autor_id) REFERENCES autor(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3812 (class 2606 OID 27394)
-- Name: obra_autor_obra_id_fkey; Type: FK CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY obra_autor
    ADD CONSTRAINT obra_autor_obra_id_fkey FOREIGN KEY (obra_id) REFERENCES obra(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3809 (class 2606 OID 27399)
-- Name: obra_editora_id_fkey; Type: FK CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY obra
    ADD CONSTRAINT obra_editora_id_fkey FOREIGN KEY (editora_id) REFERENCES cadastro_unico_pessoal.editora(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3810 (class 2606 OID 27404)
-- Name: obra_tipo_obra_id_fkey; Type: FK CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY obra
    ADD CONSTRAINT obra_tipo_obra_id_fkey FOREIGN KEY (tipo_obra_id) REFERENCES tipo_obra(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3813 (class 2606 OID 27409)
-- Name: prateleira_estante_id_fkey; Type: FK CONSTRAINT; Schema: educacao_biblioteca; Owner: admin_db_sr
--

ALTER TABLE ONLY prateleira
    ADD CONSTRAINT prateleira_estante_id_fkey FOREIGN KEY (estante_id) REFERENCES estante(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = login, pg_catalog;

--
-- TOC entry 3814 (class 2606 OID 27414)
-- Name: fk1ecb2d582842e2c1; Type: FK CONSTRAINT; Schema: login; Owner: admin_db_sr
--

ALTER TABLE ONLY grupo_usuario
    ADD CONSTRAINT fk1ecb2d582842e2c1 FOREIGN KEY (usuario_id) REFERENCES usuario(id);


--
-- TOC entry 3815 (class 2606 OID 27419)
-- Name: fk1ecb2d58b0305aa1; Type: FK CONSTRAINT; Schema: login; Owner: admin_db_sr
--

ALTER TABLE ONLY grupo_usuario
    ADD CONSTRAINT fk1ecb2d58b0305aa1 FOREIGN KEY (grupo_id) REFERENCES grupo(id);


--
-- TOC entry 3817 (class 2606 OID 27424)
-- Name: fkf814f32eef322e0d; Type: FK CONSTRAINT; Schema: login; Owner: admin_db_sr
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fkf814f32eef322e0d FOREIGN KEY (pessoa_id) REFERENCES cadastro_unico_pessoal.pessoa(id);


--
-- TOC entry 3816 (class 2606 OID 27429)
-- Name: permissao_grupo; Type: FK CONSTRAINT; Schema: login; Owner: admin_db_sr
--

ALTER TABLE ONLY permissao
    ADD CONSTRAINT permissao_grupo FOREIGN KEY (grupo_id) REFERENCES grupo(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = public, pg_catalog;

--
-- TOC entry 3819 (class 2606 OID 27434)
-- Name: fk229a25c280e6f17f; Type: FK CONSTRAINT; Schema: public; Owner: admin_db_sr
--

ALTER TABLE ONLY nota_disciplina_lecionada_por_professor
    ADD CONSTRAINT fk229a25c280e6f17f FOREIGN KEY (disciplina_lecionada_por_professor_id) REFERENCES educacao_academico.disciplina_lecionada_por_professor(id);


--
-- TOC entry 3818 (class 2606 OID 27439)
-- Name: fk625ad5a451c11c7; Type: FK CONSTRAINT; Schema: public; Owner: admin_db_sr
--

ALTER TABLE ONLY nota_aluno
    ADD CONSTRAINT fk625ad5a451c11c7 FOREIGN KEY (aluno_id) REFERENCES cadastro_unico_pessoal.aluno(id);


--
-- TOC entry 3820 (class 2606 OID 27444)
-- Name: fk73577d46bfa24c0; Type: FK CONSTRAINT; Schema: public; Owner: admin_db_sr
--

ALTER TABLE ONLY nota_turma
    ADD CONSTRAINT fk73577d46bfa24c0 FOREIGN KEY (turma_id) REFERENCES educacao_academico.turma(id);


--
-- TOC entry 3821 (class 2606 OID 27449)
-- Name: fkb1f755875ebcfcc6; Type: FK CONSTRAINT; Schema: public; Owner: admin_db_sr
--

ALTER TABLE ONLY sequence_number
    ADD CONSTRAINT fkb1f755875ebcfcc6 FOREIGN KEY (definition_id) REFERENCES sequence_definition(id);


SET search_path = saude_procedimento, pg_catalog;

--
-- TOC entry 3822 (class 2606 OID 27454)
-- Name: cbo_numero_procedimento_cbo_id_fkey; Type: FK CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER TABLE ONLY cbo_numero_procedimento
    ADD CONSTRAINT cbo_numero_procedimento_cbo_id_fkey FOREIGN KEY (cbo_id) REFERENCES cbo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3823 (class 2606 OID 27459)
-- Name: cbo_numero_procedimento_numero_procedimento_id_fkey; Type: FK CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER TABLE ONLY cbo_numero_procedimento
    ADD CONSTRAINT cbo_numero_procedimento_numero_procedimento_id_fkey FOREIGN KEY (numero_procedimento_id) REFERENCES numero_procedimento(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3824 (class 2606 OID 27464)
-- Name: executor_funcionario_id_fkey; Type: FK CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER TABLE ONLY executor
    ADD CONSTRAINT executor_funcionario_id_fkey FOREIGN KEY (funcionario_id) REFERENCES cadastro_unico_pessoal.funcionario(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3825 (class 2606 OID 27469)
-- Name: executor_procedimento_id_fkey; Type: FK CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER TABLE ONLY executor
    ADD CONSTRAINT executor_procedimento_id_fkey FOREIGN KEY (procedimento_id) REFERENCES procedimento(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3826 (class 2606 OID 27474)
-- Name: forma_de_organizacao_sub_grupo_id_fkey; Type: FK CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER TABLE ONLY forma_de_organizacao
    ADD CONSTRAINT forma_de_organizacao_sub_grupo_id_fkey FOREIGN KEY (sub_grupo_id) REFERENCES sub_grupo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3827 (class 2606 OID 27479)
-- Name: material_procedimento_material_id_fkey; Type: FK CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER TABLE ONLY material_procedimento
    ADD CONSTRAINT material_procedimento_material_id_fkey FOREIGN KEY (material_id) REFERENCES cadastro_unico_almoxarifado.material(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3828 (class 2606 OID 27484)
-- Name: material_procedimento_procedimento_id_fkey; Type: FK CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER TABLE ONLY material_procedimento
    ADD CONSTRAINT material_procedimento_procedimento_id_fkey FOREIGN KEY (procedimento_id) REFERENCES procedimento(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3829 (class 2606 OID 27489)
-- Name: numero_procedimento_forma_de_organizacao_id_fkey; Type: FK CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER TABLE ONLY numero_procedimento
    ADD CONSTRAINT numero_procedimento_forma_de_organizacao_id_fkey FOREIGN KEY (forma_de_organizacao_id) REFERENCES forma_de_organizacao(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3830 (class 2606 OID 27494)
-- Name: procedimento_lugar_id_fkey; Type: FK CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER TABLE ONLY procedimento
    ADD CONSTRAINT procedimento_lugar_id_fkey FOREIGN KEY (lugar_id) REFERENCES lugar(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3831 (class 2606 OID 27499)
-- Name: procedimento_numero_procedimento_id_fkey; Type: FK CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER TABLE ONLY procedimento
    ADD CONSTRAINT procedimento_numero_procedimento_id_fkey FOREIGN KEY (numero_procedimento_id) REFERENCES numero_procedimento(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3834 (class 2606 OID 27504)
-- Name: procedimento_paciente_paciente_id_fkey; Type: FK CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER TABLE ONLY procedimento_paciente
    ADD CONSTRAINT procedimento_paciente_paciente_id_fkey FOREIGN KEY (paciente_id) REFERENCES cadastro_unico_pessoal.paciente(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3835 (class 2606 OID 27509)
-- Name: procedimento_paciente_procedimento_id_fkey; Type: FK CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER TABLE ONLY procedimento_paciente
    ADD CONSTRAINT procedimento_paciente_procedimento_id_fkey FOREIGN KEY (procedimento_id) REFERENCES procedimento(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3832 (class 2606 OID 27514)
-- Name: procedimento_procedimento_id_fkey; Type: FK CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER TABLE ONLY procedimento
    ADD CONSTRAINT procedimento_procedimento_id_fkey FOREIGN KEY (procedimento_id) REFERENCES procedimento(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3833 (class 2606 OID 27519)
-- Name: procedimento_tipo_procedimento_id_fkey; Type: FK CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER TABLE ONLY procedimento
    ADD CONSTRAINT procedimento_tipo_procedimento_id_fkey FOREIGN KEY (tipo_procedimento_id) REFERENCES tipo_procedimento(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3836 (class 2606 OID 27524)
-- Name: sub_grupo_grupo_id_fkey; Type: FK CONSTRAINT; Schema: saude_procedimento; Owner: admin_db_sr
--

ALTER TABLE ONLY sub_grupo
    ADD CONSTRAINT sub_grupo_grupo_id_fkey FOREIGN KEY (grupo_id) REFERENCES grupo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4279 (class 0 OID 0)
-- Dependencies: 20
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-07-23 16:22:50

--
-- PostgreSQL database dump complete
--

