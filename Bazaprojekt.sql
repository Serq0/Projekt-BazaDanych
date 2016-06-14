USE Master;
IF DB_ID('Projekt') IS NOT NULL
DROP DATABASE Projekt; --stworzenie bazy danych
GO

IF DB_ID('Projekt') IS NULL
CREATE DATABASE Projekt;
GO

IF DB_ID('Projekt') IS NOT NULL
USE Projekt;

IF OBJECT_ID('Producent', 'U') IS NULL
CREATE TABLE Producent(
	ID_Producenta INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Nazwa VARCHAR(25) UNIQUE NOT NULL,
	Email VARCHAR(50) UNIQUE NOT NULL CHECK(Email LIKE '%@%'),
	Telefon VARCHAR(15) UNIQUE NOT NULL
	);

IF OBJECT_ID('Klienci', 'U') IS NULL
CREATE TABLE Klienci(
	ID_Klienta INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Imie VARCHAR(25) NOT NULL CHECK(Imie LIKE '%[^0-9]%'),
	Nazwisko VARCHAR(25) NOT NULL CHECK(Nazwisko LIKE '%[^0-9]%'),
	Ulica VARCHAR(80) NOT NULL,
	Miasto VARCHAR(80) NOT NULL,
	Telefon VARCHAR(15),
	Data_utworzenia DATETIME NOT NULL DEFAULT GETDATE()
	);

IF OBJECT_ID('Buty', 'U') IS NULL
CREATE TABLE Buty(
	ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Rodzaj VARCHAR(7),
	Kolor VARCHAR(20) NOT NULL,
	Odcien VARCHAR(10),
	ID_Producenta INT FOREIGN KEY REFERENCES Producent(ID_Producenta) NOT NULL,
	Data_produkcji DATETIME NOT NULL,
	Cena_zakupu INT NOT NULL CHECK (Cena_zakupu >0),
	Cena_sprzedazy INT NOT NULL CHECK (Cena_sprzedazy >0)
	);

IF OBJECT_ID('Sklep', 'U') IS NULL
CREATE TABLE Sklep(
	ID INT FOREIGN KEY REFERENCES Buty(ID) NOT NULL,
	Rozmiar INT NOT NULL CHECK (Rozmiar >=30 AND Rozmiar <= 50),
	Ilosc INT NOT NULL CHECK (Ilosc>=0)
	);

IF OBJECT_ID('Reklamacje', 'U') IS NULL
CREATE TABLE Reklamacje(
	ID INT FOREIGN KEY REFERENCES Buty(ID) NOT NULL,
	Rozmiar INT NOT NULL CHECK (Rozmiar >=30 AND Rozmiar <= 50),
	Data_reklamacji DATETIME NOT NULL DEFAULT GETDATE(),
	ID_Klienta INT FOREIGN KEY REFERENCES Klienci(ID_Klienta) CHECK (ID_Klienta >0),
	ID_Reklamacji INT PRIMARY KEY IDENTITY(1,1),
	);

IF OBJECT_ID('Sprzedaz', 'U') IS NULL
CREATE TABLE Sprzedaz(
	ID INT FOREIGN KEY REFERENCES Buty(ID) NOT NULL,
	Rozmiar INT NOT NULL,
	Data_sprzedazy DATETIME NOT NULL DEFAULT GETDATE(),
	ID_Klienta INT FOREIGN KEY REFERENCES Klienci(ID_Klienta) NOT NULL,
	ID_sprzedazy INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	);



	IF OBJECT_ID('Producent', 'U') IS NOT NULL
INSERT INTO Producent (Nazwa, Email, Telefon) VALUES
('Ry�ko','firma@rylko.pl','531556433'),
('Nessi','nessi@nessi.pl','335387575'),
('Hammer','hammer@trade.pl','643321554'),
('Alvo','alvoalvo@firma.pl','465345234'),
('�urek','zamowienia@zurek.pl','321765345')


