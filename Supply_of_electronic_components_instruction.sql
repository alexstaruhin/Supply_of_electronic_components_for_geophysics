--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-03-10 18:24:10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3410 (class 1262 OID 28642)
-- Name: AO NPP Geofizika; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "AO NPP Geofizika" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE "AO NPP Geofizika" OWNER TO postgres;

\connect -reuse-previous=on "dbname='AO NPP Geofizika'"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- TOC entry 221 (class 1259 OID 28707)
-- Name: component; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.component (
    component_id bigint NOT NULL,
    component_name character varying(100),
    type_id bigint,
    element_id bigint,
    price numeric(9,2),
    production_id bigint
);


ALTER TABLE public.component OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 28706)
-- Name: component_component_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.component_component_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.component_component_id_seq OWNER TO postgres;

--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 220
-- Name: component_component_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.component_component_id_seq OWNED BY public.component.component_id;


--
-- TOC entry 227 (class 1259 OID 28767)
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    country_id bigint NOT NULL,
    country character varying(50)
);


ALTER TABLE public.country OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 28766)
-- Name: country_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.country_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_country_id_seq OWNER TO postgres;

--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 226
-- Name: country_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.country_country_id_seq OWNED BY public.country.country_id;


--
-- TOC entry 219 (class 1259 OID 28700)
-- Name: element; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.element (
    element_id bigint NOT NULL,
    element character varying(100)
);


ALTER TABLE public.element OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 28699)
-- Name: element_element_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.element_element_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.element_element_id_seq OWNER TO postgres;

--
-- TOC entry 3413 (class 0 OID 0)
-- Dependencies: 218
-- Name: element_element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.element_element_id_seq OWNED BY public.element.element_id;


--
-- TOC entry 229 (class 1259 OID 28779)
-- Name: order_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_status (
    order_status_id bigint NOT NULL,
    order_status character varying(50)
);


ALTER TABLE public.order_status OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 28778)
-- Name: order_status_order_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_status_order_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_status_order_status_id_seq OWNER TO postgres;

--
-- TOC entry 3414 (class 0 OID 0)
-- Dependencies: 228
-- Name: order_status_order_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_status_order_status_id_seq OWNED BY public.order_status.order_status_id;


--
-- TOC entry 215 (class 1259 OID 28645)
-- Name: production; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.production (
    production_id bigint NOT NULL,
    production character varying(100),
    country_id bigint
);


ALTER TABLE public.production OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 28644)
-- Name: production_production_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.production_production_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.production_production_id_seq OWNER TO postgres;

--
-- TOC entry 3415 (class 0 OID 0)
-- Dependencies: 214
-- Name: production_production_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.production_production_id_seq OWNED BY public.production.production_id;


--
-- TOC entry 223 (class 1259 OID 28729)
-- Name: storage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.storage (
    storage_id bigint NOT NULL,
    component_id bigint,
    amount integer
);


ALTER TABLE public.storage OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 28728)
-- Name: storage_storage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.storage_storage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.storage_storage_id_seq OWNER TO postgres;

--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 222
-- Name: storage_storage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.storage_storage_id_seq OWNED BY public.storage.storage_id;


--
-- TOC entry 225 (class 1259 OID 28741)
-- Name: supply; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supply (
    supply_id bigint NOT NULL,
    component_id bigint,
    amount integer,
    order_date date,
    order_status_id bigint,
    delivery_date date
);


ALTER TABLE public.supply OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 28740)
-- Name: supply_supply_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supply_supply_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supply_supply_id_seq OWNER TO postgres;

--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 224
-- Name: supply_supply_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supply_supply_id_seq OWNED BY public.supply.supply_id;


--
-- TOC entry 217 (class 1259 OID 28652)
-- Name: type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type (
    type_id bigint NOT NULL,
    type character varying(100)
);


ALTER TABLE public.type OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 28651)
-- Name: type_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_type_id_seq OWNER TO postgres;

--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 216
-- Name: type_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_type_id_seq OWNED BY public.type.type_id;


