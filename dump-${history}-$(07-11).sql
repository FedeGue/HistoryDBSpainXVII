--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2024-11-07 09:24:38

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


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
-- TOC entry 4969 (class 0 OID 0)
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
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 233
-- Name: authors_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.authors_author_id_seq OWNED BY public.authors.author_id;


--
-- TOC entry 220 (class 1259 OID 17136)
-- Name: doc_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doc_types (
    type character varying(50) NOT NULL,
    type_id smallint NOT NULL
);


ALTER TABLE public.doc_types OWNER TO postgres;

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
    why text,
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
-- TOC entry 4971 (class 0 OID 0)
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
-- TOC entry 4972 (class 0 OID 0)
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
-- TOC entry 4973 (class 0 OID 0)
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
    office_id integer,
    from_y integer,
    to_y integer
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
-- TOC entry 238 (class 1259 OID 17469)
-- Name: persons_documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persons_documents (
    person_id integer,
    doc_id integer
);


ALTER TABLE public.persons_documents OWNER TO postgres;

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
-- TOC entry 4974 (class 0 OID 0)
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
    doc_id integer
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
-- TOC entry 4975 (class 0 OID 0)
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
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 235
-- Name: treatises_treat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.treatises_treat_id_seq OWNED BY public.treatises.treat_id;


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
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 219
-- Name: types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.types_type_id_seq OWNED BY public.doc_types.type_id;


--
-- TOC entry 4756 (class 2604 OID 17234)
-- Name: archive_series series_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archive_series ALTER COLUMN series_id SET DEFAULT nextval('public.archive_series_series_id_seq'::regclass);


--
-- TOC entry 4758 (class 2604 OID 17432)
-- Name: authors author_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors ALTER COLUMN author_id SET DEFAULT nextval('public.authors_author_id_seq'::regclass);


--
-- TOC entry 4752 (class 2604 OID 17139)
-- Name: doc_types type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doc_types ALTER COLUMN type_id SET DEFAULT nextval('public.types_type_id_seq'::regclass);


--
-- TOC entry 4757 (class 2604 OID 17271)
-- Name: documents doc_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents ALTER COLUMN doc_id SET DEFAULT nextval('public.documents_doc_id_seq'::regclass);


--
-- TOC entry 4754 (class 2604 OID 17169)
-- Name: institutions institution_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institutions ALTER COLUMN institution_id SET DEFAULT nextval('public.institutions_institution_id_seq'::regclass);


--
-- TOC entry 4755 (class 2604 OID 17181)
-- Name: office office_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.office ALTER COLUMN office_id SET DEFAULT nextval('public.office_office_id_seq'::regclass);


--
-- TOC entry 4753 (class 2604 OID 17155)
-- Name: persons person_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons ALTER COLUMN person_id SET DEFAULT nextval('public.persons_person_id_seq'::regclass);


--
-- TOC entry 4751 (class 2604 OID 17130)
-- Name: tag tag_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag ALTER COLUMN tag_id SET DEFAULT nextval('public.tag_tag_id_seq'::regclass);


--
-- TOC entry 4759 (class 2604 OID 17444)
-- Name: treatises treat_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatises ALTER COLUMN treat_id SET DEFAULT nextval('public.treatises_treat_id_seq'::regclass);


--
-- TOC entry 4952 (class 0 OID 17231)
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
-- TOC entry 4958 (class 0 OID 17429)
-- Dependencies: 234
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authors (author_id, person_id) FROM stdin;
\.


--
-- TOC entry 4944 (class 0 OID 17136)
-- Dependencies: 220
-- Data for Name: doc_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doc_types (type, type_id) FROM stdin;
consulta	1
decree	2
pragmatic	3
epistle	4
royal_order	5
\.


