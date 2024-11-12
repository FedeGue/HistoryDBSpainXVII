--
-- PostgreSQL database cluster dump
--

-- Started on 2024-10-25 10:05:59

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2024-10-25 10:05:59

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Completed on 2024-10-25 10:06:04

--
-- PostgreSQL database dump complete
--

--
-- Database "History" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2024-10-25 10:06:04

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4961 (class 1262 OID 17125)
-- Name: History; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "History" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Italian_Italy.1252';


ALTER DATABASE "History" OWNER TO postgres;

\connect "History"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 228 (class 1259 OID 17231)
-- Name: archive_series; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.archive_series (
    series_id smallint NOT NULL,
    series_denom text NOT NULL,
    archive text NOT NULL
);


ALTER TABLE public.archive_series OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17230)
-- Name: archive_series_series_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.archive_series_series_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.archive_series_series_id_seq OWNER TO postgres;

--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 227
-- Name: archive_series_series_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.archive_series_series_id_seq OWNED BY public.archive_series.series_id;


--
-- TOC entry 234 (class 1259 OID 17429)
-- Name: authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authors (
    author_id smallint NOT NULL,
    person_id integer
);


ALTER TABLE public.authors OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 17428)
-- Name: authors_author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.authors_author_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.authors_author_id_seq OWNER TO postgres;

--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 233
-- Name: authors_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.authors_author_id_seq OWNED BY public.authors.author_id;


--
-- TOC entry 230 (class 1259 OID 17268)
-- Name: documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documents (
    doc_id smallint NOT NULL,
    type character varying(50) NOT NULL,
    date date,
    language character varying(50) NOT NULL,
    title text NOT NULL,
    series_id integer NOT NULL,
    recipient_person_id integer,
    recipient_institution_id integer,
    writer_person_id integer,
    writer_institution_id integer,
    CONSTRAINT check_recipient CHECK ((((recipient_person_id IS NOT NULL) AND (recipient_institution_id IS NULL)) OR ((recipient_person_id IS NULL) AND (recipient_institution_id IS NOT NULL)))),
    CONSTRAINT check_writer CHECK ((((writer_person_id IS NOT NULL) AND (writer_institution_id IS NULL)) OR ((writer_person_id IS NULL) AND (writer_institution_id IS NOT NULL))))
);


ALTER TABLE public.documents OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17267)
-- Name: documents_doc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.documents_doc_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.documents_doc_id_seq OWNER TO postgres;

--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 229
-- Name: documents_doc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.documents_doc_id_seq OWNED BY public.documents.doc_id;


--
-- TOC entry 224 (class 1259 OID 17166)
-- Name: institutions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.institutions (
    institution_id smallint NOT NULL,
    institution_name character varying(255) NOT NULL,
    site character varying(50) NOT NULL,
    from_y integer NOT NULL,
    to_y integer NOT NULL
);


ALTER TABLE public.institutions OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17165)
-- Name: institutions_institution_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.institutions_institution_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.institutions_institution_id_seq OWNER TO postgres;

--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 223
-- Name: institutions_institution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.institutions_institution_id_seq OWNED BY public.institutions.institution_id;


--
-- TOC entry 226 (class 1259 OID 17178)
-- Name: office; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.office (
    office_id smallint NOT NULL,
    denomination character varying(255) NOT NULL
);


ALTER TABLE public.office OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17177)
-- Name: office_office_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.office_office_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.office_office_id_seq OWNER TO postgres;

--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 225
-- Name: office_office_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.office_office_id_seq OWNED BY public.office.office_id;


--
-- TOC entry 231 (class 1259 OID 17362)
-- Name: office_person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.office_person (
    person_id integer,
    office_id integer
);


ALTER TABLE public.office_person OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17152)
-- Name: persons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persons (
    person_id integer NOT NULL,
    name text NOT NULL,
    surname text NOT NULL,
    birth integer NOT NULL,
    death integer NOT NULL,
    noble_title text
);


ALTER TABLE public.persons OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17151)
-- Name: persons_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.persons_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.persons_person_id_seq OWNER TO postgres;

--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 221
-- Name: persons_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.persons_person_id_seq OWNED BY public.persons.person_id;


--
-- TOC entry 218 (class 1259 OID 17127)
-- Name: tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tag (
    tag_id smallint NOT NULL,
    tag_name text NOT NULL
);


ALTER TABLE public.tag OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17375)
-- Name: tag_documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tag_documents (
    tag_id integer,
    doc_id integer,
    word_frequency integer NOT NULL
);


ALTER TABLE public.tag_documents OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17126)
-- Name: tag_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tag_tag_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tag_tag_id_seq OWNER TO postgres;

--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 217
-- Name: tag_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tag_tag_id_seq OWNED BY public.tag.tag_id;


--
-- TOC entry 237 (class 1259 OID 17456)
-- Name: tag_treatise; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tag_treatise (
    tag_id integer,
    treat_id integer
);


ALTER TABLE public.tag_treatise OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17441)
-- Name: treatises; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.treatises (
    treat_id smallint NOT NULL,
    treat_title text NOT NULL,
    author_id integer NOT NULL,
    ed_year smallint NOT NULL,
    editor character varying(150) NOT NULL,
    city_of_edition character varying(50) NOT NULL
);


ALTER TABLE public.treatises OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 17440)
-- Name: treatises_treat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.treatises_treat_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.treatises_treat_id_seq OWNER TO postgres;

--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 235
-- Name: treatises_treat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.treatises_treat_id_seq OWNED BY public.treatises.treat_id;


