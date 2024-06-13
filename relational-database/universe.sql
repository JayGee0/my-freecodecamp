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
    name character varying(50) NOT NULL,
    description text,
    galaxy_type text NOT NULL,
    age_in_millions_of_years integer NOT NULL
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
    name character varying(50) NOT NULL,
    planet_id integer,
    description text,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,3) NOT NULL,
    is_spherical boolean
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
    name character varying(50) NOT NULL,
    star_id integer,
    description text,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,3) NOT NULL,
    is_spherical boolean
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
-- Name: rover; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.rover (
    rover_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer,
    description text
);


ALTER TABLE public.rover OWNER TO freecodecamp;

--
-- Name: rover_rover_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.rover_rover_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rover_rover_id_seq OWNER TO freecodecamp;

--
-- Name: rover_rover_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.rover_rover_id_seq OWNED BY public.rover.rover_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer,
    description text,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,3) NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

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
-- Name: rover rover_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rover ALTER COLUMN rover_id SET DEFAULT nextval('public.rover_rover_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (7, 'Andromeda', NULL, 'spiral', 4500);
INSERT INTO public.galaxy VALUES (8, 'Antennae', NULL, 'irregular', 4500);
INSERT INTO public.galaxy VALUES (9, 'Backward', NULL, 'spiral', 4500);
INSERT INTO public.galaxy VALUES (10, 'Bear Paw', NULL, 'elliptical', 4500);
INSERT INTO public.galaxy VALUES (11, 'Black Eye', NULL, 'spiral', 4500);
INSERT INTO public.galaxy VALUES (12, 'Milky Way', NULL, 'spiral', 4500);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 15, NULL, 4500, 10.500, NULL);
INSERT INTO public.moon VALUES (2, 'Io', 17, NULL, 4500, 10.500, NULL);
INSERT INTO public.moon VALUES (3, 'Europa', 17, NULL, 4500, 10.500, NULL);
INSERT INTO public.moon VALUES (4, 'Ganymede', 17, NULL, 4500, 10.500, NULL);
INSERT INTO public.moon VALUES (5, 'Callisto', 17, NULL, 4500, 10.500, NULL);
INSERT INTO public.moon VALUES (6, 'Amalthea', 17, NULL, 4500, 10.500, NULL);
INSERT INTO public.moon VALUES (7, 'Himalia', 17, NULL, 4500, 10.500, NULL);
INSERT INTO public.moon VALUES (8, 'Pasiphae', 17, NULL, 4500, 10.500, NULL);
INSERT INTO public.moon VALUES (9, 'Sinope', 17, NULL, 4500, 10.500, NULL);
INSERT INTO public.moon VALUES (10, 'Kale', 17, NULL, 4500, 10.500, NULL);
INSERT INTO public.moon VALUES (11, 'Aoede', 17, NULL, 4500, 10.500, NULL);
INSERT INTO public.moon VALUES (12, 'Herse', 17, NULL, 4500, 10.500, NULL);
INSERT INTO public.moon VALUES (13, 'Phobos', 16, NULL, 4500, 10.500, NULL);
INSERT INTO public.moon VALUES (14, 'Deimos', 16, NULL, 4500, 10.500, NULL);
INSERT INTO public.moon VALUES (15, 'Triton', 17, NULL, 4500, 10.500, NULL);
INSERT INTO public.moon VALUES (16, 'Nereid', 17, NULL, 4500, 10.500, NULL);
INSERT INTO public.moon VALUES (17, 'Thalassa', 17, NULL, 4500, 10.500, NULL);
INSERT INTO public.moon VALUES (18, 'Charon', 24, NULL, 4500, 10.500, NULL);
INSERT INTO public.moon VALUES (19, 'Nix', 24, NULL, 4500, 10.500, NULL);
INSERT INTO public.moon VALUES (20, 'Styx', 24, NULL, 4500, 10.500, NULL);
INSERT INTO public.moon VALUES (21, 'Mimas', 18, NULL, 4500, 10.500, NULL);
INSERT INTO public.moon VALUES (22, 'Titan', 18, NULL, 4500, 10.500, NULL);
INSERT INTO public.moon VALUES (23, 'Dione', 18, NULL, 4500, 10.500, NULL);
INSERT INTO public.moon VALUES (24, 'Rhea', 18, NULL, 4500, 10.500, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Mercury', 7, NULL, 4500, 10.500, NULL);
INSERT INTO public.planet VALUES (14, 'Venus', 7, NULL, 4500, 10.500, NULL);
INSERT INTO public.planet VALUES (15, 'Earth', 7, NULL, 4500, 10.500, NULL);
INSERT INTO public.planet VALUES (16, 'Mars', 7, NULL, 4500, 10.500, NULL);
INSERT INTO public.planet VALUES (17, 'Jupiter', 7, NULL, 4500, 10.500, NULL);
INSERT INTO public.planet VALUES (18, 'Saturn', 7, NULL, 4500, 10.500, NULL);
INSERT INTO public.planet VALUES (19, 'Uranus', 7, NULL, 4500, 10.500, NULL);
INSERT INTO public.planet VALUES (20, 'Neptune', 7, NULL, 4500, 10.500, NULL);
INSERT INTO public.planet VALUES (21, 'Centauri', 7, NULL, 4500, 10.500, NULL);
INSERT INTO public.planet VALUES (22, 'Gilese', 7, NULL, 4500, 10.500, NULL);
INSERT INTO public.planet VALUES (23, 'Kepler', 7, NULL, 4500, 10.500, NULL);
INSERT INTO public.planet VALUES (24, 'Test', 7, NULL, 4500, 10.500, NULL);


--
-- Data for Name: rover; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.rover VALUES (1, 'Hello', NULL, NULL);
INSERT INTO public.rover VALUES (2, 'Test', NULL, NULL);
INSERT INTO public.rover VALUES (3, 'Jacob', NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Lynx', 12, NULL, 4500, 10.500);
INSERT INTO public.star VALUES (2, 'Erodanus', 12, NULL, 4500, 10.500);
INSERT INTO public.star VALUES (3, 'Cassiopeia', 12, NULL, 4500, 10.500);
INSERT INTO public.star VALUES (4, 'Crux', 12, NULL, 4500, 10.500);
INSERT INTO public.star VALUES (5, 'Cancer', 12, NULL, 4500, 10.500);
INSERT INTO public.star VALUES (6, 'Leo', 12, NULL, 4500, 10.500);
INSERT INTO public.star VALUES (7, 'Sun', 12, NULL, 4500, 10.500);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 12, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: rover_rover_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.rover_rover_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: rover rover_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rover
    ADD CONSTRAINT rover_name_key UNIQUE (name);


--
-- Name: rover rover_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rover
    ADD CONSTRAINT rover_pkey PRIMARY KEY (rover_id);


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
-- Name: rover rover_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rover
    ADD CONSTRAINT rover_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