--
-- TOC entry 4954 (class 0 OID 17268)
-- Dependencies: 230
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documents (doc_id, type, date, language, title, series_id, recipient_person_id, recipient_institution_id, writer_person_id, writer_institution_id, why) FROM stdin;
14	consulta	1629-04-27	spanish	Ha mandado Vuestra Magestad remitir al Duque de Medina de las Torres el decreto que se sigue rubricado por su real mano à 1° de Marzo deste año	6	4	\N	\N	1	The Monarchy needs funds to repay its debts to the Genoese Republic. The King inquires whether there are any available tratas in Naples and Sicily that could be granted to Genoa. The Consejo responds that in the Kingdom of Naples, there are no free tratas, while in Sicily, the tratas are needed for the galleys and infantry. The Consejo leaves the final decision to the King
1	consulta	1623-02-14	spanish	Consulta del Consejo de Italia sobre los gatos secretos, y extraordinarios que han hecho en Napoles los Virreyes en los seis años últimos desde el de 1616 hasta el de 1622 que conforme a la relación del conservador sacada de los bilancos importa 727U944 ducados	1	4	\N	\N	1	\N
2	consulta	1623-08-23	spanish	Consulta dando cuenta a su Mag de haverse reconocido en Consejo el bilanço hecho por berisimil de lo que importavan las rentas reales el año de 1622 [...]	1	4	\N	\N	1	\N
3	consulta	1623-01-18	spanish	Consulta en que se da quenta a su Majestad de una carta del señor Principe Philiberto en que dize que valiéndose se la cruzada de aquel Reyno deste año, y de lo que viene, que importarà  130U000 ducados, y juntando otros [...]	1	4	\N	\N	1	The Consejo Answers Prince Filiberto’s questions ( 28-09-1622) about the use of the renta de la Cruzada, used to collect the money needed for the socorro of Alemania but now apparently needed to bear the costs of the galeras Real y Patrona (from king’s orders). The Prince says that it’s imposible to use the renta de la Cruzada for the galeras and the Consejo sympatize with the Prince’s point of view.
4	epistle	1623-01-14	spanish	Lo que se ha da responder al Señor Principe Philiberto cerca de lo que escribe que se le dexe la cruzada pa ayuda al Millon Par Flandes	1	6	\N	4	\N	the King order to Principe Filiberto to free the money made from the renta de la Cruzada in order to use it to bear the costs of the galeras Real y Patrona
5	consulta	1623-11-29	spanish	Vuestra magestad con billete rubricado por su real mano à ordenado que se busque forma de empezar a desempeñar su real patrimonio de los reyno de Napoles y Sicilia y estado de Milan[…]	2	4	\N	\N	1	The proposal seeks to establish separate redemption funds in the Kingdoms of Naples, Sicily, and the Duchy of Milan to gradually reduce royal debt. These funds, supported by specific revenues and cost-saving measures, aim to protect royal assets without further burdening subjects
6	consulta	1622-12-06	spanish	El señor principe Philiberto escrive à Vuestra Magestad la carta que se sigue	2	4	\N	\N	1	This consulta refers to a letter from Emanuele Filiberto, Viceroy of Sicily, regarding the royal request to use the renta de la Cruzada from Sicily to gather funds for covering the expenses of the Galera Real and Patrona. The Consejo supports Filiberto’s perspective, expressing concern that diverting the renta—intended to finance the German military campaign—to meet the needs of the galleys could have adverse effects
7	consulta	1623-01-07	spanish	Consulta en que el consejo responde a Vuestra Magestad e nel particular de la orden que ha mandado embiar a este consejo sobre el soccorro de los seiscentos mil ducados q se han de sacar del reyno de Sicilia para Flandes	2	4	\N	\N	1	This *consulta* responds to a letter directed to the Count of Monterrey, in which the king orders adjustments to the interest rates on Sicilian *juros* to obtain 600,000 scudi for the Flanders campaign. The council instructs the Sicilian viceroy to appoint the president of the treasury and a treasury accountant to negotiate agreements with local businessmen.
8	epistle	1623-07-28	spanish	Su Magestad al conde de Monterrey a 28 de Julio	2	6	\N	4	\N	The king orders the kingdoms of Naples and Sicily to collect 500,000 fiorini of 4 reales each to support the King of Poland in his fight against the Turkish armies.
9	consulta	1623-08-09	spanish	Consulta en que el Consejo da cuenta a su Magestad de lo que se le ofrece cerca de la execucion de una orden que ha venido a el para que se libren al Rey de Polonia 500m florines de a 4 reales	2	4	\N	\N	1	In response to the king’s decree of July 28, 1623, the council informed the sovereign of the severe financial difficulties faced by the Italian territories. The council further noted that continuing to send funds to the King of Poland might foster ongoing expectations of financial support.
10	royal_order	1623-08-15	spanish	En que se dize al señor Principe Phiberto que no se ha de salir esta quantidad de los 600m que se recogen para Flandes.	2	3	\N	4	\N	The king clarifies that the 500,000 fiorini destined for Poland should not come from the 600,000 allocated to Flanders, for which the reduction of juros had been previously ordered.
11	consulta	1626-05-09	spanish	En decreto de Vuestra Magestad de 17 de abril	3	4	\N	\N	1	In a decree dated April 17, addressed to the Count of Monterrey, King Philip IV ordered that the Duke of Feria return to Spain, leaving Don Gonzalo de Córdoba to govern Milan. This decision was influenced by the expectation that, due to an understanding with France, hostilities in Italy would cease. The council expressed its gratitude and approval, noting the King’s decision as both prudent and generous, given Spain’s recent military successes and the severe strains on Italian provinces. Additionally, the council advised disbanding the army in Milan to alleviate the financial burdens and hardships on local populations and recommended that Monterrey be summoned to assist in further Italian affairs, drawing on his experience and knowledge.
12	royal_order	1625-12-01	spanish	Deziembre 1625 Vuestra Magestad ordena al Conde de Monterrey	4	6	\N	4	\N	: In an agreement made with Juan Bautista Berardi for supplying Spain’s galleys, a provision was included to facilitate grain shipments from Sicily as needed for the fleet’s sustenance. However, Berardi recently reported that he is now being denied the necessary permits to export grain from Sicily, especially critical due to poor harvests in Andalusia. It is therefore advised to expedite approval, as failing to meet the fleet s supply needs could have serious consequences
13	consulta	1628-01-12	spanish	A la consulta inclussa, que este Consejo hizo dando quenta a Vuestra Magestad de lo que se le offrecia cerca de los medios, que Vuestra Magestad le mandò remittir hà tenido Vuestra Magestad por bien de responder	4	4	\N	\N	1	This *consulta* concerns a royal decree dated December 27, 1627, sent to the Count of Monterrey, ordering that Naples and Sicily send 10,000 *ducats* to the Count of Oñate. The council responds, indicating that the finances of the two kingdoms are insufficient to fulfill this request.
15	consulta	1629-01-18	spanish	Vuestra Magestad ha mandado remitir al Duque de Medina de las Torres un decreto	6	4	\N	\N	1	On January 14, 1629, the King issued a decree ordering a levy of 6,000 Sicilians and an additional 2,500 soldiers to support the Spanish tercio, to be sent along with a year s \r\nwages. The Consejo highlighted the difficulties in reaching the target of 6,000 extra troops, noting that funds for these could only be raised through a donativo
16	consulta	1629-07-04	spanish	El Duque de Alburquerque virrey de Sicilia en carta para Vuestra Magestad	6	4	\N	\N	1	The king orders the Duke of Alburquerque to requisition the income from juros and censos of the Kingdom of Sicily. The viceroy responds that, despite the need for funds, carrying out the order would cause discontent. The Council agrees with the duke s concerns
17	consulta	1629-07-04	spanish	Relación sumaria de los arbitrios o proposiciones	6	4	\N	\N	1	regarding the arbitrios sent to the Italian viceroys in execution of a royal decree of December 4, 1628, and the related consultation of December 22, 1628
18	decree	1629-01-14	spanish	Duque primo de mi Consejo de Estado mi Virrey Lugarteniente, y Capitan general	6	18	\N	4	\N	See doc_id = 16
\.