--
-- TOC entry 220 (class 1259 OID 17136)
-- Name: types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.types (
    type character varying(50) NOT NULL,
    type_id smallint NOT NULL
);


ALTER TABLE public.types OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17135)
-- Name: types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.types_type_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.types_type_id_seq OWNER TO postgres;

--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 219
-- Name: types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.types_type_id_seq OWNED BY public.types.type_id;


--
-- TOC entry 4752 (class 2604 OID 17234)
-- Name: archive_series series_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archive_series ALTER COLUMN series_id SET DEFAULT nextval('public.archive_series_series_id_seq'::regclass);


--
-- TOC entry 4754 (class 2604 OID 17432)
-- Name: authors author_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors ALTER COLUMN author_id SET DEFAULT nextval('public.authors_author_id_seq'::regclass);


--
-- TOC entry 4753 (class 2604 OID 17271)
-- Name: documents doc_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents ALTER COLUMN doc_id SET DEFAULT nextval('public.documents_doc_id_seq'::regclass);


--
-- TOC entry 4750 (class 2604 OID 17169)
-- Name: institutions institution_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institutions ALTER COLUMN institution_id SET DEFAULT nextval('public.institutions_institution_id_seq'::regclass);


--
-- TOC entry 4751 (class 2604 OID 17181)
-- Name: office office_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.office ALTER COLUMN office_id SET DEFAULT nextval('public.office_office_id_seq'::regclass);


--
-- TOC entry 4749 (class 2604 OID 17155)
-- Name: persons person_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons ALTER COLUMN person_id SET DEFAULT nextval('public.persons_person_id_seq'::regclass);


--
-- TOC entry 4747 (class 2604 OID 17130)
-- Name: tag tag_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag ALTER COLUMN tag_id SET DEFAULT nextval('public.tag_tag_id_seq'::regclass);


--
-- TOC entry 4755 (class 2604 OID 17444)
-- Name: treatises treat_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatises ALTER COLUMN treat_id SET DEFAULT nextval('public.treatises_treat_id_seq'::regclass);


--
-- TOC entry 4748 (class 2604 OID 17139)
-- Name: types type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types ALTER COLUMN type_id SET DEFAULT nextval('public.types_type_id_seq'::regclass);


--
-- TOC entry 4946 (class 0 OID 17231)
-- Dependencies: 228
-- Data for Name: archive_series; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.archive_series (series_id, series_denom, archive) FROM stdin;
1	Secretarías Provinciales (SSP) Legajo 997	Archivo General de Simancas
2	Secretarías Provinciales (SSP) Legajo 998	Archivo General de Simancas
3	Secretarías Provinciales (SSP) Legajo 999	Archivo General de Simancas
4	SecretaríasProvinciales (SSP) Legajo 1000	Archivo General de Simancas
5	Secretarías Provinciales (SSP) Legajo 1001	Archivo General de Simancas
6	Secretarías Provinciales (SSP) Legajo 1002	Archivo General de Simancas
7	Secretarías Provinciales (SSP) Legajo 1003	Archivo General de Simancas
8	Secretarías Provinciales (SSP) Legajo 1004	Archivo General de Simancas
9	Secretarías Provinciales (SSP) Legajo 1005	Archivo General de Simancas
10	Secretarías Provinciales (SSP) Legajo 1006	Archivo General de Simancas
11	Secretarías Provinciales (SSP) Legajo 1007	Archivo General de Simancas
12	Secretarías Provinciales (SSP) Legajo 1008	Archivo General de Simancas
13	Secretarías Provinciales (SSP) Legajo 1009	Archivo General de Simancas
14	Secretarías Provinciales (SSP) Legajo 1010	Archivo General de Simancas
15	Secretarías Provinciales (SSP) Legajo 1011	Archivo General de Simancas
16	Secretarías Provinciales (SSP) Legajo 1012	Archivo General de Simancas
\.


--
-- TOC entry 4952 (class 0 OID 17429)
-- Dependencies: 234
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authors (author_id, person_id) FROM stdin;
\.


--
-- TOC entry 4948 (class 0 OID 17268)
-- Dependencies: 230
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documents (doc_id, type, date, language, title, series_id, recipient_person_id, recipient_institution_id, writer_person_id, writer_institution_id) FROM stdin;
1	consulta	1623-02-14	spanish	Consulta del Consejo de Italia sobre los gatos secretos, y extraordinarios que han hecho en Napoles los Virreyes en los seis años últimos desde el de 1616 hasta el de 1622 que conforme a la relación del conservador sacada de los bilancos importa 727U944 ducados	1	4	\N	\N	1
\.


--
-- TOC entry 4942 (class 0 OID 17166)
-- Dependencies: 224
-- Data for Name: institutions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.institutions (institution_id, institution_name, site, from_y, to_y) FROM stdin;
1	Real y Supremo Consejo de Italia	Madrid	1556	1717
\.


--
-- TOC entry 4944 (class 0 OID 17178)
-- Dependencies: 226
-- Data for Name: office; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.office (office_id, denomination) FROM stdin;
1	Virrey de Valencia
2	King
\.


--
-- TOC entry 4949 (class 0 OID 17362)
-- Dependencies: 231
-- Data for Name: office_person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.office_person (person_id, office_id) FROM stdin;
4	2
\.


