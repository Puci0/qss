--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2024-11-06 14:31:17

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 217 (class 1259 OID 16448)
-- Name: awatar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.awatar (
    id_awataru serial,
    sciezka_do_pliku character varying(100) NOT NULL
);


ALTER TABLE public.awatar OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16453)
-- Name: czat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.czat (
    id_czatu serial,
    id_uzytkownika1 integer NOT NULL,
    id_uzytkownika2 integer NOT NULL,
    data_utworzenia timestamp DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.czat OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16458)
-- Name: kategoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kategoria (
    id_kategorii serial,
    nazwa character varying(50) NOT NULL
);


ALTER TABLE public.kategoria OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16463)
-- Name: kategoria_podkategoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kategoria_podkategoria (
    id_podkategorii integer NOT NULL,
    id_kategorii integer NOT NULL
);


ALTER TABLE public.kategoria_podkategoria OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16468)
-- Name: komentarz; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.komentarz (
    id_komentarza serial,
    id_uzytkownika integer NOT NULL,
    id_ogloszenia integer NOT NULL,
    tresc text NOT NULL,
    data_utworzenia timestamp DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.komentarz OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16475)
-- Name: multimedia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.multimedia (
    id_multimediow serial,
    sciezka_do_pliku character varying(100) NOT NULL
);


ALTER TABLE public.multimedia OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16480)
-- Name: ogloszenie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ogloszenie (
    id_ogloszenia serial,
    id_uzytkownika integer NOT NULL,
    tytul character varying(150) NOT NULL,
    opis text NOT NULL,
    data_utworzenia timestamp DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.ogloszenie OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16487)
-- Name: ogloszenie_podkategoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ogloszenie_podkategoria (
    id_ogloszenia integer NOT NULL,
    id_podkategorii integer NOT NULL
);


ALTER TABLE public.ogloszenie_podkategoria OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16492)
-- Name: podkategoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.podkategoria (
    id_podkategorii serial,
    nazwa character varying(100) NOT NULL
);


ALTER TABLE public.podkategoria OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16497)
-- Name: polubienia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.polubienia (
    id_polubienia serial,
    id_ogloszenia integer NOT NULL,
    id_uzytkownika integer NOT NULL,
    typ bool NOT NULL
);


ALTER TABLE public.polubienia OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16502)
-- Name: uzytkownik; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uzytkownik (
    id_uzytkownika serial,
    imie character varying(50) NOT NULL,
    nazwisko character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    haslo character varying(100) NOT NULL,
    srednia_ocena numeric,
    id_awataru integer,
    ostatnie_logowanie timestamp DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.uzytkownik OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16509)
-- Name: wiadomosc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wiadomosc (
    id_wiadomosci serial,
    id_czatu integer NOT NULL,
    id_uzytkownika integer NOT NULL,
    tresc text NOT NULL,
    data_utworzenia timestamp DEFAULT CURRENT_TIMESTAMP,
    id_multimediow integer
);


ALTER TABLE public.wiadomosc OWNER TO postgres;

--
-- TOC entry 4922 (class 0 OID 16448)
-- Dependencies: 217
-- Data for Name: awatar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.awatar (id_awataru, sciezka_do_pliku) FROM stdin;
\.


--
-- TOC entry 4923 (class 0 OID 16453)
-- Dependencies: 218
-- Data for Name: czat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.czat (id_czatu, id_uzytkownika1, id_uzytkownika2, data_utworzenia) FROM stdin;
\.


--
-- TOC entry 4924 (class 0 OID 16458)
-- Dependencies: 219
-- Data for Name: kategoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kategoria (id_kategorii, nazwa) FROM stdin;
\.


--
-- TOC entry 4925 (class 0 OID 16463)
-- Dependencies: 220
-- Data for Name: kategoria_podkategoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kategoria_podkategoria (id_podkategorii, id_kategorii) FROM stdin;
\.


--
-- TOC entry 4926 (class 0 OID 16468)
-- Dependencies: 221
-- Data for Name: komentarz; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.komentarz (id_komentarza, id_uzytkownika, id_ogloszenia, tresc) FROM stdin;
\.


--
-- TOC entry 4927 (class 0 OID 16475)
-- Dependencies: 222
-- Data for Name: multimedia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.multimedia (id_multimediow, sciezka_do_pliku) FROM stdin;
\.


--
-- TOC entry 4928 (class 0 OID 16480)
-- Dependencies: 223
-- Data for Name: ogloszenie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ogloszenie (id_ogloszenia, tytul, opis, id_uzytkownika, data_utworzenia) FROM stdin;
\.


--
-- TOC entry 4929 (class 0 OID 16487)
-- Dependencies: 224
-- Data for Name: ogloszenie_podkategoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ogloszenie_podkategoria (id_ogloszenia, id_podkategorii) FROM stdin;
\.


--
-- TOC entry 4930 (class 0 OID 16492)
-- Dependencies: 225
-- Data for Name: podkategoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.podkategoria (id_podkategorii, nazwa) FROM stdin;
\.


--
-- TOC entry 4931 (class 0 OID 16497)
-- Dependencies: 226
-- Data for Name: polubienia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.polubienia (id_polubienia, id_ogloszenia, id_uzytkownika, typ) FROM stdin;
\.


--
-- TOC entry 4932 (class 0 OID 16502)
-- Dependencies: 227
-- Data for Name: uzytkownik; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.uzytkownik (id_uzytkownika, imie, nazwisko, email, haslo, srednia_ocena, id_awataru, ostatnie_logowanie) FROM stdin;
\.


--
-- TOC entry 4933 (class 0 OID 16509)
-- Dependencies: 228
-- Data for Name: wiadomosc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wiadomosc (id_wiadomosci, id_czatu, id_uzytkownika, tresc, data_utworzenia, id_multimediow) FROM stdin;
\.


--
-- TOC entry 4741 (class 2606 OID 16457)
-- Name: czat czat_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.czat
    ADD CONSTRAINT czat_pk PRIMARY KEY (id_czatu);