IF OBJECT_ID('Klienci', 'U') IS NOT NULL
INSERT INTO Klienci (Imie,Nazwisko,Ulica,Miasto,Telefon,Data_utworzenia) VALUES 
('Xyla','Uta','P.O. Box 991, 6923 Ante, Road','Roanoke','391-738-324','2011-01-05 20:16:39'),
('Tallulah','Lareina','P.O. Box 363, 9696 Erat Road','San Antonio','662-901-075','2010-07-04 04:53:14'),
('Rama','Kibo','3719 Euismod Avenue','Oxnard','113-407-484','2014-06-30 15:22:49'),
('Joy','Kato','Ap #238-7670 Arcu St.','Asbury Park','152-331-779','2013-06-13 20:21:57'),
('Charissa','Savannah','Ap #658-2868 Risus. Rd.','Geneva','291-348-367','2015-11-26 01:29:17'),
('Anjolie','Herrod','1687 Phasellus St.','Port Huron','971-429-080','2012-08-23 23:55:47'),
('Lareina','Evangeline','P.O. Box 957, 1345 Tempor Rd.','Mount Pleasant','829-613-894','2014-12-20 17:07:44'),
('Abigail','Carl','P.O. Box 501, 8871 Malesuada St.','Battle Creek','681-310-372','2010-07-11 06:13:55'),
('Jamalia','Palmer','6974 Id, Avenue','Wilson','985-582-730','2012-01-16 23:22:53'),
('Orson','Walker','P.O. Box 583, 6734 Ipsum St.','New Rochelle','400-364-159','2013-01-03 15:31:25'),
('Darrel','Courtney','3408 Et Rd.','Sheboygan','612-901-172','2015-05-15 16:05:30'),
('Sawyer','Ariana','150-3905 Auctor Street','Pottsville','547-725-615','2015-04-08 01:22:17'),
('Regan','Lillith','6386 Tristique St.','Cerritos','412-880-734','2011-02-18 21:05:44'),
('Isabelle','Martena','P.O. Box 780, 4869 Mollis St.','Seattle','624-678-496','2011-12-19 02:41:29'),
('Gil','Tanek','P.O. Box 679, 374 Lorem Ave','Arcadia','692-939-795','2012-07-10 22:25:22'),
('August','Ramona','3295 Nunc St.','Salinas','843-798-174','2016-01-19 03:41:20'),
('Ferris','Silas','3151 Donec St.','Richmond','300-424-710','2013-08-13 09:43:46'),
('Tatiana','Maya','P.O. Box 637, 6407 Bibendum St.','Newcastle','361-816-537','2013-07-28 09:56:23'),
('Jameson','Aaron','9311 Proin St.','Kenosha','422-162-877','2015-05-05 03:16:00'),
('Macey','Baxter','481 Urna Ave','Mequon','563-736-540','2011-09-15 10:08:02'),
('Alana','Zorita','Ap #416-6420 Mauris Rd.','Meadville','658-553-095','2012-02-02 09:39:19'),
('Isabelle','Silas','Ap #903-4208 Nullam St.','Johnstown','747-385-637','2012-06-29 03:42:39'),
('Hamilton','Samuel','1833 Accumsan Avenue','Milford','881-935-949','2013-07-30 03:14:31'),
('Georgia','Unity','Ap #800-3996 Augue, Road','Orem','453-110-873','2015-02-01 01:01:53'),
('Hiram','Chanda','P.O. Box 991, 8959 Cubilia Road','Lincoln','236-128-291','2012-08-24 17:56:56'),
('Nelle','Samuel','Ap #404-132 Pharetra Rd.','Roseville','843-268-997','2013-10-31 03:02:01'),
('Heather','Hanna','7075 Sagittis Rd.','Spokane','943-646-276','2015-08-08 03:36:03'),
('Julie','Lenore','P.O. Box 557, 9923 Tincidunt, Rd.','Dothan','355-965-403','2013-10-12 15:25:26'),
('Nell','Cade','2843 Egestas Ave','Hartland','382-860-087','2014-03-13 12:30:21'),
('Shaeleigh','Galena','P.O. Box 645, 6472 Dignissim Av.','Avalon','726-411-480','2014-11-08 08:11:31'),
('Eleanor','Warren','533 Vitae, Ave','Myrtle Beach','508-621-709','2010-03-25 12:30:40'),
('Nyssa','Mara','P.O. Box 550, 2041 Euismod Ave','Morgantown','810-665-664','2010-04-11 02:26:37'),
('Yoshi','Zelenia','7874 Auctor Road','Sonoma','807-834-383','2011-03-08 11:18:26'),
('Breanna','Gage','Ap #430-9220 Leo. Road','Butte','792-887-280','2013-04-04 09:40:45'),
('Patricia','Inez','P.O. Box 482, 2771 Luctus. Rd.','Blacksburg','373-106-006','2013-06-04 13:46:03'),
('Louis','Callie','P.O. Box 129, 4822 Fusce Rd.','Clarksville','730-554-054','2010-08-05 15:06:33'),
('Mary','Rajah','Ap #921-8982 Ut Road','Akron','938-692-038','2012-08-22 06:22:42'),
('Jana','Brennan','1528 Amet Rd.','Springfield','674-301-209','2013-06-05 00:10:57'),
('Xena','Xander','Ap #896-5444 Mauris Avenue','Atwater','148-958-665','2014-05-25 02:18:46'),
('Keaton','Urielle','P.O. Box 104, 9844 Id Ave','Apple Valley','665-495-246','2013-09-16 22:05:03'),
('Scott','Luke','896-1104 Ligula Ave','Muskogee','135-934-268','2010-11-26 18:49:16'),
('Breanna','Celeste','362-5369 Risus. Street','Saint Joseph','604-194-252','2010-07-03 18:27:13'),
('August','Veda','3103 Velit St.','Dodge City','970-428-267','2016-02-03 16:18:35'),
('Cassady','Hall','Ap #338-5228 Neque Rd.','Modesto','965-386-916','2010-03-12 16:36:51'),
('Rhea','Kalia','2372 Vulputate, Road','Corona','226-900-476','2011-02-07 09:17:08'),
('Jordan','Victor','787-2279 Donec Av.','Elmira','625-864-093','2016-02-16 10:23:30'),
('Adrienne','Emmanuel','P.O. Box 304, 3559 Ligula. Road','La Habra','512-883-219','2011-10-15 10:20:52'),
('Mannix','Flavia','371-9006 Varius St.','Decatur','977-728-707','2011-09-17 11:56:46'),
('Richard','Zia','P.O. Box 968, 4985 Ac, Street','Bartlesville','236-203-964','2013-02-17 06:04:47'),
('Quyn','Colette','2213 At St.','Pass Christian','432-183-357','2013-06-06 04:51:00'),
('Norman','Lilah','560-8120 Ultrices. Street','Springdale','770-614-065','2013-08-08 04:21:55'),
('Orlando','Dennis','P.O. Box 706, 4423 Sit Rd.','Hutchinson','376-340-299','2012-10-11 06:18:02'),
('Adrienne','Constance','7330 Felis St.','Lansing','202-831-849','2015-07-28 16:01:24'),
('David','Amos','216-1530 Nunc Ave','Edina','886-643-229','2010-05-17 05:33:57'),
('Burke','Gareth','2137 Cursus Rd.','Marietta','280-984-905','2016-01-19 06:16:18'),
('Byron','Lyle','488-5930 Lacinia Ave','North Little Rock','296-937-560','2012-07-24 20:57:11'),
('Cynthia','Desirae','286-6045 Vestibulum Rd.','Murfreesboro','196-972-287','2013-06-25 19:59:36'),
('Yen','Tatyana','3395 Sollicitudin Rd.','Bristol','182-656-869','2010-12-26 21:26:05'),
('Demetria','Quynn','P.O. Box 666, 1976 Magna. Rd.','Layton','735-577-057','2015-06-24 20:08:23'),
('Fulton','Jolene','315-1370 Consectetuer Rd.','Martinsburg','501-568-828','2013-01-05 21:57:12'),
('Maxwell','Callum','Ap #441-6487 A Avenue','Pass Christian','164-233-850','2015-10-20 06:48:55'),
('Helen','Xavier','7175 Suspendisse Ave','Irving','124-643-323','2015-07-11 00:33:36'),
('Winter','Yoshi','Ap #375-1074 Nullam Av.','Merced','170-179-026','2011-02-21 15:53:59'),
('Camilla','Amanda','114-2615 Mi. St.','Durango','793-233-652','2010-08-30 08:37:29'),
('Sylvia','Moana','P.O. Box 156, 4418 Dolor Avenue','Oxford','509-205-950','2011-06-21 23:39:16'),
('Elton','Salvador','Ap #574-1709 Parturient Road','Seattle','434-791-577','2012-10-21 12:26:30'),
('Herrod','Oscar','362 Morbi Ave','El Monte','689-228-380','2011-03-04 11:28:14'),
('Georgia','Kyra','522-7178 Dolor St.','Ogdensburg','291-530-199','2011-08-20 21:14:52'),
('Hakeem','Yen','790-6465 Cras Rd.','Corvallis','542-443-021','2015-12-10 10:21:17'),
('Kylee','Marshall','Ap #712-9219 Facilisis Street','Carson','756-544-512','2012-02-11 05:04:50'),
('McKenzie','Joshua','P.O. Box 816, 3314 Ultrices Avenue','Berkeley','709-545-086','2015-11-10 01:36:02'),
('Walter','Gareth','P.O. Box 484, 7118 Pretium Road','Athens','592-603-785','2010-06-30 22:08:51'),
('Odessa','Perry','P.O. Box 522, 2548 Aenean St.','Gilette','908-386-968','2011-06-26 17:41:59'),
('Kitra','Jordan','Ap #614-7688 Iaculis Rd.','Walla Walla','292-374-814','2010-09-19 14:57:49'),
('McKenzie','Harriet','Ap #524-2413 Nec Road','New Castle','597-836-904','2011-04-26 19:19:24'),
('Kennan','Melinda','P.O. Box 799, 8722 Rutrum Rd.','Medford','711-427-767','2015-10-11 00:43:48'),
('Marvin','Quail','P.O. Box 293, 2371 Amet Street','Hayward','883-282-955','2012-05-03 11:55:21'),
('Jade','Simon','Ap #603-2611 Vitae, Ave','Lebanon','790-883-809','2010-12-05 23:36:17'),
('Britanney','Nelle','405-3319 Donec Rd.','San Diego','252-412-369','2012-06-13 06:19:50'),
('Debra','Patricia','983-5377 Velit. Rd.','Williamsport','518-596-950','2015-07-28 06:58:18'),
('Orla','David','P.O. Box 231, 1562 Mi, Rd.','Lebanon','949-535-583','2011-11-10 04:31:00'),
('Lucius','Mikayla','Ap #881-6039 Facilisis Street','Temecula','686-894-975','2010-04-21 16:39:32'),
('Lenore','Catherine','Ap #629-3458 Convallis St.','Houston','928-961-748','2010-12-21 22:22:25'),
('Madison','Martin','P.O. Box 990, 5417 Ut, Av.','West Allis','779-262-504','2013-06-20 20:23:40'),
('Samantha','Abra','800-1561 Quis, Avenue','West Palm Beach','872-194-091','2014-08-03 03:49:11'),
('Violet','Velma','P.O. Box 651, 8621 Vitae St.','Tustin','172-243-625','2011-03-10 23:54:01'),
('MacKenzie','Dante','660 Bibendum Av.','Galveston','437-413-034','2011-12-14 23:35:46'),
('Helen','Sylvia','P.O. Box 614, 9402 Curabitur St.','Houston','486-409-583','2014-08-18 10:56:04'),
('Denton','Jayme','P.O. Box 159, 6138 Ac Road','Shelton','543-487-194','2012-07-05 12:07:04'),
('Driscoll','Wylie','644 Placerat, Rd.','Gilette','356-908-767','2011-01-28 01:20:28'),
('Xander','India','1878 Enim. Rd.','Tallahassee','107-601-613','2015-03-02 19:12:22'),
('Blair','Malachi','P.O. Box 973, 330 Ornare, Street','Stillwater','294-833-741','2011-12-10 08:43:05'),
('Miriam','Wynne','Ap #125-1144 A St.','Kalamazoo','578-814-165','2014-04-15 16:35:27'),
('Sierra','Silas','764-5842 Velit St.','Kalamazoo','650-523-741','2013-08-26 12:59:07'),
('Shaeleigh','Vincent','3394 Quam Road','Arvada','541-229-747','2014-07-28 18:14:37'),
('Brock','Halla','Ap #580-4286 Vitae Street','Tuscaloosa','965-718-390','2011-06-08 21:09:07'),
('Iona','Sybil','Ap #885-7778 Orci. Street','Temecula','644-329-885','2010-10-14 09:08:56'),
('Dale','Florence','Ap #337-6628 Proin Rd.','Pine Bluff','343-982-768','2013-08-26 03:09:20'),
('Burton','Amaya','Ap #636-5769 Mattis. St.','Bangor','646-955-169','2011-10-18 09:38:16'),
('Lilah','Abigail','969-2306 Dui Rd.','Brockton','809-713-101','2014-07-20 09:15:02')