--
-- TOC entry 3211 (class 2604 OID 28710)
-- Name: component component_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component ALTER COLUMN component_id SET DEFAULT nextval('public.component_component_id_seq'::regclass);


--
-- TOC entry 3214 (class 2604 OID 28770)
-- Name: country country_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country ALTER COLUMN country_id SET DEFAULT nextval('public.country_country_id_seq'::regclass);


--
-- TOC entry 3210 (class 2604 OID 28703)
-- Name: element element_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.element ALTER COLUMN element_id SET DEFAULT nextval('public.element_element_id_seq'::regclass);


--
-- TOC entry 3215 (class 2604 OID 28782)
-- Name: order_status order_status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status ALTER COLUMN order_status_id SET DEFAULT nextval('public.order_status_order_status_id_seq'::regclass);


--
-- TOC entry 3208 (class 2604 OID 28648)
-- Name: production production_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production ALTER COLUMN production_id SET DEFAULT nextval('public.production_production_id_seq'::regclass);


--
-- TOC entry 3212 (class 2604 OID 28732)
-- Name: storage storage_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage ALTER COLUMN storage_id SET DEFAULT nextval('public.storage_storage_id_seq'::regclass);


--
-- TOC entry 3213 (class 2604 OID 28744)
-- Name: supply supply_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supply ALTER COLUMN supply_id SET DEFAULT nextval('public.supply_supply_id_seq'::regclass);


--
-- TOC entry 3209 (class 2604 OID 28655)
-- Name: type type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type ALTER COLUMN type_id SET DEFAULT nextval('public.type_type_id_seq'::regclass);


