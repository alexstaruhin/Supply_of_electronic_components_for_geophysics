--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-03-10 22:19:26

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
-- TOC entry 3472 (class 1262 OID 27966)
-- Name: Electronic_components_database_for_Geophysics; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Electronic_components_database_for_Geophysics" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE "Electronic_components_database_for_Geophysics" OWNER TO postgres;

\connect "Electronic_components_database_for_Geophysics"

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
-- TOC entry 215 (class 1259 OID 27968)
-- Name: architecture; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.architecture (
    architecture_id bigint NOT NULL,
    architecture character varying(50) NOT NULL
);


ALTER TABLE public.architecture OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 27967)
-- Name: architecture_architecture_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.architecture_architecture_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.architecture_architecture_id_seq OWNER TO postgres;

--
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 214
-- Name: architecture_architecture_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.architecture_architecture_id_seq OWNED BY public.architecture.architecture_id;


--
-- TOC entry 229 (class 1259 OID 28322)
-- Name: capacitor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.capacitor (
    capacitor_id bigint NOT NULL,
    component_name character varying(100) NOT NULL,
    component_id bigint NOT NULL,
    production_id bigint NOT NULL,
    operating_voltage integer,
    rated_capacity numeric(9,2),
    unit_id bigint
);


ALTER TABLE public.capacitor OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 28321)
-- Name: capacitor_capacitor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.capacitor_capacitor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.capacitor_capacitor_id_seq OWNER TO postgres;

--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 228
-- Name: capacitor_capacitor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.capacitor_capacitor_id_seq OWNED BY public.capacitor.capacitor_id;


--
-- TOC entry 225 (class 1259 OID 28013)
-- Name: component; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.component (
    component_id bigint NOT NULL,
    component character varying(50) NOT NULL
);


ALTER TABLE public.component OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 28012)
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
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 224
-- Name: component_component_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.component_component_id_seq OWNED BY public.component.component_id;


--
-- TOC entry 219 (class 1259 OID 27986)
-- Name: data_interface; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data_interface (
    data_interface_id bigint NOT NULL,
    data_interface character varying(50) NOT NULL
);


ALTER TABLE public.data_interface OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 27985)
-- Name: data_interface_data_interface_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.data_interface_data_interface_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.data_interface_data_interface_id_seq OWNER TO postgres;

--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 218
-- Name: data_interface_data_interface_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.data_interface_data_interface_id_seq OWNED BY public.data_interface.data_interface_id;


--
-- TOC entry 217 (class 1259 OID 27977)
-- Name: framework; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.framework (
    framework_id bigint NOT NULL,
    framework character varying(50) NOT NULL
);


ALTER TABLE public.framework OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 27976)
-- Name: framework_framework_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.framework_framework_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.framework_framework_id_seq OWNER TO postgres;

--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 216
-- Name: framework_framework_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.framework_framework_id_seq OWNED BY public.framework.framework_id;


--
-- TOC entry 233 (class 1259 OID 28426)
-- Name: microchips; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.microchips (
    microchips_id bigint NOT NULL,
    component_name character varying(100) NOT NULL,
    component_id bigint,
    production_id bigint,
    architecture_id bigint,
    data_interface_id bigint,
    framework_id bigint
);


ALTER TABLE public.microchips OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 28425)
-- Name: microchips_microchips_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.microchips_microchips_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.microchips_microchips_id_seq OWNER TO postgres;

--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 232
-- Name: microchips_microchips_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.microchips_microchips_id_seq OWNED BY public.microchips.microchips_id;


--
-- TOC entry 221 (class 1259 OID 27995)
-- Name: production; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.production (
    production_id bigint NOT NULL,
    production character varying(50) NOT NULL
);


ALTER TABLE public.production OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 27994)
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
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 220
-- Name: production_production_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.production_production_id_seq OWNED BY public.production.production_id;


--
-- TOC entry 231 (class 1259 OID 28344)
-- Name: resistor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resistor (
    resistor_id bigint NOT NULL,
    component_name character varying(100) NOT NULL,
    component_id bigint NOT NULL,
    production_id bigint NOT NULL,
    type_id bigint,
    nominal_resistance numeric(4,1),
    unit_id bigint,
    accuracy integer,
    rated_power numeric(5,2)
);