--
-- TOC entry 4743 (class 2606 OID 16462)
-- Name: kategoria kategoria_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategoria
    ADD CONSTRAINT kategoria_pk PRIMARY KEY (id_kategorii);


--
-- TOC entry 4745 (class 2606 OID 16467)
-- Name: kategoria_podkategoria kategoria_podkategoria_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategoria_podkategoria
    ADD CONSTRAINT kategoria_podkategoria_pk PRIMARY KEY (id_podkategorii);


--
-- TOC entry 4747 (class 2606 OID 16474)
-- Name: komentarz komentarz_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.komentarz
    ADD CONSTRAINT komentarz_pk PRIMARY KEY (id_komentarza);


--
-- TOC entry 4749 (class 2606 OID 16479)
-- Name: multimedia multimedia_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.multimedia
    ADD CONSTRAINT multimedia_pk PRIMARY KEY (id_multimediow);


--
-- TOC entry 4739 (class 2606 OID 16452)
-- Name: awatar multimediav1_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awatar
    ADD CONSTRAINT multimediav1_pk PRIMARY KEY (id_awataru);


--
-- TOC entry 4753 (class 2606 OID 16491)
-- Name: ogloszenie_podkategoria ogloszenie_podkategoria_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ogloszenie_podkategoria
    ADD CONSTRAINT ogloszenie_podkategoria_pk PRIMARY KEY (id_podkategorii, id_ogloszenia);


--
-- TOC entry 4751 (class 2606 OID 16486)
-- Name: ogloszenie ogłoszenie_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ogloszenie
    ADD CONSTRAINT "ogłoszenie_pk" PRIMARY KEY (id_ogloszenia);


--
-- TOC entry 4755 (class 2606 OID 16496)
-- Name: podkategoria podkategoria_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.podkategoria
    ADD CONSTRAINT podkategoria_pk PRIMARY KEY (id_podkategorii);


--
-- TOC entry 4757 (class 2606 OID 16501)
-- Name: polubienia polubienia_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polubienia
    ADD CONSTRAINT polubienia_pk PRIMARY KEY (id_polubienia);


--
-- TOC entry 4759 (class 2606 OID 16508)
-- Name: uzytkownik użytkownik_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uzytkownik
    ADD CONSTRAINT "użytkownik_pk" PRIMARY KEY (id_uzytkownika);


--
-- TOC entry 4761 (class 2606 OID 16515)
-- Name: wiadomosc wiadomość_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiadomosc
    ADD CONSTRAINT "wiadomość_pk" PRIMARY KEY (id_wiadomosci);


--
-- TOC entry 4762 (class 2606 OID 16516)
-- Name: czat czat_uzytkownik_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.czat
    ADD CONSTRAINT czat_uzytkownik_fk FOREIGN KEY (id_uzytkownika1) REFERENCES public.uzytkownik(id_uzytkownika);


--
-- TOC entry 4763 (class 2606 OID 16521)
-- Name: czat czat_uzytkownik_fkv2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.czat
    ADD CONSTRAINT czat_uzytkownik_fkv2 FOREIGN KEY (id_uzytkownika2) REFERENCES public.uzytkownik(id_uzytkownika);


--
-- TOC entry 4764 (class 2606 OID 16526)
-- Name: kategoria_podkategoria kategoria_podkategoria_kategoria_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategoria_podkategoria
    ADD CONSTRAINT kategoria_podkategoria_kategoria_fk FOREIGN KEY (id_kategorii) REFERENCES public.kategoria(id_kategorii);


--
-- TOC entry 4765 (class 2606 OID 16531)
-- Name: kategoria_podkategoria kategoria_podkategoria_podkategoria_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategoria_podkategoria
    ADD CONSTRAINT kategoria_podkategoria_podkategoria_fk FOREIGN KEY (id_podkategorii) REFERENCES public.podkategoria(id_podkategorii);


--
-- TOC entry 4766 (class 2606 OID 16536)
-- Name: komentarz komentarz_ogloszenie_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.komentarz
    ADD CONSTRAINT komentarz_ogloszenie_fk FOREIGN KEY (id_ogloszenia) REFERENCES public.ogloszenie(id_ogloszenia);


--
-- TOC entry 4767 (class 2606 OID 16541)
-- Name: komentarz komentarz_uzytkownik_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.komentarz
    ADD CONSTRAINT komentarz_uzytkownik_fk FOREIGN KEY (id_uzytkownika) REFERENCES public.uzytkownik(id_uzytkownika);


--
-- TOC entry 4769 (class 2606 OID 16546)
-- Name: ogloszenie_podkategoria ogloszenie_podkategoria_ogloszenie_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ogloszenie_podkategoria
    ADD CONSTRAINT ogloszenie_podkategoria_ogloszenie_fk FOREIGN KEY (id_ogloszenia) REFERENCES public.ogloszenie(id_ogloszenia);


--
-- TOC entry 4770 (class 2606 OID 16551)
-- Name: ogloszenie_podkategoria ogloszenie_podkategoria_podkategoria_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ogloszenie_podkategoria
    ADD CONSTRAINT ogloszenie_podkategoria_podkategoria_fk FOREIGN KEY (id_podkategorii) REFERENCES public.podkategoria(id_podkategorii);


--
-- TOC entry 4768 (class 2606 OID 16556)
-- Name: ogloszenie ogloszenie_uzytkownik_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ogloszenie
    ADD CONSTRAINT ogloszenie_uzytkownik_fk FOREIGN KEY (id_uzytkownika) REFERENCES public.uzytkownik(id_uzytkownika);


--
-- TOC entry 4771 (class 2606 OID 16561)
-- Name: polubienia polubienia_ogloszenie_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polubienia
    ADD CONSTRAINT polubienia_ogloszenie_fk FOREIGN KEY (id_ogloszenia) REFERENCES public.ogloszenie(id_ogloszenia);