--
-- TOC entry 4948 (class 0 OID 17166)
-- Dependencies: 224
-- Data for Name: institutions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.institutions (institution_id, institution_name, site, from_y, to_y) FROM stdin;
1	Real y Supremo Consejo de Italia	Madrid	1556	1717
2	Tribunal del Real Patrimonio	Palermo	1569	1819
\.


--
-- TOC entry 4950 (class 0 OID 17178)
-- Dependencies: 226
-- Data for Name: office; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.office (office_id, denomination) FROM stdin;
1	Virrey de Valencia
2	King
3	Conservador general del Patrimonio de Italia
5	Governador del Estado de Milan
6	Presidente del Consejo de Italia
7	Virrey de Napoles
10	Regente español del Consejo de Italia
11	Consejero de Estado y Guerra
8	Secretario del Rey
9	regente natural por el reino de Sicilia en el Consejo Supremo de Italia
12	regente natural por el reino de Napoles en el Consejo Supremo de Italia
\.


--
-- TOC entry 4955 (class 0 OID 17362)
-- Dependencies: 231
-- Data for Name: office_person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.office_person (person_id, office_id, from_y, to_y) FROM stdin;
5	3	\N	\N
6	5	\N	\N
4	2	1621	1665
6	6	1622	1630
6	7	1631	1637
11	7	1622	1629
11	11	1598	1639
17	9	1625	1642
\.