IF OBJECT_ID('Buty', 'U') IS NOT NULL
INSERT INTO Buty (Rodzaj, Kolor, Odcien, ID_Producenta, Data_Produkcji, Cena_zakupu, Cena_sprzedazy) VALUES
('m�skie','czarne','ciemne','1','2013-07-17','50','115'),
('m�skie','szare','jasne','5','2013-03-05','135','229'),
('m�skie','czerwone','jasne','4','2013-06-08','76','190'),
('damskie','czerwone','jasne','1','2013-08-15','135','148'),
('m�skie','czarne','ciemne','1','2013-12-05','78','109'),
('m�skie','niebieskie','jasne','4','2013-03-05','23','36'),
('damskie','bia�e','neutralne','4','2013-03-05','57','159'),
('damskie','czarne','ciemne','4','2013-11-05','96','144'),
('m�skie','czerwone','neutralne','1','2013-08-15','22','55'),
('m�skie','czarne','neutralne','1','2013-09-30','84','235'),
('damskie','bia�e','ciemne','3','2013-11-05','74','125'),
('damskie','czerwone','ciemne','4','2013-10-25','64','70'),
('m�skie','czerwone','neutralne','1','2013-10-25','136','190'),
('damskie','niebieskie','jasne','4','2013-09-30','90','252'),
('damskie','zielone','neutralne','1','2014-01-05','113','271'),
('m�skie','zielone','jasne','3','2013-10-25','111','222'),
('m�skie','niebieskie','ciemne','4','2013-07-17','146','277'),
('damskie','czerwone','ciemne','4','2013-10-25','14','19'),
('m�skie','czerwone','ciemne','3','2013-12-05','15','36'),
('damskie','niebieskie','jasne','2','2013-06-08','11','29'),
('damskie','zielone','neutralne','1','2013-09-30','103','267'),
('damskie','czerwone','neutralne','1','2013-10-25','72','100'),
('m�skie','czerwone','neutralne','5','2013-03-05','142','397'),
('damskie','czarne','ciemne','5','2013-09-30','30','54'),
('damskie','bia�e','jasne','4','2013-06-08','53','111'),
('damskie','szare','neutralne','4','2014-02-02','84','168'),
('damskie','zielone','ciemne','3','2013-10-25','9','9'),
('m�skie','czerwone','ciemne','4','2013-10-25','138','289'),
('m�skie','bia�e','neutralne','4','2013-06-08','30','51'),
('m�skie','zielone','jasne','5','2013-07-17','93','269'),
('m�skie','zielone','neutralne','5','2013-12-05','20','44'),
('damskie','niebieskie','neutralne','5','2014-02-02','101','191'),
('m�skie','bia�e','jasne','3','2013-12-05','132','211'),
('damskie','czerwone','ciemne','3','2013-10-25','55','154'),
('m�skie','zielone','jasne','4','2013-11-05','14','39'),
('m�skie','bia�e','neutralne','3','2013-07-17','149','163'),
('m�skie','bia�e','neutralne','2','2013-09-30','1','1'),
('m�skie','czerwone','ciemne','4','2014-02-02','107','256'),
('m�skie','bia�e','ciemne','5','2013-08-15','139','194'),
('m�skie','szare','ciemne','3','2013-10-25','58','156'),
('m�skie','niebieskie','neutralne','1','2013-07-17','101','232'),
('m�skie','szare','ciemne','5','2013-06-08','56','156'),
('m�skie','zielone','neutralne','5','2013-06-08','49','58'),
('damskie','szare','jasne','1','2013-06-08','63','107'),
('damskie','czerwone','neutralne','1','2013-09-30','8','8'),
('m�skie','bia�e','jasne','4','2013-10-25','115','218'),
('m�skie','szare','jasne','3','2013-09-30','1','1'),
('m�skie','szare','jasne','3','2013-12-05','116','255'),
('damskie','czerwone','jasne','3','2013-10-25','102','265'),
('damskie','szare','ciemne','1','2013-07-17','34','88'),
('damskie','czerwone','ciemne','2','2013-03-05','129','283'),
('damskie','czerwone','jasne','1','2014-01-05','149','357'),
('damskie','czarne','neutralne','2','2013-06-08','79','165'),
('m�skie','zielone','neutralne','4','2013-12-05','97','116'),
('m�skie','niebieskie','neutralne','4','2013-10-25','111','122'),
('m�skie','zielone','neutralne','3','2013-07-17','71','156'),
('damskie','czarne','jasne','2','2013-12-05','85','246'),
('m�skie','zielone','jasne','1','2013-09-30','106','254'),
('m�skie','czarne','jasne','3','2013-06-08','28','61'),
('damskie','zielone','jasne','5','2013-11-05','40','108'),
('damskie','szare','neutralne','2','2013-08-15','105','283'),
('m�skie','czarne','ciemne','3','2013-12-05','33','85'),
('m�skie','czarne','ciemne','4','2013-09-30','130','143'),
('damskie','czerwone','jasne','3','2013-11-05','34','85'),
('m�skie','szare','neutralne','4','2013-06-08','39','62'),
('m�skie','czarne','jasne','1','2013-10-25','136','272'),
('damskie','niebieskie','jasne','4','2014-02-02','88','105'),
('m�skie','bia�e','neutralne','4','2013-08-15','46','64'),
('damskie','niebieskie','jasne','3','2013-11-05','100','260'),
('damskie','szare','neutralne','5','2013-03-05','38','106'),
('m�skie','zielone','ciemne','5','2013-09-30','105','304'),
('m�skie','szare','jasne','2','2014-02-02','25','57'),
('m�skie','szare','neutralne','1','2013-07-17','21','29'),
('m�skie','zielone','jasne','2','2013-08-15','31','46'),
('damskie','czarne','jasne','1','2013-03-05','49','132'),
('m�skie','zielone','ciemne','5','2013-11-05','134','147'),
('m�skie','niebieskie','neutralne','3','2013-06-08','148','251'),
('damskie','niebieskie','jasne','1','2013-10-25','58','121'),
('damskie','zielone','neutralne','4','2014-02-02','41','53'),
('damskie','czerwone','ciemne','2','2013-09-30','67','127'),
('damskie','czerwone','ciemne','2','2013-08-15','75','97'),
('damskie','niebieskie','jasne','4','2013-07-17','37','59'),
('damskie','bia�e','jasne','3','2013-08-15','131','235'),
('m�skie','czarne','neutralne','3','2013-07-17','64','76'),
('damskie','czarne','ciemne','5','2014-01-05','95','171'),
('m�skie','czarne','neutralne','5','2013-09-30','21','25'),
('damskie','czarne','ciemne','4','2013-03-05','91','163'),
('m�skie','niebieskie','jasne','1','2013-08-15','92','239'),
('m�skie','niebieskie','jasne','4','2014-02-02','9','15'),
('m�skie','czarne','jasne','5','2013-06-08','71','149'),
('m�skie','zielone','jasne','5','2014-01-05','37','85'),
('m�skie','czerwone','neutralne','3','2013-06-08','43','81'),
('damskie','zielone','neutralne','5','2014-01-05','58','81'),
('damskie','czarne','jasne','2','2013-08-15','16','32'),
('m�skie','niebieskie','neutralne','3','2013-08-15','97','223'),
('m�skie','czerwone','jasne','2','2013-12-05','131','157'),
('damskie','szare','jasne','2','2013-12-05','60','132'),
('damskie','niebieskie','ciemne','5','2014-01-05','68','74'),
('damskie','szare','ciemne','2','2013-12-05','1','1'),
('damskie','szare','ciemne','4','2013-07-17','36','100'),
('damskie','zielone','neutralne','4','2013-09-30','92','147'),
('damskie','czarne','ciemne','5','2013-11-05','33','49'),
('m�skie','niebieskie','jasne','3','2013-03-05','30','42'),
('m�skie','czarne','jasne','4','2013-09-30','24','28'),
('m�skie','czerwone','ciemne','2','2014-01-05','78','171'),
('m�skie','niebieskie','jasne','2','2013-03-05','18','45'),
('m�skie','czerwone','ciemne','5','2014-02-02','50','80'),
('m�skie','bia�e','jasne','5','2013-06-08','77','123'),
('damskie','czerwone','jasne','2','2013-12-05','123','282'),
('damskie','zielone','ciemne','5','2013-08-15','142','355'),
('damskie','niebieskie','neutralne','4','2013-11-05','126','239'),
('damskie','czarne','ciemne','2','2013-03-05','142','326'),
('m�skie','czerwone','neutralne','1','2013-11-05','126','352'),
('damskie','niebieskie','neutralne','3','2013-11-05','126','302'),
('m�skie','czarne','neutralne','2','2013-08-15','141','169'),
('damskie','bia�e','jasne','5','2013-09-30','14','25'),
('m�skie','bia�e','jasne','4','2013-11-05','149','178'),
('m�skie','czarne','ciemne','4','2013-12-05','55','93'),
('m�skie','bia�e','ciemne','1','2014-01-05','14','32'),
('damskie','bia�e','jasne','5','2013-06-08','100','230')