--
-- TOC entry 4772 (class 2606 OID 16566)
-- Name: polubienia polubienia_uzytkownik_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polubienia
    ADD CONSTRAINT polubienia_uzytkownik_fk FOREIGN KEY (id_uzytkownika) REFERENCES public.uzytkownik(id_uzytkownika);


--
-- TOC entry 4773 (class 2606 OID 16571)
-- Name: uzytkownik uzytkownik_awatar_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uzytkownik
    ADD CONSTRAINT uzytkownik_awatar_fk FOREIGN KEY (id_awataru) REFERENCES public.awatar(id_awataru);


--
-- TOC entry 4774 (class 2606 OID 16576)
-- Name: wiadomosc wiadomosc_czat_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiadomosc
    ADD CONSTRAINT wiadomosc_czat_fk FOREIGN KEY (id_czatu) REFERENCES public.czat(id_czatu);


--
-- TOC entry 4775 (class 2606 OID 16581)
-- Name: wiadomosc wiadomosc_multimedia_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiadomosc
    ADD CONSTRAINT wiadomosc_multimedia_fk FOREIGN KEY (id_multimediow) REFERENCES public.multimedia(id_multimediow);


--
-- TOC entry 4776 (class 2606 OID 16586)
-- Name: wiadomosc wiadomosc_uzytkownik_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiadomosc
    ADD CONSTRAINT wiadomosc_uzytkownik_fk FOREIGN KEY (id_uzytkownika) REFERENCES public.uzytkownik(id_uzytkownika);


-- Awatary
INSERT INTO public.awatar (sciezka_do_pliku)
VALUES 
	('/images/avatars/grzesiek.png'),
    ('/images/avatars/hubert.png'),
    ('/images/avatars/jakub.png'),
    ('/images/avatars/wojciech_gosiewski.png'),
    ('/images/avatars/wojciech_domanski.png'),
    ('/images/avatars/dominik.png'),
    ('/images/avatars/arkadiusz.png');

-- Użytkownicy
INSERT INTO public.uzytkownik (imie, nazwisko, email, haslo, srednia_ocena, id_awataru)
VALUES 
    -- grzesiek123
	('Grzesiek', 'Gresiuk', 'grzegorz.gresiuk@example.com', '$2b$12$W3h8EArOdrmrFhVHguSh3Ofh.yaW9NKMqtyxYAv0WBLppIJxZ/Mle', 5, 1),
    -- hubert123
    ('Hubert', 'Durka', 'hubert.durka@example.com', '$2b$12$mSmIvGM99Lg07E/PTN8KIenivFztguZMCMANcFNBhaCa99boBVN1C', 5, 2),
    -- jakub123
    ('Jakub', 'Gerwel', 'jakub.gerwel@example.com', '$2b$12$aKzraNG6tAKBKBIsIi252ehZ354dvOVZVxDVc320ZJVmiqxhqvAOy', 4.8, 3),
    -- wojciech123
    ('Wojciech', 'Gosiewski', 'wojciech.gosiewski@example.com', '$2b$12$PNBGa.ePNkSJjeLeng9i0.zKE275jItd4NZwWC6dRv6cIatSjs3bi', 4.9, 4),
    -- wojciechd123
    ('Wojciech', 'Domański', 'wojciech.domanski@example.com', '$2b$12$zqkxhRHR/SacqLPf63EyJe2c4yiouKwe3NCMcOLwkDNnDRh2x/77q', 4.7, 5),
    -- dominik123
    ('Dominik', 'Gąsowski', 'dominik.gasowski@example.com', '$2b$12$N88pCCZSO48qje68rFjSaezjOdVsk9rimjyjmTln7oCbUc4pTHoxC', 4.6, 6),
    -- arkadiusz123
    ('Arkadiusz', 'Gnidziejko', 'arkadiusz.gnidziejko@example.com', '$2b$12$PavMX4etVs9Jep0iLRAXEOUrrorLRbBd.mDqC0Qyvq68ITyZ7swyC', 2, 7);

--Kategorie
INSERT INTO public.kategoria (nazwa)
VALUES
	('Informatyka'),
	('Medycyna'),
	('Motoryzacja'),
	('Serwis AGD'),
	('Elektronika'),
	('Edukacja'),
	('Sport'),
	('Zdrowie i fitness'),
	('Finanse osobiste'),
	('Dom i ogród'),
	('Marketing i reklama');

--Podkategorie do informatyki
INSERT INTO public.podkategoria (nazwa)
VALUES
	('Inżynieria oprogramowania'),
	('Sieci komputerowe'),
	('Sztuczna inteligencja i uczenie maszynowe'),
	('Bazy danych'),
	('Oprogramowanie mobilne'),
	('Game Dev'),
	('Robotyka i automatyka');

-- Podkategorie do medycyny
INSERT INTO public.podkategoria (nazwa)
VALUES
	('Medycyna ogólna'),
	('Chirurgia'),
	('Neurologia'),
	('Kardiologia'),
	('Onkologia'),
	('Psychiatria'),
	('Pediatria'),
	('Medycyna estetyczna'),
	('Farmakologia'),
	('Rehabilitacja'),
	('Medycyna pracy'),
	('Medycyna sportowa'),
	('Ginekologia i położnictwo'),
	('Endokrynologia');

-- Podkategorie do motoryzacji
INSERT INTO public.podkategoria (nazwa)
VALUES
    ('Mechanika pojazdowa'),
    ('Tuning samochodowy'),
    ('Samochody elektryczne i hybrydowe'),
    ('Diagnostyka i naprawy'),
    ('Motocykle i skutery'),
    ('Transport i logistyka'),
    ('Bezpieczeństwo na drodze'),
    ('Części i akcesoria samochodowe'),
    ('Historia motoryzacji'),
    ('Wyścigi i sporty motorowe');