--
-- TOC entry 4940 (class 0 OID 17152)
-- Dependencies: 222
-- Data for Name: persons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.persons (person_id, name, surname, birth, death, noble_title) FROM stdin;
1	Juan Alfonso	Pimentel Enríquez	1553	1621	VIII Conde de Benavente
3	Emanuele Filiberto	di Savoia	1558	1624	Principe di Savoia
4	Felipe Dominico Víctor	Habsburgo	1605	1665	Rey de España y Portugal
\.


--
-- TOC entry 4936 (class 0 OID 17127)
-- Dependencies: 218
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tag (tag_id, tag_name) FROM stdin;
1	generic war
2	royal service
3	arrendamientos
4	donativo
5	mercedes
6	request of mercedes
7	gastos secretos
8	Hacienda Real
9	Reino de Nápoles
10	gastos extraordinarios
11	espías
\.


--
-- TOC entry 4950 (class 0 OID 17375)
-- Dependencies: 232
-- Data for Name: tag_documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tag_documents (tag_id, doc_id, word_frequency) FROM stdin;
\.


--
-- TOC entry 4955 (class 0 OID 17456)
-- Dependencies: 237
-- Data for Name: tag_treatise; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tag_treatise (tag_id, treat_id) FROM stdin;
\.


--
-- TOC entry 4954 (class 0 OID 17441)
-- Dependencies: 236
-- Data for Name: treatises; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.treatises (treat_id, treat_title, author_id, ed_year, editor, city_of_edition) FROM stdin;
\.


--
-- TOC entry 4938 (class 0 OID 17136)
-- Dependencies: 220
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.types (type, type_id) FROM stdin;
consulta	1
decree	2
pragmatic	3
epistle	4
\.


--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 227
-- Name: archive_series_series_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.archive_series_series_id_seq', 16, true);


--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 233
-- Name: authors_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authors_author_id_seq', 1, false);


--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 229
-- Name: documents_doc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.documents_doc_id_seq', 1, true);


--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 223
-- Name: institutions_institution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.institutions_institution_id_seq', 1, true);


--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 225
-- Name: office_office_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.office_office_id_seq', 2, true);


--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 221
-- Name: persons_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.persons_person_id_seq', 4, true);


--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 217
-- Name: tag_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tag_tag_id_seq', 11, true);


--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 235
-- Name: treatises_treat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.treatises_treat_id_seq', 1, false);


--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 219
-- Name: types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.types_type_id_seq', 4, true);


--
-- TOC entry 4769 (class 2606 OID 17238)
-- Name: archive_series archive_series_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archive_series
    ADD CONSTRAINT archive_series_pkey PRIMARY KEY (series_id);


--
-- TOC entry 4773 (class 2606 OID 17434)
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);


--
-- TOC entry 4771 (class 2606 OID 17275)
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (doc_id);


--
-- TOC entry 4765 (class 2606 OID 17171)
-- Name: institutions institutions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institutions
    ADD CONSTRAINT institutions_pkey PRIMARY KEY (institution_id);


--
-- TOC entry 4767 (class 2606 OID 17183)
-- Name: office office_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.office
    ADD CONSTRAINT office_pkey PRIMARY KEY (office_id);


--
-- TOC entry 4763 (class 2606 OID 17159)
-- Name: persons persons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_pkey PRIMARY KEY (person_id);


--
-- TOC entry 4759 (class 2606 OID 17134)
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (tag_id);


--
-- TOC entry 4775 (class 2606 OID 17448)
-- Name: treatises treatises_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatises
    ADD CONSTRAINT treatises_pkey PRIMARY KEY (treat_id);


--
-- TOC entry 4761 (class 2606 OID 17141)
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (type);


--
-- TOC entry 4786 (class 2606 OID 17435)
-- Name: authors authors_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.persons(person_id);


--
-- TOC entry 4776 (class 2606 OID 17409)
-- Name: documents documents_recipient_institution_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_recipient_institution_id_fkey FOREIGN KEY (recipient_institution_id) REFERENCES public.institutions(institution_id);


--
-- TOC entry 4777 (class 2606 OID 17404)
-- Name: documents documents_recipient_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_recipient_person_id_fkey FOREIGN KEY (recipient_person_id) REFERENCES public.persons(person_id);


--
-- TOC entry 4778 (class 2606 OID 17399)
-- Name: documents documents_series_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_series_id_fkey FOREIGN KEY (series_id) REFERENCES public.archive_series(series_id);


--
-- TOC entry 4779 (class 2606 OID 17419)
-- Name: documents documents_writer_institution_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_writer_institution_id_fkey FOREIGN KEY (writer_institution_id) REFERENCES public.institutions(institution_id);


--
-- TOC entry 4780 (class 2606 OID 17414)
-- Name: documents documents_writer_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_writer_person_id_fkey FOREIGN KEY (writer_person_id) REFERENCES public.persons(person_id);


--
-- TOC entry 4782 (class 2606 OID 17370)
-- Name: office_person office_person_office_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.office_person
    ADD CONSTRAINT office_person_office_id_fkey FOREIGN KEY (office_id) REFERENCES public.office(office_id);


--
-- TOC entry 4783 (class 2606 OID 17365)
-- Name: office_person office_person_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.office_person
    ADD CONSTRAINT office_person_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.persons(person_id);


--
-- TOC entry 4784 (class 2606 OID 17383)
-- Name: tag_documents tag_documents_doc_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag_documents
    ADD CONSTRAINT tag_documents_doc_id_fkey FOREIGN KEY (doc_id) REFERENCES public.documents(doc_id);


--
-- TOC entry 4785 (class 2606 OID 17378)
-- Name: tag_documents tag_documents_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag_documents
    ADD CONSTRAINT tag_documents_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tag(tag_id);


