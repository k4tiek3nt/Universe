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
    name character varying(30),
    age_in_millions_of_years integer,
    size_in_miles integer,
    distance_from_earth_au numeric,
    description text NOT NULL,
    in_asteroid_belt boolean NOT NULL,
    need_telescope_to_see boolean NOT NULL,
    orbits_around character varying(10),
    star_id integer,
    galaxy_id integer,
    source_urls text
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
    name character varying(250),
    number_of_planets_x_mil integer,
    size_in_miles_x_mil integer,
    distance_from_earth_au numeric,
    description text NOT NULL,
    has_life boolean NOT NULL,
    is_dwarf boolean NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    source_urls text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    age_in_millions_of_years integer,
    size_in_miles integer,
    distance_from_earth_au numeric,    
    description text NOT NULL,
    is_spherical boolean NOT NULL,
    has_rings boolean NOT NULL,
    orbits_around character varying(30) NOT NULL,
    planet_id integer,
    star_id integer,
    galaxy_id integer,
    source_urls text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    number_of_moons integer,    
    size_in_miles integer,
    age_in_millions_of_years integer,
    distance_from_earth_au numeric,
    namesake text,
    description text,
    pop_culture text,
    potential_for_life text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    has_rings boolean NOT NULL,
    star_id integer,
    galaxy_id integer,  
    planet_type character varying(30),    
    orbits_around character varying(30),
    source_urls text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    size_in_tril_miles integer,
    solar_mass integer,
    distance_from_earth_au numeric,
    description text NOT NULL,
    dwarf_star boolean NOT NULL,
    need_telescope boolean NOT NULL,
    galaxy_id integer,
    star_type character varying(50),
    constellation character varying(30),
    source_urls text
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

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Vesta', 4500, 326, 1.362, 'Vesta is the brightest asteroid visible from Earth. It was discovered by the German astronomer Heinrich Wilhelm Matthias Olbers on 29 March 1807 and is named after Vesta, the virgin goddess of home and hearth from mythology.', true, false, 'the Sun', 1, 1, 'https://en.wikipedia.org/wiki/List_of_exceptional_asteroids#Largest_by_diameter https://en.wikipedia.org/wiki/4_Vesta');
INSERT INTO public.asteroid VALUES (2, 'Pallas', 4500, 319, 1.773, 'When Pallas was discovered by the German astronomer Heinrich Wilhelm Matthias Olbers on 28 March 1802, it was considered to be a planet, as were other asteroids in the early 19th century.', true, false, 'the Sun', 1, 1, 'https://en.wikipedia.org/wiki/List_of_exceptional_asteroids#Largest_by_diameter https://en.wikipedia.org/wiki/2_Pallas');
INSERT INTO public.asteroid VALUES (3, 'Interamnia', 4500, 205, 2.062, '704 Interamnia is a large F-type asteroid dicovered 2 October 1910 by Vincenzo Cerulli.It was named after the Latin name for Teramo, Italy, where Cerulli worked.', true, false, 'the Sun', 1, 1, 'https://en.wikipedia.org/wiki/List_of_exceptional_asteroids#Largest_by_diameter https://en.wikipedia.org/wiki/704_Interamnia');
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 4500, 270, 2.139, 'Hygiea is a major asteroid and possible dwarf planet located in the main asteroid belt. It is the largest of the dark C-type asteroids with a carbonaceous surface. Annibale de Gasparis discovered Hygiea on 12 April 1849.', true, false, 'the Sun', 1, 1, 'https://en.wikipedia.org/wiki/List_of_exceptional_asteroids#Largest_by_diameter https://en.wikipedia.org/wiki/10_Hygiea');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1000000, 5800, 0, 'Our own galaxy. It is said to look like a band of light.', true, false, 'Spiral', 'https://littleastronomy.com/galaxy-names/ https://nineplantes.org/questions/how-many-planets-are-in-the-milky-way/ https://exoplanets.nasa.gov/blog/1563/our-milky-way-galaxy-how-big-is-space/');
INSERT INTO public.galaxy VALUES (2, 'Sagittarius Dwarf Spheroidal', 0, 587862537, 512252724, 'The galaxy''s official discovery was made in 1994 by Gerry Gilmore and Mike Irwin, and it was described as the Milky Way''s nearest neighbor. The galaxy''s stars appear yellowish.', false, true, 'Dwarf Elliptical', 'https://www.worldatlas.com/article/galaxies-nearest-to-the-earth.html https://en.wikipedia.org/wiki/Sagittarius_Dwarf_Spheroidal_Galaxy');
INSERT INTO public.galaxy VALUES (3, 'Ursa Major II Dwarf', 0, 383286374, 69762556, 'The Ursa Major II Dwarf is a faint galaxy, and its luminosity is even lesser than that of some stars such as the Milky Way''s Canopus. These stars have been theorized to be some of the firt stars that formed the universe.', false, true, 'Dwarf Spheroidal', 'https://www.worldatlas.com/article/galaxies-nearest-to-the-earth.html https://beyond_the_edge.fandom.com/wiki/Ursa_Major_II_Dwarf');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 0, 189291737, 103082956, 'Although the galaxy had been observed by medieval astronomers, its discovery is credited to Ferdinand Magellan who first wrote about it in 1519. It is visible to the naked eye and is notable for its wealth in gas and dust which facilitate vigorous star formation.', false, true, 'Dwarf Irregular', 'https://www.worldatlas.com/article/galaxies-nearest-to-the-earth.html https://en.wikipedia.org/wiki/Large_Magellanic_Cloud');
INSERT INTO public.galaxy VALUES (5, 'Bootes Dwarf Galaxy (Bootes I)', 0, 907071895, 124584922, 'It is one of the least luminous galaxies ever discovered. In fact, when it was discovered in 2006, it was the single least luminous galaxy ever seen.', false, true, 'Dwarf Spheroidal', 'https://www.worldatlas.com/article/galaxies-nearest-to-the-earth.html https://www.contellation-guide.com/booes-dwarf-galaxy-bootes-i https://universeguide.com/galaxy/bootesdwarfgalaxy');
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 0, 111106020, 30276619, 'The galaxy is located across both the constellations of Tucana and part of Hydrus, appearing as a faint hazy patch resembling a detached piece of the Milky Way.', false, true, 'Dwarf Irregular', 'https://www.worldatlas.com/article/galaxies-nearest-to-the-earth.html https://en.wikipedia.org/wiki/Small_Magellanic_Cloud');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth''s Moon (the Moon)', 4500, 2159, 0.003, 'The brightest and largest object in our night sky, the Moon makes Earth a more livable planet by moderating our home planet''s wobble on its axis, leading to a relatively stable climate. It also causes tides, creating a rhythm that has guided humans for thousands of years.', true, false, 'Earth', 3, 1, 1, 'https://solarsystem.nasa.gov/moons/earths-moon/in-depth/');
INSERT INTO public.moon VALUES (2, 'Phobos', 4500, 2618, 0.5, 'Phobos is lumpy, heavily-cratered and covered in dust and loose rocks. Phobos means fear and was the mythological son of Ares.', false, false, 'Mars', 4, 1, 1, 'https://solarsystem.nasa.gov/moons/mars-moons/in-depth/');
INSERT INTO public.moon VALUES (3, 'Deimos', 4500, 1251, 0.5, 'Deimos is lumpy, heavily-cratered and covered in dust and loose rocks. Deimos means dread and was the mythological son of Ares.',  false, false, 'Mars', 4, 1, 1, 'https://solarsystem.nasa.gov/moons/mars-moons/in-depth/ https://en.wikipedia.org/wiki/Deimos_(moon)');
INSERT INTO public.moon VALUES (4, 'Io', 4500, 2264, 4.2, 'Jupiter''s moon Io is the most volcanically active world in the Solar System, with hundreds of volcanoes, some erupting lava fountains dozens of miles high.', false, false, 'Jupiter', 6, 1, 1, 'https://solarsystem.nasa.gov/moons/jupiter-moons/io/in-depth/ https://planetseducation.com/jupiter-moon-io');
INSERT INTO public.moon VALUES (5, 'Europa', 4500, 1940, 4.2, 'Scientists are almost certain that hidden beneath the icy surface of Europa is a salty-water ocean thought to contain twice as much as Earth''s oceans combined. And like Earth, Europa is thought to also contain a rocky mantle and iron core.', true, false, 'Jupiter', 6, 1, 1, 'https://solarsystem.nasa.gov/moons/jupiter-moons/europa/overview/');
INSERT INTO public.moon VALUES (6, 'Ganymede', 4500, 3270, 4.2, 'Jupiter''s icy moon Ganymede is the largest moon in our solar system, even bigger than the planet Mercury, and the dwarf planet Pluto.', true, false, 'Jupiter', 6, 1, 1, 'https://solarsystem.nasa.gov/moons/jupiter-moons/ganymede/overview/');
INSERT INTO public.moon VALUES (7, 'Callisto', 4500, 2995, 4.2, 'Callisto is Jupiter''s second largest moon and the third largest in our solar system. Its surface is the most heavily cratered of any object in our solar system.', true, false, 'Jupiter', 6, 1, 1, 'https://solarsystem.nasa.gov/moons/jupiter-moons/callisto/overview/');
INSERT INTO public.moon VALUES (8, 'Amalthea', 4500, 52, 4.2, 'Amalthea is the reddest object in the solar system and it appears to give out more heat than it receives from the sun. This may be because as it orbits within Jupiter''s powerful magnetic field electric currents are included in the moon''s core. Alternatively, the heat could be from tidal stresses.', true, false, 'Jupiter', 6, 1, 1, 'https://solarsystem.nasa.gov/moons/jupiter-moons/amalthea/in-depth/ https://www.space.com/amalthea-jupiter-moon');
INSERT INTO public.moon VALUES (9, 'Enceladus', 4500, 313, 8.5, 'Few worlds in our solar system are as compelling as Saturn''s icy ocean moon Enceladus. A handful of worlds are thought to have liquid water oceans beneath their frozen shell, but Enceladus sprays its ocean out into space where a spacecraft can sample it.', true, false, 'Saturn', 7, 1, 1, 'https://solarsystem.nasa.gov/moons/saturn-moons/enceladus/in-depth/');
INSERT INTO public.moon VALUES (10, 'Titan', 4500, 3200, 8.5, 'Saturn''s largest moon Titan is an extraordinary and exceptional world. Among our solar system''s more than 150 known moons, Titan is the only one with substantial atmosphere. And of all the places in the solar system, Titan is the only place besides Earth known to have liquids in the form of rivers, lakes and seas on its surface.', true, false, 'Saturn', 7, 1, 1, 'https://solarsystem.nasa.gov/moons/saturn-moons/titan/in-depth/');
INSERT INTO public.moon VALUES (11, 'Atlas', 4500, 9, 8.5, 'Atlas is an inner moon of Saturn, orbiting around the outer edge of Saturn''s A Ring. Like Pan, Atlas has a distinctive flying saucer shape created by a prominent equatorial ridge not seen on the other small moons of Saturn.', false, false, 'Saturn', 7, 1, 1, 'https://solarsystem.nasa.gov/moons/saturn-moons/atlas/in-depth/');
INSERT INTO public.moon VALUES (12, 'Ariel', 4500, 360, 18.8, 'Ariel has the brightest surface of the five largest Uranian moons, but none of them reflect more than about a third of the sunlight that strikes them. This suggests that their surfaces have been darkened by a carbonaceous material.', true, false, 'Uranus', 8, 1, 1, 'https://solarsystem.nasa.gov/moons/uranus-moons/ariel/in-depth/');
INSERT INTO public.moon VALUES (13, 'Cupid', 4500, 11, 18.8, 'Cupid is one of the inner moons of Uranus, so small and dark that it escaped the notice of Voyager 2 during the spacecraft''s visit in 1986.', true, false, 'Uranus', 8, 1, 1, 'https://solarsystem.nasa.gov/moons/uranus-moons/cupid/in-depth/');
INSERT INTO public.moon VALUES (14, 'Despina', 4500, 94, 29.1, 'Despina is a tiny moon located within Neptune''s faint ring system. The irregularly-shaped moon orbits Neptune every eight hours, circling, in the same direction as Neptune''s own rotation.', false, false, 'Neptune', 9, 1, 1, 'https://solarsystem.nasa.gov/moons/neptune-moons/despinsa/in-depth/ https://en.wikipedia.org/wiki/Despina_(moon)');
INSERT INTO public.moon VALUES (15, 'Naiad', 4500, 33, 29.1, 'Potato-shaped Naiad is most likely made up of fragments of Neptune''s original satellites, which were smashed up by the disturbances when the ice giant captured its largest moon, Triton. It is probable that Naiad has not been modified by any internal geologial processes since its formation.', false, false, 'Neptune', 9, 1, 1, 'https://solarsystem.nasa.gov/moons/neptune-moons/naiad/in-depth/ https://solarviews.com/eng/naiad.htm');
INSERT INTO public.moon VALUES (16, 'Charon', 4500, 750, 38, 'At half the size of Pluto, Charon is the largest of Pluto''s five moons and the largest known satellite relative to its parent body. Pluto-Charon is our solar system''s only known double planetary system. The same surfaces of Charon and Pluto always face each other, a phenomenon called mutal tidal locking.', true, false, 'Pluto', 10, 1, 1, 'https://solarsystem.nasa.gov/moons/pluto-moons/charon/in-depth/');
INSERT INTO public.moon VALUES (17, 'Styx', 4500, 15, 38, 'Styx is named for the mythological river that separates the world of the living from the realm of the dead. All of Pluto''s moons are named for mythological figures associated with the underworld.', true, false, 'Pluto', 10, 1, 1, 'https://solarsystem.nasa.gov/moons/pluto-moons/styx/in-depth/');
INSERT INTO public.moon VALUES (18, 'Hi''iaka', 4500, 199, 42, 'Hi''iaka is the larger, outer moon of the trans-Neptunian dwarf planet Haumea. It is named after one of the daughters of Haumea, Hi''iaka, the patron goddess of the Big Island of Hawaii.', true, false, 'Haumea', 12, 1, 1, 'https://en.wikipedia.org/wiki/Hi%CA%BBiaka_(moon)');
INSERT INTO public.moon VALUES (19, 'Namaka', 4500, 106, 42, 'Namaka is the smaller, inner moon of the trans-Neptunian dwarf planet Haumea. It is named after Namaka, the goddess of the sea in Hawaiian mythology and one of the daughters of Haumea.', true, false, 'Haumea', 12, 1, 1, 'https://en.wikipedia.org/wiki/Namaka_(moon)');
INSERT INTO public.moon VALUES (20, 'Dysnomia', 4500, 435, 67, 'Discovered in 2005, Dysnomia is the only known moon of the dwarf planet Eris and was named after the daughter of the Greek goddess Eris.', true, false, 'Eris', 13, 1, 1, 'https://www.spaceopedia.com/solar-system/moons/eris-dysnomia/');