-- Podkategorie do serwisu AGD
INSERT INTO public.podkategoria (nazwa)
VALUES
    ('Naprawa pralek'),
    ('Naprawa lodówek i zamrażarek'),
    ('Serwis zmywarek'),
    ('Konserwacja piekarników i kuchenek'),
    ('Serwis kuchenek mikrofalowych'),
    ('Naprawa odkurzaczy'),
    ('Konserwacja ekspresów do kawy'),
    ('Naprawa drobnego sprzętu AGD'),
    ('Instalacja i konfiguracja urządzeń AGD'),
    ('Poradniki i wsparcie techniczne AGD');

-- Podkategorie do elektroniki
INSERT INTO public.podkategoria (nazwa)
VALUES
    ('Projektowanie układów elektronicznych'),
    ('Serwis RTV'),
    ('Mikrokontrolery i Arduino'),
    ('Technologia audio-wideo'),
    ('Inteligentne domy i IoT'),
    ('Naprawa i konserwacja sprzętu elektronicznego'),
    ('Elektronika użytkowa'),
    ('Telefony i urządzenia mobilne'),
    ('Technologia komputerowa'),
    ('Poradniki DIY z zakresu elektroniki');

-- Podkategorie do edukacji
INSERT INTO public.podkategoria (nazwa)
VALUES
    ('Nauka zdalna'),
    ('Kursy online i e-learning'),
    ('Metody nauczania'),
    ('Rozwój zawodowy'),
    ('Szkolenia i certyfikaty'),
    ('Podstawy programowania'),
    ('Języki obce'),
    ('Technologie edukacyjne'),
    ('Poradniki dla nauczycieli'),
    ('Przygotowanie do egzaminów');

-- Podkategorie do sportu
INSERT INTO public.podkategoria (nazwa)
VALUES
    ('Piłka nożna'),
    ('Koszykówka'),
    ('Siatkówka'),
    ('Lekkoatletyka'),
    ('Sporty wodne'),
    ('Sporty zimowe'),
    ('Fitness i kulturystyka'),
    ('Sztuki walki'),
    ('Kolarstwo'),
    ('Sporty motorowe');

-- Podkategorie do zdrowia i fitnessu
INSERT INTO public.podkategoria (nazwa)
VALUES
    ('Dieta i odżywianie'),
    ('Trening siłowy'),
    ('Cardio i wytrzymałość'),
    ('Joga i pilates'),
    ('Zdrowie psychiczne'),
    ('Rehabilitacja i fizjoterapia'),
    ('Zdrowie skóry i włosów'),
    ('Wellness i medytacja'),
    ('Zarządzanie stresem'),
    ('Porady zdrowotne');

-- Podkategorie do finansów osobistych
INSERT INTO public.podkategoria (nazwa)
VALUES
    ('Budżet domowy'),
    ('Oszczędzanie i inwestowanie'),
    ('Emerytury i plany oszczędnościowe'),
    ('Kredyty i pożyczki'),
    ('Ubezpieczenia osobiste'),
    ('Planowanie finansowe'),
    ('Podatki osobiste'),
    ('Inwestowanie na giełdzie'),
    ('Nieruchomości i inwestycje'),
    ('Finanse osobiste dla przedsiębiorców');

-- Podkategorie do domu i ogrodu
INSERT INTO public.podkategoria (nazwa)
VALUES
    ('Aranżacja wnętrz'),
    ('Meble i wyposażenie'),
    ('Renowacja i remonty'),
    ('Ogród i rośliny'),
    ('Zrównoważony rozwój i ekologia'),
    ('Sprzęt AGD do domu'),
    ('Systemy ogrzewania i klimatyzacja'),
    ('Instalacje elektryczne i hydrauliczne'),
    ('Bezpieczeństwo w domu'),
    ('Poradniki DIY do domu i ogrodu');

-- Podkategorie do marketingu i reklamy
INSERT INTO public.podkategoria (nazwa)
VALUES
    ('Marketing internetowy'),
    ('SEO i SEM'),
    ('Content marketing'),
    ('Marketing w mediach społecznościowych'),
    ('Reklama płatna (PPC)'),
    ('Marketing afiliacyjny'),
    ('Branding i budowanie marki'),
    ('Marketing mobilny'),
    ('Public Relations'),
    ('Analiza danych i marketing');

-- Połączenie kategorii z podkategoriami
INSERT INTO public.kategoria_podkategoria (id_podkategorii, id_kategorii)
VALUES
    (1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1),  -- Informatyka
    (8, 2), (9, 2), (10, 2), (11, 2), (12, 2), (13, 2), (14, 2), (15, 2), (16, 2), (17, 2), (18, 2), (19, 2), (20, 2), (21, 2),  -- Medycyna
    (22, 3), (23, 3), (24, 3), (25, 3), (26, 3), (27, 3), (28, 3), (29, 3), (30, 3), (31, 3),  -- Motoryzacja
    (32, 4), (33, 4), (34, 4), (35, 4), (36, 4), (37, 4), (38, 4), (39, 4), (40, 4), (41, 4),  -- Serwis AGD
    (42, 5), (43, 5), (44, 5), (45, 5), (46, 5), (47, 5), (48, 5), (49, 5), (50, 5), (51, 5),  -- Elektronika
    (52, 6), (53, 6), (54, 6), (55, 6), (56, 6), (57, 6), (58, 6), (59, 6), (60, 6), (61, 6),  -- Edukacja
    (62, 7), (63, 7), (64, 7), (65, 7), (66, 7), (67, 7), (68, 7), (69, 7), (70, 7), (71, 7),  -- Sport
    (72, 8), (73, 8), (74, 8), (75, 8), (76, 8), (77, 8), (78, 8), (79, 8), (80, 8), (81, 8),  -- Zdrowie i fitness
    (82, 9), (83, 9), (84, 9), (85, 9), (86, 9), (87, 9), (88, 9), (89, 9), (90, 9), (91, 9),  -- Finanse osobiste
    (92, 10), (93, 10), (94, 10), (95, 10), (96, 10), (97, 10), (98, 10), (99, 10), (100, 10), (101, 10),  -- Dom i ogród
    (102, 11), (103, 11), (104, 11), (105, 11), (106, 11), (107, 11), (108, 11), (109, 11), (110, 11), (111, 11);  -- Marketing i reklama