--
-- TOC entry 3396 (class 0 OID 28707)
-- Dependencies: 221
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.component (component_id, component_name, type_id, element_id, price, production_id) FROM stdin;
1	FS7M0880YDTU	1	1	620.00	1
2	FSCQ0765RTYDTU	1	1	220.00	2
3	FSCQ1565RTYDTU	1	1	580.00	1
4	FSDM0265RNB	1	1	220.00	1
5	FSDM0365RNB	1	1	330.00	1
6	ADM660ANZ	1	2	1080.00	3
7	ADM660ARZ-REEL7	1	2	440.00	3
8	ADP1111ARZ	1	2	810.00	3
9	ADP1111ARZ-5	1	2	940.00	3
10	AOZ1073AIL	1	2	90.00	4
11	AD736AQ	1	3	3800.00	3
12	AD736JNZ	1	3	2660.00	3
13	AD536ASH	1	3	57960.00	3
14	AD8436ARQZ	1	3	6230.00	3
15	ADE-5+	1	3	640.00	6
16	AD654JNZ	1	4	860.00	3
17	AD654JRZ-REEL7	1	4	1390.00	3
18	AD7740YRMZ	1	4	1380.00	3
19	AD7741BRZ	1	4	950.00	3
20	LM2907N/NOPB	1	4	370.00	7
21	74HC4051D,653	1	5	44.00	8
22	74HC4051PW,118	1	5	25.00	8
23	74HC4052D,653	1	5	29.00	8
24	74HC4052PW,112	1	5	34.00	8
25	74HC4053D,653	1	5	41.00	8
26	BSM50GX120DN2BOSA1	2	6	28540.00	9
27	BSM75GB120DN2HOSA1	2	6	20180.00	9
28	FF100R12RT4HOSA1	2	6	11700.00	9
29	FF150R12RT4HOSA1	2	6	18800.00	9
30	FF300R12KE3HOSA1	2	6	16700.00	9
31	5П103TT-80-12	2	7	5950.00	11
32	MCC95-16IO1B	2	7	8100.00	12
33	MDD95-16N1B	2	7	7810.00	12
34	SKCH28/12	2	7	6410.00	10
35	SKKD162/12	2	7	8110.00	10
36	RA60H1317M1A-501	2	8	9850.00	13
37	M68776-01A	2	8	970.00	13
38	RA55H4452M-101	2	8	6300.00	13
39	M67755H-01	2	8	6390.00	13
40	M68706	2	8	5270.00	13
41	SKAI100WE	2	9	12700.00	10
42	(04020-00100600)	2	9	480.00	14
43	(04020-00790200)	2	9	610.00	14
44	(04G5502560U0)	2	9	310.00	14
45	FSBB15CH60C	2	10	6890.00	1
46	FSBB30CH60C	2	10	6030.00	1
47	IGCM04G60HAXKMA1	2	10	2340.00	9
48	IKCM15H60GAXKMA2	2	10	2520.00	9
49	STGIPN3H60	2	10	2090.00	15
50	DEBE33F472ZA3B	3	11	90.00	16
51	JYC3D101KBY	3	11	13.00	17
52	JYC3D102MBE	3	11	13.00	17
53	JYC3D103MCF	3	11	20.00	17
54	JYC3D152MBE	3	11	13.00	17
55	Конденсатор керамический дисковый 6.0 пФ х 50В	3	12	8.00	18
56	Конденсатор керамический дисковый 10 пФ х 50В	3	12	9.00	18
57	Конденсатор керамический дисковый 12 пФ х 50В	3	12	9.00	18
58	Конденсатор керамический дисковый 15 пФ х 50В	3	12	9.00	18
59	Конденсатор керамический дисковый 2.7 пФ х 50В	3	12	6.00	18
60	GRM2165C1H1R1C	3	13	8.00	16
61	GRM2165C1H1R2C	3	13	8.00	16
62	GRM2165C1H1R3C	3	13	8.00	16
63	GRM2165C1H1R5C	3	13	8.00	16
64	GRM2165C1H1R5C	3	13	8.00	16
65	К10-17А	3	14	49.00	34
66	К10-17Б	3	14	6.00	18
67	КМ5Б	3	14	49.00	34
68	МБГО-1	3	15	150.00	14
69	EEE-1HA101UP	3	15	290.00	19
70	PME271Y422MR30	3	15	120.00	20
71	ОМБГ-1	3	15	240.00	14
72	МБМ	3	15	54.00	14
73	CF-100 (С1-4)	4	16	8.00	21
74	CF-50 (С1-4)	4	16	8.00	21
75	CF-25 (С1-4)	4	16	6.00	21
76	MF-25 (С2-23)	4	16	6.00	21
77	KNP-200	4	16	21.00	21
78	SQP 3	4	17	21.00	21
79	SQP 5	4	17	22.00	21
80	SQP 10	4	17	28.00	21
81	SQP 15	4	17	40.00	21
82	SQP 20	4	17	58.00	21
83	0.062Вт 0402 1 Ом, 1%	4	18	5.00	18
84	0.062Вт 0402 1 Ом, 5%	4	18	5.00	18
85	0.062Вт 0402 1.1 Ом, 1%	4	18	5.00	18
86	0.062Вт 0402 1.1 Ом, 5%	4	18	5.00	18
87	0.062Вт 0402 1.2 Ом, 1%	4	18	5.00	18
88	CT94-2-10UH	5	19	480.00	22
89	EC24-100K	5	19	13.00	18
90	EC24-101K	5	19	28.00	18
91	EC24-102K	5	19	20.00	18
92	EC24-120K	5	19	14.00	18
93	CM322522-100KL	5	20	28.00	23
94	CM322522-101KL	5	20	28.00	23
95	CM322522-2R2KL	5	20	25.00	23
96	CM322522-330KL	5	20	34.00	23
97	CM322522-470KL	5	20	23.00	23
98	BLA31BD601SN4D	5	21	44.00	16
99	BLM18EG221SN1D	5	21	11.00	16
100	BLM18HG102SN1D	5	21	11.00	16
101	BLM18PG121SN1D	5	21	20.00	16
102	BLM18PG471SN1D	5	21	8.00	16
103	2038-15-SM-RPLF	6	22	460.00	23
104	B88069-X 180-S102	6	22	150.00	24
105	B88069-X 410-T502	6	22	490.00	24
106	B88069-X 720-S102	6	22	220.00	24
107	B88069-X 780 (EC600X)	6	22	190.00	24
108	B72205-S 271-K101 (S05K275)	6	23	23.00	24
109	B72207-S 231-K101 (S07K230)	6	23	10.00	24
110	B72207-S 271-K101 (S07K275)	6	23	24.00	24
111	B72207-S 300-K101 (S07K30)	6	23	16.00	24
112	B72207-S 301-K101 (S07K300)	6	23	20.00	24
113	179021	7	24	67.00	25
114	189020	7	24	71.00	25
115	C630 (ABE)	7	24	26.00	18
116	GTF4015	7	24	30.00	18
117	АUB	7	24	49.00	18
118	179020	7	25	76.00	25
119	179120	7	25	85.00	25
120	189000	7	25	330.00	25
121	AGU	7	25	67.00	18
122	H520 (ZH214)	7	25	14.00	18
123	1N4728A	8	26	4.00	18
124	1N4729A	8	26	4.00	18
125	1N4730A	8	26	4.00	18
126	1N4731A	8	26	4.00	18
127	1N4732A	8	26	4.00	18
128	10BQ100	8	27	14.00	26
129	10MQ030NPBF	8	27	10.00	27
130	10MQ040NPBF	8	27	10.00	27
131	10MQ060NPBF	8	27	10.00	27
132	10MQ100N	8	27	12.00	26
133	SKR130/12	8	28	5630.00	10
134	VS-40HF160	8	28	1960.00	28
135	Д112-10-12	8	28	450.00	29
136	Д112-10Х-12	8	28	450.00	29
137	Д112-16-12	8	28	450.00	29
138	КТ209А	9	29	16.00	30
139	КТ209Б	9	29	16.00	30
140	КТ209В	9	29	16.00	30
141	КТ209Г	9	29	20.00	30
142	КТ209Ж	9	29	16.00	30
143	AUIRF1010ZL	9	30	200.00	31
144	AUIRF1324	9	30	350.00	31
145	AUIRL1404S	9	30	930.00	31
146	AUIRL3705N	9	30	270.00	31
147	IRF5810TRPBF	9	30	27.00	31
148	2N6509G	10	31	220.00	12
149	5P4M	10	31	360.00	32
150	BCR8PM	10	31	700.00	13
151	BT149D	10	31	33.00	33
152	BT149G	10	31	25.00	33
153	2N6075AG	10	32	90.00	12
154	ACS102-6T1-TR	10	32	77.00	15
155	ACS108-6SA-TR	10	32	120.00	15
156	ACS108-6SN-TR	10	32	210.00	15
157	ACS110-7SN	10	32	98.00	15
158	2.000 МГц (TTL)	11	33	300.00	18
159	4.000 МГц (HCMOS/TTL)	11	33	420.00	18
160	4.194 МГц (HCMOS/TTL)	11	33	290.00	18
161	4.9152 МГц (HCMOS/TTL)	11	33	270.00	18
162	5.000 МГц (HCMOS/TTL)	11	33	370.00	18
163	1.8432 МГц HC-49U	11	34	66.00	18
164	2.000 МГц HC-49U	11	34	66.00	18
165	2.4576 МГц HC-49U	11	34	97.00	18
166	3.000 МГц HC-49U	11	34	89.00	18
167	3.579545 МГц HC-49SM	11	34	37.00	18
\.