--
-- TOC entry 4946 (class 0 OID 17152)
-- Dependencies: 222
-- Data for Name: persons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.persons (person_id, name, surname, birth, death, noble_title) FROM stdin;
1	Juan Alfonso	Pimentel Enríquez	1553	1621	VIII Conde de Benavente
3	Emanuele Filiberto	di Savoia	1558	1624	Principe di Savoia
4	Felipe Dominico Víctor	Habsburgo	1605	1665	Rey de España y Portugal
5	Jerónimo	Funes Muñoz y Ribot	1575	1650	Barón de Ayodar, gentilhombre de cámara del gran prior de San Juan príncipe Filiberto, gentilhombre de boca de Felipe III, hábito de la Orden de Santiago
6	Manuel	de Acevedo y Zuñiga	1582	1653	VI Conde de Monterrey
7	Gómez	Suárez de Figueroa y Córdoba	1587	1634	III Duque de Feria
8	Iñigo	Vélez de Guevara y Tassis	1573	1644	V conde de Oñate, IV conde de Salinillas
9	Juan Baptista	Berardi	1600	1600	?
10	Iñigo	de Aguirre	1600	1600	?
11	Antonio	Álvarez de Toledo y Beaumont	1568	1639	V Duque de Alba de Tormes
12	Sigismondo III	Vasa	1566	1632	King of Poland, King of Sweden, Grand Duke of Finland, Grand Duke of Lithuania
13	Ramiro	Núñez de Guzmán	1600	1668	Duque de Medina de las Torres
14	Alonso	Guillén de la Carrera	0	1642	No
15	Juan Bautista	Valenzuela Velázquez	1574	1645	No
16	Pietro Francesco	Corio	0	1630	No
17	José	de Napoles	1570	1642	I Duque de Campobello di Mazara
18	Pedro	de Neyla y Bravo	1588	1647	Caballero de la Orden de Calatrava
19	Francisco	Fernández de la Cueva y de la Cueva	1575	1637	VII Duque de Alburquerque
\.


--
-- TOC entry 4962 (class 0 OID 17469)
-- Dependencies: 238
-- Data for Name: persons_documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.persons_documents (person_id, doc_id) FROM stdin;
5	1
4	1
3	2
4	14
3	14
13	14
4	15
13	15
\.


