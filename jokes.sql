--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

-- Started on 2022-12-19 02:51:00

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
-- TOC entry 208 (class 1259 OID 98968)
-- Name: seq_categories; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_categories
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    CYCLE;


ALTER TABLE public.seq_categories OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 202 (class 1259 OID 98895)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer DEFAULT nextval('public.seq_categories'::regclass) NOT NULL,
    category character varying NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 98970)
-- Name: seq_flags; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_flags
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    CYCLE;


ALTER TABLE public.seq_flags OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 98903)
-- Name: flags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flags (
    id integer DEFAULT nextval('public.seq_flags'::regclass) NOT NULL,
    flag character varying NOT NULL
);


ALTER TABLE public.flags OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 98927)
-- Name: jokes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jokes (
    id integer NOT NULL,
    category_id integer,
    type_id integer,
    text1 character varying,
    text2 character varying,
    language_id integer
);


ALTER TABLE public.jokes OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 98953)
-- Name: jokes_flags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jokes_flags (
    joke_id integer NOT NULL,
    flag_id integer NOT NULL
);


ALTER TABLE public.jokes_flags OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 98911)
-- Name: language; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.language (
    id integer NOT NULL,
    code character varying(2),
    language character varying
);


ALTER TABLE public.language OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 98976)
-- Name: seq_jokes; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_jokes
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_jokes OWNER TO postgres;

--
-- TOC entry 2887 (class 0 OID 0)
-- Dependencies: 212
-- Name: seq_jokes; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.seq_jokes OWNED BY public.jokes.id;


--
-- TOC entry 210 (class 1259 OID 98972)
-- Name: seq_languages; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_languages
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    CYCLE;


ALTER TABLE public.seq_languages OWNER TO postgres;

--
-- TOC entry 2888 (class 0 OID 0)
-- Dependencies: 210
-- Name: seq_languages; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.seq_languages OWNED BY public.language.id;


--
-- TOC entry 211 (class 1259 OID 98974)
-- Name: seq_types; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_types
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    CYCLE;


ALTER TABLE public.seq_types OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 98919)
-- Name: types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.types (
    id integer DEFAULT nextval('public.seq_types'::regclass) NOT NULL,
    type character varying NOT NULL
);


ALTER TABLE public.types OWNER TO postgres;

--
-- TOC entry 2724 (class 2604 OID 98980)
-- Name: jokes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jokes ALTER COLUMN id SET DEFAULT nextval('public.seq_jokes'::regclass);


--
-- TOC entry 2722 (class 2604 OID 98981)
-- Name: language id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language ALTER COLUMN id SET DEFAULT nextval('public.seq_languages'::regclass);


--
-- TOC entry 2871 (class 0 OID 98895)
-- Dependencies: 202
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categories VALUES (1, 'Any');
INSERT INTO public.categories VALUES (2, 'Misc');
INSERT INTO public.categories VALUES (3, 'Programming');
INSERT INTO public.categories VALUES (4, 'Dark');
INSERT INTO public.categories VALUES (5, 'Pun');
INSERT INTO public.categories VALUES (6, 'Spooky');
INSERT INTO public.categories VALUES (7, 'Christmas');


--
-- TOC entry 2872 (class 0 OID 98903)
-- Dependencies: 203
-- Data for Name: flags; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.flags VALUES (1, 'nsfw');
INSERT INTO public.flags VALUES (2, 'religious');
INSERT INTO public.flags VALUES (3, 'political');
INSERT INTO public.flags VALUES (4, 'racist');
INSERT INTO public.flags VALUES (5, 'sexist');
INSERT INTO public.flags VALUES (6, 'explicit');