ALTER TABLE public.resistor OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 28343)
-- Name: resistor_resistor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resistor_resistor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resistor_resistor_id_seq OWNER TO postgres;

--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 230
-- Name: resistor_resistor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resistor_resistor_id_seq OWNED BY public.resistor.resistor_id;


--
-- TOC entry 239 (class 1259 OID 28631)
-- Name: storage_capacitor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.storage_capacitor (
    storage_capacitor_id bigint NOT NULL,
    capacitor_id bigint NOT NULL,
    amount integer,
    price numeric(9,2)
);


ALTER TABLE public.storage_capacitor OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 28630)
-- Name: storage_capacitor_storage_capacitor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.storage_capacitor_storage_capacitor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.storage_capacitor_storage_capacitor_id_seq OWNER TO postgres;

--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 238
-- Name: storage_capacitor_storage_capacitor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.storage_capacitor_storage_capacitor_id_seq OWNED BY public.storage_capacitor.storage_capacitor_id;


--
-- TOC entry 235 (class 1259 OID 28607)
-- Name: storage_microchips; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.storage_microchips (
    storage_microchip_id bigint NOT NULL,
    microchips_id bigint NOT NULL,
    amount integer,
    price numeric(9,2)
);


ALTER TABLE public.storage_microchips OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 28606)
-- Name: storage_microchips_storage_microchip_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.storage_microchips_storage_microchip_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.storage_microchips_storage_microchip_id_seq OWNER TO postgres;

--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 234
-- Name: storage_microchips_storage_microchip_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.storage_microchips_storage_microchip_id_seq OWNED BY public.storage_microchips.storage_microchip_id;


--
-- TOC entry 237 (class 1259 OID 28619)
-- Name: storage_resistor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.storage_resistor (
    storage_resistor_id bigint NOT NULL,
    resistor_id bigint NOT NULL,
    amount integer,
    price numeric(9,2)
);


ALTER TABLE public.storage_resistor OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 28618)
-- Name: storage_resistor_storage_resistor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.storage_resistor_storage_resistor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.storage_resistor_storage_resistor_id_seq OWNER TO postgres;

--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 236
-- Name: storage_resistor_storage_resistor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.storage_resistor_storage_resistor_id_seq OWNED BY public.storage_resistor.storage_resistor_id;


--
-- TOC entry 227 (class 1259 OID 28283)
-- Name: type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type (
    type_id bigint NOT NULL,
    type character varying(50)
);


ALTER TABLE public.type OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 28282)
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
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 226
-- Name: type_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_type_id_seq OWNED BY public.type.type_id;


--
-- TOC entry 223 (class 1259 OID 28004)
-- Name: unit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unit (
    unit_id bigint NOT NULL,
    unit character varying(50) NOT NULL
);


ALTER TABLE public.unit OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 28003)
-- Name: unit_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.unit_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unit_unit_id_seq OWNER TO postgres;

--
-- TOC entry 3485 (class 0 OID 0)
-- Dependencies: 222
-- Name: unit_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unit_unit_id_seq OWNED BY public.unit.unit_id;


--
-- TOC entry 3233 (class 2604 OID 27971)
-- Name: architecture architecture_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.architecture ALTER COLUMN architecture_id SET DEFAULT nextval('public.architecture_architecture_id_seq'::regclass);


--
-- TOC entry 3240 (class 2604 OID 28325)
-- Name: capacitor capacitor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capacitor ALTER COLUMN capacitor_id SET DEFAULT nextval('public.capacitor_capacitor_id_seq'::regclass);


--
-- TOC entry 3238 (class 2604 OID 28016)
-- Name: component component_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component ALTER COLUMN component_id SET DEFAULT nextval('public.component_component_id_seq'::regclass);


--
-- TOC entry 3235 (class 2604 OID 27989)
-- Name: data_interface data_interface_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_interface ALTER COLUMN data_interface_id SET DEFAULT nextval('public.data_interface_data_interface_id_seq'::regclass);