-- Tworzenie czatów między użytkownikami
INSERT INTO public.czat (id_uzytkownika1, id_uzytkownika2)
VALUES
    (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7),
    (2, 3), (2, 4), (2, 5), (2, 6), (2, 7),
    (3, 4), (3, 5), (3, 6), (3, 7),
    (4, 5), (4, 6), (4, 7),
    (5, 6), (5, 7),
    (6, 7); 

-- Tworzenie ogłoszeń
INSERT INTO public.ogloszenie (id_uzytkownika, tytul, opis)
VALUES
    (1, 'Usługi z zakresu inżynierii oprogramowania', 'Oferuję usługi inżynierii oprogramowania, tworzenie aplikacji i systemów.'),
    (1, 'Naprawa komputerów', 'Specjalizuję się w naprawie komputerów, diagnostyce i konserwacji sprzętu elektronicznego.'),
    (1, 'Trening personalny', 'Oferuję profesjonalne treningi personalne dopasowane do Twoich potrzeb i celów.'),
    (2, 'Oferuję kursy online z zakresu programowania', 'Prowadzę kursy z podstaw programowania w różnych językach.'),
    (2, 'Naprawa motocykli', 'Oferuję profesjonalne naprawy motocykli, diagnostyka i konserwacja.'),
    (2, 'Konsultacje zdrowotne', 'Oferuję konsultacje zdrowotne i porady dotyczące zdrowia psychicznego.'),
    (3, 'Tworzenie aplikacji mobilnych', 'Specjalizuję się w tworzeniu aplikacji mobilnych na platformy Android i iOS.'),
    (3, 'Serwis RTV', 'Oferuję naprawy telewizorów, dekoderów, oraz innych urządzeń RTV.'),
    (3, 'Treningi fitness', 'Organizuję indywidualne treningi fitness i sesje jogi dla każdego poziomu zaawansowania.'),
    (4, 'Konsultacje z zakresu sztucznej inteligencji', 'Pomogę w opracowaniu projektów związanych z AI, automatyzacją procesów.'),
    (4, 'Naprawa sprzętu AGD', 'Oferuję naprawy i konserwację sprzętu AGD, w tym lodówek i pralek.'),
    (4, 'Szkolenia z zakresu marketingu internetowego', 'Oferuję kursy i szkolenia z SEO, SEM oraz marketingu w mediach społecznościowych.'),
    (5, 'Tworzenie stron internetowych', 'Specjalizuję się w projektowaniu i tworzeniu nowoczesnych stron internetowych.'),
    (5, 'Serwis komputerów', 'Oferuję profesjonalny serwis komputerowy, naprawy laptopów i komputerów stacjonarnych.'),
    (5, 'Konsultacje dietetyczne', 'Oferuję porady dietetyczne i układam plany żywieniowe dopasowane do Twoich potrzeb.'),
    (6, 'Automatyzacja procesów w firmach', 'Pomagam firmom w automatyzacji procesów z wykorzystaniem nowoczesnych technologii.'),
    (6, 'Renowacja sprzętu elektronicznego', 'Oferuję renowację i naprawę sprzętu elektronicznego, w tym telefonów i tabletów.'),
    (6, 'Zajęcia fitness', 'Prowadzę zajęcia fitness i jogi, indywidualne podejście do każdego klienta.'),
    (7, 'Programowanie w Pythonie', 'Prowadzę kursy i konsultacje z zakresu programowania w Pythonie.'),
    (7, 'Usługi naprawy samochodów', 'Oferuję usługi naprawy i diagnostyki samochodów, również elektrycznych i hybrydowych.'),
    (7, 'Porady zdrowotne', 'Oferuję konsultacje zdrowotne z zakresu medycyny sportowej oraz rehabilitacji.');

INSERT INTO public.ogloszenie_podkategoria (id_ogloszenia, id_podkategorii)
VALUES
    (1, 1),  -- Usługi z zakresu inżynierii oprogramowania -> Inżynieria oprogramowania
    (2, 44), -- Naprawa komputerów -> Mikrokontrolery i Arduino
    (3, 68), -- Trening personalny -> Fitness i kulturystyka
    (4, 57), -- Oferuję kursy online z zakresu programowania -> Podstawy programowania
    (5, 26), -- Naprawa motocykli -> Motocykle i skutery
    (6, 76), -- Konsultacje zdrowotne -> Zdrowie psychiczne
    (7, 5),  -- Tworzenie aplikacji mobilnych -> Oprogramowanie mobilne
    (8, 43), -- Serwis RTV -> Serwis RTV
    (9, 68), -- Treningi fitness -> Fitness i kulturystyka
    (10, 3), -- Konsultacje z zakresu sztucznej inteligencji -> Sztuczna inteligencja i uczenie maszynowe
    (11, 40), -- Naprawa sprzętu AGD -> Naprawa drobnego sprzętu AGD
    (12, 102), -- Szkolenia z zakresu marketingu internetowego -> Marketing internetowy
    (13, 6),  -- Tworzenie stron internetowych -> Game Dev
    (14, 44), -- Serwis komputerów -> Mikrokontrolery i Arduino
    (15, 72), -- Konsultacje dietetyczne -> Dieta i odżywianie
    (16, 22), -- Automatyzacja procesów w firmach -> Robotyka i automatyka
    (17, 42), -- Renowacja sprzętu elektronicznego -> Projektowanie układów elektronicznych
    (18, 68), -- Zajęcia fitness -> Fitness i kulturystyka
    (19, 1),  -- Programowanie w Pythonie -> Inżynieria oprogramowania
    (20, 24), -- Usługi naprawy samochodów -> Samochody elektryczne i hybrydowe
    (21, 76); -- Porady zdrowotne -> Zdrowie psychiczne

