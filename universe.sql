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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(50) NOT NULL,
    mass numeric(10,4) NOT NULL,
    is_in_asteroid_belt boolean NOT NULL,
    velocity integer NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    has_smbh boolean NOT NULL,
    light_years_away numeric(10,2),
    description text NOT NULL,
    number_of_stars bigint NOT NULL
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
    planet_id integer NOT NULL,
    is_habitable boolean,
    radius integer NOT NULL
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
    star_id integer NOT NULL,
    has_life boolean,
    diameter integer NOT NULL,
    distance_from_star numeric(10,2) NOT NULL
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    is_binary boolean NOT NULL,
    mass numeric(8,3) NOT NULL,
    temperature integer NOT NULL
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 9.3835, true, 17);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 2.5908, true, 20);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 2.0400, true, 19);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 8.6700, true, 16);
INSERT INTO public.asteroid VALUES (5, 'Eros', 0.0110, false, 22);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, 0.00, 'Our home galaxy', 250000000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', true, 2.50, 'Closest large galaxy to Milky Way', 1000000000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', false, 3.00, 'Small spiral galaxy', 40000000000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', true, 31.00, 'Grand-design spiral galaxy', 100000000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', true, 29.00, 'Galaxy with bright nucleus', 80000000000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', true, 21.00, 'Face-on spiral galaxy', 100000000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, false, 1737);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, false, 11);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, false, 6);
INSERT INTO public.moon VALUES (4, 'Europa', 5, false, 1560);
INSERT INTO public.moon VALUES (5, 'Ganymede', 5, false, 2634);
INSERT INTO public.moon VALUES (6, 'Callisto', 5, false, 2410);
INSERT INTO public.moon VALUES (7, 'Titan', 6, false, 2575);
INSERT INTO public.moon VALUES (8, 'Enceladus', 6, false, 252);
INSERT INTO public.moon VALUES (9, 'Charon', 7, false, 606);
INSERT INTO public.moon VALUES (10, 'Io', 5, false, 1821);
INSERT INTO public.moon VALUES (11, 'Oberon', 6, false, 761);
INSERT INTO public.moon VALUES (12, 'Triton', 6, false, 1353);
INSERT INTO public.moon VALUES (13, 'Miranda', 4, false, 235);
INSERT INTO public.moon VALUES (14, 'Rhea', 7, false, 764);
INSERT INTO public.moon VALUES (15, 'Mimas', 8, false, 198);
INSERT INTO public.moon VALUES (16, 'Titania', 7, false, 788);
INSERT INTO public.moon VALUES (17, 'Iapetus', 8, false, 734);
INSERT INTO public.moon VALUES (18, 'Hyperion', 8, false, 135);
INSERT INTO public.moon VALUES (19, 'Dysnomia', 3, false, 700);
INSERT INTO public.moon VALUES (20, 'Nix', 4, false, 600);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 12742, 1.00);
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, 6779, 1.52);
INSERT INTO public.planet VALUES (3, 'Proxima b', 3, true, 7150, 0.05);
INSERT INTO public.planet VALUES (4, 'Kepler-22b', 5, false, 24300, 620.00);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, false, 139820, 5.20);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, false, 49244, 30.10);
INSERT INTO public.planet VALUES (7, 'Alpha Centauri Bb', 3, false, 9600, 0.04);
INSERT INTO public.planet VALUES (8, 'Vulcan', 5, false, 6500, 0.67);
INSERT INTO public.planet VALUES (9, 'TRAPPIST-1e', 4, true, 11600, 0.03);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 6, true, 24000, 0.15);
INSERT INTO public.planet VALUES (11, 'HD 209458b', 2, false, 142984, 0.05);
INSERT INTO public.planet VALUES (12, '55 Cancri e', 6, false, 21500, 0.02);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, false, 1.989, 5778);
INSERT INTO public.star VALUES (2, 'Sirius', 1, true, 2.020, 9940);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1, true, 1.100, 5790);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 2, false, 20.000, 3500);
INSERT INTO public.star VALUES (5, 'Vega', 3, false, 2.100, 9602);
INSERT INTO public.star VALUES (6, 'Antares', 4, false, 12.400, 3200);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


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
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- PostgreSQL database dump complete
--