--
-- TOC entry 3234 (class 2604 OID 27980)
-- Name: framework framework_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.framework ALTER COLUMN framework_id SET DEFAULT nextval('public.framework_framework_id_seq'::regclass);


--
-- TOC entry 3242 (class 2604 OID 28429)
-- Name: microchips microchips_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.microchips ALTER COLUMN microchips_id SET DEFAULT nextval('public.microchips_microchips_id_seq'::regclass);


--
-- TOC entry 3236 (class 2604 OID 27998)
-- Name: production production_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production ALTER COLUMN production_id SET DEFAULT nextval('public.production_production_id_seq'::regclass);


--
-- TOC entry 3241 (class 2604 OID 28347)
-- Name: resistor resistor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resistor ALTER COLUMN resistor_id SET DEFAULT nextval('public.resistor_resistor_id_seq'::regclass);


--
-- TOC entry 3245 (class 2604 OID 28634)
-- Name: storage_capacitor storage_capacitor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage_capacitor ALTER COLUMN storage_capacitor_id SET DEFAULT nextval('public.storage_capacitor_storage_capacitor_id_seq'::regclass);


--
-- TOC entry 3243 (class 2604 OID 28610)
-- Name: storage_microchips storage_microchip_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage_microchips ALTER COLUMN storage_microchip_id SET DEFAULT nextval('public.storage_microchips_storage_microchip_id_seq'::regclass);


--
-- TOC entry 3244 (class 2604 OID 28622)
-- Name: storage_resistor storage_resistor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage_resistor ALTER COLUMN storage_resistor_id SET DEFAULT nextval('public.storage_resistor_storage_resistor_id_seq'::regclass);


--
-- TOC entry 3239 (class 2604 OID 28286)
-- Name: type type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type ALTER COLUMN type_id SET DEFAULT nextval('public.type_type_id_seq'::regclass);


--
-- TOC entry 3237 (class 2604 OID 28007)
-- Name: unit unit_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unit ALTER COLUMN unit_id SET DEFAULT nextval('public.unit_unit_id_seq'::regclass);


--
-- TOC entry 3442 (class 0 OID 27968)
-- Dependencies: 215
-- Data for Name: architecture; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.architecture (architecture_id, architecture) FROM stdin;
1	sigma-delta
2	string dac
3	current source
4	sar
\.


--
-- TOC entry 3456 (class 0 OID 28322)
-- Dependencies: 229
-- Data for Name: capacitor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.capacitor (capacitor_id, component_name, component_id, production_id, operating_voltage, rated_capacity, unit_id) FROM stdin;
1	DEBE33F472ZA3B	5	3	3150	4700.00	1
2	JYC3D101KBY	5	4	2000	100.00	1
3	JYC3D102MBE	5	4	2000	1000.00	1
5	JYC3D152MBE	5	4	2000	1500.00	1
6	JYC3D222MBF	5	4	2000	2200.00	1
7	JYC3D332MBF	5	4	2000	3300.00	1
8	JYC3D471KBB	5	4	2000	470.00	1
9	JYC3D472MBF	5	4	2000	4700.00	1
10	JYC3D681KBB	5	4	2000	680.00	1
21	К10-17А	7	5	50	7.00	1
22	К10-17Б	7	6	50	12.00	1
23	КМ5Б	7	5	160	1000.00	1
4	JYC3D103MCF	5	4	2000	0.01	2
11	GRM2165C1H1R1C	6	3	50	1.10	1
12	GRM2165C1H1R2C	6	3	50	1.20	1
13	GRM2165C1H1R3C	6	3	50	1.30	1
14	GRM2165C1H1R5C	6	3	50	1.50	1
15	GRM2165C1H1R6C	6	3	50	1.60	1
16	GRM2165C1H1R8C	6	3	50	1.80	1
17	GRM2165C1H2R0C	6	3	50	2.00	1
18	GRM2165C1H2R2C	6	3	50	2.20	1
19	GRM2165C1H2R4C	6	3	50	2.40	1
20	GRM2165C1H2R7C	6	3	50	2.70	1
\.