INSERT INTO public.multimedia (sciezka_do_pliku)
VALUES
    ('/images/photo1.jpg'),
    ('/images/photo2.jpg'),
    ('/images/photo3.jpg'),
    ('/images/photo4.jpg'),
    ('/images/photo5.jpg'),
    ('/images/photo6.jpg'),
    ('/images/photo7.jpg'),
    ('/images/photo8.jpg'),
    ('/images/photo9.jpg'),
    ('/images/photo10.jpg'),
    ('/images/photo11.jpg'),
    ('/images/photo12.jpg'),
    ('/images/photo13.jpg'),
    ('/images/photo14.jpg'),
    ('/images/photo15.jpg'),
    ('/images/photo16.jpg'),
    ('/images/photo17.jpg'),
    ('/images/photo18.jpg'),
    ('/images/photo19.jpg'),
    ('/images/photo20.jpg'),
    ('/images/photo21.jpg');

INSERT INTO public.wiadomosc (id_czatu, id_uzytkownika, tresc, id_multimediow) VALUES
(1, 1, 'Cześć Hubert, widzę, że oferujesz usługi programistyczne. Jakie technologie preferujesz?', NULL),
(1, 2, 'Cześć Grzesiek! Najczęściej pracuję w Javie i Pythonie, ale jestem otwarty na inne technologie.', NULL),
(1, 1, 'Świetnie, bo właśnie potrzebuję pomocy w projekcie napisanym w Pythonie. Czy masz doświadczenie z Flaskiem?', NULL),
(1, 2, 'Tak, mam doświadczenie z Flaskiem. Jeśli chcesz, mogę pokazać ci kilka przykładowych projektów.', 3),
(1, 1, 'Super, czekam na materiały!', NULL),
(2, 1, 'Jakub, chciałem zapytać, czy oferujesz naprawę komputerów stacjonarnych?', NULL),
(2, 3, 'Cześć Grzesiek, tak, oferuję naprawę komputerów stacjonarnych. Co dokładnie się dzieje?', NULL),
(2, 1, 'Mój komputer nie włącza się, możliwe, że płyta główna jest uszkodzona. Możesz to sprawdzić?', NULL),
(2, 3, 'Jasne, muszę go dokładnie przebadać. Wyślę ci zdjęcie, jak wygląda sprzęt.', 8),
(2, 1, 'Dzięki, czekam na zdjęcie!', NULL),
(3, 1, 'Cześć Wojciech, widzę, że oferujesz treningi personalne. Jakie masz doświadczenie w tym zakresie?', NULL),
(3, 4, 'Cześć Grzesiek! Pracuję jako trener od 5 lat, specjalizuję się w treningach siłowych i funkcjonalnych.', NULL),
(3, 1, 'Czy mogę poprosić o plan treningowy na 3 miesiące? Chciałbym poprawić swoją kondycję i siłę.', NULL),
(3, 4, 'Oczywiście, wyślę ci plan, zaraz do niego usiądę.', NULL),
(3, 1, 'Dzięki! Będę wdzięczny za pomoc.', NULL),
(4, 1, 'Wojciech, widzę, że prowadzisz kursy z programowania. Jakie języki są dostępne?', NULL),
(4, 5, 'Cześć Grzesiek, oferuję kursy z Pythona, Javy i JavaScriptu. Wybór zależy od tego, w jakim kierunku chcesz się rozwijać.', NULL),
(4, 1, 'Chciałbym zacząć od Pythona, jak wygląda kurs i co jest w jego ramach?', NULL),
(4, 5, 'Kurs obejmuje podstawy Pythona, pracę z bibliotekami oraz projekty. Wyślę ci szczegóły.', 10),
(4, 1, 'Super, czekam na materiały!', NULL),
(5, 1, 'Dominik, oferujesz naprawy motocykli. Jakie motocykle naprawiasz?', NULL),
(5, 6, 'Cześć Grzesiek, naprawiam wszystkie typy motocykli, zarówno turystyczne, jak i sportowe.', NULL),
(5, 1, 'Mój motocykl potrzebuje serwisu hamulców. Czy masz doświadczenie z tymi naprawami?', NULL),
(5, 6, 'Tak, mam doświadczenie. Przyjedź, sprawdzę dokładnie, co jest nie tak.', NULL),
(5, 1, 'Dzięki, umówię się na wizytę.', NULL),
(6, 1, 'Arkadiusz, oferujesz konsultacje zdrowotne. Jakie masz specjalizacje?', NULL),
(6, 7, 'Cześć Grzesiek, specjalizuję się w zdrowiu psychicznym oraz ogólnej kondycji fizycznej.', NULL),
(6, 1, 'Miałem ostatnio problemy ze stresem, może warto się skontaktować?', NULL),
(6, 7, 'Oczywiście, mogę zaproponować kilka technik relaksacyjnych i zestaw ćwiczeń. Wyślę ci szczegóły.', 15),
(6, 1, 'Dzięki, na pewno skorzystam.', NULL),
(7, 2, 'Jakub, zauważyłem, że oferujesz tworzenie aplikacji mobilnych. Jakie platformy obsługujesz?', NULL),
(7, 3, 'Cześć Hubert, tworzę aplikacje na Androida oraz iOS. Pracuję zarówno z natywnymi, jak i hybrydowymi aplikacjami.', NULL),
(7, 2, 'Chciałbym stworzyć aplikację na Androida, czy mógłbyś mi pomóc w projekcie?', NULL),
(7, 3, 'Z pewnością, wyślij mi szczegóły, a ja przygotuję plan działania.', NULL),
(7, 2, 'Dzięki, prześlę ci plany.', NULL),
(8, 2, 'Wojciech, oferujesz naprawy urządzeń RTV? Co dokładnie naprawiasz?', NULL),
(8, 4, 'Tak, Hubert. Naprawiam telewizory, dekodery oraz inne urządzenia RTV. Zajmuję się również kalibracją sprzętu.', NULL),
(8, 2, 'Mam problem z telewizorem, ekran zaczął migotać. Czy da się to naprawić?', NULL),
(8, 4, 'Zdecydowanie. Przynieś go, sprawdzimy, co jest nie tak.', NULL),
(8, 2, 'Dzięki, zaraz go przywiozę!', NULL);

