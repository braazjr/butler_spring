--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

-- Started on 2018-05-19 20:16:41

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3088 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 16394)
-- Name: apartamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.apartamento (
    id bigint NOT NULL,
    data_hora_cadastro timestamp without time zone,
    data_hora_modificacao timestamp without time zone,
    id_usuario bigint NOT NULL,
    ativo boolean NOT NULL,
    numero character varying(15) NOT NULL,
    id_bloco bigint NOT NULL,
    numero_quartos integer
);


ALTER TABLE public.apartamento OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16701)
-- Name: apartamento_morador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.apartamento_morador (
    id_morador bigint NOT NULL,
    id_apartamento bigint NOT NULL
);


ALTER TABLE public.apartamento_morador OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16402)
-- Name: bloco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bloco (
    id bigint NOT NULL,
    data_hora_cadastro timestamp without time zone,
    data_hora_modificacao timestamp without time zone,
    id_usuario bigint NOT NULL,
    ativo boolean,
    nome character varying(25) NOT NULL,
    numero integer,
    id_condominio bigint NOT NULL
);


ALTER TABLE public.bloco OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 25070)
-- Name: bloco_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bloco_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bloco_id_seq OWNER TO postgres;

--
-- TOC entry 3089 (class 0 OID 0)
-- Dependencies: 235
-- Name: bloco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bloco_id_seq OWNED BY public.bloco.id;


--
-- TOC entry 198 (class 1259 OID 16407)
-- Name: condominio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.condominio (
    id bigint NOT NULL,
    data_hora_cadastro timestamp without time zone,
    data_hora_modificacao timestamp without time zone,
    id_usuario bigint NOT NULL,
    ativo boolean NOT NULL,
    bairro character varying(30) NOT NULL,
    cep character varying(9) NOT NULL,
    cidade character varying(30) NOT NULL,
    complemento character varying(50),
    email character varying(50),
    estado character varying(20) NOT NULL,
    numero integer,
    rua character varying(50) NOT NULL,
    telefone character varying(13) NOT NULL,
    nome character varying(30) NOT NULL,
    id_construtora bigint NOT NULL
);


ALTER TABLE public.condominio OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 25067)
-- Name: condominio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.condominio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.condominio_id_seq OWNER TO postgres;

--
-- TOC entry 3090 (class 0 OID 0)
-- Dependencies: 234
-- Name: condominio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.condominio_id_seq OWNED BY public.condominio.id;


--
-- TOC entry 199 (class 1259 OID 16412)
-- Name: construtora; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.construtora (
    id bigint NOT NULL,
    data_hora_cadastro timestamp without time zone,
    data_hora_modificacao timestamp without time zone,
    id_usuario bigint NOT NULL,
    ativo boolean NOT NULL,
    bairro character varying(30) NOT NULL,
    cep character varying(9) NOT NULL,
    cidade character varying(30) NOT NULL,
    complemento character varying(50),
    email character varying(50),
    estado character varying(20) NOT NULL,
    numero integer,
    rua character varying(50) NOT NULL,
    telefone character varying(13) NOT NULL,
    cnpj character varying(18) NOT NULL,
    nome_fantasia character varying(50) NOT NULL,
    nome_social character varying(50) NOT NULL,
    id_empresa bigint NOT NULL
);


ALTER TABLE public.construtora OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 25064)
-- Name: construtora_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.construtora_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.construtora_id_seq OWNER TO postgres;

--
-- TOC entry 3091 (class 0 OID 0)
-- Dependencies: 233
-- Name: construtora_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.construtora_id_seq OWNED BY public.construtora.id;


--
-- TOC entry 220 (class 1259 OID 24956)
-- Name: documento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documento (
    id bigint NOT NULL,
    data_hora_cadastro timestamp without time zone,
    data_hora_modificacao timestamp without time zone,
    nome character varying(50) NOT NULL,
    path character varying(255) NOT NULL,
    id_apartamento bigint NOT NULL,
    id_usuario bigint NOT NULL
);


ALTER TABLE public.documento OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24954)
-- Name: documento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.documento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documento_id_seq OWNER TO postgres;

--
-- TOC entry 3092 (class 0 OID 0)
-- Dependencies: 219
-- Name: documento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.documento_id_seq OWNED BY public.documento.id;


--
-- TOC entry 200 (class 1259 OID 16417)
-- Name: documentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documentos (
    id bigint NOT NULL,
    data_hora_cadastro timestamp without time zone,
    data_hora_modificacao timestamp without time zone,
    id_usuario bigint NOT NULL,
    nome character varying(50) NOT NULL,
    path character varying(100) NOT NULL
);


ALTER TABLE public.documentos OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16422)
-- Name: empresa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empresa (
    id bigint NOT NULL,
    data_hora_cadastro timestamp without time zone,
    data_hora_modificacao timestamp without time zone,
    id_usuario bigint NOT NULL,
    ativo boolean NOT NULL,
    bairro character varying(30) NOT NULL,
    cep character varying(9) NOT NULL,
    cidade character varying(30) NOT NULL,
    complemento character varying(50),
    email character varying(50),
    estado character varying(20) NOT NULL,
    numero integer,
    rua character varying(50) NOT NULL,
    telefone character varying(13) NOT NULL,
    cnpj character varying(18) NOT NULL,
    nome_fantasia character varying(50) NOT NULL,
    nome_social character varying(50) NOT NULL
);


ALTER TABLE public.empresa OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 25061)
-- Name: empresa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empresa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empresa_id_seq OWNER TO postgres;

--
-- TOC entry 3093 (class 0 OID 0)
-- Dependencies: 232
-- Name: empresa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.empresa_id_seq OWNED BY public.empresa.id;


--
-- TOC entry 222 (class 1259 OID 24964)
-- Name: evento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evento (
    id bigint NOT NULL,
    conteudo character varying(255) NOT NULL,
    data_hora_cadastro timestamp without time zone,
    data_hora_modificacao timestamp without time zone,
    titulo character varying(50) NOT NULL,
    id_usuario bigint NOT NULL
);


ALTER TABLE public.evento OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24962)
-- Name: evento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.evento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evento_id_seq OWNER TO postgres;

--
-- TOC entry 3094 (class 0 OID 0)
-- Dependencies: 221
-- Name: evento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.evento_id_seq OWNED BY public.evento.id;


--
-- TOC entry 202 (class 1259 OID 16427)
-- Name: eventos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eventos (
    id bigint NOT NULL,
    data_hora_cadastro timestamp without time zone,
    data_hora_modificacao timestamp without time zone,
    id_usuario bigint NOT NULL,
    conteudo character varying(255) NOT NULL,
    titulo character varying(50) NOT NULL
);


ALTER TABLE public.eventos OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16432)
-- Name: faq; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faq (
    id bigint NOT NULL,
    data_hora_cadastro timestamp without time zone,
    data_hora_modificacao timestamp without time zone,
    id_usuario bigint NOT NULL,
    pergunta character varying(255) NOT NULL,
    resposta character varying(255) NOT NULL
);


ALTER TABLE public.faq OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16440)
-- Name: fotos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fotos (
    id bigint NOT NULL,
    data_hora_cadastro timestamp without time zone,
    data_hora_modificacao timestamp without time zone,
    id_usuario bigint NOT NULL,
    path character varying(100) NOT NULL
);


ALTER TABLE public.fotos OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16445)
-- Name: morador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.morador (
    id bigint NOT NULL,
    data_hora_cadastro timestamp without time zone,
    data_hora_modificacao timestamp without time zone,
    id_usuario bigint NOT NULL,
    ativo boolean,
    celular character varying(14),
    documento character varying(20),
    email character varying(30),
    nome character varying(30) NOT NULL,
    observacao character varying(255),
    parentesco character varying(255),
    placa_carro character varying(8),
    telefone character varying(14),
    tipo_documento character varying(255),
    tipo_morador character varying(255),
    foto64 character varying(255)
);


ALTER TABLE public.morador OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24947)
-- Name: get_apartamentos_moradores; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.get_apartamentos_moradores AS
 SELECT am.id_apartamento,
    am.id_morador,
    a.numero AS numero_apartamento,
    m.documento AS documento_morador,
    m.nome AS nome_morador,
    m.tipo_morador,
    b.id AS id_bloco,
    b.nome AS nome_bloco,
    b.numero AS numero_bloco,
    cd.id AS id_condominio,
    cd.nome AS nome_condominio,
    ct.id AS id_construtora,
    ct.nome_fantasia AS nome_fantasia_construtora
   FROM public.apartamento_morador am,
    public.apartamento a,
    public.bloco b,
    public.condominio cd,
    public.construtora ct,
    public.morador m
  WHERE ((am.id_apartamento = a.id) AND (am.id_morador = m.id) AND (a.id_bloco = b.id) AND (b.id_condominio = cd.id) AND (cd.id_construtora = ct.id));


ALTER TABLE public.get_apartamentos_moradores OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16532)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 25058)
-- Name: morador_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.morador_id_seq
    START WITH 1554
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.morador_id_seq OWNER TO postgres;

--
-- TOC entry 3095 (class 0 OID 0)
-- Dependencies: 231
-- Name: morador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.morador_id_seq OWNED BY public.morador.id;


--
-- TOC entry 206 (class 1259 OID 16453)
-- Name: noticia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.noticia (
    id bigint NOT NULL,
    data_hora_cadastro timestamp without time zone,
    data_hora_modificacao timestamp without time zone,
    id_usuario bigint NOT NULL,
    conteudo character varying(255) NOT NULL,
    titulo character varying(100) NOT NULL
);


ALTER TABLE public.noticia OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 24972)
-- Name: parceiro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parceiro (
    id bigint NOT NULL,
    data_hora_cadastro timestamp without time zone,
    data_hora_modificacao timestamp without time zone,
    nome character varying(50) NOT NULL,
    path character varying(100) NOT NULL,
    id_usuario bigint NOT NULL
);


ALTER TABLE public.parceiro OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24970)
-- Name: parceiro_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.parceiro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parceiro_id_seq OWNER TO postgres;

--
-- TOC entry 3096 (class 0 OID 0)
-- Dependencies: 223
-- Name: parceiro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.parceiro_id_seq OWNED BY public.parceiro.id;


--
-- TOC entry 207 (class 1259 OID 16458)
-- Name: parceiros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parceiros (
    id bigint NOT NULL,
    data_hora_cadastro timestamp without time zone,
    data_hora_modificacao timestamp without time zone,
    id_usuario bigint NOT NULL,
    nome character varying(50) NOT NULL,
    path character varying(100) NOT NULL
);


ALTER TABLE public.parceiros OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16463)
-- Name: permissao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissao (
    codigo bigint NOT NULL,
    descricao character varying(255)
);


ALTER TABLE public.permissao OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16470)
-- Name: rota; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rota (
    id integer NOT NULL,
    ativo boolean NOT NULL,
    data_hora_cadastro timestamp without time zone,
    data_hora_modificacao timestamp without time zone,
    nome character varying(40) NOT NULL,
    id_usuario bigint NOT NULL
);


ALTER TABLE public.rota OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16468)
-- Name: rota_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rota_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rota_id_seq OWNER TO postgres;

--
-- TOC entry 3097 (class 0 OID 0)
-- Dependencies: 209
-- Name: rota_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rota_id_seq OWNED BY public.rota.id;


--
-- TOC entry 226 (class 1259 OID 24980)
-- Name: servico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servico (
    id bigint NOT NULL,
    conteudo character varying(255) NOT NULL,
    data_hora_cadastro timestamp without time zone,
    data_hora_modificacao timestamp without time zone,
    titulo character varying(50) NOT NULL,
    id_usuario bigint NOT NULL
);


ALTER TABLE public.servico OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24978)
-- Name: servico_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.servico_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.servico_id_seq OWNER TO postgres;

--
-- TOC entry 3098 (class 0 OID 0)
-- Dependencies: 225
-- Name: servico_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.servico_id_seq OWNED BY public.servico.id;


--
-- TOC entry 211 (class 1259 OID 16476)
-- Name: servicos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servicos (
    id bigint NOT NULL,
    data_hora_cadastro timestamp without time zone,
    data_hora_modificacao timestamp without time zone,
    id_usuario bigint NOT NULL,
    conteudo character varying(255) NOT NULL,
    titulo character varying(50) NOT NULL
);


ALTER TABLE public.servicos OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16481)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id bigint NOT NULL,
    ativo boolean,
    login character varying(255),
    primeiro_nome character varying(255),
    senha character varying(255),
    ultimo_nome character varying(255),
    id_empresa bigint
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16489)
-- Name: usuario_permissao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_permissao (
    id_usuario bigint NOT NULL,
    id_permissao bigint NOT NULL
);


ALTER TABLE public.usuario_permissao OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16494)
-- Name: veiculo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veiculo (
    id integer NOT NULL,
    ativo boolean NOT NULL,
    data_hora_cadastro timestamp without time zone,
    data_hora_modificacao timestamp without time zone,
    placa character varying(8),
    tipo character varying(255) NOT NULL,
    id_usuario bigint NOT NULL
);


ALTER TABLE public.veiculo OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16492)
-- Name: veiculo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.veiculo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veiculo_id_seq OWNER TO postgres;

--
-- TOC entry 3099 (class 0 OID 0)
-- Dependencies: 214
-- Name: veiculo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veiculo_id_seq OWNED BY public.veiculo.id;


--
-- TOC entry 228 (class 1259 OID 24988)
-- Name: viagem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.viagem (
    id integer NOT NULL,
    data date NOT NULL,
    horario time without time zone NOT NULL,
    id_rota integer NOT NULL,
    id_usuario bigint NOT NULL
);


ALTER TABLE public.viagem OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 24986)
-- Name: viagem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.viagem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.viagem_id_seq OWNER TO postgres;

--
-- TOC entry 3100 (class 0 OID 0)
-- Dependencies: 227
-- Name: viagem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.viagem_id_seq OWNED BY public.viagem.id;


--
-- TOC entry 230 (class 1259 OID 24996)
-- Name: viagem_residente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.viagem_residente (
    id integer NOT NULL,
    horario time without time zone NOT NULL,
    id_morador bigint NOT NULL,
    id_viagem integer NOT NULL
);


ALTER TABLE public.viagem_residente OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 24994)
-- Name: viagem_residente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.viagem_residente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.viagem_residente_id_seq OWNER TO postgres;

--
-- TOC entry 3101 (class 0 OID 0)
-- Dependencies: 229
-- Name: viagem_residente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.viagem_residente_id_seq OWNED BY public.viagem_residente.id;


--
-- TOC entry 2799 (class 2604 OID 25072)
-- Name: bloco id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bloco ALTER COLUMN id SET DEFAULT nextval('public.bloco_id_seq'::regclass);


--
-- TOC entry 2800 (class 2604 OID 25069)
-- Name: condominio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.condominio ALTER COLUMN id SET DEFAULT nextval('public.condominio_id_seq'::regclass);


--
-- TOC entry 2801 (class 2604 OID 25066)
-- Name: construtora id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.construtora ALTER COLUMN id SET DEFAULT nextval('public.construtora_id_seq'::regclass);


--
-- TOC entry 2806 (class 2604 OID 24959)
-- Name: documento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documento ALTER COLUMN id SET DEFAULT nextval('public.documento_id_seq'::regclass);


--
-- TOC entry 2802 (class 2604 OID 25063)
-- Name: empresa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa ALTER COLUMN id SET DEFAULT nextval('public.empresa_id_seq'::regclass);


--
-- TOC entry 2807 (class 2604 OID 24967)
-- Name: evento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evento ALTER COLUMN id SET DEFAULT nextval('public.evento_id_seq'::regclass);


--
-- TOC entry 2803 (class 2604 OID 25060)
-- Name: morador id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morador ALTER COLUMN id SET DEFAULT nextval('public.morador_id_seq'::regclass);


--
-- TOC entry 2808 (class 2604 OID 24975)
-- Name: parceiro id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parceiro ALTER COLUMN id SET DEFAULT nextval('public.parceiro_id_seq'::regclass);


--
-- TOC entry 2804 (class 2604 OID 16473)
-- Name: rota id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rota ALTER COLUMN id SET DEFAULT nextval('public.rota_id_seq'::regclass);


--
-- TOC entry 2809 (class 2604 OID 24983)
-- Name: servico id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servico ALTER COLUMN id SET DEFAULT nextval('public.servico_id_seq'::regclass);


--
-- TOC entry 2805 (class 2604 OID 16497)
-- Name: veiculo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculo ALTER COLUMN id SET DEFAULT nextval('public.veiculo_id_seq'::regclass);