--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, 3032, 4500, 0.6, 'Mercury is appropriately named for the swiftest of the ancient Roman gods.', 'Its the smallest planet in our solar system, nearest to the Sun, and is only slightly larger than Earth''s Moon.', 'Scores of science fiction writers have been inspired by Mercury, including Isaac Asimov, C. S. Lewis, Ray Bradbury, Arthur C. Clarke, and H. P. Lovecraft.', 'Mercury''s environment is not conducive to life as we know it. The temperatures and solar radiation are most likely too extreme for organisms to adapt.', false, true, false, 1, 1, 'Terrestrial', 'the Sun', 'https://solarsystem.nasa.gov/planets/mercury/overview/ https://solarsystem.nasa.gov/planets/mercury/in-depth/');
INSERT INTO public.planet VALUES (2, 'Venus', 0, 7521, 4500, 0.3, 'Venus, the third brightest object after the Sun and Moon, was named after the Roman goddess of love and beauty.', 'It''s a cloud-swaddled planet named for a lovee goddess. Venus is often called "Earth''s twin" because they''re similar in size and structure, but Venus has extreme surface heat and a dense, toxic atmosphere.', 'Because it''s so bright and easy to see in the sky, Venus has played a role in popular culture since ancient times, inspiring writing and song: It was called the most beautiful star in the sky by Homer, author of "The Illiad" and "The Odyssey" - two of the oldest and most important works in Greek literature.', 'No findings provide compelling evidence for the existence of life in Venus'' clouds.', false, true, false, 1, 1, 'Terrestrial', 'the Sun', 'https://solarsystem.nasa.gov/planets/venus/overview/ https://solarsystem.nasa.gov/planets/venus/in-depth/');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 7926, 4500, 0, 'All of the planet, except for Earth, were named after Greek and Roman gods and godesses. The name Earth is a Germanic word, which simply means "the ground" and is at least 1,000 years old. (That is the word, not the planet, which is much older by far.)', 'While Earth is only the fifth largest planet in the solar system, it is the only world in our solar system with liquid water on the surface and is the only place we know of so far that''s inhabited by living things.', 'Storytellers explore the nature of our planet and possible alternate realities in many books, movies, and television shows.', 'Earth has a very hospitable tempurature and mix of chemicals that have made life abundant. Most notably, Earth is unique in that most of our planet is covered in liquid water.', true, true, false, 1, 1, 'Terrestrial', 'the Sun', 'https://solarsystem.nasa.gov/planets/earth/overview/ https://solarsystem.nasa.gov/planets/earth/in-depth/');
INSERT INTO public.planet VALUES (4, 'Mars', 2, 4228, 4500, 0.5, 'Mars was named by the ancient Romans for their god of war because its reddish color was reminiscent of blood.', 'Mars is no place for the faint-hearted. It''s dry, rocky, and bitter cold.', 'In the late 1800s when people first observed the canal-like features on Mars'' surface. This led to numerous stories about Martians, some of whom invade Earth, like in the 1938 radio drama, "The War of the Worlds."', 'Scientists don''t expect to find living things currently thriving on Mars. Instead, they''re looking for signs of life that existed long ago, when Mars was warmer and covered with water.', false, true, false, 1, 1, 'Terrestrial', 'the Sun', 'https://solarsystem.nasa.gov/planets/mars/overview/ https://solarsystem.nasa.gov/planets/mars/in-depth/');
INSERT INTO public.planet VALUES (5, 'Ceres', 0, 590, 4500, 1.8, 'Ceres is named for the Roman goddes of corn and harvests. The word ceral comes from the same name.', 'Dwarf planet Ceres is the largest object in the asteroid belt between Mars and Jupiter, and it''s the only dwarf planet located in the inner solar system.', 'In the PC Game Descent, one of the secret levels takes place on Ceres.', 'Ceres has something a lot of other planets don''t: water. If anything does live on Ceres, it''s likely to be very small microbes similar to bacteria. If Ceres does not have living things today, there may be signs it harbored life in the past.', false, true, false, 1, 1, 'Dwarf', 'the Sun', 'https://solarsystem.nasa.gov/planets/ceres/overview/ https://solarsystem.nasa.gov/planets/ceres/in-depth/');
INSERT INTO public.planet VALUES (6, 'Jupiter', 79, 88846, 4500, 4.2, 'Jupiter, being the biggest planet in our solar system, gets its name from the king of the ancient Roman gods.', 'Jupiter is more han twice as massive as all the other planets combined. Jupiter''s stripes and swirls are actually cold, windy clouds of ammonia and water, floating in an atmosphere of hydrogen and helium. The iconic Great Red Spot is a giant storm bigger than Earth that has raged for hundreds of years.', 'Jupiter was a notable destination in the Wachowski siblings'' science fiction spectacle "Jupiter Ascending," while various Jovian moons provide settings for "Cloud Atlas," "Futurama," "Power Rangers," "Halo," and many others.', 'Jupiter''s environment is pribably not conducive to life as we know it. However, the same is not true of some of its many moons. Europa is one of the likeliest places to find life elsewhere in our solar system. There is evidence of a vast ocean just beneath its icy crust, where life could possibly be supported.', false, true, true, 1, 1, 'Gas Giant', 'the Sun', 'https://solarsystem.nasa.gov/planets/jupiter/overview/ https://solarsystem.nasa.gov/planets/jupiter/in-depth/');
INSERT INTO public.planet VALUES (7, 'Saturn', 82, 74898, 4500, 8.5, 'Saturn is named for the Roman god of agriculture and wealth, who was also the father of Jupiter.', 'Saturn is the farthest planet from Earth discovered by the unaided human eye and the second largest planet in our solar system. Like fellow gas giant Jupiter, it''s a massive ball made mostly of hydrogen and helium. Saturn is not the only planet to have rings, but no others are as spectacular or as complex.', 'Perhaps the most iconic of all the planets in our solar system, Saturn provides a backdrop for numerous science fiction stories, movies, TV Shows, comics, and video games. For example, in Tim Burton''s film "Beetlejuice," a dusty, fictional Saturn is populated by giant sandworms.', 'Saturn''s environment is pribably not conducive to life as we know it. However, the same is not true of some of its many moons. Satellited like Encledus and Titan, home to internal oceans, could possibly support life.', false, true, true, 1, 1, 'Gas Giant', 'the Sun', 'https://solarsystem.nasa.gov/planets/saturn/overview/ https://solarsystem.nasa.gov/planets/saturn/in-depth/');
INSERT INTO public.planet VALUES (8, 'Uranus', 27, 31763, 4500, 18.8, 'Willim Herschel tried unsuccessfully to name his discovery Georgium Sidus after King George III. Instead, the planet was named for Uranus, the Greek god of the sky, as suggested by Johann Bode.', 'Uranus is a very cold and windy ice giant surrounded by 13 faint rings and 27 small moons. It rotates at a nearly 90-degree angle from the plane of its orbit. This unique tilt makes Uranus appear to spin sideways, orbiting the Sun like a rolling ball.', 'The radioactive element uranium was named after Uranus when it was discovered in 1789, just eight years after the planet was discovered.', 'Uranus'' environment is pribably not conducive to life as we know it. The temperatures, pressures, and materials that characterize this planet are most likely too extreme and volatile for organisms to adapt.', false, true, true, 1, 1, 'Ice Giant', 'the Sun', 'https://solarsystem.nasa.gov/planets/uranus/overview/ https://solarsystem.nasa.gov/planets/uranus/in-depth/');
INSERT INTO public.planet VALUES (9, 'Neptune', 14, 30775, 4500, 29.1, 'Neptune was the first planet located through mathematical calulations. Using predictions made by Urbain Le Verrier, Johann Galle discovered the planet in 1846. The planet is named after the Roman god of the sea, as suggested by Le Verrier.', 'Dark, cold, and whipped by supersonic winds, ice giant Neptune is more than 30 times as far from the Sun as Earth. Its the only planet in our solar system not visible to the naked eye. In 2011 Neptune completed its first 165-year orbit since its discovery in 1846.', 'Even though Neptune is the farthest planet from our Sun, it''s a frequent stop in pop culture and fiction, "Dr. Who" fans will remember that an episode entitled "Sleep No More" is set on a space station orbiting Neptune.', 'Neptune''s environment is pribably not conducive to life as we know it. The temperatures, pressures, and materials that characterize this planet are most likely too extreme and volatile for organisms to adapt.', false, true, true, 1, 1, 'Ice Giant', 'the Sun', 'https://solarsystem.nasa.gov/planets/neptune/overview/ https://solarsystem.nasa.gov/planets/neptune/in-depth/');
INSERT INTO public.planet VALUES (10, 'Pluto', 5, 1433, 4500, 38, 'Pluto is the only world (so far) named by an 11-year-old-girl. In 1930, Venetia Burney of Oxford, England, suggested to her grandfather than the new discovery be named for the Roman god of the underworld. He forwarded the name to the Lowell Observatory and it was selected.', 'Pluto is a complex and mysterious world with mountains, valleys, plains, craters, and maybe glaciers. Discovered in 1930, Pluto was long considerd our solar system''s ninth planet. But after the discovery of similar intriguing worlds deeper in the distant Kuiper Belt, icy Pluto was reclassified as a dwarf planet.', 'The Disney cartoon character Pluto, Mickey''s faithful dog, made his debut in 1930, the same year Tombaugh discovered the dwarf planet.', 'The surface of Pluto is extremely cold, so it seems unlikely that life could exist there. At such cold temperatures, water, which is vital for life as we know it, is essentially rock-like. Pluto''s interior is warmer, however, and some think there could even be an ocean deep inside.', false, true, false, 1, 1, 'Dwarf', 'the Sun', 'https://solarsystem.nasa.gov/planets/dwarf-planets/pluto/overview/ https://solarsystem.nasa.gov/planets/dwarf-planets/pluto/in-depth/');
INSERT INTO public.planet VALUES (11, 'Haumea', 2, 1218, 4500, 42, 'Haumea is named after the Hawaiian goddess of fertility.', 'Originally designed 2003 EL61 (and nicknamed Santa by one discovery team), Haumea is located in the Kuiper Belt, a donut-shaped region of icy bodies beyond the orbit of Neptune.', 'Astronomers think Haumea may have crashed into another large object a long time ago. It is possible that pieces left over from this collision came together to form Haumea''s moons. If so, the scientific story matches the myth. The "children" (moons) of Haumea did indeed "spring forth from" the "body" of their "mother" (the dwarf planet).', 'Haumea is extremely cold and doesn''t appear to have conditions suitable for life.', false, false, true, 1, 1, 'Dwarf', 'the Sun', 'https://solarsystem.nasa.gov/planets/dwarf-planets/haumea/overview/ https://solarsystem.nasa.gov/planets/dwarf-planets/haumea/in-depth/ https://www.window2universe.org/?page=/mythology/planets/dwarf_planets/haumea.html');
INSERT INTO public.planet VALUES (12, 'Makemake', 1, 891, 4500, 44.8, 'Makemake was named after the Rapanui god of fertility.', 'Makemake is located in the Kuiper Belt, a donut-shaped region of icy bodies beyond the orbit of Neptune.', 'It was nicknamed as Easter bunny before being officially named.', 'The surface of Makemake is extremely cold, so it seems unlikely that life could exist there.', false, true, false, 1, 1, 'Dwarf', 'the Sun', 'https://solarsystem.nasa.gov/planets/dwarf-planets/makemake/overview/ https://solarsystem.nasa.gov/planets/dwarf-planets/makemake/in-depth/ https://galaxy101.com/makemake-facts/');
INSERT INTO public.planet VALUES (13, 'Eris', 1, 1445, 4500, 67, 'Eris is named for the ancient Greek goddess of discord and strife.', 'Eris triggered a debate in the scientific community that led to the International Astronomical Union''s decision in 2006 to clarify the definition of a planet. Pluto, Eris, and other similar objects are now classified as dwarf planets.', 'Dysnomia (Eris'' moon) has been named after the Greek goddess of lawlessness.', 'The surface of Eris is extremely cold, so it seems unlikely that life could exist there.', false, true, false, 1, 1, 'Dwarf', 'the Sun', 'https://solarsystem.nasa.gov/planets/dwarf-planets/eris/overview/ https://solarsystem.nasa.gov/planets/dwarf-planets/eris/in-depth/ https://galaxy101.com/eris-facts/');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 9, 1, 1, 'The Sun is a yellow dwarf star, a hot ball of glowing gases at the heart of our solar system. Its gravity holds everything from the biggest planets to tiny debrs in its orbit.', true, false, 1, 'Yellow Dwarf', 'None', 'https://starlust.org/the-biggest-stars-in-the-universe/ https://solarsystem.nasa.gov/solar-system/sun/overview/ https://planetseducation.com/mass-of-sun/');
INSERT INTO public.star VALUES (2, 'UY Scuti', 1476000, 23, 600790232, 'A hypergiant is a rare type of star with an extremly high luminosity, mass, size and mas loss because of its extreme stellar winds. UY Scuti is also a pulsating semi-regular variable star.', false, false, 1, 'Extreme Red Hypergiant or Red Supergiant', 'Scutum', 'https://starlust.org/the-biggest-stars-in-the-universe/');
INSERT INTO public.star VALUES (3, 'V766 Centauri Aa', 960, 13, 739920602, 'The star is located just outside of Centaurus. It is slightly Southwest of Beta Centauri and is about 21% cooler than the Sun.', false, false, 1, 'Yellow Hypergiant', 'Centaurus', 'https://starlust.org/the-biggest-stars-in-the-universe/ https://journalofcosmology.com/biggest-stars-in-the-universe/');
INSERT INTO public.star VALUES (4, 'KY Cygni', 1270000, 25, 316205385, 'KY Cygni is a red supergiant discovered in 1930.', false, false, 1, 'Red Supergiant', 'Cygnus', 'https://starlust.org/the-biggest-stars-in-the-universe/ https://largest.org/nature/stars/');
INSERT INTO public.star VALUES (5, 'AH Scorpii', 1219000, NULL, 67035542, 'AH Scorpii is not part of the Scorpius constellation outline but is within the borders. The star can not be seen by the naked eye, you need a telescope to see it. As no probes have been sent to AH Scorpii the solar mass is unknown.', false, true, 1, 'Red Supergiant', 'Scorpius', 'https://starlust.org/the-biggest-stars-in-the-universe/ https://universeguide.com/star/84071/ahscorpii');
INSERT INTO public.star VALUES (6, 'W Cephei', 1150000, 13, 103134814, 'While W Cephei was cataloged in 1896, it wasn''t known to be an eclipsing binary until 1936.', false, false, 1, 'Orange-red Supergiant', 'Cepheus', 'https://starlust.org/the-biggest-stars-in-the-universe/');


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 4, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_description_key UNIQUE (description);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


--
-- Name: moon fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: asteroid fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: asteroid fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--