INSERT INTO public.komentarz (id_uzytkownika, id_ogloszenia, tresc) VALUES
(1, 1, 'Cześć, interesuje mnie twoja oferta. Jakie masz doświadczenie w pracy z dużymi systemami?'),
(2, 1, 'Cześć Grzesiek, mam ponad 5 lat doświadczenia, pracowałem przy kilku dużych projektach. W czym mogę pomóc?'),
(1, 1, 'Brzmi świetnie! Czy możesz podać przykłady swoich projektów?'),
(3, 2, 'Czy naprawiasz także laptopy? Mój potrzebuje wymiany dysku.'),
(4, 2, 'Tak, zajmuję się również naprawą laptopów. Wyślij mi szczegóły, sprawdzimy to.'),
(5, 3, 'Jakie wyniki osiągnąłem po trzech miesiącach treningów? Chciałbym widzieć konkretne efekty.'),
(6, 3, 'Treningi są dopasowane do Twoich celów, więc wyniki będą widoczne po pierwszym miesiącu.'),
(7, 4, 'Mam doświadczenie w Pythonie, ale chciałbym poznać szczegóły kursu. Jakie tematy są omawiane?'),
(1, 4, 'Kurs obejmuje podstawy Pythona, pracę z bibliotekami oraz projekty. Będziesz mógł także stworzyć swoje pierwsze aplikacje.'),
(2, 5, 'Cześć, mój motocykl ma problem z hamulcami. Czy naprawiasz także te w modelach sportowych?'),
(6, 5, 'Tak, mam doświadczenie z naprawami w motocyklach sportowych. Przyjedź na diagnozę, sprawdzimy co jest nie tak.'),
(5, 5, 'Dzięki, umówię się na wizytę!'),
(7, 6, 'Czy oferujesz konsultacje zdrowotne online? Mam problemy ze stresem i chciałbym się poradzić.'),
(3, 6, 'Tak, oferuję również konsultacje online. Prześlij mi szczegóły, omówimy Twoje potrzeby.'),
(4, 6, 'Dzięki za odpowiedź! Z pewnością skorzystam z Twoich porad.'),
(2, 7, 'Chciałbym stworzyć aplikację mobilną. Jakie technologie proponujesz?'),
(6, 7, 'Tworzę aplikacje zarówno natywne, jak i hybrydowe. Zależy to od Twoich wymagań i budżetu.'),
(7, 7, 'Świetnie! Mam kilka pomysłów, wyślę Ci szczegóły projektu.'),
(4, 8, 'Mam problem z telewizorem, ekran zaczął migotać. Czy da się to naprawić?'),
(3, 8, 'Zdecydowanie. Przynieś go, sprawdzimy, co jest nie tak.'),
(7, 8, 'Dzięki! Zaraz go przywiozę, liczę na szybką pomoc.'),
(6, 9, 'Czy organizujesz zajęcia fitness także dla osób początkujących?'),
(5, 9, 'Tak, mam różne poziomy zaawansowania. Dopasuję treningi do Twoich potrzeb.'),
(2, 9, 'To świetnie! Chciałbym zacząć trenować, napisz mi więcej szczegółów.'),
(1, 10, 'Cześć, interesuje mnie Twój kurs Pythona. Jakie są wymagania wstępne?'),
(4, 10, 'Nie musisz mieć żadnych specjalnych umiejętności. Kurs zaczyna się od podstaw, wystarczy chęć do nauki!'),
(5, 11, 'Mój komputer przestał działać po ostatniej aktualizacji. Czy mogę liczyć na pomoc?'),
(2, 11, 'Oczywiście, sprawdzimy to. Przynieś sprzęt, a ja postaram się znaleźć przyczynę problemu.'),
(7, 11, 'Dzięki, czekam na Twoją diagnozę!'),
(3, 12, 'Mam problem z kalibracją kolorów w moim telewizorze. Czy możesz mi pomóc?'),
(1, 12, 'Tak, zajmuję się kalibracją telewizorów. Przynieś go, sprawdzimy ustawienia.'),
(2, 13, 'Witam, czy masz doświadczenie w tworzeniu sklepów internetowych?'),
(6, 13, 'Tak, projektowałem kilka sklepów internetowych. Jeśli chcesz, mogę pomóc Ci stworzyć swój.'),
(3, 13, 'Super, mam już pomysł na sklep. Wyślę Ci szczegóły.'),
(4, 14, 'Czy naprawiasz także monitory? Mam problem z ekranem.'),
(5, 14, 'Tak, zajmuję się naprawą monitorów. Przynieś swój, sprawdzimy, co się dzieje.'),
(6, 15, 'Czy możesz pomóc mi z dietą? Mam problemy z utrzymaniem wagi.'),
(7, 15, 'Oczywiście, mogę stworzyć plan diety dopasowany do Twojego stylu życia.'),
(1, 16, 'Mam w firmie problemy z organizacją procesów. Jakie technologie wykorzystujesz w automatyzacji?'),
(3, 16, 'Używam narzędzi takich jak Zapier, Power Automate i własne skrypty w Pythonie. Zajmuję się optymalizowaniem procesów.'),
(6, 16, 'Zastanawiam się, czy mogę wdrożyć takie rozwiązania w mojej firmie.'),
(7, 17, 'Czy oferujesz naprawę telefonów? Mój telefon ma uszkodzony ekran.'),
(2, 17, 'Tak, naprawiam telefony, w tym wymianę ekranów. Przyjedź, sprawdzimy, co da się zrobić.'),
(6, 17, 'Dzięki, umówię się na naprawę.'),
(3, 18, 'Mam problem z bólami pleców. Czy masz w swojej ofercie ćwiczenia na poprawę postawy?'),
(5, 18, 'Tak, oferuję ćwiczenia na wzmocnienie pleców oraz poprawę postawy ciała. Chętnie Ci pomogę.'),
(6, 18, 'Dzięki, na pewno się zgłoszę!'),
(7, 19, 'Czy oferujesz kursy z programowania w Pythonie? Chciałbym zacząć naukę.'),
(1, 19, 'Tak, prowadzę kursy, które obejmują podstawy Pythona oraz projekty. Zaczniemy od podstaw.'),
(5, 20, 'Czy oferujesz naprawy samochodów elektrycznych? Mój samochód ma problem z ładowaniem.'),
(4, 20, 'Tak, zajmuję się naprawą samochodów elektrycznych. Przyjedź, sprawdzimy Twój problem z ładowaniem.'),
(3, 21, 'Czy oferujesz porady zdrowotne dotyczące diety? Mam problem z trądzikiem.'),
(2, 21, 'Oferuję porady dietetyczne, które mogą pomóc w walce z trądzikiem. Prześlij mi szczegóły, a dostosuję plan diety.');