IF OBJECT_ID('Sklep', 'U') IS NOT NULL
INSERT INTO Sklep (ID,Rozmiar,Ilosc) VALUES
('89','47','0'),
('43','32','3'),
('14','38','3'),
('84','49','4'),
('61','31','4'),
('15','30','1'),
('68','39','2'),
('66','46','0'),
('119','41','3'),
('83','49','3'),
('108','35','4'),
('64','47','4'),
('12','49','1'),
('43','48','0'),
('15','35','2'),
('50','45','3'),
('55','48','3'),
('18','36','3'),
('18','39','3'),
('16','39','4'),
('91','42','1'),
('49','35','0'),
('2','43','0'),
('118','34','3'),
('37','38','2'),
('28','46','3'),
('106','37','1'),
('112','33','4'),
('101','48','0'),
('101','32','4'),
('20','34','1'),
('69','41','1'),
('28','40','4'),
('103','40','3'),
('6','39','2'),
('38','30','0'),
('7','35','4'),
('104','45','0'),
('107','31','0'),
('83','49','0'),
('82','48','3'),
('26','46','3'),
('74','34','4'),
('27','34','3'),
('1','39','1'),
('39','32','1'),
('12','41','1'),
('14','36','0'),
('95','42','1'),
('32','47','3'),
('94','37','1'),
('81','44','2'),
('2','34','2'),
('90','48','4'),
('22','42','4'),
('53','34','0'),
('62','37','2'),
('69','40','2'),
('10','42','0'),
('117','38','2'),
('31','42','4'),
('49','47','4'),
('19','43','1'),
('58','38','3'),
('60','45','0'),
('70','46','1'),
('80','34','2'),
('13','42','3'),
('101','42','0'),
('31','47','0'),
('23','36','4'),
('88','46','2'),
('109','45','2'),
('60','36','0'),
('46','36','0'),
('17','40','3'),
('35','40','4'),
('82','49','4'),
('16','47','0'),
('84','30','3'),
('82','33','2'),
('64','30','4'),
('34','44','3'),
('76','30','3'),
('42','39','4'),
('47','34','2'),
('77','45','4'),
('15','37','2'),
('46','44','1'),
('46','33','3'),
('37','46','3'),
('11','44','2'),
('21','37','1'),
('97','31','3'),
('63','42','1'),
('1','45','3'),
('45','45','2'),
('85','45','0'),
('66','31','4'),
('60','34','2'),
('66','32','1'),
('106','45','3'),
('20','36','0'),
('69','35','3'),
('53','33','2'),
('44','30','2'),
('68','34','1'),
('71','37','2'),
('87','31','2'),
('87','34','3'),
('95','47','4'),
('114','40','1'),
('101','38','2'),
('78','37','1'),
('12','47','1'),
('46','38','2'),
('86','37','0'),
('94','38','2'),
('114','32','3'),
('23','48','3'),
('41','47','0'),
('93','49','3'),
('49','38','0'),
('39','34','3'),
('106','36','2'),
('74','35','0'),
('85','41','4'),
('36','38','0'),
('20','46','3'),
('88','34','3'),
('110','32','4'),
('96','41','0'),
('25','41','3'),
('76','42','3'),
('13','42','1'),
('31','33','0'),
('100','31','2'),
('104','38','3'),
('49','34','0'),
('24','32','3'),
('81','49','4'),
('90','40','0'),
('78','35','0'),
('19','39','3'),
('51','32','3'),
('101','43','4'),
('22','35','3'),
('19','36','2'),
('75','44','4'),
('91','30','1'),
('10','43','0'),
('89','37','3'),
('57','32','4'),
('68','43','1'),
('41','42','4'),
('77','33','0'),
('83','30','0'),
('71','35','3'),
('1','30','4'),
('81','41','0'),
('4','41','4'),
('43','41','1'),
('106','46','1'),
('12','32','1'),
('71','49','1'),
('66','38','3'),
('78','45','0'),
('120','48','0'),
('57','32','2'),
('42','30','1'),
('79','48','0'),
('73','49','2'),
('36','40','3'),
('88','45','2'),
('9','33','0'),
('59','49','3'),
('24','45','3'),
('67','46','0'),
('54','43','2'),
('23','43','1'),
('53','44','2'),
('65','45','4'),
('96','42','0'),
('49','41','4'),
('68','49','4'),
('17','32','1'),
('112','36','0'),
('16','36','4'),
('76','45','4'),
('21','43','0'),
('13','38','2'),
('11','42','4'),
('41','45','3'),
('34','34','4'),
('49','39','3'),
('85','30','0'),
('15','41','0'),
('63','49','3'),
('37','34','4'),
('30','33','3'),
('37','48','2'),
('15','39','0'),
('59','38','3'),
('30','38','1'),
('21','46','2'),
('12','44','3'),
('75','43','4'),
('54','36','1'),
('104','34','0'),
('34','48','1'),
('119','36','1'),
('5','39','2'),
('48','42','1'),
('44','36','3'),
('1','41','2'),
('115','41','3'),
('53','38','0'),
('110','40','0'),
('76','42','2'),
('13','44','0'),
('105','45','3'),
('119','48','3'),
('64','38','4'),
('47','33','3'),
('16','44','0'),
('105','48','4'),
('38','42','1'),
('55','36','3'),
('31','39','1'),
('64','43','1'),
('59','42','0'),
('68','34','2'),
('6','47','2'),
('68','41','4'),
('41','47','3'),
('58','44','0'),
('41','30','3'),
('11','41','1'),
('1','38','3'),
('64','30','4'),
('88','38','4'),
('39','38','1'),
('29','41','3'),
('73','42','3'),
('79','37','3'),
('49','49','2'),
('1','48','3'),
('116','31','0'),
('57','41','3'),
('112','35','0'),
('56','44','3'),
('64','48','2'),
('38','48','1'),
('57','41','3'),
('116','36','2'),
('15','34','2'),
('35','43','2'),
('4','37','2'),
('119','44','3'),
('30','49','4'),
('97','37','1'),
('47','41','4'),
('14','31','0'),
('70','33','3'),
('103','44','3'),
('43','32','4'),
('78','36','3'),
('114','41','3'),
('42','36','0'),
('120','45','0'),
('6','46','2'),
('110','33','3'),
('3','31','0'),
('62','39','4'),
('107','34','4'),
('73','33','2'),
('15','44','0'),
('75','31','1'),
('27','39','3'),
('110','48','1'),
('50','32','2'),
('43','45','4'),
('32','41','0'),
('61','45','4'),
('102','36','2'),
('64','38','2'),
('61','37','2'),
('9','37','1'),
('105','30','0'),
('54','43','1'),
('79','48','3'),
('85','42','4'),
('58','30','4'),
('91','47','0'),
('2','30','0'),
('104','40','0'),
('108','39','4'),
('57','47','0'),
('116','39','1'),
('106','49','3')