--
-- TOC entry 3402 (class 0 OID 28767)
-- Dependencies: 227
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (country_id, country) FROM stdin;
1	USA
2	Netherlands
3	Germany
4	Russia
5	Japan
6	Undefined
7	Switzerland
8	China
9	Taiwan
10	Turkey
\.


--
-- TOC entry 3394 (class 0 OID 28700)
-- Dependencies: 219
-- Data for Name: element; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.element (element_id, element) FROM stdin;
1	AC-DC Преобразователи
2	DC-DC Преобразователи
3	RMS-DC преобразователи
4	V/F и F/V преобразователи
5	Аналоговые коммутаторы
6	IGBT модули
7	Диодно-тиристорные модули
8	Высокочастотные модули
9	Платы и микросборки
10	Модули управления двигателями
11	Конденсаторы керамические высоковольтные
12	Конденсаторы керамические дисковые
13	Конденсаторы керамические SMD
14	Конденсаторы керамические выводные многослойные
15	Конденсаторы металлобумажные
16	Резисторы маломощные
17	Резисторы мощные
18	Чип резисторы
19	Индуктивности выводные
20	Индуктивности SMD
21	Дроссели подавления ЭМП
22	Газовые разрядники
23	Варисторы
24	Предохранители керамические
25	Предохранители стеклянные
26	Стабилитроны
27	Диоды Шоттки
28	Диоды силовые
29	Транзисторы биполярные
30	Транзисторы полевые
31	Тиристоры
32	Симисторы
33	Кварцевые генераторы
34	Кварцевые резонаторы
\.