--
-- TOC entry 3452 (class 0 OID 28013)
-- Dependencies: 225
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.component (component_id, component) FROM stdin;
1	ADC chips
2	DAC chips
3	Low power resistors
4	Powerful resistors
5	High voltage ceramic capacitors
6	SMD Ceramic Capacitors
7	Capacitors ceramic output multilayer
\.


--
-- TOC entry 3446 (class 0 OID 27986)
-- Dependencies: 219
-- Data for Name: data_interface; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.data_interface (data_interface_id, data_interface) FROM stdin;
1	dsp
2	I2S
3	spi
4	parallel
\.


--
-- TOC entry 3444 (class 0 OID 27977)
-- Dependencies: 217
-- Data for Name: framework; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.framework (framework_id, framework) FROM stdin;
1	tssop-24(0.173 inch)
2	soic-8(0.154 inch)
3	msop-8(0.118 inch)
4	msop-10(0.118 inch)
5	dip-16(0.300 inch)
6	soic-16(0.295 inch)
7	lqfp-64(10x10)
8	dip-24(0.300 inch)
9	soic-24(0.295 inch)
10	tssop-16(0.173 inch)
11	sc-70-6
12	DIP-20(0.300 inch)
\.


--
-- TOC entry 3460 (class 0 OID 28426)
-- Dependencies: 233
-- Data for Name: microchips; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.microchips (microchips_id, component_name, component_id, production_id, architecture_id, data_interface_id, framework_id) FROM stdin;
1	AD7190BRUZ-REEL	1	1	1	1	1
2	AD7495ARZ	1	1	4	1	2
3	AD7495BRZ	1	1	4	3	2
4	AD7680ARMZ	1	1	4	3	3
5	AD7680BRMZ	1	1	4	1	3
6	AD7683BRMZ	1	1	4	1	3
7	AD7685BRMZ	1	1	4	3	4
8	AD7705BNZ	1	1	1	1	5
9	AD7705BRZ-REEL	1	1	1	3	6
10	AD7706BNZ	1	1	1	3	5
11	AD1933WBSTZ	2	1	1	2	7
12	AD420ANZ-32	2	1	1	3	8
13	AD420ARZ-32-REEL	2	1	1	3	9
14	AD5300BRMZ	2	1	2	1	3
15	AD5302ARMZ	2	1	2	1	4
16	AD5320BRMZ	2	1	2	3	3
17	AD5322BRMZ	2	1	2	1	4
18	AD5328BRUZ	2	1	2	3	10
19	AD5621BKSZ-500RL7	2	1	2	1	11
20	AD7302BNZ	2	1	3	4	12
\.


--
-- TOC entry 3448 (class 0 OID 27995)
-- Dependencies: 221
-- Data for Name: production; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.production (production_id, production) FROM stdin;
1	Analog Devices
2	Тайвань
3	Murata
4	JB Capacitors
5	Монолит
6	Китай
\.


--
-- TOC entry 3458 (class 0 OID 28344)
-- Dependencies: 231
-- Data for Name: resistor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resistor (resistor_id, component_name, component_id, production_id, type_id, nominal_resistance, unit_id, accuracy, rated_power) FROM stdin;
1	CF-100 (С1-4)	3	2	2	330.0	3	5	1.00
2	CF-25 (С1-4)	3	2	2	3.0	3	5	0.25
3	CF-50 (С1-4)	3	2	2	68.0	3	5	0.50
4	KNP-100	3	2	4	2.2	3	5	1.00
5	KNP-200	3	2	4	0.1	3	5	2.00
6	MF-25 (С2-23)	3	2	3	82.0	5	1	0.25
7	MO-100 (С2-23)	3	2	3	3.3	4	5	1.00
8	MO-200 (С2-23)	3	2	3	3.3	3	5	2.00
9	AH-100	4	2	1	0.1	3	5	100.00
10	AH-25	4	2	1	100.0	3	5	25.00
11	AH-50	4	2	1	0.1	3	5	50.00
12	KNP-500	4	2	4	0.1	3	5	5.00
13	SQP 3	4	2	5	47.0	3	5	3.00
14	SQP 10	4	2	5	47.0	3	5	10.00
15	SQP 20	4	2	5	0.1	3	5	20.00
16	SQP 5	4	2	5	47.0	5	5	5.00
17	SQP 15	4	2	5	20.0	3	5	15.00
\.


