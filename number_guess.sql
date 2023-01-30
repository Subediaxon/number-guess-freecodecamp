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
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 0,
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
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

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.user_id;


--
-- Name: scores; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.scores (
    score_id integer NOT NULL,
    user_id integer,
    score integer NOT NULL
);


ALTER TABLE public.scores OWNER TO freecodecamp;

--
-- Name: scores_score_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.scores_score_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scores_score_id_seq OWNER TO freecodecamp;

--
-- Name: scores_score_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.scores_score_id_seq OWNED BY public.scores.score_id;


--
-- Name: games user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN user_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: scores score_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scores ALTER COLUMN score_id SET DEFAULT nextval('public.scores_score_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 5, 7, 'bigyan');
INSERT INTO public.games VALUES (2, 2, 2, 'axon');
INSERT INTO public.games VALUES (7, 161, 5, '1');
INSERT INTO public.games VALUES (2, 8, 3, 'asdf');
INSERT INTO public.games VALUES (7, 864, 6, 'a');
INSERT INTO public.games VALUES (35, 90, 4, '0');
INSERT INTO public.games VALUES (3, 5, 1, 'TEST');


--
-- Data for Name: scores; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.scores VALUES (24, 1, 5);
INSERT INTO public.scores VALUES (25, 2, 2);
INSERT INTO public.scores VALUES (26, 2, 4);
INSERT INTO public.scores VALUES (27, 2, 4);
INSERT INTO public.scores VALUES (28, 3, 8);
INSERT INTO public.scores VALUES (29, 4, 90);
INSERT INTO public.scores VALUES (30, 4, 810);
INSERT INTO public.scores VALUES (31, 4, 907);
INSERT INTO public.scores VALUES (32, 4, 239);
INSERT INTO public.scores VALUES (33, 5, 161);
INSERT INTO public.scores VALUES (34, 6, 864);
INSERT INTO public.scores VALUES (35, 4, 911);
INSERT INTO public.scores VALUES (36, 4, 502);
INSERT INTO public.scores VALUES (37, 4, 635);
INSERT INTO public.scores VALUES (38, 4, 982);
INSERT INTO public.scores VALUES (39, 4, 743);
INSERT INTO public.scores VALUES (40, 5, 886);
INSERT INTO public.scores VALUES (41, 6, 536);
INSERT INTO public.scores VALUES (42, 4, 168);
INSERT INTO public.scores VALUES (43, 1, 9);
INSERT INTO public.scores VALUES (44, 4, 885);
INSERT INTO public.scores VALUES (45, 4, 657);
INSERT INTO public.scores VALUES (46, 4, 812);
INSERT INTO public.scores VALUES (47, 4, 322);
INSERT INTO public.scores VALUES (48, 5, 290);
INSERT INTO public.scores VALUES (49, 6, 661);
INSERT INTO public.scores VALUES (50, 4, 70);
INSERT INTO public.scores VALUES (51, 4, 230);
INSERT INTO public.scores VALUES (52, 4, 623);
INSERT INTO public.scores VALUES (53, 4, 982);
INSERT INTO public.scores VALUES (54, 4, 619);
INSERT INTO public.scores VALUES (55, 5, 251);
INSERT INTO public.scores VALUES (56, 6, 345);
INSERT INTO public.scores VALUES (57, 4, 931);
INSERT INTO public.scores VALUES (58, 4, 516);
INSERT INTO public.scores VALUES (59, 4, 789);
INSERT INTO public.scores VALUES (60, 4, 243);
INSERT INTO public.scores VALUES (61, 4, 261);
INSERT INTO public.scores VALUES (62, 5, 346);
INSERT INTO public.scores VALUES (63, 6, 520);
INSERT INTO public.scores VALUES (64, 4, 719);
INSERT INTO public.scores VALUES (65, 4, 395);
INSERT INTO public.scores VALUES (66, 4, 249);
INSERT INTO public.scores VALUES (67, 4, 927);
INSERT INTO public.scores VALUES (68, 4, 17);
INSERT INTO public.scores VALUES (69, 5, 841);
INSERT INTO public.scores VALUES (70, 6, 222);
INSERT INTO public.scores VALUES (71, 4, 290);
INSERT INTO public.scores VALUES (72, 7, 5);
INSERT INTO public.scores VALUES (73, 4, 694);
INSERT INTO public.scores VALUES (74, 4, 816);
INSERT INTO public.scores VALUES (75, 4, 31);
INSERT INTO public.scores VALUES (76, 4, 462);
INSERT INTO public.scores VALUES (77, 5, 188);
INSERT INTO public.scores VALUES (78, 6, 141);
INSERT INTO public.scores VALUES (79, 4, 972);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 7, true);


--
-- Name: scores_score_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.scores_score_id_seq', 79, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (user_id);


--
-- Name: games games_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_username_key UNIQUE (username);


--
-- Name: scores scores_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_pkey PRIMARY KEY (score_id);


--
-- Name: scores fkey_user_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT fkey_user_id FOREIGN KEY (user_id) REFERENCES public.games(user_id);


--
-- PostgreSQL database dump complete
--

