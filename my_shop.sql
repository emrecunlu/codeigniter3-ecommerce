-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 03 Ara 2021, 18:10:58
-- Sunucu sürümü: 10.4.22-MariaDB
-- PHP Sürümü: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `my_shop`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'Elektronik'),
(2, 'Moda'),
(3, 'Ev, Yaşam, Kırtasiye, Ofis'),
(4, 'Oto, Bahçe, Yapı Market'),
(5, 'Anne, Bebek, Oyuncak'),
(6, 'Spor, Outdoor'),
(7, 'Kozmetik, Kişisel Bakım'),
(8, 'Süpermarket, Pet Shop'),
(9, 'Kitap, Müzik, Film, Hobi');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(524) NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_entry_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `product_url` varchar(524) NOT NULL,
  `is_live` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_price`, `category_id`, `product_image`, `product_entry_date`, `product_url`, `is_live`) VALUES
(1, 'Casper Excalibur G900.1180-BF60X-B Intel Core I7 11800H 16GB 1 TB SSD RTX3060 Freedos 15.6\" FHD Taşınabilir Bilgisayar\r\n', '15998.00', 1, '110000048412269.jpg', '2021-12-03 16:20:07', 'casper-excalibur-g9001180-bf60x-b-intel-core-i7-11800h-16gb-1-tb-ssd-rtx3060-freedos-156-fhd-tasinabilir-bilgisayar', 1),
(2, 'Koton Pamuklu Oversize T-Shirt\r\n', '48.99', 2, '110000040878751.jpg', '2021-12-03 16:24:03', 'koton-pamuklu-oversize-t-shirt', 1),
(3, 'Lassa 185/65 R15 88T Snoways 4 Oto Kış Lastiği ( Üretim Yılı: 2021 )\r\n', '552.00', 4, '9937448075314.jpg', '2021-12-03 16:25:59', 'lassa-18565-r15-88t-snoways-4-oto-kis-lastigi-uretim-yili-2021', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_images`
--

CREATE TABLE `product_images` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `product_images`
--

INSERT INTO `product_images` (`image_id`, `product_id`, `image_path`) VALUES
(1, 1, '110000048412270.jpg'),
(2, 1, '110000048412271.jpg'),
(3, 1, '110000048412272.jpg'),
(4, 1, '110000048412272.jpg'),
(5, 1, '110000048412277.jpg'),
(6, 2, '110000040878548.jpg'),
(7, 2, '110000040878750.jpg'),
(8, 2, '110000040878752.jpg');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_options`
--

CREATE TABLE `product_options` (
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `product_options`
--

INSERT INTO `product_options` (`option_id`, `product_id`, `option_value`) VALUES
(1, 2, 'XS'),
(2, 2, 'S'),
(3, 2, 'M'),
(4, 2, 'L'),
(5, 2, 'XL');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_register_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Tablo için indeksler `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Tablo için indeksler `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`image_id`);

--
-- Tablo için indeksler `product_options`
--
ALTER TABLE `product_options`
  ADD PRIMARY KEY (`option_id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `product_images`
--
ALTER TABLE `product_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `product_options`
--
ALTER TABLE `product_options`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