--
-- TOC entry 3404 (class 0 OID 28779)
-- Dependencies: 229
-- Data for Name: order_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_status (order_status_id, order_status) FROM stdin;
1	Order pending
2	Order accepted for processing
3	Order collected
4	Order on the way
5	Order delivered
\.


--
-- TOC entry 3390 (class 0 OID 28645)
-- Dependencies: 215
-- Data for Name: production; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.production (production_id, production, country_id) FROM stdin;
1	ON Semiconductor	1
2	Fairchild	1
3	Analog Devices	1
4	Alpha & Omega	1
5	Intersil	1
6	Mini-Circuits	1
7	Texas Instruments	1
8	Nexperia	2
9	Infineon	3
10	Semikron	3
11	Протон-Импульс	4
12	Littelfuse	1
13	Mitsubishi	5
14	No trademark	6
15	ST Microelectronics	7
16	Murata	5
17	JB Capacitors	8
18	Китай	8
19	Panasonic	5
20	Kemet	1
21	Тайвань	9
22	ChipDipDac	4
23	Bourns	1
24	EPCOS	3
25	Siba	10
26	Hottech	8
27	SUNMATE	8
28	Vishay	1
29	СИЛОВЫЕ ДИОДЫ	4
30	Интеграл	4
31	IR	1
32	NEC	5
33	WeEn	5
34	Монолит	4
\.


--
-- TOC entry 3398 (class 0 OID 28729)
-- Dependencies: 223
-- Data for Name: storage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.storage (storage_id, component_id, amount) FROM stdin;
1	1	16
2	2	43
3	3	63
4	4	19
5	5	4
6	6	65
7	7	99
8	8	23
9	9	2
10	10	34
11	11	0
12	12	8
13	13	1
14	14	86
15	15	75
16	16	43
17	17	154
18	18	32
19	19	42
20	20	22
21	21	73
22	22	91
23	23	37
24	24	52
25	25	7
26	26	39
27	27	84
28	28	108
29	29	123
30	30	42
31	31	17
32	32	88
33	33	3
34	34	26
35	35	87
36	36	72
37	37	9
38	38	4
39	39	0
40	40	2
41	41	42
42	42	38
43	43	77
44	44	109
45	45	26
46	46	6
47	47	2
48	48	96
49	49	55
50	50	36
51	51	58
52	52	93
53	53	35
54	54	51
55	55	60
56	56	116
57	57	5
58	58	10
59	59	44
60	60	71
61	61	9
62	62	104
63	63	117
64	64	0
65	65	1
66	66	532
67	67	32
68	68	18
69	69	49
70	70	36
71	71	75
72	72	38
73	73	29
74	74	98
75	75	99
76	76	64
77	77	186
78	78	17
79	79	42
80	80	17
81	81	97
82	82	89
83	83	72
84	84	61
85	85	58
86	86	26
87	87	28
88	88	100
89	89	0
90	90	4
91	91	96
92	92	94
93	93	153
94	94	228
95	95	0
96	96	90
97	97	52
98	98	4
99	99	8
100	100	1
101	101	9
102	102	2
103	103	94
104	104	43
105	105	31
106	106	37
107	107	74
108	108	49
109	109	43
110	110	1
111	111	105
112	112	3
113	113	6
114	114	2
115	115	14
116	116	55
117	117	118
118	118	83
119	119	43
120	120	30
121	121	28
122	122	17
123	123	26
124	124	1
125	125	12
126	126	13
127	127	28
128	128	39
129	129	74
130	130	98
131	131	54
132	132	4
133	133	41
134	134	16
135	135	131
136	136	15
137	137	25
138	138	35
139	139	84
140	140	57
141	141	72
142	142	38
143	143	86
144	144	83
145	145	48
146	146	754
147	147	0
148	148	85
149	149	46
150	150	63
151	151	26
152	152	1
153	153	34
154	154	53
155	155	46
156	156	987
157	157	0
158	158	0
159	159	0
160	160	73
161	161	253
162	162	251
163	163	362
164	164	3
165	165	37
166	166	69
167	167	73
\.