INSERT INTO public.polubienia (id_ogloszenia, id_uzytkownika, typ) VALUES
(1, 1, TRUE),
(1, 2, TRUE),
(1, 3, FALSE),
(1, 4, TRUE),
(1, 5, FALSE),
(1, 6, TRUE),
(1, 7, FALSE),
(2, 1, TRUE),
(2, 2, FALSE),
(2, 3, TRUE),
(2, 4, FALSE),
(2, 5, TRUE),
(2, 6, FALSE),
(2, 7, TRUE),
(3, 1, FALSE),
(3, 2, TRUE),
(3, 3, FALSE),
(3, 4, TRUE),
(3, 5, FALSE),
(3, 6, TRUE),
(3, 7, FALSE),
(4, 1, TRUE),
(4, 2, FALSE),
(4, 3, TRUE),
(4, 4, FALSE),
(4, 5, TRUE),
(4, 6, FALSE),
(4, 7, TRUE),
(5, 1, TRUE),
(5, 2, TRUE),
(5, 3, FALSE),
(5, 4, TRUE),
(5, 5, FALSE),
(5, 6, TRUE),
(5, 7, FALSE),
(6, 1, FALSE),
(6, 2, TRUE),
(6, 3, FALSE),
(6, 4, TRUE),
(6, 5, TRUE),
(6, 6, FALSE),
(6, 7, TRUE),
(7, 1, TRUE),
(7, 2, FALSE),
(7, 3, TRUE),
(7, 4, FALSE),
(7, 5, TRUE),
(7, 6, FALSE),
(7, 7, TRUE),
(8, 1, FALSE),
(8, 2, TRUE),
(8, 3, FALSE),
(8, 4, TRUE),
(8, 5, FALSE),
(8, 6, TRUE),
(8, 7, FALSE),
(9, 1, TRUE),
(9, 2, FALSE),
(9, 3, TRUE),
(9, 4, FALSE),
(9, 5, TRUE),
(9, 6, FALSE),
(9, 7, TRUE),
(10, 1, FALSE),
(10, 2, TRUE),
(10, 3, TRUE),
(10, 4, FALSE),
(10, 5, TRUE),
(10, 6, FALSE),
(10, 7, TRUE),
(11, 1, TRUE),
(11, 2, TRUE),
(11, 3, FALSE),
(11, 4, TRUE),
(11, 5, FALSE),
(11, 6, TRUE),
(11, 7, FALSE),
(12, 1, FALSE),
(12, 2, TRUE),
(12, 3, FALSE),
(12, 4, TRUE),
(12, 5, TRUE),
(12, 6, FALSE),
(12, 7, TRUE),
(13, 1, TRUE),
(13, 2, FALSE),
(13, 3, TRUE),
(13, 4, FALSE),
(13, 5, TRUE),
(13, 6, FALSE),
(13, 7, TRUE),
(14, 1, FALSE),
(14, 2, TRUE),
(14, 3, TRUE),
(14, 4, FALSE),
(14, 5, TRUE),
(14, 6, FALSE),
(14, 7, TRUE),
(15, 1, TRUE),
(15, 2, TRUE),
(15, 3, FALSE),
(15, 4, TRUE),
(15, 5, FALSE),
(15, 6, TRUE),
(15, 7, FALSE),
(16, 1, FALSE),
(16, 2, TRUE),
(16, 3, FALSE),
(16, 4, TRUE),
(16, 5, TRUE),
(16, 6, FALSE),
(16, 7, TRUE),
(17, 1, TRUE),
(17, 2, FALSE),
(17, 3, TRUE),
(17, 4, FALSE),
(17, 5, TRUE),
(17, 6, FALSE),
(17, 7, TRUE),
(18, 1, FALSE),
(18, 2, TRUE),
(18, 3, FALSE),
(18, 4, TRUE),
(18, 5, TRUE),
(18, 6, FALSE),
(18, 7, TRUE),
(19, 1, TRUE),
(19, 2, FALSE),
(19, 3, TRUE),
(19, 4, FALSE),
(19, 5, TRUE),
(19, 6, FALSE),
(19, 7, TRUE),
(20, 1, FALSE),
(20, 2, TRUE),
(20, 3, TRUE),
(20, 4, FALSE),
(20, 5, TRUE),
(20, 6, FALSE),
(20, 7, TRUE),
(21, 1, TRUE),
(21, 2, TRUE),
(21, 3, FALSE),
(21, 4, TRUE),
(21, 5, FALSE),
(21, 6, TRUE),
(21, 7, FALSE);

-- Completed on 2024-11-06 14:31:17

--
-- PostgreSQL database dump complete
--