--
-- TOC entry 3466 (class 0 OID 28631)
-- Dependencies: 239
-- Data for Name: storage_capacitor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.storage_capacitor (storage_capacitor_id, capacitor_id, amount, price) FROM stdin;
1	1	96	90.00
2	2	31	13.00
3	3	253	13.00
4	4	208	20.00
5	5	273	13.00
6	6	18	15.00
7	7	145	13.00
8	8	99	13.00
9	9	153	15.00
10	10	147	6.60
11	11	12	8.00
12	12	83	8.00
13	13	46	8.00
14	14	38	8.00
15	15	91	8.00
16	16	194	8.00
17	17	164	9.00
18	18	152	9.00
19	19	407	7.00
20	20	308	8.00
21	21	153	49.00
22	22	506	6.00
23	23	100	49.00
\.


--
-- TOC entry 3462 (class 0 OID 28607)
-- Dependencies: 235
-- Data for Name: storage_microchips; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.storage_microchips (storage_microchip_id, microchips_id, amount, price) FROM stdin;
1	1	55	1640.00
2	2	67	2940.00
3	3	20	2940.00
4	4	49	2260.00
5	5	9	2980.00
6	6	0	2600.00
7	7	5	2340.00
8	8	13	2090.00
9	9	18	1230.00
10	10	5	1590.00
11	11	62	2160.00
12	12	54	2610.00
13	13	3	6230.00
14	14	42	580.00
15	15	33	600.00
16	16	19	1790.00
17	17	54	2120.00
18	18	6	2080.00
19	19	9	1740.00
20	20	109	790.00
\.


--
-- TOC entry 3464 (class 0 OID 28619)
-- Dependencies: 237
-- Data for Name: storage_resistor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.storage_resistor (storage_resistor_id, resistor_id, amount, price) FROM stdin;
1	1	256	8.00
2	2	211	6.00
3	3	199	8.00
4	4	176	11.00
5	5	130	21.00
6	6	173	6.00
7	7	188	6.00
8	8	105	11.00
9	9	19	1400.00
10	10	87	230.00
11	11	67	370.00
12	12	69	30.00
13	13	21	21.00
14	14	87	28.00
15	15	144	58.00
16	16	105	22.00
17	17	188	40.00
\.


--
-- TOC entry 3454 (class 0 OID 28283)
-- Dependencies: 227
-- Data for Name: type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type (type_id, type) FROM stdin;
1	ah
2	с1-4
3	c2-23
4	knp
5	sqp
\.


--
-- TOC entry 3450 (class 0 OID 28004)
-- Dependencies: 223
-- Data for Name: unit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.unit (unit_id, unit) FROM stdin;
1	пФ
2	мкф
3	ом
4	мом
5	ком
\.


--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 214
-- Name: architecture_architecture_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.architecture_architecture_id_seq', 4, true);


--
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 228
-- Name: capacitor_capacitor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.capacitor_capacitor_id_seq', 23, true);


--
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 224
-- Name: component_component_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.component_component_id_seq', 7, true);


--
-- TOC entry 3489 (class 0 OID 0)
-- Dependencies: 218
-- Name: data_interface_data_interface_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.data_interface_data_interface_id_seq', 4, true);


--
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 216
-- Name: framework_framework_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.framework_framework_id_seq', 12, true);


--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 232
-- Name: microchips_microchips_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.microchips_microchips_id_seq', 20, true);


--
-- TOC entry 3492 (class 0 OID 0)
-- Dependencies: 220
-- Name: production_production_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.production_production_id_seq', 15, true);


--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 230
-- Name: resistor_resistor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.resistor_resistor_id_seq', 17, true);


--
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 238
-- Name: storage_capacitor_storage_capacitor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.storage_capacitor_storage_capacitor_id_seq', 23, true);