--
-- TOC entry 3400 (class 0 OID 28741)
-- Dependencies: 225
-- Data for Name: supply; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supply (supply_id, component_id, amount, order_date, order_status_id, delivery_date) FROM stdin;
1	1	16	2022-03-10	5	2022-03-20
2	2	43	2022-03-13	5	2022-03-21
3	6	63	2022-03-13	5	2022-03-21
52	167	73	2022-06-16	1	\N
4	9	19	2022-03-13	5	2022-03-19
5	12	4	2022-03-20	5	2022-03-30
6	13	65	2022-04-24	5	2022-05-07
7	15	74	2022-05-16	5	2022-05-29
8	18	31	2022-05-19	5	2022-05-27
9	19	8	2022-06-10	3	\N
10	21	9	2022-06-13	2	\N
11	25	49	2022-06-08	4	\N
12	27	83	2022-06-06	4	\N
13	30	111	2022-04-07	4	2022-04-27
14	33	69	2022-04-01	4	2022-04-14
15	34	98	2022-06-09	4	\N
16	35	31	2022-06-09	5	2022-06-14
17	36	27	2022-03-11	5	2022-03-25
18	40	9	2022-04-26	5	2022-05-10
19	44	31	2022-04-26	5	2022-05-06
20	48	1	2022-04-26	5	2022-05-08
21	49	3	2022-06-16	1	\N
22	60	105	2022-06-12	2	\N
23	62	6	2022-06-06	5	2022-06-17
24	63	23	2022-04-06	5	2022-04-14
25	69	26	2022-03-12	5	2022-03-29
26	71	52	2022-03-12	5	2022-03-26
27	74	93	2022-04-14	5	2022-04-29
28	77	18	2022-05-16	5	2022-05-29
29	80	62	2022-05-16	5	2022-05-31
30	86	84	2022-05-30	5	2022-06-11
31	87	1	2022-06-09	4	\N
32	89	74	2022-06-07	4	\N
33	95	51	2022-06-14	2	\N
34	103	40	2022-03-21	5	2022-04-05
35	110	198	2022-03-28	5	2022-04-05
36	116	63	2022-04-30	5	2022-05-20
37	120	8	2022-06-14	2	\N
38	126	29	2022-03-14	5	2022-03-20
39	127	81	2022-06-04	4	2022-03-31
40	128	17	2022-06-13	2	\N
41	131	4	2022-06-03	5	2022-06-14
42	136	169	2022-06-01	5	2022-06-12
43	140	48	2022-05-21	5	2022-06-01
44	149	51	2022-05-26	5	2022-06-09
45	154	91	2022-06-08	3	\N
46	155	59	2022-04-08	5	2022-04-19
47	156	3	2022-06-14	1	\N
48	160	72	2022-05-05	5	2022-05-26
49	162	77	2022-04-01	5	2022-05-01
50	164	66	2022-06-06	4	\N
51	165	69	2022-06-01	5	2022-06-16
\.


--
-- TOC entry 3392 (class 0 OID 28652)
-- Dependencies: 217
-- Data for Name: type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type (type_id, type) FROM stdin;
1	Микросхемы
2	Полупроводниковые модули
3	Конденсаторы
4	Резисторы
5	Индуктивные компоненты
6	Устройства защиты
7	Предохранители
8	Диоды
9	Транзисторы
10	Тиристоры и Триаки
11	Резонаторы и фильтры
\.


