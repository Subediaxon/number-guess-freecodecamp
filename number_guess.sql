--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    username character varying(22) NOT NULL,
    score integer DEFAULT 0,
    game_id integer NOT NULL
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
-- Name: scores; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.scores (
    username character varying(22) NOT NULL,
    best_game integer DEFAULT 0,
    games_played integer DEFAULT 0
);


ALTER TABLE public.scores OWNER TO freecodecamp;

--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES ('axon', 6, 15);
INSERT INTO public.games VALUES ('axon', 6, 16);
INSERT INTO public.games VALUES ('axon', 13, 17);
INSERT INTO public.games VALUES ('noxa', 13, 18);
INSERT INTO public.games VALUES ('noxa', 10, 19);
INSERT INTO public.games VALUES ('user_1676386005621', 664, 20);
INSERT INTO public.games VALUES ('user_1676386005621', 829, 21);
INSERT INTO public.games VALUES ('user_1676386005620', 516, 22);
INSERT INTO public.games VALUES ('user_1676386005620', 488, 23);
INSERT INTO public.games VALUES ('user_1676386005621', 557, 24);
INSERT INTO public.games VALUES ('user_1676386005621', 578, 25);
INSERT INTO public.games VALUES ('user_1676386070366', 180, 26);
INSERT INTO public.games VALUES ('user_1676386070366', 193, 27);
INSERT INTO public.games VALUES ('user_1676386070365', 956, 28);
INSERT INTO public.games VALUES ('user_1676386070365', 394, 29);
INSERT INTO public.games VALUES ('user_1676386070366', 689, 30);
INSERT INTO public.games VALUES ('user_1676386070366', 664, 31);


--
-- Data for Name: scores; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.scores VALUES ('axon', 6, 1);
INSERT INTO public.scores VALUES ('noxa', 10, 2);
INSERT INTO public.scores VALUES ('user_1676386005620', 488, 2);
INSERT INTO public.scores VALUES ('user_1676386005621', 557, 4);
INSERT INTO public.scores VALUES ('user_1676386070365', 394, 2);
INSERT INTO public.scores VALUES ('user_1676386070366', 180, 4);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 31, true);


--
-- Name: scores scores_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_pkey PRIMARY KEY (username);


--
-- Name: games username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT username_fkey FOREIGN KEY (username) REFERENCES public.scores(username);


--
-- PostgreSQL database dump complete
--

