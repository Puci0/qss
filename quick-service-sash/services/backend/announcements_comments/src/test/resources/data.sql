INSERT INTO kategoria (nazwa) VALUES
('Elektronika'),
('Dom i Ogród'),
('Moda'),
('Sport i Rekreacja'),
('Motoryzacja'),
('Książki i Edukacja'),
('Dziecko i Zabawki'),
('Zdrowie i Uroda');

INSERT INTO podkategoria (nazwa) VALUES
('Smartfony'),
('Laptopy'),
('Meble'),
('Odzież damska'),
('Odzież męska'),
('Rowery'),
('Samochody'),
('Fantasy'),
('Podręczniki'),
('Zabawki edukacyjne'),
('Kosmetyki'),
('Sprzęt fitness');

INSERT INTO ogloszenie (data_utworzenia, id_uzytkownika, opis, tytul) VALUES
('2024-12-01 10:00:00', 1, 'Używany telefon w dobrym stanie', 'Sprzedam iPhone 12'),
('2024-12-02 11:30:00', 2, 'Laptop idealny do pracy biurowej', 'Nowy laptop Dell'),
('2024-12-03 15:45:00', 3, 'Wygodna sofa do salonu', 'Sofa skórzana'),
('2024-12-04 09:15:00', 4, 'Stylowa kurtka na zimę', 'Kurtka zimowa'),
('2024-12-05 08:20:00', 5, 'Lekki rower do jazdy terenowej', 'Rower górski'),
('2024-12-06 13:10:00', 6, 'Samochód w dobrym stanie, bezwypadkowy', 'Toyota Corolla'),
('2024-12-07 17:40:00', 7, 'Nowa książka z gatunku fantasy', 'Książka Fantasy'),
('2024-12-08 19:00:00', 8, 'Idealny na prezent', 'Zestaw kosmetyków');

INSERT INTO polubienia (typ, id_ogloszenia, id_uzytkownika) VALUES
('L', 1, 2),
('D', 1, 3),
('L', 2, 1),
('L', 3, 4),
('L', 4, 3),
('L', 5, 6),
('L', 6, 5),
('D', 7, 8),
('L', 8, 7);

INSERT INTO komentarz (data_utworzenia, id_ogloszenia, id_uzytkownika, tresc) VALUES
('2024-12-01 12:00:00', 1, 2, 'Czy jest możliwość negocjacji ceny?'),
('2024-12-01 12:30:00', 1, 3, 'Jaka jest pojemność baterii?'),
('2024-12-02 14:00:00', 2, 1, 'Czy jest dostępna faktura?'),
('2024-12-03 16:00:00', 3, 4, 'Czy możliwy jest transport?'),
('2024-12-05 10:00:00', 5, 5, 'Czy rower jest w pełni sprawny?'),
('2024-12-06 14:00:00', 6, 6, 'Ile ma przejechanych kilometrów?'),
('2024-12-07 18:00:00', 7, 7, 'Czy to nowa książka?'),
('2024-12-08 20:00:00', 8, 8, 'Czy kosmetyki są testowane na zwierzętach?');

INSERT INTO kategoria_podkategoria (id_kategorii, id_podkategorii) VALUES
(1, 1), -- Elektronika -> Smartfony
(1, 2), -- Elektronika -> Laptopy
(2, 3), -- Dom i Ogród -> Meble
(3, 4), -- Moda -> Odzież damska
(3, 5), -- Moda -> Odzież męska
(4, 6), -- Sport i Rekreacja -> Rowery
(5, 7), -- Motoryzacja -> Samochody
(6, 8), -- Książki i Edukacja -> Fantasy
(6, 9), -- Książki i Edukacja -> Podręczniki
(7, 10), -- Dziecko i Zabawki -> Zabawki edukacyjne
(8, 11), -- Zdrowie i Uroda -> Kosmetyki
(4, 12); -- Sport i Rekreacja -> Sprzęt fitness

INSERT INTO ogloszenie_podkategoria (id_podkategorii, id_ogloszenia) VALUES
(1, 1), -- Smartfony -> Sprzedam iPhone 12
(2, 2), -- Laptopy -> Nowy laptop Dell
(3, 3), -- Meble -> Sofa skórzana
(4, 4), -- Odzież damska -> Kurtka zimowa
(6, 5), -- Rowery -> Rower górski
(7, 6), -- Samochody -> Toyota Corolla
(8, 7), -- Fantasy -> Książka Fantasy
(11, 8); -- Kosmetyki -> Zestaw kosmetyków
