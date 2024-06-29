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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    guesses integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 10, 157);
INSERT INTO public.games VALUES (2, 10, 433);
INSERT INTO public.games VALUES (3, 11, 425);
INSERT INTO public.games VALUES (4, 11, 478);
INSERT INTO public.games VALUES (5, 10, 787);
INSERT INTO public.games VALUES (6, 10, 875);
INSERT INTO public.games VALUES (7, 10, 360);
INSERT INTO public.games VALUES (8, 1, 6);
INSERT INTO public.games VALUES (9, 12, 59);
INSERT INTO public.games VALUES (10, 12, 483);
INSERT INTO public.games VALUES (11, 13, 679);
INSERT INTO public.games VALUES (12, 13, 202);
INSERT INTO public.games VALUES (13, 12, 957);
INSERT INTO public.games VALUES (14, 12, 944);
INSERT INTO public.games VALUES (15, 12, 178);
INSERT INTO public.games VALUES (16, 14, 670);
INSERT INTO public.games VALUES (17, 14, 283);
INSERT INTO public.games VALUES (18, 15, 29);
INSERT INTO public.games VALUES (19, 15, 672);
INSERT INTO public.games VALUES (20, 14, 390);
INSERT INTO public.games VALUES (21, 14, 179);
INSERT INTO public.games VALUES (22, 14, 200);
INSERT INTO public.games VALUES (23, 16, 270);
INSERT INTO public.games VALUES (24, 16, 694);
INSERT INTO public.games VALUES (25, 17, 859);
INSERT INTO public.games VALUES (26, 17, 3);
INSERT INTO public.games VALUES (27, 16, 860);
INSERT INTO public.games VALUES (28, 16, 820);
INSERT INTO public.games VALUES (29, 16, 177);
INSERT INTO public.games VALUES (30, 18, 915);
INSERT INTO public.games VALUES (31, 18, 38);
INSERT INTO public.games VALUES (32, 19, 510);
INSERT INTO public.games VALUES (33, 19, 792);
INSERT INTO public.games VALUES (34, 18, 502);
INSERT INTO public.games VALUES (35, 18, 913);
INSERT INTO public.games VALUES (36, 18, 849);
INSERT INTO public.games VALUES (37, 20, 840);
INSERT INTO public.games VALUES (38, 20, 887);
INSERT INTO public.games VALUES (39, 21, 862);
INSERT INTO public.games VALUES (40, 21, 168);
INSERT INTO public.games VALUES (41, 20, 417);
INSERT INTO public.games VALUES (42, 20, 789);
INSERT INTO public.games VALUES (43, 20, 891);
INSERT INTO public.games VALUES (44, 22, 122);
INSERT INTO public.games VALUES (45, 22, 202);
INSERT INTO public.games VALUES (46, 23, 273);
INSERT INTO public.games VALUES (47, 23, 703);
INSERT INTO public.games VALUES (48, 22, 205);
INSERT INTO public.games VALUES (49, 22, 732);
INSERT INTO public.games VALUES (50, 22, 518);
INSERT INTO public.games VALUES (51, 24, 233);
INSERT INTO public.games VALUES (52, 24, 655);
INSERT INTO public.games VALUES (53, 25, 171);
INSERT INTO public.games VALUES (54, 25, 416);
INSERT INTO public.games VALUES (55, 24, 129);
INSERT INTO public.games VALUES (56, 24, 380);
INSERT INTO public.games VALUES (57, 24, 794);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Jacob');
INSERT INTO public.users VALUES (2, 'John');
INSERT INTO public.users VALUES (3, 'user_1719623706162');
INSERT INTO public.users VALUES (4, 'user_1719623706161');
INSERT INTO public.users VALUES (5, 'T');
INSERT INTO public.users VALUES (6, 'user_1719624345315');
INSERT INTO public.users VALUES (7, 'user_1719624345314');
INSERT INTO public.users VALUES (8, 'user_1719624373950');
INSERT INTO public.users VALUES (9, 'user_1719624373949');
INSERT INTO public.users VALUES (10, 'user_1719624612080');
INSERT INTO public.users VALUES (11, 'user_1719624612079');
INSERT INTO public.users VALUES (12, 'user_1719624708862');
INSERT INTO public.users VALUES (13, 'user_1719624708861');
INSERT INTO public.users VALUES (14, 'user_1719624770221');
INSERT INTO public.users VALUES (15, 'user_1719624770220');
INSERT INTO public.users VALUES (16, 'user_1719624774252');
INSERT INTO public.users VALUES (17, 'user_1719624774251');
INSERT INTO public.users VALUES (18, 'user_1719624789418');
INSERT INTO public.users VALUES (19, 'user_1719624789417');
INSERT INTO public.users VALUES (20, 'user_1719624794306');
INSERT INTO public.users VALUES (21, 'user_1719624794305');
INSERT INTO public.users VALUES (22, 'user_1719624809480');
INSERT INTO public.users VALUES (23, 'user_1719624809479');
INSERT INTO public.users VALUES (24, 'user_1719624812844');
INSERT INTO public.users VALUES (25, 'user_1719624812843');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 57, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 25, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