--
-- TOC entry 4788 (class 2606 OID 17459)
-- Name: tag_treatise tag_treatise_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag_treatise
    ADD CONSTRAINT tag_treatise_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tag(tag_id);


--
-- TOC entry 4789 (class 2606 OID 17464)
-- Name: tag_treatise tag_treatise_treat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag_treatise
    ADD CONSTRAINT tag_treatise_treat_id_fkey FOREIGN KEY (treat_id) REFERENCES public.treatises(treat_id);


--
-- TOC entry 4787 (class 2606 OID 17449)
-- Name: treatises treatises_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatises
    ADD CONSTRAINT treatises_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.authors(author_id);


--
-- TOC entry 4781 (class 2606 OID 17394)
-- Name: documents type_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT type_id_fk FOREIGN KEY (type) REFERENCES public.types(type);


-- Completed on 2024-10-25 10:06:09

--
-- PostgreSQL database dump complete
--

--
-- Database "History Project" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2024-10-25 10:06:09

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4960 (class 1262 OID 16702)
-- Name: History Project; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "History Project" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Italian_Italy.1252';


ALTER DATABASE "History Project" OWNER TO postgres;

\connect -reuse-previous=on "dbname='History Project'"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 234 (class 1259 OID 16934)
-- Name: archives_documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.archives_documents (
    archivio text NOT NULL,
    serie_archivistica character varying(150) NOT NULL,
    series_code character varying(150),
    series_num character varying(150),
    doc_arch smallint NOT NULL
);


ALTER TABLE public.archives_documents OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 17044)
-- Name: archives_documents_doc_arch_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.archives_documents_doc_arch_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.archives_documents_doc_arch_seq OWNER TO postgres;

--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 235
-- Name: archives_documents_doc_arch_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.archives_documents_doc_arch_seq OWNED BY public.archives_documents.doc_arch;


--
-- TOC entry 220 (class 1259 OID 16731)
-- Name: archivi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.archivi (
    archivio text NOT NULL,
    ubicazione text NOT NULL
);


ALTER TABLE public.archivi OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16814)
-- Name: authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authors (
    author_id smallint NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name text NOT NULL,
    birth_y smallint,
    death_y smallint,
    title text,
    nationality text
);


ALTER TABLE public.authors OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16813)
-- Name: authors_author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.authors_author_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.authors_author_id_seq OWNER TO postgres;

--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 228
-- Name: authors_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.authors_author_id_seq OWNED BY public.authors.author_id;


--
-- TOC entry 223 (class 1259 OID 16749)
-- Name: documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documents (
    doc_id integer NOT NULL,
    date date,
    ente_name character varying(250),
    genre character varying(100),
    photos boolean,
    title text,
    doc_arch smallint
);


ALTER TABLE public.documents OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16748)
-- Name: documents_doc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.documents_doc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.documents_doc_id_seq OWNER TO postgres;

--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 222
-- Name: documents_doc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.documents_doc_id_seq OWNED BY public.documents.doc_id;


--
-- TOC entry 232 (class 1259 OID 16897)
-- Name: documents_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documents_tags (
    doc_id integer NOT NULL,
    tag_name text NOT NULL
);


ALTER TABLE public.documents_tags OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16740)
-- Name: enti; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enti (
    ente_name character varying(250) NOT NULL,
    foundation date,
    location character varying(150)
);


ALTER TABLE public.enti OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16792)
-- Name: figures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.figures (
    official_id smallint NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    nationality text NOT NULL,
    title text NOT NULL,
    birth_y smallint,
    death_y smallint,
    eccl_title text,
    eccl_name character varying(100)
);


ALTER TABLE public.figures OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16919)
-- Name: figures_documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.figures_documents (
    official_id smallint NOT NULL,
    doc_id integer NOT NULL
);


ALTER TABLE public.figures_documents OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16791)
-- Name: figures_official_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.figures_official_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.figures_official_id_seq OWNER TO postgres;

--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 225
-- Name: figures_official_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.figures_official_id_seq OWNED BY public.figures.official_id;


--
-- TOC entry 224 (class 1259 OID 16778)
-- Name: geography; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.geography (
    territory_name text NOT NULL,
    ente_id integer,
    annexion date
);


ALTER TABLE public.geography OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16800)
-- Name: officials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.officials (
    official_id integer,
    off_role character varying(100) NOT NULL,
    serving_from smallint,
    serving_til smallint,
    ente_name character varying(250)
);


ALTER TABLE public.officials OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16713)
-- Name: soggetti; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.soggetti (
    tipo_soggetto text NOT NULL
);


ALTER TABLE public.soggetti OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16722)
-- Name: tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tag (
    tag_id smallint NOT NULL,
    tag_name text NOT NULL
);


ALTER TABLE public.tag OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16721)
-- Name: tag_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tag_tag_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tag_tag_id_seq OWNER TO postgres;

--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 218
-- Name: tag_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tag_tag_id_seq OWNED BY public.tag.tag_id;


--
-- TOC entry 231 (class 1259 OID 16823)
-- Name: treatises; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.treatises (
    treatise_id smallint NOT NULL,
    treat_title text NOT NULL,
    editor text NOT NULL,
    ed_city text NOT NULL,
    ed_year smallint NOT NULL,
    author_id integer,
    lang text NOT NULL,
    tag_name character varying(150)
);


ALTER TABLE public.treatises OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16822)
-- Name: treatises_treatise_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.treatises_treatise_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.treatises_treatise_id_seq OWNER TO postgres;

