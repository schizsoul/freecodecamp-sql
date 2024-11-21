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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    age_million_years numeric NOT NULL,
    spiral_structure boolean NOT NULL,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    planet_id integer,
    diameter_km integer NOT NULL,
    tidally_locked boolean NOT NULL,
    orbital_period_days numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    star_id integer,
    diameter_km integer NOT NULL,
    has_life boolean NOT NULL,
    orbital_period_days numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: relationship; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.relationship (
    relationship_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.relationship OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying,
    galaxy_id integer,
    luminosity numeric NOT NULL,
    visible boolean NOT NULL,
    spectral_type text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_planet_relationship_relationship_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_planet_relationship_relationship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_planet_relationship_relationship_id_seq OWNER TO freecodecamp;

--
-- Name: star_planet_relationship_relationship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_planet_relationship_relationship_id_seq OWNED BY public.relationship.relationship_id;


--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: relationship relationship_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relationship ALTER COLUMN relationship_id SET DEFAULT nextval('public.star_planet_relationship_relationship_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, true, 'Large barred spiral galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10200, true, 'Neighbor to the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 11000, true, 'Third largest galaxy in the local group');
INSERT INTO public.galaxy VALUES (4, 'Whirpool', 500, true, 'Distinct spiral arm');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 9800, false, 'Galaxy with a prominent bulge');
INSERT INTO public.galaxy VALUES (6, 'Large Magellic Cloud', 13000, false, 'Dwark irregular galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, true, 27.32);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, true, 0.319);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, true, 1.263);
INSERT INTO public.moon VALUES (4, 'Europa', 7, 3121, true, 3.551);
INSERT INTO public.moon VALUES (5, 'Ganymede', 7, 5268, true, 7.155);
INSERT INTO public.moon VALUES (6, 'Io', 7, 3643, true, 1.769);
INSERT INTO public.moon VALUES (7, 'Callisto', 7, 4820, true, 16.689);
INSERT INTO public.moon VALUES (8, 'Titan', 8, 5150, true, 15.945);
INSERT INTO public.moon VALUES (9, 'Rhea', 8, 1528, true, 4.518);
INSERT INTO public.moon VALUES (10, 'Tethys', 8, 1062, true, 1.888);
INSERT INTO public.moon VALUES (11, 'Dione', 8, 1123, true, 2.737);
INSERT INTO public.moon VALUES (12, 'Mimas', 8, 396, true, 0.942);
INSERT INTO public.moon VALUES (13, 'Enceladus', 8, 504, true, 1.370);
INSERT INTO public.moon VALUES (14, 'Oberon', 10, 1523, true, 13.46);
INSERT INTO public.moon VALUES (15, 'Titania', 10, 1578, true, 8.706);
INSERT INTO public.moon VALUES (16, 'Miranda', 10, 471, true, 1.413);
INSERT INTO public.moon VALUES (17, 'Triton', 9, 2706, true, 5.877);
INSERT INTO public.moon VALUES (18, 'Nereid', 9, 340, false, 360.136);
INSERT INTO public.moon VALUES (19, 'Proteus', 9, 420, true, 1.122);
INSERT INTO public.moon VALUES (20, 'Galatea', 9, 158, true, 0.429);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4, 12742, true, 365.25);
INSERT INTO public.planet VALUES (2, 'Mars', 4, 6779, false, 687);
INSERT INTO public.planet VALUES (3, 'Venus', 4, 12104, false, 224.7);
INSERT INTO public.planet VALUES (4, 'Kepler-22b', 5, 23420, false, 289.9);
INSERT INTO public.planet VALUES (5, 'HD 209458 b', 3, 143000, false, 3.5);
INSERT INTO public.planet VALUES (6, 'TRAPPIST-1d', 6, 5798, false, 6.1);
INSERT INTO public.planet VALUES (7, 'Jupiter', 4, 139820, false, 4332.59);
INSERT INTO public.planet VALUES (8, 'Saturn', 4, 116460, false, 10759.22);
INSERT INTO public.planet VALUES (9, 'Neptune', 4, 49244, false, 60190);
INSERT INTO public.planet VALUES (10, 'Uranus', 4, 50724, false, 30688);
INSERT INTO public.planet VALUES (11, 'Gliese 581g', 5, 22700, false, 37);
INSERT INTO public.planet VALUES (12, '51 Pegasi b', 3, 200000, false, 4.23);


--
-- Data for Name: relationship; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.relationship VALUES (1, 4, 1, NULL);
INSERT INTO public.relationship VALUES (2, 4, 2, NULL);
INSERT INTO public.relationship VALUES (3, 4, 3, NULL);
INSERT INTO public.relationship VALUES (4, 5, 4, NULL);
INSERT INTO public.relationship VALUES (5, 3, 5, NULL);
INSERT INTO public.relationship VALUES (6, 6, 6, NULL);
INSERT INTO public.relationship VALUES (7, 4, 7, NULL);
INSERT INTO public.relationship VALUES (8, 4, 8, NULL);
INSERT INTO public.relationship VALUES (9, 4, 9, NULL);
INSERT INTO public.relationship VALUES (10, 4, 10, NULL);
INSERT INTO public.relationship VALUES (11, 5, 11, NULL);
INSERT INTO public.relationship VALUES (12, 3, 12, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 1, 25.4, true, 'A1V');
INSERT INTO public.star VALUES (2, 'Betelgeuse', 1, 126000, true, 'M1-2Ia');
INSERT INTO public.star VALUES (3, 'Vega', 2, 40, true, 'A0V');
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 0.0017, true, 'M5.5Ve');
INSERT INTO public.star VALUES (5, 'Rigel', 2, 120000, true, 'B8Ia');
INSERT INTO public.star VALUES (6, 'Arcturus', 3, 170, true, 'K1.5III');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_planet_relationship_relationship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_planet_relationship_relationship_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: relationship star_planet_relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relationship
    ADD CONSTRAINT star_planet_relationship_pkey PRIMARY KEY (relationship_id);


--
-- Name: relationship star_planet_relationship_star_id_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relationship
    ADD CONSTRAINT star_planet_relationship_star_id_planet_id_key UNIQUE (star_id, planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: relationship star_planet_relationship_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relationship
    ADD CONSTRAINT star_planet_relationship_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: relationship star_planet_relationship_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relationship
    ADD CONSTRAINT star_planet_relationship_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star star_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

