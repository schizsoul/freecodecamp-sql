--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: records; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.records (
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.records OWNER TO freecodecamp;

--
-- Data for Name: records; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.records VALUES ('Anon1', 1, 8);
INSERT INTO public.records VALUES ('dfd', NULL, NULL);
INSERT INTO public.records VALUES ('dfkdkf', 0, NULL);
INSERT INTO public.records VALUES ('Anon', 2, 4);
INSERT INTO public.records VALUES ('user_1738747190292', 2, 765);
INSERT INTO public.records VALUES ('user_1738747190293', 5, 611);
INSERT INTO public.records VALUES ('user_1738748410337', 2, 492);
INSERT INTO public.records VALUES ('user_1738747242678', 2, 899);
INSERT INTO public.records VALUES ('user_1738747242679', 5, 922);
INSERT INTO public.records VALUES ('user_1738748410338', 5, 458);
INSERT INTO public.records VALUES ('user_1738747334214', 2, 750);
INSERT INTO public.records VALUES ('user_1738747334215', 5, 939);
INSERT INTO public.records VALUES ('user_1738748503087', 2, 475);
INSERT INTO public.records VALUES ('user_1738747347823', 2, 484);
INSERT INTO public.records VALUES ('user_1738748503088', 5, 77);
INSERT INTO public.records VALUES ('user_1738747347824', 5, 89);
INSERT INTO public.records VALUES ('dfkjfdk', 1, 8);
INSERT INTO public.records VALUES ('kdkd', NULL, NULL);
INSERT INTO public.records VALUES ('sdsd', 2, 4);
INSERT INTO public.records VALUES ('user_1738747387624', 2, 442);
INSERT INTO public.records VALUES ('user_1738747387625', 5, 868);
INSERT INTO public.records VALUES ('user_1738748602576', 2, 751);
INSERT INTO public.records VALUES ('user_1738747916387', 2, 900);
INSERT INTO public.records VALUES ('user_1738747916388', 5, 726);
INSERT INTO public.records VALUES ('user_1738748602577', 5, 948);
INSERT INTO public.records VALUES ('user_1738747927342', 2, 916);
INSERT INTO public.records VALUES ('user_1738747927343', 5, 98);
INSERT INTO public.records VALUES ('user_1738747928831', 2, 569);
INSERT INTO public.records VALUES ('user_1738747928832', 5, 967);


--
-- Name: records records_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.records
    ADD CONSTRAINT records_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