--
-- TOC entry 2810 (class 2604 OID 24991)
-- Name: viagem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viagem ALTER COLUMN id SET DEFAULT nextval('public.viagem_id_seq'::regclass);


--
-- TOC entry 2811 (class 2604 OID 24999)
-- Name: viagem_residente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viagem_residente ALTER COLUMN id SET DEFAULT nextval('public.viagem_residente_id_seq'::regclass);


--
-- TOC entry 3042 (class 0 OID 16394)
-- Dependencies: 196
-- Data for Name: apartamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (12, '2017-10-03 22:55:53.454', '2018-03-17 22:11:21.34196', 3, true, '104', 6, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (13, '2017-10-03 22:56:08', '2018-03-17 22:11:21.34196', 3, true, '203', 6, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (14, '2017-10-03 22:56:14.704', '2018-03-17 22:11:21.34196', 3, true, '206', 6, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (15, '2017-10-03 22:56:18.219', '2018-03-17 22:11:21.34196', 3, true, '208', 6, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (16, '2017-10-03 22:56:22.157', '2018-03-17 22:11:21.34196', 3, true, '212', 6, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (17, '2017-10-03 22:56:25.422', '2018-03-17 22:11:21.34196', 3, true, '302', 6, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (18, '2017-10-03 22:56:33.985', '2018-03-17 22:11:21.34196', 3, true, '304', 6, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (19, '2017-10-03 22:56:37.969', '2018-03-17 22:11:21.34196', 3, true, '402', 6, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (20, '2017-10-03 22:56:41.657', '2018-03-17 22:11:21.34196', 3, true, '411', 6, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (21, '2017-10-03 22:56:46.516', '2018-03-17 22:11:21.34196', 3, true, '503', 6, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (22, '2017-10-03 22:56:50.816', '2018-03-17 22:11:21.34196', 3, true, '612', 6, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (23, '2017-10-03 22:56:55.829', '2018-03-17 22:11:21.34196', 3, true, '804', 6, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (58, '2017-10-03 23:23:41.391', '2018-03-17 22:11:21.34196', 3, true, '110', 7, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (59, '2017-10-03 23:23:47.503', '2018-03-17 22:11:21.34196', 3, true, '406', 7, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (60, '2017-10-03 23:23:54.782', '2018-03-17 22:11:21.34196', 3, true, '502', 7, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (61, '2017-10-03 23:23:59.001', '2018-03-17 22:11:21.34196', 3, true, '702', 7, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (62, '2017-10-03 23:24:04.626', '2018-03-17 22:11:21.34196', 3, true, '805', 7, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (63, '2017-10-03 23:24:08.861', '2018-03-17 22:11:21.34196', 3, true, '807', 7, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (64, '2017-10-03 23:24:12.579', '2018-03-17 22:11:21.34196', 3, true, '811', 7, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (68, '2017-10-03 23:27:04.75', '2018-03-17 22:11:21.34196', 3, true, '108', 7, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (96, '2017-10-03 23:51:37.563', '2018-03-17 22:11:21.34196', 3, true, '110', 8, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (97, '2017-10-03 23:51:50.141', '2018-03-17 22:11:21.34196', 3, true, '206', 8, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (98, '2017-10-03 23:51:56.688', '2018-03-17 22:11:21.34196', 3, true, '405', 8, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (99, '2017-10-03 23:52:02.876', '2018-03-17 22:11:21.34196', 3, true, '508', 8, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (100, '2017-10-03 23:52:07.641', '2018-03-17 22:11:21.34196', 3, true, '509', 8, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (102, '2017-10-03 23:52:12.313', '2018-03-17 22:11:21.34196', 3, true, '811', 8, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (110, '2017-10-03 23:55:03.316', '2018-03-17 22:11:21.34196', 3, true, '309', 7, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (111, '2017-10-03 23:55:27.313', '2018-03-17 22:11:21.34196', 3, true, '806', 8, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (113, '2017-10-03 23:55:43.094', '2018-03-17 22:11:21.34196', 3, true, '107', 7, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (116, '2017-10-03 23:56:02.392', '2018-03-17 22:11:21.34196', 3, true, '411', 108, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (118, '2017-10-03 23:56:15.547', '2018-03-17 22:11:21.34196', 3, true, '607', 7, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (119, '2017-10-03 23:56:28.001', '2018-03-17 22:11:21.34196', 3, true, '504', 105, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (120, '2017-10-03 23:56:36.422', '2018-03-17 22:11:21.34196', 3, true, '708', 105, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (122, '2017-10-03 23:56:51.204', '2018-03-17 22:11:21.34196', 3, true, '809', 103, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (123, '2017-10-03 23:57:05.688', '2018-03-17 22:11:21.34196', 3, true, '809', 103, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (137, '2017-10-03 23:59:55.235', '2018-03-17 22:11:21.34196', 3, true, '107', 9, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (138, '2017-10-04 00:00:02.253', '2018-03-17 22:11:21.34196', 3, true, '210', 9, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (140, '2017-10-04 00:00:13.315', '2018-03-17 22:11:21.34196', 3, true, '301', 9, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (141, '2017-10-04 00:00:20.204', '2018-03-17 22:11:21.34196', 3, true, '410', 9, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (142, '2017-10-04 00:00:25.672', '2018-03-17 22:11:21.34196', 3, true, '412', 9, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (143, '2017-10-04 00:00:32.688', '2018-03-17 22:11:21.34196', 3, true, '510', 9, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (166, '2017-10-04 00:05:54.704', '2018-03-17 22:11:21.34196', 3, true, '106', 10, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (167, '2017-10-04 00:05:59.267', '2018-03-17 22:11:21.34196', 3, true, '211', 10, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (169, '2017-10-04 00:06:02.985', '2018-03-17 22:11:21.34196', 3, true, '406', 10, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (170, '2017-10-04 00:06:08.751', '2018-03-17 22:11:21.34196', 3, true, '409', 10, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (171, '2017-10-04 00:06:15.172', '2018-03-17 22:11:21.34196', 3, true, '512', 10, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (172, '2017-10-04 00:06:23.094', '2018-03-17 22:11:21.34196', 3, true, '703', 10, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (203, '2017-10-04 00:12:21.065', '2018-03-17 22:11:21.34196', 3, true, '110', 11, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (204, '2017-10-04 00:12:27.657', '2018-03-17 22:11:21.34196', 3, true, '201', 11, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (205, '2017-10-04 00:12:34.235', '2018-03-17 22:11:21.34196', 3, true, '208', 11, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (206, '2017-10-04 00:12:41.423', '2018-03-17 22:11:21.34196', 3, true, '305', 11, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (208, '2017-10-04 00:12:47.564', '2018-03-17 22:11:21.34196', 3, true, '402', 11, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (209, '2017-10-04 00:12:52.797', '2018-03-17 22:11:21.34196', 3, true, '712', 11, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (210, '2017-10-04 00:12:59.454', '2018-03-17 22:11:21.34196', 3, true, '803', 11, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (238, '2017-10-04 00:21:17.657', '2018-03-17 22:11:21.34196', 3, true, '403', 8, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (247, '2017-10-04 00:32:02.985', '2018-03-17 22:11:21.34196', 3, true, '208', 105, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (248, '2017-10-04 00:32:16.751', '2018-03-17 22:11:21.34196', 3, true, '108', 8, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (249, '2017-10-04 00:32:28.313', '2018-03-17 22:11:21.34196', 3, true, '110', 10, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (250, '2017-10-04 00:32:40.313', '2018-03-17 22:11:21.34196', 3, true, '312', 9, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (251, '2017-10-04 00:33:35.766', '2018-03-17 22:11:21.34196', 3, true, '706', 9, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (252, '2017-10-04 00:33:57.844', '2018-03-17 22:11:21.34196', 3, true, '506', 105, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (254, '2017-10-04 00:37:23.047', '2018-03-17 22:11:21.34196', 3, true, '805', 253, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (256, '2017-10-04 00:38:50.079', '2018-03-17 22:11:21.34196', 3, true, '302', 255, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (257, '2017-10-04 00:39:02.407', '2018-03-17 22:11:21.34196', 3, true, '205', 8, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (259, '2017-10-04 00:40:19.751', '2018-03-17 22:11:21.34196', 3, true, '201', 258, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (279, '2017-10-04 01:00:53.704', '2018-03-17 22:11:21.34196', 3, true, '110', 9, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (284, '2017-10-04 01:03:25.907', '2018-03-17 22:11:21.34196', 3, true, '101', 7, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (290, '2017-10-04 01:06:53.094', '2018-03-17 22:11:21.34196', 3, true, '711', 11, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (293, '2017-10-04 01:08:51.443', '2018-03-17 22:11:21.34196', 3, true, '812', 8, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (315, '2017-10-04 01:32:59.345', '2018-03-17 22:11:21.34196', 3, true, '701', 312, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (316, '2017-10-04 01:33:18.063', '2018-03-17 22:11:21.34196', 3, true, '306', 297, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (317, '2017-10-04 01:33:43.923', '2018-03-17 22:11:21.34196', 3, true, '508', 314, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (318, '2017-10-04 01:35:37.813', '2018-03-17 22:11:21.34196', 3, true, '509', 297, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (319, '2017-10-04 01:35:45.938', '2018-03-17 22:11:21.34196', 3, true, '716', 297, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (320, '2017-10-04 01:35:56.938', '2018-03-17 22:11:21.34196', 3, true, '415', 253, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (321, '2017-10-04 01:36:08.125', '2018-03-17 22:11:21.34196', 3, true, '510', 313, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (322, '2017-10-04 01:36:16.922', '2018-03-17 22:11:21.34196', 3, true, '814', 297, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (323, '2017-10-04 01:36:24.938', '2018-03-17 22:11:21.34196', 3, true, '508', 313, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (324, '2017-10-04 01:36:37.813', '2018-03-17 22:11:21.34196', 3, true, '211', 253, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (325, '2017-10-04 01:36:48.641', '2018-03-17 22:11:21.34196', 3, true, '414', 297, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (326, '2017-10-04 01:37:00.438', '2018-03-17 22:11:21.34196', 3, true, '411', 253, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (327, '2017-10-04 01:37:07.985', '2018-03-17 22:11:21.34196', 3, true, '204', 253, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (328, '2017-10-04 01:37:18.86', '2018-03-17 22:11:21.34196', 3, true, '507', 313, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (329, '2017-10-04 01:37:27.282', '2018-03-17 22:11:21.34196', 3, true, '210', 313, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (330, '2017-10-04 01:37:38.032', '2018-03-17 22:11:21.34196', 3, true, '806', 253, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (331, '2017-10-04 01:37:46.094', '2018-03-17 22:11:21.34196', 3, true, '806', 314, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (332, '2017-10-04 01:37:55.516', '2018-03-17 22:11:21.34196', 3, true, '816', 297, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (333, '2017-10-04 01:38:04.266', '2018-03-17 22:11:21.34196', 3, true, '512', 313, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (334, '2017-10-04 01:38:16.922', '2018-03-17 22:11:21.34196', 3, true, '416', 297, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (335, '2017-10-04 01:38:29.876', '2018-03-17 22:11:21.34196', 3, true, '513', 253, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (336, '2017-10-04 01:38:55.954', '2018-03-17 22:11:21.34196', 3, true, '616', 297, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (337, '2017-10-04 01:39:06.485', '2018-03-17 22:11:21.34196', 3, true, '615', 253, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (338, '2017-10-04 01:39:18.547', '2018-03-17 22:11:21.34196', 3, true, '810', 297, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (339, '2017-10-04 01:39:28.344', '2018-03-17 22:11:21.34196', 3, true, '801', 312, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (340, '2017-10-04 01:39:38.172', '2018-03-17 22:11:21.34196', 3, true, '706', 313, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (341, '2017-10-04 01:39:47.407', '2018-03-17 22:11:21.34196', 3, true, '413', 253, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (342, '2017-10-04 01:39:56.751', '2018-03-17 22:11:21.34196', 3, true, '605', 297, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (343, '2017-10-04 01:40:07.344', '2018-03-17 22:11:21.34196', 3, true, '301', 253, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (459, '2017-10-09 10:23:22.234', '2018-03-17 22:11:21.34196', 3, true, '103', 7, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (460, '2017-10-09 17:16:40.531', '2018-03-17 22:11:21.34196', 3, true, '403', 314, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (462, '2017-10-10 09:55:29.045', '2018-03-17 22:11:21.34196', 3, true, '103', 7, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1000, '2017-10-10 16:53:13.045', '2018-03-17 22:11:21.34196', 3, true, '207', 108, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1005, '2017-10-10 16:57:19.81', '2018-03-17 22:11:21.34196', 3, true, '105', 258, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1007, '2017-10-10 16:58:07.983', '2018-03-17 22:11:21.34196', 3, true, '306', 1006, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1014, '2017-10-11 14:45:06.887', '2018-03-17 22:11:21.34196', 3, true, '603', 9, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1016, '2017-10-13 11:35:32.871', '2018-03-17 22:11:21.34196', 3, true, '808', 9, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1019, '2017-10-13 11:53:47.324', '2018-03-17 22:11:21.34196', 3, true, '808', 297, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1023, '2017-10-13 14:17:01.14', '2018-03-17 22:11:21.34196', 3, true, '808', 105, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1062, '2017-10-16 16:50:02.012', '2018-03-17 22:11:21.34196', 3, true, '405', 6, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1092, '2017-10-17 15:54:43.73', '2018-03-17 22:11:21.34196', 3, true, '704', 7, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1227, '2017-10-23 14:36:16.184', '2018-03-17 22:11:21.34196', 3, true, '105', 258, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1127, '2017-10-18 16:19:11.777', '2018-03-17 22:11:21.34196', 3, true, '607', 105, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1134, '2017-10-18 17:53:16.824', '2018-03-17 22:11:21.34196', 3, true, 'Administração', 1133, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1148, '2017-10-19 10:42:04.574', '2018-03-17 22:11:21.34196', 3, true, '809', 108, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1150, '2017-10-19 11:34:46.028', '2018-03-17 22:11:21.34196', 3, true, '609', 9, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1160, '2017-10-19 16:43:11.73', '2018-03-17 22:11:21.34196', 3, true, '301', 11, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1164, '2017-10-19 17:43:33.246', '2018-03-17 22:11:21.34196', 3, true, '807', 297, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1228, '2017-10-23 14:36:21.783', '2018-03-17 22:11:21.34196', 3, false, '105', 258, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1229, '2017-10-23 14:36:28.825', '2018-03-17 22:11:21.34196', 3, false, '105', 258, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1284, '2017-10-25 10:09:18.048', '2018-03-17 22:11:21.34196', 3, true, '712', 7, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1293, '2017-10-25 11:06:24.122', '2018-03-17 22:11:21.34196', 3, true, '503', 7, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1295, '2017-10-25 11:30:28.59', '2018-03-17 22:11:21.34196', 3, true, '603', 253, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1316, '2017-10-26 10:50:51.528', '2018-03-17 22:11:21.34196', 3, true, '306', 314, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1322, '2017-10-26 15:37:09.012', '2018-03-17 22:11:21.34196', 3, true, '708', 312, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1326, '2017-10-31 10:16:23.402', '2018-03-17 22:11:21.34196', 3, true, '414', 253, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1334, '2017-10-31 11:52:43.794', '2018-03-17 22:11:21.34196', 3, true, '511', 105, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1336, '2017-10-31 12:02:39.84', '2018-03-17 22:11:21.34196', 3, true, '606', 314, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1338, '2017-10-31 14:18:09.512', '2018-03-17 22:11:21.34196', 3, true, '104', 105, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1358, '2017-11-01 14:01:48.121', '2018-03-17 22:11:21.34196', 3, true, '210', 9, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1360, '2017-11-01 14:58:31.371', '2018-03-17 22:11:21.34196', 3, true, '610', 105, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1362, '2017-11-01 15:17:12.137', '2018-03-17 22:11:21.34196', 3, true, '208', 6, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1364, '2017-11-01 15:23:45.996', '2018-03-17 22:11:21.34196', 3, true, '208', 6, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1365, '2017-11-01 15:23:51.965', '2018-03-17 22:11:21.34196', 3, true, '208', 6, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1373, '2017-11-01 16:52:25.527', '2018-03-17 22:11:21.34196', 3, true, '810', 258, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1399, '2017-11-03 15:39:26.169', '2018-03-17 22:11:21.34196', 3, true, '108', 1398, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1403, '2017-11-03 16:17:34.09', '2018-03-17 22:11:21.34196', 3, true, 'Loja 1 Bloco 2', 1402, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1413, '2017-11-06 09:37:28.688', '2018-03-17 22:11:21.34196', 3, true, '706', 105, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1425, '2017-11-06 15:52:15.777', '2018-03-17 22:11:21.34196', 3, true, '705 ', 7, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1433, '2017-11-07 10:54:22.689', '2018-03-17 22:11:21.34196', 3, true, '610', 1398, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1437, '2017-11-07 16:52:09.746', '2018-03-17 22:11:21.34196', 3, true, '312', 313, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1463, '2017-11-13 12:42:12.713', '2018-03-17 22:11:21.34196', 3, true, '202', 105, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1481, '2017-11-14 14:05:53.074', '2018-03-17 22:11:21.34196', 3, true, '404', 314, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1484, '2017-11-16 17:07:40.953', '2018-03-17 22:11:21.34196', 3, true, '612', 1006, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1486, '2017-11-16 17:45:29.402', '2018-03-17 22:11:21.34196', 3, true, '503', 258, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1489, '2017-11-16 18:29:46.947', '2018-03-17 22:11:21.34196', 3, true, '514', 297, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1493, '2017-11-16 20:14:02.119', '2018-03-17 22:11:21.34196', 3, true, '407', 314, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1495, '2017-11-17 17:23:31.4', '2018-03-17 22:11:21.34196', 3, true, '514', 297, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1496, '2017-11-17 17:23:38.166', '2018-03-17 22:11:21.34196', 3, true, '514', 297, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1500, '2017-11-17 20:07:42.171', '2018-03-17 22:11:21.34196', 3, true, '401', 103, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1509, '2017-11-21 15:18:40.34', '2018-03-17 22:11:21.34196', 3, true, '806', 105, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1510, '2017-11-21 15:20:46.275', '2018-03-17 22:11:21.34196', 3, true, '806', 105, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1512, '2017-11-21 17:03:18.384', '2018-03-17 22:11:21.34196', 3, true, '205', 255, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1520, '2017-11-21 17:13:05.854', '2018-03-17 22:11:21.34196', 3, true, '205', 255, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1521, '2017-11-21 17:13:20.166', '2018-03-17 22:11:21.34196', 3, true, '205', 255, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1526, '2017-11-21 18:56:21.541', '2018-03-17 22:11:21.34196', 3, true, '106', 105, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1528, '2017-11-21 19:27:59.088', '2018-03-17 22:11:21.34196', 3, true, '106', 105, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1530, '2017-11-22 12:18:16.15', '2018-03-17 22:11:21.34196', 3, true, '305', 297, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1532, '2017-11-22 18:22:58.525', '2018-03-17 22:11:21.34196', 3, true, '210', 258, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1535, '2017-11-23 13:20:17.054', '2018-03-17 22:11:21.34196', 3, true, '506', 312, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1537, '2017-11-23 20:14:36.353', '2018-03-17 22:11:21.34196', 3, true, '511', 6, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1540, '2017-11-23 20:46:52.512', '2018-03-17 22:11:21.34196', 3, true, '509', 10, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1542, '2017-11-27 12:40:06.181', '2018-03-17 22:11:21.34196', 3, true, '305', 312, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1547, '2017-11-27 18:56:01.572', '2018-03-17 22:11:21.34196', 3, true, '801', 255, NULL);
INSERT INTO public.apartamento (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, numero, id_bloco, numero_quartos) VALUES (1549, '2017-11-27 21:24:58.431', '2018-03-17 22:11:21.34196', 3, true, '210', 6, NULL);


--
-- TOC entry 3063 (class 0 OID 16701)
-- Dependencies: 217
-- Data for Name: apartamento_morador; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (701, 12);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (728, 22);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (732, 68);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (264, 137);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (258, 23);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (71, 59);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (72, 59);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (73, 59);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (74, 59);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (77, 60);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (78, 60);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (79, 60);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (84, 61);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (85, 62);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (86, 62);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (87, 62);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (88, 62);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (89, 63);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (90, 63);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (91, 63);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (92, 63);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (703, 13);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (117, 97);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (121, 97);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (127, 99);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (128, 99);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (129, 99);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (130, 99);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (131, 120);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (134, 120);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (136, 120);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (139, 120);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (147, 137);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (148, 137);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (704, 13);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (150, 138);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (151, 138);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (705, 13);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (470, 119);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (709, 15);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (710, 15);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (711, 15);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (712, 15);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (713, 17);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (716, 19);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (717, 19);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (718, 19);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (719, 20);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (720, 20);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (724, 22);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (726, 22);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (727, 22);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (729, 22);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (267, 102);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (268, 102);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (231, 100);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (260, 98);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (261, 98);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (262, 98);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (206, 97);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (238, 96);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (235, 96);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (237, 96);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (245, 96);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (273, 64);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (274, 64);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (198, 61);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (195, 61);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (196, 61);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (197, 61);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (255, 58);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (201, 68);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (254, 58);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (202, 68);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (257, 23);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (216, 21);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (217, 21);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (228, 18);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (229, 18);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (226, 17);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (251, 14);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (252, 14);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (468, 119);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (153, 138);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (154, 138);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (157, 140);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (158, 140);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (159, 140);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (189, 22);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (277, 60);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (285, 15);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (284, 15);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (160, 140);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (161, 118);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (162, 141);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (163, 141);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (164, 142);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (241, 209);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (240, 209);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (175, 166);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (176, 166);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (177, 166);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (178, 166);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (181, 169);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (182, 169);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (183, 170);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (184, 170);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (185, 170);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (186, 170);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (187, 171);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (188, 171);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (190, 116);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (173, 205);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (800, 118);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (174, 205);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (223, 203);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (224, 203);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (209, 172);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (214, 172);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (271, 167);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (270, 167);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (204, 143);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (243, 140);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (244, 140);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (265, 137);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (218, 21);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (495, 122);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (511, 248);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (540, 250);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (533, 251);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (537, 251);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (531, 252);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (459, 172);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (491, 208);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (492, 208);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (494, 204);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (497, 111);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (500, 172);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (561, 210);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (562, 210);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (563, 210);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (566, 17);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (567, 17);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (568, 17);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (570, 238);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (571, 123);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (590, 252);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (593, 249);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (594, 249);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (612, 113);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (620, 206);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (621, 206);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (623, 208);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (801, 247);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (286, 284);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (289, 284);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (291, 290);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (292, 290);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (294, 293);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (295, 293);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (296, 293);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (304, 257);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (306, 257);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (307, 259);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (308, 259);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (309, 259);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (310, 259);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (311, 259);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (344, 315);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (345, 315);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (346, 315);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (805, 247);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (281, 206);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (807, 113);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (808, 204);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (901, 250);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (902, 252);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (903, 210);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (904, 210);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (905, 238);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (347, 315);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (350, 316);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (351, 316);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (352, 316);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (951, 113);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (355, 317);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (356, 317);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (357, 317);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (358, 318);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (359, 318);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (360, 318);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (361, 318);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (362, 329);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (363, 329);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (364, 329);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (365, 329);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (367, 319);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (368, 319);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (369, 319);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (370, 319);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (371, 319);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (372, 319);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (380, 321);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (381, 321);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (387, 324);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (388, 324);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (389, 324);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (397, 327);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (398, 327);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (399, 327);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (490, 254);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (472, 256);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (474, 256);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (508, 284);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (509, 284);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (505, 279);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (504, 279);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (507, 279);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (516, 247);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (517, 247);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (550, 247);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (551, 247);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (616, 257);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (401, 328);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (402, 328);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (403, 328);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (200, 16);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (410, 111);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (659, 321);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (660, 321);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (627, 322);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (656, 323);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (655, 323);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (644, 325);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (645, 325);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (639, 326);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (640, 326);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (642, 326);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (625, 322);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (647, 320);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (626, 322);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (648, 320);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (670, 319);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (687, 317);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (686, 317);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (679, 316);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (678, 316);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (489, 254);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (806, 257);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (617, 328);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (610, 329);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (613, 329);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (614, 329);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (604, 111);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (608, 111);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (606, 111);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (809, 247);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (600, 331);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (602, 331);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (900, 247);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (601, 331);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (592, 333);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (591, 333);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (425, 334);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (426, 334);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (428, 335);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (431, 336);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (596, 332);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (597, 332);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (586, 334);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (585, 334);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (584, 334);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (581, 335);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (575, 338);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (436, 339);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (437, 339);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (438, 339);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (441, 340);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (442, 340);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (443, 341);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (445, 341);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (446, 341);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (451, 343);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (452, 343);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (455, 343);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (456, 343);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (457, 343);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (488, 254);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (458, 111);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (466, 119);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (179, 13);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (803, 171);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (658, 321);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (661, 321);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (282, 206);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (276, 60);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (406, 329);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (564, 336);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (565, 336);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (578, 337);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (569, 339);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (543, 341);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (461, 460);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (464, 459);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (465, 460);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1001, 1000);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1002, 1000);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1008, 1005);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1009, 1007);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (950, 248);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (595, 332);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (576, 338);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (558, 340);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (559, 340);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (554, 342);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (553, 342);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (556, 342);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (555, 342);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1015, 1014);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1020, 1019);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1017, 1023);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1018, 1023);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1031, 1023);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1032, 1023);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1051, 1019);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1064, 1062);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1108, 1019);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1110, 1092);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1128, 1127);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1135, 1134);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1149, 1148);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1165, 1164);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1166, 1164);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1285, 1284);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1163, 1160);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1290, 1160);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1292, 1127);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1294, 1293);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1296, 1295);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1297, 1295);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1298, 1293);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1299, 1293);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1300, 1293);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1317, 1316);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1318, 1316);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1323, 1322);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1324, 1005);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1325, 1005);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1327, 1326);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1329, 1326);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1330, 1326);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1331, 1326);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1332, 1007);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1333, 1007);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1335, 1334);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1337, 1336);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1339, 1338);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1340, 1334);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1361, 1360);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1363, 15);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1374, 1373);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1397, 1150);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1404, 1403);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1406, 1403);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1414, 1413);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1426, 1425);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1427, 1425);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1434, 1433);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1435, 1433);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1436, 1433);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1438, 1437);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1482, 1481);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1483, 1481);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1485, 1484);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1487, 1486);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1490, 1489);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1491, 1489);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1492, 1338);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1494, 1493);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1497, 1489);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1501, 1500);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1507, 1500);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1511, 1509);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1513, 1512);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1522, 1512);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1527, 1526);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1529, 1526);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1531, 1530);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1533, 1532);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1534, 1532);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1536, 1535);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1328, 1326);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1538, 1537);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1539, 1537);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1541, 1540);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1543, 1542);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1544, 1542);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1546, 1535);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1548, 1547);
INSERT INTO public.apartamento_morador (id_morador, id_apartamento) VALUES (1553, 1549);


--
-- TOC entry 3043 (class 0 OID 16402)
-- Dependencies: 197
-- Data for Name: bloco; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bloco (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, nome, numero, id_condominio) VALUES (6, '2017-10-03 22:54:07.381', '2018-03-17 22:11:05.391445', 3, true, 'Bloco 1', NULL, 5);
INSERT INTO public.bloco (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, nome, numero, id_condominio) VALUES (7, '2017-10-03 22:55:05.625', '2018-03-17 22:11:05.391445', 3, true, 'Bloco 2', NULL, 5);
INSERT INTO public.bloco (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, nome, numero, id_condominio) VALUES (8, '2017-10-03 22:55:10.219', '2018-03-17 22:11:05.391445', 3, true, 'Bloco 3', NULL, 5);
INSERT INTO public.bloco (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, nome, numero, id_condominio) VALUES (9, '2017-10-03 22:55:24.219', '2018-03-17 22:11:05.391445', 3, true, 'Bloco 7', NULL, 5);
INSERT INTO public.bloco (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, nome, numero, id_condominio) VALUES (10, '2017-10-03 22:55:28.08', '2018-03-17 22:11:05.391445', 3, true, 'Bloco 8', NULL, 5);
INSERT INTO public.bloco (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, nome, numero, id_condominio) VALUES (11, '2017-10-03 22:55:32.672', '2018-03-17 22:11:05.391445', 3, true, 'Bloco 9', NULL, 5);
INSERT INTO public.bloco (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, nome, numero, id_condominio) VALUES (103, '2017-10-03 23:52:52.001', '2018-03-17 22:11:05.391445', 3, true, 'Bloco 6 - Fugi', NULL, 95);
INSERT INTO public.bloco (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, nome, numero, id_condominio) VALUES (105, '2017-10-03 23:53:19.63', '2018-03-17 22:11:05.391445', 3, true, 'Bloco 7- Santorini', NULL, 95);
INSERT INTO public.bloco (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, nome, numero, id_condominio) VALUES (108, '2017-10-03 23:53:52.469', '2018-03-17 22:11:05.391445', 3, true, 'Bloco 4- Sardenha', NULL, 95);
INSERT INTO public.bloco (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, nome, numero, id_condominio) VALUES (255, '2017-10-04 00:38:18.345', '2018-03-17 22:11:05.391445', 3, true, 'Bloco 1 - Maldivas', NULL, 95);
INSERT INTO public.bloco (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, nome, numero, id_condominio) VALUES (258, '2017-10-04 00:39:42.594', '2018-03-17 22:11:05.391445', 3, true, 'Bloco 2 - Capri', NULL, 95);
INSERT INTO public.bloco (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, nome, numero, id_condominio) VALUES (253, '2017-10-04 01:11:02.079', '2018-03-17 22:11:05.391445', 3, true, 'Bloco 2 - Sunrise', NULL, 101);
INSERT INTO public.bloco (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, nome, numero, id_condominio) VALUES (312, '2017-10-04 01:30:40.61', '2018-03-17 22:11:05.391445', 3, true, 'Bloco 3 - Beach', NULL, 101);
INSERT INTO public.bloco (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, nome, numero, id_condominio) VALUES (297, '2017-10-04 01:31:19.173', '2018-03-17 22:11:05.391445', 3, true, 'Bloco 1 - Sunset', NULL, 101);
INSERT INTO public.bloco (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, nome, numero, id_condominio) VALUES (313, '2017-10-04 01:31:43.813', '2018-03-17 22:11:05.391445', 3, true, 'Bloco 4 - Moutain', NULL, 101);
INSERT INTO public.bloco (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, nome, numero, id_condominio) VALUES (314, '2017-10-04 01:32:02.922', '2018-03-17 22:11:05.391445', 3, true, 'Bloco 5 - Summer', NULL, 101);
INSERT INTO public.bloco (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, nome, numero, id_condominio) VALUES (1006, '2017-10-10 16:57:48.748', '2018-03-17 22:11:05.391445', 3, true, 'Bloco 5', NULL, 95);
INSERT INTO public.bloco (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, nome, numero, id_condominio) VALUES (1133, '2017-10-18 17:52:41.012', '2018-03-17 22:11:05.391445', 3, true, '01', NULL, 1132);
INSERT INTO public.bloco (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, nome, numero, id_condominio) VALUES (1398, '2017-11-03 15:39:12.215', '2018-03-17 22:11:05.391445', 3, true, 'Bloco 3 - Noronha', NULL, 95);
INSERT INTO public.bloco (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, nome, numero, id_condominio) VALUES (1402, '2017-11-03 16:17:06.199', '2018-03-17 22:11:05.391445', 3, true, 'SAWALA', NULL, 1401);
INSERT INTO public.bloco (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, nome, numero, id_condominio) VALUES (1, '2018-05-19 20:08:26.988', '2018-05-19 20:08:26.988', 3, true, 'BLOCO XXX', NULL, 5);


--
-- TOC entry 3044 (class 0 OID 16407)
-- Dependencies: 198
-- Data for Name: condominio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.condominio (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, bairro, cep, cidade, complemento, email, estado, numero, rua, telefone, nome, id_construtora) VALUES (5, '2017-10-03 22:53:33.297', '2018-03-17 22:10:59.816505', 3, true, 'Recreio', '00000-000', 'Rio de Janeiro', NULL, NULL, 'Rio de Janeiro', NULL, 'Rua Nilton Santos', '(00)0000-0000', 'Luar do Pontal', 1);
INSERT INTO public.condominio (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, bairro, cep, cidade, complemento, email, estado, numero, rua, telefone, nome, id_construtora) VALUES (95, '2017-10-03 23:51:17.658', '2018-03-17 22:10:59.816505', 3, true, 'Recreio', '00000-000', 'Rio de Janeiro', NULL, NULL, 'Rio de Janeiro', NULL, 'Rua Nilton Santos ', '(00)0033-3555', 'Ocean', 1);
INSERT INTO public.condominio (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, bairro, cep, cidade, complemento, email, estado, numero, rua, telefone, nome, id_construtora) VALUES (101, '2017-10-03 23:52:10.626', '2018-03-17 22:10:59.816505', 3, true, 'Recreio', '00000-000', 'Rio de Janeiro', NULL, NULL, 'Rio de Janeiro', NULL, 'Rua Nilton Santos', '(00)8887-7856', 'Maui Life', 1);
INSERT INTO public.condominio (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, bairro, cep, cidade, complemento, email, estado, numero, rua, telefone, nome, id_construtora) VALUES (1132, '2017-10-18 17:52:25.84', '2018-03-17 22:10:59.816505', 3, true, 'Recreio', '00000-000', 'Rio de Janeiro', NULL, NULL, 'Rio de Janeiro', NULL, 'Rua Nilton Santos', '(21)9575-7500', 'AAPO', 1);
INSERT INTO public.condominio (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, bairro, cep, cidade, complemento, email, estado, numero, rua, telefone, nome, id_construtora) VALUES (1401, '2017-11-03 16:16:42.747', '2018-03-17 22:10:59.816505', 3, true, 'Recreio', '00000-000', 'Riode Janeiro', NULL, NULL, 'Rio de Janeiro', NULL, 'Rua Nilton Santos', '(21)3203-1700', 'Logistas Maui', 1);


--
-- TOC entry 3045 (class 0 OID 16412)
-- Dependencies: 199
-- Data for Name: construtora; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.construtora (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, bairro, cep, cidade, complemento, email, estado, numero, rua, telefone, cnpj, nome_fantasia, nome_social, id_empresa) VALUES (1, '2018-03-17 22:10:56.488067', '2018-03-18 21:43:50.574', 1, true, 'Recreio', '00000-000', 'Rio de Janeiro', NULL, 'construtora@construtora.com.br', 'Rio de Janeiro', 123, 'Endereço Construtora', '(00)0000-0000', '00.000.000/0000-00', 'Construtora', 'Construtora', 2);


--
-- TOC entry 3065 (class 0 OID 24956)
-- Dependencies: 220
-- Data for Name: documento; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3046 (class 0 OID 16417)
-- Dependencies: 200
-- Data for Name: documentos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3047 (class 0 OID 16422)
-- Dependencies: 201
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.empresa (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, bairro, cep, cidade, complemento, email, estado, numero, rua, telefone, cnpj, nome_fantasia, nome_social) VALUES (2, '2017-10-03 22:51:48.61', '2018-03-18 20:54:26.339', 1, true, 'Recreio', '00000-000', 'Rio de Janeiro', NULL, 'atendimento@associacaopontaloceanico.com.br', 'Rio de Janeiro', 1921, 'Rua Nilton Santos', '(00)0000-0000', '00.000.000/0000-00', 'AAPO', 'Associação Amigos do Pontal Oceânico');


--
-- TOC entry 3067 (class 0 OID 24964)
-- Dependencies: 222
-- Data for Name: evento; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3048 (class 0 OID 16427)
-- Dependencies: 202
-- Data for Name: eventos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3049 (class 0 OID 16432)
-- Dependencies: 203
-- Data for Name: faq; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3050 (class 0 OID 16440)
-- Dependencies: 204
-- Data for Name: fotos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3051 (class 0 OID 16445)
-- Dependencies: 205
-- Data for Name: morador; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (718, '2017-10-03 23:09:06.188', NULL, 3, true, NULL, '222', NULL, 'Katia Tavares', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (720, '2017-10-03 23:09:56.11', NULL, 3, true, NULL, '08228401107', NULL, 'Hudson Buzolini', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (724, '2017-10-03 23:11:48.36', NULL, 3, true, NULL, '43731451168', NULL, 'Alexandre Bacellar de Carvalho', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (726, '2017-10-03 23:12:30.61', NULL, 3, true, NULL, '333', NULL, 'Rodrigo Candia de Carvalho', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (727, '2017-10-03 23:14:36.672', NULL, 3, true, NULL, '444', NULL, 'Roberta Candia de Carvalho', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (729, '2017-10-03 23:13:16.625', NULL, 3, true, NULL, '666', NULL, 'Bruna Bistratini', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (268, '2017-10-03 23:59:37.048', NULL, 3, true, NULL, '09999948758', NULL, 'Debora Robayashi de Oliveira', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (261, '2017-10-03 23:57:25.566', NULL, 3, true, NULL, '222000', NULL, 'Peter de Carvalho P Silva', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (262, '2017-10-03 23:57:38.641', NULL, 3, true, NULL, '222111', NULL, 'Igor de Carvalho D Silva', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (206, '2017-10-03 23:55:46.673', NULL, 3, true, NULL, '03944362969', NULL, 'Rosin‚ia Alves Lozano', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (238, '2017-10-03 23:53:08.517', NULL, 3, true, NULL, '07152665788', NULL, 'Alexanre Gomes dos Santos', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (237, '2017-10-03 23:53:54.579', NULL, 3, true, NULL, '111444', NULL, 'JoÆo Guilherme O F G Santos', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (245, '2017-10-03 23:55:28.36', NULL, 3, true, NULL, '08546163731', NULL, 'Maria da A Pereira Nunek', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (274, '2017-10-03 23:39:20.75', NULL, 3, true, NULL, '43098584068', NULL, 'Marilda Silva Odilon', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (198, '2017-10-03 23:33:50.36', NULL, 3, true, NULL, '03380588776', NULL, 'Achilles de Abreu Correa', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (195, '2017-10-03 23:34:13.315', NULL, 3, true, NULL, '10851819796', NULL, 'Maria Rosilene A Souza Correa', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (196, '2017-10-03 23:34:39.704', NULL, 3, true, NULL, '16935353785', NULL, 'Valdomiro Alves de S Corres', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (197, '2017-10-03 23:35:07.266', NULL, 3, true, NULL, '48424986768', NULL, 'Laura da Rocha F de Abreu', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (255, '2017-10-03 23:28:45.75', NULL, 3, true, NULL, '07198157700', NULL, 'Jose Henrique Brandao Ramos', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (202, '2017-10-03 23:28:13.344', NULL, 3, true, NULL, '11984165720', NULL, 'Rodrigo Oliveira de Almeida', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (217, '2017-10-03 23:10:55.922', NULL, 3, true, NULL, '86453440768', NULL, 'Adriana Rolli Fontes', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (229, '2017-10-03 23:08:10.86', NULL, 3, true, NULL, '32068018268', NULL, 'Marie Izabelle G D K Machado', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (252, '2017-10-03 23:02:43.344', NULL, 3, true, NULL, '10727325728', NULL, 'Daniele Serafim da Silva', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (468, '2017-10-04 00:02:48.157', NULL, 3, true, NULL, '39545733853', NULL, 'Maria Eduarda C. De Oliveira', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (153, '2017-10-04 00:02:50.36', NULL, 3, true, NULL, '12814975765', NULL, 'Rodrigo de M Valentim', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (154, '2017-10-04 00:03:00.72', NULL, 3, true, NULL, '222444', NULL, 'Neuza dos Santos', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (158, '2017-10-04 00:04:06.657', NULL, 3, true, NULL, '222666', NULL, 'Camila Barduni Martins Coelho', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (159, '2017-10-04 00:04:13.97', NULL, 3, true, NULL, '222777', NULL, 'Rodrigo Coelho', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (277, '2017-10-03 23:32:04.392', NULL, 3, true, NULL, '02205887750', NULL, 'Marcio Sergio Gusmao Leal', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (285, '2017-10-03 23:03:46.547', NULL, 3, true, NULL, '30310318734', NULL, 'Jos‚ Fernandes da Silva', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (160, '2017-10-04 00:04:23.36', NULL, 3, true, NULL, '222888', NULL, 'Felipe de Almeida Sanches', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (163, '2017-10-04 00:04:58.518', NULL, 3, true, NULL, '12443370720', NULL, 'Joana de Souza Calfa', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (241, '2017-10-04 00:18:23.829', NULL, 3, true, NULL, '05816902814', NULL, 'Josias Serafim Silva', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (176, '2017-10-04 00:07:42.61', NULL, 3, true, NULL, '08640193789', NULL, 'Monique Santos da Eira', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (177, '2017-10-04 00:07:56.766', NULL, 3, true, NULL, '333000', NULL, 'Heitor Eira de Moura Leal', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (178, '2017-10-04 00:08:09.516', NULL, 3, true, NULL, '64235580787', NULL, 'Arli Bento dos Santos', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (182, '2017-10-04 00:09:11.829', NULL, 3, true, NULL, '05337377701', NULL, 'Juliana Fagundes de Rezende', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (184, '2017-10-04 00:09:50.188', NULL, 3, true, NULL, '09545508701', NULL, 'Daniele de Farias Mendes Gon‡a', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (185, '2017-10-04 00:10:02.329', NULL, 3, true, NULL, '333111', NULL, 'Thiago Mendes Gon‡alves', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (186, '2017-10-04 00:10:13.206', NULL, 3, true, NULL, '333222', NULL, 'Cecilia Ferreira Gon‡alves', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (188, '2017-10-04 00:10:46.954', NULL, 3, true, NULL, '57523581791', NULL, 'Mada¡ Chaves Figueiredo', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (800, '2017-10-04 00:06:57.016', NULL, 3, true, NULL, '43442994772', NULL, 'Michael Constantin Olteanu', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (174, '2017-10-04 00:16:03.61', NULL, 3, true, NULL, '40029328772', NULL, 'Jose Tenorio Neto', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (224, '2017-10-04 00:14:05.204', NULL, 3, true, NULL, '09851902721', NULL, 'Fernando Bezerra de Oliveira', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (214, '2017-10-04 00:12:04.548', NULL, 3, true, NULL, '333555', NULL, 'Jose Ricardo Souto dos Santos', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (271, '2017-10-04 00:08:27.86', NULL, 3, true, NULL, '07532904725', NULL, 'Claudio Cesar Lopes da Costa', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (243, '2017-10-04 00:03:22.376', NULL, 3, true, NULL, '54405117704', NULL, 'Mauro Peres Martins', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (244, '2017-10-04 00:03:39.641', NULL, 3, true, NULL, '67353100710', NULL, 'Maria Dolores Barduni Martins', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (265, '2017-10-04 00:01:20.407', NULL, 3, true, NULL, '55211844734', NULL, 'Luiz Henrique Marins Rodrigues', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (218, '2017-10-03 23:11:15.992', NULL, 3, true, NULL, '11592784747', NULL, 'Isabele Fontes Vieira', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (537, '2017-10-04 00:49:27.048', NULL, 3, true, NULL, '40682897787', NULL, 'Maria das Gra‡as Area', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (459, '2017-10-04 00:11:45.047', NULL, 3, true, NULL, '333333', NULL, 'Vera Lucia Correira Abrantes S', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (492, '2017-10-04 00:18:09.125', NULL, 3, true, NULL, '17524064780', NULL, 'Raissa Pimentel Motta', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (497, '2017-10-04 00:15:38.672', NULL, 3, true, NULL, '59910941791', NULL, 'JoÆo edison da Silva', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (500, '2017-10-04 00:11:54.641', NULL, 3, true, NULL, '333444', NULL, 'Gisele Correira Abrantes Silva', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (562, '2017-10-04 00:19:10.235', NULL, 3, true, NULL, '00438538720', NULL, 'Maria Cristina R L Caridade', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (563, '2017-10-04 00:19:22.766', NULL, 3, true, NULL, '11835503756', NULL, 'Natalia Romeiro L Caridade', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (566, '2017-10-04 00:20:09.954', NULL, 3, true, NULL, '96719770730', NULL, 'Ricardo Augusto Mendes', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (567, '2017-10-04 00:20:50.563', NULL, 3, true, NULL, '00145753700', NULL, 'Rita de Cassia Mendes', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (568, '2017-10-04 00:21:41.376', NULL, 3, true, NULL, '14348735794', NULL, 'Bruna Fran‡a Mendes', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (590, '2017-10-04 00:47:17.735', NULL, 3, true, NULL, '13940573779', NULL, 'Luana Nunes Aguiar', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (594, '2017-10-04 00:56:56.313', NULL, 3, true, NULL, '07147687744', NULL, 'Marcia Virginia Salodo Patroni', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (620, '2017-10-04 00:17:10.391', NULL, 3, true, NULL, '333999', NULL, 'Rebeca Ferreira Mazzucchelli', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (621, '2017-10-04 00:17:24.657', NULL, 3, true, NULL, '444000', NULL, 'Raquel Prata Mazzucchelli', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (623, '2017-10-04 00:17:57.657', NULL, 3, true, NULL, '64883906787', NULL, 'Katia Maria Pimentel Motta', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (801, '2017-10-04 00:57:53.266', NULL, 3, true, NULL, '36051080759', NULL, 'Fernando Ganiga de Menezes Fil', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (289, '2017-10-04 01:06:15.188', NULL, 3, true, NULL, '777333', NULL, 'Maria Eduarda dos S Dorna', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (292, '2017-10-04 01:07:35.141', NULL, 3, true, NULL, '11332363750', NULL, 'Vanes da Paz de Lira', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (295, '2017-10-04 01:09:39.063', NULL, 3, true, NULL, '79457673700', NULL, 'Maria Teresa Ripper Barbosa Co', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (296, '2017-10-04 01:09:52.594', NULL, 3, true, NULL, '04540990853', NULL, 'Jose Mauro Dorsa Oliveira', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (306, '2017-10-04 01:27:33.266', NULL, 3, true, NULL, '444666', NULL, 'Daniel Caetano Tardite', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (308, '2017-10-04 01:28:49.032', NULL, 3, true, NULL, '444777', NULL, 'Leonardo Kubrak Maciel', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (309, '2017-10-04 01:29:00.36', NULL, 3, true, NULL, '444888', NULL, 'Carolini Kubrak Maciel', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (310, '2017-10-04 01:29:10.892', NULL, 3, true, NULL, '444999', NULL, 'Bohdan Kubrak', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (311, '2017-10-04 01:29:26.094', NULL, 3, true, NULL, '555000', NULL, 'Olga Marlene Esteves Kubrak', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (345, '2017-10-04 01:41:16.5', NULL, 3, true, NULL, '03435671726', NULL, 'Debora Cristina Pereira Barbos', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (346, '2017-10-04 01:41:30.672', NULL, 3, true, NULL, '16382597716', NULL, 'Mateus Pereira Barbosa', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (805, '2017-10-04 00:59:18.596', NULL, 3, true, NULL, '15129736702', NULL, 'Beatriz Valverde', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (807, '2017-10-04 00:13:36.547', NULL, 3, true, NULL, '18358149727', NULL, 'Thiago Damaceno', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (808, '2017-10-04 00:14:27.188', NULL, 3, true, NULL, '61790044120', NULL, 'Keles Firmina Rosa Soares', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (901, '2017-10-04 00:56:10.517', NULL, 3, true, NULL, '08970078754', NULL, 'Lidiane Araujo de Moraes Duniz', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (902, '2017-10-04 00:47:54.282', NULL, 3, true, NULL, '19246266757', NULL, 'Isabela da Silva D de Aguiar', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (903, '2017-10-04 00:19:34.844', NULL, 3, true, NULL, '13347017765', NULL, 'Felipe Romeiro L Caridade', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (904, '2017-10-04 00:19:47.532', NULL, 3, true, NULL, '13347016793', NULL, 'Paloma Romeiro L Caridade', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (905, '2017-10-04 00:22:01.985', NULL, 3, true, NULL, '54642370625', NULL, 'Regina Marcia Barbosa Mendon‡a', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (347, '2017-10-04 01:41:46.422', NULL, 3, true, NULL, '16382603708', NULL, 'Julia Pereira Barbosa', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (351, '2017-10-04 01:42:41.782', NULL, 3, true, NULL, '555333', NULL, 'Adilson Siliprandi da Silva', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (352, '2017-10-04 01:42:54.938', NULL, 3, true, NULL, '555444', NULL, 'Graziele de Oliveira da Silva', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (951, '2017-10-04 00:12:46.813', NULL, 3, true, NULL, '00611308770', NULL, 'Keila Damaceno V. Fernandes', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (356, '2017-10-04 01:43:50.454', NULL, 3, true, NULL, '555777', NULL, 'Laura Serrano Gomez', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (357, '2017-10-04 01:44:04.377', NULL, 3, true, NULL, '555888', NULL, 'Gabriel Medrado de Souza', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (359, '2017-10-04 01:44:41.704', NULL, 3, true, NULL, '01868649733', NULL, 'Elias S de Oliveira', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (360, '2017-10-04 01:44:57.222', NULL, 3, true, NULL, '555999', NULL, 'Paloma Palacio Marcelino', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (361, '2017-10-04 01:45:28.516', NULL, 3, true, NULL, '14462342747', NULL, 'Lydia Palacio Carrons', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (363, '2017-10-04 01:46:10.83', NULL, 3, true, NULL, '08115919721', NULL, 'Leonardo da Cunha Carvalho', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (364, '2017-10-04 01:46:23.485', NULL, 3, true, NULL, '19478509705', NULL, 'Daniel Machado Carvalho', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (365, '2017-10-04 01:46:35.547', NULL, 3, true, NULL, '19995959712', NULL, 'Ana Luiza Machado Carvalho', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (368, '2017-10-04 01:47:58.407', NULL, 3, true, NULL, '09343111703', NULL, 'Carmem Lucia Cabral Saguias', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (369, '2017-10-04 01:48:10.344', NULL, 3, true, NULL, '15744152717', NULL, 'Mariana Saguias da Silva', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (370, '2017-10-04 01:48:23.86', NULL, 3, true, NULL, '13991605759', NULL, 'Gabriel Ramalho Saguias da Sil', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (371, '2017-10-04 01:48:40.141', NULL, 3, true, NULL, '16725876706', NULL, 'Caio Vieira Calixto da Sira', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (372, '2017-10-04 01:48:54.313', NULL, 3, true, NULL, '14114991743', NULL, 'Tainah Tavares da Silva', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (381, '2017-10-04 01:52:32.302', NULL, 3, true, NULL, '666111', NULL, 'Christine Silveira', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (388, '2017-10-04 01:55:00.97', NULL, 3, true, NULL, '16220153553', NULL, 'Miguel Assis de Oliveira', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (389, '2017-10-04 01:55:12.47', NULL, 3, true, NULL, '00603709710', NULL, 'Margarida Oliveira Assis', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (398, '2017-10-04 01:59:12.626', NULL, 3, true, NULL, '666333', NULL, 'Rodrigo Giglio Ferreira', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (399, '2017-10-04 01:59:24.985', NULL, 3, true, NULL, '666444', NULL, 'Barbara Von Wieser', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (490, '2017-10-04 01:16:48.891', NULL, 3, true, NULL, '444555', NULL, 'Ana Carolina Saldanha', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (474, '2017-10-04 01:24:54.579', NULL, 3, true, NULL, '13672950769', NULL, 'Romulo Santiago do Carmo', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (508, '2017-10-04 01:05:50.736', NULL, 3, true, NULL, '92338127748', NULL, 'Marcos Luiz de Araujo Nunes', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (509, '2017-10-04 01:06:02.516', NULL, 3, true, NULL, '07226732726', NULL, 'Fernando Dorna Andre', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (505, '2017-10-04 01:01:37.985', NULL, 3, true, NULL, '444222', NULL, 'Deise Rosa Dorna Andre', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (507, '2017-10-04 01:02:02.157', NULL, 3, true, NULL, '07552954710', NULL, 'Kelly Cristina dos S Dorna', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (517, '2017-10-04 00:59:54.297', NULL, 3, true, NULL, '92662820730', NULL, 'William de Andrade Pujol Pasto', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (550, '2017-10-04 00:58:28.157', NULL, 3, true, NULL, '09597470799', NULL, 'Fernando Ganiga de Menezes Net', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (551, '2017-10-04 00:58:48.516', NULL, 3, true, NULL, '09084636775', NULL, 'Michelle Muniz Ganiga de Menez', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (616, '2017-10-04 01:26:42.923', NULL, 3, true, NULL, '02809843759', NULL, 'Patricia Caetano de Melo', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (402, '2017-10-04 02:00:38.376', NULL, 3, true, NULL, '666666', NULL, 'Benito Andre Pepe', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (403, '2017-10-04 02:00:48.766', NULL, 3, true, NULL, '666777', NULL, 'Isabella Andre Pepe', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (659, '2017-10-04 01:50:23.829', NULL, 3, true, NULL, '83236490730', NULL, 'Isabel Pache de Paiva Lirio da', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (660, '2017-10-04 01:50:40.922', NULL, 3, true, NULL, '10485086760', NULL, 'Andreia Cristina Paiva da Silv', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (627, '2017-10-04 01:53:29.282', NULL, 3, true, NULL, '09169340714', NULL, 'Leandro Giglio Ferreira', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (656, '2017-10-04 01:54:25.44', NULL, 3, true, NULL, '10209963743', NULL, 'Karla Barbosa Iendrick Ranna', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (645, '2017-10-04 01:55:51.788', NULL, 3, true, NULL, '08300019723', NULL, 'Cleber Albuquerquer de Souza', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (640, '2017-10-04 01:57:16.766', NULL, 3, true, NULL, '04792905710', NULL, 'Aline L S Pessoa de Barros', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (642, '2017-10-04 01:57:37.36', NULL, 3, true, NULL, '666222', NULL, 'Ana Luisa S Pessoa de Barros', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (626, '2017-10-04 01:53:15.938', NULL, 3, true, NULL, '62769358700', NULL, 'Rita de Cassia Giglio Ferreira', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (648, '2017-10-04 01:49:38.938', NULL, 3, true, NULL, '09283939760', NULL, 'Gabriela Barbosa Proxedes Gome', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (670, '2017-10-04 01:47:25.922', NULL, 3, true, NULL, '89285220720', NULL, 'Jose Ramalho Melo da Silva', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (687, '2017-10-04 01:43:35.223', NULL, 3, true, NULL, '555555', NULL, 'Marcelo Ferreira de Souza', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (686, '2017-10-04 01:43:23.438', NULL, 3, true, NULL, '06218123710', NULL, 'Marta Cecilia Gomez Gomez', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (679, '2017-10-04 01:42:21.188', NULL, 3, true, NULL, '555111', NULL, 'Gisele de Oliveira da Silva', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (678, '2017-10-04 01:42:09.985', NULL, 3, true, NULL, '11912211726', NULL, 'Rodrigo Santos de Freitas', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (489, '2017-10-04 01:16:37.032', NULL, 3, true, NULL, '9424881887', NULL, 'Denilson de Moura Pestana', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (806, '2017-10-04 01:27:23.844', NULL, 3, true, NULL, '03744692701', NULL, 'Maria Irma Caetano de Melo', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (617, '2017-10-04 01:59:50.141', NULL, 3, true, NULL, '80352863749', NULL, 'Benito dos Santos Pepe', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (610, '2017-10-04 02:01:09.094', NULL, 3, true, NULL, '01823380700', NULL, 'Rodrigo Nassif de Lima', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (613, '2017-10-04 02:02:23.751', NULL, 3, true, NULL, '666999', NULL, 'Eduardo da SIlva Lima', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (614, '2017-10-04 02:02:37.376', NULL, 3, true, NULL, '777000', NULL, 'Lavinia da Silva Lima', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (604, '2017-10-04 02:02:55.173', NULL, 3, true, NULL, '09268407701', NULL, 'Aline dos Santos Moreira', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (608, '2017-10-04 02:03:23.829', NULL, 3, true, NULL, '777222', NULL, 'Matheus Moreira Sousa', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (606, '2017-10-04 02:03:45.876', NULL, 3, true, NULL, '777444', NULL, 'Rosalia Maria dos Santos', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (809, '2017-10-04 00:59:07.803', NULL, 3, true, NULL, '10637978706', NULL, 'JoÆo Felipe Pujol Ganiga de Me', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (602, '2017-10-04 02:05:28.985', NULL, 3, true, NULL, '15956463708', NULL, 'Marianna Martins Ribeiro', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (900, '2017-10-04 00:59:34.844', NULL, 3, true, NULL, '444111', NULL, 'Maria Luisa M Ganiga de Meneze', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (601, '2017-10-04 02:05:16.298', NULL, 3, true, NULL, '02485579717', NULL, 'Luciana Martins Ribeiro', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (592, '2017-10-04 02:06:58.36', NULL, 3, true, NULL, '12327006732', NULL, 'Thiago S Cavalcante', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (426, '2017-10-04 02:08:21.684', NULL, 3, true, NULL, '777666', NULL, 'Miguel Figueiredo Viglio', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (596, '2017-10-04 02:06:08.11', NULL, 3, true, NULL, '67940145991', NULL, 'Marco A das Nevez Bustamante', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (597, '2017-10-04 02:06:18.782', NULL, 3, true, NULL, '18421044702', NULL, 'Thais de Araujo Bustamante', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (586, '2017-10-04 02:07:54.485', NULL, 3, true, NULL, '03747133754', NULL, 'Alessandra Santos da Silva', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (585, '2017-10-04 02:07:39.975', NULL, 3, true, NULL, '05579213760', NULL, 'Francisca Moreyra de Figueired', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (584, '2017-10-04 02:07:19.297', NULL, 3, true, NULL, '08510146748', NULL, 'Marcelo Pereira Paim Viglio', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (581, '2017-10-04 02:08:36.516', NULL, 3, true, NULL, '08476925743', NULL, 'Vanessa de Oliveira', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (437, '2017-10-04 02:11:25.579', NULL, 3, true, NULL, '888000', NULL, 'Felipe Pereira Lisboa', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (438, '2017-10-04 02:11:36.126', NULL, 3, true, NULL, '888111', NULL, 'Claudio Henrique Padilha Lisbo', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (442, '2017-10-04 02:12:29.688', NULL, 3, true, NULL, '888333', NULL, 'Patricia Pinto Alvarenga', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (445, '2017-10-04 02:13:20.428', NULL, 3, true, NULL, '12740724764', NULL, 'Lucas Moreno Feio de Lemos', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (446, '2017-10-04 02:13:41.344', NULL, 3, true, NULL, '12420111702', NULL, 'Gabriela Serpa Medina Barbosa', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (452, '2017-10-04 02:15:15.547', NULL, 3, true, NULL, '93510019768', NULL, 'Elaine SerrÆo Louren‡o Costa', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (455, '2017-10-04 02:15:44.298', NULL, 3, true, NULL, '888444', NULL, 'Erika SerrÆo Loure‡o Costa', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (456, '2017-10-04 02:16:38.454', NULL, 3, true, NULL, '888777', NULL, 'Erick SerrÆo Loure‡o Costa', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (457, '2017-10-04 02:16:49.61', NULL, 3, true, NULL, '888888', NULL, 'Elida SerrÆo Loure‡o Costa', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (458, '2017-10-04 00:16:34.469', NULL, 3, true, NULL, '74771515700', NULL, 'Vania augusta M. Da Silva', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (803, '2017-10-04 00:11:01.985', NULL, 3, true, NULL, '14394417740', NULL, 'Lucas Figueiredo Silva', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (658, '2017-10-04 01:50:01.969', NULL, 3, true, NULL, '11273054253', NULL, 'Rogerio Fernando Lirio da SIlv', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (661, '2017-10-04 01:50:55.329', NULL, 3, true, NULL, '87195151700', NULL, 'Francisco Silva de Carvalho', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (282, '2017-10-04 00:16:58.938', NULL, 3, true, NULL, '00267748523', NULL, 'Michelli Ferreira P Mazzucchil', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (276, '2017-10-03 23:31:42.985', NULL, 3, true, NULL, '038833980613', NULL, 'Shirley Nogueira J Gusmao', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (406, '2017-10-06 23:39:49.5', NULL, 3, true, NULL, '666888', NULL, 'Ana Claudia Gon‡alves da Silva', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (564, '2017-10-04 02:09:14.657', NULL, 3, true, NULL, '11671997743', NULL, 'Rafael Almeida Cruz', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (565, '2017-10-04 02:09:25.938', NULL, 3, true, NULL, '09184940794', NULL, 'Carolina GuimarÆes Prado', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (569, '2017-10-04 02:11:00.172', NULL, 3, true, NULL, '00633551759', NULL, 'Carlos Eduardo de Oliveira Lis', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (543, '2017-10-04 02:13:04.048', NULL, 3, true, NULL, '12740723792', NULL, 'Pedro Moreno Feio de Lemos', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (465, '2017-10-10 10:10:03.139', NULL, 3, true, NULL, '19405754785', NULL, 'Lucas Braga da Silva Rodrigues', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1002, '2017-10-10 16:54:32.014', NULL, 3, true, NULL, '08219582758', NULL, 'Fernanda Duarte Ganime Martins', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (950, '2017-10-04 00:57:15.923', NULL, 3, true, NULL, '00791188019', NULL, 'Marcio Andriotti', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (576, '2017-10-04 02:10:40.516', NULL, 3, true, NULL, '14660793710', NULL, 'Rafaela Ferreira Santos Neves', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (558, '2017-10-04 02:11:53.907', NULL, 3, true, NULL, '64850862772', NULL, 'Mario Luiz ramos Alvarenga', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (559, '2017-10-04 02:12:07.079', NULL, 3, true, NULL, '00073322709', NULL, 'Eliana Pinto Alvarenga', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (554, '2017-10-04 02:14:20.581', NULL, 3, true, NULL, '07937346736', NULL, 'Carlos Eduardo Torres Padilha', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (556, '2017-10-04 02:14:45.707', NULL, 3, true, NULL, '24300322791', NULL, 'JoÆo Batista Padilha', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (555, '2017-10-04 02:14:34.532', NULL, 3, true, NULL, '06974401760', NULL, 'Sonia Maria Torres Padilha', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1018, '2017-10-13 14:21:06.605', NULL, 3, true, NULL, '76645720700', NULL, 'Margareth Vogel Gomes de Mello', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1031, '2017-10-13 17:20:03.504', NULL, 3, true, NULL, '06425621990', NULL, 'Ricardo Vogel Gomes de Mello', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1032, '2017-10-13 17:25:08.34', NULL, 3, true, NULL, '12659189706', NULL, 'Shayra Bettcher Abreu Lopes', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1051, '2017-10-16 14:26:52.299', NULL, 3, true, NULL, '07649237737', NULL, 'Patricia de Lima Rodrigues ', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1108, '2017-10-18 10:33:05.169', NULL, 3, true, NULL, '310525282', NULL, 'Luana Mendes de Ara£jo', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1166, '2017-10-19 17:50:07.183', NULL, 3, true, NULL, '105754719728', NULL, 'Talita Silva Miranda ', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1290, '2017-10-25 10:48:22.653', NULL, 3, true, NULL, '282986140', NULL, 'Pedro Henrique Tibau Marques', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1292, '2017-10-25 10:57:44.774', NULL, 3, true, NULL, '49242610763', NULL, 'Zenilde Lemos Pereira ', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1297, '2017-10-25 11:50:45.058', NULL, 3, true, NULL, '11720787778', NULL, 'Helayne Vieira Mi¤ana Marreno ', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1298, '2017-10-25 11:58:21.496', NULL, 3, true, NULL, '18716309758', NULL, 'Ana Karoline Pereira de Jesus', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1299, '2017-10-25 12:00:09.012', NULL, 3, true, NULL, '13591858790', NULL, 'Alice Pereira de Jesus ', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1300, '2017-10-25 12:01:25.558', NULL, 3, true, NULL, '37211269715', NULL, 'Eli Nunes de A. Bezerra ', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1318, '2017-10-26 10:55:01.246', NULL, 3, true, NULL, '04765894878', NULL, 'Heloisa Helena Tiago Figueira', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1324, '2017-10-26 16:10:20.699', NULL, 3, true, NULL, '17782337755', NULL, 'Geovanna Jesus C. da Silva', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1325, '2017-10-26 16:12:05.199', NULL, 3, true, NULL, '07433284770', NULL, 'Sheila Barros Calado da Silva ', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1329, '2017-10-31 10:20:49.658', NULL, 3, true, NULL, '15315337790', NULL, 'Thiago D''avila Portugal', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1330, '2017-10-31 10:21:47.449', NULL, 3, true, NULL, '61054070768', NULL, 'Maria D''avila Carneiro Nunes', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1331, '2017-10-31 10:22:46.98', NULL, 3, true, NULL, '10462420752', NULL, 'Simone da Silva Lopes', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1332, '2017-10-31 11:27:27.84', NULL, 3, true, NULL, '25632329704', NULL, 'Celio EStolano da Silveira ', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1333, '2017-10-31 11:28:47.016', NULL, 3, true, NULL, '13944831715', NULL, 'Henry LeÆo da Silveira ', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (728, '2017-10-03 23:13:01.47', NULL, 3, true, NULL, '555', NULL, 'Alexandre Amorim Pereira', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (732, '2017-10-03 23:27:53.188', NULL, 3, true, NULL, '45711615904', NULL, 'Veronica Oliveira de Almeida', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (264, '2017-10-04 00:01:39.173', NULL, 3, true, NULL, '77511476791', NULL, 'Inez Aparecida da Costa Rodrig', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (258, '2017-10-03 23:14:13.938', NULL, 3, true, NULL, '02932121120', NULL, 'Stella Maris Rezende', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (72, '2017-10-03 23:29:59.833', NULL, 3, true, NULL, '369916867100', NULL, 'Jose Francisco Ladeira Neto', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (73, '2017-10-03 23:30:18.048', NULL, 3, true, NULL, '12423557744', NULL, 'Lucas Alves Ladeira', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (74, '2017-10-03 23:30:38.594', NULL, 3, true, NULL, '13881749799', NULL, 'Mateus Alves Ladeira', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (78, '2017-10-03 23:32:50.891', NULL, 3, true, NULL, '16639100750', NULL, 'JoÆo Pedro N Gusmao', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (79, '2017-10-03 23:32:59.485', NULL, 3, true, NULL, '777', NULL, 'Maria Julia N Gusmao', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (86, '2017-10-03 23:36:20.141', NULL, 3, true, NULL, '07648941708', NULL, 'Monica de Oliveira Soares', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (87, '2017-10-03 23:36:44.704', NULL, 3, true, NULL, '888', NULL, 'JoÆo Vitor O S Soares', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (88, '2017-10-03 23:37:08.188', NULL, 3, true, NULL, '999', NULL, 'JoÆo Pedro O S Soares', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (90, '2017-10-03 23:37:55.938', NULL, 3, true, NULL, '04766674707', NULL, 'Ana Paula Lima da Silva', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (91, '2017-10-03 23:38:08.454', NULL, 3, true, NULL, '111222', NULL, 'JoÆo Pedro Alves da Silva', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (92, '2017-10-03 23:38:26.063', NULL, 3, true, NULL, '111333', NULL, 'Maria Luisa Lima A da Silva', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (703, '2017-10-03 23:00:14.032', NULL, 3, true, NULL, '000', NULL, 'Luiz Gonza‡a de Lima J Junior', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (121, '2017-10-03 23:56:38.818', NULL, 3, true, NULL, '111888', NULL, 'Jos‚ Carlos Lozano', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (128, '2017-10-03 23:58:13.594', NULL, 3, true, NULL, '99023458753', NULL, 'Joselia Araujo de Almeida', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (129, '2017-10-03 23:58:24.985', NULL, 3, true, NULL, '05184663703', NULL, 'Andre Pereira Araujo', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (130, '2017-10-03 23:58:38.579', NULL, 3, true, NULL, '00127152717', NULL, 'Sandra Pereira Araujo', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (134, '2017-10-03 23:59:26.456', NULL, 3, true, NULL, '0000000000', NULL, 'Walter Leite Vogel', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (136, '2017-10-03 23:59:48.969', NULL, 3, true, NULL, '00000000001', NULL, 'Eduardo Camara Vogel', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (139, '2017-10-04 00:00:03.766', NULL, 3, true, NULL, '00000000002', NULL, 'Siberia Oliveira ', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (148, '2017-10-04 00:02:03.689', NULL, 3, true, NULL, '222333', NULL, 'Vagner da Costa Rodrigues', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (704, '2017-10-03 23:00:34.688', NULL, 3, true, NULL, '01182338747', NULL, 'Carlos Andr‚ Correa', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (151, '2017-10-04 00:02:37.219', NULL, 3, true, NULL, '16006196735', NULL, 'Evelyn de S A Marciano', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (705, '2017-10-03 23:01:02.283', NULL, 3, true, NULL, '03961453772', NULL, 'Maria Lucia Sirqueira Correa', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (470, '2017-10-04 00:02:09.488', NULL, 3, true, NULL, '67010741700', NULL, 'Maria Sandra C. De Oliveira', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (709, '2017-10-03 23:04:01.143', NULL, 3, true, NULL, '00404358730', NULL, 'Cristiane Monteiro da SIlva', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (710, '2017-10-03 23:04:19.313', NULL, 3, true, NULL, '03436142786', NULL, 'Silvana Monteiro da Silva', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (711, '2017-10-03 23:04:32.016', NULL, 3, true, NULL, '111', NULL, 'Carolina Monteiro Nogueira', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (712, '2017-10-03 23:04:58.845', NULL, 3, true, NULL, '15694793722', NULL, 'Gabrielle Monteiro Nogueira', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (713, '2017-10-03 23:06:56.798', NULL, 3, true, NULL, '15021994751', NULL, 'Viviane da Silva Machado', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (717, '2017-10-03 23:08:54.813', NULL, 3, true, NULL, '08845124797', NULL, 'Cezanne Zerbinato', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (71, '2017-10-03 23:29:28.985', NULL, 3, true, NULL, '77529600710', NULL, 'Joseane Alves Ladeira', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (701, '2017-10-03 22:57:55.688', NULL, 3, true, NULL, '40604055749', NULL, 'Elizabeth dos Santos Dionisio', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (84, '2017-10-03 23:35:30.813', NULL, 3, true, NULL, '07596697703', NULL, 'Angelica Clementino Torola', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (127, '2017-10-03 23:57:59.938', NULL, 3, true, NULL, '34747400753', NULL, 'Alexandre Jose Costa de Almeid', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (117, '2017-10-03 23:56:02.517', NULL, 3, true, NULL, '111555', NULL, 'Luiza Alves Lozano', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (147, '2017-10-04 00:01:54.269', NULL, 3, true, NULL, '222222', NULL, 'Vanessa da Costa Rodrigues', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (716, '2017-10-03 23:08:34.893', NULL, 3, true, NULL, '09586761789', NULL, 'Silas Zerbinato', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (85, '2017-10-03 23:35:59.595', NULL, 3, true, NULL, '02200488785', NULL, 'Silvio Jose Serancio Soares', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (77, '2017-10-03 23:32:26.719', NULL, 3, true, NULL, '16635080708', NULL, 'Daniel N Gusmao', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (131, '2017-10-03 23:58:44.579', NULL, 3, true, NULL, '73259365753', NULL, 'Maria Sonia Camara Vogel', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (89, '2017-10-03 23:37:41.876', NULL, 3, true, NULL, '00607731702', NULL, 'Alex Alvea da Silva', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (150, '2017-10-04 00:02:21.346', NULL, 3, true, NULL, '72311398768', NULL, 'Gilmar Cersar Marciano', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (267, '2017-10-03 23:59:19.954', NULL, 3, true, NULL, '08881694778', NULL, 'Andr‚ Cruz de Araujo', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (273, '2017-10-03 23:38:56.598', NULL, 3, true, NULL, '10457286750', NULL, 'Jeferson Silva Odilon', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (190, '2017-10-04 00:11:07.891', NULL, 3, false, NULL, '54789752700', NULL, 'Rosangela Amado de Souza', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (162, '2017-10-04 00:04:45.657', NULL, 3, true, NULL, '55172326715', NULL, 'Jose Carlos Indergand Calfa', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (173, '2017-10-04 00:15:02.126', NULL, 3, true, NULL, '68882416704', NULL, 'Marcia Beatriz Wolosker Tenori', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (189, '2017-10-03 23:12:14.672', NULL, 3, true, NULL, '34519220700', NULL, 'Angela Cristina C de Carvalho', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (161, '2017-10-04 00:04:32.877', NULL, 3, true, NULL, '09176149765', NULL, 'Flavia Rodrigues de Mello', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (235, '2017-10-03 23:53:22.86', NULL, 3, true, NULL, '07194058729', NULL, 'Priscila de Oliveira Freitas', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (257, '2017-10-03 23:13:42.188', NULL, 3, true, NULL, '00532914171', NULL, 'Renato de Rezende Lima', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (240, '2017-10-04 00:18:36.019', NULL, 3, true, NULL, '91219612715', NULL, 'Denizete Piombini', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (226, '2017-10-03 23:06:39.954', NULL, 3, true, NULL, '11206599789', NULL, 'Atila Welington Leite Ribeiro', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (187, '2017-10-04 00:10:33.36', NULL, 3, true, NULL, '74589717700', NULL, 'Jorge Maia Silva', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (251, '2017-10-03 23:02:14.345', NULL, 3, true, NULL, '07339449736', NULL, 'Marcelo Barboza Braga', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (204, '2017-10-04 00:05:35.391', NULL, 3, true, NULL, '34652299753', NULL, 'Leci Maria Bastos', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (209, '2017-10-04 00:11:28.985', NULL, 3, true, NULL, '05425248725', NULL, 'Ricardo Vin¡cius Correia A Sil', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (181, '2017-10-04 00:08:59.36', NULL, 3, true, NULL, '10152766790', NULL, 'Thiago Machado Teixeira Fontes', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (201, '2017-10-03 23:28:03.425', NULL, 3, true, NULL, '63482100730', NULL, 'Marcilio Cavalcante de Almeida', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (216, '2017-10-03 23:10:38.141', NULL, 3, true, NULL, '83340599734', NULL, 'Marcelo Costa Mansur', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (223, '2017-10-04 00:13:54.204', NULL, 3, true, NULL, '11197861777', NULL, 'Barbara Borges F dos Santos', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (175, '2017-10-04 00:07:23.579', NULL, 3, true, NULL, '07936310762', NULL, 'Alex de Moura Leal', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (231, '2017-10-03 23:58:58.688', NULL, 3, true, NULL, '63232731791', NULL, 'Marcia Penido Xavier', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (284, '2017-10-03 23:03:28.174', NULL, 3, true, NULL, '50739999753', NULL, 'Lenilda Monteiro da Silva', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (157, '2017-10-04 00:03:52.516', NULL, 3, true, NULL, '222555', NULL, 'Juliana Bardunio Martins Sanch', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (719, '2017-10-03 23:09:34.673', NULL, 3, true, NULL, '10765121786', NULL, 'Luiza Barros Dantas', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (260, '2017-10-03 23:57:10.938', NULL, 3, true, NULL, '59162996720', NULL, 'S“nia Maria de Carvalho', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (183, '2017-10-04 00:09:35.547', NULL, 3, true, NULL, '06993686775', NULL, 'Anderson Ferreira Gon‡alves', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (164, '2017-10-04 00:05:17.408', NULL, 3, true, NULL, '32423500653', NULL, 'Celso Balbino Feitosa', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (254, '2017-10-03 23:29:02.923', NULL, 3, true, NULL, '09195503714', NULL, 'Rosiene Fiorot Lopes', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (270, '2017-10-04 00:08:43.517', NULL, 3, true, NULL, '05538069710', NULL, 'Vivian Torres Barbosa', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (228, '2017-10-03 23:07:42.532', NULL, 3, true, NULL, '73814938704', NULL, 'Marcelo Karam Machado', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (294, '2017-10-04 01:09:22.829', NULL, 3, true, NULL, '15903390706', NULL, 'Marcelo Cordeiro Dorsa Oliveir', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (304, '2017-10-04 01:27:03.439', NULL, 3, true, NULL, '92710085704', NULL, 'Fabio Polycorpo Tardite', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (350, '2017-10-04 01:42:30.626', NULL, 3, true, NULL, '555222', NULL, 'Denise de Oliveira da Silva', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (511, '2017-10-04 00:57:29.876', NULL, 3, true, NULL, '01519709048', NULL, 'Stephanie Aquino Moschini', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (491, '2017-10-04 00:17:45.032', NULL, 3, true, NULL, '44640625715', NULL, 'Armando Ribeiro Motta', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (286, '2017-10-04 01:04:55.704', NULL, 3, true, NULL, '03009896794X', NULL, 'Valeria Dorna Andre Nunes', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (561, '2017-10-04 00:18:57.594', NULL, 3, true, NULL, '90235800791', NULL, 'Emidio Lamberti Caridade', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (358, '2017-10-04 01:44:26.438', NULL, 3, true, NULL, '02851913735', NULL, 'Vanuza FrazÆo Palacio', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (291, '2017-10-04 01:07:21.657', NULL, 3, true, NULL, '31453429832', NULL, 'Vicente Paulo de Freitas Filho', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (281, '2017-10-04 00:16:40.485', NULL, 3, true, NULL, '333777', NULL, 'Pedro Ivo da SIlva Mazzucchel', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (307, '2017-10-04 01:28:31.61', NULL, 3, true, NULL, '00252717767', NULL, 'Suzane Esteves Kubrak', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (531, '2017-10-04 00:45:50.204', NULL, 3, true, NULL, '02190218721', NULL, 'Marcio Freitas de Aguiar', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (571, '2017-10-04 00:23:52.219', NULL, 3, true, NULL, '04487078709', NULL, 'Mario Luiz Nogueira Gil', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (540, '2017-10-04 00:55:51.704', NULL, 3, true, NULL, '95731008191', NULL, 'Ricardo Benedito Duniz Carvalh', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (362, '2017-10-04 01:45:56.922', NULL, 3, true, NULL, '02316089771', NULL, 'Luciana Gomes Machado Carvalho', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (494, '2017-10-04 00:14:42', NULL, 3, true, NULL, '79060250753', NULL, 'Heber de Oliveira Soares', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (533, '2017-10-04 00:55:16.297', NULL, 3, true, NULL, '52962970753', NULL, 'Sergio Pereira Malafaya', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (344, '2017-10-04 01:41:04.532', NULL, 3, true, NULL, '00634138766', NULL, 'Fabio Luis Lima Barbosa', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (367, '2017-10-04 01:47:38.751', NULL, 3, true, NULL, '08500811730', NULL, 'Suzana Aparecida Saguias', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (355, '2017-10-04 01:43:42.064', NULL, 3, true, NULL, '555666', NULL, 'Mateo Gomez de Souza', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (593, '2017-10-04 00:56:40.797', NULL, 3, true, NULL, '78927439791', NULL, 'Luiz Carlos dos Santos Barauna', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (495, '2017-10-04 00:28:40.83', NULL, 3, true, NULL, '0000000', NULL, 'Josiane Pereira de Andrade', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (570, '2017-10-04 00:22:14.047', NULL, 3, true, NULL, '59624221715', NULL, 'Francisco Jose Braga de Matos', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (612, '2017-10-04 00:14:03.501', NULL, 3, true, NULL, '18358168780', NULL, 'Thiago Damaceno', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (431, '2017-10-04 02:09:37.985', NULL, 3, true, NULL, '777888', NULL, 'Isabella Prado Artilheiro', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (436, '2017-10-04 02:11:12.625', NULL, 3, true, NULL, '09777930798', NULL, 'Andrea Pereira Lisboa', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (504, '2017-10-04 01:01:47.661', NULL, 3, true, NULL, '09397722740', NULL, 'Sergio Andre', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (200, '2017-10-03 23:05:58.641', NULL, 3, true, NULL, '29623480172', NULL, 'Vƒnia Lucia Fonseca Camara', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (575, '2017-10-04 02:10:27.704', NULL, 3, true, NULL, '09791715718', NULL, 'Stefan Cruz Contreiras', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (401, '2017-10-04 02:00:25.735', NULL, 3, true, NULL, '666555', NULL, 'Vania da SIlva', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (644, '2017-10-04 01:55:33.969', NULL, 3, true, NULL, '05704012752', NULL, 'Luana Cristina de Carvalho Mor', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (397, '2017-10-04 01:59:00.876', NULL, 3, true, NULL, '36248991715X', NULL, 'Sergio Martins Ferreira', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (639, '2017-10-04 01:57:04.704', NULL, 3, true, NULL, '77967828704', NULL, 'Janot Pessoa de Barros', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (516, '2017-10-04 00:58:10.844', NULL, 3, true, NULL, '73922854753', NULL, 'Wandete Pujol Ganiga de Meneze', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (472, '2017-10-04 01:24:43.079', NULL, 3, true, NULL, '13119207730', NULL, 'Joana Oliveira Dias do Carmo', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (443, '2017-10-04 02:12:53.88', NULL, 3, true, NULL, '05665311863', NULL, 'Nadia Moreno Rodrigues', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (387, '2017-10-04 01:54:47.86', NULL, 3, true, NULL, '05863690747', NULL, 'Miguel Assis de Oliveira Junio', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (441, '2017-10-04 02:12:17.516', NULL, 3, true, NULL, '888222', NULL, 'William Pinto Alvarenga', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (600, '2017-10-04 02:05:00.032', NULL, 3, true, NULL, '01188926730', NULL, 'Claudio Volga e Silva Ribeiro', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (655, '2017-10-04 01:54:05.907', NULL, 3, true, NULL, '10163799784', NULL, 'Guilherme BrandÆo Ranna', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (410, '2017-10-04 02:03:06.407', NULL, 3, true, NULL, '777111', NULL, 'Marcelo de Carvalho Sousa', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (428, '2017-10-04 02:08:48.97', NULL, 3, true, NULL, '13450452711', NULL, 'Hugo Oliveira L da Motta', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (591, '2017-10-04 02:06:47.548', NULL, 3, true, NULL, '02566957762', NULL, 'Paulo Roberto de Oliveira Juni', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (647, '2017-10-04 01:49:13.032', NULL, 3, true, NULL, '0735638790', NULL, 'Fabio Gomes Vieira', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (425, '2017-10-04 02:08:11.329', NULL, 3, true, NULL, '777555', NULL, 'Gabriel Santos Cunha', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (380, '2017-10-04 01:52:23.563', NULL, 3, true, NULL, '666000', NULL, 'Diogo Fernando Paiva da Silvei', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (625, '2017-10-04 01:53:01.094', NULL, 3, true, NULL, '36248991715', NULL, 'Sergio Martins Ferreira', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1135, '2017-10-18 17:55:33.527', NULL, 3, true, NULL, '15583265701', NULL, 'Juliene Braz', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1009, '2017-10-10 16:59:58.608', NULL, 3, true, NULL, '12381283781', NULL, 'Ycaro LeÆo da Silveira', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1128, '2017-10-18 16:20:29.574', NULL, 3, true, NULL, '07273733741', NULL, 'Cristiane Lemos Pereira ', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1317, '2017-10-26 10:53:36.059', NULL, 3, true, NULL, '04944532814', NULL, 'NapoleÆo Peres Figueira ', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (451, '2017-10-04 02:15:02.251', NULL, 3, true, NULL, '31376568772', NULL, 'Eliezer Louren‡o Costa', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1285, '2017-10-25 10:12:06.449', NULL, 3, true, NULL, '06929968773', NULL, 'Aline Carneiro LeÆo Quintella', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1064, '2017-10-16 16:52:58.043', NULL, 3, true, NULL, '10595246788', NULL, 'Alessandro Ramos Fernandes', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (461, '2017-10-09 17:18:21.172', NULL, 3, true, NULL, '05558628790', NULL, 'Paola Ervatti Gama ', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1110, '2017-10-18 11:50:23.199', NULL, 3, true, NULL, '12118883714', NULL, 'Rafael Rossino Trotte ', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (578, '2017-10-04 02:10:03.11', NULL, 3, true, NULL, '47607580700', NULL, 'Marcio Arthur de Marco', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1015, '2017-10-11 14:48:48.34', NULL, 3, true, NULL, '72899450778', NULL, 'Marilze Vaz Medeiros Juventude', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (553, '2017-10-04 02:14:01.688', NULL, 3, true, NULL, '09150841718', NULL, 'Alice Sofia Pereira Padilha', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1001, '2017-10-10 16:53:52.951', NULL, 3, true, NULL, '18573819715', NULL, 'Carlos Alberto Ganime Martins', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1165, '2017-10-19 17:47:12.215', NULL, 3, true, NULL, '082261351700', NULL, 'Eduardo Vieira Miguens ', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (179, '2017-10-03 22:59:09.188', NULL, 3, true, NULL, '03447305738', NULL, 'Fabiana Fatima C JordÆo Lima', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1335, '2017-10-31 11:54:19.762', NULL, 3, true, NULL, '13928446738', NULL, 'Rafaela de Almeida Uchoa ', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (466, '2017-10-04 00:01:30.236', NULL, 3, true, NULL, '59847433704', NULL, 'Maria de Fatima C. Oliveira', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1020, '2017-10-13 11:57:09.855', NULL, 3, true, NULL, '01080396764', NULL, 'Eduardo Gomes de Ara£jo Junior', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1294, '2017-10-25 11:08:37.902', NULL, 3, true, NULL, '12312073706', NULL, 'Fernanda Lacerda Bezerra Jesus', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1017, '2017-10-13 14:20:39.121', NULL, 3, true, NULL, '49914421768', NULL, 'Marco Aur‚lio Gomes de Mello', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1163, '2017-10-25 10:31:55.293', NULL, 3, true, NULL, '85810037704', NULL, 'Erick Engelke ', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1149, '2017-10-19 10:50:18.201', NULL, 3, true, NULL, '29142407168', NULL, 'Cristiane Morcourt MergulhÆo ', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1337, '2017-10-31 12:04:04.377', NULL, 3, true, NULL, '68534426791', NULL, 'Fabio de Freitas ', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (464, '2017-10-10 10:00:31.498', NULL, 3, true, NULL, '09526524713', NULL, 'Wellignton Dourado Barbosa ', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1323, '2017-10-26 15:38:15.715', NULL, 3, true, NULL, '02090828790', NULL, 'Marluci de Souza Pereira ', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (488, '2017-10-04 01:16:22.329', NULL, 3, true, NULL, '74672940772', NULL, 'Geisa de Oliveira Senna', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (595, '2017-10-04 02:05:47.097', NULL, 3, true, NULL, '01243199717', NULL, 'Adriana de Araujo Butamante', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1327, '2017-10-31 10:18:32.013', NULL, 3, true, NULL, '01647656702', NULL, 'Roberto de Souza Pereira ', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1008, '2017-10-10 16:59:10.154', NULL, 3, true, NULL, '01202225748', NULL, 'Carlos Geovane da Silva', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1296, '2017-10-25 11:32:43.59', NULL, 3, true, NULL, '02570969494', NULL, 'Igor Petherson Dantas Mi¤ana', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1340, '2017-10-31 15:29:51.631', NULL, 3, true, NULL, '04137539723', NULL, 'Amanda de Medeiros Machado', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1363, '2017-11-01 15:20:26.921', NULL, 3, true, NULL, '15696407773', NULL, 'Caroline Monteiro', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1406, '2017-11-03 16:23:19.532', NULL, 3, true, NULL, '12999081790', NULL, 'Mariana Adiala Gomes Ferreira', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1427, '2017-11-06 15:58:08.027', NULL, 3, true, NULL, '14810168735', NULL, 'Eliana Silva de Ar £jo ', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1435, '2017-11-07 11:00:13.683', NULL, 3, true, NULL, '05228064737', NULL, 'Patricia Helena Pizarro Dantas', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1436, '2017-11-07 11:01:07.715', NULL, 3, true, NULL, '000000000000025', NULL, 'Camila Pizarro Dantas', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1483, '2017-11-14 14:08:45.19', NULL, 3, true, NULL, '37743759768', NULL, 'Alzira Machado da Costa ', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1491, '2017-11-16 18:37:09.869', NULL, 3, true, NULL, '93369190753', NULL, 'Raquel Moura Santoro', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1492, '2017-11-16 20:02:32.697', NULL, 3, true, NULL, '10826529704', NULL, 'Maria das Chagas Rodrigues', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1497, '2017-11-17 17:26:23.025', NULL, 3, true, NULL, '05510164778', NULL, 'Roberta Joyce', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1507, '2017-11-17 20:21:45.963', NULL, 3, true, NULL, '10369995724', NULL, 'Luis Paulo', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1522, '2017-11-21 17:14:55.628', NULL, 3, true, NULL, '71943389768', NULL, 'Manoel Vieira Junior', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1529, '2017-11-21 19:31:18.778', NULL, 3, true, NULL, '01864649402', NULL, 'Maricelia da Silva Farias', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1534, '2017-11-22 18:26:18.634', NULL, 3, true, NULL, '99591138415', NULL, 'Michele Albuquerque Azevedo', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1328, '2017-11-23 19:31:54.685', NULL, 3, true, NULL, '89803345753', NULL, 'Irene Cristina Davila Nunes', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1539, '2017-11-23 20:19:50.228', NULL, 3, true, NULL, '11887180702', NULL, 'Daniele Rodrigues Souza', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1544, '2017-11-27 12:45:06.088', NULL, 3, true, NULL, '10622096729', NULL, 'Valdeci da Silvha Santos', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1546, '2017-11-27 13:09:25.181', NULL, 3, true, NULL, '280597318166', NULL, 'Antonio Ricardo Bertoletti', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1541, '2017-11-23 20:49:18.95', NULL, 3, true, NULL, '08852272801', NULL, 'Valdir Furlan Junior ', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1531, '2017-11-22 12:19:46.23', NULL, 3, true, NULL, '05191603710', NULL, 'Vanessa Machado Melo ', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1414, '2017-11-06 09:39:24.121', NULL, 3, true, NULL, '04545795781', NULL, 'Ricardo Ferreira Louzada ', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1494, '2017-11-16 20:15:36.974', NULL, 3, true, NULL, '00055721770', NULL, 'Vladimir Faria de Mattos', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1397, '2017-11-03 14:22:32.793', NULL, 3, true, NULL, '5172586', NULL, 'Marcos Santana de Andrade', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1404, '2017-11-03 16:19:22.738', NULL, 3, true, NULL, '13978010771', NULL, 'Renan de Souza Neves Rodrigues', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1536, '2017-11-23 13:21:40.541', NULL, 3, true, NULL, '35083635895', NULL, 'Debora Gomes Aranda ', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1482, '2017-11-14 14:07:19.297', NULL, 3, true, NULL, '84445190730', NULL, 'Luis Fernando Correa da Costa ', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1438, '2017-11-07 16:54:10.782', NULL, 3, true, NULL, '02174817799', NULL, 'Fernando dos Santos da Cunha', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1426, '2017-11-06 15:54:49.949', NULL, 3, true, NULL, '05519556784', NULL, 'Glaucio Gomes Rocha ', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1485, '2017-11-16 17:09:11.072', NULL, 3, true, NULL, '11799368769', NULL, 'Soraya Novaes Marx', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1490, '2017-11-16 18:34:03.478', NULL, 3, true, NULL, '07775668776', NULL, 'Bruno Coe Chagas Pires', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1361, '2017-11-01 15:02:04.262', NULL, 3, true, NULL, '01643862707', NULL, 'Pedro Mendon‡a', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1527, '2017-11-21 18:59:26.619', NULL, 3, true, NULL, '01302755730', NULL, 'Adriana Rayol Pedrenho', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1434, '2017-11-07 10:59:12.047', NULL, 3, true, NULL, '10297408798', NULL, 'Gabriel Pizarro Dantas', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1533, '2017-11-22 18:24:10.854', NULL, 3, true, NULL, '00747786410', NULL, 'µlvaro Santos de Azevedo', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1501, '2017-11-17 20:11:13.65', NULL, 3, true, NULL, '10614865751', NULL, 'Jessica Helena da Solva Santos', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1543, '2017-11-27 12:43:43.509', NULL, 3, true, NULL, '00225956780', NULL, 'Maria Jos‚ Cardoso ', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1538, '2017-11-23 20:18:51.931', NULL, 3, true, NULL, '10502938781', NULL, 'Daniel Soares da Silva ', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1487, '2017-11-16 17:47:31.385', NULL, 3, true, NULL, '09278205796', NULL, 'Daiene Lobo Aguiar', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1553, '2017-11-27 21:30:17.462', NULL, 3, true, NULL, '05381402758', NULL, 'Juliene Braz', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1513, '2017-11-21 17:04:46.087', NULL, 3, true, NULL, '71944389768', NULL, 'ManoelVieira Junior', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1374, '2017-11-01 16:56:44.699', NULL, 3, true, NULL, '02153377781', NULL, 'Adriana Miranda Soares', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1511, '2017-11-21 15:24:01.526', NULL, 3, true, NULL, '36988553720', NULL, 'Odilson Salermo', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1548, '2017-11-27 18:57:48.291', NULL, 3, true, NULL, '10067114733', NULL, 'Mikail Menezes Chaban', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);
INSERT INTO public.morador (id, data_hora_cadastro, data_hora_modificacao, id_usuario, ativo, celular, documento, email, nome, observacao, parentesco, placa_carro, telefone, tipo_documento, tipo_morador, foto64) VALUES (1339, '2017-10-31 14:20:20.231', NULL, 3, true, NULL, '10604528710', NULL, 'Brenda Braga da Costa Malizia ', NULL, NULL, NULL, NULL, NULL, 'PROPRIETARIO', NULL);


--
-- TOC entry 3052 (class 0 OID 16453)
-- Dependencies: 206
-- Data for Name: noticia; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3069 (class 0 OID 24972)
-- Dependencies: 224
-- Data for Name: parceiro; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3053 (class 0 OID 16458)
-- Dependencies: 207
-- Data for Name: parceiros; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3054 (class 0 OID 16463)
-- Dependencies: 208
-- Data for Name: permissao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.permissao (codigo, descricao) VALUES (1, 'ROLE_SISTEMAS_READ');
INSERT INTO public.permissao (codigo, descricao) VALUES (2, 'ROLE_SISTEMAS_WRITE');


--
-- TOC entry 3056 (class 0 OID 16470)
-- Dependencies: 210
-- Data for Name: rota; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3071 (class 0 OID 24980)
-- Dependencies: 226
-- Data for Name: servico; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3057 (class 0 OID 16476)
-- Dependencies: 211
-- Data for Name: servicos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3058 (class 0 OID 16481)
-- Dependencies: 212
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuario (id, ativo, login, primeiro_nome, senha, ultimo_nome, id_empresa) VALUES (1, true, 'ebraz', 'Elias', 'braz..', 'Braz', NULL);
INSERT INTO public.usuario (id, ativo, login, primeiro_nome, senha, ultimo_nome, id_empresa) VALUES (3, true, 'jubraz', 'Juliene', 'ju201115', 'Braz', 2);
INSERT INTO public.usuario (id, ativo, login, primeiro_nome, senha, ultimo_nome, id_empresa) VALUES (1010, true, 'jbraga', 'Josemir', 'jbraga', 'Braga', 2);
INSERT INTO public.usuario (id, ativo, login, primeiro_nome, senha, ultimo_nome, id_empresa) VALUES (1477, true, 'pimenta', 'Marcos', 'marcos13', 'Pimenta', 2);
INSERT INTO public.usuario (id, ativo, login, primeiro_nome, senha, ultimo_nome, id_empresa) VALUES (1478, true, 'moutta', 'Marco', 'marco12', 'Moutta', 2);


--
-- TOC entry 3059 (class 0 OID 16489)
-- Dependencies: 213
-- Data for Name: usuario_permissao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuario_permissao (id_usuario, id_permissao) VALUES (1, 1);
INSERT INTO public.usuario_permissao (id_usuario, id_permissao) VALUES (1, 2);


--
-- TOC entry 3061 (class 0 OID 16494)
-- Dependencies: 215
-- Data for Name: veiculo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3073 (class 0 OID 24988)
-- Dependencies: 228
-- Data for Name: viagem; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3075 (class 0 OID 24996)
-- Dependencies: 230
-- Data for Name: viagem_residente; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3102 (class 0 OID 0)
-- Dependencies: 235
-- Name: bloco_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bloco_id_seq', 1403, true);


--
-- TOC entry 3103 (class 0 OID 0)
-- Dependencies: 234
-- Name: condominio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.condominio_id_seq', 4, true);


--
-- TOC entry 3104 (class 0 OID 0)
-- Dependencies: 233
-- Name: construtora_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.construtora_id_seq', 4, true);


--
-- TOC entry 3105 (class 0 OID 0)
-- Dependencies: 219
-- Name: documento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.documento_id_seq', 1, false);


--
-- TOC entry 3106 (class 0 OID 0)
-- Dependencies: 232
-- Name: empresa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empresa_id_seq', 4, true);


--
-- TOC entry 3107 (class 0 OID 0)
-- Dependencies: 221
-- Name: evento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.evento_id_seq', 1, false);


--
-- TOC entry 3108 (class 0 OID 0)
-- Dependencies: 216
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 1, false);


--
-- TOC entry 3109 (class 0 OID 0)
-- Dependencies: 231
-- Name: morador_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.morador_id_seq', 1555, true);


--
-- TOC entry 3110 (class 0 OID 0)
-- Dependencies: 223
-- Name: parceiro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.parceiro_id_seq', 1, false);


--
-- TOC entry 3111 (class 0 OID 0)
-- Dependencies: 209
-- Name: rota_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rota_id_seq', 1, false);


--
-- TOC entry 3112 (class 0 OID 0)
-- Dependencies: 225
-- Name: servico_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.servico_id_seq', 1, false);


--
-- TOC entry 3113 (class 0 OID 0)
-- Dependencies: 214
-- Name: veiculo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veiculo_id_seq', 1, false);


--
-- TOC entry 3114 (class 0 OID 0)
-- Dependencies: 227
-- Name: viagem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.viagem_id_seq', 1, false);


--
-- TOC entry 3115 (class 0 OID 0)
-- Dependencies: 229
-- Name: viagem_residente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.viagem_residente_id_seq', 1, false);


--
-- TOC entry 2813 (class 2606 OID 16398)
-- Name: apartamento apartamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apartamento
    ADD CONSTRAINT apartamento_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 16406)
-- Name: bloco bloco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bloco
    ADD CONSTRAINT bloco_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 16411)
-- Name: condominio condominio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.condominio
    ADD CONSTRAINT condominio_pkey PRIMARY KEY (id);


--
-- TOC entry 2819 (class 2606 OID 16416)
-- Name: construtora construtora_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.construtora
    ADD CONSTRAINT construtora_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 24961)
-- Name: documento documento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documento
    ADD CONSTRAINT documento_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 16421)
-- Name: documentos documentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT documentos_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 16426)
-- Name: empresa empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (id);


--
-- TOC entry 2865 (class 2606 OID 24969)
-- Name: evento evento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evento
    ADD CONSTRAINT evento_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 16431)
-- Name: eventos eventos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eventos
    ADD CONSTRAINT eventos_pkey PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 16439)
-- Name: faq faq_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faq
    ADD CONSTRAINT faq_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 16444)
-- Name: fotos fotos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fotos
    ADD CONSTRAINT fotos_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 16452)
-- Name: morador morador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morador
    ADD CONSTRAINT morador_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 16457)
-- Name: noticia noticia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.noticia
    ADD CONSTRAINT noticia_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 24977)
-- Name: parceiro parceiro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parceiro
    ADD CONSTRAINT parceiro_pkey PRIMARY KEY (id);


--
-- TOC entry 2849 (class 2606 OID 16462)
-- Name: parceiros parceiros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parceiros
    ADD CONSTRAINT parceiros_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 16467)
-- Name: permissao permissao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissao
    ADD CONSTRAINT permissao_pkey PRIMARY KEY (codigo);


--
-- TOC entry 2853 (class 2606 OID 16475)
-- Name: rota rota_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rota
    ADD CONSTRAINT rota_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 24985)
-- Name: servico servico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servico
    ADD CONSTRAINT servico_pkey PRIMARY KEY (id);


--
-- TOC entry 2855 (class 2606 OID 16480)
-- Name: servicos servicos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicos
    ADD CONSTRAINT servicos_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 16519)
-- Name: construtora uk_23kg6jlox7fhwwrunm5do8cgy; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.construtora
    ADD CONSTRAINT uk_23kg6jlox7fhwwrunm5do8cgy UNIQUE (nome_fantasia);


--
-- TOC entry 2823 (class 2606 OID 16517)
-- Name: construtora uk_3j84odns0h7b3ou1dmrgfgawx; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.construtora
    ADD CONSTRAINT uk_3j84odns0h7b3ou1dmrgfgawx UNIQUE (cnpj);


--
-- TOC entry 2825 (class 2606 OID 16521)
-- Name: construtora uk_71j7kqip1kt8nhdqc7fhjiuh2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.construtora
    ADD CONSTRAINT uk_71j7kqip1kt8nhdqc7fhjiuh2 UNIQUE (nome_social);


--
-- TOC entry 2831 (class 2606 OID 16523)
-- Name: empresa uk_74xhe5obsc7li6x4q5wi75pd5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT uk_74xhe5obsc7li6x4q5wi75pd5 UNIQUE (cnpj);


--
-- TOC entry 2845 (class 2606 OID 16529)
-- Name: morador uk_bl4o20iy2al1r70d3gu0syxnv; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morador
    ADD CONSTRAINT uk_bl4o20iy2al1r70d3gu0syxnv UNIQUE (documento);


--
-- TOC entry 2859 (class 2606 OID 16531)
-- Name: veiculo uk_luoyk9d8idgi0wif7bxtefsr5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculo
    ADD CONSTRAINT uk_luoyk9d8idgi0wif7bxtefsr5 UNIQUE (placa);


--
-- TOC entry 2833 (class 2606 OID 16527)
-- Name: empresa uk_njdhctlmft2i41ca965ao655c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT uk_njdhctlmft2i41ca965ao655c UNIQUE (nome_social);


--
-- TOC entry 2835 (class 2606 OID 16525)
-- Name: empresa uk_qlim1hfghfaeu2t7e6avnfugi; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT uk_qlim1hfghfaeu2t7e6avnfugi UNIQUE (nome_fantasia);


--
-- TOC entry 2857 (class 2606 OID 16488)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 16499)
-- Name: veiculo veiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculo
    ADD CONSTRAINT veiculo_pkey PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 24993)
-- Name: viagem viagem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viagem
    ADD CONSTRAINT viagem_pkey PRIMARY KEY (id);


--
-- TOC entry 2873 (class 2606 OID 25001)
-- Name: viagem_residente viagem_residente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viagem_residente
    ADD CONSTRAINT viagem_residente_pkey PRIMARY KEY (id);


--
-- TOC entry 2913 (class 2606 OID 25012)
-- Name: evento fk244774pio2ia3a7gmd592awyj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evento
    ADD CONSTRAINT fk244774pio2ia3a7gmd592awyj FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2897 (class 2606 OID 24920)
-- Name: morador fk56q7xfnyjj342l49waw0nm9st; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morador
    ADD CONSTRAINT fk56q7xfnyjj342l49waw0nm9st FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2915 (class 2606 OID 25022)
-- Name: servico fk5ataaiygqsgswr01e5ltwk8yb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servico
    ADD CONSTRAINT fk5ataaiygqsgswr01e5ltwk8yb FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2911 (class 2606 OID 25002)
-- Name: documento fk92j7phksaq8i67esmi9eukvap; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documento
    ADD CONSTRAINT fk92j7phksaq8i67esmi9eukvap FOREIGN KEY (id_apartamento) REFERENCES public.apartamento(id);


--
-- TOC entry 2879 (class 2606 OID 24880)
-- Name: bloco fk93db1il652229bfd1x2v12dt9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bloco
    ADD CONSTRAINT fk93db1il652229bfd1x2v12dt9 FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2883 (class 2606 OID 16575)
-- Name: construtora fk9rquxhfypcvdodxt7s8g2be3o; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.construtora
    ADD CONSTRAINT fk9rquxhfypcvdodxt7s8g2be3o FOREIGN KEY (id_empresa) REFERENCES public.empresa(id);


--
-- TOC entry 2903 (class 2606 OID 16630)
-- Name: servicos fk_3rte82ld9echvajf451dy40kd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicos
    ADD CONSTRAINT fk_3rte82ld9echvajf451dy40kd FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2894 (class 2606 OID 16605)
-- Name: fotos fk_6tup36xmh4sm465pjoj879tp2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fotos
    ADD CONSTRAINT fk_6tup36xmh4sm465pjoj879tp2 FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2890 (class 2606 OID 16595)
-- Name: eventos fk_acdo213gkroyd499ve6fwa5xh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eventos
    ADD CONSTRAINT fk_acdo213gkroyd499ve6fwa5xh FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2886 (class 2606 OID 16585)
-- Name: documentos fk_cffb8qk1uqy2idnru6uu74h4b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT fk_cffb8qk1uqy2idnru6uu74h4b FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2896 (class 2606 OID 16610)
-- Name: morador fk_ejhuoasxmclcjs3fp32sixr8b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morador
    ADD CONSTRAINT fk_ejhuoasxmclcjs3fp32sixr8b FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2898 (class 2606 OID 16615)
-- Name: noticia fk_f5ga2dq1y2mssgwqbkjlebicv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.noticia
    ADD CONSTRAINT fk_f5ga2dq1y2mssgwqbkjlebicv FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2875 (class 2606 OID 16540)
-- Name: apartamento fk_fhan3t949jygiibochaxyy8dm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apartamento
    ADD CONSTRAINT fk_fhan3t949jygiibochaxyy8dm FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2884 (class 2606 OID 16580)
-- Name: construtora fk_frf4qt89c82rq72wx57bkngwb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.construtora
    ADD CONSTRAINT fk_frf4qt89c82rq72wx57bkngwb FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2878 (class 2606 OID 16560)
-- Name: bloco fk_kdo4vccv4g2xnqsrxx0ii73fp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bloco
    ADD CONSTRAINT fk_kdo4vccv4g2xnqsrxx0ii73fp FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2892 (class 2606 OID 16600)
-- Name: faq fk_o9vgdi5pjk0pr8x0s5k5es6w7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faq
    ADD CONSTRAINT fk_o9vgdi5pjk0pr8x0s5k5es6w7 FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2888 (class 2606 OID 16590)
-- Name: empresa fk_pmcu2qpiwd6rjgb33vt0p7imc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT fk_pmcu2qpiwd6rjgb33vt0p7imc FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2881 (class 2606 OID 16570)
-- Name: condominio fk_q5hyqh1xqbedldth1clwo0lhx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.condominio
    ADD CONSTRAINT fk_q5hyqh1xqbedldth1clwo0lhx FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2900 (class 2606 OID 16620)
-- Name: parceiros fk_qrewhve7ug19onjy6ga6yn7ib; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parceiros
    ADD CONSTRAINT fk_qrewhve7ug19onjy6ga6yn7ib FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2919 (class 2606 OID 25042)
-- Name: viagem_residente fkak78lh71ky5kv3rf3d0091il1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viagem_residente
    ADD CONSTRAINT fkak78lh71ky5kv3rf3d0091il1 FOREIGN KEY (id_viagem) REFERENCES public.viagem(id);


--
-- TOC entry 2907 (class 2606 OID 16645)
-- Name: usuario_permissao fkbo8hww1whbpxq8ancjokhnfds; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_permissao
    ADD CONSTRAINT fkbo8hww1whbpxq8ancjokhnfds FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2887 (class 2606 OID 24895)
-- Name: documentos fkcv96wjhh226xyba2enyhqj724; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documentos
    ADD CONSTRAINT fkcv96wjhh226xyba2enyhqj724 FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2902 (class 2606 OID 16625)
-- Name: rota fkdt3sntofa8iqblh20blxslbud; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rota
    ADD CONSTRAINT fkdt3sntofa8iqblh20blxslbud FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2880 (class 2606 OID 16565)
-- Name: condominio fkeyotq6uiv4703h2bb7mxbpnqv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.condominio
    ADD CONSTRAINT fkeyotq6uiv4703h2bb7mxbpnqv FOREIGN KEY (id_construtora) REFERENCES public.construtora(id);


--
-- TOC entry 2877 (class 2606 OID 16555)
-- Name: bloco fkfg8njcoirpqq1wie0lcnlkbun; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bloco
    ADD CONSTRAINT fkfg8njcoirpqq1wie0lcnlkbun FOREIGN KEY (id_condominio) REFERENCES public.condominio(id);


--
-- TOC entry 2899 (class 2606 OID 24925)
-- Name: noticia fkfx9b34p38aae4bd8b9u9rm1gj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.noticia
    ADD CONSTRAINT fkfx9b34p38aae4bd8b9u9rm1gj FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2885 (class 2606 OID 24890)
-- Name: construtora fkg12i2yldunn5rehl51b42ft4g; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.construtora
    ADD CONSTRAINT fkg12i2yldunn5rehl51b42ft4g FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2909 (class 2606 OID 16704)
-- Name: apartamento_morador fkhhmdmx3oakywy8hcrurmy020p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apartamento_morador
    ADD CONSTRAINT fkhhmdmx3oakywy8hcrurmy020p FOREIGN KEY (id_apartamento) REFERENCES public.apartamento(id);


--
-- TOC entry 2876 (class 2606 OID 24875)
-- Name: apartamento fkhnmyytibwkhlhox4w27cvxr65; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apartamento
    ADD CONSTRAINT fkhnmyytibwkhlhox4w27cvxr65 FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2905 (class 2606 OID 16635)
-- Name: usuario fki6afn0oum3c6ejol9ahlluox2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fki6afn0oum3c6ejol9ahlluox2 FOREIGN KEY (id_empresa) REFERENCES public.empresa(id);


--
-- TOC entry 2901 (class 2606 OID 24930)
-- Name: parceiros fkip98sbxbgou109x4cge0gc2hm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parceiros
    ADD CONSTRAINT fkip98sbxbgou109x4cge0gc2hm FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2916 (class 2606 OID 25027)
-- Name: viagem fkiyjpw4ooob76vdj7npu7y1is; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viagem
    ADD CONSTRAINT fkiyjpw4ooob76vdj7npu7y1is FOREIGN KEY (id_rota) REFERENCES public.rota(id);


--
-- TOC entry 2912 (class 2606 OID 25007)
-- Name: documento fkj2mcq74rsx73865hgk2neuvl7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documento
    ADD CONSTRAINT fkj2mcq74rsx73865hgk2neuvl7 FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2918 (class 2606 OID 25037)
-- Name: viagem_residente fkjp98al4lcbpy567v7c3hs7jk8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viagem_residente
    ADD CONSTRAINT fkjp98al4lcbpy567v7c3hs7jk8 FOREIGN KEY (id_morador) REFERENCES public.morador(id);


--
-- TOC entry 2906 (class 2606 OID 16640)
-- Name: usuario_permissao fkjvcxjnrmdhdv6eti5d7svm5xw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_permissao
    ADD CONSTRAINT fkjvcxjnrmdhdv6eti5d7svm5xw FOREIGN KEY (id_permissao) REFERENCES public.permissao(codigo);


--
-- TOC entry 2908 (class 2606 OID 16650)
-- Name: veiculo fkk577j6543k9gnm97c090afpfn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculo
    ADD CONSTRAINT fkk577j6543k9gnm97c090afpfn FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2895 (class 2606 OID 24915)
-- Name: fotos fkk59cstpsdb3mfqag404jojqrv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fotos
    ADD CONSTRAINT fkk59cstpsdb3mfqag404jojqrv FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2910 (class 2606 OID 16709)
-- Name: apartamento_morador fkk8vo0t85kcbn8o7cown0diwih; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apartamento_morador
    ADD CONSTRAINT fkk8vo0t85kcbn8o7cown0diwih FOREIGN KEY (id_morador) REFERENCES public.morador(id);


--
-- TOC entry 2874 (class 2606 OID 16534)
-- Name: apartamento fklahar925k98po6gejb4g4w8uh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apartamento
    ADD CONSTRAINT fklahar925k98po6gejb4g4w8uh FOREIGN KEY (id_bloco) REFERENCES public.bloco(id);


--
-- TOC entry 2891 (class 2606 OID 24905)
-- Name: eventos fklb8utpugis4k8c2ji49m1nlrd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eventos
    ADD CONSTRAINT fklb8utpugis4k8c2ji49m1nlrd FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2882 (class 2606 OID 24885)
-- Name: condominio fkn2onb9ssop04wpijee0honu6s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.condominio
    ADD CONSTRAINT fkn2onb9ssop04wpijee0honu6s FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2914 (class 2606 OID 25017)
-- Name: parceiro fkna5uju3x99kmv66jfs315pxq8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parceiro
    ADD CONSTRAINT fkna5uju3x99kmv66jfs315pxq8 FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2904 (class 2606 OID 24935)
-- Name: servicos fkoimt6mapef3j278717xydmyta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicos
    ADD CONSTRAINT fkoimt6mapef3j278717xydmyta FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2917 (class 2606 OID 25032)
-- Name: viagem fkru3k1t25mohx77kdb0t8coqba; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viagem
    ADD CONSTRAINT fkru3k1t25mohx77kdb0t8coqba FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2889 (class 2606 OID 24900)
-- Name: empresa fkry3txwk27nut54r5wwd80mob2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT fkry3txwk27nut54r5wwd80mob2 FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


--
-- TOC entry 2893 (class 2606 OID 24910)
-- Name: faq fktn7pm032ce7pe0am7p2s6y543; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faq
    ADD CONSTRAINT fktn7pm032ce7pe0am7p2s6y543 FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


-- Completed on 2018-05-19 20:16:43

--
-- PostgreSQL database dump complete
--