--
-- TOC entry 2875 (class 0 OID 98927)
-- Dependencies: 206
-- Data for Name: jokes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.jokes VALUES (2, 4, 2, 'Jaký je rozdíl mezi skautem a Židem?', 'Skaut se vrátí z tábora.', 1);
INSERT INTO public.jokes VALUES (3, 2, 2, 'Jaký je rozdíl mezi ekonomem a Židem?', 'Ekonom ví vše o penězích.
Žid je má.', 1);
INSERT INTO public.jokes VALUES (4, 5, 2, 'Was lebt im Wald und schreit "Kugel"?', 'Der Kugelschreibär.', 2);
INSERT INTO public.jokes VALUES (5, 5, 2, 'Wie nennt sich ein Vogel mit Daddy-Fetisch?', 'Ein Papageil.', 2);
INSERT INTO public.jokes VALUES (6, 5, 2, 'Im Bundestag gibt es neue Auflagen.', 'Die Stühle waren zu unbequem.', 2);
INSERT INTO public.jokes VALUES (7, 5, 2, 'Warum hat niemand das Getränk des Soldaten gefunden?', 'Es war in einer Camouflasche.', 2);
INSERT INTO public.jokes VALUES (8, 5, 2, 'Eine notgeile, inkontinente Henne flattert zum Arzt. Die Diagnose?', 'Hahndrang.', 2);
INSERT INTO public.jokes VALUES (9, 3, 2, 'Kurzarbeit?', 'Sind das dann 7 Bit?', 2);
INSERT INTO public.jokes VALUES (10, 5, 2, 'Wie schreibt ein Oktopus?', 'Krakelig.', 2);
INSERT INTO public.jokes VALUES (11, 5, 2, 'Warum ist der ägyptische Totengott kein erfolgreicher Pro-Gamer?', 'Weil er Anubis.', 2);
INSERT INTO public.jokes VALUES (12, 5, 2, 'Wie nennt man ein ungerubbeltes Rubbellos?', 'Rubbellos.', 2);
INSERT INTO public.jokes VALUES (13, 5, 2, 'Ziemlich unfreundlich diese Älpler.', 'Überall haben sie Schilder, auf denen steht "Wander weg"!', 2);
INSERT INTO public.jokes VALUES (14, 5, 2, 'Was verwendet eine ägyptische Pharaonin um ihren Hintern zu wischen?', 'Kleopapier.', 2);
INSERT INTO public.jokes VALUES (20, 3, 2, 'Es gibt 10 Arten von Menschen.', 'Die einen verstehen das Binäre System, die anderen nicht.', 2);
INSERT INTO public.jokes VALUES (21, 3, 2, 'Was macht ein Informatiker wenn sein Wagen nicht mehr anspringt?', 'Aussteigen, einsteigen und nochmal starten.', 2);
INSERT INTO public.jokes VALUES (23, 7, 2, 'Was stellt sich ein Informatiker zu Weihnachten in die Wohnung?', 'Einen B-Baum.', 2);
INSERT INTO public.jokes VALUES (27, 3, 2, 'Was ist die Lieblingsbeschäftigung von Bits?', 'Busfahren.', 2);
INSERT INTO public.jokes VALUES (28, 2, 2, 'Treffen sich zwei Kerzen.', 'Fragt die eine "Was machst du heute?"
Sagt die andere "Ich gehe aus."', 2);
INSERT INTO public.jokes VALUES (31, 5, 2, 'Warst du eigentlich schonmal in Las Vegas?', 'Nevada noch nie.', 2);
INSERT INTO public.jokes VALUES (32, 3, 2, 'Why did the JavaScript heap close shop?', 'It ran out of memory.', 3);
INSERT INTO public.jokes VALUES (33, 3, 2, 'What is the best prefix for global variables?', '//', 3);
INSERT INTO public.jokes VALUES (47, 3, 2, 'What''s the object-oriented way to become wealthy?', 'Inheritance.', 3);
INSERT INTO public.jokes VALUES (48, 3, 2, 'Genders are a lot like booleans.', 'There''s only two of them.', 3);
INSERT INTO public.jokes VALUES (49, 3, 2, 'Why did the functional programmer get thrown out of school?', 'Because he refused to take classes.', 3);
INSERT INTO public.jokes VALUES (50, 3, 2, '.NET developers are picky when it comes to food.', 'They only like chicken NuGet.', 3);
INSERT INTO public.jokes VALUES (51, 3, 2, 'Why do programmers wear glasses?', 'Because they need to C#', 3);
INSERT INTO public.jokes VALUES (53, 3, 2, 'So what''s a set of predefined steps the government might take to preserve the environment?', 'An Al-Gore-ithm.', 3);
INSERT INTO public.jokes VALUES (54, 3, 2, 'Why do Java programmers hate communism?', 'They don''t want to live in a classless society.', 3);
INSERT INTO public.jokes VALUES (55, 3, 2, 'Hey baby I wish your name was asynchronous...', '... so you''d give me a callback.', 3);
INSERT INTO public.jokes VALUES (57, 3, 2, 'What is a dying programmer''s last program?', 'Goodbye, world!', 3);
INSERT INTO public.jokes VALUES (59, 5, 2, 'I asked my wife if I was the only one she''s been with.', 'She said, "Yes, the others were at least sevens or eights."', 3);
INSERT INTO public.jokes VALUES (60, 5, 2, 'Thank you student loans for getting me through college.', 'I don''t think I''ll ever be able to repay you.', 3);
INSERT INTO public.jokes VALUES (61, 5, 2, 'Why is crucified Jesus always depicted with six-pack abs?', 'He did CrossFit.', 3);
INSERT INTO public.jokes VALUES (62, 2, 2, 'Why is every gender equality officer female?', 'Because it''s cheaper.', 3);
INSERT INTO public.jokes VALUES (63, 5, 2, 'One time I masturbated on a plane.', 'I called it "highjacking".', 3);
INSERT INTO public.jokes VALUES (64, 2, 2, 'I used to love to tell dad jokes.', 'Dad, come back...', 3);
INSERT INTO public.jokes VALUES (65, 5, 2, 'What do you call a cop''s penis after he''s done masturbating?', 'Pulled pork.', 3);
INSERT INTO public.jokes VALUES (66, 5, 2, 'Did you hear about the cheese factory that exploded in France?', 'There was nothing but de brie.', 3);
INSERT INTO public.jokes VALUES (67, 2, 2, 'The average penis has...', 'Been in and around my ex-girlfriend''s mouth.
Fuck you, Karen!', 3);
INSERT INTO public.jokes VALUES (68, 5, 2, 'What kind of car did Whitney Houston drive?', 'A Hyundaiiiiiiiiiiii', 3);
INSERT INTO public.jokes VALUES (69, 4, 2, 'I had a granny that we couldn''t decide whether to bury or cremate', 'In the end we decided to just let her live.', 3);
INSERT INTO public.jokes VALUES (70, 5, 2, 'What do you call crystal clear urine?', '1080p.', 3);
INSERT INTO public.jokes VALUES (71, 5, 2, 'What happens when you don''t obey the KGB?', 'You get Putin jail.', 3);
INSERT INTO public.jokes VALUES (72, 2, 2, 'Arguing with a woman is like reading a software''s license agreement.', 'In the end you ignore everything and click "I agree".', 3);
INSERT INTO public.jokes VALUES (76, 5, 2, 'My girlfriend left me because I have a fetish for touching pasta.', 'I''m feeling cannelloni now. :''(', 3);
INSERT INTO public.jokes VALUES (77, 2, 2, 'What is the least spoken language in the world?', 'Sign language.', 3);
INSERT INTO public.jokes VALUES (78, 4, 2, '9/11 jokes are not funny.', 'The other 2 though, are hilarious!', 3);
INSERT INTO public.jokes VALUES (79, 2, 2, 'I WRITE MY JOKES IN CAPITALS.', 'THIS ONE WAS WRITTEN IN PARIS.', 3);
INSERT INTO public.jokes VALUES (80, 4, 2, 'What do Japanese cannibals eat?', 'Raw men.', 3);
INSERT INTO public.jokes VALUES (81, 5, 2, 'So I made a graph of all my past relationships.', 'It has an ex axis and a why axis.', 3);
INSERT INTO public.jokes VALUES (82, 2, 2, 'My wife left me because I''m too insecure and paranoid.', 'Oh wait, never mind. She was just getting the mail.', 3);
INSERT INTO public.jokes VALUES (84, 2, 2, 'Went to the doctors for a prostate exam.
During the exam he said it''s not unusual to become aroused or even ejaculate.', 'But still, I wish he hadn''t.', 3);
INSERT INTO public.jokes VALUES (85, 2, 2, 'If I make you breakfast in bed, a simple thank you is all I need.', 'Not all this "How the fuck did you get in my house?!" nonsense.', 3);
INSERT INTO public.jokes VALUES (86, 4, 2, 'My wife divorced me so I stole her wheelchair.', 'Guess who came crawling back.', 3);
INSERT INTO public.jokes VALUES (87, 5, 2, 'Why did the Romanian stop reading?', 'They wanted to give the Bucharest.', 3);
INSERT INTO public.jokes VALUES (88, 5, 2, 'I hate Russian matryoshka dolls.', 'They''re so full of themselves.', 3);
INSERT INTO public.jokes VALUES (89, 2, 2, 'Mom asked me where I''m taking her to go out to eat for mother''s day.', 'I told her, "We already have food in the house".', 3);
INSERT INTO public.jokes VALUES (90, 2, 2, 'What''s green and smells like pork?', 'Kermit''s Fingers.', 3);
INSERT INTO public.jokes VALUES (92, 2, 2, 'How many nice guys does it take to change a lightbulb?', 'None, they''ll just compliment it and get pissed off when it won''t screw.', 3);
INSERT INTO public.jokes VALUES (93, 2, 2, 'What''s the difference between an in-law and an outlaw?', 'An outlaw is wanted.', 3);
INSERT INTO public.jokes VALUES (94, 4, 2, 'I told my psychiatrist I got suicidal tendencies.', 'He said from now on I have to pay in advance.', 3);
INSERT INTO public.jokes VALUES (95, 2, 2, 'My mother said, "You won''t amount to anything because you always procrastinate."', 'I said, "Oh yeah... Just you wait."', 3);
INSERT INTO public.jokes VALUES (96, 5, 2, 'What do Asian people call fingers?', 'Limb Limbs.', 3);
INSERT INTO public.jokes VALUES (98, 4, 2, 'I''m thinking of setting up a comedy group to help people going through cancer treatment.', 'I''ll call it "A Sense of Tumor".', 3);
INSERT INTO public.jokes VALUES (99, 4, 2, 'I''ve been in 15 school shootings and I was lucky to survive!', 'I just had to be nice with the cops and not resist.', 3);
INSERT INTO public.jokes VALUES (100, 4, 2, 'Why are there no pharmacies in Africa?', 'Because you can''t use medicine on an empty stomach.', 3);
INSERT INTO public.jokes VALUES (101, 4, 2, 'People are like jellybeans and licorice:', 'No one likes the blacks.', 3);
INSERT INTO public.jokes VALUES (102, 4, 2, 'What do an orgasm and a pulse have in common?', 'I don''t care if she has one.', 3);
INSERT INTO public.jokes VALUES (103, 4, 2, 'What''s the difference between an apple and a black guy?', 'The apple will eventually fall from the tree that it''s hanging from!', 3);
INSERT INTO public.jokes VALUES (105, 4, 2, 'How long does a black woman take to throw away the garbage?', 'Nine months.', 3);
INSERT INTO public.jokes VALUES (106, 4, 2, 'Why are Americans shit at Dota?', 'They can''t protect their towers.', 3);
INSERT INTO public.jokes VALUES (107, 4, 2, 'Everyone says that Hitler really loved animals.', 'Then why did he kill 6 million of them?', 3);
INSERT INTO public.jokes VALUES (108, 4, 2, 'Life''s like my dick.', 'The more children you have, the harder it gets.', 3);
INSERT INTO public.jokes VALUES (109, 4, 2, 'Why do German showers have 11 holes?', 'Because Jews only have 10 fingers.', 3);
INSERT INTO public.jokes VALUES (110, 4, 2, 'What''s the most notable similarity between a pedophile and a roller coaster?', 'They both make a child scream, but the first ride''s never the last', 3);
INSERT INTO public.jokes VALUES (111, 4, 2, 'How do we know Jesus wasn''t black?', 'He would have been hung from a tree, not a cross.', 3);
INSERT INTO public.jokes VALUES (112, 4, 2, 'My grandma was recently diagnosed with Alzheimer''s, and she keeps calling me by the wrong name.', 'Other than that, the sex is great.', 3);
INSERT INTO public.jokes VALUES (113, 4, 2, 'What do dermatologists and the KKK have in common?', 'They both remove blackheads.', 3);
INSERT INTO public.jokes VALUES (114, 4, 2, 'Muslim women are horrible competitors.', 'No matter what they do, they always get beat.', 3);
INSERT INTO public.jokes VALUES (116, 4, 2, 'What did one necrophiliac tell the other necrophiliac after work?', '"Let''s go have a couple of cold ones!"', 3);
INSERT INTO public.jokes VALUES (117, 4, 2, 'White people don''t shoot each other in the streets as black people do.', 'They do it in schools because they have class.', 3);
INSERT INTO public.jokes VALUES (118, 4, 2, 'Dark humor is like cancer.', 'It''s more funny when children get it.', 3);
INSERT INTO public.jokes VALUES (119, 4, 2, 'Jokes about anti-vaxxer parents never get old.', 'Just like their kids.', 3);
INSERT INTO public.jokes VALUES (120, 4, 2, 'What do you call a kid with no arms and an eyepatch?', 'Names.', 3);
INSERT INTO public.jokes VALUES (121, 4, 2, 'What''s the difference between a baby and a pile of sand?', 'You can''t pick a pile of sand up with a pitchfork.', 3);
INSERT INTO public.jokes VALUES (122, 4, 2, 'What''s the difference between a baby and a watermelon?', 'One''s satisfying to hit with a sledgehammer. The other''s a watermelon.', 3);
INSERT INTO public.jokes VALUES (123, 4, 2, 'What''s the difference between a little girl and a fridge?', 'Fridges don''t scream when you put your meat in them.', 3);
INSERT INTO public.jokes VALUES (125, 4, 2, 'I was walking down the street and saw some black guy on a bike and it looked just like mine so I ran home to check.', 'Thankfully he was still chained up in my basement.', 3);
INSERT INTO public.jokes VALUES (126, 5, 2, 'What time did the man go to the dentist?', 'Tooth hurt-y.', 3);
INSERT INTO public.jokes VALUES (128, 3, 2, 'How do you generate a random string?', 'Put a Windows user in front of Vim and tell them to exit.', 3);
INSERT INTO public.jokes VALUES (129, 4, 2, 'What''s the difference between a jew and a pizza?', 'The pizza doesn''t scream when you put it in the oven.', 3);
INSERT INTO public.jokes VALUES (130, 2, 2, 'What do you use to blindfold an Asian?', 'Floss.', 3);
INSERT INTO public.jokes VALUES (131, 5, 2, 'What do you call a pile of kittens?', 'A meowntain.', 3);
INSERT INTO public.jokes VALUES (132, 5, 2, 'How does a Jewish person make tea?', 'Hebrews it.', 3);
INSERT INTO public.jokes VALUES (135, 2, 2, 'Why does Beyonce sing "to the left, to the left"?', 'Because women don''t have rights.', 3);
INSERT INTO public.jokes VALUES (136, 4, 2, 'What''s black and sits at the top of a stairwell?', 'A paraplegic after a house fire.', 3);
INSERT INTO public.jokes VALUES (137, 5, 2, 'Why do Hong Kong cops like to go to work early?', 'To beat the crowd.', 3);
INSERT INTO public.jokes VALUES (138, 2, 2, 'What does tofu and a dildo have in common?', 'They''re both meat substitutes.', 3);
INSERT INTO public.jokes VALUES (141, 5, 2, 'What kind of doctor is Dr. Pepper?', 'He''s a fizzician.', 3);
INSERT INTO public.jokes VALUES (142, 2, 2, 'What''s the difference between a hot potato and a flying pig?', 'One''s a heated yam, the other''s a yeeted ham.', 3);
INSERT INTO public.jokes VALUES (143, 2, 2, 'What''s the difference between a feminist and a grenade?', 'The grenade actually accomplishes something when it triggers.', 3);
INSERT INTO public.jokes VALUES (144, 4, 2, 'When I was a kid, I made a really big sandcastle with my grandma.', 'Unfortunately, that didn''t impress anyone at the cremation...', 3);
INSERT INTO public.jokes VALUES (145, 4, 2, 'What did the boy with no arms get for Christmas?', 'I don''t know, he hasn''t opened it yet.', 3);
INSERT INTO public.jokes VALUES (146, 2, 2, 'My neighbor is a 90 year old with Alzheimer''s, I see him every morning and he asks me If I''ve seen his wife.
Every day I have to tell this poor man that his wife died 20 years ago.
I could have moved to another house or even ignore his question.', 'But the look of joy in his eyes whenever I answer him is worth the world.', 3);
INSERT INTO public.jokes VALUES (147, 2, 2, 'This morning I accidentally made my coffee with Red Bull instead of water.', 'I was already on the highway when I noticed I forgot my car at home.', 3);
INSERT INTO public.jokes VALUES (148, 3, 2, 'How did you make your friend rage?', 'I implemented a greek question mark in his JavaScript code.', 3);
INSERT INTO public.jokes VALUES (149, 5, 2, 'The gas Argon walks into a bar.
The barkeeper says "What would you like to drink?"', 'But Argon doesn''t react.', 3);
INSERT INTO public.jokes VALUES (151, 4, 2, 'The KKK isn''t really that racist.', 'I went to one of their meetings and there were a lot of black people hanging around.', 3);
INSERT INTO public.jokes VALUES (152, 4, 2, 'Why does Dr. Pepper come in a bottle?', 'His wife is dead.', 3);
INSERT INTO public.jokes VALUES (154, 4, 2, 'What part of a vegetable are you not supposed to eat?', 'The wheelchair.', 3);
INSERT INTO public.jokes VALUES (155, 4, 2, 'What do Ted Bundy and the Space Shuttle Columbia have in common?', 'They both left bodies in four states.', 3);
INSERT INTO public.jokes VALUES (156, 5, 2, 'What do you call a deaf gynecologist?', 'A lip reader.', 3);
INSERT INTO public.jokes VALUES (157, 5, 2, 'What do you call a cheap circumcision?', 'A rip off.', 3);
INSERT INTO public.jokes VALUES (158, 2, 2, 'What does a woman''s pussy and a chainsaw have in common?', 'Miss by a few inches and you''re in deep shit.', 3);
INSERT INTO public.jokes VALUES (159, 4, 2, 'What did the cannibal do after he dumped his girlfriend?', 'He wiped his ass.', 3);
INSERT INTO public.jokes VALUES (160, 4, 2, 'What is the difference between acne and a catholic priest?', 'Acne usually comes on a boys face after he turns 12.', 3);
INSERT INTO public.jokes VALUES (161, 4, 2, 'My first high-school football game was a lot like my first time having sex...', 'I was bloody and sore at the end, but at least my dad came.', 3);
INSERT INTO public.jokes VALUES (162, 4, 2, 'Say what you want about pedophiles...', 'But at least they drive slowly through the school zones.', 3);
INSERT INTO public.jokes VALUES (164, 2, 2, 'What''s the difference between a gay guy and a refrigerator?', 'A refrigerator doesn''t fart when I pull my meat out of it.', 3);
INSERT INTO public.jokes VALUES (165, 2, 2, 'I''m sure good looking lesbians look at fat lesbians and give them no chance.', 'Until they see their fingers.', 3);
INSERT INTO public.jokes VALUES (167, 4, 2, 'Dads are like boomerangs.', 'I hope.', 3);
INSERT INTO public.jokes VALUES (168, 2, 2, 'I like my girls how I like my COVID.', '19 and easily spread.', 3);
INSERT INTO public.jokes VALUES (169, 5, 2, 'Two guys walked into a bar.', 'The third guy ducked.', 3);
INSERT INTO public.jokes VALUES (170, 5, 2, 'Two peanuts were walking.', 'One was assaulted.', 3);
INSERT INTO public.jokes VALUES (171, 5, 2, 'What kind of bees produce milk?', 'Boo-Bees.', 3);
INSERT INTO public.jokes VALUES (172, 5, 2, 'A grocery store cashier asked if I would like my milk in a bag.', 'I told her "No, thanks. The carton works fine".', 3);
INSERT INTO public.jokes VALUES (173, 5, 2, 'What does a perverted frog say?', 'Rubbit.', 3);
INSERT INTO public.jokes VALUES (174, 4, 2, 'How many Jews can you fit into a car?', 'Two in the front, three in the back, and a hundred in the ashtray.', 3);
INSERT INTO public.jokes VALUES (175, 4, 2, 'What is the difference between a pizza and a black man?', 'A pizza can feed a family of five.', 3);
INSERT INTO public.jokes VALUES (176, 2, 2, 'What is the difference between an oral thermometer and a rectal thermometer?', 'The taste.', 3);
INSERT INTO public.jokes VALUES (177, 5, 2, 'What do you call a witch at the beach?', 'A Sandwich.', 3);
INSERT INTO public.jokes VALUES (178, 5, 2, 'What do you call 4 Mexicans in quicksand?', 'Quatro Sinko.', 3);
INSERT INTO public.jokes VALUES (180, 2, 2, 'Why do Jewish women prefer circumcised men?', 'Cause they won''t take anything until it''s atleast 10% off.', 3);
INSERT INTO public.jokes VALUES (182, 2, 2, 'What is the difference between the Constitutions of the USA and the USSR? Don''t both of them guarantee freedom of speech?', 'Yes, but the Constitution of the USA also guarantees freedom after the speech.', 3);
INSERT INTO public.jokes VALUES (183, 2, 2, 'Why was the river rich?', 'Because it had two banks.', 3);
INSERT INTO public.jokes VALUES (184, NULL, NULL, 'null', 'null', NULL);
INSERT INTO public.jokes VALUES (185, 2, 2, 'Entre un aviateur et un marin, lequel écrit le moins?', 'Le marin, parce qu''il a jeté l''encre.', 5);
INSERT INTO public.jokes VALUES (186, 2, 2, 'Quel est le comble pour un électricien?', 'D''avoir des ampoules aux pieds.', 5);
INSERT INTO public.jokes VALUES (187, 2, 2, 'Qu''est-ce qu''une manifestation d''aveugles?', 'Le festival de Cannes.', 5);
INSERT INTO public.jokes VALUES (188, 2, 2, 'Comment appelle-t-on un développeur pédophile?', 'Un pédofile.', 5);
INSERT INTO public.jokes VALUES (189, 2, 2, 'Comment appelle-t-on un ascenseur en Amérique?', 'En appuyant sur le bouton...', 5);
INSERT INTO public.jokes VALUES (190, 2, 2, 'C''est l''histoire d''une fleur qui court, qui court..', 'Et qui se plante.', 5);
INSERT INTO public.jokes VALUES (191, 2, 2, 'Comment appelle-t-on une fracture du crâne?', 'Un dégât des os.', 5);
INSERT INTO public.jokes VALUES (192, 2, 2, 'Qu''est-ce qui est transparent et qui sent la carotte?', 'Un pet de lapin.', 5);
INSERT INTO public.jokes VALUES (193, 2, 2, 'Qu''est-ce qu''un cochon qui rit?', 'Un porc tout gai.', 5);
INSERT INTO public.jokes VALUES (194, 2, 2, 'Quel est l''ami du feu?', 'Le pot-au-feu.', 5);
INSERT INTO public.jokes VALUES (195, 2, 2, 'Quelles sont vos matières préférées?', 'Maths et Dessin!', 5);
INSERT INTO public.jokes VALUES (196, 2, 2, 'Comment appelle-t-on un covoiturage au Sénégal?', 'Un Babacar.', 5);
INSERT INTO public.jokes VALUES (197, 2, 2, 'Que fait-on aux voleurs de salades?', 'On laitue...', 5);
INSERT INTO public.jokes VALUES (198, 2, 2, 'Qu''est-ce que fait un pou dans une cloche?', 'Pou Ding', 5);
INSERT INTO public.jokes VALUES (199, 2, 2, 'Quel est le légume le plus courageux?', 'Le pois-chiche.', 5);
INSERT INTO public.jokes VALUES (200, 2, 2, 'Un jour, Dieu demanda au coca de coller...', 'et le Coca Cola...', 5);
INSERT INTO public.jokes VALUES (201, 2, 2, 'Comment fait-on pour occuper une blonde?', 'On la met dans une pièce ronde en lui disant de chercher les coins.', 5);
INSERT INTO public.jokes VALUES (202, 2, 2, 'Quel est le seul animal qui nourrit lui-même sa voiture?', 'La chèvre car elle nourrit son cabri au lait!', 5);
INSERT INTO public.jokes VALUES (203, 2, 2, 'Dans quel pays ne bronze-t-on pas du nez?', 'Au Népal', 5);
INSERT INTO public.jokes VALUES (204, 2, 2, 'Pourquoi est-ce que les anges sont sourds?', 'Parce que Jésus-Christ.', 5);
INSERT INTO public.jokes VALUES (205, 2, 2, 'Qu''est-ce qui fait nioc-nioc?', 'Un canard qui essaye de parler le verlan.', 5);
INSERT INTO public.jokes VALUES (206, 2, 2, 'Quels sont les fruits que nous trouvons dans toutes les maisons?', 'Les coins et les mûres.', 5);
INSERT INTO public.jokes VALUES (207, 2, 2, 'Comment appelle-t-on la mère du phoque?', 'Mother phoquer', 5);
INSERT INTO public.jokes VALUES (208, 2, 2, 'Quelle est la devise des chats diaboliques?', 'Satan est par minou.', 5);
INSERT INTO public.jokes VALUES (209, 2, 2, 'Quels sont les deux animaux les plus intelligents?', 'Le Cerf et le Veau.', 5);
INSERT INTO public.jokes VALUES (210, 2, 2, 'Pourquoi on met une selle sur un cheval?', 'Parce qu''en dessous elle tomberait.', 5);
INSERT INTO public.jokes VALUES (211, 2, 2, 'De quel pays viennent les cochons?', 'Des quatre groins du monde.', 5);
INSERT INTO public.jokes VALUES (212, 2, 2, 'Quel est le comble pour une taupe?', 'D''amuser la galerie!', 5);
INSERT INTO public.jokes VALUES (213, 2, 2, 'Que prend un éléphant quand il va au restaurant?', 'Il prend de la place!', 5);
INSERT INTO public.jokes VALUES (214, 2, 2, 'Qu''est-ce qui a 3 bosses?', 'Un chameau qui s''est cogné.', 5);
INSERT INTO public.jokes VALUES (215, 2, 2, 'Quel est le comble pour un cycliste?', 'De faire un régime sans sel.', 5);
INSERT INTO public.jokes VALUES (216, 2, 2, 'Quelle est la ville la plus rapide de Suisse?', 'Nyon', 5);
INSERT INTO public.jokes VALUES (217, 2, 2, 'Tu connais la blague du papier?', 'Elle déchire.', 5);
INSERT INTO public.jokes VALUES (218, 2, 2, 'Pourquoi une brioche ne va jamais aux sports d''hiver?', 'Parce qu''elle sait Pasquier', 5);
INSERT INTO public.jokes VALUES (219, 2, 2, 'Pourquoi les mamies sont-elles très efficaces pour faire le ménage?', 'Parce qu''elles ont 80 balais.', 5);
INSERT INTO public.jokes VALUES (220, 2, 2, 'Tu connais la blague de la gomme?', 'Elle dégomme.', 5);
INSERT INTO public.jokes VALUES (221, 2, 2, 'Quelle est la différence entre une machine et du ketchup?', 'Aucune, ils sont tous les deux au-tomate.', 5);
INSERT INTO public.jokes VALUES (222, 2, 2, 'Que se passe-t-il quand on secoue une clef USB?', 'Les fichiers se mélangent.', 5);
INSERT INTO public.jokes VALUES (223, 2, 2, 'Oh, Léon! Ton prénom à l''envers donne Noël!', 'Et oui, tout le monde n''a pas cette chance mon cher Luc...', 5);
INSERT INTO public.jokes VALUES (224, 2, 2, 'On m''a dit que pour faire ses courses pendant le confinement il suffisait de porter un masque et des gants...', 'C''était un mensonge, tous les autres étaient habillés!', 5);
INSERT INTO public.jokes VALUES (225, 2, 2, 'Chérie, pendant que tu dormais tu m''as traité de connard', 'Je ne dormais pas...', 5);
INSERT INTO public.jokes VALUES (226, 2, 2, 'Ce matin en voulant m''habiller, le bouton de ma chemise m''est resté dans les mains. En voulant mettre mes chaussures, mon lacet m''est resté dans les mains.', 'Je me suis dit "Vaut mieux pas que j''aille pisser"', 5);
INSERT INTO public.jokes VALUES (227, 2, 2, 'On ne dit pas " l''électronique " mais...', 'L''électricien fait l''amour.', 5);
INSERT INTO public.jokes VALUES (228, 2, 2, 'Qui se débrouille le mieux au karaté?', 'L''électricité, car elle connaît beaucoup de prises.', 5);
INSERT INTO public.jokes VALUES (229, 2, 2, 'La vitamine C...', 'Mais ne dira rien.', 5);
INSERT INTO public.jokes VALUES (230, 2, 2, 'Que dit un pistolet à une mitraillette?', 'Ça fait longtemps que tu bégayes?', 5);
INSERT INTO public.jokes VALUES (231, 2, 2, 'Un clown arrive chez le docteur', 'Docteur, vite, je me sens tout drôle...', 5);
INSERT INTO public.jokes VALUES (232, 2, 2, 'Qu''est-ce qui est rouge et qui attend?', 'Mon compte en banque.', 5);
INSERT INTO public.jokes VALUES (233, 2, 2, 'Il y a quoi au milieu de l''océan?', 'Un é', 5);
INSERT INTO public.jokes VALUES (234, 2, 2, 'Comment appelle-t-on une personne agréable à Paris?', 'Un touriste.', 5);
INSERT INTO public.jokes VALUES (235, 2, 2, 'Quelle est la partie de la voiture la plus dangereuse?', 'La conductrice.', 5);
INSERT INTO public.jokes VALUES (236, 2, 2, 'Pour ne plus puer de la gueule...', 'Faut-il arrêter de dire de la merde?', 5);
INSERT INTO public.jokes VALUES (237, 2, 2, 'Qu''est-ce qui est noir et blanc et qui rebondit?', 'Un pingouin sur un trampoline.', 5);
INSERT INTO public.jokes VALUES (238, 2, 2, 'Comment reconnaître un ministre qui ment?', 'Ses lèvres bougent', 5);
INSERT INTO public.jokes VALUES (239, 2, 2, 'Comment appelle-t-on une fleur très occupée?', 'Une fleur over-bookée', 5);
INSERT INTO public.jokes VALUES (240, 2, 2, 'Soupçonné de vol dans une boulangerie', 'Florent Pagny nie.', 5);
INSERT INTO public.jokes VALUES (241, 2, 2, 'Quel est le contraire d''un chat?', 'Un pacha.', 5);
INSERT INTO public.jokes VALUES (242, 2, 2, 'Pourquoi une blonde a-t-elle les cheveux mouillés quand elle va se coucher?', 'Parce qu''elle a dit bonne nuit à son poisson rouge.', 5);
INSERT INTO public.jokes VALUES (243, 2, 2, 'Si un noir veut me prendre par les sentiments.', 'Je peux dire qu''il mamadou?', 5);
INSERT INTO public.jokes VALUES (244, 2, 2, 'Qu''est-ce qu''une brune entre 2 blondes?', 'Une interprète.', 5);
INSERT INTO public.jokes VALUES (245, 2, 2, 'Comment occuper une blonde toute la journée?', 'Lui donner un papier où l''on écrit " voir au verso " de chaque côté.', 5);
INSERT INTO public.jokes VALUES (246, 2, 2, 'Pourquoi les poules n''ont-elles pas de seins?', 'Parce que les coqs n''ont pas de mains!', 5);
INSERT INTO public.jokes VALUES (247, 2, 2, 'Pendant l''acte, ma femme me dit : Dis-moi des choses sales!', 'La cuisine, la salle de bain...', 5);
INSERT INTO public.jokes VALUES (248, 2, 2, 'Pourquoi Jésus ne mange jamais de cacahuètes?', 'Parce qu''il a des trous dans les mains.', 5);
INSERT INTO public.jokes VALUES (249, 2, 2, 'Chéri, je me sens grosse et laide... S''il te plait, fais-moi un compliment...', 'Tu as une bonne vue!', 5);
INSERT INTO public.jokes VALUES (250, 2, 2, 'Thomas, penses-tu que je suis une mauvaise mère?', 'Mon nom est Paul...', 5);
INSERT INTO public.jokes VALUES (251, 2, 2, 'Qu''est-ce qu''un lépreux dans un bain?', 'Un Efferalgan', 5);
INSERT INTO public.jokes VALUES (252, 2, 2, 'Comment appelle-t-on une femme qui a perdu son intelligence?', 'Une veuve.', 5);
INSERT INTO public.jokes VALUES (253, 2, 2, 'Quelle est la différence entre la sodomie et les choux-fleurs?', 'Même avec du beurre, les enfants n''aiment pas.', 5);
INSERT INTO public.jokes VALUES (254, 2, 2, 'Quel est le shell préféré des adolescents?', 'Le WESH', 5);
INSERT INTO public.jokes VALUES (255, 2, 2, 'Je suis bipolaire et je vous aime tous.', 'Bande d''enculés.', 5);
INSERT INTO public.jokes VALUES (256, 2, 2, 'Quel est le futur de "je bâille"?', 'Je dors.', 5);
INSERT INTO public.jokes VALUES (257, 2, 2, 'Comment appelle-t-on deux noirs dans un sac de couchage?', 'Un Twix', 5);
INSERT INTO public.jokes VALUES (258, 2, 2, 'Quel est le plus gros dilemme pour un juif?', 'Du jambon gratuit', 5);
INSERT INTO public.jokes VALUES (259, 2, 2, 'Qu''est-ce qu''un juif en forêt?', 'Rabbin des bois', 5);
INSERT INTO public.jokes VALUES (260, 2, 2, 'Comment appelle-t-on une lesbienne qui n''a pas de sein?', 'Une omoplate', 5);
INSERT INTO public.jokes VALUES (261, 2, 2, 'Pourquoi tu vends ton perroquet?', 'Parce qu''hier, ce bâtard a essayé de me vendre!', 5);
INSERT INTO public.jokes VALUES (262, 2, 2, 'Un jour, Dieu demanda à David de guetter', 'Et David guetta.', 5);
INSERT INTO public.jokes VALUES (263, 2, 2, 'Que font 2 brosses à dents le 14 Juillet?', 'Un feu dentifrice!', 5);
INSERT INTO public.jokes VALUES (264, 2, 2, 'Qu''est-ce qui est plus fort qu''un lion?', 'Deux lions.', 5);
INSERT INTO public.jokes VALUES (265, 2, 2, 'Qu''est-ce qu''un petit cheval dans une piscine?', 'Un poney de bain.', 5);
INSERT INTO public.jokes VALUES (266, 2, 2, 'Pourquoi le ciel est si haut?', 'Pour que les oiseaux ne se cognent pas la tête.', 5);
INSERT INTO public.jokes VALUES (267, 2, 2, 'Qui s''occupe de la décoration à l''Elysée?', 'Le ministère de l''intérieur', 5);
INSERT INTO public.jokes VALUES (268, 2, 2, 'Pourquoi les indiens mettent-ils leur argent en bourse?', 'Car ça rapporte des sioux.', 5);
INSERT INTO public.jokes VALUES (269, 2, 2, 'Quel est le comble pour un dentiste?', 'C''est d''habiter dans un palais.', 5);
INSERT INTO public.jokes VALUES (270, 2, 2, 'Qu''est-ce qu''un euro dans un avion qui décolle?', 'Une pièce montée...', 5);
INSERT INTO public.jokes VALUES (271, 2, 2, 'Quel est le comble de Buzz?', 'D''aller plus vite que l''éclair. ', 5);
INSERT INTO public.jokes VALUES (272, 2, 2, 'Que fait un gros poussin?', 'PIOU-PIOU', 5);
INSERT INTO public.jokes VALUES (273, 2, 2, 'Pourquoi les bots ne parlent pas avec les humains?', 'Par peur de leur ressembler.', 5);
INSERT INTO public.jokes VALUES (274, 2, 2, 'Pourquoi les coquilles ne font pas de régime?', 'Parce qu''elles sont palourdes!', 5);
INSERT INTO public.jokes VALUES (275, 2, 2, 'Qu''est-ce qu''un pruneau?', 'Un synonyme de personne âgée : qui est ridée et qui fait chier.', 5);
INSERT INTO public.jokes VALUES (276, 2, 2, 'Qu''est-ce qu''oune péniche?', 'C''est oune zizi portouguaiche.', 5);
INSERT INTO public.jokes VALUES (277, 2, 2, 'Les parents sont deux êtres qui t''apprennent à marcher et à parler...', 'Pour ensuite te dire de t''asseoir et de fermer ta gueule.', 5);
INSERT INTO public.jokes VALUES (278, 2, 2, 'L''autobus est une invention géniale!', 'Il roule deux fois plus vite quand tu cours après que quand t''es assis dedans.', 5);
INSERT INTO public.jokes VALUES (279, 2, 2, 'Les ciseaux à bois...', 'Les chiens aussi.', 5);
INSERT INTO public.jokes VALUES (280, 2, 2, 'Qu''est-ce que le Gospel?', 'C''est quand ton gamin a pris un coup de soleil.', 5);
INSERT INTO public.jokes VALUES (281, 2, 2, 'Qu''est-ce que la beauté intérieure?', 'Un concept inventé par les moches pour pouvoir se reproduire.', 5);
INSERT INTO public.jokes VALUES (282, 2, 2, 'Que fait un hibou dans une bibliotheque?', 'Hibouqine!', 5);
INSERT INTO public.jokes VALUES (283, 2, 2, 'Avez-vous déjà eu des sentiments partagés ? ', 'Genre quand ta belle mère recule vers le ravin avec ta voiture toute neuve.', 5);
INSERT INTO public.jokes VALUES (284, 2, 2, 'Quel est le comble pour un arabe?', 'Se faire voler.', 5);
INSERT INTO public.jokes VALUES (285, 2, 2, 'Maman, où est mon perroquet?', 'Au quai.', 5);
INSERT INTO public.jokes VALUES (286, 2, 2, 'Pourquoi mon ordinateur ne marche plus ? Qu''as-tu fais?', 'Vu qu''il était sale je l''ai nettoyé avec de l''eau.', 5);
INSERT INTO public.jokes VALUES (287, 2, 2, 'Quand est-ce que les chiens aboient?', 'Lorsqu''ils ont un chat dans la gorge.', 5);
INSERT INTO public.jokes VALUES (288, 2, 2, 'Comment un développeur tente-t-il de réparer sa voiture lorsqu''elle a un problème?', 'Il sort de la voiture, ferme toutes les fenêtres, retourne dans la voiture, et essaie de redémarrer.', 5);
INSERT INTO public.jokes VALUES (289, 2, 2, 'Que dit un égoïste qui veut partager?', 'On fait moi-moi.', 5);
INSERT INTO public.jokes VALUES (290, 2, 2, 'Qu''est-ce que deux fous avec des mitraillettes?', 'Une fousillade.', 5);
INSERT INTO public.jokes VALUES (291, 2, 2, 'Que dit le juge au manchot?', 'Allez allez, témoignons!', 5);
INSERT INTO public.jokes VALUES (292, 2, 2, 'Tu connais la blague du con qui dit non?', 'Non...', 5);
INSERT INTO public.jokes VALUES (293, 2, 2, 'Quel est le comble pour un plombier?', 'Que ses clients prennent la fuite!', 5);
INSERT INTO public.jokes VALUES (294, 2, 2, '2 fesses se croisent', 'Alors, ça gaze?', 5);
INSERT INTO public.jokes VALUES (295, 2, 2, 'Où est fabriqué le viagra?', 'Au Boukistan', 5);
INSERT INTO public.jokes VALUES (296, 2, 2, 'Qu''est-ce qu''une gifle?', 'C''est comme une bifle, mais avec la main!', 5);
INSERT INTO public.jokes VALUES (297, 2, 2, 'Pourquoi j''ai appelé mon pénis Bidou?', 'Parce que quand je vais pisser, je s''coue Bidou.', 5);
INSERT INTO public.jokes VALUES (298, 2, 2, 'Quel est le seul instrument à vent avec une corde?', 'Le string.', 5);
INSERT INTO public.jokes VALUES (299, 2, 2, 'Quand 2 poissons s''énervent..', 'Est-ce qu''on peut dire que le thon monte?', 5);
INSERT INTO public.jokes VALUES (300, 2, 2, 'Pourquoi les hommes amènent-ils leur femme en vacances?', 'Pour que les vacances paraissent plus longues...', 5);
INSERT INTO public.jokes VALUES (301, 2, 2, 'Que fait Jean quand il voit une femme crocodile?', 'Il lacoste!', 5);
INSERT INTO public.jokes VALUES (302, 2, 2, 'Qu''est-ce qui commence par un E, finit par un E et qui ne contient qu''une lettre?', 'Une enveloppe!', 5);
INSERT INTO public.jokes VALUES (303, 2, 2, 'Qu''est-ce qui se lève quand tu t''en sers, qui s''abaisse quand tu as fini de t''en servir et qui goutte après usage?', 'Un parapluie', 5);
INSERT INTO public.jokes VALUES (304, 2, 2, 'Babi et Baba sont sur un bateau Baba tombe à l''eau. Que se passe-t-il?', 'Babi bêle et Baba coule', 5);
INSERT INTO public.jokes VALUES (305, 2, 2, 'Que s''est il passé en 1769 ? Napoléon est né! Et que s''est il passé en 1789?', 'Il a eu 20 ans!', 5);
INSERT INTO public.jokes VALUES (306, 2, 2, 'Rien ne sert de courir...', '... Je suis déjà en retard.', 5);
INSERT INTO public.jokes VALUES (307, 2, 2, 'Quand mon verre est plein, je le vide', 'Quand mon verre est vide, je me plains!', 5);
INSERT INTO public.jokes VALUES (308, 2, 2, 'Attention au chien!', 'Il est si petit que vous pourriez marcher dessus.', 5);
INSERT INTO public.jokes VALUES (309, 2, 2, 'Ne pas déranger svp', 'Je n''ai pas rangé pour rien... ', 5);
INSERT INTO public.jokes VALUES (310, 2, 2, 'Merci de ne pas frapper', 'Et soyez gentil, de ne pas sonner non plus', 5);
INSERT INTO public.jokes VALUES (311, 2, 2, 'N''hésitez pas à demander si la maison fait crédit!', 'Nous avons une façon absolument délicieuse de refuser.', 5);
INSERT INTO public.jokes VALUES (312, 2, 2, 'Sur ce serveur le 12 mai 2020.', 'Il ne se passa strictement rien.', 5);
INSERT INTO public.jokes VALUES (313, 2, 2, 'Pourquoi la girafe se fait arrêter par la police?', 'Parce que c''est un cou-monté!', 5);
INSERT INTO public.jokes VALUES (314, 2, 2, 'Pourquoi les coccinelles n''aiment-elles pas courir?', 'Parce qu''elles ont toujours des points de cotés!', 5);
INSERT INTO public.jokes VALUES (315, 2, 2, 'On ne dit pas démanger', 'On dit vomir.', 5);
INSERT INTO public.jokes VALUES (316, 2, 2, 'Que disait Eve pour faire avancer le bâteau?', 'Ramadan', 5);
INSERT INTO public.jokes VALUES (317, 2, 2, 'Que signifie expatriées?', 'Anciennes petites amies non rangées.', 5);
INSERT INTO public.jokes VALUES (318, 2, 2, 'Qui est l''idiot qui a créé la cédille?', 'Monsieur Duçon', 5);
INSERT INTO public.jokes VALUES (319, 2, 2, 'Que signifie Mercato?', 'C''est une maman pratiquante.', 5);
INSERT INTO public.jokes VALUES (320, 2, 2, 'Tu sais ce que c''est un suppositoire?', 'C''est une invention qui restera dans les annales.', 5);
INSERT INTO public.jokes VALUES (321, 2, 2, 'Les pharmacies...', '... c''est les confiseries des vieux.', 5);
INSERT INTO public.jokes VALUES (322, 2, 2, 'Une jardinerie est un endroit merveilleux!', 'Si tu te prends trois râteaux on t''offre une pelle.', 5);
INSERT INTO public.jokes VALUES (323, 2, 2, 'Pourquoi Toto veut se marier avec la mère de son père?', 'Ben son père s''est bien marié avec la sienne...', 5);
INSERT INTO public.jokes VALUES (324, 2, 2, 'Que demande un chat dans une pharmacie?', 'Avez-vous du sirop pour ma toux?', 5);
INSERT INTO public.jokes VALUES (325, 2, 2, 'Que faisaient les dinosaures quand ils n''arrivaient pas à se décider?', 'Des tirageosaures.', 5);
INSERT INTO public.jokes VALUES (326, 2, 2, 'Quelle est la différence entre un Courtier de Wall Street et un Acteur Porno?', 'Le courtier a des actions en bourse alors que l''acteur à les bourses en action.', 5);
INSERT INTO public.jokes VALUES (327, 2, 2, 'Pourquoi est-ce qu''on met tous les crocos en prison?', 'Parce que les crocos dealent.', 5);
INSERT INTO public.jokes VALUES (328, 2, 2, 'Quel est le jambon que tout le monde déteste?', 'Le sale ami.', 5);
INSERT INTO public.jokes VALUES (329, 2, 2, 'Que dit un éléphant sans corne?', 'Je suis sans défense.', 5);
INSERT INTO public.jokes VALUES (330, 2, 2, 'Quelle est la différence entre toi et un sapin?', 'Un sapin c''est un conifère et toi t''es con et on peut rien y faire.', 5);
INSERT INTO public.jokes VALUES (331, 2, 2, 'Ta mère est tellement grosse', 'Que quand elle sort y a une éclipse.', 5);
INSERT INTO public.jokes VALUES (332, 2, 2, 'Tout est bon dans le cochon!', 'Je ne mangerai pas ta mère pour autant.', 5);
INSERT INTO public.jokes VALUES (333, 2, 2, 'Vous saviez que la famille Le Pen a du sang arabe?', 'Sur le capot de leur voiture...', 5);
INSERT INTO public.jokes VALUES (334, 2, 2, 'Quelle est l''émission TV préférée des jardiniers constipés?', 'Silence ça pousse.', 5);
INSERT INTO public.jokes VALUES (335, 2, 2, 'Qu''est-ce qu''une frite enceinte?', 'Une patate sautée.', 5);
INSERT INTO public.jokes VALUES (336, 2, 2, 'Que dit un coronavirus quand il braque une banque?', 'Donner moi l''argent, sinon je fais toussoter!', 5);
INSERT INTO public.jokes VALUES (337, 2, 2, 'Qu''est-ce qu''un homme avec une mitraillette dans un champ de blé?', 'Un céréales killer.', 5);
INSERT INTO public.jokes VALUES (338, 2, 2, 'Peux-tu me dire si le clignotant fonctionne?', 'Oui, non, oui, non, oui, non.', 5);
INSERT INTO public.jokes VALUES (339, 2, 2, 'Quel est le meilleur site pour un homme qui cherche un lave-vaisselle?', 'Un site de rencontres.', 5);
INSERT INTO public.jokes VALUES (340, 2, 2, 'Quel est le point commun entre la poitrine d''une femme et un train électrique?', 'C''est fait pour les enfants mais c''est papa qui joue avec.', 5);
INSERT INTO public.jokes VALUES (341, 2, 2, 'Que dit une bière quand elle tombe dans l''eau?', 'Je sais panaché', 5);
INSERT INTO public.jokes VALUES (342, 2, 2, 'Deux pommes de terre traversent la route, l''une d''elles se fait écraser', 'Oh purée!', 5);
INSERT INTO public.jokes VALUES (343, 2, 2, 'C''est en forgeant qu''on devient forgeron.', 'Et c''est en sciant que Léonard devint scie!', 5);
INSERT INTO public.jokes VALUES (344, 2, 2, 'Jésus a marché sur l''eau. Une courgette est composé a 98% d''eau. J''ai marché sur une courgette.', 'Je suis à 98% Jésus.', 5);
INSERT INTO public.jokes VALUES (345, 2, 2, 'Quelle est la différence entre Jésus et un tableau de Picasso?', 'Le tableau s''accroche avec un seul clou.', 5);
INSERT INTO public.jokes VALUES (346, 2, 2, 'Quel oiseau est attiré par le miel?', 'L''autruche car à coter il y a une aut''ruche.', 5);
INSERT INTO public.jokes VALUES (347, 2, 2, 'Qu''est-ce qu''un tennisman adore faire?', 'Rendre des services!', 5);
INSERT INTO public.jokes VALUES (348, 2, 2, 'Comment appelle-t-on six prostituées Allemandes?', 'Une scie sauteuse Bosch', 5);
INSERT INTO public.jokes VALUES (349, 2, 2, 'Quel est le point commun entre un camp de concentration et une maison de retraite?', 'Dans les deux cas, les pensionnaires n''en ressortent pas vivants.', 5);
INSERT INTO public.jokes VALUES (350, 2, 2, 'La vie s''est comme une boîte de chocolat!', 'Ça dure moins longtemps chez les gros!', 5);
INSERT INTO public.jokes VALUES (351, 2, 2, 'Pourquoi les pharaons ont ils 2 fesses?', 'Parce que AnuBis!', 5);
INSERT INTO public.jokes VALUES (352, 2, 2, 'Quelle est la différence entre un marin et un boucher?', 'Le boucher voit le porc avant les côtes.', 5);
INSERT INTO public.jokes VALUES (353, 2, 2, 'Une jeune soupçonnée de sorcellerie demande à sa mère : "Pourquoi est-ce qu''on flotte ?"', '"Pour la même raison qu''on brûle."', 5);
INSERT INTO public.jokes VALUES (354, 2, 2, 'Comment appelle t-on un chat dans l''espace?', 'Un chatellite.', 5);
INSERT INTO public.jokes VALUES (355, 2, 2, 'Qu''est-ce qu''un cochon volant?', 'Un aéroport.', 5);
INSERT INTO public.jokes VALUES (356, 2, 2, 'Quel est le comble pour un porte-charge?', 'C''est de mal se porter.', 5);
INSERT INTO public.jokes VALUES (357, 2, 2, 'Pourquoi méprises-tu les canards?', 'Parce qu''à chaque fois que je vais au coin ils se moquent de moi.', 5);
INSERT INTO public.jokes VALUES (358, 2, 2, 'Quel est le point commun entre un mauvais musicien et un cancre?', 'Les deux ont de mauvaises notes.', 5);
INSERT INTO public.jokes VALUES (359, 2, 2, 'Les peintres utilisent, de l''imagination, de la créativité et...', 'De la peinture.', 5);
INSERT INTO public.jokes VALUES (360, 2, 2, 'Une mère demande à son fils : quel est ton animal préféré?', 'Le zébu parce qu''on a un point commun.', 5);
INSERT INTO public.jokes VALUES (361, 2, 2, 'Que fait un oiseau au dessus d''un camp de concentration?', 'Cuit Cuit!', 5);
INSERT INTO public.jokes VALUES (362, 2, 2, 'Mr et madame Sop ont un fils comment s''appelle-t-il?', 'Alain', 5);
INSERT INTO public.jokes VALUES (363, 2, 2, 'Deux belges se déplacent dans le désert en tenant une portière...', 'J''ai trop chaud ouvre la fenêtre s''il te plaît.', 5);
INSERT INTO public.jokes VALUES (364, 2, 2, 'Dieu créa la France, un trop beau pays, de belles formes, la mer, l''océan, les montagnes...', 'Alors pour compenser il a créé le français', 5);
INSERT INTO public.jokes VALUES (365, 2, 2, 'Ma b*te, je l''ai appelée la vie.', 'Parce que la vie est dure...', 5);
INSERT INTO public.jokes VALUES (366, 2, 2, 'Qu''est-ce qui est pire qu''un meurtrier?', 'Un policier fanatique.', 5);
INSERT INTO public.jokes VALUES (367, 2, 2, 'Je suis Tintin, mais je ne suis pas Tintin. Qui suis-je?', 'Milou.', 5);
INSERT INTO public.jokes VALUES (368, 2, 2, 'Le concombre est conseillé pour améliorer sa mémoire.', 'Car si on te le met dans le cul, t''es pas prêt de l''oublier.', 5);
INSERT INTO public.jokes VALUES (369, 2, 2, 'Que disent deux mouettes lorsqu''elles veulent partager quelque chose?', '"On fait mouette-mouette ?"', 5);
INSERT INTO public.jokes VALUES (370, 2, 2, 'Que font 1+2-1x2?', 'Le nombre de jambe d''un manchot.', 5);
INSERT INTO public.jokes VALUES (371, 2, 2, 'Quelle est la différence entre des pizzas et des juifs?', 'Le temps de cuisson.', 5);
INSERT INTO public.jokes VALUES (372, 2, 2, 'Quelle est la pire musique pour les juifs?', 'En feu, Soprano.', 5);
INSERT INTO public.jokes VALUES (373, 2, 2, 'Quelle est la vitesse maximale autorisée lors d''un rapport?', '68km/h car à 69..... Ça fait une tête à queue.', 5);
INSERT INTO public.jokes VALUES (374, 2, 2, 'Prof des biologie : "Que trouve-t-on dans une cellule ?"', 'Des arabes et des noirs!', 5);
INSERT INTO public.jokes VALUES (375, 2, 2, 'Quel est le meilleur ami d''un grand-père?', 'Le potager.', 5);
INSERT INTO public.jokes VALUES (376, 2, 2, 'Que dit-on en Afrique quand un lieu est bondé?', 'Il est noir de monde...', 5);
INSERT INTO public.jokes VALUES (377, 2, 2, 'Quelle est l''insulte la plus utilisée en 1940 après le traité de Vichy?', 'Pétain', 5);
INSERT INTO public.jokes VALUES (378, 2, 2, 'Tu as aucune référence....', 'Peut-être car je suis pas à vendre!', 5);
INSERT INTO public.jokes VALUES (379, 2, 2, 'Quelle est la tarte préférée des putes?', 'La tarte catin', 5);
INSERT INTO public.jokes VALUES (380, 2, 2, 'Un français et un arabe sont sur le toît d''un immeuble. Lequel saute en premier?', 'L''immeuble', 5);
INSERT INTO public.jokes VALUES (381, 2, 2, 'Monsieur et madame Cale ont un fils, comment s''appelle t-il?', 'Medhi', 5);
INSERT INTO public.jokes VALUES (382, 2, 2, 'Maman, maman, je ne veux plus dormir avec mon petit frère.', 'Tais-toi! Je t''ai déjà dit qu''on avait pas assez d''argent pour l''enterrer.', 5);
INSERT INTO public.jokes VALUES (383, 2, 2, 'J''ai eu un rencard avec une juive, elle m''a demandé mon numéro', 'J''lui ai répondu que nous on avait des noms', 5);
INSERT INTO public.jokes VALUES (384, 2, 2, 'Connaissez-vous le slogan "ça fait du bien par où ça passe"?', 'C''est une pub de suppositoires je crois...', 5);
INSERT INTO public.jokes VALUES (385, 2, 2, 'Qu''est-ce qui sépare l''espèce humaine du singe?', 'La mer Méditerranée.', 5);
INSERT INTO public.jokes VALUES (386, 2, 2, 'Que disent deux fesses sur un bateau?', 'Dis donc ça commence à ramer du cul.', 5);
INSERT INTO public.jokes VALUES (387, 2, 2, 'Un médecin félicite le mari d''un couple pour le nouveau né. La femme demande au médecin pourquoi elle n''est pas félicitée.', 'Quand un plat est réussi, on félicite le cuisinier pas le four!', 5);
INSERT INTO public.jokes VALUES (388, 2, 2, 'Mon plus grand défaut est l''honnêteté... Vous pensez le contraire?', 'J''en ai rien à foutre de ce que vous pensez', 5);
INSERT INTO public.jokes VALUES (389, 2, 2, 'Que chante un juif devant un feu de camp?', '"Vous les copains je ne vous oublierai jamais!"', 5);
INSERT INTO public.jokes VALUES (390, 2, 2, 'De quelle couleur est le cheval blanc d''Henri IV?', 'Jaune, car il s''est pissé dessus.', 5);
INSERT INTO public.jokes VALUES (391, 2, 2, 'J''ai lu un livre de Victor Hugo.', 'Il ne devait pas boire que du Fanta à l''apéro celui là...', 5);
INSERT INTO public.jokes VALUES (392, 2, 2, 'Ce n''est pas bien de regarder sous les jupes des filles.', 'Il faut regarder sous la culotte.', 5);
INSERT INTO public.jokes VALUES (393, 2, 2, 'Quelle est la résolution d''un informaticien pour la nouvelle année?', 'Un 19" pouces.', 5);
INSERT INTO public.jokes VALUES (394, 2, 2, 'Un homme à l''hôpital dit à son infirmière : Vous êtes mon infirmière préférée, voudriez-vous passer me voir quand je serai sorti de l''hôpital?', 'Je suis désolée, mais j''ai horreur des cimetières!', 5);
INSERT INTO public.jokes VALUES (395, 2, 2, 'Je me présente, je suis Tamayo.', 'Et lui c''est Monketchup?', 5);
INSERT INTO public.jokes VALUES (396, 2, 2, 'Un juif est dans un ascenseur. Soudain, l''homme à côté de lui lâche un gros pet. Le juif le regarde l''air choqué.', 'Oh, ça va! C''est du gaz, ça n''a jamais tué personne!', 5);
INSERT INTO public.jokes VALUES (397, 2, 2, 'Comment appelle t''on le penis d''un prètre?', 'La vérite car la vérite sort toujours de la bouche des enfants.', 5);
INSERT INTO public.jokes VALUES (398, 2, 2, 'Que fait un développeur quand il a peur?', 'Il csharpe.', 5);
INSERT INTO public.jokes VALUES (399, 2, 2, 'Où doit-on prendre le bus pour aller au cimetière?', 'En pleine gueule.', 5);
INSERT INTO public.jokes VALUES (400, 2, 2, 'Ce matin, je me suis levé avec l''envie de tout changer', 'Du coup j''ai changé d''avis et je me suis rendormi.', 5);
INSERT INTO public.jokes VALUES (401, 2, 2, 'Quelle est la marque de biscuit préférée de Brigitte Macron?', 'Les petits écoliers.', 5);
INSERT INTO public.jokes VALUES (402, 2, 2, 'Comment dire boujour à un juif?', 'Hey! Ca gaz?', 5);
INSERT INTO public.jokes VALUES (403, 2, 2, 'Pourquoi personne ne sait nager au Maroc?', 'Par ce que tous ceux qui savent, sont déjà en France.', 5);
INSERT INTO public.jokes VALUES (404, 2, 2, 'Un noir va aux toilettes et en ressort blanc, qu''a t''il fait?', 'Il a chié sa race.', 5);
INSERT INTO public.jokes VALUES (405, 2, 2, 'Qu''est-ce que deux sourds qui se battent?', 'Un malentendu.', 5);
INSERT INTO public.jokes VALUES (406, 2, 2, 'On m''a toujours dit que Mozart était mort. ', 'Pourtant, à chaque fois que j''ouvre mon frigo, Mozart est là... ', 5);
INSERT INTO public.jokes VALUES (407, 2, 2, 'J''ai 36 têtes, 28 bras et 12 jambes, qui suis-je?', 'Un mythomane.', 5);
INSERT INTO public.jokes VALUES (408, 2, 2, 'Que fait un zoophile qui veut sauter?', 'Il prend son élan.', 5);
INSERT INTO public.jokes VALUES (409, 2, 2, 'Comment reconnait-on un aveugle sur une plage naturiste?', 'C''est pas dur!', 5);
INSERT INTO public.jokes VALUES (410, 2, 2, 'Pourquoi les tirelires sont en forme de cochon?', 'Pour que les arabes n''y touchent pas.', 5);
INSERT INTO public.jokes VALUES (411, 2, 2, 'J''ai vu un enfant sur un vélo, j''ai cru que c''était le mien donc je suis allé vérifier dans le garage...', 'Mais je me suis trompé, il était toujours là, enchaîné, à réclamer à boire et à manger.', 5);
INSERT INTO public.jokes VALUES (412, 2, 2, 'Que fait on après avoir serré la main d''un lépreux?', 'On la lui rend.', 5);
INSERT INTO public.jokes VALUES (413, 2, 2, 'Pourquoi New-York ne peut pas jouer aux échecs?', 'Parce qu''il lui manque deux tours.', 5);
INSERT INTO public.jokes VALUES (414, 2, 2, 'Pourquoi Paris ne peut pas jouer aux échecs?', 'Parce qu''il lui manque la Dame.', 5);
INSERT INTO public.jokes VALUES (415, 2, 2, 'Que fait un prêtre après avoir sodomisé un chauve?', 'Il le repose dans son berceau.', 5);
INSERT INTO public.jokes VALUES (416, 2, 2, 'Pourquoi c''est plus long de faire un bonhomme de neige blonde?', 'Parce qu''il faut vider la tête.', 5);
INSERT INTO public.jokes VALUES (417, 2, 2, 'Combien faut il de blonde pour visser une ampoule?', 'Une qui tien l''ampoule, et quatre qui font tourner la blonde.', 5);
INSERT INTO public.jokes VALUES (418, 2, 2, 'Bon on joue au poker ou on s''encule?', 'Perso j''aime pas trop le poker alors...', 5);
INSERT INTO public.jokes VALUES (419, 2, 2, 'Mon Chat est mort... Je voudrais tellement en avoir un autre pareil!', 'Mais qu''est-ce que tu ferais de deux chats morts?', 5);
INSERT INTO public.jokes VALUES (420, 2, 2, 'Quel est l''avantage d''être Chinois?', 'De pouvoir acheter local n''importe où.', 5);
INSERT INTO public.jokes VALUES (421, 2, 2, 'Que faisait les parents de Gilbert Montagne pour le punir?', 'Il déplaçaient les meubles', 5);
INSERT INTO public.jokes VALUES (422, 2, 2, 'Comment s''appelle la femelle du hamster?', 'Amsterdam', 5);
INSERT INTO public.jokes VALUES (423, 2, 2, 'Comment est mort capitaine Crochet?', 'En se grattant les couilles!', 5);
INSERT INTO public.jokes VALUES (424, 2, 2, 'Comment nintendo ont fait leurs consoles?', 'Ils ont demandé à une déesse, puis à deux, puis à trois...', 5);
INSERT INTO public.jokes VALUES (425, 2, 2, 'Que fait un cendrier devant un ascenseur?', 'Il veut des cendres', 5);
INSERT INTO public.jokes VALUES (426, 2, 2, 'Que dit une noisette quand elle tombe à l''eau?', 'Je me noix!', 5);
INSERT INTO public.jokes VALUES (427, 2, 2, 'Que faire lorsqu''on trouve un épileptique en crise dans une baignoire?', 'Ajouter de la lessive et y jeter son linge sale.', 5);
INSERT INTO public.jokes VALUES (428, 2, 2, 'Papa, papa, j''aime pas grand mère...', 'Bein tu n''as qu''à la laisser sur le bord de l''assiette.', 5);
INSERT INTO public.jokes VALUES (429, 2, 2, 'Maman, maman papa s''est pendu dans le jardin!', 'Poisson d''avril! Il s''est pendu dans le grenier!', 5);
INSERT INTO public.jokes VALUES (430, 2, 2, 'Qu''est-ce qui est vert et qui pue?', 'Un scout mort au fond d''un bois.', 5);
INSERT INTO public.jokes VALUES (431, 2, 2, 'De quelle couleur sont tes yeux?', '#1292f4 et toi?', 5);
INSERT INTO public.jokes VALUES (432, 2, 2, 'Il y a 10 types de gens dans le monde.', 'Ceux qui parlent binaire, et les autres.', 5);
INSERT INTO public.jokes VALUES (433, 2, 2, 'Que fait un développeur s''il veut se marier?', 'Une fille en C', 5);
INSERT INTO public.jokes VALUES (434, 2, 2, 'Une blonde et une brune se jettent en bas d''un immeuble de dix étages. Laquelle atteint le sol en premier?', 'La brune, parce que la blonde s''est perdue en chemin.', 5);
INSERT INTO public.jokes VALUES (435, 2, 2, 'Quel est le comble pour un chauve?', 'C''est d''avoir un cheveu sur la langue!', 5);
INSERT INTO public.jokes VALUES (436, 2, 2, 'Comment appelle t''on une innondation en Afrique?', 'Un bol de Chocapic.', 5);
INSERT INTO public.jokes VALUES (437, 2, 2, 'À quoi sert Internet Explorer?', 'À télécharger Google Chrome.', 5);
INSERT INTO public.jokes VALUES (438, 2, 2, 'Tu sais pourquoi l''iPhone 6 se plie?', 'Parce que l''Apple Store.', 5);
INSERT INTO public.jokes VALUES (439, 2, 2, 'Comment on appelle un mec qui répare des tablettes Microsoft?', 'Un technicien de surface.', 5);
INSERT INTO public.jokes VALUES (440, 2, 2, 'Pourquoi dit-on que les poissons travaillent illégalement?', 'Parce qu''ils n''ont pas de FISH de paie.', 5);
INSERT INTO public.jokes VALUES (441, 2, 2, 'Quel est le bar préféré des espagnols?', 'Le bar Celone.', 5);
INSERT INTO public.jokes VALUES (442, 2, 2, 'Pourquoi est-ce que les vêtements sont toujours fatigués quand ils sortent de la machine?', 'Parce qu''ils sont lessivés.', 5);
INSERT INTO public.jokes VALUES (443, 2, 2, 'Pourquoi est-ce que les livres ont-ils toujours chaud?', 'Parce qu''ils ont une couverture', 5);
INSERT INTO public.jokes VALUES (444, 2, 2, 'Qu''est-ce qui est pire que de doigter sa sœur?', 'Y trouver l''alliance de son père.', 5);
INSERT INTO public.jokes VALUES (445, 2, 2, 'Qui chante le mieux lors d''une tempête?', 'Storm Maé', 5);
INSERT INTO public.jokes VALUES (446, 2, 2, 'Qu''est-ce qui est vert, rouge et qui va à 200 km/h?', 'Une grenouille dans un mixeur.', 5);
INSERT INTO public.jokes VALUES (447, 2, 2, 'Que met un développeur sur sa voiture en hiver?', 'Une bash.', 5);
INSERT INTO public.jokes VALUES (448, 2, 2, 'Hier, j''ai espionné un pote pour savoir son MDP, après quelques coups d''oeil je le vois taper "PÉNIS"...', 'Le PC l''a jugé "Trop court"...', 5);
INSERT INTO public.jokes VALUES (449, 2, 2, 'Comment appelle t''on un chat compressé?', 'Un Kitkat.', 5);
INSERT INTO public.jokes VALUES (450, 2, 2, 'Comment réparer un téléphone tombé à l''eau?', 'Vous le recouvrez de riz dans une boîte hermétique puis laissez passer une nuit, pendant votre sommeil, de petits chinois, attirés par le riz, viendront réparer votre téléphone!', 5);
INSERT INTO public.jokes VALUES (451, 2, 2, 'Quelle est la différence entre un cendrier et une théière?', 'Le cendrier c''est pour des cendres, la théière, c''est pour mon thé.', 5);
INSERT INTO public.jokes VALUES (452, 2, 2, 'Comment avoir 1 million de followers en Afrique?', 'Suffit de courir avec une bouteille d''eau.', 5);
INSERT INTO public.jokes VALUES (453, 2, 2, 'Pourquoi les chinois ne croient pas au Père Noël?', 'Car c''est eux qui font les jouets.', 5);
INSERT INTO public.jokes VALUES (454, 2, 2, 'Quelle est la différence entre un livre et un arabe?', 'Le livre a ses papiers.', 5);
INSERT INTO public.jokes VALUES (455, 2, 2, 'Tous les signes astrologiques ont des cheveux!', 'Sauf le cancer...', 5);
INSERT INTO public.jokes VALUES (456, 2, 2, 'Quelle est la différence entre un bébé et un oignon?', 'Pour l''oignon j''ai pleuré quand je l''ai découpé', 5);
INSERT INTO public.jokes VALUES (457, 2, 2, 'Un jour quelqu''un a dit à Inch d''aller à Marrakech...', 'Et Inch alla!', 5);
INSERT INTO public.jokes VALUES (458, 2, 2, 'Comment appelle-t-on une vache qui joue de la musique?', 'Une meeuhsiciene.', 5);
INSERT INTO public.jokes VALUES (459, 2, 2, 'Qu''est-ce qui est mieux que de gagner une médaille d''or aux jeux paralympiques?', 'Marcher.', 5);
INSERT INTO public.jokes VALUES (460, 2, 2, 'Avec quoi fait-on sortir un bébé d''un mixeur?', 'Une paille.', 5);
INSERT INTO public.jokes VALUES (461, 2, 2, 'Monsieur et madame China ont un fils, comment s''appelle t-il?', 'Medhi', 5);
INSERT INTO public.jokes VALUES (462, 2, 2, 'Pourquoi Mickael ouvre la porte?', 'Parce que Jack-sonne!', 5);
INSERT INTO public.jokes VALUES (463, 2, 2, 'M et Mme Bombeurre ont un fils comment s''appelle t-il?', 'Jean', 5);
INSERT INTO public.jokes VALUES (464, 2, 2, 'Comment appelle-t-on un crime qui a été commis dans la neige?', 'Un ice cream!', 5);
INSERT INTO public.jokes VALUES (465, 2, 2, 'Spiderman grimpe au dessus des murs, Superman vole au dessus...', 'Et musulman les explose!', 5);
INSERT INTO public.jokes VALUES (518, 2, 2, 'Quelle est la différence entre ma femme et mon cancer.', 'Mon cancer, je ne l''ai toujours pas battu.', 5);
INSERT INTO public.jokes VALUES (466, 2, 2, 'Une blonde appelle son copain: "Je n''arrive pas à démarrer la voiture!"', 'Je te l''ai déjà dis cent fois que, lorsque ce n''est pas moi qui conduit, tu dois te mettre à gauche!', 5);
INSERT INTO public.jokes VALUES (467, 2, 2, 'Pourquoi tous les magiciens sont blanc?', 'Parce que la magie noir est interdite!', 5);
INSERT INTO public.jokes VALUES (468, 2, 2, 'Ne faites pas l''amour dans votre jardin, l''amour est aveugle...', 'Mais pas votre voisin.', 5);
INSERT INTO public.jokes VALUES (469, 2, 2, 'Un mec demande à son pote : "Comment faire pour ne pas commettre les mêmes erreur que mes parents ?"', 'Mets toujours un préservatif!', 5);
INSERT INTO public.jokes VALUES (470, 2, 2, 'Un femme dis à son mari : "Je vais faire les courses, demain c''est l''anniversaire de ma mère, tu aurais une idée d''appareil électrique à lui offrir ?"', 'Pourquoi pas une chaise?', 5);
INSERT INTO public.jokes VALUES (471, 2, 2, 'J''ai suivis deux régimes en même temps...', 'J''mangeais pas assez avec un seul!', 5);
INSERT INTO public.jokes VALUES (472, 2, 2, 'Le soir, un homme lis le journal et dit à sa femme : Dis c''est chaud quand même, une femme s''est faite baiser par 100 personnes, mais où va le monde ? Et sa femme répond : ', 'Bah dans son cul.', 5);
INSERT INTO public.jokes VALUES (473, 2, 2, 'Toto si je te donne 50 gâteaux et tu en manges 48 tu as donc?', 'Mal au ventre!', 5);
INSERT INTO public.jokes VALUES (474, 2, 2, 'Pourquoi les juifs sont-ils toujours propre?', 'Parce qu''ils prennent des douches!', 5);
INSERT INTO public.jokes VALUES (475, 2, 2, 'Quelle est la différence entre un catcheur et un développeur javascript?', 'Le catcheur fait des techniques de catch et le développeur fait des .catch techniques', 5);
INSERT INTO public.jokes VALUES (476, 2, 2, 'Un enfant cannibale reste toujours dans son coin. La maîtresse lui demande : "Pourquoi ne joues-tu pas avec les autres enfants ?"', 'Parce que mon père m''a dit de ne pas jouer avec la nourriture.', 5);
INSERT INTO public.jokes VALUES (477, 2, 2, 'Pourquoi Hulk a-t-il un beau jardin?', 'Parce qu''il a la main verte.', 5);
INSERT INTO public.jokes VALUES (478, 2, 2, 'Un avaleur de sabres entre dans une mercerie : "Bonjour, je voudrais des aiguilles.", à cela elle répond: "Ah, vous faites de la couture ?"', 'Non, je fais un régime!', 5);
INSERT INTO public.jokes VALUES (479, 2, 2, 'Pourquoi rejoindre le côté obscure de la force?', 'Parce qu''ils ont des masques et des respirateurs artificiels.', 5);
INSERT INTO public.jokes VALUES (480, 2, 2, 'Pourquoi est-ce que les fainéants n''ont pas de raison de ne rien faire?', 'Ils ont la flemme d''en trouver.', 5);
INSERT INTO public.jokes VALUES (481, 2, 2, 'Comment un parachutiste aveugle sait-il qu''il va bientôt atterrir?', 'Lorsqu''il s''aperçoit y a du mou à la laisse de son chien.', 5);
INSERT INTO public.jokes VALUES (482, 2, 2, 'Chéri, préfères-tu les femmes intelligentes ou belles?', 'Aucune, car je n''aime que toi.', 5);
INSERT INTO public.jokes VALUES (483, 2, 2, 'Comment appelle t-on une entreprise dirigée par une blonde?', 'Une Tarte-Up', 5);
INSERT INTO public.jokes VALUES (484, 2, 2, 'Pourquoi trouve on beaucoup de célibataires à Dijon?', 'Parce que l''amour tarde.', 5);
INSERT INTO public.jokes VALUES (485, 2, 2, 'Quelle est la couleur de la grippe?', 'Gris pâle.', 5);
INSERT INTO public.jokes VALUES (486, 2, 2, 'Que donne un mouton et un cochon qui s''accouplent?', 'De la Porcelaine.', 5);
INSERT INTO public.jokes VALUES (487, 2, 2, 'Qu''est-ce qui est tout rouge et qui tape à la vitre en hurlant?', 'Un bébé dans un micro-onde.', 5);
INSERT INTO public.jokes VALUES (488, 2, 2, 'Quelle est la seule et unique différence entre un séducteur et un violeur?', 'La Patience...', 5);
INSERT INTO public.jokes VALUES (489, 2, 2, 'Si un rapeur nique sa mère, que fait un campeur?', 'Il monte sa tante!', 5);
INSERT INTO public.jokes VALUES (490, 2, 2, 'Une blonde téléphone à son copain : "Chéri pourquoi t''as mis le nouveau poisson dans un bocal d''eau ?!"', 'Il va se noyer!', 5);
INSERT INTO public.jokes VALUES (491, 2, 2, 'Quelle est la saison préférée d''un grimpeur?', 'L''hiver, car il pleut des cordes.', 5);
INSERT INTO public.jokes VALUES (492, 2, 2, 'Quel est le rapport entre l''humour noir et l''eau?', 'Tout le monde n''en a pas!', 5);
INSERT INTO public.jokes VALUES (493, 2, 2, 'Tu connais l''homme qui à 5 pénis?', 'Apparemment son slip lui va comme un gant.', 5);
INSERT INTO public.jokes VALUES (494, 2, 2, 'Pourquoi certain pigeons ne savent pas nager.', 'Parce que les pigeons roucoules.', 5);
INSERT INTO public.jokes VALUES (495, 2, 2, 'Une personne appelle la police pour leur dire que deux filles se battaient pour lui. La police lui demande donc quel est le problème.', 'Le garçon répond : "C''est la moche qui gagne!"', 5);
INSERT INTO public.jokes VALUES (496, 2, 2, 'Comment un dev se met-il à jour?', 'Il se met à l''apache.', 5);
INSERT INTO public.jokes VALUES (497, 2, 2, 'Une requête NoSQL entre dans un bar, qu''est-ce qu''elle fait?', 'Elle repart, car il n''y a pas de table.', 5);
INSERT INTO public.jokes VALUES (498, 2, 2, 'Pourquoi des poissons n''arrivent pas à tenir leur entreprise?', 'Parce qu''ils coulent.', 5);
INSERT INTO public.jokes VALUES (499, 2, 2, 'Qu''est-ce qu''un noir dans une salle noir?', 'Deux sales noir.', 5);
INSERT INTO public.jokes VALUES (500, 2, 2, '4 arabes sont dans une voiture, la voiture saute dans l''eau que regrettes-tu?', 'Qu''il y en est pas plus.', 5);
INSERT INTO public.jokes VALUES (501, 2, 2, 'Comment faire rentrer 60 juifs dans une voiture ? ', '2 à l''avant 3 à l''arrière et le reste dans le cendrier.', 5);
INSERT INTO public.jokes VALUES (502, 2, 2, 'Que fait une biscotte tous les soir?', 'Elle va en biscotheque.', 5);
INSERT INTO public.jokes VALUES (503, 2, 2, 'Que mettent les souris pour aller danser?', 'Elles mettent du masque à rat.', 5);
INSERT INTO public.jokes VALUES (504, 2, 2, '"J''apprends mes devoirs", c''est à quel temps, Toto?', 'Du temps perdu Madame.', 5);
INSERT INTO public.jokes VALUES (505, 2, 2, 'Des bombardements se succèdent. Où est allé le petit garçon qui se trouvait sur les lieux?', 'Partout', 5);
INSERT INTO public.jokes VALUES (506, 2, 2, 'Tu connais l''histoire du castré décapité?', 'C''est une histoire sans queue ni tête!', 5);
INSERT INTO public.jokes VALUES (507, 2, 2, 'Quel est le sport le plus silencieux?', 'Le parachute', 5);
INSERT INTO public.jokes VALUES (508, 2, 2, 'Les maisons de retraite c''est comme Koh-Lanta...', 'À la fin il en restera qu''un.', 5);
INSERT INTO public.jokes VALUES (509, 2, 2, 'Pourquoi le jeu Among US est-il autant joué par les filles?', 'Parce qu''elles n''ont pas à se battre pour avoir le droit de vote.', 5);
INSERT INTO public.jokes VALUES (510, 2, 2, 'Comment s''appelle le cul de la Schtroumpfette?', 'Le blu-ray.', 5);
INSERT INTO public.jokes VALUES (511, 2, 2, 'Quel est le point commun entre un Gynécologue et un Pizzaiolo?', 'Ils peuvent tous les deux sentir ce qu''ils font, mais pas la bouffer!', 5);
INSERT INTO public.jokes VALUES (512, 2, 2, 'Quelle est la difference entre une Geox et George Floyd?', 'La Geox, elle respire.', 5);
INSERT INTO public.jokes VALUES (513, 2, 2, 'Pourquoi un Européen et un Asiatique ne peuvent pas cuisiner ensemble?', 'Parce que il y a toujours écrit de séparer les blancs et les jaunes.', 5);
INSERT INTO public.jokes VALUES (514, 2, 2, 'Que dit Marine Le Pen au Capitaine du Bateau sur lequel elle navigue?', 'La meilleure méthode c''est de naviguer à contre Coran!', 5);
INSERT INTO public.jokes VALUES (515, 2, 2, 'Un arabe s''embrouille avec un Francais. Ce dernier lui dit "Occupe toi de tes affaires!".', 'Le Français repond alors "Bah rend les moi!".', 5);
INSERT INTO public.jokes VALUES (516, 2, 2, 'Pourquoi un aveugle tutoie?', 'Parce qu''il ne vous vois pas.', 5);
INSERT INTO public.jokes VALUES (517, 2, 2, 'Pourquoi les pédophiles adorent Halloween?', 'Parce que c''est livraison à domicile ce jour-là.', 5);
INSERT INTO public.jokes VALUES (519, 2, 2, 'Les blagues sur Georges Floyd sont...', '...à couper le souffle.', 5);
INSERT INTO public.jokes VALUES (520, 2, 2, 'Si 1000 vaches ont le covid', 'Peut-on dire qu''il y a Milka?', 5);
INSERT INTO public.jokes VALUES (521, 2, 2, 'Quel president bande 2 fois le matin?', 'Charles de Gaulle', 5);
INSERT INTO public.jokes VALUES (522, 2, 2, 'Le ricard, c''est comme un tsunami...', 'Plus y a d''eau, moins y a de jaune.', 5);
INSERT INTO public.jokes VALUES (523, 2, 2, 'Melon et Melèche mangent une glace', 'Melon prend le cornet et Melèche les boules.', 5);
INSERT INTO public.jokes VALUES (524, 2, 2, 'Pourquoi les suppositoires sont-ils toujours fatigués?', 'Parce qu''ils ont la tête dans le cul.', 5);
INSERT INTO public.jokes VALUES (525, 2, 2, 'Avant j''étais schizophrène...', 'Maintenant, nous allons mieux!', 5);
INSERT INTO public.jokes VALUES (526, 2, 2, 'Qu''est-ce qui rentre dur et sec et qui ressort mou et mouillé?', 'Un chewing-gum.', 5);
INSERT INTO public.jokes VALUES (527, 2, 2, 'Pourquoi les poulets ont des ailes alors qu''ils ne volent pas?', 'Et pourquoi les arabes n''ont pas d''ailes alors qu''ils volent?', 5);
INSERT INTO public.jokes VALUES (528, 2, 2, 'J''aimerais mourir comme mon grand-père : dans son sommeil', 'Pas en hurlant comme tous les passagers du bus qu''il conduisait.', 5);
INSERT INTO public.jokes VALUES (529, 2, 2, 'Qu''est-ce qu''un oiseau migrateur?', 'Un oiseau qui se gratte que d''un côté.', 5);
INSERT INTO public.jokes VALUES (530, 2, 2, 'Quel est le comble pour un sous-marin?', 'Une journée porte ouverte.', 5);
INSERT INTO public.jokes VALUES (531, 2, 2, 'Pourquoi ceux qui votent Trump ne font pas de programmation?', 'Car une erreur "403: Forbidden" arrive vite.', 5);
INSERT INTO public.jokes VALUES (532, 2, 2, 'Deux arabes sont dans une voiture, qui conduit?', 'La police.', 5);
INSERT INTO public.jokes VALUES (533, 2, 2, 'Pourquoi dit-on que les bretons sont tous frères et sœurs?', 'Parce qu''ils n''ont Quimper.', 5);
INSERT INTO public.jokes VALUES (534, 2, 2, 'Que se passe-t-il quand 2 poissons s''énervent?', 'Le thon monte.', 5);
INSERT INTO public.jokes VALUES (535, 2, 2, 'Deux putes sont dans un ascenseur, l''une dit "Tiens sa sens le sperme ?"', 'L''autre répond : Désolé j''ai roté.', 5);
INSERT INTO public.jokes VALUES (536, 2, 2, 'Quel est le point commun entre une vitre et un soldat?', 'On y voit à travers.', 5);
INSERT INTO public.jokes VALUES (537, 2, 2, 'Qu''est-ce qui est bleu et qui déscent?', 'L''OM dans le classement.', 5);
INSERT INTO public.jokes VALUES (538, 2, 2, 'Qu''est-ce qu''un chat dans un cirque?', 'Un chatpiteau.', 5);
INSERT INTO public.jokes VALUES (539, 2, 2, 'Qui est la mamie la plus forte au monde?', 'Mamitraillette.', 5);
INSERT INTO public.jokes VALUES (540, 2, 2, 'Qu''est-ce qui est vert et qui pousse au fond du jardin?', 'Un extraterrestre qui fait caca!', 5);
INSERT INTO public.jokes VALUES (541, 2, 2, 'Pourquoi faut-il toujours écouter Jesus?', 'Parce que lui au moins il est fixé.', 5);
INSERT INTO public.jokes VALUES (542, 2, 2, 'Quel est le réseau social où tout le monde se prend la tête?', 'Discord', 5);
INSERT INTO public.jokes VALUES (543, 2, 2, 'Que dit Jeanne d''Arc sur le bucher?', 'Vous ne m''avez pas crut vous m''avez cuite!', 5);
INSERT INTO public.jokes VALUES (544, 2, 2, 'Jean d''Arc est sur le bucher et dit: "Je veux descendre!"', 'Le peuple lui répond: "T''inquiète pas, tu vas en avoir!"', 5);
INSERT INTO public.jokes VALUES (545, 2, 2, 'Quand est-ce qu''arrive un bœuf chez le bouché?', 'Tard-Tard.', 5);
INSERT INTO public.jokes VALUES (546, 2, 2, 'Qu''est-ce qu''une étoile filante ? ', 'Un juif qui court.', 5);
INSERT INTO public.jokes VALUES (547, 2, 2, 'J''avais une blague sur les Portugais.', 'Mais ce n''était pas très constructif.', 5);
INSERT INTO public.jokes VALUES (548, 2, 2, 'Quel hôtel est le plus étoilé ? ', 'Auschwitz', 5);
INSERT INTO public.jokes VALUES (549, 2, 2, 'J''avais une blague sur les orphelins.', 'Mais j''ai décidé de l''abandonner...', 5);
INSERT INTO public.jokes VALUES (550, 2, 2, 'L''avortement c''est...', 'Du spawnkill!', 5);
INSERT INTO public.jokes VALUES (551, 2, 2, 'Pourquoi les orphelins aiment les boomerangs?', 'Parce qu''eux, au moins, ils reviennent.', 5);
INSERT INTO public.jokes VALUES (552, 2, 2, 'Quel est l''iPhone que les orphelins détestent le plus?', 'L''iPhone X, le bouton home a été supprimé.', 5);
INSERT INTO public.jokes VALUES (553, 2, 2, 'Qu''est-ce que 30 noirs et 28 blancs?', 'Un code barre.', 5);
INSERT INTO public.jokes VALUES (554, 2, 2, ' C''est l''histoire d''une carotte qui veut se suicider. Elle n''y arrive pas et dit :', 'Oh, zut! C''est rappé!', 5);
INSERT INTO public.jokes VALUES (555, 2, 2, 'Pourquoi les douches ont-elles 11 petits trous?', 'Car les juifs n''ont que 10 doigts.', 5);
INSERT INTO public.jokes VALUES (556, 2, 2, 'Comment s''appelle la fille de monsieur et madame Orak?', 'Elle s''appelle Anne Orak.', 5);
INSERT INTO public.jokes VALUES (557, 2, 2, 'Comment s''appelle la fille de monsieur et madame Télavion?', 'Elle s''appelle Tara Télavion.', 5);
INSERT INTO public.jokes VALUES (558, 2, 2, 'Comment s''appelle le fils de Monsieur et Madame Dipleu?', 'Il s''appelle Homer Dipleu.', 5);
INSERT INTO public.jokes VALUES (559, 2, 2, 'Que fait un développeur qui a froid?', 'Il met une C-Sharp.', 5);
INSERT INTO public.jokes VALUES (560, 2, 2, 'Quelle est la monnaie des poissons?', 'Les sous-marins.', 5);
INSERT INTO public.jokes VALUES (561, 2, 2, 'Je pense qu''il faut désinstaller et réinstaller 2020.', 'Je pense qu''il y a un virus.', 5);
INSERT INTO public.jokes VALUES (562, 2, 2, 'C''est quoi un chat dans l''espace?', 'Un chatellite.', 5);
INSERT INTO public.jokes VALUES (563, 2, 2, 'Tu sais pourquoi l''iPhone 6 se plie?', 'Parce que l''apple store.', 5);
INSERT INTO public.jokes VALUES (564, 2, 2, 'Que dit une mère à son fils geek quand le diner est servi?', 'Alt + Tab', 5);
INSERT INTO public.jokes VALUES (565, 2, 2, 'Quel est le logiciel qui fait le plus crash Windows?', 'Windows Update', 5);
INSERT INTO public.jokes VALUES (566, 2, 2, 'Fais pas ton Kennedy!', 'Te laisse pas abattre!', 5);
INSERT INTO public.jokes VALUES (567, 2, 2, 'Les crevettes c''est pas cher.', 'Mais les Omar Sy.', 5);
INSERT INTO public.jokes VALUES (568, 2, 2, 'Quel est le nombre préféré des vampires?', '109, car sang neuf.', 5);
INSERT INTO public.jokes VALUES (569, 2, 2, 'Pourquoi les développeurs n''aiment-ils pas 2020?', 'Car il y a la co vide.', 5);
INSERT INTO public.jokes VALUES (570, 2, 2, 'Quelle est la déesse du Wi-Fi?', 'La déesse L.', 5);
INSERT INTO public.jokes VALUES (571, 2, 2, 'Qu''obtient-on lorsqu''un chou se fait mal et que son sang sèche?', 'Une choucroute!', 5);
INSERT INTO public.jokes VALUES (572, 2, 2, 'Que disent deux fesses dans une pirogue?', 'Dis donc, ça commence à ramer du cul là non?', 5);
INSERT INTO public.jokes VALUES (573, 2, 2, 'Un dromadaire ne travaille pas!', 'Il bosse!', 5);
INSERT INTO public.jokes VALUES (574, 2, 2, 'Pourquoi est-ce difficile de rompre avec une copine Japonaise?', 'Tu dois larguer deux bombes avant qu''elle comprenne.', 5);
INSERT INTO public.jokes VALUES (575, 2, 2, 'Maman, maman pourquoi tu gémis?', 'Tais toi et lèche!', 5);
INSERT INTO public.jokes VALUES (576, 2, 2, 'Quel est le point commun entre un enfant africain et une fleur?', 'Ils ont besoin d''eau pendant une semaine et après ils meurent.', 5);
INSERT INTO public.jokes VALUES (577, 2, 2, 'Quelle est l''activité préférée d''un électricien?', 'Branler un poteau pour voir s''il a du jus.', 5);
INSERT INTO public.jokes VALUES (578, 2, 2, 'À quoi reconnaît-on le slip de Dark Vador?', 'À son côté obscur.', 5);
INSERT INTO public.jokes VALUES (579, 2, 2, 'C''est l''histoire du client qui achète un tableau au peintre.', 'Le peintre lui dit: Cette affaire, j''y ai consacré dix ans de ma vie! 2 jours pour la peindre et le reste pour la vendre!', 5);
INSERT INTO public.jokes VALUES (580, 2, 2, 'Pourquoi les femmes se maquillent et se parfument?', 'Parce qu''elles sont moches et qu''elles puent.', 5);
INSERT INTO public.jokes VALUES (581, 2, 2, 'Quelle est la différence entre les bières et les chasseurs?', 'Les bières, on arrive à en faire sans alcool.', 5);
INSERT INTO public.jokes VALUES (582, 2, 2, 'Qu''est-ce qui a 2 branches mais pas de feuilles?', 'Des lunettes.', 5);
INSERT INTO public.jokes VALUES (583, 2, 2, 'Le sexe c''est l''inverse des maths.', 'Plus c''est dur et mieux ça rentre.', 5);
INSERT INTO public.jokes VALUES (584, 2, 2, 'Quel est le point commun entre les maths et le sexe?', 'Plus il y a d''inconnues, plus c''est chaud!', 5);
INSERT INTO public.jokes VALUES (585, 2, 2, 'Quelle est la différence entre un juif et une patate?', 'La patate ne crie pas quand on la brûle.', 5);
INSERT INTO public.jokes VALUES (586, 2, 2, 'Qu''est-ce qu''un grain de riz dans un lavabo?', 'Le vomi d''un Somalien', 5);
INSERT INTO public.jokes VALUES (587, 2, 2, 'Qu''est-ce qu''un enfant de chœur encore puceau?', 'Un enfant qui court plus vite que le prêtre.', 5);
INSERT INTO public.jokes VALUES (588, 2, 2, 'À quel moment l''acné devient-elle critique?', 'Quand les aveugles commencent à lire sur ton visage.', 5);
INSERT INTO public.jokes VALUES (589, 2, 2, 'Quelle est la différence à connaître entre E.T. l''extra-terrestre et un arabe?', 'E.T. lui, a compris qu''il fallait rentrer à la maison!', 5);
INSERT INTO public.jokes VALUES (590, 2, 2, 'Que fais-tu quand tu vois un arabe sur un scooter?', 'Tu le poursuis car c''est probablement le tiens.', 5);
INSERT INTO public.jokes VALUES (591, 2, 2, 'Papa! Pourquoi mamie court en zigzag?', 'Ta gueule p''tit con, et passe-moi les cartouches!', 5);
INSERT INTO public.jokes VALUES (592, 2, 2, 'Comment appelle t''on les chiens saucisses en chine?', 'Des hots-dogs.', 5);
INSERT INTO public.jokes VALUES (593, 2, 2, 'Quel est le comble de Johnny Hallyday?', 'Il va toujours vendre décédé.', 5);
INSERT INTO public.jokes VALUES (594, 2, 2, 'C''est un petit garçon qui dit à sa grand-mère :', 'Mamie ? Tu ne trouves pas que ça sent mauvais ici ? On dirait une odeur de cadavre! Heu mamie ? Tu m''entends mamie?', 5);
INSERT INTO public.jokes VALUES (595, 2, 2, 'Comment fait-on descendre sa belle-mère d''un arbre?', 'En coupant la corde.', 5);
INSERT INTO public.jokes VALUES (596, 2, 2, 'Une petite fille se plaint auprès de sa mère: Maman! Mamie m''a mordue!', '- C''est bien fait! Je t''avais pourtant prévenue de ne pas t''approcher de sa cage!', 5);
INSERT INTO public.jokes VALUES (597, 2, 2, 'Qu''est-ce qui est le plus compliqué pour un policier juif noir et gay?', 'La discrimination.', 5);
INSERT INTO public.jokes VALUES (598, 2, 2, 'Dans le métro, une femme sent qu''un homme lui met la main sur la cuisse. Elle se retourne et lui dit : - Vous ne pourriez pas mettre votre main ailleurs?', '- J''y ai pensé, mais je n''osais pas...', 5);
INSERT INTO public.jokes VALUES (599, 2, 2, '- Maman, je suis juif ou arabe ? - Je suis Algérienne et ton père est juif, donc les deux, pourquoi?', 'Il y a un scooter là-bas, et j''hésite entre le voler ou le vendre.', 5);
INSERT INTO public.jokes VALUES (600, 2, 2, 'Hier, j''ai vu quatre hommes cagoulés agresser mon ex, je me suis demandé si je devais aider.', 'Mais je me suis dit qu''ils étaient assez à quatre.', 5);
INSERT INTO public.jokes VALUES (601, 2, 2, 'Le jour de sa mort, Kennedy s''est dit qu''il était bon de sortir en voiture.', 'Car ça permet de se vider la tête.', 5);
INSERT INTO public.jokes VALUES (602, 2, 2, 'Qu''est-ce qui est passé par la tête de John Fitzgerald Kennedy le 22 novembre 1963?', 'Une balle de sniper!', 5);
INSERT INTO public.jokes VALUES (603, 2, 2, 'Je me rappellerai toujours des derniers mots de mon grand-père...', 'Arrête de bouger l''échelle!', 5);
INSERT INTO public.jokes VALUES (604, 2, 2, 'Qui a inventé le triathlon?', 'Les Arabes, ils vont à la piscine à pied et reviennent en vélo.', 5);
INSERT INTO public.jokes VALUES (605, 2, 2, 'En Normandie, quand il y a de la moule...', 'On a la frite.', 5);
INSERT INTO public.jokes VALUES (606, 2, 2, 'Quel est le gâteau préféré de Brigitte Macron?', 'Le petit écolier.', 5);
INSERT INTO public.jokes VALUES (607, 2, 2, 'Quel est le fromage préféré d''Emmanuel Macron?', 'Le président.', 5);
INSERT INTO public.jokes VALUES (608, 2, 2, 'Que dit une vache lors d''un braquage?', 'Que perzonne ne bouze!', 5);
INSERT INTO public.jokes VALUES (609, 2, 2, 'Quel aliment n''est pas un steak?', 'Une pastèque...', 5);
INSERT INTO public.jokes VALUES (610, 2, 2, 'Pourquoi Mickey Mouse?', 'Parce-que Mario Bros.', 5);
INSERT INTO public.jokes VALUES (611, 2, 2, 'Quel animal peut voir l''avenir?', 'La poule de cristal.', 5);
INSERT INTO public.jokes VALUES (612, 2, 2, 'La corse, c''est comme une orange', 'C''est mieux sans l''écorce.', 5);
INSERT INTO public.jokes VALUES (613, 2, 2, 'Quelle est l''eau la plus gazeuse?', 'L''eau chvitz.', 5);
INSERT INTO public.jokes VALUES (614, 2, 2, 'Quel est l''endroit le plus peuplé d''Ethiopie?', 'Ça dépend le sens du vent.', 5);
INSERT INTO public.jokes VALUES (615, 2, 2, 'Qu''est-ce qu''une rousse pas très intelligente?', 'Une blonde teinté en rousse.', 5);
INSERT INTO public.jokes VALUES (616, 2, 2, 'Quelle est la pile la plus compliqué à vendre?', 'Une pile Duracell.', 5);
INSERT INTO public.jokes VALUES (617, 2, 2, 'Une notice me disait: Nécessite windows xp ou mieux.', 'J''ai donc installer linux.', 5);
INSERT INTO public.jokes VALUES (618, 2, 2, 'À quoi à servi Donald Trump?', 'À créer des memes.', 5);
INSERT INTO public.jokes VALUES (619, 2, 2, 'Quel est le furur de ronfler?', 'Dormir.', 5);
INSERT INTO public.jokes VALUES (620, 2, 2, 'J''ai plongé mon voisin, sa femme et ses enfants dans du métal en fusion...', 'Ma mère m''a toujours dit qu''il fallait que je fonde une famille.', 5);
INSERT INTO public.jokes VALUES (621, 2, 2, 'Un homme dans la rue m''a demandé si j''avais une pièce pour manger.', 'Je lui ai répondu que oui et que ça s''appelait une salle à manger.', 5);
INSERT INTO public.jokes VALUES (622, 2, 2, 'Le point commun entre une naissance et une biscotte?', 'Quand c''est noir, c''est raté!', 5);
INSERT INTO public.jokes VALUES (623, 2, 2, 'Vous connaissez la blague avec les noirs qui se font renverser par une voiture?', 'Moi non, mais le début de l''histoire commence bien.', 5);
INSERT INTO public.jokes VALUES (624, 2, 2, 'D''où vient l''expression dur à cuir?', 'De la seconde guerre mondiale, pour parler des juifs rebels.', 5);
INSERT INTO public.jokes VALUES (625, 2, 2, 'Pour quelle raison les retraités adorent les bains de boues?', 'Car ils s''habituent au goût de la terre.', 5);
INSERT INTO public.jokes VALUES (626, 2, 2, 'Quel est le point commun entre les noirs et la crème?', 'C''est meilleur quand c''est fouetté!', 5);
INSERT INTO public.jokes VALUES (627, 2, 2, 'C''est quoi un roux sur un vélo?', 'Un tricycle.', 5);
INSERT INTO public.jokes VALUES (628, 2, 2, 'Quelle est la différence entre une part de pizza et une prostituée?', 'La pizza, tu as le choix d''avoir des champignons.', 5);
INSERT INTO public.jokes VALUES (629, 2, 2, 'Méfiez vous de l''oiseau sur le lac :', 'C''est peut-être un mauvais cygne!', 5);
INSERT INTO public.jokes VALUES (630, 2, 2, 'Qu''est-ce qu''une piscine remplie d''handicapés?', 'Une soupe aux légumes.', 5);
INSERT INTO public.jokes VALUES (631, 2, 2, 'Papa c''est vrai que tu ne m''aimes pas?', 'Mais non fiston, tiens prends ton ballon et vas jouer sur l''autoroute!', 5);
INSERT INTO public.jokes VALUES (632, 2, 2, 'Guillaume enlève tes doigts du nez de grand-père! Guillaume, laisse grand-père tranquille!', 'Guillaume, dernier avertissement, arrête ou je referme le cercueil.', 5);
INSERT INTO public.jokes VALUES (633, 2, 2, 'Pourquoi les parachutistes sont-il célibataires?', 'Parce qu''ils se font larguer!', 5);
INSERT INTO public.jokes VALUES (634, 2, 2, 'Qu''est-ce qu''une tranche de jambon sur un vélo?', 'Un anti-vol.', 5);
INSERT INTO public.jokes VALUES (635, 2, 2, 'La connerie se cultive.', 'J''en connais plein qui ont la main verte.', 5);
INSERT INTO public.jokes VALUES (636, 2, 2, 'J''ai vu un hibou se blesser une patte.', 'Maintenant hibouette.', 5);
INSERT INTO public.jokes VALUES (637, 2, 2, 'Tu veux connaître mon coin à champignons?', 'C''est Tinder!', 5);
INSERT INTO public.jokes VALUES (638, 2, 2, 'Que fait un développeur quand il est triste?', 'Il se console.', 5);
INSERT INTO public.jokes VALUES (639, 2, 2, 'Sais-tu pourquoi je ne regarde jamais de porno?', 'Parce que je suis de l''autre côté de la caméra.', 5);
INSERT INTO public.jokes VALUES (640, 2, 2, 'Pourquoi la moustache de Hitler était si populaire pendant la Seconde Guerre mondiale?', 'Car elle faisait Führer.', 5);
INSERT INTO public.jokes VALUES (641, 2, 2, 'Proverbe africain : Quand moustique se poser sur testicules.', 'Toi comprendre que violence pas toujours solution.', 5);
INSERT INTO public.jokes VALUES (642, 2, 2, 'Comment appelle-t-on un duel entre une carotte et un petit pois?', 'Un Bonduelle.', 5);
INSERT INTO public.jokes VALUES (643, 2, 2, 'Quel est le style musical préféré des chimistes?', 'Le blouse.', 5);
INSERT INTO public.jokes VALUES (644, 2, 2, 'Qu''est-ce qu''un spermatozoïde avec une valise?', 'Un représentant de mes couilles.', 5);
INSERT INTO public.jokes VALUES (645, 2, 2, 'Qu''est-ce qu''un Noir avec un bâton dans l''cul?', 'Une glace Magnum.', 5);
INSERT INTO public.jokes VALUES (646, 2, 2, 'C''est quoi une blonde conne?', 'Bah une blonde tout ce qu''il y a de plus normal.', 5);
INSERT INTO public.jokes VALUES (647, 2, 2, 'Où vont les juifs un lendemain de cuite?', 'Dans le cendrier.', 5);
INSERT INTO public.jokes VALUES (648, 2, 2, 'Je peux tourner sans bouger. Qui suis-je?', 'Le Lait.', 5);
INSERT INTO public.jokes VALUES (649, 2, 2, 'Qu''est-ce qui est jaune et qui attend?', 'Un juif sur un quai de gare.', 5);
INSERT INTO public.jokes VALUES (650, 2, 2, 'Qu''est-ce qu''un noir entre deux poubelles?', 'Une photo de famille.', 5);
INSERT INTO public.jokes VALUES (651, 2, 2, 'Peut-on prendre un bain quand on a la diarrhée?', 'Oui, si on en a assez.', 5);
INSERT INTO public.jokes VALUES (652, 2, 2, 'Quel est le chanteur préféré des développeurs?', 'Michael Json', 5);
INSERT INTO public.jokes VALUES (653, 2, 2, 'Quel est le point commun entre une bouteille de champagne et un épileptique?', 'Quand tu secoues ça mousse.', 5);
INSERT INTO public.jokes VALUES (654, 2, 2, 'Quel est l''endroit le moins vu de stackoverflow?', 'La page d''accueil.', 5);
INSERT INTO public.jokes VALUES (655, 2, 2, 'Comment s''appelle un agent secret qui regarde un porno?', 'James Band', 5);
INSERT INTO public.jokes VALUES (656, 2, 2, 'Pourquoi tu vas toujours aux toilettes avec du pain?', 'C''est pour donner à manger à Canard W-C.', 5);
INSERT INTO public.jokes VALUES (657, 2, 2, 'C''est l''histoire d''un têtard. Il croyait qu''il était tôt.', 'Alors qu''il est têtard.', 5);
INSERT INTO public.jokes VALUES (658, 2, 2, 'Comment appelle-t-on un lapin sourd?', 'LAAAAAAPIIIIIIIINNNNNNN!!!!!!', 5);
INSERT INTO public.jokes VALUES (659, 2, 2, 'Pourquoi faut-il enlever ses lunettes avant un alcootest?', 'Ca fait 2 verres en moins.', 5);
INSERT INTO public.jokes VALUES (660, 2, 2, 'Quand fête-t-on la journée des fumeurs?', 'Le 1er Juin', 5);
INSERT INTO public.jokes VALUES (661, 2, 2, 'Quel est le point commun entre les voitures et les ordinateurs?', 'Les mauvais pilotes sont problématiques.', 5);
INSERT INTO public.jokes VALUES (662, 2, 2, 'J''ai essayé d''apprendre à coder à mon neveu de 8 ans...', 'Il a compris le truc, 2 minutes plus tard il était déjà en train de crier et de frapper le clavier!', 5);
INSERT INTO public.jokes VALUES (663, 2, 2, 'Ma copine m''a larguée après avoir donné son nom à une classe.', 'Elle avait l''impression que je la traitais comme un objet.', 5);
INSERT INTO public.jokes VALUES (664, 2, 2, 'Comment les développeur se débarrassent des fantômes?', 'En effectuant un XOR-cisme.', 5);
INSERT INTO public.jokes VALUES (665, 2, 2, 'Si Javascript avais un fils, comment s''appellerait-il?', 'Json', 5);
INSERT INTO public.jokes VALUES (666, 2, 2, 'Quel est l''animal totem du scrum-master?', 'La Jiraffe', 5);
INSERT INTO public.jokes VALUES (667, 2, 2, 'Un gars tente de draguer une fille, en boîte : On échange nos numéros?', 'Non, j''aime beaucoup le miens, merci!', 5);
INSERT INTO public.jokes VALUES (668, 2, 2, 'Quelle est la différence entre une sorcière, une femme de ménage et une personne coincée?', 'L''emplacement du balai!', 5);
INSERT INTO public.jokes VALUES (669, 2, 2, 'Quelle est la déesse d''internet?', 'La déesse L', 5);
INSERT INTO public.jokes VALUES (670, 2, 2, ' Purée fait chi#r, j''ai un problème avec mon téléphone.', 'Il manque juste ton numéro.', 5);
INSERT INTO public.jokes VALUES (671, 2, 2, 'Qu''est-ce qu''un homme intelligent, beau et sensible?', 'Une rumeur', 5);
INSERT INTO public.jokes VALUES (672, 2, 2, 'Quelle est la différence entre un homme et un bébé?', 'Le bébé au moins on peut le laisser seul avec la baby-sitter.', 5);
INSERT INTO public.jokes VALUES (673, 2, 2, 'Comment appelle t''on un lion qui se rebelle?', 'Une rébellion', 5);
INSERT INTO public.jokes VALUES (674, 2, 2, 'Comment appelle-t-on un squelette qui parle?', 'Un os parleur', 5);
INSERT INTO public.jokes VALUES (675, 2, 2, 'Quel est la différence entre une blonde et un miroir?', 'Le miroir réfléchit.', 5);
INSERT INTO public.jokes VALUES (676, 2, 2, 'Que dit un Japonais qui a loupé son car?', 'Karaté!!', 5);
INSERT INTO public.jokes VALUES (677, 2, 2, 'Que disent des arbres quand ils vont en boite de nuit?', 'Laquelle je vais brancher ce soir?', 5);
INSERT INTO public.jokes VALUES (678, 2, 2, 'L''autre jour, j''ai raconté une blague à mes vêtements.', 'Ils étaient pliés.', 5);
INSERT INTO public.jokes VALUES (679, 2, 2, 'Quels sont les animaux qu''on retrouve en grand nombre dans la montagne?', 'Les chats laids.', 5);
INSERT INTO public.jokes VALUES (680, 2, 2, 'Vous savez pourquoi Valbuena rigole quand il joue au foot?', 'Parce que l''herbe lui chatouille les couilles!', 5);
INSERT INTO public.jokes VALUES (681, 2, 2, 'Comment appelle-t-on le fait de se retrouver coincé entre Marine et Jean-Marie?', 'Une double Pen.', 5);
INSERT INTO public.jokes VALUES (682, 2, 2, 'Dit moi des chose sales!', 'La cuisine, la salle de bain...', 5);
INSERT INTO public.jokes VALUES (683, 2, 2, 'Qui a inventé le sous-marin?', 'Les Français en essayant de construire un bateaux!', 5);
INSERT INTO public.jokes VALUES (684, 2, 2, 'Quel est le légume les plus alcoolique?', 'L''épinard', 5);
INSERT INTO public.jokes VALUES (685, 2, 2, 'Quelle est la différence entre une échelle et un pistolet?', 'L''échelle sert à monter et le pistolet sert à descendre.', 5);
INSERT INTO public.jokes VALUES (686, 2, 2, 'Comment surprendre un aveugle?', 'Vous laissez la ventouse dans les toilettes.', 5);
INSERT INTO public.jokes VALUES (687, 2, 2, 'À quoi sert le dégivrage arrière d''une voiture?', 'À ne pas se geler les mains quand on la pousse!', 5);
INSERT INTO public.jokes VALUES (688, 2, 2, 'Quel est l''animal le plus chanceux?', 'Le hibou puisque sa femme et chouette.', 5);
INSERT INTO public.jokes VALUES (689, 2, 2, 'Pourquoi Hulk ne peut pas avoir d''enfant?', 'Parce qu''il deviendrait un père vert', 5);
INSERT INTO public.jokes VALUES (690, 2, 2, 'Quel est le point commun entre la science et les femmes?', 'Je leur ai fait don de mon corps.', 5);
INSERT INTO public.jokes VALUES (691, 2, 2, 'Comment faire pour oublier une ex?', 'On prend un tipp-ex.', 5);
INSERT INTO public.jokes VALUES (692, 2, 2, 'Qu''est-ce qui est vert et qui se déplace sous l''eau?', 'Un choux marin.', 5);
INSERT INTO public.jokes VALUES (693, 2, 2, 'Quelle est la différence entre l''intelligence et un parachute?', 'Aucune. Quand on n''en a pas, on s''écrase.', 5);
INSERT INTO public.jokes VALUES (694, 2, 2, 'Qu''est-ce qui est rose, fait 5 cm, 15 cm déplié et qui fait rêver toutes les filles de 18 ans?', 'Le permis de conduire.', 5);
INSERT INTO public.jokes VALUES (695, 2, 2, 'Qu''est-ce qui est long et dur et que les femmes n''ont pas?', 'Le service militaire.', 5);
INSERT INTO public.jokes VALUES (696, 2, 2, 'Comment appelle-t-on un mouton sans jambes?', 'Un nuage.', 5);
INSERT INTO public.jokes VALUES (697, 2, 2, 'Quelles sont les hommes qui n''ont pas peur des pickpockets?', 'Les nudistes.', 5);
INSERT INTO public.jokes VALUES (698, 2, 2, 'Pourquoi met-on une selle sur un cheval?', 'Parce qu''il si on la met dessous, elle tombe.', 5);
INSERT INTO public.jokes VALUES (699, 2, 2, 'Vous savez pourquoi les pets puent?', 'Pour que les sourds en profitent!', 5);
INSERT INTO public.jokes VALUES (700, 2, 2, 'Pour un chasseur, qu''elle est la différence entre son chien et sa femme?', 'Le prix du collier.', 5);
INSERT INTO public.jokes VALUES (701, 2, 2, 'D''où viennent les gens les plus dangereux?', 'D''Angers', 5);
INSERT INTO public.jokes VALUES (702, 2, 2, 'Deux chèvres Babi et Baba sont dans une barque. Baba tombe à l''eau. Que se passe t''il?', 'Babybel', 5);
INSERT INTO public.jokes VALUES (703, 2, 2, 'Que demande un footballeur à son coiffeur?', 'La coupe du monde.', 5);
INSERT INTO public.jokes VALUES (704, 2, 2, 'Où part un homme invisible en vacances?', 'Chez ses transparents.', 5);
INSERT INTO public.jokes VALUES (705, 2, 2, 'Pourquoi certains poissons vivent dans l''eau salée?', 'Parce l''eau poivrée les fait éternuer.', 5);
INSERT INTO public.jokes VALUES (706, 2, 2, 'Un sous-marin se heurte à un poisson rouge qui venait de sa gauche. Qui est en tort?', 'Le sous-marin, parce qu''il n''avait rien à faire dans un bocal de poisson rouge!', 5);
INSERT INTO public.jokes VALUES (707, 2, 2, 'Qu''est-ce qu''une luciole qui a pris du viagra?', 'Un néon!', 5);
INSERT INTO public.jokes VALUES (708, 2, 2, 'Tu veux que je te raconte une blague à l''envers?', 'Alors commence par rire.', 5);
INSERT INTO public.jokes VALUES (709, 2, 2, 'Deux œufs discutent : Pourquoi t''es tout vert et aussi poilu?', 'Parce que j''suis un kiwi connard.', 5);
INSERT INTO public.jokes VALUES (710, 2, 2, 'C''est 2 grains de sable qui arrivent à la plage.', 'Putain, c''est blindé aujourd''hui...', 5);
INSERT INTO public.jokes VALUES (711, 2, 2, '2 cacas vont à la guerre et rencontrent une diarrhée: Je peux venir?', 'Non. La guerre, c''est pour les durs!', 5);
INSERT INTO public.jokes VALUES (712, 2, 2, '2 mouches discutent sur un caca de chien: J''ai une de ces envies de péter moi.', 'Grosse dégueulasse, on est à table!', 5);
INSERT INTO public.jokes VALUES (713, 2, 2, 'Un éléphant croise un homme sur une plage nudiste. Qu''est-ce que l''éléphant dit?', 'Et! C''est avec ça que tu manges?', 5);
INSERT INTO public.jokes VALUES (714, 2, 2, 'Que dit un hérisson qui se cogne à un cactus?', 'Maman!', 5);
INSERT INTO public.jokes VALUES (715, 2, 2, 'Deux lions discutent: Allez, avoue que tu es amoureux!', 'Arrête, tu vas me faire rugir!', 5);
INSERT INTO public.jokes VALUES (716, 2, 2, 'Que dit une banane malade à ses camarades qui ont aussi chopé le virus?', 'On va tous mûrir!', 5);
INSERT INTO public.jokes VALUES (717, 2, 2, 'Comment appelle-t-on des gars dépourvus de testicules qui se battent?', 'Un combat sanglant.', 5);
INSERT INTO public.jokes VALUES (718, 2, 2, 'Un jeune homme demande à son boucher: Bonjour Monsieur, je voudrais la main de votre fille!', 'D''accord, avec ou sans os?', 5);
INSERT INTO public.jokes VALUES (719, 2, 2, 'Au lit, un homme dit tendrement à sa femme : J''aimerais bien mettre mon zizi dans ton oreille.', 'D''accord, mais fais gaffe à ce que je ne devienne pas sourde. Y''a pas de danger : depuis 30 ans je te le mets dans la bouche, et jamais tu ne l''as fermée.', 5);
INSERT INTO public.jokes VALUES (720, 2, 2, '2 paysannes ramassent des patates. La première en saisit deux grosses pleines de terre et dit à l''autre :', 'Vindiou! Elles sont comme les couilles de mon mari! Aussi grosses ? Non, aussi sales!', 5);
INSERT INTO public.jokes VALUES (721, 2, 2, 'Quelle est la différence entre un vieux et un zizi?', 'T''as pas besoin de secouer le vieux pour qu''il bave.', 5);
INSERT INTO public.jokes VALUES (722, 2, 2, 'Quel est le point commun entre un homme au réveil et un élastique?', 'Eh bien il s''étire, il s''étire, il s''étire, et il pète!', 5);
INSERT INTO public.jokes VALUES (723, 2, 2, 'Comment appelle-t-on le nombril d''un obèse?', 'Un trou noir.', 5);
INSERT INTO public.jokes VALUES (724, 2, 2, 'Quelle est la différence entre un macho et un pêcheur?', 'Le macho ne se vantera jamais d''en avoir attrapé une grosse.', 5);
INSERT INTO public.jokes VALUES (725, 2, 2, 'Quel est le moyen de contraception le plus sûr au monde?', 'Etre grosse et moche.', 5);
INSERT INTO public.jokes VALUES (726, 2, 2, 'Quelle est la différence entre tomber du 1er ou du 10ème étage?', 'Tomber du 1er : PAF! Ahhhhh! Tomber du 10ème : Ahhhhh! PAF!', 5);
INSERT INTO public.jokes VALUES (727, 2, 2, 'Pourquoi les hommes ont-ils toujours les jambes écartées lorsqu''ils sont assis?', 'Pour aérer leur cerveau.', 5);
INSERT INTO public.jokes VALUES (728, 2, 2, 'Quel est le point commun entre un prof et des hémorroïdes?', 'Les deux sortent du corps enseignant.', 5);
INSERT INTO public.jokes VALUES (729, 2, 2, 'Quel est le comble du boulanger?', 'Plus il a de la brioche, moins on voit sa baguette.', 5);
INSERT INTO public.jokes VALUES (730, 2, 2, 'Quelle est la différence entre un 69 et le brouillard?', 'Dans le brouillard, on ne voit pas le trou du cul qui est devant...', 5);
INSERT INTO public.jokes VALUES (731, 2, 2, 'Qu''est-ce qui a deux pattes et qui saigne?', 'Un demi-chien...', 5);
INSERT INTO public.jokes VALUES (732, 2, 2, 'Quelle est la liste la plus douce?', 'La to do list', 5);
INSERT INTO public.jokes VALUES (733, 2, 2, 'Que fait un hibou après une piqûre de guêpe?', 'Hiboursoufle', 5);
INSERT INTO public.jokes VALUES (734, 2, 2, 'Qu''est-ce qu''un nordiste sans frères et soeurs?', 'Un malheureux', 5);
INSERT INTO public.jokes VALUES (735, 2, 2, 'Un sanglier croise un cochon et lui dit :', 'Alors, ça va mieux ta chimio?', 5);
INSERT INTO public.jokes VALUES (736, 2, 2, 'Qu''est-ce qu''une jambe sur un trottoir?', 'Un lépreux qui a marché sur un chewing-gum.', 5);
INSERT INTO public.jokes VALUES (737, 2, 2, 'Pourquoi la Saint-Valentin est-elle davantage fêtée dans le Nord?', 'Parce que ça se fête en famille.', 5);
INSERT INTO public.jokes VALUES (738, 2, 2, 'Que provoque la chute de neige?', 'La chute des vieux.', 5);
INSERT INTO public.jokes VALUES (739, 2, 2, 'Combien de bébés faut-il pour peindre un mur?', 'Tout dépend de la force du jet.', 5);
INSERT INTO public.jokes VALUES (740, 2, 2, 'Pourquoi les blondes frappent-elles le pain contre le mur?', 'Pour casser la croûte!', 5);
INSERT INTO public.jokes VALUES (741, 2, 2, 'Pourquoi une blonde court-elle après un cochon avec une hache?', 'Pour se faire une tirelire!', 5);
INSERT INTO public.jokes VALUES (742, 2, 2, 'Comment un blonde fait-elle pour mettre du texte en italique dans Word?', 'Elle penche l''écran.', 5);
INSERT INTO public.jokes VALUES (743, 2, 2, 'Pourquoi les blondes mettent-elles de l''eau sur leur clavier?', 'Pour surfer sur Internet.', 5);
INSERT INTO public.jokes VALUES (744, 2, 2, 'Comment meurt le neurone d''une blonde?', 'Seul...', 5);
INSERT INTO public.jokes VALUES (745, 2, 2, 'Pourquoi une blonde saute-t-elle dans une flaque à pieds joints?', 'Pour avoir de l''eau plate.', 5);
INSERT INTO public.jokes VALUES (746, 2, 2, 'Quelle est l''activité préférée d''une blonde?', 'Le cerveau lent!', 5);
INSERT INTO public.jokes VALUES (747, 2, 2, 'Comment une blonde fait-elle pour faire un double de ses clefs?', 'Elle les photocopie.', 5);
INSERT INTO public.jokes VALUES (748, 2, 2, 'Comment une blonde éteint la lumière le soir?', 'En fermant les yeux.', 5);
INSERT INTO public.jokes VALUES (749, 2, 2, 'Pourquoi une blonde danse-t-elle devant un feu tricolore?', 'Parce qu elle se croit en boîte de nuit.', 5);
INSERT INTO public.jokes VALUES (750, 2, 2, 'Qu''est-ce qu''une blonde avec un cerveau?', 'Une espèce en voie de disparition.', 5);
INSERT INTO public.jokes VALUES (751, 2, 2, 'Pourquoi les blondes n''aiment-elles pas les ordinateurs?', 'Il n''y a pas de télécommande pour changer de chaîne.', 5);
INSERT INTO public.jokes VALUES (752, 2, 2, 'Que fait une blonde pour se connecter à internet par CPL?', 'Elle met ses doigts dans la prise de téléphone.', 5);
INSERT INTO public.jokes VALUES (753, 2, 2, 'Quelle est la différence entre un ordinateur et une blonde?', 'L''ordinateur a de la mémoire, lui.', 5);
INSERT INTO public.jokes VALUES (754, 2, 2, 'Comment fait une blonde pour éviter que son ordinateur n''attrape un virus?', 'Elle l''entoure d''un préservatif!', 5);
INSERT INTO public.jokes VALUES (755, 2, 2, 'Comment fait une blonde pour savoir si on lui a envoyé un e-mail?', 'Elle va voir dans sa boîte aux lettres!', 5);
INSERT INTO public.jokes VALUES (756, 2, 2, 'Qu''est-ce que la chevalerie?', 'C''est pas là où on range les chevaux?', 5);
INSERT INTO public.jokes VALUES (757, 2, 2, ' Comment appelle-t-on un enfant qui tue son père et ça mère?', 'Un orphelin.', 5);
INSERT INTO public.jokes VALUES (758, 2, 2, 'Quand je fais du judo avec mes gosses, c''est comme à la maison :', 'Je les bats avec ma ceinture noire.', 5);
INSERT INTO public.jokes VALUES (759, 2, 2, 'Si mon futur oncle devient le 4ème Reich comment je l''appelerai?', 'Le für-oncle.', 5);
INSERT INTO public.jokes VALUES (760, 2, 2, 'Pourquoi les décapités deviennent t''ils toujours fous?', 'Parce qu''ils perdent la tête!', 5);
INSERT INTO public.jokes VALUES (761, 2, 2, 'Quesqu''il ne faut jamais faire dans un orphelinat?', 'Chanter Papaoutai.', 5);
INSERT INTO public.jokes VALUES (762, 2, 2, 'Un jour mon père m''a dit qu''il m''exploserai la tête contre mon clavier si je disait qu''il était raciste.', 'hjnfgkskzsa', 5);
INSERT INTO public.jokes VALUES (763, 2, 2, 'Comment on appelle les femmes des terroristes?', 'Des bombes sexuelles.', 5);
INSERT INTO public.jokes VALUES (764, 2, 2, 'C''est quoi le point commun entre un cheval qui tire un carrosse et des esclaves?', 'On met un bon coup de fouet et ça repart.', 5);
INSERT INTO public.jokes VALUES (765, 2, 2, 'Pourquoi les juifs ne peuvent pas être meunier?', 'Car ils ne peuvent pas être au four et au moulin.', 5);
INSERT INTO public.jokes VALUES (766, 2, 2, 'Pourquoi Marine Le Pen ne s''épile que les poils blancs de son cul?', 'Pour mettre les noirs dans la merde.', 5);
INSERT INTO public.jokes VALUES (767, 2, 2, 'A quoi à servit Hitler?', 'Aryen.', 5);
INSERT INTO public.jokes VALUES (768, 2, 2, 'Quelle fût la profession de Kennedy après son mandat de président?', 'Ramasseur de balles.', 5);
INSERT INTO public.jokes VALUES (769, 2, 2, 'Quelle est la différence entre un enfant de chœur catholique et un enfant djihadiste?', 'L''enfant djihadiste se fait sauter qu''une seule fois.', 5);
INSERT INTO public.jokes VALUES (770, 2, 2, 'Pourquoi un groupe de juifs rentrent déçu chez eux ? ', 'Parce qu''ils ont raté leur train.', 5);
INSERT INTO public.jokes VALUES (771, 2, 2, 'Qu''est-ce que Mickael Jackson vend encore?', 'Bah des CD!', 5);
INSERT INTO public.jokes VALUES (772, 2, 2, 'Vous savez comment on convertit de l''argent africain en argent européen?', 'Non ? Eh bien on fait du blanchiment d''argent!', 5);
INSERT INTO public.jokes VALUES (773, 2, 2, 'Monsieur le Curé, je peux rejoindre mes parents?', 'D''accord mais remonte ton slip avant.', 5);
INSERT INTO public.jokes VALUES (774, 2, 2, 'Que dit un chihuahua japonais pour dire bonjour?', 'Konichihuahua.', 5);
INSERT INTO public.jokes VALUES (775, 2, 2, 'Papa, c''est quoi l''humour noir ? Le père répond : "Demandes à ta mère!"', 'Mais... Maman est morte!', 5);
INSERT INTO public.jokes VALUES (776, 2, 2, 'A quelle fête vend-on le plus de rasoirs au Portugal?', 'A la fête des mères.', 5);
INSERT INTO public.jokes VALUES (777, 2, 2, 'Qu''est-ce qu''un tétraplégique en train de nager?', 'Une planche de surf.', 5);
INSERT INTO public.jokes VALUES (778, 2, 2, 'Quelle est la différence entre le Pape et ton père?', 'Tu n''iras jamais au paradis si tu suces ton père.', 5);
INSERT INTO public.jokes VALUES (779, 2, 2, 'Comment appelle t-on une fleur qui prend sa graine à moitié?', 'Une migraine.', 5);
INSERT INTO public.jokes VALUES (780, 2, 2, 'Pourquoi ne faut-il jamais raconter d''histoires drôles à un ballon?', 'Parce qu''il pourrait éclater de rire!', 5);
INSERT INTO public.jokes VALUES (781, 2, 2, 'A combien rouliez-vous ?, demande le gendarme.', 'A deux seulement, mais si vous voulez monter, il reste de la place!', 5);
INSERT INTO public.jokes VALUES (782, 2, 2, 'Qui faudrait-il appeler pour déblayer les trottoirs?', 'La reine déneige.', 5);
INSERT INTO public.jokes VALUES (783, 2, 2, 'Comment appelle-t-on le vent le plus apprécié en été?', 'Le vent Tilo.', 5);
INSERT INTO public.jokes VALUES (784, 2, 2, 'Quel est le comble pour un marin?', 'Avoir le nez qui coule!', 5);
INSERT INTO public.jokes VALUES (785, 2, 2, 'Que dit un oignon quand il se cogne?', 'Aïe...', 5);
INSERT INTO public.jokes VALUES (786, 2, 2, 'Pourquoi le football c''est rigolo?', 'Parce que Thierry en rit.', 5);
INSERT INTO public.jokes VALUES (787, 2, 2, 'Quel est le sport le plus fruité?', 'La boxe, parce que tu te prends des pêches dans la poire et tu tombes dans les pommes.', 5);
INSERT INTO public.jokes VALUES (788, 2, 2, 'Qu''est-ce que les enfants usent le plus à l''école?', 'Le professeur!', 5);
INSERT INTO public.jokes VALUES (789, 2, 2, 'Sur quel métier les chiens peuvent-ils exercer?', 'Electrichien!', 5);
INSERT INTO public.jokes VALUES (790, 2, 2, 'Quel est le point commun entre un pêcheur et un mannequin?', 'Ils surveillent leur ligne!', 5);
INSERT INTO public.jokes VALUES (791, 2, 2, 'Quels sont les animaux qui sont souvent fatigués?', 'Le dodo et le paresseux!', 5);
INSERT INTO public.jokes VALUES (792, 2, 2, 'Quel est l''animal le plus à la mode?', 'La taupe modèle!', 5);
INSERT INTO public.jokes VALUES (793, 2, 2, 'Qu''est-ce qu''une carotte au milieu d''une flaque d''eau?', 'Un bonhomme de neige... Au printemps!', 5);
INSERT INTO public.jokes VALUES (794, 2, 2, 'Pourquoi faut-il se méfier des sirènes au volant?', 'Parce qu''elles font des queues de poisson!', 5);
INSERT INTO public.jokes VALUES (795, 2, 2, 'Quand les abeilles font-elles l''amour?', 'Dare dare!', 5);
INSERT INTO public.jokes VALUES (796, 2, 2, 'Quel animal est sourd?', 'Le crapaud, car il fait coâ, coâ!', 5);
INSERT INTO public.jokes VALUES (797, 2, 2, 'Quelle est la ressemblance entre un facteur et un jongleur?', 'Tous deux ont besoin de beaucoup d''adresse.', 5);
INSERT INTO public.jokes VALUES (798, 2, 2, 'Que dit un vitrier à son fils pour qu''il soit sage?', 'Tiens-toi à carreaux si tu veux une glace!', 5);
INSERT INTO public.jokes VALUES (799, 2, 2, 'Que disent les plongeurs au nouvel an?', 'Bonne Apnée.', 5);
INSERT INTO public.jokes VALUES (800, 2, 2, 'Comment reconnaît-on un idiot dans un magasin de chaussures?', 'C''est celui qui essaie les boites.', 5);
INSERT INTO public.jokes VALUES (801, 2, 2, 'Quelle était la déesse qui énervait le plus Jupiter?', 'C''est Minerve parce qu''elle Minerve, celle-là!', 5);
INSERT INTO public.jokes VALUES (802, 2, 2, 'Quel est le point commun entre un pâtissier et un ciel orageux?', 'Tous les deux font des éclairs.', 5);
INSERT INTO public.jokes VALUES (803, 2, 2, 'Quel est le plat préféré des opticiens?', 'Les lentilles!', 5);
INSERT INTO public.jokes VALUES (804, 2, 2, 'Quel est l''animal le plus malheureux?', 'Le taureau, parce que sa femme est vache.', 5);
INSERT INTO public.jokes VALUES (805, 2, 2, 'Quel avis peut-on donner à un marin?', 'Un avis rond.', 5);
INSERT INTO public.jokes VALUES (806, 2, 2, 'Où trouve-t-on des chats marrants?', 'Dans les livres. Parce qu''on y trouve des chats pitres.', 5);
INSERT INTO public.jokes VALUES (807, 2, 2, 'Pourquoi les Anglais n''aiment-ils pas les grenouilles?', 'Parce qu''elles font le thé tard!', 5);
INSERT INTO public.jokes VALUES (808, 2, 2, 'Quel chars d''assaut permet de construire et non de détruire?', 'Le chars Pentier!', 5);
INSERT INTO public.jokes VALUES (809, 2, 2, 'As-tu déjà fais la guerre ? Non?', 'Ben alors pourquoi as-tu un trou de balle?', 5);
INSERT INTO public.jokes VALUES (810, 2, 2, 'Dans un hôpital, deux fous jouent aux cartes. Soudain, une infirmière arrive avec une seringue. L''un des deux fous s''écrie :', 'Tiens, voilà la dame de pique!', 5);
INSERT INTO public.jokes VALUES (811, 2, 2, 'Deux ouvriers vont travailler sur la Tour Eiffel. Soudin ils s''aperçoivent qu''ils ont oublié leur mètre. A quelle hauteur sont-ils?', 'Ils sont à deux sans mètre!', 5);
INSERT INTO public.jokes VALUES (812, 2, 2, 'Quel est le point commun entre un professeur et un thermomètre?', 'On tremble quand ils marquent zéro!', 5);
INSERT INTO public.jokes VALUES (813, 2, 2, 'Docteur j''ai mal à l''œil gauche quand je bois mon café. Pourquoi?', 'Normal, essayez d''enlever la cuillère de la tasse.', 5);
INSERT INTO public.jokes VALUES (814, 2, 2, 'Un homme est arrêté pour vol de voiture. Des années plus tard, il est libéré...', 'Pour bonne conduite!', 5);
INSERT INTO public.jokes VALUES (815, 2, 2, 'Deux ballons discutent : Si on allait s''éclater ? dit l''un.', 'T''es pas un peu gonflé ? lui répond l''autre.', 5);
INSERT INTO public.jokes VALUES (816, 2, 2, 'Quelle est la capitale de l''île de Tamalou?', 'Gébobola!', 5);
INSERT INTO public.jokes VALUES (817, 2, 2, 'Comment appelle-t-on un chat tombé dans un pot de peinture le jour de Noël?', 'Un chat-peint de Noël!', 5);
INSERT INTO public.jokes VALUES (818, 2, 2, 'Maman, c''est quoi de la lingerie coquine?', 'De la hot couture!', 5);
INSERT INTO public.jokes VALUES (819, 2, 2, 'Que trouve t-on à l''intérieur d''un nez bien propre?', 'Des empreintes digitales...', 5);
INSERT INTO public.jokes VALUES (820, 2, 2, 'Quel est l''animal qui a le plus de dents?', 'La petite souris!', 5);
INSERT INTO public.jokes VALUES (821, 2, 2, 'Que dit un sapin de Noël qui arrive en retard le soir du réveillon?', 'Je vais encore me faire enguirlander!', 5);
INSERT INTO public.jokes VALUES (822, 2, 2, 'Que dit la sorcière à son mari quand elle trouve une chose très facile à faire?', 'Ce n''est pas sorcier!', 5);
INSERT INTO public.jokes VALUES (823, 2, 2, 'C''est deux savons qui se rencontre. Tiens ta maigri depuis la dernière fois, comment t''a fait?', 'J''ai pris un bain.', 5);
INSERT INTO public.jokes VALUES (824, 2, 2, 'Un iceberg vient d''être papa. Comment l''annonce-t-il à ses amis?', 'C''est un petit glaçon.', 5);
INSERT INTO public.jokes VALUES (825, 2, 2, 'Deux gars sont au camping, l''un dit:', 'On va dormir ça te tente?', 5);
INSERT INTO public.jokes VALUES (826, 2, 2, 'Bonjour, je m''appelle Teuse.', 'En chantier!', 5);
INSERT INTO public.jokes VALUES (827, 2, 2, 'C''est l''histoire d''un cannibale qui veut manger son meilleur ami. Il ne sait pas comment s''y prendre alors sa femme lui dit :', 'Tu n''as qu''à mettre ton pote au feu.', 5);
INSERT INTO public.jokes VALUES (828, 2, 2, 'Quel est le coquillage le moins lourd?', 'La palourde.', 5);
INSERT INTO public.jokes VALUES (829, 2, 2, 'Quelle est la ville la plus vieille du monde?', 'La ville de Milan.', 5);
INSERT INTO public.jokes VALUES (830, 2, 2, 'Quel est le fruit préféré des militaires?', 'La grenade.', 5);
INSERT INTO public.jokes VALUES (831, 2, 2, 'Connais-tu l''histoire de l''homme qui habitait juste en face du cimetière?', 'Eh bien, maintenant, il habite en face de chez-lui!', 5);
INSERT INTO public.jokes VALUES (832, 2, 2, 'Deux chiens dans la rue: Regarde, un nouveau lampadaire!', 'Génial, on va arroser ça!', 5);
INSERT INTO public.jokes VALUES (833, 2, 2, 'Que ne faut-il jamais dire à un antiquaire?', 'Alors, quoi de neuf?', 5);
INSERT INTO public.jokes VALUES (834, 2, 2, 'Vous connaissez l''histoire du Neutron qui est passé en jugement au tribunal?', 'Aucune charge n''a pu être retenue contre lui!', 5);
INSERT INTO public.jokes VALUES (835, 2, 2, 'Quelle est la ville la plus proche de l''eau?', 'Bordeaux', 5);
INSERT INTO public.jokes VALUES (836, 2, 2, 'Quelle est la blague à deux balles?', 'Pan Pan!', 5);
INSERT INTO public.jokes VALUES (837, 2, 2, 'Une patate dit à l''autre : Ouais on va se faire griller à la plage!', 'L''autre : Chips alors!', 5);
INSERT INTO public.jokes VALUES (838, 2, 2, 'Pourquoi les sorcières ne portent-elles jamais de culottes?', 'Pour avoir une meilleure adhérence avec le balai...', 5);
INSERT INTO public.jokes VALUES (839, 2, 2, 'Quel est le repas préféré de Dracula?', 'Le croc monsieur!', 5);
INSERT INTO public.jokes VALUES (840, 2, 2, 'Pour un cannibale, une femme enceinte c''est quoi?', 'Un Kinder Surprise.', 5);
INSERT INTO public.jokes VALUES (841, 2, 2, 'Vous saviez que les girafes n''existent pas?', 'C''est un cou monté!', 5);
INSERT INTO public.jokes VALUES (842, 2, 2, 'T''as vu Monte-Carlo?', 'Nan j''ai vu personne monter.', 5);
INSERT INTO public.jokes VALUES (843, 2, 2, 'L''examinateur demande à un étudiant en médecine : Quels sont les os du crâne?', 'Je ne les ai pas tous en tête...!', 5);
INSERT INTO public.jokes VALUES (844, 2, 2, 'Que dit un hibou à sa femme le jour de l''an?', 'Je te chouette une bonne année!', 5);
INSERT INTO public.jokes VALUES (845, 2, 2, 'Quel est le pays où les habitants sont les plus riches?', 'La République Chèque.', 5);
INSERT INTO public.jokes VALUES (846, 2, 2, 'Que fait un DJ sur une patinoire?', 'Il platine.', 5);
INSERT INTO public.jokes VALUES (847, 2, 2, 'Comment appelle-on un parking pour les musulmans?', 'Un parking halal.', 5);
INSERT INTO public.jokes VALUES (848, 2, 2, 'Où se retrouvent les musulmans pour danser?', 'Au bal mosquée.', 5);
INSERT INTO public.jokes VALUES (849, 2, 2, 'Une fillette est retrouvée égorgée dans la rue… L''enquêteur questionne le légiste : Elle a été violée?', 'Non pas encore, j''attendais votre autorisation.', 5);
INSERT INTO public.jokes VALUES (850, 2, 2, 'Une fille à son frère : Tu sais que tu fais l''amour beaucoup mieux que papa?', 'Je sais, maman me l''a déjà dit...', 5);
INSERT INTO public.jokes VALUES (851, 2, 2, 'C''est une femme qui rentre à la maison et dit à son mari : Il faut renvoyer le chauffeur, ça fait deux fois qu''il essaye de me tuer!', 'Laisse lui encore une chance. Répond le mari.', 5);
INSERT INTO public.jokes VALUES (852, 2, 2, 'Comment les enfants de Tchernobyl compte-t-ils jusqu''à 33?', 'Sur leurs doigts...', 5);
INSERT INTO public.jokes VALUES (853, 2, 2, 'Comment fait-on pour tuer une blonde?', 'On jette son rouge à lèvre sur l''autoroute!', 5);
INSERT INTO public.jokes VALUES (854, 2, 2, 'Un homme annonce à sa collègue de bureau, blonde : Je pars pour Milan!', 'Quoi! Si longtemps que ça?', 5);
INSERT INTO public.jokes VALUES (855, 2, 2, 'Comment reconnaître une blonde dans un aéroport?', 'C''est la seule qui lance du pain aux avions.', 5);
INSERT INTO public.jokes VALUES (856, 2, 2, 'Une brune dit à une blonde : "Ho, un oiseau mort!!".', 'Et puis la blonde, regardant vers le ciel : "Ou ça ?".', 5);
INSERT INTO public.jokes VALUES (857, 2, 2, 'Comment une blonde tue-t-elle un ver de terre?', 'Elle l''enterre.', 5);
INSERT INTO public.jokes VALUES (858, 2, 2, 'Deux blondes discutent : Dis, tu as revu Nathalie depuis tout ce temps ? Oh... Tu ne savais pas ? Elle est morte...', 'Ah bien tant mieux... J''ai cru qu''elle était fâchée avec moi!', 5);
INSERT INTO public.jokes VALUES (859, 2, 2, 'Deux blondes jouent aux échecs, l''une dit à l''autre : tu as les règles en tête?', 'Pourquoi!? Je saigne du nez?', 5);
INSERT INTO public.jokes VALUES (860, 2, 2, 'Pourquoi les blondes se mettent devant la fenêtre lors d''un orage?', 'Pour être sur la photo.', 5);
INSERT INTO public.jokes VALUES (861, 2, 2, 'Qu''est-ce qu''une blonde avec une mèche brune?', 'Un brin d''intelligence.', 5);
INSERT INTO public.jokes VALUES (862, 2, 2, 'C''est une blonde qui envoie un SMS à son chéri :', 'Mon chouchou, tu as oublié ton portable à la maison...', 5);
INSERT INTO public.jokes VALUES (863, 2, 2, 'C''est une blonde qui passe un entretien d''embauche : •Prénom ? >Jeanne. •Nom?', 'Mais si je vous jure c''est Jeanne!', 5);
INSERT INTO public.jokes VALUES (864, 2, 2, 'Pourquoi les blondes tondent leur gazon avec une tondeuse électrique?', 'C''est pour qu''elles se servent du fil pour retrouver la maison.', 5);
INSERT INTO public.jokes VALUES (865, 2, 2, 'Qu''est-ce qu''un nem avec des écouteurs?', 'Un NemP3.', 5);
INSERT INTO public.jokes VALUES (866, 2, 2, '2 hommes discutent : On a beaucoup écrit sur moi. Ah, vous êtes connu?', 'Non, tatoué.', 5);
INSERT INTO public.jokes VALUES (867, 2, 2, 'Monsieur, savez-vous que votre chien aboie toute la nuit?', 'Oh, c''est pas grave, il dort toute la journée!', 5);
INSERT INTO public.jokes VALUES (868, 2, 2, 'Qu''est-ce qu''un gendarme sur un tracteur?', 'Un poulet fermier.', 5);
INSERT INTO public.jokes VALUES (869, 2, 2, '2 militaires discutent : "Pourquoi tu t''es engagé ?". Je suis célibataire et j''aime la guerre, et toi?', 'Je suis marié et je voulais avoir la paix.', 5);
INSERT INTO public.jokes VALUES (870, 2, 2, 'Docteur, j''ai besoin de lunettes.', 'Oui certainement. Ici c''est une banque.', 5);
INSERT INTO public.jokes VALUES (871, 2, 2, 'Pourquoi les oiseaux volent-ils vers le sud?', 'Car à pied, c''est beaucoup trop long.', 5);
INSERT INTO public.jokes VALUES (872, 2, 2, 'Pourquoi un cul-de-jatte cherche-t-il à acheter une maison?', 'Pour avoir un pied-à-terre.', 5);
INSERT INTO public.jokes VALUES (873, 2, 2, 'C''est 2 nombrils qui se rencontrent.', 'L''un dit à l''autre : "J''pense qu''il y a une soirée en bas".', 5);
INSERT INTO public.jokes VALUES (874, 2, 2, 'Pourquoi les portefeuilles sont-ils imperméables?', 'Parce qu''on y met du liquide.', 5);
INSERT INTO public.jokes VALUES (875, 2, 2, 'Une fille m''a appelé pour me dire "Viens chez moi, y a personne".', 'J''ai foncé chez elle, puis j''ai sonné, mais il n''y avait personne.', 5);
INSERT INTO public.jokes VALUES (876, 2, 2, 'Que dit un médecin à une crevette avant de l''ausculter?', 'Décortiquez-vous!', 5);
INSERT INTO public.jokes VALUES (877, 2, 2, 'C''est un panda qui en avait marre de la vie et un jour...', 'Il se panda...', 5);
INSERT INTO public.jokes VALUES (878, 2, 2, 'Quand il était petit, quel était le nom de papy Roro?', 'Roro...', 5);
INSERT INTO public.jokes VALUES (879, 2, 2, 'C''est quoi un morceau de patate qui tombe sur la planète?', 'Une météofrite.', 5);
INSERT INTO public.jokes VALUES (880, 2, 2, 'Comment appelle-t-on un roux dans un four?', 'Un roux-ti.', 5);
INSERT INTO public.jokes VALUES (881, 2, 2, 'Pourquoi les électriciens sont-ils les meilleurs au judo?', 'Parce qu''ils connaissent toutes les prises.', 5);
INSERT INTO public.jokes VALUES (882, 2, 2, 'Qui fait 40 heures par semaine au bureau de poste?', 'La machine à café.', 5);
INSERT INTO public.jokes VALUES (883, 2, 2, 'Que crie un donut sur la plage?', 'Hey, je vais me beignet!', 5);
INSERT INTO public.jokes VALUES (884, 2, 2, 'Quelle erreur ne peut-on pas abandonner?', 'L''erreur 403.', 5);
INSERT INTO public.jokes VALUES (885, 2, 2, 'Quel est le style préféré d''un roux?', 'Le roustique.', 5);
INSERT INTO public.jokes VALUES (886, 2, 2, 'Si un humain dit qu''il a un chat dans la gorge, que dit un chat?', 'Rahhh, j''ai mémé dans la trachée!', 5);
INSERT INTO public.jokes VALUES (887, 2, 2, 'Jusqu''à combien peut-on compter avec nos doigts?', '1024', 5);
INSERT INTO public.jokes VALUES (888, 2, 2, 'Stop au racisme! Soyez tous comme Mario :', 'Un Italien, créé par des Japonais, qui parle Anglais, qui ressemble à un Mexicain, qui court comme un Congolais, saute comme un Jamaïcain et qui attrape des pieces comme un juif.', 5);
INSERT INTO public.jokes VALUES (889, 2, 2, 'Je ne suis pas raciste,', 'Pour preuve mon jardinier qui ramasse mon coton est noir.', 5);
INSERT INTO public.jokes VALUES (890, 2, 2, 'Je ne suis pas raciste, le racisme est un crime...', 'et c''est les étrangers qui font des crimes.', 5);
INSERT INTO public.jokes VALUES (891, 2, 2, 'Que dit un ordinateur pour draguer?', 'Coucou, tu veux voir mes 64 bits?', 5);
INSERT INTO public.jokes VALUES (892, 2, 2, 'Quel est le parc où les gens tremblent?', 'Le Parkinson', 5);
INSERT INTO public.jokes VALUES (893, 2, 2, 'Quelle est la différence entre un Thermos et un portefeuille?', 'Aucune, dans les deux cas on y met du liquide dedans.', 5);
INSERT INTO public.jokes VALUES (894, 2, 2, 'Comment appelle-t-on une petite infirmière rousse?', 'Une p''tite rousse de soin. ', 5);
INSERT INTO public.jokes VALUES (895, 2, 2, 'J''avais une blague sur les piscines,', 'mais elle est tombée à l''eau...', 5);
INSERT INTO public.jokes VALUES (896, 2, 2, 'Un prof de physique interroge sa classe d’élèves : Quels sont les meilleurs matériaux combustibles?', 'Un élève juif lève la main avec excitation : "Je sais! Je sais! Moi Monsieur! Moi!" Le professeur lui répond : "Excellente réponse, et quoi d’autres ?"', 5);
INSERT INTO public.jokes VALUES (897, 2, 2, 'Un prêtre entre dans un McDo et demande un menu enfant. On lui demande : Frites et coca?', 'Juste l’enfant, s’il vous plaît!', 5);
INSERT INTO public.jokes VALUES (898, 2, 2, 'Un prêtre entre dans un McDo et demande un menu enfant. On lui demande : Frites et coca?', 'Juste l’enfant, s’il vous plaît!', 5);
INSERT INTO public.jokes VALUES (899, 2, 2, 'Un garçon sans bras ni jambes est envoyé dans un camp de vacances par ses parents. Ce dernier saute dans la piscine et nage comme un dauphin. L’animateur devant cette scène lui demandes comment il a appris à nager?', 'C’est papa qui m’a appris depuis tout petit. Le plus dur, c’est d’enlever le sac poubelle.', 5);
INSERT INTO public.jokes VALUES (900, 2, 2, 'Un trisomique se rend chez un ami. Il sonne à la porte, son ami ouvre et lui dit :', 'Ben dis donc, tu t’es mis sur ton 21 aujourd’hui!', 5);
INSERT INTO public.jokes VALUES (901, 2, 2, 'Quel est le point commun entre un nécrophile et un homme qui se baigne en Bretagne?', 'Tous les deux disent : Elle est froide mais une fois dedans, elle est bonne.', 5);
INSERT INTO public.jokes VALUES (902, 2, 2, 'Quel est le point commun entre les cheveux et les avions?', 'Il y en a toujours qui tombent.', 5);
INSERT INTO public.jokes VALUES (903, 2, 2, 'Je dis pas que tu es une salope.', 'Mais tu es plus facile à pénétrer que la Pologne.', 5);
INSERT INTO public.jokes VALUES (904, 2, 2, 'Que dit un programmeur SQL pour exprimer son mépris?', 'SELECT finger FROM hand WHERE id=3;', 5);
INSERT INTO public.jokes VALUES (905, 2, 2, 'Que''est-ce que deux trous dans un trou?', 'Mon nez dans ton cul...', 5);
INSERT INTO public.jokes VALUES (906, 2, 2, 'Le petit Poucet...', '...mais rien ne sortait ', 5);
INSERT INTO public.jokes VALUES (907, 2, 2, 'Quelle est la différence entre un bébé blanc et un bébé noir?', '20 minutes, thermostat 8', 5);
INSERT INTO public.jokes VALUES (908, 2, 2, 'Qu''est-ce qu''un noir et deux blancs dans un plan à trois?', 'Un pain au chocolat', 5);
INSERT INTO public.jokes VALUES (909, 2, 2, 'Quelle est la collation que les enfants canibale ne mangent pas quand leur parents sont absents?', 'Leurs parents!', 5);
INSERT INTO public.jokes VALUES (910, 2, 2, 'Comment appelle-t''on une bonne mère espagnole d''origine Africaine?', 'Mamadouoé', 5);
INSERT INTO public.jokes VALUES (911, 2, 2, 'Quel est l''inverse du divorce?', 'Le partage', 5);
INSERT INTO public.jokes VALUES (912, 2, 2, 'Pourquoi les paroles de Jésus ont elles été entendues par les chrétiens?', 'Parce que Jésus crit très fort.', 5);
INSERT INTO public.jokes VALUES (913, 2, 2, 'Vous conaissez l''histoire de l''erreur 403', 'J''ai interdiction de vous la dire.', 5);
INSERT INTO public.jokes VALUES (914, 2, 2, 'Pourquoi les ascenseurs sont-ils des meurtriers?', 'Parce qu''ils descendent des gens.', 5);
INSERT INTO public.jokes VALUES (915, 2, 2, 'Un âne dit a un autre: Comment tu t''appelles?', 'Bob, dit l''âne.', 5);
INSERT INTO public.jokes VALUES (916, 2, 2, 'Pourquoi les noirs adorent la patisserie?', 'C''est le seul moyen qu''ils ont de pouvoir battre les blancs.', 5);
INSERT INTO public.jokes VALUES (917, 2, 2, 'Qu''est ce qu''un juif qui court?', 'Une étoile filante.', 5);
INSERT INTO public.jokes VALUES (918, 2, 2, 'Si un juifs devient cuisinier...', 'Est-ce qu''on peut dire que c''est un chef étoilé?', 5);
INSERT INTO public.jokes VALUES (919, 2, 2, 'Quel est le légume le plus bête?', 'Le chicon, car il est ar-chi con.', 5);
INSERT INTO public.jokes VALUES (920, 2, 2, 'Quel est le comble pour un cuisto?', 'Ne pas être dans son assiette.', 5);
INSERT INTO public.jokes VALUES (921, 2, 2, 'Quel est le comble pour un serveur?', 'C''est de ne pas répondre.', 5);
INSERT INTO public.jokes VALUES (922, 2, 2, 'Hitler se rend à Auschwitz et va voir une petite fille : Bonjour ma petite, quel âge as-tu ? J''aurai 8 ans demain!', 'C''est bien d''être optimiste.', 5);
INSERT INTO public.jokes VALUES (923, 2, 2, 'Qu''est-ce que des handicapés au hammam?', 'Des légumes vapeurs.', 5);
INSERT INTO public.jokes VALUES (924, 2, 2, 'Pourquoi les companies aériennes arabes sont-elles aussi réputées?', 'Parce que ce sont celles qui volent le mieux.', 5);
INSERT INTO public.jokes VALUES (925, 2, 2, 'Comment calcule-ton le temps d''évasion d''un juif?', 'Hauteur de la cheminée multiplié par la force du vent.', 5);
INSERT INTO public.jokes VALUES (926, 2, 2, 'Quelle est la seule personne à avoir dit "Je vais te nicker ta race" et à l''avoir vraiment fait?', 'Adolf Hitler', 5);
INSERT INTO public.jokes VALUES (927, 2, 2, 'Quel est le comble pour un juif?', 'Ne pas finir brûlé dans une blague.', 5);
INSERT INTO public.jokes VALUES (928, 2, 2, 'Hier, j''ai croisé 2 roux. Vous savez ce que je leurs ai demandé?', 'Bah alors, il est où le guidon?', 5);
INSERT INTO public.jokes VALUES (929, 2, 2, 'Quelle est la différence entre un Juif et un scoute?', 'Le scoute il revient du camp.', 5);
INSERT INTO public.jokes VALUES (930, 2, 2, 'Qu''est ce que deux anorexiques avec des menottes?', 'Un nunchaku', 5);
INSERT INTO public.jokes VALUES (931, 2, 2, 'Un farceur condamné avale deux kilos de maïs juste avant sa sentence...', '...dans le but de mettre l''ambiance au crématorium.', 5);
INSERT INTO public.jokes VALUES (932, 2, 2, 'Qu''est ce qu''un somalien à poil?', 'Un Mikado', 5);
INSERT INTO public.jokes VALUES (933, 2, 2, 'Quelle est la différence entre un juif et une pizza?', 'Vous avez déjà vu une pizza taper à la porte du four?', 5);
INSERT INTO public.jokes VALUES (934, 2, 2, 'Quelle est la différence entre une mine d''or et une mousse au chocolat?', 'Aucune, dans les 2 cas, c''est le noir qui se fait fouetter.', 5);
INSERT INTO public.jokes VALUES (935, 2, 2, 'Quels sont les risques pour un pittbull de bouffer un bébé diabétique?', 'Attraper des caries.', 5);
INSERT INTO public.jokes VALUES (936, 2, 2, 'La femme ayant été décapitée', 'Il nous a été impossible jusqu’à présent de mettre un nom sur son visage.', 5);
INSERT INTO public.jokes VALUES (937, 2, 2, 'Comment appelle-t''on un enfant qui tue son père et sa mère?', 'Un Orphelin', 5);
INSERT INTO public.jokes VALUES (938, 2, 2, 'Pourquoi Ray Charles et Stevie Wonder chantent toujours en se balançant de gauche à droite?', 'Parce qu''ils cherchent leur micro', 5);
INSERT INTO public.jokes VALUES (939, 2, 2, 'Pourquoi Jésus a été crucifié et non pas noyé?', 'Tu te vois avec un aquarium au-dessus de ta porte?', 5);
INSERT INTO public.jokes VALUES (940, 2, 2, 'Quelle différence entre un cornichon et un corbillard?', 'Aucune, ils accompagnent tous les deux de la viande froide!', 5);
INSERT INTO public.jokes VALUES (941, 2, 2, 'Tu as vu la femme de Ray Charles?', 'Lui non plus', 5);
INSERT INTO public.jokes VALUES (942, 2, 2, 'Savez-vous où l''on trouve le meilleur jardin d''enfants à New-York?', 'À Manhattan, il y a deux tours niquées', 5);
INSERT INTO public.jokes VALUES (943, 2, 2, 'Savez-vous pourquoi Dieu à créé la femme?', 'Car il ne savait pas comment créer un lave-vaisselle qui suce.', 5);
INSERT INTO public.jokes VALUES (944, 2, 2, 'Quel est le biscuit préfèré d''Internet?', 'Le cookie', 5);
INSERT INTO public.jokes VALUES (945, 2, 2, 'Quelle est la fée la plus méchante?', 'La fée C', 5);
INSERT INTO public.jokes VALUES (946, 2, 2, 'Quelle est la fée la plus paresseuse?', 'La fée Néante', 5);
INSERT INTO public.jokes VALUES (947, 2, 2, 'Quelle est la fée préférée des hommes?', 'La fée Lation', 5);
INSERT INTO public.jokes VALUES (948, 2, 2, 'Quel est la différence entre un jeu et un logiciel?', 'Le prix de la license!', 5);
INSERT INTO public.jokes VALUES (949, 2, 2, 'Quelle est la différence entre les blagues et les pénis?', 'Les blagues les plus courtes sont les meilleures!', 5);
INSERT INTO public.jokes VALUES (950, 2, 2, 'Que fait un chinois qui tombe de la tour Eiffel?', 'CHIIIIIIIIIN... toc', 5);
INSERT INTO public.jokes VALUES (951, 2, 2, 'Pourquoi c''est un danger de ne pas avoir raison?', 'Parce que le tort tue.', 5);
INSERT INTO public.jokes VALUES (952, 2, 2, 'Mon premier est un singe, mon deuxième est une souris, et mon troisième est un cochon. Qui suis-je?', 'Un mutant', 5);
INSERT INTO public.jokes VALUES (953, 2, 2, 'Quel est le point commun entre un robot et une pizza?', 'Ils sont tous les deux automates.', 5);
INSERT INTO public.jokes VALUES (954, 2, 2, 'Chuck Norris ne suit pas le mode d''emploi...', 'C''est le mode d''emploi qui le suit.', 5);
INSERT INTO public.jokes VALUES (955, 2, 2, 'Chuck Norris n''a pas de père.', 'On ne nique pas la mère de Chuck Norris.', 5);
INSERT INTO public.jokes VALUES (956, 2, 2, 'Chuck Norris a franchi l''Everest...', 'À la nage.', 5);
INSERT INTO public.jokes VALUES (957, 2, 2, 'Quand Chuck Norris se cogne le petit orteil sur un coin de table...', 'C''est la table qui a mal.', 5);
INSERT INTO public.jokes VALUES (958, 2, 2, 'Chuck Norris ne sait pas à quoi ressemble Nicolas Sarkozy.', 'Parce que Chuck Norris ne baisse jamais les yeux.', 5);
INSERT INTO public.jokes VALUES (959, 2, 2, 'Un jour Chuck Norris a eu un zero en latin...', 'Depuis c''est une langue morte.', 5);
INSERT INTO public.jokes VALUES (960, 2, 2, 'Un jour Chuck Norris a lancé une grenade et a tué 50 personnes!', 'Ensuite, la grenade a explosé...', 5);
INSERT INTO public.jokes VALUES (961, 2, 2, 'Une seule Tortue Ninja à osé défié Chuck Norris.', 'Maintenant on l''appelle Franklin.', 5);
INSERT INTO public.jokes VALUES (962, 2, 2, 'Chuck Norris ne se masturbe jamais.', 'Chuck Norris est inébranlable.', 5);
INSERT INTO public.jokes VALUES (963, 2, 2, 'Cherchez l''intrus : Un rouge-gorge, un pigeon, un moineau et Chuck Norris.', 'Un rouge-gorge, un pigeon et un moineau.', 5);
INSERT INTO public.jokes VALUES (964, 2, 2, 'Chuck Norris ne ment pas.', 'C''est la vérité qui se trompe.', 5);
INSERT INTO public.jokes VALUES (965, 2, 2, 'Chuck Norris peut ressusciter...', 'Un angle mort.', 5);
INSERT INTO public.jokes VALUES (966, 2, 2, 'Un jour un mec a refuser de filer une clope à Chuck Norris.', 'Depuis, on prévient sur tous les paquets que "Fumer tue".', 5);
INSERT INTO public.jokes VALUES (967, 2, 2, 'Un jour, les Powers Rangers ont rencontré Chuck Norris.', 'Maintenant on les appelle les Télétubbies.', 5);
INSERT INTO public.jokes VALUES (968, 2, 2, 'Hercule est un demi-dieu.', 'Dieu est un demi-Chuck Norris.', 5);
INSERT INTO public.jokes VALUES (969, 2, 2, 'Chuck Norris est le seul homme...', 'à posséder une bible dédicacée.', 5);
INSERT INTO public.jokes VALUES (970, 2, 2, 'Quand Chuck Norris lance une pièce, elle fait toujours pile.', 'Personne ne fait face à Chuck Norris!', 5);
INSERT INTO public.jokes VALUES (971, 2, 2, 'Quand Chuck Norris fait une baston de regard avec le soleil...', 'il y a une éclipse.', 5);
INSERT INTO public.jokes VALUES (972, 2, 2, 'Chuck Norris peut se souvenir...', 'du futur.', 5);
INSERT INTO public.jokes VALUES (973, 2, 2, 'Chuck Norris peut faire rentrer 3 litres d''eau...', 'dans une bouteille d''un litre.', 5);
INSERT INTO public.jokes VALUES (974, 2, 2, 'Chuck Norris a gagné un tournoi de poker...', 'avec des cartes Pokémon.', 5);
INSERT INTO public.jokes VALUES (975, 2, 2, 'Si Chuck Norris avait joué dans "Il faut sauver le soldat Ryan"...', 'le film se serait appelé "Il faut sauver l''armée allemande".', 5);
INSERT INTO public.jokes VALUES (976, 2, 2, 'Un jour, un gaulois a cru qu''il pouvait attaquer Chuck Norris après avoir bu de la potion magique.', 'Il s''appelait Paraplégix.', 5);
INSERT INTO public.jokes VALUES (977, 2, 2, 'Quand Chuck Norris joue à Resident Evil...', 'c''est les zombies qui doivent survivre.', 5);
INSERT INTO public.jokes VALUES (978, 2, 2, 'Moïse a coupé la mer en deux.', 'Chuck Norris l''a recollé en disant "Tu refais ça, je te pète la gueule".', 5);
INSERT INTO public.jokes VALUES (979, 2, 2, 'Lorsque Chuck Norris va au cinema et que son portable sonne...', 'On met sur pause.', 5);
INSERT INTO public.jokes VALUES (980, 2, 2, 'Quand Chuck Norris fait une erreur lors de l''examen d''histoire...', 'l''histoire change.', 5);
INSERT INTO public.jokes VALUES (981, 2, 2, 'Si Mickey a quatre doigts...', 'c''est parce qu''il a fait un doigt d''honneur à Chuck Norris.', 5);
INSERT INTO public.jokes VALUES (982, 2, 2, 'Chuck Norris traverse le terrain d''Olive et Tom...', 'en moins d''un épisode.', 5);
INSERT INTO public.jokes VALUES (983, 2, 2, 'Chuck Norris a déjà compté jusqu''à l''infini.', 'Deux fois.', 5);
INSERT INTO public.jokes VALUES (984, 2, 2, 'A l''école Chuck Norris ne faisait pas une sarbacane avec ses vieux stylos.', 'Il faisait un 357 magnum.', 5);
INSERT INTO public.jokes VALUES (985, 2, 2, 'Chuck Norris x 0 = Chuck Norris.', 'On élimine pas Chuck Norris aussi facilement.', 5);
INSERT INTO public.jokes VALUES (986, 2, 2, 'Chuck Norris a invité Albert Einstein...', 'à son dîner de cons.', 5);
INSERT INTO public.jokes VALUES (987, 2, 2, 'Un jour, un canard et un castor se sont foutu de la gueule de Chuck Norris.', 'Depuis, l''ornithorynque a vraiment l''air d''un con.', 5);
INSERT INTO public.jokes VALUES (988, 2, 2, 'Il y a bien longtemps Chuck Norris et Dieu se sont battus.', 'Vous avez vu Dieu récemment?', 5);
INSERT INTO public.jokes VALUES (989, 2, 2, 'Chuck Norris joue au cerf-volant...', 'avec de vrais cerfs.', 5);
INSERT INTO public.jokes VALUES (990, 2, 2, 'Chuck Norris a battu le record de saut à la perche...', 'sans prendre d''élan, sans perche et sans sauter.', 5);
INSERT INTO public.jokes VALUES (991, 2, 2, 'Si la douleur n''est qu''une information pour le Terminator...', 'Elle n''est qu''une rumeur sans fondement pour Chuck Norris.', 5);
INSERT INTO public.jokes VALUES (992, 2, 2, 'Pi est égale a 3,14...', 'Pas par coïncidence, seulement parce que la 3eme lettre de l''alphabet est C et la 14eme est N... Pi=CN=Chuck Norris.', 5);
INSERT INTO public.jokes VALUES (993, 2, 2, 'Si le Titanic a coulé...', 'c''est parce que Chuck Norris avait entendu un blondinet crier "Je suis le maître du monde!".', 5);
INSERT INTO public.jokes VALUES (994, 2, 2, 'Un jour, Chuck Norris a pété un câble.', 'Ainsi est né le Wi-Fi.', 5);
INSERT INTO public.jokes VALUES (995, 2, 2, 'Chuck Norris a déjà eu Alzheimer.', 'Il s''en souvient très bien.', 5);
INSERT INTO public.jokes VALUES (996, 2, 2, 'Indiana Jones a survécu à l''explosion d''une bombe nucléaire en se cachant dans un frigo ', 'Chuck Norris a survécu à la chute de l''astéroïde qui pulvérisa les dinosaures en mettant un K-Way.', 5);
INSERT INTO public.jokes VALUES (997, 2, 2, 'Chuck Norris peut...', 'Y aller par 4 chemins.', 5);
INSERT INTO public.jokes VALUES (998, 2, 2, 'Quand Chuck Norris lui dit qu''il est gros...', 'Obélix ferme sa gueule.', 5);
INSERT INTO public.jokes VALUES (999, 2, 2, 'Archimède a dit: "Donnez moi un point d''appui, un levier, et je vous soulèverai le monde!".', 'Chuck Norris a dit: "Donnez moi 30 secondes!".', 5);
INSERT INTO public.jokes VALUES (1000, 2, 2, 'Comme la foudre...', 'Chuck Norris ne frappe jamais deux fois au même endroit. Pas besoin.', 5);
INSERT INTO public.jokes VALUES (1, 2, 1, 'Znám spoustu vtipů ve znakové řeči, které nikdo neslyšel!', 'null', 1);
INSERT INTO public.jokes VALUES (15, 3, 1, 'Die Selbsthilfegruppe "HTML-Sonderzeichen-Probleme" trifft sich heute im gro&szlig;en Saal.', 'null', 2);
INSERT INTO public.jokes VALUES (16, 3, 1, 'Wenn man diese CD rückwärts spielt, sind satanische Verse zu hören.
Viel schlimmer, wenn man sie vorwärts spielt, installiert sie Windows.', 'null', 2);
INSERT INTO public.jokes VALUES (17, 3, 1, 'Die Mutter schickt ihren Sohn mit folgender Einkaufsliste in den Supermarkt: "Eine Packung Milch, und wenn die Eier haben, bring drei Packungen mit."
Im Supermarkt stellt der Sohn fest, es gibt dort Eier, also bringt er drei Packungen Milch mit.', 'null', 2);
INSERT INTO public.jokes VALUES (18, 3, 1, 'Täglich verschwinden hunderte Senioren im Netz, weil sie "Alt" und "Entf" drücken.', 'null', 2);
INSERT INTO public.jokes VALUES (19, 3, 1, 'Facebook ist wie ein Gefängnis. Man sitzt rum, verschwendet Zeit, schreibt an Wände und wird angestupst von Leuten die man nicht kennt.', 'null', 2);
INSERT INTO public.jokes VALUES (22, 3, 1, 'Treffen sich ein Informatiker und ein Wirtschaftsinformatiker.
Informatiker: "Hast Du schon das neue Ubuntu?"
Der Wirtschaftsinformatiker: "Nein, ich steh nicht auf Pokemon."', 'null', 2);
INSERT INTO public.jokes VALUES (24, 2, 1, 'Wer zuletzt lacht ... hat den höchsten Ping.', 'null', 2);
INSERT INTO public.jokes VALUES (25, 2, 1, 'Das echte Leben nervt ... aber die Grafik ist gut.', 'null', 2);
INSERT INTO public.jokes VALUES (26, 3, 1, 'Deine Mutter ist wie ein L3-Cache. Sie wird zwischen allen 4 Kernen durchgereicht und jeder hat Zugriff.', 'null', 2);
INSERT INTO public.jokes VALUES (29, 2, 1, 'Ich hab gerade den DJ angerufen. Er hat aufgelegt.', 'null', 2);
INSERT INTO public.jokes VALUES (30, 2, 1, 'Ein Beamter zum anderen: "Was haben die Leute nur, wir tun doch nichts!"', 'null', 2);
INSERT INTO public.jokes VALUES (34, 3, 1, 'Today I learned that changing random stuff until your program works is "hacky" and a "bad coding practice" but if you do it fast enough it''s "Machine Learning" and pays 4x your current salary.', 'null', 3);
INSERT INTO public.jokes VALUES (35, 3, 1, 'Eight bytes walk into a bar.
The bartender asks, "Can I get you anything?"
"Yeah," reply the bytes.
"Make us a double."', 'null', 3);
INSERT INTO public.jokes VALUES (36, 3, 1, 'There are only 10 kinds of people in this world: those who know binary and those who don''t.', 'null', 3);
INSERT INTO public.jokes VALUES (37, 3, 1, '"Knock, knock."
"Who''s there?"

[very long pause]

"Java."', 'null', 3);
INSERT INTO public.jokes VALUES (38, 3, 1, 'Programming is 10% science, 20% ingenuity, and 70% getting the ingenuity to work with the science.', 'null', 3);
INSERT INTO public.jokes VALUES (163, 4, 1, 'Dark humor is like food, not everyone gets it.', 'null', 3);
INSERT INTO public.jokes VALUES (39, 3, 1, 'A man is smoking a cigarette and blowing smoke rings into the air. His girlfriend becomes irritated with the smoke and says "Can''t you see the warning on the cigarette pack? Smoking is hazardous to your health!" to which the man replies, "I am a programmer.  We don''t worry about warnings; we only worry about errors."', 'null', 3);
INSERT INTO public.jokes VALUES (40, 3, 1, 'The generation of random numbers is too important to be left to chance.', 'null', 3);
INSERT INTO public.jokes VALUES (41, 3, 1, 'Debugging: Removing the needles from the haystack.', 'null', 3);
INSERT INTO public.jokes VALUES (42, 3, 1, 'Hey Girl,
Roses are #ff0000,
Violets are #0000ff,
I use hex codes,
But I''d use RGB for you.', 'null', 3);
INSERT INTO public.jokes VALUES (43, 3, 1, 'Debugging is like being the detective in a crime movie where you''re also the murderer at the same time.', 'null', 3);
INSERT INTO public.jokes VALUES (44, 3, 1, 'How do you tell HTML from HTML5?
- Try it out in Internet Explorer
- Did it work?
- No?
- It''s HTML5.', 'null', 3);
INSERT INTO public.jokes VALUES (45, 3, 1, 'Have a great weekend!
I hope your code behaves the same on Monday as it did on Friday.', 'null', 3);
INSERT INTO public.jokes VALUES (46, 3, 1, 'Judge: "I sentence you to the maximum punishment..."
Me (thinking): "Please be death, please be death..."
Judge: "Learn Java!"
Me: "Damn."', 'null', 3);
INSERT INTO public.jokes VALUES (52, 3, 1, 'Algorithm: A word used by programmers when they don''t want to explain how their code works.', 'null', 3);
INSERT INTO public.jokes VALUES (56, 3, 1, 'Your momma is so fat, you need to switch to NTFS to store a picture of her.', 'null', 3);
INSERT INTO public.jokes VALUES (58, 3, 1, '"Can I tell you a TCP joke?"
"Please tell me a TCP joke."
"OK, I''ll tell you a TCP joke."', 'null', 3);
INSERT INTO public.jokes VALUES (73, 2, 1, 'Two reasons I don''t give money to homeless people.
1) They are going to spend it all on drugs and alcohol
2) I am going to spend it all on drugs and alcohol.', 'null', 3);
INSERT INTO public.jokes VALUES (74, 2, 1, 'A neutron walks into a bar and asks for a price on a drink.
The barkeeper says: "For you... no charge!"', 'null', 3);
INSERT INTO public.jokes VALUES (75, 5, 1, 'A horse walks into a bar.
"Hey", the Bartender says.
"Sure", the horse replies.', 'null', 3);
INSERT INTO public.jokes VALUES (83, 5, 1, 'I have these weird muscle spasms in my gluteus maximus.
I figured out from my doctor that everything was alright:
He said "Weird flex, butt okay."', 'null', 3);
INSERT INTO public.jokes VALUES (91, 5, 1, 'Oysters hate to give away their pearls because they are shellfish.', 'null', 3);
INSERT INTO public.jokes VALUES (97, 4, 1, 'I didn''t vaccinate my 10 kids and the one that survived is fine!', 'null', 3);
INSERT INTO public.jokes VALUES (104, 4, 1, 'Me and my Jewish friend were eating lunch and I farted. He got mad so I said "cmon man a little gas never killed anyone".', 'null', 3);
INSERT INTO public.jokes VALUES (115, 2, 1, 'Stop being homophobic and rude to the LGBTQ+ community. You should be thanking them for saving us plenty of room in heaven.', 'null', 3);
INSERT INTO public.jokes VALUES (124, 3, 1, 'The six stages of debugging:
1. That can''t happen.
2. That doesn''t happen on my machine.
3. That shouldn''t happen.
4. Why does that happen?
5. Oh, I see.
6. How did that ever work?', 'null', 3);
INSERT INTO public.jokes VALUES (127, 5, 1, 'I''m reading a book about anti-gravity. It''s impossible to put down!', 'null', 3);
INSERT INTO public.jokes VALUES (133, 3, 1, 'Four engineers get into a car. The car won''t start.
The Mechanical engineer says "It''s a broken starter".
The Electrical engineer says "Dead battery".
The Chemical engineer says "Impurities in the gasoline".
The IT engineer says "Hey guys, I have an idea: How about we all get out of the car and get back in".', 'null', 3);
INSERT INTO public.jokes VALUES (134, 4, 1, 'Nowadays people are so sensitive, you can''t even say "black paint" anymore.
Instead, you have to say "Jamal, please paint the fence".', 'null', 3);
INSERT INTO public.jokes VALUES (139, 4, 1, 'Doctor: "I have some news about your baby."
Parents: "Don''t tell us the gender, we want to keep it a surprise."
Doctor: "Oh I get it, you''re those type of people. Okay, well IT is not breathing."', 'null', 3);
INSERT INTO public.jokes VALUES (140, 2, 1, 'If you''re here for the yodeling lesson, please form an orderly orderly orderly queue.', 'null', 3);
INSERT INTO public.jokes VALUES (150, 2, 1, 'Women are like KFC, once you''re done with the breasts and thighs, you just have a greasy box to put your bone in.', 'null', 3);
INSERT INTO public.jokes VALUES (153, 4, 1, 'My ex had an accident. I told the paramedics the wrong blood type for her. She''ll finally experience what rejection is really like.', 'null', 3);
INSERT INTO public.jokes VALUES (166, 4, 1, 'My little daughter came to me all excited, saying "Daddy! Daddy! Guess how old I''ll be in June!"
"Oh I don''t know princess, why don''t you tell me?" I said. She gave me a huge smile and held up four fingers.
It''s now three hours later, police have joined in and she still won''t say where she got them.', 'null', 3);
INSERT INTO public.jokes VALUES (179, 4, 1, 'My grandfather says I''m too reliant on technology.
I called him a hypocrite and unplugged his life support.', 'null', 3);
INSERT INTO public.jokes VALUES (181, 3, 1, 'Knock knock.
Who''s there?
Recursion.
Recursion who?
Knock knock.', 'null', 3);


--
-- TOC entry 2876 (class 0 OID 98953)
-- Dependencies: 207
-- Data for Name: jokes_flags; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.jokes_flags VALUES (1, 2);
INSERT INTO public.jokes_flags VALUES (1, 4);
INSERT INTO public.jokes_flags VALUES (1, 6);
INSERT INTO public.jokes_flags VALUES (2, 2);
INSERT INTO public.jokes_flags VALUES (2, 4);
INSERT INTO public.jokes_flags VALUES (4, 1);
INSERT INTO public.jokes_flags VALUES (4, 6);
INSERT INTO public.jokes_flags VALUES (7, 1);
INSERT INTO public.jokes_flags VALUES (7, 6);
INSERT INTO public.jokes_flags VALUES (18, 1);
INSERT INTO public.jokes_flags VALUES (18, 6);
INSERT INTO public.jokes_flags VALUES (25, 1);
INSERT INTO public.jokes_flags VALUES (25, 6);
INSERT INTO public.jokes_flags VALUES (29, 3);
INSERT INTO public.jokes_flags VALUES (47, 5);
INSERT INTO public.jokes_flags VALUES (55, 6);
INSERT INTO public.jokes_flags VALUES (60, 2);
INSERT INTO public.jokes_flags VALUES (61, 5);
INSERT INTO public.jokes_flags VALUES (62, 1);
INSERT INTO public.jokes_flags VALUES (62, 6);
INSERT INTO public.jokes_flags VALUES (64, 1);
INSERT INTO public.jokes_flags VALUES (64, 6);
INSERT INTO public.jokes_flags VALUES (66, 1);
INSERT INTO public.jokes_flags VALUES (66, 6);
INSERT INTO public.jokes_flags VALUES (69, 6);
INSERT INTO public.jokes_flags VALUES (70, 3);
INSERT INTO public.jokes_flags VALUES (71, 5);
INSERT INTO public.jokes_flags VALUES (75, 1);
INSERT INTO public.jokes_flags VALUES (75, 6);
INSERT INTO public.jokes_flags VALUES (77, 3);
INSERT INTO public.jokes_flags VALUES (79, 1);
INSERT INTO public.jokes_flags VALUES (79, 6);
INSERT INTO public.jokes_flags VALUES (83, 1);
INSERT INTO public.jokes_flags VALUES (83, 6);
INSERT INTO public.jokes_flags VALUES (84, 6);
INSERT INTO public.jokes_flags VALUES (89, 1);
INSERT INTO public.jokes_flags VALUES (91, 1);
INSERT INTO public.jokes_flags VALUES (91, 6);
INSERT INTO public.jokes_flags VALUES (95, 4);
INSERT INTO public.jokes_flags VALUES (98, 3);
INSERT INTO public.jokes_flags VALUES (99, 4);
INSERT INTO public.jokes_flags VALUES (100, 4);
INSERT INTO public.jokes_flags VALUES (101, 1);
INSERT INTO public.jokes_flags VALUES (101, 6);
INSERT INTO public.jokes_flags VALUES (102, 4);
INSERT INTO public.jokes_flags VALUES (102, 6);
INSERT INTO public.jokes_flags VALUES (103, 4);
INSERT INTO public.jokes_flags VALUES (103, 6);
INSERT INTO public.jokes_flags VALUES (104, 4);
INSERT INTO public.jokes_flags VALUES (104, 6);
INSERT INTO public.jokes_flags VALUES (105, 3);
INSERT INTO public.jokes_flags VALUES (105, 6);
INSERT INTO public.jokes_flags VALUES (106, 4);
INSERT INTO public.jokes_flags VALUES (106, 6);
INSERT INTO public.jokes_flags VALUES (107, 1);
INSERT INTO public.jokes_flags VALUES (107, 6);
INSERT INTO public.jokes_flags VALUES (108, 4);
INSERT INTO public.jokes_flags VALUES (109, 1);
INSERT INTO public.jokes_flags VALUES (109, 6);
INSERT INTO public.jokes_flags VALUES (110, 2);
INSERT INTO public.jokes_flags VALUES (110, 4);
INSERT INTO public.jokes_flags VALUES (111, 1);
INSERT INTO public.jokes_flags VALUES (111, 6);
INSERT INTO public.jokes_flags VALUES (112, 4);
INSERT INTO public.jokes_flags VALUES (113, 2);
INSERT INTO public.jokes_flags VALUES (114, 2);
INSERT INTO public.jokes_flags VALUES (115, 1);
INSERT INTO public.jokes_flags VALUES (115, 6);
INSERT INTO public.jokes_flags VALUES (116, 4);
INSERT INTO public.jokes_flags VALUES (116, 6);
INSERT INTO public.jokes_flags VALUES (120, 6);
INSERT INTO public.jokes_flags VALUES (121, 6);
INSERT INTO public.jokes_flags VALUES (122, 1);
INSERT INTO public.jokes_flags VALUES (122, 6);
INSERT INTO public.jokes_flags VALUES (124, 4);
INSERT INTO public.jokes_flags VALUES (128, 4);
INSERT INTO public.jokes_flags VALUES (128, 6);
INSERT INTO public.jokes_flags VALUES (129, 4);
INSERT INTO public.jokes_flags VALUES (129, 6);
INSERT INTO public.jokes_flags VALUES (131, 2);
INSERT INTO public.jokes_flags VALUES (133, 4);
INSERT INTO public.jokes_flags VALUES (134, 5);
INSERT INTO public.jokes_flags VALUES (136, 6);
INSERT INTO public.jokes_flags VALUES (137, 1);
INSERT INTO public.jokes_flags VALUES (137, 6);
INSERT INTO public.jokes_flags VALUES (142, 6);
INSERT INTO public.jokes_flags VALUES (149, 1);
INSERT INTO public.jokes_flags VALUES (149, 5);
INSERT INTO public.jokes_flags VALUES (149, 6);
INSERT INTO public.jokes_flags VALUES (150, 4);
INSERT INTO public.jokes_flags VALUES (150, 6);
INSERT INTO public.jokes_flags VALUES (151, 1);
INSERT INTO public.jokes_flags VALUES (151, 6);
INSERT INTO public.jokes_flags VALUES (153, 6);
INSERT INTO public.jokes_flags VALUES (154, 6);
INSERT INTO public.jokes_flags VALUES (155, 1);
INSERT INTO public.jokes_flags VALUES (155, 6);
INSERT INTO public.jokes_flags VALUES (156, 1);
INSERT INTO public.jokes_flags VALUES (156, 6);
INSERT INTO public.jokes_flags VALUES (157, 1);
INSERT INTO public.jokes_flags VALUES (157, 6);
INSERT INTO public.jokes_flags VALUES (158, 1);
INSERT INTO public.jokes_flags VALUES (158, 6);
INSERT INTO public.jokes_flags VALUES (159, 1);
INSERT INTO public.jokes_flags VALUES (159, 2);
INSERT INTO public.jokes_flags VALUES (159, 6);
INSERT INTO public.jokes_flags VALUES (160, 1);
INSERT INTO public.jokes_flags VALUES (160, 6);
INSERT INTO public.jokes_flags VALUES (161, 1);
INSERT INTO public.jokes_flags VALUES (161, 6);
INSERT INTO public.jokes_flags VALUES (162, 4);
INSERT INTO public.jokes_flags VALUES (162, 6);
INSERT INTO public.jokes_flags VALUES (163, 1);
INSERT INTO public.jokes_flags VALUES (163, 6);
INSERT INTO public.jokes_flags VALUES (164, 1);
INSERT INTO public.jokes_flags VALUES (164, 6);
INSERT INTO public.jokes_flags VALUES (167, 1);
INSERT INTO public.jokes_flags VALUES (167, 6);
INSERT INTO public.jokes_flags VALUES (170, 1);
INSERT INTO public.jokes_flags VALUES (170, 6);
INSERT INTO public.jokes_flags VALUES (172, 1);
INSERT INTO public.jokes_flags VALUES (172, 6);
INSERT INTO public.jokes_flags VALUES (173, 4);
INSERT INTO public.jokes_flags VALUES (173, 6);
INSERT INTO public.jokes_flags VALUES (174, 4);
INSERT INTO public.jokes_flags VALUES (175, 1);
INSERT INTO public.jokes_flags VALUES (175, 6);
INSERT INTO public.jokes_flags VALUES (179, 1);
INSERT INTO public.jokes_flags VALUES (179, 4);
INSERT INTO public.jokes_flags VALUES (179, 6);
INSERT INTO public.jokes_flags VALUES (181, 3);


--
-- TOC entry 2873 (class 0 OID 98911)
-- Dependencies: 204
-- Data for Name: language; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.language VALUES (1, 'cs', 'Czech');
INSERT INTO public.language VALUES (2, 'de', 'German');
INSERT INTO public.language VALUES (3, 'en', 'English');
INSERT INTO public.language VALUES (4, 'es', 'Spanish');
INSERT INTO public.language VALUES (5, 'fr', 'French');
INSERT INTO public.language VALUES (6, 'pt', 'Portuguese');


--
-- TOC entry 2874 (class 0 OID 98919)
-- Dependencies: 205
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.types VALUES (1, 'single');
INSERT INTO public.types VALUES (2, 'twopart');


--
-- TOC entry 2889 (class 0 OID 0)
-- Dependencies: 208
-- Name: seq_categories; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_categories', 7, true);


--
-- TOC entry 2890 (class 0 OID 0)
-- Dependencies: 209
-- Name: seq_flags; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_flags', 6, true);


--
-- TOC entry 2891 (class 0 OID 0)
-- Dependencies: 212
-- Name: seq_jokes; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_jokes', 1000, true);


--
-- TOC entry 2892 (class 0 OID 0)
-- Dependencies: 210
-- Name: seq_languages; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_languages', 6, true);


--
-- TOC entry 2893 (class 0 OID 0)
-- Dependencies: 211
-- Name: seq_types; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_types', 2, true);


--
-- TOC entry 2726 (class 2606 OID 98902)
-- Name: categories pk_categories; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT pk_categories PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 98910)
-- Name: flags pk_flag; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flags
    ADD CONSTRAINT pk_flag PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 98934)
-- Name: jokes pk_jokes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jokes
    ADD CONSTRAINT pk_jokes PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 98957)
-- Name: jokes_flags pk_jokes_flags; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jokes_flags
    ADD CONSTRAINT pk_jokes_flags PRIMARY KEY (joke_id, flag_id);


--
-- TOC entry 2730 (class 2606 OID 98918)
-- Name: language pk_language; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT pk_language PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 98926)
-- Name: types pk_type; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT pk_type PRIMARY KEY (id);


--
-- TOC entry 2733 (class 1259 OID 98950)
-- Name: fki_fk_category; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_category ON public.jokes USING btree (category_id);


--
-- TOC entry 2734 (class 1259 OID 98951)
-- Name: fki_fk_language; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_language ON public.jokes USING btree (language_id);


--
-- TOC entry 2735 (class 1259 OID 98952)
-- Name: fki_fk_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_type ON public.jokes USING btree (type_id);


--
-- TOC entry 2740 (class 2606 OID 98935)
-- Name: jokes fk_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jokes
    ADD CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- TOC entry 2743 (class 2606 OID 98958)
-- Name: jokes_flags fk_flags; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jokes_flags
    ADD CONSTRAINT fk_flags FOREIGN KEY (flag_id) REFERENCES public.flags(id);


--
-- TOC entry 2744 (class 2606 OID 98963)
-- Name: jokes_flags fk_jokes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jokes_flags
    ADD CONSTRAINT fk_jokes FOREIGN KEY (joke_id) REFERENCES public.jokes(id);


--
-- TOC entry 2741 (class 2606 OID 98940)
-- Name: jokes fk_language; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jokes
    ADD CONSTRAINT fk_language FOREIGN KEY (language_id) REFERENCES public.language(id);


--
-- TOC entry 2742 (class 2606 OID 98945)
-- Name: jokes fk_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jokes
    ADD CONSTRAINT fk_type FOREIGN KEY (type_id) REFERENCES public.types(id);


-- Completed on 2022-12-19 02:51:01

--
-- PostgreSQL database dump complete
--