--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 220
-- Name: component_component_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.component_component_id_seq', 167, true);


--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 226
-- Name: country_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_country_id_seq', 10, true);


--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 218
-- Name: element_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.element_element_id_seq', 45, true);


--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 228
-- Name: order_status_order_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_status_order_status_id_seq', 5, true);


--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 214
-- Name: production_production_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.production_production_id_seq', 34, true);


--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 222
-- Name: storage_storage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.storage_storage_id_seq', 219, true);


--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 224
-- Name: supply_supply_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supply_supply_id_seq', 52, true);


--
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 216
-- Name: type_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_type_id_seq', 11, true);


--
-- TOC entry 3229 (class 2606 OID 28712)
-- Name: component component_id_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT component_id_constraint PRIMARY KEY (component_id);


--
-- TOC entry 3235 (class 2606 OID 28772)
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (country_id);


--
-- TOC entry 3225 (class 2606 OID 28755)
-- Name: element element_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT element_constraint UNIQUE (element);


--
-- TOC entry 3227 (class 2606 OID 28705)
-- Name: element element_id_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT element_id_constraint PRIMARY KEY (element_id);


--
-- TOC entry 3237 (class 2606 OID 28786)
-- Name: order_status order_status_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status
    ADD CONSTRAINT order_status_constraint UNIQUE (order_status);


--
-- TOC entry 3239 (class 2606 OID 28784)
-- Name: order_status order_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status
    ADD CONSTRAINT order_status_pkey PRIMARY KEY (order_status_id);


--
-- TOC entry 3217 (class 2606 OID 28753)
-- Name: production production_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production
    ADD CONSTRAINT production_constraint UNIQUE (production);


--
-- TOC entry 3219 (class 2606 OID 28650)
-- Name: production production_id_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production
    ADD CONSTRAINT production_id_constraint PRIMARY KEY (production_id);


--
-- TOC entry 3231 (class 2606 OID 28734)
-- Name: storage storage_id_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage
    ADD CONSTRAINT storage_id_constraint PRIMARY KEY (storage_id);


--
-- TOC entry 3233 (class 2606 OID 28746)
-- Name: supply supply_id_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supply
    ADD CONSTRAINT supply_id_constraint PRIMARY KEY (supply_id);


--
-- TOC entry 3221 (class 2606 OID 28757)
-- Name: type type_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type
    ADD CONSTRAINT type_constraint UNIQUE (type);


--
-- TOC entry 3223 (class 2606 OID 28657)
-- Name: type type_id_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type
    ADD CONSTRAINT type_id_constraint PRIMARY KEY (type_id);


--
-- TOC entry 3241 (class 2606 OID 28718)
-- Name: component component_element_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT component_element_id_fkey FOREIGN KEY (element_id) REFERENCES public.element(element_id);


--
-- TOC entry 3242 (class 2606 OID 28723)
-- Name: component component_production_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT component_production_id_fkey FOREIGN KEY (production_id) REFERENCES public.production(production_id);


--
-- TOC entry 3243 (class 2606 OID 28713)
-- Name: component component_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT component_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.type(type_id);


--
-- TOC entry 3240 (class 2606 OID 28773)
-- Name: production production_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production
    ADD CONSTRAINT production_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.country(country_id);


--
-- TOC entry 3244 (class 2606 OID 28735)
-- Name: storage storage_component_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage
    ADD CONSTRAINT storage_component_id_fkey FOREIGN KEY (component_id) REFERENCES public.component(component_id);


--
-- TOC entry 3245 (class 2606 OID 28747)
-- Name: supply supply_component_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supply
    ADD CONSTRAINT supply_component_id_fkey FOREIGN KEY (component_id) REFERENCES public.component(component_id);


--
-- TOC entry 3246 (class 2606 OID 28787)
-- Name: supply supply_order_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supply
    ADD CONSTRAINT supply_order_status_id_fkey FOREIGN KEY (order_status_id) REFERENCES public.order_status(order_status_id);


-- Completed on 2023-03-10 18:24:10

--
-- PostgreSQL database dump complete
--