IF OBJECT_ID('Reklamacje', 'U') IS NOT NULL
INSERT INTO Reklamacje (ID,Rozmiar,Data_reklamacji,ID_Klienta) VALUES
('1','40','2014-07-08 03:53:24','99'),
('10','41','2014-04-08 03:53:24','97'),
('10','43','2014-02-08 03:53:24','91'),
('10','47','2012-10-29 00:46:56','12'),
('119','38','2013-04-09 19:07:31','55'),
('13','47','2014-11-03 04:01:51','84'),
('22','48','2012-02-01 00:45:03','52'),
('63','46','2012-12-25 17:49:17','77'),
('27','31','2013-11-19 00:52:41','16'),
('113','41','2013-05-07 15:41:02','59'),
('91','33','2012-08-26 02:59:31','76'),
('97','35','2012-04-28 10:07:08','46'),
('67','40','2011-06-30 12:58:01','53'),
('42','48','2014-06-11 09:21:20','73'),
('100','30','2014-12-15 03:49:27','29'),
('60','50','2010-10-14 16:04:32','55'),
('3','32','2012-11-05 09:24:33','33'),
('44','30','2010-06-08 07:39:13','32'),
('53','49','2010-06-29 03:12:14','50'),
('95','39','2015-06-27 19:47:38','53'),
('59','35','2012-03-25 17:22:12','30'),
('71','32','2011-12-06 03:56:31','40'),
('55','37','2011-02-25 11:21:39','48'),
('13','34','2013-02-05 16:47:11','2'),
('14','31','2015-10-10 09:51:07','3'),
('51','42','2012-12-30 14:29:14','50'),
('83','33','2016-01-15 14:05:41','76'),
('110','34','2010-10-03 07:54:24','43'),
('111','43','2010-12-10 10:50:26','7'),
('16','37','2012-02-16 18:02:01','56'),
('20','45','2015-11-02 18:02:18','28'),
('69','36','2012-11-01 02:49:07','83')