--
-- TOC entry 3495 (class 0 OID 0)
-- Dependencies: 234
-- Name: storage_microchips_storage_microchip_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.storage_microchips_storage_microchip_id_seq', 20, true);


--
-- TOC entry 3496 (class 0 OID 0)
-- Dependencies: 236
-- Name: storage_resistor_storage_resistor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.storage_resistor_storage_resistor_id_seq', 17, true);


--
-- TOC entry 3497 (class 0 OID 0)
-- Dependencies: 226
-- Name: type_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_type_id_seq', 5, true);


--
-- TOC entry 3498 (class 0 OID 0)
-- Dependencies: 222
-- Name: unit_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.unit_unit_id_seq', 5, true);


--
-- TOC entry 3247 (class 2606 OID 27975)
-- Name: architecture architecture_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.architecture
    ADD CONSTRAINT architecture_constraint UNIQUE (architecture);


--
-- TOC entry 3249 (class 2606 OID 27973)
-- Name: architecture architecture_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.architecture
    ADD CONSTRAINT architecture_pkey PRIMARY KEY (architecture_id);


--
-- TOC entry 3273 (class 2606 OID 28327)
-- Name: capacitor capacitor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capacitor
    ADD CONSTRAINT capacitor_pkey PRIMARY KEY (capacitor_id);


--
-- TOC entry 3267 (class 2606 OID 28020)
-- Name: component component_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT component_constraint UNIQUE (component);


--
-- TOC entry 3269 (class 2606 OID 28018)
-- Name: component component_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT component_pkey PRIMARY KEY (component_id);


--
-- TOC entry 3255 (class 2606 OID 27993)
-- Name: data_interface data_interface_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_interface
    ADD CONSTRAINT data_interface_constraint UNIQUE (data_interface);


--
-- TOC entry 3257 (class 2606 OID 27991)
-- Name: data_interface data_interface_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_interface
    ADD CONSTRAINT data_interface_pkey PRIMARY KEY (data_interface_id);


--
-- TOC entry 3251 (class 2606 OID 27984)
-- Name: framework framework_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.framework
    ADD CONSTRAINT framework_constraint UNIQUE (framework);


--
-- TOC entry 3253 (class 2606 OID 27982)
-- Name: framework framework_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.framework
    ADD CONSTRAINT framework_pkey PRIMARY KEY (framework_id);


--
-- TOC entry 3277 (class 2606 OID 28431)
-- Name: microchips microchips_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.microchips
    ADD CONSTRAINT microchips_pkey PRIMARY KEY (microchips_id);


--
-- TOC entry 3259 (class 2606 OID 28002)
-- Name: production production_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production
    ADD CONSTRAINT production_constraint UNIQUE (production);


--
-- TOC entry 3261 (class 2606 OID 28000)
-- Name: production production_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production
    ADD CONSTRAINT production_pkey PRIMARY KEY (production_id);


--
-- TOC entry 3275 (class 2606 OID 28349)
-- Name: resistor resistor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resistor
    ADD CONSTRAINT resistor_pkey PRIMARY KEY (resistor_id);


--
-- TOC entry 3283 (class 2606 OID 28636)
-- Name: storage_capacitor storage_capacitor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage_capacitor
    ADD CONSTRAINT storage_capacitor_pkey PRIMARY KEY (storage_capacitor_id);


--
-- TOC entry 3279 (class 2606 OID 28612)
-- Name: storage_microchips storage_microchips_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage_microchips
    ADD CONSTRAINT storage_microchips_pkey PRIMARY KEY (storage_microchip_id);


--
-- TOC entry 3281 (class 2606 OID 28624)
-- Name: storage_resistor storage_resistor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage_resistor
    ADD CONSTRAINT storage_resistor_pkey PRIMARY KEY (storage_resistor_id);


--
-- TOC entry 3271 (class 2606 OID 28288)
-- Name: type type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type
    ADD CONSTRAINT type_pkey PRIMARY KEY (type_id);


--
-- TOC entry 3263 (class 2606 OID 28011)
-- Name: unit unit_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unit
    ADD CONSTRAINT unit_constraint UNIQUE (unit);