--
-- TOC entry 4942 (class 0 OID 17127)
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
12	Reino de Sicilia
13	budget
14	rentas reales 
15	Flandes
16	Galeras Real y Patrona
17	tratas
18	medios y arbitrios
19	Estado de Milan
20	desempeño
21	Real Patrimonio
22	conservacion de estados
23	Caxa de Redempcion de Milan
24	juros
25	redencion de juros
26	baja de juros
27	rentas de por vida
28	pensiones de por vida
29	caxa de redempcion de Sicilia
30	caxa de redempcion de Napoles
31	donativo
32	vassallos
33	asientos
34	Millon de Alemania
35	Polonia
36	Turco
37	soccorros
38	Breda
39	Cadiz
40	Genova
41	crecimiento de juros
42	renta de la Cruzada de Sicilia
43	hombres de negocios
44	Alemania
45	fleet
46	caxa militar
47	Parlamento de 1630
48	Parlamento de 1624
49	juros de gracia
50	juros de justicia
51	censos
52	rescate de censos
53	voluntad del reino
54	retención tercios
55	licencia de armas
56	wine
57	vino de Milan
58	Liorna
59	rebeldes de Liorna
60	cavalleria de Sicilia
61	donativo de eclesiasticos
62	dote de la Reina de Hungria
63	silk
64	meat
65	crecimiento censos
66	military conscription
67	tercios españoles
68	soldiers
69	donativo de Baronaje
70	adjutorio
71	galleys
72	royal debts
\.


--
-- TOC entry 4956 (class 0 OID 17375)
-- Dependencies: 232
-- Data for Name: tag_documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tag_documents (tag_id, doc_id) FROM stdin;
11	1
10	1
9	1
7	1
14	2
13	2
12	2
42	3
44	3
16	3
43	3
42	4
34	4
12	4
43	4
15	4
17	4
18	4
9	5
19	5
12	5
20	5
15	5
17	5
21	5
18	5
23	5
24	5
25	5
26	5
27	5
28	5
29	5
30	5
31	5
32	5
12	6
16	6
42	6
44	6
34	6
15	7
24	7
41	7
33	7
35	8
36	8
37	8
26	9
32	9
35	9
37	9
15	10
35	10
37	10
1	11
19	11
18	11
38	11
37	11
39	11
32	11
22	11
3	11
40	11
12	12
17	12
33	12
45	12
12	13
12	13
9	13
18	13
46	13
40	14
9	14
12	14
72	14
71	14
17	14
19	15
66	15
12	15
67	15
61	15
69	15
70	15
68	15
\.


--
-- TOC entry 4961 (class 0 OID 17456)
-- Dependencies: 237
-- Data for Name: tag_treatise; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tag_treatise (tag_id, treat_id) FROM stdin;
\.


--
-- TOC entry 4960 (class 0 OID 17441)
-- Dependencies: 236
-- Data for Name: treatises; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.treatises (treat_id, treat_title, author_id, ed_year, editor, city_of_edition) FROM stdin;
\.


--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 227
-- Name: archive_series_series_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.archive_series_series_id_seq', 16, true);


--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 233
-- Name: authors_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authors_author_id_seq', 1, false);


--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 229
-- Name: documents_doc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.documents_doc_id_seq', 18, true);


--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 223
-- Name: institutions_institution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.institutions_institution_id_seq', 2, true);


--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 225
-- Name: office_office_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.office_office_id_seq', 12, true);


--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 221
-- Name: persons_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.persons_person_id_seq', 19, true);


--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 217
-- Name: tag_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tag_tag_id_seq', 72, true);


--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 235
-- Name: treatises_treat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.treatises_treat_id_seq', 1, false);


--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 219
-- Name: types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.types_type_id_seq', 5, true);


--
-- TOC entry 4773 (class 2606 OID 17238)
-- Name: archive_series archive_series_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archive_series
    ADD CONSTRAINT archive_series_pkey PRIMARY KEY (series_id);


--
-- TOC entry 4777 (class 2606 OID 17434)
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);


--
-- TOC entry 4775 (class 2606 OID 17275)
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (doc_id);


--
-- TOC entry 4769 (class 2606 OID 17171)
-- Name: institutions institutions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institutions
    ADD CONSTRAINT institutions_pkey PRIMARY KEY (institution_id);