IF OBJECT_ID('Sprzedaz', 'U') IS NOT NULL
INSERT INTO Sprzedaz (ID,Rozmiar,Data_sprzedazy,ID_Klienta) VALUES
('1','40','2014-03-08 03:53:24','99'),
('10','47','2012-02-29 00:46:56','12'),
('119','38','2013-02-09 19:07:31','55'),
('13','47','2014-01-03 04:01:51','84'),
('22','48','2012-01-01 00:45:03','52'),
('63','46','2012-11-25 17:49:17','77'),
('27','31','2013-10-19 00:52:41','16'),
('113','41','2013-04-07 15:41:02','59'),
('91','33','2012-06-26 02:59:31','76'),
('97','35','2012-03-28 10:07:08','46'),
('67','40','2011-05-30 12:58:01','53'),
('42','48','2014-04-11 09:21:20','73'),
('100','30','2014-11-15 03:49:27','29'),
('60','50','2010-09-14 16:04:32','55'),
('3','32','2012-10-05 09:24:33','33'),
('44','30','2010-05-08 07:39:13','32'),
('53','49','2010-05-29 03:12:14','50'),
('95','39','2015-04-27 19:47:38','53'),
('59','35','2012-02-25 17:22:12','30'),
('71','32','2011-11-06 03:56:31','40'),
('55','37','2011-02-22 11:21:39','48'),
('13','34','2013-02-01 16:47:11','2'),
('14','31','2015-09-10 09:51:07','3'),
('51','42','2012-11-30 14:29:14','50'),
('83','33','2016-01-14 14:05:41','76'),
('110','34','2010-10-02 07:54:24','43'),
('111','43','2010-11-10 10:50:26','7'),
('16','37','2012-01-16 18:02:01','56'),
('20','45','2015-11-01 18:02:18','28'),
('69','36','2012-08-01 02:49:07','83'),
('48','35','2012-01-28 04:38:32','87'),
('89','40','2012-02-13 09:15:02','3'),
('19','39','2012-07-05 21:57:30','3'),
('33','39','2011-10-06 11:39:46','13'),
('75','43','2011-09-15 11:41:18','82'),
('20','43','2012-09-11 14:30:32','67'),
('100','33','2010-05-26 06:20:10','38'),
('70','32','2010-05-20 20:20:46','55'),
('107','38','2014-11-23 03:03:55','14'),
('91','33','2011-07-13 11:33:43','33'),
('1','45','2013-07-27 22:17:49','9'),
('76','50','2013-07-07 11:20:34','36'),
('22','48','2014-02-19 17:25:31','80'),
('108','35','2012-03-05 20:02:17','71'),
('71','45','2013-04-29 13:20:00','30'),
('89','45','2010-12-01 02:26:35','87'),
('91','49','2014-07-10 04:48:53','85'),
('113','39','2012-06-21 06:19:05','16'),
('25','50','2013-03-18 13:48:43','27'),
('2','47','2013-12-17 10:44:55','56'),
('64','30','2013-01-20 00:08:20','93'),
('37','31','2014-08-30 05:30:36','98'),
('54','41','2010-06-30 15:37:23','31'),
('91','35','2014-11-23 19:40:04','52'),
('105','46','2014-02-05 18:31:55','25'),
('42','37','2011-07-24 17:32:00','38'),
('1','43','2014-04-03 22:46:38','41'),
('117','49','2013-06-18 09:37:05','63'),
('66','41','2011-09-21 05:10:08','53'),
('54','37','2010-11-27 12:12:59','47'),
('38','30','2013-07-10 18:18:32','95'),
('50','35','2015-02-07 01:08:02','45'),
('110','40','2013-02-27 21:15:12','83'),
('103','33','2012-02-09 01:10:31','60'),
('74','34','2010-09-16 02:03:05','22'),
('3','34','2012-10-01 03:24:28','77'),
('88','36','2011-01-25 11:20:00','1'),
('66','36','2010-08-08 05:11:48','37'),
('103','36','2013-02-05 23:49:07','42'),
('56','41','2011-10-20 15:27:51','22'),
('107','47','2012-05-11 23:21:06','88'),
('35','36','2011-12-17 21:14:08','45'),
('103','31','2010-12-31 15:53:45','39'),
('117','41','2012-05-17 17:14:30','81'),
('35','30','2013-09-21 22:29:58','53'),
('110','47','2013-11-26 19:55:01','6'),
('3','31','2012-07-14 16:10:05','5'),
('62','38','2011-11-11 15:47:53','34'),
('17','47','2014-10-31 06:56:07','47'),
('50','46','2014-11-25 20:07:22','51'),
('24','31','2013-11-24 03:33:18','96'),
('38','44','2012-08-04 20:17:34','13'),
('43','33','2014-11-20 00:41:30','51'),
('80','38','2012-06-08 15:35:37','95'),
('21','32','2011-04-03 20:27:43','15'),
('30','43','2014-05-21 15:19:33','69'),
('6','35','2015-02-25 07:18:13','69'),
('63','41','2012-10-03 20:42:16','11'),
('41','40','2013-06-10 15:40:23','33'),
('117','38','2014-05-20 17:26:10','50')