--
-- TOC entry 3265 (class 2606 OID 28009)
-- Name: unit unit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unit
    ADD CONSTRAINT unit_pkey PRIMARY KEY (unit_id);


--
-- TOC entry 3284 (class 2606 OID 28328)
-- Name: capacitor capacitor_component_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capacitor
    ADD CONSTRAINT capacitor_component_id_fkey FOREIGN KEY (component_id) REFERENCES public.component(component_id);


--
-- TOC entry 3285 (class 2606 OID 28333)
-- Name: capacitor capacitor_production_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capacitor
    ADD CONSTRAINT capacitor_production_id_fkey FOREIGN KEY (production_id) REFERENCES public.production(production_id);


--
-- TOC entry 3286 (class 2606 OID 28338)
-- Name: capacitor capacitor_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capacitor
    ADD CONSTRAINT capacitor_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.unit(unit_id);


--
-- TOC entry 3291 (class 2606 OID 28442)
-- Name: microchips microchips_architecture_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.microchips
    ADD CONSTRAINT microchips_architecture_id_fkey FOREIGN KEY (architecture_id) REFERENCES public.architecture(architecture_id);


--
-- TOC entry 3292 (class 2606 OID 28432)
-- Name: microchips microchips_component_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.microchips
    ADD CONSTRAINT microchips_component_id_fkey FOREIGN KEY (component_id) REFERENCES public.component(component_id);


--
-- TOC entry 3293 (class 2606 OID 28447)
-- Name: microchips microchips_data_interface_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.microchips
    ADD CONSTRAINT microchips_data_interface_id_fkey FOREIGN KEY (data_interface_id) REFERENCES public.data_interface(data_interface_id);


--
-- TOC entry 3294 (class 2606 OID 28452)
-- Name: microchips microchips_framework_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.microchips
    ADD CONSTRAINT microchips_framework_id_fkey FOREIGN KEY (framework_id) REFERENCES public.framework(framework_id);


--
-- TOC entry 3295 (class 2606 OID 28437)
-- Name: microchips microchips_production_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.microchips
    ADD CONSTRAINT microchips_production_id_fkey FOREIGN KEY (production_id) REFERENCES public.production(production_id);


--
-- TOC entry 3287 (class 2606 OID 28350)
-- Name: resistor resistor_component_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resistor
    ADD CONSTRAINT resistor_component_id_fkey FOREIGN KEY (component_id) REFERENCES public.component(component_id);


--
-- TOC entry 3288 (class 2606 OID 28355)
-- Name: resistor resistor_production_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resistor
    ADD CONSTRAINT resistor_production_id_fkey FOREIGN KEY (production_id) REFERENCES public.production(production_id);


--
-- TOC entry 3289 (class 2606 OID 28360)
-- Name: resistor resistor_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resistor
    ADD CONSTRAINT resistor_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.type(type_id);


--
-- TOC entry 3290 (class 2606 OID 28365)
-- Name: resistor resistor_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resistor
    ADD CONSTRAINT resistor_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.unit(unit_id);


--
-- TOC entry 3298 (class 2606 OID 28637)
-- Name: storage_capacitor storage_capacitor_capacitor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage_capacitor
    ADD CONSTRAINT storage_capacitor_capacitor_id_fkey FOREIGN KEY (capacitor_id) REFERENCES public.capacitor(capacitor_id);


--
-- TOC entry 3296 (class 2606 OID 28613)
-- Name: storage_microchips storage_microchips_microchips_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage_microchips
    ADD CONSTRAINT storage_microchips_microchips_id_fkey FOREIGN KEY (microchips_id) REFERENCES public.microchips(microchips_id);


--
-- TOC entry 3297 (class 2606 OID 28625)
-- Name: storage_resistor storage_resistor_resistor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage_resistor
    ADD CONSTRAINT storage_resistor_resistor_id_fkey FOREIGN KEY (resistor_id) REFERENCES public.resistor(resistor_id);


-- Completed on 2023-03-10 22:19:28

--
-- PostgreSQL database dump complete
--