--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 230
-- Name: treatises_treatise_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.treatises_treatise_id_seq OWNED BY public.treatises.treatise_id;


--
-- TOC entry 4753 (class 2604 OID 17045)
-- Name: archives_documents doc_arch; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archives_documents ALTER COLUMN doc_arch SET DEFAULT nextval('public.archives_documents_doc_arch_seq'::regclass);


--
-- TOC entry 4751 (class 2604 OID 16817)
-- Name: authors author_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors ALTER COLUMN author_id SET DEFAULT nextval('public.authors_author_id_seq'::regclass);


--
-- TOC entry 4749 (class 2604 OID 16752)
-- Name: documents doc_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents ALTER COLUMN doc_id SET DEFAULT nextval('public.documents_doc_id_seq'::regclass);


--
-- TOC entry 4750 (class 2604 OID 16795)
-- Name: figures official_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.figures ALTER COLUMN official_id SET DEFAULT nextval('public.figures_official_id_seq'::regclass);


--
-- TOC entry 4748 (class 2604 OID 16725)
-- Name: tag tag_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag ALTER COLUMN tag_id SET DEFAULT nextval('public.tag_tag_id_seq'::regclass);


--
-- TOC entry 4752 (class 2604 OID 16826)
-- Name: treatises treatise_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatises ALTER COLUMN treatise_id SET DEFAULT nextval('public.treatises_treatise_id_seq'::regclass);


--
-- TOC entry 4953 (class 0 OID 16934)
-- Dependencies: 234
-- Data for Name: archives_documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.archives_documents (archivio, serie_archivistica, series_code, series_num, doc_arch) FROM stdin;
Archivo general de Simancas	Secreterias Provinciales	SSP Leg	995	1
Archivo general de Simancas	Secreterias Provinciales	SSP Leg	997	3
\.


--
-- TOC entry 4939 (class 0 OID 16731)
-- Dependencies: 220
-- Data for Name: archivi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.archivi (archivio, ubicazione) FROM stdin;
Archivo general de Simancas	Simancas ES
Archivio di Stato di Napoli	Napoli IT
\.


--
-- TOC entry 4948 (class 0 OID 16814)
-- Dependencies: 229
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authors (author_id, first_name, last_name, birth_y, death_y, title, nationality) FROM stdin;
1	Fabio	Capece Galeota	1572	1645	Duca della Regina	Napoletano
2	Garsia	Mastrillo	1570	1620	Dottore in Utroque Iure	Siciliano
3	Antonino	Diana	1585	1663	Teatino||Consultore del S. Offizio||Esaminatore del clero romano	Siciliano
4	Tommaso	d Aquino	1224	1274	Domenicano	Roccasecca
\.


--
-- TOC entry 4942 (class 0 OID 16749)
-- Dependencies: 223
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documents (doc_id, date, ente_name, genre, photos, title, doc_arch) FROM stdin;
1	1619-09-14	Consejo de Italia	correspondence	f	que el consejo de Italia trate y busque medios y arbitrios de donde se pueda sacar hazienda. Y que avise lo que se le offrece sobre vender lugares en el Reyno de Napoles	1
4	1623-01-14	Consejo de Italia	correspondence	f	Lo que se ha da responder al Señor Principe Philiberto cerca de lo que escribe que se le dexe la cruzada pa ayuda al Millon Par Flandes	3
\.


--
-- TOC entry 4951 (class 0 OID 16897)
-- Dependencies: 232
-- Data for Name: documents_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documents_tags (doc_id, tag_name) FROM stdin;
1	war
1	Medios y arbitrios
1	venta de lugares
1	servicio de Dios
1	Hacienda
4	provisiones
4	Galeras
4	Renta de la Cruzada
4	Alemania
\.


--
-- TOC entry 4940 (class 0 OID 16740)
-- Dependencies: 221
-- Data for Name: enti; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enti (ente_name, foundation, location) FROM stdin;
Consejo de Italia	1556-01-01	Madrid
Consejo de Flandes	1588-01-01	Madrid
\.


--
-- TOC entry 4945 (class 0 OID 16792)
-- Dependencies: 226
-- Data for Name: figures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.figures (official_id, first_name, last_name, nationality, title, birth_y, death_y, eccl_title, eccl_name) FROM stdin;
1	Juan Alfonso	Pimentel Enríquez	Castilla	VIII Conde de Benavente	1553	1621	no	no
2	Felipe III	Austrias	Castilla	Rey de Castilla, de León, de Aragón, de las dos Sicilias, de Jerusalén, de Portugal, de Navarra, de Granada, de Toledo, de Valencia, de Galicia, de Mallorca, de Sevilla, de Cerdeña, de Córdoba, de Córcega, de Murcia, de Jaén, de los Algarbes, de Algeciras, de Gibraltar, de las islas de Canaria, de las Indias, islas y Tierra Firme del Mar Océano, Archiduque de Austria, Duque de Borgoña, de Brabante y Milán, Conde de Absburgo, de Flandes, de Tirol y de Barcelona, Señor de Vizcaya y de Molina	1578	1621	no	no
3	Emanuele	Filiberto di Savoia	Piemonte	Principe di Savoia	1588	1624	no	no
\.


--
-- TOC entry 4952 (class 0 OID 16919)
-- Dependencies: 233
-- Data for Name: figures_documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.figures_documents (official_id, doc_id) FROM stdin;
1	1
2	1
\.