--
-- TOC entry 4771 (class 2606 OID 17183)
-- Name: office office_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.office
    ADD CONSTRAINT office_pkey PRIMARY KEY (office_id);


--
-- TOC entry 4767 (class 2606 OID 17159)
-- Name: persons persons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_pkey PRIMARY KEY (person_id);


--
-- TOC entry 4763 (class 2606 OID 17134)
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (tag_id);


--
-- TOC entry 4779 (class 2606 OID 17448)
-- Name: treatises treatises_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatises
    ADD CONSTRAINT treatises_pkey PRIMARY KEY (treat_id);


--
-- TOC entry 4765 (class 2606 OID 17141)
-- Name: doc_types types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doc_types
    ADD CONSTRAINT types_pkey PRIMARY KEY (type);


--
-- TOC entry 4790 (class 2606 OID 17435)
-- Name: authors authors_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.persons(person_id);


--
-- TOC entry 4794 (class 2606 OID 17557)
-- Name: persons_documents doc_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons_documents
    ADD CONSTRAINT doc_id FOREIGN KEY (doc_id) REFERENCES public.documents(doc_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4788 (class 2606 OID 17567)
-- Name: tag_documents doc_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag_documents
    ADD CONSTRAINT doc_id FOREIGN KEY (doc_id) REFERENCES public.documents(doc_id);


--
-- TOC entry 4780 (class 2606 OID 17487)
-- Name: documents documents_series_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_series_id FOREIGN KEY (series_id) REFERENCES public.archive_series(series_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4786 (class 2606 OID 17547)
-- Name: office_person office_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.office_person
    ADD CONSTRAINT office_id FOREIGN KEY (office_id) REFERENCES public.office(office_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4787 (class 2606 OID 17542)
-- Name: office_person person_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.office_person
    ADD CONSTRAINT person_id FOREIGN KEY (person_id) REFERENCES public.persons(person_id);


--
-- TOC entry 4795 (class 2606 OID 17552)
-- Name: persons_documents person_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons_documents
    ADD CONSTRAINT person_id FOREIGN KEY (person_id) REFERENCES public.persons(person_id);


--
-- TOC entry 4781 (class 2606 OID 17517)
-- Name: documents recipient_institution_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT recipient_institution_id FOREIGN KEY (recipient_institution_id) REFERENCES public.institutions(institution_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4782 (class 2606 OID 17502)
-- Name: documents recipient_person_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT recipient_person_id FOREIGN KEY (recipient_person_id) REFERENCES public.persons(person_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4789 (class 2606 OID 17562)
-- Name: tag_documents tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag_documents
    ADD CONSTRAINT tag_id FOREIGN KEY (tag_id) REFERENCES public.tag(tag_id);


--
-- TOC entry 4792 (class 2606 OID 17459)
-- Name: tag_treatise tag_treatise_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag_treatise
    ADD CONSTRAINT tag_treatise_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tag(tag_id);


--
-- TOC entry 4793 (class 2606 OID 17464)
-- Name: tag_treatise tag_treatise_treat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag_treatise
    ADD CONSTRAINT tag_treatise_treat_id_fkey FOREIGN KEY (treat_id) REFERENCES public.treatises(treat_id);


--
-- TOC entry 4791 (class 2606 OID 17449)
-- Name: treatises treatises_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treatises
    ADD CONSTRAINT treatises_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.authors(author_id);


--
-- TOC entry 4783 (class 2606 OID 17482)
-- Name: documents type_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT type_fk FOREIGN KEY (type) REFERENCES public.doc_types(type) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4784 (class 2606 OID 17527)
-- Name: documents writer_institution_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT writer_institution_id FOREIGN KEY (writer_institution_id) REFERENCES public.institutions(institution_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4785 (class 2606 OID 17522)
-- Name: documents writer_person_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT writer_person_id FOREIGN KEY (writer_person_id) REFERENCES public.persons(person_id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2024-11-07 09:24:38

--
-- PostgreSQL database dump complete
--

