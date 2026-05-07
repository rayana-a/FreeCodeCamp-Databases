--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    speed_kmh integer NOT NULL,
    tail_length_km integer,
    is_periodic boolean NOT NULL,
    composition text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    age_million_years integer NOT NULL,
    distance_from_earth integer,
    has_life boolean NOT NULL,
    description text,
    mass numeric(15,2)
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer NOT NULL,
    orbit_days integer,
    is_habitable boolean NOT NULL,
    surface_type character varying(50),
    composition text
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    population integer,
    diameter_km integer NOT NULL,
    has_water boolean NOT NULL,
    planet_type character varying(50),
    gravity numeric(5,2),
    description text
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
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    temperature integer NOT NULL,
    size_km integer,
    is_spherical boolean NOT NULL,
    star_type character varying(50),
    brightness numeric(10,2)
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 252000, 24000000, true, 'Ice and dust');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 160000, 30000000, false, 'Frozen gases');
INSERT INTO public.comet VALUES (3, 'Encke', 250000, 10000000, true, 'Rock and ice');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, 0, true, 'Home galaxy of Earth', 1500000.50);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 2537000, false, 'Nearest major galaxy', 2000000.75);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12000, 3000000, false, 'Small spiral galaxy', 500000.25);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 400, 23000000, false, 'Interacting galaxy', 800000.00);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 9000, 29000000, false, 'Bright nucleus galaxy', 900000.99);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 13000, 53000000, false, 'Contains massive black hole', 2500000.80);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, 27, false, 'Rocky', 'Silicate rock');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, 1, false, 'Rocky', 'Carbonaceous rock');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, 1, false, 'Rocky', 'Carbon-rich material');
INSERT INTO public.moon VALUES (4, 'Europa', 3, 3121, 4, false, 'Icy', 'Ice and rock');
INSERT INTO public.moon VALUES (5, 'Io', 3, 3643, 2, false, 'Volcanic', 'Sulfur and rock');
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 5268, 7, false, 'Icy', 'Water ice');
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 4820, 17, false, 'Cratered', 'Rock and ice');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5150, 16, false, 'Icy', 'Nitrogen atmosphere');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 504, 1, false, 'Icy', 'Water ice');
INSERT INTO public.moon VALUES (10, 'Triton', 7, 2706, 6, false, 'Frozen', 'Nitrogen ice');
INSERT INTO public.moon VALUES (11, 'Oberon', 8, 1523, 13, false, 'Rocky', 'Ice and rock');
INSERT INTO public.moon VALUES (12, 'Titania', 8, 1578, 9, false, 'Rocky', 'Water ice');
INSERT INTO public.moon VALUES (13, 'Miranda', 8, 472, 1, false, 'Rocky', 'Mixed ice');
INSERT INTO public.moon VALUES (14, 'Ariel', 8, 1158, 3, false, 'Icy', 'Water and ammonia');
INSERT INTO public.moon VALUES (15, 'Umbriel', 8, 1169, 4, false, 'Dark icy', 'Carbon deposits');
INSERT INTO public.moon VALUES (16, 'Charon', 10, 1212, 6, false, 'Frozen', 'Ice and rock');
INSERT INTO public.moon VALUES (17, 'Nix', 10, 49, 25, false, 'Rocky', 'Ice');
INSERT INTO public.moon VALUES (18, 'Hydra', 10, 61, 38, false, 'Rocky', 'Ice');
INSERT INTO public.moon VALUES (19, 'Kerberos', 10, 19, 32, false, 'Dark rocky', 'Carbon compounds');
INSERT INTO public.moon VALUES (20, 'Styx', 10, 16, 20, false, 'Rocky', 'Ice and dust');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 80000, 12742, true, 'Terrestrial', 9.81, 'Human homeworld');
INSERT INTO public.planet VALUES (2, 'Mars', 1, 0, 6779, false, 'Terrestrial', 3.71, 'Red planet');
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 0, 139820, false, 'Gas Giant', 24.79, 'Largest planet');
INSERT INTO public.planet VALUES (4, 'Venus', 1, 0, 12104, false, 'Terrestrial', 8.87, 'Hot atmosphere');
INSERT INTO public.planet VALUES (5, 'Mercury', 1, 0, 4879, false, 'Terrestrial', 3.70, 'Closest to Sun');
INSERT INTO public.planet VALUES (6, 'Saturn', 2, 0, 116460, false, 'Gas Giant', 10.44, 'Ringed planet');
INSERT INTO public.planet VALUES (7, 'Neptune', 2, 0, 49244, false, 'Ice Giant', 11.15, 'Strong winds');
INSERT INTO public.planet VALUES (8, 'Uranus', 3, 0, 50724, false, 'Ice Giant', 8.69, 'Tilted axis');
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 4, 0, 24000, true, 'Exoplanet', 15.20, 'Potentially habitable');
INSERT INTO public.planet VALUES (10, 'Proxima b', 5, 0, 11400, true, 'Exoplanet', 11.10, 'Closest exoplanet');
INSERT INTO public.planet VALUES (11, 'Gliese 581g', 6, 0, 15000, true, 'Super Earth', 12.50, 'Possible life');
INSERT INTO public.planet VALUES (12, 'Pandora', 4, 1000000, 15000, true, 'Fictional', 8.50, 'Moon-like planet');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5500, 1392000, true, 'G-Type', 1.00);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 9940, 2400000, true, 'A-Type', 25.40);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 3500, 887000000, true, 'Red Supergiant', 126000.00);
INSERT INTO public.star VALUES (4, 'Rigel', 2, 12100, 97000000, true, 'Blue Supergiant', 120000.50);
INSERT INTO public.star VALUES (5, 'Polaris', 3, 6015, 44000000, true, 'Yellow Supergiant', 2500.75);
INSERT INTO public.star VALUES (6, 'Vega', 4, 9602, 2030000, true, 'A-Type', 40.12);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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