--
-- TOC entry 4943 (class 0 OID 16778)
-- Dependencies: 224
-- Data for Name: geography; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.geography (territory_name, ente_id, annexion) FROM stdin;
Regno di Sicilia	\N	\N
\.


--
-- TOC entry 4946 (class 0 OID 16800)
-- Dependencies: 227
-- Data for Name: officials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.officials (official_id, off_role, serving_from, serving_til, ente_name) FROM stdin;
\.


--
-- TOC entry 4936 (class 0 OID 16713)
-- Dependencies: 217
-- Data for Name: soggetti; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.soggetti (tipo_soggetto) FROM stdin;
\.


--
-- TOC entry 4938 (class 0 OID 16722)
-- Dependencies: 219
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tag (tag_id, tag_name) FROM stdin;
1	war
2	taxes
3	jurisdicion
4	Catholic Church
5	customary laws
6	Medios y arbitrios
7	Hacienda
8	venta de lugares
9	servicio de Dios
10	enemigos
11	gastos secretos
12	gastos extraordinarios
13	provisiones
14	Renta de la Cruzada
15	Alemania
16	Galeras
\.


--
-- TOC entry 4950 (class 0 OID 16823)
-- Dependencies: 231
-- Data for Name: treatises; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.treatises (treatise_id, treat_title, editor, ed_city, ed_year, author_id, lang, tag_name) FROM stdin;
1	De Principis potestate circa revocationem privilegiorum et concessionum,\npraesertim demanialium, jurisdictionalium et earum etiam quae in contractus transfunduntur\nresponsum	Aegidium Longum	Neapoli	1630	1	latin	taxes
\.


--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 235
-- Name: archives_documents_doc_arch_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.archives_documents_doc_arch_seq', 3, true);


--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 228
-- Name: authors_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authors_author_id_seq', 4, true);


--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 222
-- Name: documents_doc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.documents_doc_id_seq', 8, true);


--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 225
-- Name: figures_official_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.figures_official_id_seq', 3, true);


--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 218
-- Name: tag_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tag_tag_id_seq', 16, true);


--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 230
-- Name: treatises_treatise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.treatises_treatise_id_seq', 1, true);


--
-- TOC entry 4775 (class 2606 OID 17047)
-- Name: archives_documents archives_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archives_documents
    ADD CONSTRAINT archives_documents_pkey PRIMARY KEY (doc_arch);


--
-- TOC entry 4759 (class 2606 OID 16849)
-- Name: archivi archivi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archivi
    ADD CONSTRAINT archivi_pkey PRIMARY KEY (archivio);


--
-- TOC entry 4771 (class 2606 OID 16821)
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);


--
-- TOC entry 4765 (class 2606 OID 16756)
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (doc_id);


--
-- TOC entry 4761 (class 2606 OID 16747)
-- Name: enti enti_ente_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enti
    ADD CONSTRAINT enti_ente_name_key UNIQUE (ente_name);


--
-- TOC entry 4763 (class 2606 OID 16859)
-- Name: enti enti_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enti
    ADD CONSTRAINT enti_pkey PRIMARY KEY (ente_name);


--
-- TOC entry 4769 (class 2606 OID 16799)
-- Name: figures figures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.figures
    ADD CONSTRAINT figures_pkey PRIMARY KEY (official_id);


--
-- TOC entry 4767 (class 2606 OID 16856)
-- Name: geography geography_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geography
    ADD CONSTRAINT geography_pkey PRIMARY KEY (territory_name);


--
-- TOC entry 4755 (class 2606 OID 16866)
-- Name: soggetti soggetti_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.soggetti
    ADD CONSTRAINT soggetti_pkey PRIMARY KEY (tipo_soggetto);


--
-- TOC entry 4757 (class 2606 OID 16842)
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (tag_name);


--
-- TOC entry 4773 (class 2606 OID 16830)
-- Name: treatises treatises_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatises
    ADD CONSTRAINT treatises_pkey PRIMARY KEY (treatise_id);


--
-- TOC entry 4790 (class 2606 OID 16946)
-- Name: archives_documents archives_documents_archivio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archives_documents
    ADD CONSTRAINT archives_documents_archivio_fkey FOREIGN KEY (archivio) REFERENCES public.archivi(archivio) ON DELETE CASCADE;


--
-- TOC entry 4776 (class 2606 OID 17055)
-- Name: documents documents_doc_arch_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_doc_arch_fkey FOREIGN KEY (doc_arch) REFERENCES public.archives_documents(doc_arch);


--
-- TOC entry 4777 (class 2606 OID 16860)
-- Name: documents documents_ente_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_ente_name_fkey FOREIGN KEY (ente_name) REFERENCES public.enti(ente_name);


--
-- TOC entry 4782 (class 2606 OID 16904)
-- Name: documents_tags documents_tags_doc_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_tags
    ADD CONSTRAINT documents_tags_doc_id_fkey FOREIGN KEY (doc_id) REFERENCES public.documents(doc_id) ON DELETE CASCADE;


--
-- TOC entry 4783 (class 2606 OID 16909)
-- Name: documents_tags documents_tags_tag_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_tags
    ADD CONSTRAINT documents_tags_tag_name_fkey FOREIGN KEY (tag_name) REFERENCES public.tag(tag_name) ON DELETE CASCADE;


--
-- TOC entry 4786 (class 2606 OID 16929)
-- Name: figures_documents figures_documents_doc_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.figures_documents
    ADD CONSTRAINT figures_documents_doc_id_fkey FOREIGN KEY (doc_id) REFERENCES public.documents(doc_id) ON DELETE CASCADE;