--PROCEDURY

--WSZYSTKIE TRANSAKCJE
IF OBJECT_ID ('SPRZEDAZE' , 'P' ) IS NOT NULL
DROP PROC SPRZEDAZE
GO
CREATE PROC SPRZEDAZE AS
BEGIN
	SELECT COUNT(ID_Klienta) as Ilosc_zakup�w, ID_Klienta
	FROM Sprzedaz
	GROUP BY ID_Klienta
END	

--NAJLEPSZYCH 10 KUPCOW
IF OBJECT_ID ('TOP_10_BUYER' , 'P' ) IS NOT NULL
DROP PROC TOP_10_BUYER
GO
CREATE PROC TOP_10_BUYER AS
BEGIN
	IF OBJECT_ID( 'Sprzedaz', 'U') IS NULL
		PRINT 'Brak tabeli sprzedaz';
	ELSE
	BEGIN
		SELECT TOP 10 COUNT(w.ID_Klienta) AS Ilosc_zakupow, p.Imie, p.Nazwisko
		FROM Sprzedaz w
		INNER JOIN Klienci AS p ON p.ID_Klienta = w.ID_Klienta
		GROUP BY p.Imie, p.Nazwisko, w.ID_Klienta
		ORDER BY Ilosc_zakupow DESC;
	END
END
GO


--INFORMACJE O KLIENCIE (argument ID)
IF OBJECT_ID ('INFO_KLIENT' , 'P' ) IS NOT NULL
DROP PROC INFO_KLIENT
GO
CREATE PROC INFO_KLIENT @ID INT
 AS
BEGIN
	SELECT * FROM Klienci
	WHERE ID_Klienta = @ID
END	

--WSZYSTKIE TRANSAKCJE KTORYCH KLIENCI POCHODZA Z PODANEGO JAKO ARGUMENT MIASTA
IF OBJECT_ID ('SELL_CITY' , 'P' ) IS NOT NULL
DROP PROC SELL_CITY
GO
CREATE PROC SELL_CITY @City VARCHAR(80)
 AS
BEGIN
	SELECT * FROM Sprzedaz w
		INNER JOIN Klienci AS p ON p.ID_Klienta = w.ID_Klienta
		WHERE p.Miasto = @City
END	