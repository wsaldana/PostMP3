--
-- PostgreSQL database dump
--

-- Dumped from database version 10.15
-- Dumped by pg_dump version 13.1

-- Started on 2021-03-21 16:01:22

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

--
-- TOC entry 200 (class 1259 OID 17005)
-- Name: album; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.album (
    id_album integer NOT NULL,
    album_name character varying(30),
    date_pub date,
    id_artist integer
);


ALTER TABLE public.album OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16985)
-- Name: artist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artist (
    id_artist integer NOT NULL,
    art_name character varying(25),
    date_sub date,
    id_user integer,
    id_manager integer
);


ALTER TABLE public.artist OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16990)
-- Name: manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.manager (
    id_manager integer NOT NULL,
    date_sub date,
    id_user integer NOT NULL
);


ALTER TABLE public.manager OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 17010)
-- Name: playlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlist (
    id_playlist integer NOT NULL,
    paylist_name character varying(25),
    id_user integer
);


ALTER TABLE public.playlist OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 17023)
-- Name: playlist_song; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlist_song (
    id_playlist integer NOT NULL,
    id_song integer NOT NULL
);


ALTER TABLE public.playlist_song OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 17015)
-- Name: request; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.request (
    id_request integer NOT NULL,
    date_sub date,
    id_song integer
);


ALTER TABLE public.request OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16995)
-- Name: song; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.song (
    id_song integer NOT NULL,
    song_name character varying(35),
    genre character varying(30),
    url character varying(200),
    enabled boolean NOT NULL,
    id_artist integer,
    id_album integer
);


ALTER TABLE public.song OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 17020)
-- Name: user_request; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_request (
    id_user integer NOT NULL,
    id_request integer NOT NULL
);


ALTER TABLE public.user_request OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16980)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id_user integer NOT NULL,
    username character varying(25) NOT NULL,
    "contraseña" character varying(25) NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 2839 (class 0 OID 17005)
-- Dependencies: 200
-- Data for Name: album; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.album (id_album, album_name, date_pub, id_artist) FROM stdin;
1	YHLQMDLG	2020-06-25	1
2	X 100PRE	2018-07-25	1
3	After Hours	2020-07-20	2
4	Starboy	2016-05-26	2
5	Future Nostalgia	2020-08-28	3
6	Colores	2020-08-25	4
7	Circo Soledad	2017-04-20	5
8	Me deje llevar	2020-09-26	6
9	Bohemian Rhapsody	1986-11-28	7
10	Chinese Democracy	2008-07-25	8
\.


--
-- TOC entry 2836 (class 0 OID 16985)
-- Dependencies: 197
-- Data for Name: artist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artist (id_artist, art_name, date_sub, id_user, id_manager) FROM stdin;
1	Bad Bunny	2016-11-28	1	1
2	The Weeknd	2017-07-25	2	1
3	Dua Lipa	2016-04-20	3	1
4	J Balvin	2014-01-01	4	2
5	Ricardo Arjona	2010-06-18	5	2
6	Christian Nodal	2015-09-25	6	3
7	Queen	1980-04-20	7	4
8	Guns and Roses	2000-05-10	8	5
\.


--
-- TOC entry 2837 (class 0 OID 16990)
-- Dependencies: 198
-- Data for Name: manager; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.manager (id_manager, date_sub, id_user) FROM stdin;
1	2015-11-28	9
2	2010-05-25	10
3	2015-04-20	11
4	1980-03-26	12
5	2000-01-28	13
\.


--
-- TOC entry 2840 (class 0 OID 17010)
-- Dependencies: 201
-- Data for Name: playlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playlist (id_playlist, paylist_name, id_user) FROM stdin;
1	RegionalMex	14
2	Rock	15
3	Español	15
4	BadBunnyMix	1
5	ArjonaMix	16
6	JBalvinMix	2
7	TheWeekndmix	13
\.


--
-- TOC entry 2843 (class 0 OID 17023)
-- Dependencies: 204
-- Data for Name: playlist_song; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playlist_song (id_playlist, id_song) FROM stdin;
1	19
1	20
1	21
2	22
2	23
2	24
2	25
3	1
3	2
3	3
3	4
3	5
3	14
3	15
3	16
3	17
3	18
3	19
3	20
3	21
4	1
4	2
4	3
4	4
4	5
5	16
5	17
5	18
6	14
6	15
7	6
7	7
7	8
7	9
\.