--
-- TOC entry 4787 (class 2606 OID 16924)
-- Name: figures_documents figures_documents_official_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.figures_documents
    ADD CONSTRAINT figures_documents_official_id_fkey FOREIGN KEY (official_id) REFERENCES public.figures(official_id) ON DELETE CASCADE;


--
-- TOC entry 4784 (class 2606 OID 17060)
-- Name: documents_tags fk_doc_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_tags
    ADD CONSTRAINT fk_doc_id FOREIGN KEY (doc_id) REFERENCES public.documents(doc_id);


--
-- TOC entry 4788 (class 2606 OID 17075)
-- Name: figures_documents fk_doc_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.figures_documents
    ADD CONSTRAINT fk_doc_id FOREIGN KEY (doc_id) REFERENCES public.documents(doc_id);


--
-- TOC entry 4789 (class 2606 OID 17070)
-- Name: figures_documents fk_official_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.figures_documents
    ADD CONSTRAINT fk_official_id FOREIGN KEY (official_id) REFERENCES public.figures(official_id);


--
-- TOC entry 4785 (class 2606 OID 17065)
-- Name: documents_tags fk_tag_name; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_tags
    ADD CONSTRAINT fk_tag_name FOREIGN KEY (tag_name) REFERENCES public.tag(tag_name);


--
-- TOC entry 4778 (class 2606 OID 16867)
-- Name: officials officials_ente_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.officials
    ADD CONSTRAINT officials_ente_name_fkey FOREIGN KEY (ente_name) REFERENCES public.enti(ente_name);


--
-- TOC entry 4779 (class 2606 OID 16803)
-- Name: officials officials_official_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.officials
    ADD CONSTRAINT officials_official_id_fkey FOREIGN KEY (official_id) REFERENCES public.figures(official_id);


--
-- TOC entry 4780 (class 2606 OID 16831)
-- Name: treatises treatises_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatises
    ADD CONSTRAINT treatises_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.authors(author_id);


--
-- TOC entry 4781 (class 2606 OID 16872)
-- Name: treatises treatises_tag_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatises
    ADD CONSTRAINT treatises_tag_name_fkey FOREIGN KEY (tag_name) REFERENCES public.tag(tag_name);


-- Completed on 2024-10-25 10:06:14

--
-- PostgreSQL database dump complete
--

--
-- Database "NEW HISTORY" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2024-10-25 10:06:14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4913 (class 1262 OID 17286)
-- Name: NEW HISTORY; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "NEW HISTORY" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Italian_Italy.1252';


ALTER DATABASE "NEW HISTORY" OWNER TO postgres;

\connect -reuse-previous=on "dbname='NEW HISTORY'"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 17297)
-- Name: archive_series; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.archive_series (
    series_id smallint NOT NULL,
    series_denom text NOT NULL,
    archive text NOT NULL
);


ALTER TABLE public.archive_series OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17296)
-- Name: archive_series_series_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.archive_series_series_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.archive_series_series_id_seq OWNER TO postgres;

--
-- TOC entry 4914 (class 0 OID 0)
-- Dependencies: 219
-- Name: archive_series_series_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.archive_series_series_id_seq OWNED BY public.archive_series.series_id;


--
-- TOC entry 224 (class 1259 OID 17313)
-- Name: entities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entities (
    entity_id smallint NOT NULL,
    entity_type character varying(50),
    CONSTRAINT entities_entity_type_check CHECK (((entity_type)::text = ANY ((ARRAY['person'::character varying, 'institution'::character varying])::text[])))
);


ALTER TABLE public.entities OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17312)
-- Name: entities_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entities_entity_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.entities_entity_id_seq OWNER TO postgres;

--
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 223
-- Name: entities_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entities_entity_id_seq OWNED BY public.entities.entity_id;


--
-- TOC entry 228 (class 1259 OID 17335)
-- Name: institutions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.institutions (
    institution_id smallint NOT NULL,
    entity_id integer,
    instituion_name character varying(255) NOT NULL,
    site character varying(50) NOT NULL,
    from_y integer NOT NULL,
    to_y integer NOT NULL
);


ALTER TABLE public.institutions OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17334)
-- Name: institutions_institution_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.institutions_institution_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.institutions_institution_id_seq OWNER TO postgres;

--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 227
-- Name: institutions_institution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.institutions_institution_id_seq OWNED BY public.institutions.institution_id;


--
-- TOC entry 230 (class 1259 OID 17347)
-- Name: office; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.office (
    office_id smallint NOT NULL,
    denomination character varying(255) NOT NULL
);


ALTER TABLE public.office OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17346)
-- Name: office_office_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.office_office_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.office_office_id_seq OWNER TO postgres;

--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 229
-- Name: office_office_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.office_office_id_seq OWNED BY public.office.office_id;


--
-- TOC entry 226 (class 1259 OID 17321)
-- Name: persons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persons (
    person_id integer NOT NULL,
    entity_id integer,
    first_name text NOT NULL,
    last_name text NOT NULL,
    birth integer NOT NULL,
    death integer NOT NULL
);


ALTER TABLE public.persons OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17320)
-- Name: persons_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.persons_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.persons_person_id_seq OWNER TO postgres;

--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 225
-- Name: persons_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.persons_person_id_seq OWNED BY public.persons.person_id;


--
-- TOC entry 218 (class 1259 OID 17288)
-- Name: tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tag (
    tag_id smallint NOT NULL,
    tag_name text NOT NULL
);


ALTER TABLE public.tag OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17287)
-- Name: tag_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tag_tag_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tag_tag_id_seq OWNER TO postgres;

