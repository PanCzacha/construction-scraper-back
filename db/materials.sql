-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 04 Sty 2023, 22:07
-- Wersja serwera: 10.4.17-MariaDB
-- Wersja PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `materials`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `list`
--

CREATE TABLE `list` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT uuid(),
  `shopId` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shopAddress` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shopName` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `productName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `materialQuantity` decimal(6,2) NOT NULL,
  `materialCost` decimal(6,2) NOT NULL,
  `unit` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `products`
--

CREATE TABLE `products` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT uuid(),
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shopName` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `previousPriceDate` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `previousPrice` decimal(6,2) DEFAULT NULL,
  `currentPrice` decimal(6,2) NOT NULL,
  `updateDate` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `productGroup` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `shops`
--

CREATE TABLE `shops` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lon` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `shops`
--

INSERT INTO `shops` (`id`, `name`, `address`, `lat`, `lon`) VALUES
('00566033-a037-418c-b878-c90314ac6e2a', 'obi', 'Podhalańska 22, 44-335, Jastrzębie-Zdrój', '49.940316', '18.597299'),
('00857450-46f7-4876-8722-143c31b20e40', 'leroymerlin', 'Legnicka 3, 58-500, Jelenia Góra', '50.924307', '15.766847'),
('0451b1a9-9561-4b5f-bfc3-5870ad9b6b2f', 'leroymerlin', 'Krakowska 51, 50-424, Wrocław', '51.089953', '17.063078'),
('053f5f54-656a-48f8-9126-dae8ffe941b5', 'leroymerlin', 'Powstańców Warszawy 6, 39-300, Mielec', '50.285689', '21.460313'),
('07574d4b-2975-4946-8020-e38958718ba2', 'castorama', 'Gen. Fieldorfa Nila 20, 24-100, Puławy', '51.41393', '21.975362'),
('088ea3e8-f2ac-446f-8ab0-d28ee7a7e7a9', 'castorama', 'al. Marszałka Józefa Piłsudskiego 2, 26-110, Skarżysko-Kamienna', '51.117344', '20.864338'),
('0955105d-4637-4f85-bb89-cdf0922241b3', 'castorama', 'Ku Słońcu 67b, 71-047, Szczecin', '53.429502', '14.482764'),
('09ee7ef7-4384-409e-9fa8-a8604a910628', 'leroymerlin', 'Złotnicka 1, 62-002, Złotniki', '50.33571', '21.41081'),
('0a0cbc0c-eec0-4a52-a8f4-65ee70a5ab83', 'obi', 'Kcyńska 27, 81-005, Gdynia', '54.539332', '18.451745'),
('0a3c278f-31c8-413c-9e46-1928901e5688', 'obi', 'Towarowa 2B, 43-100, Tychy', '50.096584', '19.011148'),
('0b239810-1df2-4ea0-a670-2a3bab993598', 'leroymerlin', 'Przemysłowa 39, 34-120, Andrychów', '49.861357', '19.325305'),
('0b2e9368-2530-4d63-ab0d-5bb76e5c2ff4', 'castorama', 'Bolesława Krzywoustego 126a, 51-421, Wrocław', '51.141703', '17.087416'),
('0ba11cfa-293b-4c98-8a8a-47fc81f19425', 'leroymerlin', 'Kiełczowska 1E, 55-095, Mirków', '51.26179', '18.41247'),
('0fe04a88-2e34-4313-a33d-dfd0b2b9bd56', 'obi', 'Radzymińska 166, 03-576, Warszawa', '52.275596', '21.067761'),
('1019b8a0-4506-43bb-8e41-ea5890ada79a', 'leroymerlin', 'al. Jana Pawła II 82, 00-175, Warszawa', '52.237695', '21.005427'),
('11983105-f2ed-4ff4-95be-ca50077987c3', 'leroymerlin', 'Wierzbicka 145, 26-620, Radom', '51.360542', '21.130188'),
('15f2e7e8-6580-4d0f-a632-5278c0d9a78f', 'castorama', 'Pszczyńska 315, 44-100, Gliwice', '50.266898', '18.720163'),
('168cdd0e-2979-4564-b2fb-b2a00ced6ed0', 'leroymerlin', 'Rybnicka 211, 44-122, Gliwice', '50.254684', '18.656512'),
('17ee7c8e-f052-4238-bea0-e40cffc347dd', 'obi', 'Szczecińska 8, 76-251, Kobylnica', '54.453807', '16.970719'),
('18d152ce-d5c8-4c81-85b6-0ef98e24d64b', 'obi', 'Zegrzyńska 9, 05-110, Jabłonna', '52.363495', '20.935526'),
('1a12b523-bfc5-434e-90fc-0dd022a8b054', 'castorama', 'Żwirki i Wigury 88, 87-100, Toruń', '53.028716', '18.606302'),
('1a43b70c-147d-4f7d-a032-4c5c98be5c0d', 'leroymerlin', 'al. Grunwaldzka 309, 80-309, Gdańsk', '54.372781', '18.628385'),
('1b2be717-6138-44bb-9a81-f15882f75e73', 'leroymerlin', 'Krakowska 7, 42-262, Poczesna', '50.732933', '19.160248'),
('1bb1111b-8a5f-41c2-8c7a-feb53c84f61a', 'castorama', 'Szaflarska 176, 34-400, Nowy Targ', '49.465027', '20.021854'),
('1c4d0899-e8f5-46a8-b53a-fd44c42da197', 'obi', 'Cmentarna 2-6, 87-800, Włocławek', '52.642038', '19.074131'),
('1c7601bb-d919-4d6c-9d43-971c7f1447fb', 'obi', 'Stawowa 68, 31-346, Kraków', '50.094824', '19.896112'),
('1ccaccc1-17a8-4ca0-9539-9e27e7608895', 'obi', 'al. Krakowska 102, 02-180, Warszawa', '52.237695', '21.005427'),
('1e1d6118-a3cf-46c9-bf78-d412c8cdc200', 'obi', 'Puławska 427, 02-801, Warszawa', '52.142149', '21.020154'),
('21e161a4-e3a5-4d2c-ae17-7be14a9a362e', 'castorama', 'Dzieci Zamojszczyzny 4, 22-400, Zamość', '50.717412', '23.236778'),
('22b0b7bb-216e-4c24-823c-191fa3f4ef4e', 'castorama', 'Lwowska 17, 37-700, Przemyśl', '49.783662', '22.810039'),
('236dd164-6f27-44af-88ac-d4e7fefd02aa', 'obi', 'al. Generała Władysława Sikorskiego 2b, 10-088, Olsztyn', '53.771028', '20.494758'),
('24afe0de-a045-4ab8-a7ef-073012049e76', 'castorama', 'al. Grunwaldzka 262, 80-314, Gdańsk', '54.372781', '18.628385'),
('252a700d-417d-4c7b-8dee-2f026fc764eb', 'castorama', 'al. Gen. Władysława Sikorskiego 2/6, 91-497, Łódź', '51.760932', '19.460718'),
('2749e04f-c7a8-44a9-b87c-8e58a35803e4', 'leroymerlin', 'Maksymiliana Golisza 10H, 71-682, Szczecin', '53.456908', '14.572083'),
('2b91b87b-8658-4b45-bb08-5eaa645446cb', 'castorama', 'Łukowska 113, 08-110, Siedlce', '52.135446', '22.294921'),
('2bf67c72-43c6-49bd-b6c5-20f317d1c230', 'leroymerlin', 'Bohaterów Monte Cassino 419, 43-300, Bielsko-Biała', '49.831515', '18.986009'),
('2d4593f4-1778-46d9-bca3-2fd1e63e38b0', 'castorama', 'Zblewska 5, 83-200, Starogard Gdański', '53.961589', '18.509735'),
('2d602b3e-d391-491b-b5e9-c0f789293102', 'castorama', 'Broni Pancernej 15, 68-200, Żary', '51.637459', '15.131131'),
('2eeb583e-5b18-47f5-be94-e9c861c1cb53', 'leroymerlin', 'al. Jana Nowaka-Jeziorańskiego 3, 44-102, Gliwice', '50.298586', '18.670967'),
('309f8df2-8a96-4723-8061-a69d05a403bd', 'castorama', 'Zakopiańska 62, 30-418, Kraków', '50.012954', '19.929364'),
('31cf25c1-48d1-427d-8ae6-f0965e0a366c', 'castorama', 'Księcia Józefa Poniatowskiego 10, 67-200, Głogów', '51.646146', '16.093072'),
('3202b388-bd71-47d9-92d7-b3c2488625dc', 'obi', 'al. Bielska 109, 43-100, Tychy', '50.113039', '18.992468'),
('32dea1cb-c5a7-4abe-9a39-331200ba3a97', 'obi', 'Zwycięska 6, 20-555, Lublin', '51.236878', '22.494871'),
('353b6a73-6342-4b56-96fa-4ecdebad0eb7', 'castorama', 'Rejowiecka 179A, 22-100, Chełm', '51.142662', '23.479652'),
('36de34a5-3e32-498c-b553-7ad453f6c580', 'castorama', 'Roberta Schumana 9, 59-220, Legnica', '51.186887', '16.17298'),
('3a1a8b0f-f5e5-42e7-897e-df4ebb208725', 'leroymerlin', 'Głogowska 436, 60-004, Poznań', '52.352001', '16.834352'),
('3ac3951b-f05e-4dfa-968d-5878ce96cea6', 'obi', 'Kaliska 120, 63-400, Ostrów Wielkopolski', '51.656831', '17.846391'),
('3b816fa0-b6ea-4115-b952-df895f04305b', 'leroymerlin', 'Spółdzielców 16, 62-510, Konin', '52.232952', '18.231533'),
('3bf359ed-40a7-4566-8ecb-7b0bedd49df3', 'obi', 'Przywidzka 6, 80-174, Gdańsk', '54.321812', '18.549647'),
('3dcbef02-2439-49b3-9668-c90c9fd9ef7f', 'leroymerlin', 'Szczęśliwa 7, 80-176, Gdańsk', '54.35297', '18.522396'),
('3e47bff9-810f-4973-99a8-90d390e21ce2', 'castorama', 'Ks. Kard. Prym. Stefana Wyszyńskiego 10, 96-100, Skierniewice', '51.97376', '20.145689'),
('3eb425b9-4b7b-4541-9e4e-2516f7080cd0', 'castorama', 'Pałucka 1, 62-200, Gniezno', '52.562243', '17.610729'),
('3f3a5674-3907-4df3-99d8-ea55cdd9f13c', 'obi', 'Rokicińska 192, 92-412, Łódź', '51.754735', '19.582365'),
('4135d26b-b6d1-4159-8662-c4ab3af8e9c4', 'castorama', 'al. Krakowska 75, 02-284, Warszawa', '52.237695', '21.005427'),
('45d01d54-6011-4360-9d02-6f462439e931', 'leroymerlin', 'szosa Lubicka 155, 87-100, Toruń', '53.030623', '18.693563'),
('467fd99f-481c-4be9-8460-fbcebb2e16e6', 'leroymerlin', 'Dobrawy 1, Budzistowo', '54.15982', '15.5817'),
('4683d6c6-75f0-4f2f-95c1-ca621b8d93a8', 'castorama', 'Narodowych Sił Zbrojnych 13, 15-690, Białystok', '53.1489', '23.07836'),
('46af1664-1222-4fad-a696-0e87e57ae54a', 'leroymerlin', 'Pleszewska 1, 61-136, Poznań', '52.397991', '16.954374'),
('46c26252-1e98-4ea0-a43b-3d9468a71114', 'castorama', 'al. Wojska Polskiego 19, 65-077, Zielona Góra', '51.938153', '15.508006'),
('47c27d07-9d63-4e3a-a856-012e958a3a4e', 'leroymerlin', 'Słowiańska 70, 66-400, Gorzów Wielkopolski', '52.738889', '15.201038'),
('483ea5ea-68d8-41ee-8daf-0550463a281b', 'obi', 'Chorzowska 86, 41-910, Bytom', '50.321234', '18.942892'),
('4a0ba9c8-71f1-4d23-85b8-008daa0959f5', 'leroymerlin', 'Malborska 35, 03-286, Warszawa', '52.303272', '21.077039'),
('4affcd21-4d94-45fe-8b0b-4ebae891a5d3', 'leroymerlin', 'Trasa Ks. Jerzego Popiełuszki 2, 09-410, Płock', '52.537065', '19.739197'),
('4cf92cff-8f57-43c3-a868-3719a51d5999', 'obi', 'Budowlanych 5, 45-005, Opole', '50.676975', '17.91561'),
('4eda6dc8-7059-4d8d-9dd8-c5f791dbdc54', 'castorama', 'Konstytucji 3 Maja 12, 64-100, Leszno', '51.835578', '16.522661'),
('4eee281d-9204-4040-8e44-c4a2deb32632', 'castorama', 'Bukowa 4, 41-700, Ruda Śląska', '50.283639', '18.853232'),
('4f50c1a9-e817-469c-95cd-4d13a7ed641c', 'castorama', 'Jeleniogórska 77, 59-900, Łagów', '51.15', '15.33333'),
('4f6061ca-ef53-4c81-a1c5-f05616be9960', 'leroymerlin', 'Dęblińska 20a, 24-100, Puławy', '51.435013', '21.950127'),
('5234b94f-754d-4fe9-a8ca-09efaac4a6a5', 'castorama', 'Wrzosowa 42, 25-211, Kielce', '50.844866', '20.630883'),
('53a0de07-5fea-48c2-9b3a-cb17643bdad9', 'obi', 'Szwedzka 2, 61-285, Poznań', '52.379797', '16.981478'),
('53df2a10-4227-4ce4-a7e6-56a2f5eb7761', 'castorama', 'Wydawnicza 13, 92-333, Łódź', '51.765617', '19.492657'),
('55cab1fd-93b5-465f-b802-4d6ef109a6e1', 'castorama', 'Jana Długosza 82, 41-219, Sosnowiec', '50.310528', '19.182558'),
('561c95dc-9d15-420c-80f2-869a6cc99b1f', 'leroymerlin', 'Puławska 46, 05-500, Piaseczno', '52.093464', '21.021001'),
('5786f1df-8400-4e7a-8ef3-21dd85a0dbfe', 'castorama', 'Wojska Polskiego 96, 72-600, Świnoujście', '53.921381', '14.22111'),
('594f0f9c-b390-4ecb-b736-661a765a013c', 'leroymerlin', 'Andrzeja Struga 31, 70-784, Szczecin', '53.384548', '14.669349'),
('59c15d34-de29-4976-8a0a-0ef1f015324e', 'obi', 'Armii Krajowej 35, 16-400, Suwałki', '54.128786', '22.942739'),
('5a02c5bd-6044-41e6-8a3a-5be38479be58', 'obi', 'Handlowa 1, 38-430, Miejsce Piastowe', '49.64435', '21.786592'),
('5a82e0c9-2bf4-49d5-b7da-e59b008f460d', 'castorama', 'Stargardzka 1b, 73-110, Lipnik', '49.526724', '17.585728'),
('5b963de0-9eab-4b10-8d24-c89841d08f94', 'castorama', 'Walentego Roździeńskiego 198, 40-315, Katowice', '50.260489', '19.015859'),
('5c5836b9-f5bf-4dce-b936-573727c43e4f', 'castorama', 'Konarskiego 47, 86-300, Grudziądz', '53.468396', '18.754387'),
('5dc7d2ed-c956-44dd-bc5e-9d3c6a01d297', 'castorama', 'Grochowska 21, 04-186, Warszawa', '52.237218', '21.118098'),
('5e945d1b-3409-4dfa-8efa-5a11d5deaa09', 'obi', 'szosa Lubicka 130, 87-100, Toruń', '53.023966', '18.669907'),
('5eba98d8-06fb-4b4d-9e49-21de60d95a7f', 'castorama', 'Ignacego Jana Paderewskiego 2, 75-736, Koszalin', '54.175746', '16.202767'),
('5ec120b2-0c8a-4342-8382-3a0a84f6ce3b', 'castorama', 'Nowodąbrowska 127, 33-100, Tarnów', '50.029534', '21.002921'),
('5f584e56-1f01-4310-ac4b-75aede968446', 'castorama', 'Warszawska 63b, 05-300, Stojadła', '52.18622', '21.53383'),
('5f7e3649-1167-4356-9925-7807e4d31a71', 'obi', 'Będzińska 80, 41-250, Czeladź', '50.319183', '19.104305'),
('60279aaf-f493-422b-a4f7-7c6bc3764aa0', 'castorama', 'Graniczna 80, 43-400, Cieszyn', '49.765059', '18.624809'),
('60654c0e-1f5f-403f-96b3-aae517d2ed6d', 'leroymerlin', 'Św. Antoniego 6, 62-080, Swadzim', '52.44115', '16.75501'),
('621a4a43-fd7e-4d19-af1c-9dc9f721fd7e', 'leroymerlin', 'Pabianicka 245, 93-457, Łódź', '51.704693', '19.417834'),
('622cb653-e1a4-48f7-bccf-8340f4d7eb8e', 'obi', 'Jana III Sobieskiego 6a, 41-300, Dąbrowa Górnicza', '50.328281', '19.179454'),
('62bdcd85-98fc-4b50-9f43-e2cc16089046', 'obi', 'Józefa Mireckiego 14, 26-600, Radom', '51.407332', '21.142289'),
('632d01f0-6da8-4543-a078-63d7592580e3', 'castorama', 'Grunwaldzka 5, 84-230, Rumia', '54.571409', '18.385166'),
('6385fa8b-132c-44e0-ac22-2f194c50ad3e', 'leroymerlin', 'Spółdzielczości Pracy 32, 20-147, Lublin', '51.254776', '22.876588'),
('684c97e5-2fb1-497f-8617-3020d6e98a2e', 'castorama', 'Hubalczyków 2, 76-200, Słupsk', '54.459253', '17.058295'),
('6a5d863e-2c1b-457a-99d1-949f15683c98', 'leroymerlin', 'Modlińska 8, 03-216, Warszawa', '52.294807', '21.000116'),
('6a964db6-9ea0-435d-aca0-0135e234b1e0', 'leroymerlin', 'Zuzanny 26, 41-219, Sosnowiec', '50.302713', '19.16592'),
('6d1cceda-27e1-409a-be01-318a1d005794', 'leroymerlin', 'Graniczna 4, 54-610, Wrocław', '51.1087', '16.938893'),
('6d4e95ae-f376-43a1-a9e2-357a1bed5588', 'leroymerlin', 'Jana Karskiego 5, 91-071, Łódź', '51.779619', '19.443653'),
('6e4bf384-fb3f-42dd-8860-e56fe80e7dfa', 'castorama', 'Górczewska 124, 01-460, Warszawa', '52.241369', '20.930118'),
('6e643230-d1c2-49b3-a218-dbdce2041edb', 'obi', 'Gen. Leopolda Okulickiego 16/18, 42-218, Częstochowa', '50.808379', '19.119375'),
('6f605662-463e-45e6-bb20-8cdfd03c739b', 'leroymerlin', 'Nowowiczlińska 35, 81-577, Gdynia', '54.4735', '18.4749'),
('6faf649d-419a-4f23-9449-794f6191af70', 'leroymerlin', 'Jeleniogórska 38, 59-900, Zgorzelec', '51.158263', '15.036138'),
('70031121-b786-4e21-b853-20351d71acbf', 'obi', 'Strzelców Bytomskich 96, 41-914, Bytom', '50.37914', '18.89186'),
('7007db8d-6281-4e68-a5f9-000456ac6fb3', 'leroymerlin', 'Mszczonowska 3, 05-090, Janki', '51.10131', '19.07571'),
('7245dc5a-1e5c-4e22-b1be-dd4dbc755f7d', 'leroymerlin', 'Produkcyjna 86, 15-680, Białystok', '53.161376', '23.094214'),
('725c0776-f8f5-4570-8750-1adbb368c0aa', 'obi', 'Rolna 4, 40-555, Katowice', '50.230046', '18.993124'),
('72bec71a-79e9-4649-b055-6a5b6fde4110', 'castorama', 'Henryka Wieniawskiego 21, 58-306, Wałbrzych', '50.820563', '16.288565'),
('72cc552d-2116-4198-8ed4-38c316e30a92', 'leroymerlin', '500-lecia Piły 5, 64-920, Piła', '53.160328', '16.75109'),
('733ba225-e12e-4229-b7ce-c802f3ff3321', 'leroymerlin', 'al. Karkonoska 85, 53-015, Wrocław', '51.097349', '17.023978'),
('73eec60b-4e4b-4a01-80d2-a7f24d3559dc', 'castorama', 'Żuławska 25, 82-300, Elbląg', '54.150724', '19.38716'),
('73fe056c-afb9-4173-aa6e-cbd987c69c90', 'castorama', 'Jana Pawła II 2, Częstochowa', '50.808379', '19.119375'),
('76ad21fa-8921-4346-a161-4a5a2de319fc', 'castorama', 'Powstańców Warszawy 13, 35-329, Rzeszów', '50.019122', '22.012839'),
('7786596c-20b2-485b-822d-eea52b947ba7', 'castorama', 'Mełgiewska 16 c, 20-234, Lublin', '51.247149', '22.616241'),
('78a0a804-2772-462f-96ee-2d0269e30603', 'obi', 'Czekoladowa 5, 55-040, Bielany Wrocławskie', '51.048947', '16.956869'),
('7910bcc2-b755-4fc9-86d5-a7d273cd3ad9', 'castorama', 'Księcia Adama Czartoryskiego 1, 66-400, Gorzów Wielkopolski', '52.75979', '15.245191'),
('79f50ee6-be2a-45b0-95c5-fa514e4c44d4', 'obi', 'Kołobrzeska 26, 80-394, Gdańsk', '54.401491', '18.583165'),
('7bd46d08-2db8-499d-9f44-21560a4d2530', 'leroymerlin', 'Poznańska 4a, 62-020, Swarzędz', '52.404884', '17.091696'),
('7bd6f858-029b-4dec-a628-dac23a914df7', 'leroymerlin', 'Liburnia 10, 43-400, Cieszyn', '49.752644', '18.634964'),
('7d6a1816-b3e4-41a1-8a42-ddefc75e2b9d', 'castorama', 'Legnicka 58, 54-204, Wrocław', '51.120282', '16.991741'),
('7f6d36ba-b127-41ac-a449-ad9a7cd21a29', 'obi', 'Wyszogrodzka 142, 09-400, Płock', '52.53577', '19.754726'),
('806e18a2-9745-4794-82fe-750a3737505c', 'castorama', 'Wiosenna 80, 70-807, Szczecin', '53.386235', '14.659246'),
('80848793-d502-4a90-80c2-3e57d1461986', 'leroymerlin', 'Alpejska 4, 40-028, Katowice', '50.242711', '19.032442'),
('80e61936-16d7-423a-b30b-e47891d91621', 'obi', 'Zagnańska 67, 25-558, Kielce', '50.889658', '20.627051'),
('81b9cb72-425d-49c5-bb2d-0eaab3278fce', 'castorama', 'Węgierska 94, 33-300, Nowy Sącz', '49.596563', '20.682542'),
('81edc479-b84d-438c-a558-6242aa0a8a10', 'castorama', 'Szubińska 5, 85-312, Bydgoszcz', '53.119913', '17.984058'),
('82491b50-ac12-4762-887b-504f694b28f0', 'castorama', 'Walerego Wróblewskiego 31, 93-566, Łódź', '51.746945', '19.438464'),
('83704af7-f819-4db7-948d-f4df9a209d88', 'obi', 'Stefana Kisielewskiego 8/16, 42-200, Częstochowa', '50.837229', '19.116236'),
('8629cd08-adbb-48cd-a6be-373d3e88d158', 'leroymerlin', 'Toruńska 101, 85-817, Bydgoszcz', '53.11772', '18.03572'),
('8643cc9c-7176-451f-bd62-b1c645e50719', 'obi', 'Płk. Władysława Beliny-Prażmowskiego 7, 33-300, Nowy Sącz', '49.609222', '20.704141'),
('864db91d-d55e-4811-8901-72272f9d76ce', 'castorama', 'Stefana Grota Roweckiego 8a, 95-200, Pabianice', '51.697151', '19.300774'),
('8b3323f3-af4f-4089-9c92-d3680eeff460', 'leroymerlin', 'Ostrobramska 73b, 04-175, Warszawa', '52.23267', '21.111279'),
('8bf6b0d9-d7a9-4ad2-864a-981dc0179b2f', 'castorama', 'Popularna 71, 02-473, Warszawa', '52.203075', '20.934178'),
('8c97b8c6-4ac2-4cd6-be8f-03af805b29f6', 'leroymerlin', 'Hetmańska 18, 15-727, Białystok', '53.136844', '23.116439'),
('8db6580e-80a0-471a-9d3d-5865d2656dee', 'leroymerlin', 'Stefana Batorego 172, 65-735, Zielona Góra', '51.965312', '15.488611'),
('8dd71e06-73fc-456e-ad55-da8dbee3de25', 'leroymerlin', 'Gen. Władysława Sikorskiego 22, 58-100, Świdnica', '50.843076', '16.482852'),
('91a3f923-88df-4f07-95f5-167d4f29e242', 'leroymerlin', 'Mariana Rejewskiego 5, 85-791, Bydgoszcz', '53.139091', '18.107263'),
('92bc4501-a43b-49f4-bad3-28ad21cb68e7', 'castorama', 'Stefana Żeromskiego 13, 27-400, Ostrowiec Świętokrzyski', '50.940804', '21.370014'),
('93fac295-18e3-45d5-b883-acda603f8987', 'leroymerlin', 'Wrocławska 152, 45-835, Opole', '50.681134', '17.884842'),
('96e39303-da08-46fc-b649-2f68d02e5560', 'castorama', 'Jana Pawła II 11, 58-506, Jelenia Góra', '50.800846', '15.747776'),
('975ae992-bb1a-4b11-ad11-216ba717a0d1', 'leroymerlin', 'Geodetów 2b, 05-200, Wołomin', '52.35599', '21.256828'),
('9808d87a-feb8-43a9-bd05-69a67f241ed9', 'castorama', 'Energetyków 1, 26-613, Radom', '51.42267', '21.179975'),
('9ac21e05-17ed-43eb-a214-b2fd950eef7e', 'castorama', 'Sosnowiecka 147, 31-345, Kraków', '50.090742', '19.902746'),
('9b218fe0-a804-47cb-a712-b186dc290662', 'obi', 'Długa 1, 58-309, Wałbrzych', '50.809083', '16.293262'),
('9bab9f9f-c6ae-4888-9e08-206c1b9e7d85', 'castorama', 'Kapitulna 41, 87-800, Włocławek', '52.652181', '19.047843'),
('9cd653d3-bcb7-4a93-b026-e73bfa9b8289', 'obi', 'Józefa Grzecznarowskiego 28, 26-604, Radom', '51.389567', '21.027829'),
('9dded39a-7384-4544-b0bc-10162736eea7', 'leroymerlin', 'Marsa 56c, 04-242, Warszawa', '52.240927', '21.139009'),
('9f9a495a-4066-4ab0-bc00-11723b319f40', 'leroymerlin', 'Johna Baildona 60, 40-115, Katowice', '50.268497', '18.997474'),
('a041200d-458e-425d-84b1-3e2a3a725dce', 'castorama', 'Zatorska 1, 32-600, Oświęcim', '50.023377', '19.231542'),
('a0e7cbe3-fa0d-4fe8-8bb3-a5205a2e72c9', 'obi', 'Józefa Zwierzyckiego 1, 59-300, Lubin', '51.404953', '16.199386'),
('a249663c-06dd-4a17-8c2a-f880ab5f6bfc', 'leroymerlin', 'Pojezierska 93, 91-341, Łódź', '51.800726', '19.421842'),
('a2edd510-8294-4ecc-91b3-32d3c057a413', 'obi', 'Poznańska 5, 64-100, Leszno', '51.860615', '16.573268'),
('a376bdfb-cd53-45e7-907a-82153cf973ae', 'obi', 'Henryka Wieniawskiego 1/3, 93-564, Łódź', '52.2369716', '19.3724571'),
('a50f8e76-fed3-4c74-9e99-8d2b0db16db2', 'castorama', 'Przemysłowa 2b, 37-450, Stalowa Wola', '50.571434', '22.041797'),
('a58f2719-ea3e-4621-8f80-2322440693dc', 'obi', 'Sulejowska 51, 97-300, Piotrków Trybunalski', '51.40528', '19.72301'),
('a6103866-1b63-48e0-93c8-7a538a272f3e', 'castorama', 'Pilotów 6, 31-462, Kraków', '50.079705', '19.971624'),
('a708a71e-4833-4b0c-97ea-5a2a6de6a7bc', 'castorama', 'Warszawska 186, 43-300, Bielsko-Biała', '49.848006', '19.035162'),
('a810d9d2-b8a8-4a62-9fd9-d9122d7e4ba6', 'leroymerlin', 'Wincentego Witosa 32, 20-315, Lublin', '51.231005', '22.612586'),
('a8aed74b-4b4d-4ed9-b9e5-3b0e40d046eb', 'obi', 'Podmiejska 2b, 89-620, Lipienice', '51.24638', '20.96534'),
('a9354a60-701b-493d-b145-cb69f3eb325e', 'obi', 'Gen. Augusta Emila Fieldorfa Nila 32, 07-410, Ostrołęka', '53.074494', '21.57988'),
('aa32cf1b-cb25-49d8-8690-91216673a685', 'castorama', 'Zjednoczonej Europy 26, 44-244, Żory', '50.036512', '18.688635'),
('aa6b9b92-dd77-4f05-a933-05cc362048cc', 'castorama', 'Towarowa 2, 43-100, Tychy', '50.096584', '19.011148'),
('aabc4d0c-8527-4ce4-82b8-63238a79ebc4', 'obi', 'Gen. Tadeusza Bora-Komorowskiego 31, 31-876, Kraków', '50.052652', '19.987345'),
('aef101bd-ffe7-4f3e-bd4d-188faed85bbd', 'obi', 'Wójtówka 2a, 96-500, Sochaczew', '52.224079', '20.268246'),
('af3201ca-f716-444a-b6ba-2998b34a58d4', 'leroymerlin', 'Ustowo 49, 70-001, Ustowo', '42.83333', '27.16667'),
('b1631c11-248f-4136-b479-aac7cfebe8a0', 'obi', 'Plutonowego Ryszarda Szkubacza 1, 41-800, Zabrze', '50.317976', '18.7508'),
('b2309bf5-fedb-40f4-ab1a-656a3b12f01c', 'castorama', 'Henryka Sienkiewicza 23, 62-020, Swarzędz', '52.405614', '17.068156'),
('b2594449-d031-4f24-a30f-f73102875cb6', 'leroymerlin', 'Akademijna 51, 05-110, Jabłonna', '52.382543', '20.924981'),
('b379d7c2-6734-4659-a608-fa879cd9334f', 'leroymerlin', 'Wojska Polskiego 16, 88-100, Inowrocław', '52.785437', '18.242251'),
('b476c4a9-64a8-4411-b2d8-f820cc5d75a1', 'leroymerlin', 'Armii Krajowej 9, 97-400, Bełchatów', '51.350644', '19.378204'),
('b4aa5a6e-48b9-48b1-afc2-ee687f49c13c', 'leroymerlin', 'Kościuszki 71, 99-300, Kutno', '52.242548', '19.372701'),
('b62e3583-310d-4d02-bc5f-ed6648e2f91d', 'leroymerlin', 'Grunwaldzka 108, 84-230, Rumia', '54.586568', '18.371089'),
('b8a43ff3-0a07-4a59-999a-c5292acd9da1', 'leroymerlin', 'Juliana Tuwima 25, 10-747, Olsztyn', '53.756381', '20.483961'),
('b9572b15-1f96-481e-be5a-0544a4270773', 'castorama', 'Walerego Sławka 1, 30-633, Kraków', '50.027869', '19.960044'),
('b977aa77-13f8-4714-a0cd-7090e260de0e', 'castorama', 'Ogrodowa 31, 62-571, Stare Miasto', '52.183898', '18.230373'),
('b9bb6fd3-9fef-454e-82a2-4ddad3d8e0e4', 'obi', 'Żorska 55, 44-203, Rybnik', '50.093286', '18.571597'),
('ba35223f-c36c-49d0-b748-3a651c93a0be', 'leroymerlin', 'Poznańska 121/131, 62-800, Kalisz', '51.765261', '18.062537'),
('bb0a725e-50ae-434d-8a89-d2943f74d5e8', 'castorama', 'Władysławowo 68, 06-406, Opinogóra Górna', '52.880983', '20.660693'),
('bb246e3e-3892-4533-b3c5-c198dfc839e1', 'castorama', 'Graniczna 2a, 54-610, Wrocław', '51.105814', '16.943622'),
('bd3350a8-1efb-446c-878b-0969c461710e', 'castorama', 'Komisji Edukacji Narodowej 1, 59-300, Lubin', '51.404953', '16.199386'),
('bfefaa2c-a41a-4f88-bbe0-b2b2709264eb', 'castorama', 'Rybnicka 95, 47-400, Racibórz', '50.091397', '18.261178'),
('c24016a1-787e-4517-8841-5875622e8216', 'castorama', 'Głębocka 15a, 03-287, Warszawa', '52.303466', '21.05483'),
('c272fe80-bc3d-4595-92b1-675f66f1d7b0', 'castorama', 'Ciepła 2, 19-300, Ełk', '53.813547', '22.379326'),
('c412d2a2-ed05-4540-a795-58ef6dec9484', 'castorama', 'Prałata Czesława Majorka 2, 63-400, Ostrów Wielkopolski', '51.638828', '17.837725'),
('c505a41d-da39-4dc9-9261-ae317ef66dca', 'castorama', 'szosa Bydgoska 102A, 87-100, Toruń', '53.017247', '18.531443'),
('c5157f00-fc15-467d-ba2d-df9e5e2d3e7d', 'leroymerlin', 'Jerozolimskie 244, 02-495, Warszawa', '52.237695', '21.005427'),
('c5ddf960-ab83-41c7-86a2-d60193e8968b', 'leroymerlin', 'Krakowska 22a, 32-020, Wieliczka', '49.99679', '20.03261'),
('c82802bb-1f37-4168-96bc-3611f2e05f49', 'leroymerlin', 'Noworudzka 2a, 57-300, Kłodzko', '50.452106', '16.640773'),
('c86a428c-74d7-49c4-a816-4e23f7829229', 'obi', 'Podkarpacka 4, 35-082, Rzeszów', '50.02065', '21.979281'),
('c8c91cce-997d-45cb-bec6-66756fe6fac7', 'obi', 'Władysława Leonharda 1, 10-454, Olsztyn', '53.780644', '20.513202'),
('d06dd142-8f34-473b-92b5-bd4719b7c96c', 'leroymerlin', 'Henryka Sienkiewicza 1, 98-200, Sieradz', '51.597532', '18.731119'),
('d0bb006e-1c4d-45ac-8bf4-77432ee748ce', 'leroymerlin', 'Błonie 4-14, 33-100, Tarnów', '50.035528', '21.015235'),
('d1371d69-ca1a-4598-b9aa-30b12d52dae0', 'castorama', 'Wiejska 141a, 45-302, Opole', '50.67418', '17.961747'),
('d1aa32e3-f254-49e1-bf16-c54b513f852e', 'castorama', 'Obwiednia Północna 21, 44-200, Rybnik', '50.112343', '18.539675'),
('d3404666-147f-45e5-980a-fafd1b74baa1', 'leroymerlin', 'Objazdowa 6, 59-220, Legnica', '51.187865', '16.164782'),
('d891e36b-fdf9-4ec4-8860-a5bac1e2fc2e', 'leroymerlin', 'Francuska 4, 44-240, Żory', '50.036702', '18.704925'),
('d937dace-ed4d-409e-af8c-ffbc62a76620', 'leroymerlin', 'Gliwicka 28, 43-190, Mikołów', '50.181628', '18.885623'),
('d96ca5f7-4ad4-4ed2-9549-d38274cb6079', 'castorama', 'Haliny Konopackiej 20, 60-002, Poznań', '52.357147', '16.842713'),
('dabe8f2b-95ba-4fa0-bdfa-25f4e1aaa6dc', 'obi', 'Myśliborska 48, 66-400, Gorzów Wielkopolski', '52.739189', '15.197992'),
('db35ca5a-e0e3-41cd-9f6b-5be538951e03', 'obi', 'Radzymińska 303, 05-091, Ząbki', '52.302412', '21.086899'),
('dbb8ad06-f0cd-4220-8fb5-2a02601e1065', 'castorama', 'Jana Nowaka-Jeziorańskiego 27, 41-923, Bytom', '50.391424', '18.899081'),
('e3fa13cf-74b3-43c6-9ff8-9c6a48be4748', 'castorama', 'Karola Szajnochy 1, 85-738, Bydgoszcz', '53.125574', '18.061361'),
('e4933235-36cf-4e65-879f-14aba8b4ecca', 'castorama', 'Czekoladowa 3, 55-040, Wrocław', '51.050646', '16.964637'),
('e49813e2-6dc4-46c2-9641-4d5805e61896', 'leroymerlin', 'Bieszczadzka 33, 38-400, Krosno', '49.674192', '21.775363'),
('e83af985-d5fe-4d2e-a927-08249ab5204f', 'castorama', 'Sportowa 31, 41-500, Chorzów', '50.278343', '18.957133'),
('e984b04d-3aca-4086-81d4-5d153545eeb8', 'castorama', 'Południowa 21, 71-001, Szczecin', '53.40294', '14.503069'),
('e9c68771-e3e7-49fa-bafd-81facb24a454', 'obi', 'Złota Karczma 26, 44-203, Gdańsk', '54.371857', '18.520202'),
('eade3d84-d8a1-4aa9-9088-a5c88ff0b674', 'castorama', 'Tylna 17-23, 62-800, Kalisz', '51.737491', '18.043453'),
('eb549171-f60b-448e-8d55-b9a651e6ff19', 'obi', 'Szparagowa 3/5, 91-211, Łódź', '51.8029039', '19.3777752'),
('eefa35bf-f1a9-434e-b63b-95b493244232', 'castorama', 'Odyseusza 2, 80-299, Gdańsk', '54.434331', '18.48465'),
('f2b434f8-16e3-4698-8458-470d1bffd395', 'obi', 'Fabryczna 1, 85-741, Bydgoszcz', '53.123569', '18.063868'),
('f4192ab0-16b9-44bc-8dd4-8a501b11313d', 'castorama', 'Armii Krajowej 40, 47-220, Kędzierzyn-Koźle', '50.346181', '18.209176'),
('f48e682f-67b0-4859-b41e-d0df53a02d33', 'castorama', 'Obwodnica 16, 42-600, Tarnowskie Góry', '50.436568', '18.841794'),
('f4a3ae37-ae92-4df3-bf63-0515e63a4c3f', 'castorama', 'Zygmunta Krasińskiego 31, 48-303, Nysa', '50.451137', '17.343644'),
('f5efa3e5-717a-467d-b791-4bdf498dfa94', 'obi', 'Chemiczna 2, 20-329, Lublin', '51.237558', '22.596099'),
('f6fb0862-8e52-416c-92da-e0efd38bbd4b', 'obi', 'Wojciecha Korfantego 13, 41-800, Zabrze', '50.321442', '18.770191'),
('f751ed33-b8e1-4216-9f7b-fcf4a205c695', 'leroymerlin', 'Wincentego Witosa 19, 35-115, Rzeszów', '50.036873', '21.975213'),
('f79d4d5f-b78f-49d4-980a-de6d1624a382', 'leroymerlin', 'Adama Rożańskiego 34, 32-085, Modlniczka', '50.11739', '19.8553'),
('f7b0299a-15a6-493a-b745-8cfcdd7e088e', 'obi', 'Długa 29-35, 53-657, Wrocław', '51.119396', '17.015567'),
('f9a17997-231f-4539-a840-935e63b7a91d', 'leroymerlin', 'Krasne 20a, 36-007, Krasne', '50.039527', '22.075563'),
('f9e62345-0726-4283-a9b1-1b53cf208044', 'castorama', 'Murawa 39, 61-655, Poznań', '52.433626', '16.936496'),
('fb4a3a71-5f24-4a3e-bdc4-c7db5f42c9c9', 'obi', 'Radomska 8, 25-451, Kielce', '50.886686', '20.665385'),
('ff73faac-74aa-4c1f-beee-6daaac700b44', 'obi', 'Brzezińska 27/29, 92-103, Łódź', '51.793465', '19.510466');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