--
-- TOC entry 2841 (class 0 OID 17015)
-- Dependencies: 202
-- Data for Name: request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.request (id_request, date_sub, id_song) FROM stdin;
1	2020-01-28	1
2	2020-03-25	5
3	2020-05-20	1
4	2021-09-26	15
5	2020-02-28	20
6	2021-07-25	4
7	2020-04-20	1
8	2021-09-26	21
9	2020-04-28	6
10	2019-07-25	16
11	2020-03-25	4
12	2019-04-20	16
13	2020-04-26	21
\.


--
-- TOC entry 2838 (class 0 OID 16995)
-- Dependencies: 199
-- Data for Name: song; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.song (id_song, song_name, genre, url, enabled, id_artist, id_album) FROM stdin;
1	safaera	reggaeton	URL	t	1	1
2	la santa	reggaeton	URL	t	1	1
3	ignorantes	reggaeton	URL	f	1	1
4	como antes	reggaeton	URL	t	1	2
5	otra noche en miami	reggaeton	URL	t	1	2
6	save your tears	r&b/soul	URL	t	2	3
7	in your eyes	r&b/soul	URL	t	2	3
8	starboy	r&b/soul	URL	t	2	4
9	secrets	r&b/soul	URL	f	2	4
10	love again	pop	URL	t	3	5
11	break my heart	pop	URL	t	3	5
12	cool	pop	URL	t	3	5
13	physical	pop	URL	t	3	5
14	rojo	reggaeton	URL	t	4	6
15	blanco	reggaeton	URL	f	4	6
16	ella	latin pop	URL	t	5	7
17	vivir	latin pop	URL	f	5	7
18	dime tu	latin pop	URL	t	5	7
19	adios amor	banda	URL	t	6	8
20	me deje llevar	banda	URL	t	6	8
21	probablemente	banda	URL	t	6	8
22	i want to break free	classic rock	URLURL	f	7	9
23	under pressure	classic rock	URL	t	7	9
24	better	rock	URL	t	8	10
25	this is love	rock	URL	t	8	10
\.


--
-- TOC entry 2842 (class 0 OID 17020)
-- Dependencies: 203
-- Data for Name: user_request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_request (id_user, id_request) FROM stdin;
14	1
14	2
14	3
14	4
15	5
15	6
15	7
16	8
16	9
16	10
1	11
2	12
3	13
9	14
13	15
\.


--
-- TOC entry 2835 (class 0 OID 16980)
-- Dependencies: 196
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id_user, username, "contraseña") FROM stdin;
1	user1	123456
2	user2	jamonconqueso
3	user3	jaela123
4	user4	requezon21
5	user5	latracalosa66
6	user6	agentecul
7	user7	pinocho23
8	user8	riquelme
9	user9	donramon64
10	user10	pepeypique
11	user11	mcabstract
12	user12	bocariver
13	user13	drewmac65
14	user14	burgerking90
15	user15	rockets4
16	user16	huevosyfrijoles
\.


--
-- TOC entry 2709 (class 2606 OID 17009)
-- Name: album album_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_pkey PRIMARY KEY (id_album);


--
-- TOC entry 2703 (class 2606 OID 16989)
-- Name: artist artist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_pkey PRIMARY KEY (id_artist);


--
-- TOC entry 2705 (class 2606 OID 16994)
-- Name: manager manager_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manager
    ADD CONSTRAINT manager_pkey PRIMARY KEY (id_manager);


--
-- TOC entry 2711 (class 2606 OID 17014)
-- Name: playlist playlist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist
    ADD CONSTRAINT playlist_pkey PRIMARY KEY (id_playlist);


--
-- TOC entry 2713 (class 2606 OID 17019)
-- Name: request request_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_pkey PRIMARY KEY (id_request);


--
-- TOC entry 2707 (class 2606 OID 16999)
-- Name: song song_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.song
    ADD CONSTRAINT song_pkey PRIMARY KEY (id_song);


--
-- TOC entry 2701 (class 2606 OID 16984)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_user);


-- Completed on 2021-03-21 16:01:22

--
-- PostgreSQL database dump complete
--