--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 217
-- Name: tag_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tag_tag_id_seq OWNED BY public.tag.tag_id;


--
-- TOC entry 222 (class 1259 OID 17306)
-- Name: types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.types (
    type character varying(50) NOT NULL,
    type_id smallint NOT NULL
);


ALTER TABLE public.types OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17305)
-- Name: types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.types_type_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.types_type_id_seq OWNER TO postgres;

--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 221
-- Name: types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.types_type_id_seq OWNED BY public.types.type_id;


--
-- TOC entry 4726 (class 2604 OID 17300)
-- Name: archive_series series_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archive_series ALTER COLUMN series_id SET DEFAULT nextval('public.archive_series_series_id_seq'::regclass);


--
-- TOC entry 4728 (class 2604 OID 17316)
-- Name: entities entity_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities ALTER COLUMN entity_id SET DEFAULT nextval('public.entities_entity_id_seq'::regclass);


--
-- TOC entry 4730 (class 2604 OID 17338)
-- Name: institutions institution_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institutions ALTER COLUMN institution_id SET DEFAULT nextval('public.institutions_institution_id_seq'::regclass);


--
-- TOC entry 4731 (class 2604 OID 17350)
-- Name: office office_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.office ALTER COLUMN office_id SET DEFAULT nextval('public.office_office_id_seq'::regclass);


--
-- TOC entry 4729 (class 2604 OID 17324)
-- Name: persons person_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons ALTER COLUMN person_id SET DEFAULT nextval('public.persons_person_id_seq'::regclass);


--
-- TOC entry 4725 (class 2604 OID 17291)
-- Name: tag tag_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag ALTER COLUMN tag_id SET DEFAULT nextval('public.tag_tag_id_seq'::regclass);


--
-- TOC entry 4727 (class 2604 OID 17309)
-- Name: types type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types ALTER COLUMN type_id SET DEFAULT nextval('public.types_type_id_seq'::regclass);


--
-- TOC entry 4897 (class 0 OID 17297)
-- Dependencies: 220
-- Data for Name: archive_series; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.archive_series (series_id, series_denom, archive) FROM stdin;
\.


--
-- TOC entry 4901 (class 0 OID 17313)
-- Dependencies: 224
-- Data for Name: entities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entities (entity_id, entity_type) FROM stdin;
\.


--
-- TOC entry 4905 (class 0 OID 17335)
-- Dependencies: 228
-- Data for Name: institutions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.institutions (institution_id, entity_id, instituion_name, site, from_y, to_y) FROM stdin;
\.


--
-- TOC entry 4907 (class 0 OID 17347)
-- Dependencies: 230
-- Data for Name: office; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.office (office_id, denomination) FROM stdin;
\.


--
-- TOC entry 4903 (class 0 OID 17321)
-- Dependencies: 226
-- Data for Name: persons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.persons (person_id, entity_id, first_name, last_name, birth, death) FROM stdin;
\.


--
-- TOC entry 4895 (class 0 OID 17288)
-- Dependencies: 218
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tag (tag_id, tag_name) FROM stdin;
\.


--
-- TOC entry 4899 (class 0 OID 17306)
-- Dependencies: 222
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.types (type, type_id) FROM stdin;
\.


--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 219
-- Name: archive_series_series_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.archive_series_series_id_seq', 1, false);


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 223
-- Name: entities_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entities_entity_id_seq', 1, false);


--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 227
-- Name: institutions_institution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.institutions_institution_id_seq', 1, false);


--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 229
-- Name: office_office_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.office_office_id_seq', 1, false);


--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 225
-- Name: persons_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.persons_person_id_seq', 1, false);


--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 217
-- Name: tag_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tag_tag_id_seq', 1, false);


--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 221
-- Name: types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.types_type_id_seq', 1, false);


--
-- TOC entry 4736 (class 2606 OID 17304)
-- Name: archive_series archive_series_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archive_series
    ADD CONSTRAINT archive_series_pkey PRIMARY KEY (series_id);


--
-- TOC entry 4740 (class 2606 OID 17319)
-- Name: entities entities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities
    ADD CONSTRAINT entities_pkey PRIMARY KEY (entity_id);


--
-- TOC entry 4744 (class 2606 OID 17340)
-- Name: institutions institutions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institutions
    ADD CONSTRAINT institutions_pkey PRIMARY KEY (institution_id);


--
-- TOC entry 4746 (class 2606 OID 17352)
-- Name: office office_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.office
    ADD CONSTRAINT office_pkey PRIMARY KEY (office_id);


--
-- TOC entry 4742 (class 2606 OID 17328)
-- Name: persons persons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_pkey PRIMARY KEY (person_id);


--
-- TOC entry 4734 (class 2606 OID 17295)
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (tag_id);


--
-- TOC entry 4738 (class 2606 OID 17311)
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (type);


--
-- TOC entry 4748 (class 2606 OID 17341)
-- Name: institutions institutions_entity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institutions
    ADD CONSTRAINT institutions_entity_id_fkey FOREIGN KEY (entity_id) REFERENCES public.entities(entity_id);


--
-- TOC entry 4747 (class 2606 OID 17329)
-- Name: persons persons_entity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_entity_id_fkey FOREIGN KEY (entity_id) REFERENCES public.entities(entity_id);


-- Completed on 2024-10-25 10:06:18

--
-- PostgreSQL database dump complete
--

-- Completed on 2024-10-25 10:06:18

--
-- PostgreSQL database cluster dump complete
--

