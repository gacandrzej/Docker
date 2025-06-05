CREATE TABLE IF NOT EXISTS towary (
    id_towaru INT PRIMARY KEY AUTO_INCREMENT,
    nazwa VARCHAR(100) NOT NULL,
    opis TEXT,
    cena_jednostkowa DOUBLE,
    ilosc_dostepna INT,
    data_dodania DATE
);

INSERT INTO `towary` (`id_towaru`, `nazwa`, `opis`, `cena_jednostkowa`, `ilosc_dostepna`, `data_dodania`) VALUES
(1, 'Laptop Lenovo ThinkPad X1 Carbon', 'Wydajny laptop biznesowy z ekranem 14 cali', 5500.00, 15, '2025-04-15 06:38:48'),
(2, 'Mysz Logitech MX Master 3S', 'Ergonomiczna mysz bezprzewodowa', 320.00, 50, '2025-04-15 06:38:48'),
(3, 'Monitor Dell UltraSharp U2723QE', 'Monitor 27 cali 4K USB-C Hub', 1800.00, 25, '2025-04-15 06:38:48'),
(4, 'Klawiatura Mechaniczna Corsair K70 RGB MK.2', 'Gamingowa klawiatura mechaniczna z podświetleniem RGB', 650.00, 30, '2025-04-15 06:38:48'),
(5, 'Słuchawki Bezprzewodowe Sony WH-1000XM5', 'Redukcja szumów, wysoka jakość dźwięku', 1400.00, 40, '2025-04-15 06:38:48'),
(6, 'Dysk SSD Samsung 980 PRO 1TB NVMe', 'Szybki dysk SSD PCIe 4.0', 450.00, 60, '2025-04-15 06:38:48'),
(7, 'Smartfon Apple iPhone 15 Pro Max 256GB', 'Najnowszy flagowy smartfon Apple', 6800.00, 10, '2025-04-15 06:38:48'),
(8, 'Tablet Samsung Galaxy Tab S9+ Wi-Fi', 'Wydajny tablet z rysikiem S Pen', 3500.00, 20, '2025-04-15 06:38:48'),
(9, 'Drukarka Laserowa Brother HL-L2350DW', 'Czarno-biała drukarka laserowa z Wi-Fi', 400.00, 35, '2025-04-15 06:38:48'),
(10, 'Router Bezprzewodowy TP-Link Archer AX55', 'Router Wi-Fi 6 Dual-Band', 280.00, 45, '2025-04-15 06:38:48'),
(11, 'Kamera Internetowa Logitech C920s HD Pro', 'Kamera internetowa Full HD 1080p', 220.00, 55, '2025-04-15 06:38:48'),
(12, 'Głośniki Komputerowe Logitech Z407 Bluetooth', 'Głośniki 2.1 z subwooferem i Bluetooth', 300.00, 30, '2025-04-15 06:38:48'),
(13, 'Pendrive SanDisk Ultra Flair 64GB USB 3.0', 'Szybki pendrive USB 3.0', 50.00, 100, '2025-04-15 06:38:48'),
(14, 'Torba na Laptopa Targus CityLite Pro 15.6\"', 'Profesjonalna torba na laptopa', 180.00, 65, '2025-04-15 06:38:48'),
(15, 'Kabel HDMI 2.1 o długości 2m', 'Kabel HDMI 8K Ultra High Speed', 40.00, 80, '2025-04-15 06:38:48'),
(16, 'fsdfsdfdsfs', 'nowa', 99.00, 555, '2025-04-15 07:40:39');
