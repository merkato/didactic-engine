--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 10.1

-- Started on 2017-11-30 10:44:17 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 86239)
-- Name: prewencja; Type: SCHEMA; Schema: -; Owner: osm
--

CREATE SCHEMA prewencja;


ALTER SCHEMA prewencja OWNER TO osm;

--
-- TOC entry 3652 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA prewencja; Type: COMMENT; Schema: -; Owner: osm
--

COMMENT ON SCHEMA prewencja IS 'Schemat danych dla usługi Prewentysta';


SET search_path = prewencja, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = true;

--
-- TOC entry 204 (class 1259 OID 87751)
-- Name: funkcjonariusze; Type: TABLE; Schema: prewencja; Owner: osm
--

CREATE TABLE funkcjonariusze (
    user_id integer NOT NULL,
    stopien character varying(20),
    tytul character varying(45),
    nazwisko character varying(45),
    stanowisko character varying(45),
    legitymacja character varying(10)
);


ALTER TABLE funkcjonariusze OWNER TO osm;

--
-- TOC entry 3653 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE funkcjonariusze; Type: COMMENT; Schema: prewencja; Owner: osm
--

COMMENT ON TABLE funkcjonariusze IS 'Tabela funkcjonariuszy PSP kontrolujących';


--
-- TOC entry 203 (class 1259 OID 87749)
-- Name: funkcjonariusze_user_id_seq; Type: SEQUENCE; Schema: prewencja; Owner: osm
--

CREATE SEQUENCE funkcjonariusze_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE funkcjonariusze_user_id_seq OWNER TO osm;

--
-- TOC entry 3654 (class 0 OID 0)
-- Dependencies: 203
-- Name: funkcjonariusze_user_id_seq; Type: SEQUENCE OWNED BY; Schema: prewencja; Owner: osm
--

ALTER SEQUENCE funkcjonariusze_user_id_seq OWNED BY funkcjonariusze.user_id;


--
-- TOC entry 3519 (class 2604 OID 87754)
-- Name: funkcjonariusze user_id; Type: DEFAULT; Schema: prewencja; Owner: osm
--

ALTER TABLE ONLY funkcjonariusze ALTER COLUMN user_id SET DEFAULT nextval('funkcjonariusze_user_id_seq'::regclass);


--
-- TOC entry 3647 (class 0 OID 87751)
-- Dependencies: 204
-- Data for Name: funkcjonariusze; Type: TABLE DATA; Schema: prewencja; Owner: osm
--



--
-- TOC entry 3655 (class 0 OID 0)
-- Dependencies: 203
-- Name: funkcjonariusze_user_id_seq; Type: SEQUENCE SET; Schema: prewencja; Owner: osm
--

SELECT pg_catalog.setval('funkcjonariusze_user_id_seq', 1, false);


--
-- TOC entry 3521 (class 2606 OID 87879)
-- Name: funkcjonariusze funkcjonariusze_pkey; Type: CONSTRAINT; Schema: prewencja; Owner: osm
--

ALTER TABLE ONLY funkcjonariusze
    ADD CONSTRAINT funkcjonariusze_pkey PRIMARY KEY (user_id);


-- Completed on 2017-11-30 10:44:17 CET

--
-- PostgreSQL database dump complete
--

